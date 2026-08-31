import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/universal_power/power_params.dart';

void main() {
  test('Universal Power unpacks a 12-bit RC5 database code', () {
    expect(totalHexDigitsForProtocol('rc5'), 3);

    final params = buildParamsForProtocol(
      protocolId: 'rc5',
      codeHex: '054',
    );

    expect(
      params,
      <String, dynamic>{'address': '01', 'command': '54'},
    );
    expect(
      IrProtocolRegistry.encoderFor('rc5').encode(params).pattern,
      isNotEmpty,
    );
  });

  test('Universal Power preserves a two-part Pioneer database code', () {
    expect(totalHexDigitsForProtocol('pioneer'), 8);

    final params = buildParamsForProtocol(
      protocolId: 'pioneer',
      codeHex: 'A57AA5E0',
    );

    expect(
      params,
      <String, dynamic>{
        'address': 'A5',
        'command': '7A',
        'secondaryAddress': 'A5',
        'secondaryCommand': 'E0',
      },
    );
    expect(
      IrProtocolRegistry.encoderFor('pioneer').encode(params).pattern,
      isNotEmpty,
    );
  });
}
