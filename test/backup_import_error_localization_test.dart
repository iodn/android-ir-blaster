import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remotes_io.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('import errors are localized and readable: $locale',
        (tester) async {
      final directory = Directory.systemTemp.createTempSync('backup-errors-');
      final originalPicker = FilePickerPlatform.instance;
      addTearDown(() {
        FilePickerPlatform.instance = originalPicker;
        directory.deleteSync(recursive: true);
      });
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      late BuildContext context;
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: Scaffold(body: Builder(builder: (ctx) {
          context = ctx;
          return const SizedBox();
        })),
      ));
      await tester.pumpAndSettle();
      final l10n = AppLocalizations.of(context)!;
      final original = Remote(id: 1, name: 'TV', buttons: []);
      final current = [original];
      final cases = <(String, String?, String)>[
        ('backup.json', '{"remotes": {}}', l10n.importFailedRemotesMustBeList),
        ('backup.json', '{"macros": {}}', l10n.importFailedMacrosMustBeList),
        ('backup.json', '{}', l10n.importFailedInvalidBackupFormat),
        ('backup.json', '42', l10n.importFailedInvalidBackupFormat),
        ('empty.ir', 'Filetype: IR signals file\nVersion: 1\n',
            l10n.importFailedNoValidButtonsInIr),
        ('empty.irplus', '<irplus></irplus>', l10n.importFailedInvalidIrplus),
        ('empty.conf', 'begin remote\n name Empty\nend remote\n',
            l10n.importFailedInvalidLirc),
        ('broken.json', '{', l10n.importFailedInvalidUnreadableFile),
        ('missing.json', null, l10n.importFailedInvalidUnreadableFile),
        ('unsupported.txt', 'Not an IR file', l10n.unsupportedFileTypeSelected),
      ];
      for (final (name, contents, expectedMessage) in cases) {
        final file = File('${directory.path}/$name');
        if (contents != null) file.writeAsStringSync(contents);
        FilePickerPlatform.instance = _BackupPicker(file.path);
        final result = await tester.runAsync(
            () => importRemotesFromPicker(context, current: current));
        expect(result, isNotNull);
        expect(result!.success, isFalse);
        expect(result.message, expectedMessage, reason: name);
        expect(current, [original]);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result.message)));
        await tester.pumpAndSettle();
        final text = find.text(expectedMessage);
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1));
        expect(tester.getRect(text).top, greaterThanOrEqualTo(0));
        expect(tester.getRect(text).bottom, lessThanOrEqualTo(640));
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        await tester.pumpAndSettle();
      }
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}

class _BackupPicker extends FilePickerPlatform {
  _BackupPicker(this.path);
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
      _BackupFile(path);
}

final class _BackupFile extends PlatformFile {
  _BackupFile(this.path);
  @override
  final String path;
  @override
  String get name => path.split('/').last;
  @override
  String get extension => name.split('.').last;
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
