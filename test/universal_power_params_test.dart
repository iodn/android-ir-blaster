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
}
