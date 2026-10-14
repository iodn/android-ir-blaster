import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/widgets/code_test.dart';

void main() {
  late int sends;
  setUp(() {
    sends = 0;
    deviceCodeString = '00 ff';
    commandString = '00 ff';
    isBruteforcing = false;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(platform, (MethodCall call) async {
      if (call.method == 'transmit') sends++;
      return true;
    });
  });
  tearDown(() => TestDefaultBinaryMessengerBinding
      .instance.defaultBinaryMessenger
      .setMockMethodCallHandler(platform, null));

  Future<void> open(WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
          builder: (context) => Scaffold(
                body: TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                            builder: (_) => const CodeTest(code: '00FF01FE'))),
                    child: const Text('Open tester')),
              )),
    ));
    await tester.tap(find.text('Open tester'));
    await tester.pumpAndSettle();
  }

  for (final confirm in [false, true]) {
    testWidgets(
        'leaving running tester via ${confirm ? 'confirm' : 'back'} cancels timer',
        (tester) async {
      await open(tester);
      final state = tester.state<CodeTestState>(find.byType(CodeTest));
      // Also clean up the old broken implementation when reproducing the bug.
      addTearDown(() => state.timer?.cancel());
      await tester.tap(find.byIcon(Icons.play_arrow));
      await tester.pump(const Duration(seconds: 1));
      expect(sends, 1);
      if (confirm) {
        await tester.tap(find.byIcon(Icons.check));
      } else {
        Navigator.of(tester.element(find.byType(CodeTest))).pop();
      }
      await tester.pumpAndSettle();
      final sentBeforeDisposal = sends;
      await tester.pump(const Duration(seconds: 3));
      expect(tester.takeException(), isNull);
      expect(sends, sentBeforeDisposal);
      expect(state.timer?.isActive ?? false, isFalse);
      expect(isBruteforcing, isFalse);
      await tester.tap(find.text('Open tester'));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));
      expect(sends, sentBeforeDisposal);
      await tester.pumpWidget(const SizedBox());
    });
  }

  testWidgets('pause cancels sends and resume creates only one timer',
      (tester) async {
    await open(tester);
    final state = tester.state<CodeTestState>(find.byType(CodeTest));
    addTearDown(() => state.timer?.cancel());
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump(const Duration(seconds: 1));
    expect(sends, 1);
    await tester.tap(find.byIcon(Icons.pause));
    await tester.pump(const Duration(seconds: 3));
    expect(sends, 1);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump(const Duration(seconds: 1));
    expect(sends, 2);
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 2));
    expect(tester.takeException(), isNull);
    expect(sends, 2);
  });
}
