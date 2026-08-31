import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';

void main() {
  test('Signal Tester unpacks a complete Sony12 code into protocol fields', () {
    final params = IrFinderParams.buildParamsForProtocol('sony12', 'A90');

    expect(params, <String, dynamic>{
      'address': '15',
      'command': '10',
    });
    expect(
      IrProtocolRegistry.encoderFor('sony12').encode(params).pattern,
      isNotEmpty,
    );
  });

  test('Signal Tester unpacks a 12-bit RC5 code into protocol fields', () {
    expect(
      IrFinderBruteSpec.forProtocol('rc5')!.totalHexDigits,
      3,
    );
    expect(
      IrFinderParams.buildParamsForProtocol('rc5', '81A'),
      <String, dynamic>{'address': '00', 'command': '1A'},
    );
    expect(
      IrFinderParams.buildParamsForProtocol('rc5', '054'),
      <String, dynamic>{'address': '01', 'command': '54'},
    );
  });

  test('Signal Tester preserves Pioneer two-part database codes', () {
    expect(
      IrFinderParams.buildParamsForProtocol('pioneer', 'A57AA5E0'),
      <String, dynamic>{
        'address': 'A5',
        'command': '7A',
        'secondaryAddress': 'A5',
        'secondaryCommand': 'E0',
      },
    );
  });

  test('Signal Tester builds encodable parameters for every protocol option',
      () {
    const examples = <String, String>{
      'denon': '0000',
      'f12_relaxed': '100',
      'jvc': '0000',
      'kaseikyo': '80D003',
      'nec': '000000FF',
      'nec2': '000800FF',
      'necx1': '000008F7',
      'necx2': '000C08F7',
      'nrc17': '5C61',
      'pioneer': '1A2B',
      'proton': '0000',
      'rc5': '800',
      'rc6': '800F',
      'rca_38': 'F00',
      'rcc0082': '000',
      'rcc2026': '0087FBC03FC',
      'rec80': '28C600212100',
      'recs80': '000',
      'recs80_l': '000',
      'samsung32': '0000',
      'samsung36': '00C0001',
      'sharp': '2024',
      'sony12': 'A90',
      'sony15': '6D35',
      'sony20': 'CC1011',
      'thomson7': '300',
      'xsat': '5935',
    };

    for (final entry in examples.entries) {
      final params = IrFinderParams.buildParamsForProtocol(
        entry.key,
        entry.value,
        kaseikyoVendor: '2002',
      );
      final result = IrProtocolRegistry.encoderFor(entry.key).encode(params);
      expect(result.pattern, isNotEmpty, reason: entry.key);
      expect(result.pattern.every((duration) => duration > 0), isTrue,
          reason: entry.key);
    }
  });
}
