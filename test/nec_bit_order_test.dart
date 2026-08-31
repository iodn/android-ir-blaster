import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const code = 0x00FF01FE;

  test('NEC bit-order modes preserve compatibility and add true per-byte LSB',
      () {
    expect(
      _decodeAsStandardNec(buildNecPatternFromStoredCodeMSBFirst(code)),
      <int>[0x00, 0xFF, 0x80, 0x7F],
    );
    expect(
      _decodeAsStandardNec(buildNecPatternLSBFirst(code)),
      <int>[0xFE, 0x01, 0xFF, 0x00],
    );
    expect(
      _decodeAsStandardNec(buildNecPatternLsbPerByte(code)),
      <int>[0x00, 0xFF, 0x01, 0xFE],
    );
  });

  test('true_lsb persisted mode is used by preview and transmission', () async {
    const button = IRButton(
      id: 'true-lsb',
      code: code,
      rawData: 'NEC:9000 4500 560 560 1690 560',
      frequency: 38000,
      image: 'Power',
      isImage: false,
      necBitOrder: 'true_lsb',
    );

    final expected = <int>[0x00, 0xFF, 0x01, 0xFE];
    expect(_decodeAsStandardNec(previewIRButton(button).pattern), expected);

    const channel = MethodChannel('org.nslabs/irtransmitter');
    MethodCall? transmitted;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      transmitted = call;
      return true;
    });
    addTearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    await sendIR(button);

    expect(transmitted?.method, 'transmitRaw');
    final arguments = transmitted?.arguments as Map<Object?, Object?>;
    expect(arguments['frequency'], 38000);
    expect(
      _decodeAsStandardNec(List<int>.from(arguments['list']! as List)),
      expected,
    );
  });
}

List<int> _decodeAsStandardNec(List<int> pattern) {
  final bytes = <int>[];
  for (int byteIndex = 0; byteIndex < 4; byteIndex++) {
    int value = 0;
    for (int bitIndex = 0; bitIndex < 8; bitIndex++) {
      final signalBit = byteIndex * 8 + bitIndex;
      final space = pattern[3 + signalBit * 2];
      if (space == NECParams.defaults.oneSpace) {
        value |= 1 << bitIndex;
      }
    }
    bytes.add(value);
  }
  return bytes;
}
