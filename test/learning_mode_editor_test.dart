import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/learning_mode_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Learning Mode opened from the remote editor (returnButtonMode).
void main() {
  const channel = MethodChannel('org.nslabs/irtransmitter');
  const events = MethodChannel('org.nslabs/irtransmitter_events');
  final captures = <Completer<Object?>>[];
  Completer<Object?>? haptic;

  Map<String, Object?> capture(List<int> pattern) => {
        'family': 'elksmart',
        'frequencyHz': 38000,
        'rawPatternUs': pattern,
        'opaqueFrameBase64': 'AAAAAAAAAAAAAAAA',
        'displayPreview': 'test capture',
      };

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    captures.clear();
    haptic = null;
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(events, (_) async => null);
    messenger.setMockMethodCallHandler(channel, (call) async {
      switch (call.method) {
        case 'performHaptic':
          return haptic?.future ?? true;
        case 'getTransmitterCapabilities':
          return {
            'hasUsb': true,
            'usbOpened': true,
            'usbStatus': 'READY',
            'currentType': 'USB',
            'usbDevices': [
              {
                'vendorId': 0x045c,
                'productId': 0x0134,
                'hasPermission': true,
                'productName': 'Test receiver',
              },
            ],
          };
        case 'getPreferredTransmitterType':
          return 'USB';
        case 'learnUsbSignal':
          final pending = Completer<Object?>();
          captures.add(pending);
          return pending.future;
        case 'cancelUsbLearning':
          return true;
        default:
          return null;
      }
    });
  });

  tearDown(() {
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(channel, null);
    messenger.setMockMethodCallHandler(events, null);
  });

  late AppLocalizations l10n;
  List<IRButton>? returned;
  var pops = 0;

  Future<void> openFromEditor(WidgetTester tester) async {
    returned = null;
    pops = 0;
    tester.view.physicalSize = const Size(1000, 1800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () async {
                returned = await Navigator.of(context).push<List<IRButton>>(
                  MaterialPageRoute<List<IRButton>>(
                    builder: (_) =>
                        const LearningModeScreen(returnButtonMode: true),
                  ),
                );
                pops++;
              },
              child: const Text('Editor'),
            ),
          ),
        ),
      ),
    ));
    await tester.tap(find.text('Editor'));
    await tester.pumpAndSettle();
    l10n = AppLocalizations.of(tester.element(find.byType(LearningModeScreen)))!;
  }

  // Listening runs a repeating pulse animation, so do not wait for it to settle.
  Future<void> pumpFrames(WidgetTester tester) async {
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
  }

  Future<void> learn(WidgetTester tester, List<int> pattern) async {
    if (captures.isEmpty || captures.last.isCompleted) {
      // Find the button by its label: FilledButton.icon is not always a plain
      // FilledButton, so find.widgetWithText(FilledButton, ...) can miss it.
      final start = find.text(l10n.learningModeStartListening);
      await tester.ensureVisible(start);
      await tester.tap(start);
      await pumpFrames(tester);
    }
    captures.last.complete(capture(pattern));
    await pumpFrames(tester);
    expect(find.text(l10n.learningModeAddAndLearnNext), findsOneWidget);
  }

  Future<void> finish(WidgetTester tester) async {
    // Let the snack bars time out so no timer is left pending.
    await tester.pump(const Duration(seconds: 10));
    await tester.pumpAndSettle();
  }

  testWidgets('a double tap on Add button adds one button and pops once',
      (tester) async {
    await openFromEditor(tester);
    await learn(tester, [9000, 4500, 560, 560, 560, 560]);

    final add = find.text(l10n.addButton);
    await tester.tap(add);
    await tester.tap(add, warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(pops, 1);
    expect(returned, hasLength(1));
    expect(find.text('Editor'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await finish(tester);
  });

  testWidgets('Back during Add leaves the editor route intact', (tester) async {
    await openFromEditor(tester);
    await learn(tester, [9000, 4500, 560, 560, 560, 560]);
    final pendingHaptic = haptic = Completer<Object?>();

    await tester.tap(find.text(l10n.addButton));
    await tester.pump();
    await tester.binding.handlePopRoute();
    await tester.pump();
    pendingHaptic.complete(true);
    await tester.pumpAndSettle();

    expect(find.text('Editor'), findsOneWidget);
    expect(pops, 1);
    expect(returned, isNull);
    expect(tester.takeException(), isNull);
    await finish(tester);
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));

  testWidgets('a double tap on Add & learn next collects the capture once',
      (tester) async {
    await openFromEditor(tester);
    await learn(tester, [9000, 4500, 560, 560, 560, 560]);

    final next = find.text(l10n.learningModeAddAndLearnNext);
    await tester.tap(next);
    await tester.tap(next, warnIfMissed: false);
    await pumpFrames(tester);

    // Exactly one new listening request, and the screen is listening again.
    expect(captures, hasLength(2));
    expect(
      find.text(l10n.learningModeAddedLearnNext(
          l10n.learningModeUnnamedCapture, 1)),
      findsOneWidget,
    );

    await learn(tester, [9000, 4500, 560, 1680, 560, 560]);
    await tester.tap(find.text(l10n.addButton));
    await tester.pumpAndSettle();

    expect(pops, 1);
    expect(returned, hasLength(2));
    expect(tester.takeException(), isNull);
    await finish(tester);
  });
}
