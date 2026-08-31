import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remotes_io.dart';

void main() {
  const fallbackRemoteName = 'ImportedRemote';
  const fallbackButtonLabel = 'Button';

  const flipperIr = '''
Filetype: IR signals file
Version: 1
#
name: Power
type: parsed
protocol: NEC
address: 00 FF
command: 20 DF
''';

  const flipperNecExt = '''
Filetype: IR signals file
Version: 1
#
name: Power
type: parsed
protocol: NECext
address: EE 87 00 00
command: 5D A0 00 00
''';

  const flipperRc5x = '''
Filetype: IR signals file
Version: 1
#
name: Extended command
type: parsed
protocol: RC5X
address: 05 00 00 00
command: 40 00 00 00
''';

  const irplusXml = '''
<irplus>
  <device manufacturer="Test" model="Remote" format="NEC">
    <button label="Power">0x00FF 0x20DF</button>
  </device>
</irplus>
''';

  const lircConfig = '''
begin remote
  name TV
  flags SPACE_ENC|CONST_LENGTH
  frequency 38000
  bits 32
  header 9000 4500
  one 560 1690
  zero 560 560
  ptrail 560
  gap 45000
  begin codes
    KEY_POWER 0x20DF10EF
  end codes
end remote
''';

  const jsonBackup = '''
[
  {
    "name": "TV",
    "useNewStyle": true,
    "buttons": [
      {
        "id": "btn-1",
        "code": 551489775,
        "image": "Power",
        "isImage": false
      }
    ]
  }
]
''';

  void expectRemoteIsUsable(Remote remote) {
    expect(remote.name.trim(), isNotEmpty);
    expect(remote.buttons, isNotEmpty);
    for (final button in remote.buttons) {
      expect(button.image.trim(), isNotEmpty);
      final hasRaw = button.rawData?.trim().isNotEmpty == true;
      final hasProtocol = button.protocol?.trim().isNotEmpty == true;
      expect(button.code != null || hasRaw || hasProtocol, isTrue);
    }
  }

  test('preview parser accepts Flipper IR files and builds a usable remote',
      () {
    final preview = analyzeImportedText(
      flipperIr,
      filename: 'tv.ir',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    expect(preview.isSupported, isTrue);
    expect(preview.formatLabel, 'Flipper .ir');
    expect(preview.remotes, hasLength(1));
    expectRemoteIsUsable(preview.remotes.single);
  });

  test('Flipper NECext imports with the NEC 9000/4500 preamble', () {
    final preview = analyzeImportedText(
      flipperNecExt,
      filename: 'extended.ir',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    expect(preview.isSupported, isTrue);
    final button = preview.remotes.single.buttons.single;
    expect(button.protocol, 'nec');
    expect(button.protocolParams?['hex'], '77E1BA05');
    expect(previewIRButton(button).pattern.take(2), <int>[9000, 4500]);
  });

  test('Flipper RC5X preserves the seventh command bit', () {
    final preview = analyzeImportedText(
      flipperRc5x,
      filename: 'extended_rc5.ir',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    expect(preview.isSupported, isTrue);
    final button = preview.remotes.single.buttons.single;
    expect(button.protocol, 'rc5');
    expect(button.protocolParams, <String, dynamic>{
      'address': '05',
      'command': '40',
    });
  });

  test('preview parser accepts IRPlus XML variants and builds a usable remote',
      () {
    for (final filename in ['tv.xml', 'tv.irplus']) {
      final preview = analyzeImportedText(
        irplusXml,
        filename: filename,
        fallbackRemoteName: fallbackRemoteName,
        fallbackButtonLabel: fallbackButtonLabel,
      );

      expect(preview.isSupported, isTrue, reason: filename);
      expect(preview.formatLabel, 'IRPlus XML', reason: filename);
      expect(preview.remotes, hasLength(1), reason: filename);
      expectRemoteIsUsable(preview.remotes.single);
    }
  });

  test('preview parser accepts JSON backups and builds usable remotes', () {
    final preview = analyzeImportedText(
      jsonBackup,
      filename: 'backup.json',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    expect(preview.isSupported, isTrue);
    expect(preview.formatLabel, 'JSON backup');
    expect(preview.remotes, hasLength(1));
    expectRemoteIsUsable(preview.remotes.single);
  });

  test('preview parser accepts all supported LIRC-style filename variants', () {
    for (final filename in [
      'tv.conf',
      'tv.cfg',
      'tv.lirc',
      'tv.lrc',
      'tv.lirc.conf',
      'tv.lircd.conf',
    ]) {
      final preview = analyzeImportedText(
        lircConfig,
        filename: filename,
        fallbackRemoteName: fallbackRemoteName,
        fallbackButtonLabel: fallbackButtonLabel,
      );

      expect(preview.isSupported, isTrue, reason: filename);
      expect(preview.formatLabel, 'LIRC config', reason: filename);
      expect(preview.remotes, hasLength(1), reason: filename);
      expectRemoteIsUsable(preview.remotes.single);
    }
  });

  test('preview rejects config-like files that are not valid LIRC remotes', () {
    final preview = analyzeImportedText(
      'not a real config',
      filename: 'broken.lrc',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    expect(preview.isSupported, isFalse);
    expect(preview.formatLabel, 'LIRC config');
  });
}
