import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/protocols/sony12.dart';
import 'package:irblaster_controller/ir/protocols/sony15.dart';
import 'package:irblaster_controller/ir/protocols/sony20.dart';

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

  test('Sony encoders reject values wider than their protocol fields', () {
    expect(
      () => const Sony12ProtocolEncoder().encode(<String, dynamic>{
        'address': '20',
        'command': '00',
      }),
      throwsArgumentError,
    );
    expect(
      () => const Sony15ProtocolEncoder().encode(<String, dynamic>{
        'address': '00',
        'command': '80',
      }),
      throwsArgumentError,
    );
    expect(
      () => const Sony20ProtocolEncoder().encode(<String, dynamic>{
        'address': '2000',
        'command': '00',
      }),
      throwsArgumentError,
    );
  });
}
