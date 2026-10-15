import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/remote_highlights_prefs.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remotes_io.dart';

const fixtures = {
  'power.ir': '''
Filetype: IR signals file
Version: 1
#
name: Power
type: parsed
protocol: NEC
address: 00 00 00 00
command: 12 00 00 00
''',
  'power.irplus': '''
<irplus>
  <device manufacturer="Test" model="Remote" format="NEC">
    <button label="Power">0x00FF 0x20DF</button>
  </device>
</irplus>
''',
  'power.conf': '''
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
};

void main() {
  for (final source in [...fixtures.keys, 'folder']) {
    for (final existingIds in <List<int>>[
      [],
      [8, 2, 15]
    ]) {
      testWidgets('$source append preserves existing IDs $existingIds',
          (tester) async {
        final directory = Directory.systemTemp.createTempSync('import-ids-');
        final previousPicker = FilePickerPlatform.instance;
        addTearDown(() {
          FilePickerPlatform.instance = previousPicker;
          directory.deleteSync(recursive: true);
        });
        for (final fixture in fixtures.entries) {
          File('${directory.path}/${fixture.key}')
              .writeAsStringSync(fixture.value);
        }
        if (source == 'folder') {
          File('${directory.path}/backup.json').writeAsStringSync(jsonEncode([
            Remote(id: 2, name: 'Imported duplicate ID', buttons: [
              const IRButton(
                  id: 'imported', image: 'Power', isImage: false, code: 1),
            ]).toJson(),
          ]));
        }
        FilePickerPlatform.instance = _ImportPicker(
            source == 'folder' ? directory.path : '${directory.path}/$source');
        late BuildContext context;
        await tester.pumpWidget(MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(builder: (ctx) {
            context = ctx;
            return const SizedBox();
          }),
        ));
        await tester.pumpAndSettle();
        final current = [
          for (final id in existingIds)
            Remote(id: id, name: 'Original $id', buttons: [
              IRButton(
                  id: 'button-$id', image: 'Power', isImage: false, code: 1),
            ]),
        ];
        final snapshot = jsonEncode(current.map((r) => r.toJson()).toList());
        final pins = current.map(RemoteHighlightRef.fromRemote).toList();
        final result = await tester.runAsync(() => source == 'folder'
            ? importRemotesFromFolderPicker(context, current: current)
            : importRemotesFromPicker(context, current: current));
        expect(result, isNotNull);
        expect(result!.success, isTrue);
        expect(result.macros, isNull);
        expect(jsonEncode(current.map((r) => r.toJson()).toList()), snapshot,
            reason: 'Appending must not mutate existing remote identities');
        final addedCount = source == 'folder' ? fixtures.length + 1 : 1;
        expect(result.remotes, hasLength(current.length + addedCount));
        expect(result.remotes.map((r) => r.id).toSet(),
            hasLength(result.remotes.length));
        for (var i = 0; i < current.length; i++) {
          expect(result.remotes[i], same(current[i]));
          expect(
              result.remotes.where(pins[i].matches).single, same(current[i]));
        }
        for (final remote in result.remotes.skip(current.length)) {
          expect(remote.id, greaterThan(0));
          expect(remote.buttons, isNotEmpty);
        }
        final created = Remote(name: 'Created after import', buttons: []);
        expect(result.remotes.map((r) => r.id), isNot(contains(created.id)));
      });
    }
  }

  test('reserving imported IDs advances but never rewinds the allocator', () {
    final before = Remote(name: 'Before', buttons: []);
    Remote.reserveIdsThrough(before.id + 100);
    expect(Remote(name: 'After import', buttons: []).id, before.id + 101);
    Remote.reserveIdsThrough(1);
    expect(
        Remote(name: 'After smaller import', buttons: []).id, before.id + 102);
  });
}

class _ImportPicker extends FilePickerPlatform {
  _ImportPicker(this.path);
  final String path;

  @override
  Future<PlatformFile?> pickFile({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    int compressionQuality = 0,
    AndroidOptions androidOptions = const AndroidOptions(),
    DarwinOptions darwinOptions = const DarwinOptions(),
    WindowsOptions windowsOptions = const WindowsOptions(),
    LinuxOptions linuxOptions = const LinuxOptions(),
    WebOptions webOptions = const WebOptions(),
  }) async =>
      _ImportFile(path);

  @override
  Future<String?> getDirectoryPath({
    String? dialogTitle,
    String? initialDirectory,
    AndroidOptions androidOptions = const AndroidOptions(),
    WindowsOptions windowsOptions = const WindowsOptions(),
    LinuxOptions linuxOptions = const LinuxOptions(),
    WebOptions webOptions = const WebOptions(),
  }) async =>
      path;
}

final class _ImportFile extends PlatformFile {
  _ImportFile(this.path);
  @override
  final String path;
  @override
  String get name => path.split('/').last;
  @override
  String get extension => name.split('.').last;
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
