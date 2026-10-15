import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remotes_io.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    test('preview explanations preserve parser outcomes: $locale', () async {
      final l = await AppLocalizations.delegate.load(locale);
      final cases = <(String, String, bool, String, String, List<String>?)>[
        (
          'good.json',
          '[{"name":"TV","buttons":[{"id":"p","code":1,"image":"Power","isImage":false}]}]',
          true,
          l.importPreviewJsonFormat,
          l.importPreviewReady,
          []
        ),
        (
          'good.ir',
          '''
Filetype: IR signals file
Version: 1
#
name: Power
type: parsed
protocol: NEC
address: 00 00 00 00
command: 12 00 00 00
''',
          true,
          'Flipper .ir',
          l.importPreviewReady,
          []
        ),
        (
          'good.irplus',
          '<irplus><device manufacturer="Test" model="TV" format="NEC"><button label="Power">0x00FF 0x20DF</button></device></irplus>',
          true,
          'IRPlus XML',
          l.importPreviewReady,
          []
        ),
        (
          'good.conf',
          '''
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
''',
          true,
          l.importPreviewLircFormat,
          l.importPreviewReady,
          []
        ),
        (
          'empty.json',
          '[]',
          false,
          l.importPreviewJsonFormat,
          l.importPreviewNoJsonButtons,
          [l.importPreviewJsonGuidance]
        ),
        (
          'empty.ir',
          'Filetype: IR signals file\nVersion: 1\n',
          false,
          'Flipper .ir',
          l.importFailedNoValidButtonsInIr,
          []
        ),
        (
          'empty.irplus',
          '<irplus></irplus>',
          false,
          'IRPlus XML',
          l.importFailedInvalidIrplus,
          []
        ),
        (
          'empty.conf',
          'begin remote\n name Empty\nend remote\n',
          false,
          l.importPreviewLircFormat,
          l.importFailedInvalidLirc,
          []
        ),
        (
          'header.conf',
          'no LIRC section',
          false,
          l.importPreviewLircFormat,
          l.importFailedInvalidLirc,
          [l.importPreviewMissingLircHeader]
        ),
        (
          'unsupported.txt',
          'test',
          false,
          l.importPreviewUnknownFormat,
          l.unsupportedFileTypeSelected,
          [l.importPreviewSupportedFormats]
        ),
        (
          'broken.json',
          '{',
          false,
          l.importPreviewUnknownFormat,
          l.importFailedInvalidUnreadableFile,
          null
        ),
      ];
      for (final (filename, content, supported, format, reason, issues)
          in cases) {
        final preview = analyzeImportedText(content,
            filename: filename,
            fallbackRemoteName: 'Imported',
            fallbackButtonLabel: 'Button',
            localizations: l);
        final english = analyzeImportedText(content,
            filename: filename,
            fallbackRemoteName: 'Imported',
            fallbackButtonLabel: 'Button');
        expect(preview.isSupported, supported, reason: filename);
        expect(preview.formatLabel, format, reason: filename);
        expect(preview.supportReason, reason, reason: filename);
        expect(preview.isSupported, english.isSupported);
        expect(preview.totalButtons, english.totalButtons);
        expect(preview.remotes.length, english.remotes.length);
        if (issues != null) {
          expect(preview.issues, issues, reason: filename);
        } else {
          // Keep the underlying exception intact for troubleshooting.
          expect(preview.issues.single, contains('FormatException'));
          expect(preview.issues, english.issues);
        }
      }
      expect(l.importPreviewMissingLircHeader, contains('begin remote'));
      expect(l.importPreviewSupportedFormats, matches(RegExp(r'IR[ -]Blaster')));
      for (final format in [
        'JSON',
        'Flipper .ir',
        'IRPLUS XML',
        'LIRC'
      ]) {
        expect(l.importPreviewSupportedFormats, contains(format));
      }
    });
  }
}
