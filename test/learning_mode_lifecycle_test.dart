import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/widgets/learning_mode_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const channel = MethodChannel('org.nslabs/irtransmitter');
  final captures = <Completer<Object?>>[];
  late Completer<bool> cancellation;
  var cancelCalls = 0;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    captures.clear();
    cancelCalls = 0;
    final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(
      const MethodChannel('org.nslabs/irtransmitter_events'),
      (_) async => null,
    );
    messenger.setMockMethodCallHandler(channel, (call) async {
      switch (call.method) {
        case 'performHaptic':
          return true;
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
          final capture = Completer<Object?>();
          captures.add(capture);
          return capture.future;
        case 'cancelUsbLearning':
          cancelCalls++;
          return cancellation.future;
        default:
          return null;
      }
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  Future<void> showScreen(WidgetTester tester) async {
    cancellation = Completer<bool>();
    tester.view.physicalSize = const Size(1000, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      home: const LearningModeScreen(),
    ));
    await tester.pumpAndSettle();
  }

  Finder startButton() => find.widgetWithText(FilledButton, 'Start listening');
  Finder cancelButton() => find.widgetWithText(OutlinedButton, 'Cancel');

  Future<void> start(WidgetTester tester) async {
    await tester.ensureVisible(startButton());
    expect(tester.widget<FilledButton>(startButton()).onPressed, isNotNull);
    await tester.tap(startButton());
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
  }

  for (final lateError in [false, true]) {
    testWidgets('USB cancel stays busy and ignores stale ${lateError ? 'error' : 'capture'} after restart', (tester) async {
      await showScreen(tester);
      await start(tester);
      expect(captures, hasLength(1));
      expect(tester.widget<OutlinedButton>(cancelButton()).onPressed, isNotNull);
      await tester.tap(cancelButton());
      await tester.pump();
      expect(cancelCalls, 1);
      expect(tester.widget<OutlinedButton>(cancelButton()).onPressed, isNull);
      expect(startButton(), findsNothing);

      cancellation.complete(true);
      await tester.pumpAndSettle();
      await start(tester);
      expect(captures, hasLength(2));
      if (lateError) {
        captures[0].completeError(PlatformException(code: 'LEARN_TIMEOUT', message: 'stale timeout'));
      } else {
        captures[0].complete({
          'family': 'elksmart',
          'frequencyHz': 38000,
          'rawPatternUs': [9000, 4500, 560, 560, 560, 560],
          'opaqueFrameBase64': 'AAAAAAAAAAAAAAAA',
          'displayPreview': 'stale capture',
        });
      }
      await tester.pump();
      expect(cancelButton(), findsOneWidget);
      expect(tester.widget<OutlinedButton>(cancelButton()).onPressed, isNotNull);
      expect(find.textContaining('stale'), findsNothing);
      expect(startButton(), findsNothing);
      captures[1].complete(null);
      await tester.pumpAndSettle();
      expect(startButton(), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('disposing USB listening requests cancellation and ignores result', (tester) async {
    await showScreen(tester);
    await start(tester);
    await tester.pumpWidget(const SizedBox());
    await tester.pump();
    expect(cancelCalls, 1);
    cancellation.complete(true);
    captures.single.complete(null);
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
}
