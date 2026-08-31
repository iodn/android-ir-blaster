import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/utils/db_button_import.dart';
import 'package:irblaster_controller/utils/ir.dart';

void main() {
  test('A bundled database code for every protocol produces a valid signal', () {
    const samples = <String, String>{
      'Denon': '1190',
      'F12_relaxed': 'A84',
      'JVC': 'C004',
      'NEC': '10EFD02F',
      'NEC2': '04FBC837',
      'NECx1': '505050AF',
      'NECx2': 'E0E0C43B',
      'Pioneer': 'A501A501',
      'Proton': '2800',
      'RC5': '81A',
      'RC6': '0000',
      'RCA_38': 'F30',
      'RCC0082': '53C',
      'RCC2026': '38863BD42BC',
      'REC80': 'C2CA80204C90',
      'RECS80': 'AA8',
      'RECS80_L': 'F30',
      'SONY12': '2F0',
      'SONY15': '06BA',
      'SONY20': 'CC110',
      'Samsung36': '0400E24',
      'Sharp': '81E4',
      'Thomson7': '30E',
    };

    for (final entry in samples.entries) {
      final button = buildButtonFromDbRow(IrDbKeyCandidate(
        id: 1,
        protocol: entry.key,
        hexcode: entry.value,
      ));
      expect(button, isNotNull, reason: entry.key);

      final preview = previewIRButton(button!);
      expect(preview.frequencyHz, greaterThan(0), reason: entry.key);
      expect(preview.pattern, isNotEmpty, reason: entry.key);
      expect(
        preview.pattern.every((duration) => duration > 0),
        isTrue,
        reason: entry.key,
      );
    }
  });
}
