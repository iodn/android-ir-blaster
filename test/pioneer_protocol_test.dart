import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/protocols/pioneer.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/utils/db_button_import.dart';

void main() {
  test('Pioneer database import preserves both parts of a mixed command', () {
    final button = buildButtonFromDbRow(const IrDbKeyCandidate(
      id: 1,
      protocol: 'Pioneer',
      hexcode: 'A57AA5E0',
    ));

    expect(button, isNotNull);
    expect(button!.protocolParams, <String, dynamic>{
      'address': 'A5',
      'command': '7A',
      'secondaryAddress': 'A5',
      'secondaryCommand': 'E0',
    });
  });

  test('Pioneer emits the optional second command as its second frame', () {
    const encoder = PioneerProtocolEncoder();
    final mixed = encoder.encode(<String, dynamic>{
      'address': 'A5',
      'command': '7A',
      'secondaryAddress': 'A5',
      'secondaryCommand': 'E0',
    });
    final second = encoder.encode(<String, dynamic>{
      'address': 'A5',
      'command': 'E0',
    });

    expect(mixed.pattern.length, second.pattern.length);
    expect(
      mixed.pattern.sublist(mixed.pattern.length ~/ 2),
      second.pattern.sublist(0, second.pattern.length ~/ 2),
    );
  });
}
