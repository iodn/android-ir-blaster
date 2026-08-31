import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remotes_io.dart';

void main() {
  test('Supported parsed Flipper protocols import as valid signals', () {
    const protocols = <String, List<String>>{
      'Kaseikyo': <String>['80 02 20 00', 'D0 03 00 00'],
      'NEC': <String>['00 00 00 00', '12 00 00 00'],
      'NECext': <String>['34 12 00 00', '78 56 00 00'],
      'NEC42': <String>['AA 0A 00 00', '55 00 00 00'],
      'NEC42ext': <String>['56 34 12 00', 'CD AB 00 00'],
      'Pioneer': <String>['A5 00 00 00', '38 00 00 00'],
      'RC5': <String>['05 00 00 00', '1A 00 00 00'],
      'RC5X': <String>['05 00 00 00', '40 00 00 00'],
      'RC6': <String>['80 00 00 00', '0F 00 00 00'],
      'RCA': <String>['0F 00 00 00', '30 00 00 00'],
      'Samsung32': <String>['0B 00 00 00', '0A 00 00 00'],
      'SIRC': <String>['15 00 00 00', '10 00 00 00'],
      'SIRC15': <String>['DA 00 00 00', '35 00 00 00'],
      'SIRC20': <String>['82 19 00 00', '11 00 00 00'],
    };
    final content = StringBuffer('Filetype: IR signals file\nVersion: 1\n');
    for (final entry in protocols.entries) {
      content
        ..writeln('#')
        ..writeln('name: ${entry.key}')
        ..writeln('type: parsed')
        ..writeln('protocol: ${entry.key}')
        ..writeln('address: ${entry.value[0]}')
        ..writeln('command: ${entry.value[1]}');
    }

    final preview = analyzeImportedText(
      content.toString(),
      filename: 'protocols.ir',
      fallbackRemoteName: 'Imported',
      fallbackButtonLabel: 'Button',
    );

    expect(preview.isSupported, isTrue);
    expect(preview.remotes.single.buttons, hasLength(protocols.length));
    for (final button in preview.remotes.single.buttons) {
      final signal = previewIRButton(button);
      expect(signal.frequencyHz, greaterThan(0), reason: button.image);
      expect(signal.pattern, isNotEmpty, reason: button.image);
      expect(
        signal.pattern.every((duration) => duration > 0),
        isTrue,
        reason: button.image,
      );
    }
  });
}
