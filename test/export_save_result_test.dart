import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/macros_io.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remotes_io.dart';
import 'package:media_store_plus/media_store_plus.dart';

class _SavePicker extends FilePickerPlatform {
  Uint8List? savedBytes;

  @override
  Future<Uri?> saveFile({
    required String fileName,
    required Uint8List bytes,
    required String mimeType,
    String? dialogTitle,
    String? initialDirectory,
    Function(FilePickerStatus)? onFileSaving,
    WindowsOptions windowsOptions = const WindowsOptions(),
    LinuxOptions linuxOptions = const LinuxOptions(),
    WebOptions webOptions = const WebOptions(),
  }) async {
    savedBytes = bytes;
    return Uri.parse('content://exports/$fileName');
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  for (final macrosOnly in [false, true]) {
    for (final saveSucceeds in [false, true]) {
      testWidgets('export macros=$macrosOnly native success=$saveSucceeds',
          (tester) async {
        final dir = Directory.systemTemp.createTempSync('export-result-');
        final messenger =
            TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
        const paths = MethodChannel('plugins.flutter.io/path_provider');
        const media = MethodChannel('media_store_plus');
        final originalPicker = FilePickerPlatform.instance;
        final originalFolder = MediaStore.appFolder;
        final picker = _SavePicker();
        FilePickerPlatform.instance = picker;
        MediaStore.appFolder = 'test';
        messenger.setMockMethodCallHandler(paths, (_) async => dir.path);
        messenger.setMockMethodCallHandler(media, (call) async {
          if (call.method == 'getPlatformSDKInt') return 34;
          if (call.method == 'saveFile') {
            return jsonEncode(saveSucceeds
                ? {
                    'name': 'backup.json',
                    'uri': 'content://exports/backup',
                    'save_status': '0'
                  }
                : <String, dynamic>{});
          }
          return null;
        });
        addTearDown(() {
          FilePickerPlatform.instance = originalPicker;
          MediaStore.appFolder = originalFolder;
          messenger.setMockMethodCallHandler(paths, null);
          messenger.setMockMethodCallHandler(media, null);
          dir.deleteSync(recursive: true);
        });
        await MediaStore.ensureInitialized();
        late BuildContext context;
        await tester.pumpWidget(MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: Builder(builder: (ctx) {
            context = ctx;
            return const SizedBox();
          })),
        ));
        await tester.runAsync(() async {
          if (macrosOnly) {
            await exportMacrosToDownloads(context, macros: const [
              TimedMacro(
                  id: 'macro', name: 'Night', remoteName: 'TV', steps: []),
            ]);
          } else {
            await exportRemotesToDownloads(context,
                remotes: [Remote(name: 'TV', buttons: [])]);
          }
        });
        await tester.pumpAndSettle();
        if (saveSucceeds) {
          expect(picker.savedBytes, isNull);
        } else {
          expect(picker.savedBytes, isNotNull,
              reason: 'An unconfirmed native save must use the save picker');
          final payload = jsonDecode(utf8.decode(picker.savedBytes!));
          expect(payload['schema'],
              macrosOnly ? 'irblaster.macros' : 'irblaster.backup');
        }
        final l10n = AppLocalizations.of(context)!;
        expect(
            find.text(macrosOnly
                ? l10n.macrosExportedToDownloads
                : l10n.backupExportedToDownloads),
            findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
