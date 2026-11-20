import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/db_button_import.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remotes_io.dart';
import 'package:irblaster_controller/widgets/create_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('LIRC JVC Power sends captured timings and packed bits to Android',
      () async {
    // RM-SFSSD7R.lircd.conf, KEY_POWER. No REVERSE flag is present.
    final imported = analyzeImportedText('''
begin remote
  name RM-SFSSD7R
  bits 16
  flags SPACE_ENC|NO_HEAD_REP|CONST_LENGTH
  header 8587 4221
  one 596 1533
  zero 596 478
  ptrail 593
  gap 46756
  begin codes
    KEY_POWER 0xC5E8
  end codes
end remote
''',
        filename: 'RM-SFSSD7R.lircd.conf',
        fallbackRemoteName: 'Remote',
        fallbackButtonLabel: 'Button');
    const bits = '1100010111101000';
    final expected = [
      8587,
      4221,
      for (final bit in bits.split('')) ...[596, bit == '1' ? 1533 : 478],
      593,
      7731,
    ];
    MethodCall? sent;
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(platform, (call) async {
      sent = call;
      return null;
    });
    addTearDown(() => messenger.setMockMethodCallHandler(platform, null));

    await sendIR(imported.remotes.single.buttons.single);

    expect(sent!.method, 'transmitRaw');
    expect(sent!.arguments, {'frequency': 38000, 'list': expected});
  });

  testWidgets('pasted Pronto Hex saves converted timings and carrier',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    IRButton? saved;
    await tester.pumpWidget(MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
          builder: (context) => Scaffold(
                body: TextButton(
                  onPressed: () async {
                    saved = await Navigator.of(context)
                        .push<IRButton>(MaterialPageRoute(
                      builder: (_) => const CreateButton(
                          button: IRButton(
                        id: 'jvc-raw',
                        image: 'Power',
                        isImage: false,
                        frequency: 40000,
                        rawData: '8400 4200 525 525',
                      )),
                    ));
                  },
                  child: const Text('Edit'),
                ),
              )),
    ));
    await tester.tap(find.text('Edit'));
    await tester.pumpAndSettle();
    for (var i = 0; i < 2; i++) {
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
    }
    final l10n =
        AppLocalizations.of(tester.element(find.byType(CreateButton)))!;
    final raw = find.byWidgetPredicate((widget) =>
        widget is TextField &&
        widget.decoration?.labelText == l10n.rawDataLabel);
    await tester.ensureVisible(raw);
    await tester.pumpAndSettle();
    await tester.enterText(
        raw, '0000 006D 0002 0001 0140 00A0 0014 003C 0014 0014');
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, l10n.saveAction));
    await tester.pumpAndSettle();
    expect(saved?.frequency, 38029);
    expect(saved?.rawData, '8415 4207 526 1578 526 526');
  });

  test('JVC database TV Power preserves the captured wire-order bits', () {
    // Independent capture: probonopd/lirc-remotes, jvc/RM-S9.xml,
    // KEY_POWER C0E8, decoded JVC D=3,F=23 (both fields LSB-first).
    final button = buildButtonFromDbRow(const IrDbKeyCandidate(
      id: 1,
      protocol: 'JVC',
      hexcode: 'C0E8',
    ))!;
    final signal = previewIRButton(button);
    expect(signal.frequencyHz, 38000);
    expect(signal.pattern.take(2), <int>[8400, 4200]);
    expect(signal.pattern.length, 36);
    final bits = <int>[
      for (int i = 3; i < 34; i += 2) signal.pattern[i] == 1575 ? 1 : 0,
    ].join();
    expect(bits, '1100000011101000');
    expect(signal.pattern.skip(34), <int>[525, 21000]);
  });
}
