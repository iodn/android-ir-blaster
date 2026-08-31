import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/protocols/sony12.dart';

void main() {
  test('Sony12 packs a 7-bit command and 5-bit address into 12 LSB-first bits',
      () {
    const encoder = Sony12ProtocolEncoder();
    final result = encoder.encode(<String, dynamic>{
      'address': '15',
      'command': '10',
    });

    expect(result.frequencyHz, 40000);

    final firstFrame = result.pattern.take(26).toList(growable: false);
    expect(firstFrame.take(2), <int>[2400, 600]);
    expect(firstFrame.fold<int>(0, (sum, duration) => sum + duration), 45000);

    final dataMarks = <int>[
      for (int bit = 0; bit < 12; bit++) firstFrame[2 + bit * 2],
    ];
    expect(
      dataMarks,
      <int>[600, 600, 600, 600, 1200, 600, 600, 1200, 600, 1200, 600, 1200],
    );

    expect(result.pattern, <int>[...firstFrame, ...firstFrame, ...firstFrame]);
  });

  test('Sony12 editor keeps address and command within their protocol widths',
      () {
    final address = sony12ProtocolDefinition.fields
        .singleWhere((field) => field.id == 'address');
    final command = sony12ProtocolDefinition.fields
        .singleWhere((field) => field.id == 'command');

    expect(address.maxLength, 2);
    expect(command.maxLength, 2);
    expect(address.label, contains('5-bit'));
    expect(command.label, contains('7-bit'));
  });
}
