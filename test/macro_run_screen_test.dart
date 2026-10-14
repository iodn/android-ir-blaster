import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/macro_run_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const button = IRButton(
  id: 'power',
  image: 'Power',
  isImage: false,
  rawData: '9000 4500 560',
  frequency: 38000,
);
const send = MacroStep(id: 'send', type: MacroStepType.send, buttonId: 'power');
const delay = MacroStep(id: 'delay', type: MacroStepType.delay, delayMs: 1000);
const manual = MacroStep(id: 'manual', type: MacroStepType.manualContinue);

void main() {
  late List<MethodCall> sends;
  Future<Object?> Function(MethodCall)? onSend;
  Future<Object?> Function(MethodCall)? onHaptic;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    sends = [];
    onSend = null;
    onHaptic = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('org.nslabs/irtransmitter'), (call) async {
      if (call.method == 'performHaptic') {
        return onHaptic == null ? true : onHaptic!(call);
      }
      if (call.method.startsWith('transmit')) {
        sends.add(call);
        return onSend == null ? null : onSend!(call);
      }
      return null;
    });
  });

  Future<void> open(WidgetTester tester, List<MacroStep> steps,
      {List<IRButton> buttons = const [button], bool autoStart = false}) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MacroRunScreen(
        macro: TimedMacro(
            id: 'macro', name: 'Test macro', remoteName: 'TV', steps: steps),
        remote: Remote(name: 'TV', buttons: buttons),
        autoStart: autoStart,
      ),
    ));
    await tester.pump();
  }

  Future<void> start(WidgetTester tester) async {
    await tester.tap(find.text('Start Macro'));
    await tester.pump();
  }

  Future<void> cancel(WidgetTester tester) async {
    await tester.tap(find.text('Cancel'));
    await tester.pump();
  }

  testWidgets('send, delay, manual continue and run again execute in order',
      (tester) async {
    await open(tester, [send, delay, manual, send]);
    await start(tester);
    expect(sends, hasLength(1));
    await tester.pump(const Duration(milliseconds: 999));
    expect(sends, hasLength(1));
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pump();
    expect(find.text('Paused'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(sends, hasLength(2));
    expect(find.text('Macro Completed'), findsOneWidget);
    await tester.tap(find.text('Run Again'));
    await tester.pump();
    expect(sends, hasLength(3));
    await cancel(tester);
    await tester.pumpAndSettle();
    expect(find.text('Macro Completed'), findsNothing);
  });

  testWidgets('missing command stops before subsequent sends without success',
      (tester) async {
    await open(tester, [send.copyWith(buttonId: 'deleted'), send]);
    await start(tester);
    await tester.pumpAndSettle();
    expect(sends, isEmpty);
    expect(find.textContaining('Button not found'), findsOneWidget);
    expect(find.text('Macro Completed'), findsNothing);
  });

  testWidgets('invalid signal stops before subsequent sends without success',
      (tester) async {
    await open(tester, [
      send.copyWith(buttonId: 'bad'),
      send
    ], buttons: [
      button.copyWith(id: 'bad', rawData: 'broken'),
      button,
    ]);
    await start(tester);
    await tester.pumpAndSettle();
    expect(sends, isEmpty);
    expect(find.textContaining('Failed to send'), findsOneWidget);
    expect(find.text('Macro Completed'), findsNothing);
  });

  testWidgets(
      'cancel pending transmission prevents next send and overlapping restart',
      (tester) async {
    final pending = Completer<Object?>();
    onSend = (_) => pending.future;
    await open(tester, [send, send]);
    await start(tester);
    expect(sends, hasLength(1));
    await cancel(tester);
    final startButton = find.widgetWithText(FilledButton, 'Start Macro');
    expect(tester.widget<FilledButton>(startButton).onPressed, isNull);
    pending.complete();
    await tester.pumpAndSettle();
    expect(sends, hasLength(1));
    expect(tester.widget<FilledButton>(startButton).onPressed, isNotNull);
    onSend = null;
    await start(tester);
    await tester.pumpAndSettle();
    expect(sends, hasLength(3));
  });

  testWidgets('delayed start haptic cannot restart a cancelled run',
      (tester) async {
    final haptic = Completer<Object?>();
    onHaptic = (call) => (call.arguments as Map)['type'] == 'medium'
        ? haptic.future
        : Future.value(true);
    await open(tester, [manual, send]);
    await start(tester);
    await cancel(tester);
    await start(tester);
    haptic.complete(true);
    await tester.pump();
    expect(find.text('Paused'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(sends, hasLength(1));
  });

  testWidgets('cancel during delay permits immediate clean restart',
      (tester) async {
    await open(tester, [delay, send]);
    await start(tester);
    await tester.pump(const Duration(milliseconds: 250));
    await cancel(tester);
    await start(tester);
    await tester.pump(const Duration(milliseconds: 999));
    expect(sends, isEmpty);
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pumpAndSettle();
    expect(sends, hasLength(1));
  });

  testWidgets('backgrounding stops the sequence without automatic resume',
      (tester) async {
    await open(tester, [delay, send]);
    await start(tester);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    await tester.pump(const Duration(seconds: 2));
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(sends, isEmpty);
    expect(find.text('Start Macro'), findsOneWidget);
  });

  testWidgets('disposing cancels pending delay and never sends another command',
      (tester) async {
    await open(tester, [delay, send], autoStart: true);
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 2));
    expect(sends, isEmpty);
    expect(tester.takeException(), isNull);
  });

  testWidgets('empty and invalid macros do not transmit', (tester) async {
    await open(tester, []);
    expect(find.text('Start Macro'), findsNothing);
    await tester.pumpWidget(const SizedBox());
    await open(tester, [delay.copyWith(delayMs: -1), send]);
    await start(tester);
    await tester.pumpAndSettle();
    expect(sends, isEmpty);
    expect(find.text('Macro Completed'), findsNothing);
  });

  testWidgets('legacy label references and zero delay still work',
      (tester) async {
    await open(tester, [
      delay.copyWith(delayMs: 0),
      const MacroStep(
          id: 'legacy', type: MacroStepType.send, buttonRef: 'Power'),
    ]);
    await start(tester);
    await tester.pumpAndSettle();
    expect(sends, hasLength(1));
    expect(find.text('Macro Completed'), findsOneWidget);
  });
  testWidgets('native send failure stops the macro without an unhandled error',
      (tester) async {
    onSend = (_) async => throw PlatformException(code: 'USB_DISCONNECTED');
    await open(tester, [send, send]);
    await start(tester);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(sends, hasLength(1));
    expect(find.textContaining('Failed to send'), findsOneWidget);
    expect(find.text('Macro Completed'), findsNothing);
  });

  testWidgets(
      'late native completion after disposal does not update the screen',
      (tester) async {
    final pending = Completer<Object?>();
    onSend = (_) => pending.future;
    await open(tester, [send, send], autoStart: true);
    expect(sends, hasLength(1));
    await tester.pumpWidget(const SizedBox());
    pending.complete();
    await tester.pumpAndSettle();
    expect(sends, hasLength(1));
    expect(tester.takeException(), isNull);
  });
  for (final locale in [
    const Locale('en'),
    const Locale('de'),
    const Locale('ar')
  ]) {
    testWidgets('manual controls fit compact screens: $locale', (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: MacroRunScreen(
          macro: const TimedMacro(
              id: 'macro',
              name: 'Bedtime routine',
              remoteName: 'TV',
              steps: [manual, send]),
          remote: Remote(name: 'TV', buttons: [button]),
          autoStart: true,
        ),
      ));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(sends, isEmpty);
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
