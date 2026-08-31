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

  test('preview parser accepts Flipper IR files and builds a usable remote', () {
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

  test('Flipper NECext preserves zero high bytes as 16-bit field data', () {
    const input = '''
Filetype: IR signals file
Version: 1
#
name: Power
type: parsed
protocol: NECext
address: 50 00 00 00
command: 17 00 00 00
''';
    final preview = analyzeImportedText(
      input,
      filename: 'extended_zero_bytes.ir',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    final button = preview.remotes.single.buttons.single;
    expect(button.protocol, 'nec');
    expect(button.protocolParams?['hex'], '0A00E800');
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

  test('Flipper Samsung32 imports as Samsung32 instead of legacy NEC', () {
    const input = '''
Filetype: IR signals file
Version: 1
#
name: Power
type: parsed
protocol: Samsung32
address: 0B 00 00 00
command: 0A 00 00 00
''';
    final preview = analyzeImportedText(
      input,
      filename: 'samsung.ir',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    final button = preview.remotes.single.buttons.single;
    expect(button.code, isNull);
    expect(button.protocol, 'samsung32');
    expect(button.protocolParams, <String, dynamic>{
      'address': '0B',
      'command': '0A',
    });
    expect(previewIRButton(button).pattern.take(2), <int>[4500, 4500]);
  });

  test('Flipper NEC42 imports all 42 bits instead of truncating to NEC2', () {
    const input = '''
Filetype: IR signals file
Version: 1
#
name: Power
type: parsed
protocol: NEC42
address: AA 0A 00 00
command: 55 00 00 00
''';
    final preview = analyzeImportedText(
      input,
      filename: 'nec42.ir',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );
    final button = preview.remotes.single.buttons.single;
    final signal = previewIRButton(button);

    expect(button.protocol, isNull);
    expect(button.rawData, isNotNull);
    expect(signal.frequencyHz, 38000);
    expect(signal.pattern.take(2), <int>[9000, 4500]);
    expect(
      _decodeNecPayload(signal.pattern, bitCount: 42),
      _packNec42(address: 0x0AAA, command: 0x55),
    );
    expect(signal.pattern.reduce((a, b) => a + b), 110000);
  });

  test('Flipper NEC42ext preserves its 26-bit address and 16-bit command', () {
    const input = '''
Filetype: IR signals file
Version: 1
#
name: Power
type: parsed
protocol: NEC42ext
address: AA AA AA 02
command: 55 55 00 00
''';
    final preview = analyzeImportedText(
      input,
      filename: 'nec42ext.ir',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );
    final signal = previewIRButton(preview.remotes.single.buttons.single);

    expect(
      _decodeNecPayload(signal.pattern, bitCount: 42),
      (0x02AAAAAA & 0x3FFFFFF) | (0x5555 << 26),
    );
    expect(signal.pattern.reduce((a, b) => a + b), 110000);
  });

  test('unsupported parsed Flipper protocols are not fabricated as NEC', () {
    const input = '''
Filetype: IR signals file
Version: 1
#
name: Unsupported
type: parsed
protocol: UnknownProtocol
address: 12 34 00 00
command: 56 78 00 00
#
name: Learned
type: raw
frequency: 38000
duty_cycle: 0.330000
data: 9000 4500 560 560
''';
    final preview = analyzeImportedText(
      input,
      filename: 'mixed.ir',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    expect(preview.isSupported, isTrue);
    expect(preview.remotes.single.buttons, hasLength(1));
    expect(preview.remotes.single.buttons.single.image, 'Learned');
    expect(preview.remotes.single.buttons.single.rawData, '9000 4500 560 560');
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

  test('IRPlus RC5 imports its 13-bit button payload', () {
    const input = '''
<irplus>
  <device manufacturer="Hitachi" model="RC-49141" format="WINLIRC_RC5" bits="13" pre-bits="13">
    <button label="Power">0x10CC</button>
  </device>
</irplus>
''';
    final preview = analyzeImportedText(
      input,
      filename: 'hitachi.xml',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    final button = preview.remotes.single.buttons.single;
    expect(button.protocol, 'rc5');
    expect(button.protocolParams, <String, dynamic>{
      'address': '03',
      'command': '0C',
    });
    expect(previewIRButton(button).frequencyHz, 36000);
  });

  test('IRPlus RC5 joins converter pre-data and button data', () {
    const input = '''
<irplus>
  <device format="WINLIRC_RC5" bits="6" pre-bits="7">
    <button label="Power">0x45 0x0C</button>
  </device>
</irplus>
''';
    final preview = analyzeImportedText(
      input,
      filename: 'split-rc5.xml',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    final button = preview.remotes.single.buttons.single;
    expect(button.protocol, 'rc5');
    expect(button.protocolParams, <String, dynamic>{
      'address': '05',
      'command': '0C',
    });
    expect(previewIRButton(button).frequencyHz, 36000);
  });

  test('IRPlus RC6 joins mode 0 pre-data and button data', () {
    const input = '''
<irplus>
  <device format="WINLIRC_RC6" bits="8" pre-bits="13" frequency="36000">
    <button label="Power">0xEFB 0xF3</button>
  </device>
</irplus>
''';
    final preview = analyzeImportedText(
      input,
      filename: 'split-rc6.xml',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    final button = preview.remotes.single.buttons.single;
    expect(button.protocol, 'rc6');
    expect(button.protocolParams, <String, dynamic>{'hex': 'FBF3'});
    expect(previewIRButton(button).frequencyHz, 36000);
  });

  test('IRPlus RC6 imports a complete 21-bit mode 0 frame', () {
    const input = '''
<irplus>
  <device format="WINLIRC_RC6" bits="21" frequency="36000">
    <button label="Power">0xEFBF3</button>
  </device>
</irplus>
''';
    final preview = analyzeImportedText(
      input,
      filename: 'full-rc6.xml',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    final button = preview.remotes.single.buttons.single;
    expect(button.protocol, 'rc6');
    expect(button.protocolParams, <String, dynamic>{'hex': 'FBF3'});
    expect(previewIRButton(button).frequencyHz, 36000);
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

  test('LIRC RC5 imports its field bit as the seventh command bit', () {
    const input = '''
begin remote
  name Extended_RC5
  bits 13
  flags RC5|CONST_LENGTH
  one 889 889
  zero 889 889
  gap 114000
  begin codes
    KEY_EXTENDED 0x0140
  end codes
end remote
''';
    final preview = analyzeImportedText(
      input,
      filename: 'extended.lircd.conf',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    final button = preview.remotes.single.buttons.single;
    expect(button.protocol, 'rc5');
    expect(button.protocolParams, <String, dynamic>{
      'address': '05',
      'command': '40',
    });
  });

  test('LIRC RC5 includes fixed pre-data when rebuilding the frame', () {
    const input = '''
begin remote
  name Split_RC5
  bits 6
  flags RC5|CONST_LENGTH
  one 889 889
  zero 889 889
  pre_data_bits 7
  pre_data 0x45
  gap 114000
  begin codes
    KEY_POWER 0x0C
  end codes
end remote
''';
    final preview = analyzeImportedText(
      input,
      filename: 'split-rc5.lircd.conf',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    final button = preview.remotes.single.buttons.single;
    expect(button.protocol, 'rc5');
    expect(button.protocolParams, <String, dynamic>{
      'address': '05',
      'command': '0C',
    });
  });

  test('LIRC RC6 includes fixed pre-data in its mode 0 payload', () {
    const input = '''
begin remote
  name Split_RC6
  bits 8
  flags RC6|CONST_LENGTH
  one 444 444
  zero 444 444
  pre_data_bits 13
  pre_data 0xEFB
  gap 108000
  begin codes
    KEY_POWER 0xF3
  end codes
end remote
''';
    final preview = analyzeImportedText(
      input,
      filename: 'split-rc6.lircd.conf',
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );

    final button = preview.remotes.single.buttons.single;
    expect(button.protocol, 'rc6');
    expect(button.protocolParams, <String, dynamic>{'hex': 'FBF3'});
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

int _decodeNecPayload(List<int> pattern, {required int bitCount}) {
  int value = 0;
  for (int i = 0; i < bitCount; i++) {
    if (pattern[3 + (i * 2)] > 1000) value |= 1 << i;
  }
  return value;
}

int _packNec42({required int address, required int command}) {
  return (address & 0x1FFF) |
      (((~address) & 0x1FFF) << 13) |
      ((command & 0xFF) << 26) |
      (((~command) & 0xFF) << 34);
}
