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

  test('Universal Power unpacks packed Sony database codes', () {
    expect(
      buildParamsForProtocol(protocolId: 'sony12', codeHex: 'A90'),
      <String, dynamic>{'address': '15', 'command': '10'},
    );
    expect(
      buildParamsForProtocol(protocolId: 'sony15', codeHex: '6D35'),
      <String, dynamic>{'address': 'DA', 'command': '35'},
    );
    expect(
      buildParamsForProtocol(protocolId: 'sony20', codeHex: 'C1011'),
      <String, dynamic>{'address': '1820', 'command': '11'},
    );

    for (final protocol in <String>['sony12', 'sony15', 'sony20']) {
      final code = <String, String>{
        'sony12': 'A90',
        'sony15': '6D35',
        'sony20': 'C1011',
      }[protocol]!;
      final params = buildParamsForProtocol(
        protocolId: protocol,
        codeHex: code,
      );
      expect(
        IrProtocolRegistry.encoderFor(protocol).encode(params).pattern,
        isNotEmpty,
        reason: protocol,
      );
    }
  });

  test('Universal Power keeps the Samsung32 address and command bytes', () {
    expect(totalHexDigitsForProtocol('samsung32'), 4);

    final params = buildParamsForProtocol(
      protocolId: 'samsung32',
      codeHex: 'A57A',
    );

    expect(
      params,
      <String, dynamic>{'address': 'A5', 'command': '7A'},
    );
    expect(
      IrProtocolRegistry.encoderFor('samsung32').encode(params).pattern,
      isNotEmpty,
    );
  });
}
