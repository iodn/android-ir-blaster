import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/widgets/ir_waveform_view.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget app(Widget child) => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    );

void main() {
  for (final fail in [false, true]) {
    testWidgets('waveform send and loop reflect hardware failure=$fail', (tester) async {
      tester.view.physicalSize = const Size(320, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({});
      final patterns = <List<int>>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(platform, (call) async {
        if (call.method == 'performHaptic') return true;
        if (call.method == 'transmitRaw') {
          patterns.add(List<int>.from(call.arguments['list']));
          if (fail) throw PlatformException(code: 'NO_IR');
          return true;
        }
        return {'hasInternal': true};
      });
      await tester.pumpWidget(app(RemoteView(remote: Remote(name: 'TV', buttons: const [
        IRButton(id: 'test', image: 'Power', isImage: false,
          protocol: 'marantz', protocolParams: {'address': '11', 'command': '76', 'extension': '09'}),
      ]))));
      await tester.pumpAndSettle();
      if (find.text('Dismiss').evaluate().isNotEmpty) {
        await tester.tap(find.text('Dismiss'));
        await tester.pumpAndSettle();
      }
      await tester.longPress(find.text('Power').first);
      await tester.pumpAndSettle();
      for (var i = 0; i < 2; i++) {
        await tester.ensureVisible(find.text('Send Command'));
        await tester.tap(find.text('Send Command'));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 1100));
        await tester.pump(const Duration(milliseconds: 200));
        expect(tester.widget<IrWaveformPanel>(find.byType(IrWaveformPanel)).pattern,
            patterns.last);
        final sentOpacity = tester.widget<AnimatedOpacity>(
            find.ancestor(of: find.text('Sent.'), matching: find.byType(AnimatedOpacity)).first);
        expect(sentOpacity.opacity, fail ? 0 : 1);
        await tester.pump(const Duration(seconds: 1));
      }
      expect(patterns[0], isNot(patterns[1]));
      await tester.ensureVisible(find.text('Start loop'));
      await tester.tap(find.text('Start loop'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text(fail ? 'Start loop' : 'Stop loop'), findsOneWidget);
      if (!fail) {
        await tester.tap(find.text('Stop loop'));
        await tester.pump();
      }
      expect(tester.widget<IrWaveformPanel>(find.byType(IrWaveformPanel)).playheadProgress, isNull);
      if (!fail) {
        await tester.tap(find.text('Send Command'));
        await tester.pump();
        Navigator.of(tester.element(find.byType(IrWaveformPanel))).pop();
        await tester.pump(const Duration(milliseconds: 400));
      }
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(seconds: 7));
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('missing emitter shows a send error without a crash report',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    var attempts = 0;
    final methods = <String>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('org.nslabs/irtransmitter'), (call) async {
      methods.add(call.method);
      if (call.method == 'performHaptic') return true;
      if (call.method == 'transmitRaw') {
        attempts++;
        throw PlatformException(code: 'NO_IR', message: 'No emitter');
      }
      return {'hasInternal': false};
    });
    await tester.pumpWidget(app(RemoteView(
        remote: Remote(name: 'TV', buttons: const [
      IRButton(
          id: 'power',
          image: 'Power',
          isImage: false,
          frequency: 38000,
          rawData: '9000 4500 560 560')
    ]))));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Dismiss'));
    await tester.pumpAndSettle();
    for (var i = 0; i < 2; i++) {
      await tester.tap(find.text('Power').first);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(attempts, i + 1, reason: methods.toString());
      expect(find.byType(SnackBar), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
    }
    expect(attempts, 2);
  });

  test('transmit errors reach the caller without global error reporting',
      () async {
    final reported = <FlutterErrorDetails>[];
    final previous = FlutterError.onError;
    FlutterError.onError = reported.add;
    addTearDown(() => FlutterError.onError = previous);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            platform, (_) async => throw PlatformException(code: 'NO_IR'));
    for (final send in <Future<void> Function()>[
      () => transmit(0x00FF01FE),
      () => transmitRaw(38000, [9000, 4500, 560]),
      () => transmitRawCycles(38000, [340, 170, 21]),
    ]) {
      await expectLater(send(), throwsA(isA<PlatformException>()));
    }
    expect(reported, isEmpty);
  });

  testWidgets('remote disposal does not update an unmounting widget',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('org.nslabs/irtransmitter'),
            (_) async => {'hasInternal': true});
    await tester
        .pumpWidget(app(RemoteView(remote: Remote(name: 'TV', buttons: []))));
    await tester.pumpAndSettle();
    await tester.pumpWidget(const SizedBox());
    expect(tester.takeException(), isNull);
  });

  testWidgets('waveform owns its horizontal scroll position and disposes it',
      (tester) async {
    await tester.pumpWidget(app(const Scaffold(
        body: PrimaryScrollController.none(
      child: SizedBox(
          width: 320,
          child: IrWaveformPanel(
            pattern: [9000, 4500, 560, 560, 560],
            frequencyHz: 38000,
          )),
    ))));
    await tester.pumpAndSettle();
    await tester.drag(
        find.byType(SingleChildScrollView), const Offset(-200, 0));
    await tester.pumpAndSettle();
    expect(
        tester.state<ScrollableState>(find.byType(Scrollable)).position.pixels,
        greaterThan(0));
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
    expect(tester.takeException(), isNull);
  });
}
