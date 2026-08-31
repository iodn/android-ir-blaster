import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/protocols/rc5.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/utils/db_button_import.dart';

void main() {
  test('RC5 supports the field bit used by 7-bit commands', () {
    const encoder = Rc5ProtocolEncoder();
    final result = encoder.encode(<String, dynamic>{
      'address': '00',
      'command': '40',
      'toggle': false,
    });

    expect(result.frequencyHz, 36000);
    expect(result.pattern, <int>[
      1778,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      889,
      90886,
    ]);
  });

  test('RC5 keeps existing 6-bit command metadata compatible', () {
    final command = rc5ProtocolDefinition.fields
        .singleWhere((field) => field.id == 'command');
    const encoder = Rc5ProtocolEncoder();
    final existing = encoder.encode(<String, dynamic>{
      'hex': '01A',
      'toggle': false,
    });
    final structured = encoder.encode(<String, dynamic>{
      'address': '00',
      'command': '1A',
      'toggle': false,
    });

    expect(command.max, 0x7F);
    expect(command.label, contains('7 bits'));
    expect(existing.pattern, structured.pattern);
  });

  test('RC5 database import decodes the inverted field bit', () {
    final button = buildButtonFromDbRow(const IrDbKeyCandidate(
      id: 1,
      protocol: 'RC5',
      hexcode: '140',
    ));

    expect(button, isNotNull);
    expect(button!.protocolParams, <String, dynamic>{
      'address': 0x05,
      'command': 0x40,
    });
  });
}
