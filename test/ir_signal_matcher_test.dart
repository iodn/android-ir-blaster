import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/protocols/rc5.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/ir_finder/ir_signal_matcher.dart';
import 'package:irblaster_controller/utils/db_button_import.dart';

List<int> _necPattern(String hex) {
  final value = int.parse(hex, radix: 16);
  final out = <int>[9000, 4500];
  for (var i = 31; i >= 0; i--) {
    out.add(560);
    out.add(((value >> i) & 1) == 1 ? 1680 : 560);
  }
  out.add(560);
  return out;
}

/// The pattern the app sends for an RC5 database code: the code goes through
/// the same import and encoder as a button imported from the database.
List<int> _rc5PatternFromDb(String hexcode) {
  final button = buildButtonFromDbRow(
    IrDbKeyCandidate(id: 1, protocol: 'RC5', hexcode: hexcode, label: 'KEY'),
  )!;
  return const Rc5ProtocolEncoder()
      .encode(<String, dynamic>{...?button.protocolParams, 'toggle': false})
      .pattern;
}

void main() {
  group('IrSignalDecoder', () {
    test('decodes NEC codes, also after 16 us quantisation', () {
      for (final hex in <String>['10EFD02F', '00FF12ED']) {
        final exact = IrSignalDecoder.decode(_necPattern(hex));
        expect(exact?.protocol, 'NEC');
        expect(exact?.hexcode, hex);

        final quantised =
            _necPattern(hex).map((us) => (us ~/ 16) * 16).toList();
        expect(IrSignalDecoder.decode(quantised)?.hexcode, hex);
      }
    });

    test('decodes RC5 captured from a USB dongle (TV power, address 1)', () {
      // Two captures of the same button; the last entry is the inter-frame gap.
      const captures = <List<int>>[
        <int>[
          896, 864, 1792, 864, 896, 864, 896, 864, 896, 864, 896, 1744, //
          1792, 864, 912, 1744, 896, 864, 1792, 864, 896, 91072,
        ],
        <int>[
          896, 864, 896, 864, 1792, 848, 912, 848, 912, 848, 912, 1728, //
          1792, 864, 912, 1744, 912, 848, 1792, 864, 912, 91104,
        ],
      ];
      for (final capture in captures) {
        final decoded = IrSignalDecoder.decode(capture);
        expect(decoded?.protocol, 'RC5');
        expect(decoded?.hexcode, '84C');
        expect(decoded?.address, 1);
        expect(decoded?.command, 12);
      }
    });

    test('02E and 82E are different RC5 commands and do not match each other',
        () {
      // In the database the field bit (0x800) selects commands 0..63; without it
      // the command is 64..127. 02E is address 0 command 110, 82E is command 46.
      final low = IrSignalDecoder.decode(_rc5PatternFromDb('02E'));
      final high = IrSignalDecoder.decode(_rc5PatternFromDb('82E'));
      expect(low?.hexcode, '02E');
      expect(low?.command, 110);
      expect(high?.hexcode, '82E');
      expect(high?.command, 46);
      expect(low?.key, isNot(high?.key));

      // The database lookup asks for exactly the decoded code, nothing else.
      final query = RemoteIdsQuery(<DecodedIrSignal>[low!]);
      expect(query.sql, 'SELECT id FROM keys WHERE protocol = ? AND hexcode = ?');
      expect(query.args, <Object?>['RC5', '02E']);
    });

    test('RC5 codes survive the database import and encoder unchanged', () {
      for (final hex in <String>['000', '04C', '7FF', '800', '84C', 'FFF']) {
        expect(IrSignalDecoder.decode(_rc5PatternFromDb(hex))?.hexcode, hex,
            reason: hex);
      }
    });

    test('a query for several learned buttons requires every code', () {
      final query = RemoteIdsQuery(const <DecodedIrSignal>[
        DecodedIrSignal(protocol: 'RC5', hexcode: '84C'),
        DecodedIrSignal(protocol: 'NEC', hexcode: '10EFD02F'),
      ]);
      expect(
        query.sql,
        'SELECT id FROM keys WHERE protocol = ? AND hexcode = ? INTERSECT '
        'SELECT id FROM keys WHERE protocol = ? AND hexcode = ?',
      );
      expect(query.args, <Object?>['RC5', '84C', 'NEC', '10EFD02F']);
    });

    test('rejects patterns that are neither NEC nor RC5', () {
      expect(IrSignalDecoder.decode(const <int>[100, 100, 100]), isNull);
      expect(
        IrSignalDecoder.decode(_necPattern('10EFD02F').sublist(0, 40)),
        isNull,
      );
    });

    test('the same code learned twice has the same key', () {
      final a = IrSignalDecoder.decode(_necPattern('10EFD02F'));
      final b = IrSignalDecoder.decode(_necPattern('10EFD02F'));
      final c = IrSignalDecoder.decode(_necPattern('00FF12ED'));
      expect(a?.key, b?.key);
      expect(a?.key, isNot(c?.key));
    });
  });
}
