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
    testWidgets('backup format errors are localized and readable: $locale',
        (tester) async {
      final directory = Directory.systemTemp.createTempSync('backup-errors-');
      final file = File('${directory.path}/backup.json');
      final originalPicker = FilePickerPlatform.instance;
      FilePickerPlatform.instance = _BackupPicker(file.path);
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
      final cases = {
        '{"remotes": {}}': l10n.importFailedRemotesMustBeList,
        '{"macros": {}}': l10n.importFailedMacrosMustBeList,
        '{}': l10n.importFailedInvalidBackupFormat,
        '42': l10n.importFailedInvalidBackupFormat,
      };
      for (final entry in cases.entries) {
        file.writeAsStringSync(entry.key);
        final result = await tester.runAsync(
            () => importRemotesFromPicker(context, current: current));
        expect(result, isNotNull);
        expect(result!.success, isFalse);
        expect(result.message, entry.value);
        expect(current, [original]);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result.message)));
        await tester.pumpAndSettle();
        final text = find.text(entry.value);
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
  String get name => 'backup.json';
  @override
  String get extension => 'json';
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
