import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir_finder/ir_signal_matcher.dart';

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

void main() {
  group('IrSignalDecoder', () {
    test('decodes NEC codes, also after 16 us quantisation', () {
      for (final hex in <String>['10EFD02F', '00FF12ED']) {
        final exact = IrSignalDecoder.decode(_necPattern(hex));
        expect(exact?.protocol, 'NEC');
        expect(exact?.hexcodes, <String>[hex]);

        final quantised =
            _necPattern(hex).map((us) => (us ~/ 16) * 16).toList();
        expect(IrSignalDecoder.decode(quantised)?.hexcodes, <String>[hex]);
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
        expect(decoded?.hexcodes, <String>['84C', '04C']);
        expect(decoded?.description, 'RC5 · address 1 · command 12');
      }
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
