import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:irblaster_controller/utils/remote.dart';

class ImportResult {
  final List<Remote> remotes;
  final String message;
  const ImportResult({required this.remotes, required this.message});
}

/* Legacy external storage permission: only relevant on older Android devices.
 * We request it only as a fallback when an operation fails. */
Future<bool> _requestLegacyStoragePermission(BuildContext context) async {
  if (!Platform.isAndroid) return true;

  final status = await Permission.storage.request();
  if (status.isGranted) return true;

  if (!context.mounted) return false;
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Storage permission denied (needed on some older Android devices).')),
  );
  return false;
}

Future<void> exportRemotesToDownloads(
  BuildContext context, {
  required List<Remote> remotes,
}) async {
  final mediaStore = MediaStore();

  Future<void> doSave() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'irblaster_backup_$timestamp.json';
    final jsonString = jsonEncode(remotes.map((r) => r.toJson()).toList());

    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/$fileName';
    final tempFile = File(tempPath);

    await tempFile.writeAsString(jsonString, flush: true);

    await mediaStore.saveFile(
      tempFilePath: tempPath,
      dirType: DirType.download,
      dirName: DirName.download,
    );

    try {
      await tempFile.delete();
    } catch (_) {}

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Backup exported to Downloads.')),
    );
  }

  try {
    await doSave();
    return;
  } catch (e) {
    // Retry once after requesting legacy storage permission (older Android fallback).
    final ok = await _requestLegacyStoragePermission(context);
    if (!ok) return;

    try {
      await doSave();
      return;
    } catch (e2) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to export: $e2')),
      );
    }
  }
}

Future<ImportResult?> importRemotesFromPicker(
  BuildContext context, {
  required List<Remote> current,
}) async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: const <String>['json', 'ir'],
    withData: true,
  );
  if (result == null || result.files.isEmpty) return null;

  final pf = result.files.single;

  List<int>? bytes = pf.bytes;
  if (bytes == null) {
    final path = pf.path;
    if (path == null) {
      return const ImportResult(
        remotes: <Remote>[],
        message: 'Import failed: unable to read the selected file.',
      );
    }
    try {
      bytes = await File(path).readAsBytes();
    } catch (_) {
      return const ImportResult(
        remotes: <Remote>[],
        message: 'Import failed: invalid or unreadable file.',
      );
    }
  }

  final nameLower = pf.name.toLowerCase();
  final extLower = (pf.extension ?? '').toLowerCase();

  final isJson = extLower == 'json' || nameLower.endsWith('.json');
  final isIr = extLower == 'ir' || nameLower.endsWith('.ir');

  if (!isJson && !isIr) {
    return const ImportResult(
      remotes: <Remote>[],
      message: 'Unsupported file type selected.',
    );
  }

  final contents = utf8.decode(bytes, allowMalformed: true);

  try {
    if (isJson) {
      final dynamic decoded = jsonDecode(contents);
      if (decoded is! List) {
        return const ImportResult(
          remotes: <Remote>[],
          message: 'Import failed: JSON format must be a list of remotes.',
        );
      }

      final imported = decoded
          .map((data) => Remote.fromJson(data as Map<String, dynamic>))
          .toList()
          .cast<Remote>();

      _reassignIds(imported);

      return ImportResult(
        remotes: imported,
        message: 'Imported ${imported.length} remotes from JSON.',
      );
    }

    if (isIr) {
      final Remote? remoteFromIr = _parseFlipperIrFile(contents);
      if (remoteFromIr == null) {
        return const ImportResult(
          remotes: <Remote>[],
          message: 'Import failed: no valid buttons found in .ir file.',
        );
      }

      final next = <Remote>[...current, remoteFromIr];
      _reassignIds(next);

      return const ImportResult(
        remotes: <Remote>[],
        message: 'Imported 1 remote from Flipper .ir.',
      ).copyWith(remotes: next);
    }

    return const ImportResult(
      remotes: <Remote>[],
      message: 'Unsupported file type selected.',
    );
  } catch (_) {
    return const ImportResult(
      remotes: <Remote>[],
      message: 'Import failed: invalid or unreadable file.',
    );
  }
}

extension on ImportResult {
  ImportResult copyWith({List<Remote>? remotes, String? message}) {
    return ImportResult(
      remotes: remotes ?? this.remotes,
      message: message ?? this.message,
    );
  }
}

Remote? _parseFlipperIrFile(String content) {
  final List<String> blocks = content.split('#');
  final List<IRButton> buttons = <IRButton>[];
  const String remoteName = 'Flipper IR Remote';

  for (String block in blocks) {
    block = block.trim();
    if (block.isEmpty) continue;

    // Parsed NEC-style blocks
    if (block.contains('type: parsed')) {
      final nameMatch = RegExp(r'name:\s*(.+)').firstMatch(block);
      final addressMatch = RegExp(r'address:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})').firstMatch(block);
      final commandMatch = RegExp(r'command:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})').firstMatch(block);

      if (nameMatch != null && addressMatch != null && commandMatch != null) {
        final String name = nameMatch.group(1)!.trim();
        final String hexCode = _convertToLircHex(addressMatch, commandMatch);

        buttons.add(
          IRButton(
            code: int.parse(hexCode, radix: 16),
            rawData: null,
            frequency: null,
            image: name,
            isImage: false,
          ),
        );
      }
      continue;
    }

    // Raw blocks
    if (block.contains('type: raw')) {
      final nameMatch = RegExp(r'name:\s*(.+)').firstMatch(block);
      final frequencyMatch = RegExp(r'frequency:\s*(\d+)').firstMatch(block);
      final dataMatch = RegExp(r'data:\s*([\d\s]+)').firstMatch(block);

      if (nameMatch != null && frequencyMatch != null && dataMatch != null) {
        final String name = nameMatch.group(1)!.trim();
        final int frequency = int.parse(frequencyMatch.group(1)!);
        final String rawData = dataMatch.group(1)!.trim();

        buttons.add(
          IRButton(
            code: null,
            rawData: rawData,
            frequency: frequency,
            image: name,
            isImage: false,
          ),
        );
      }
      continue;
    }
  }

  if (buttons.isEmpty) return null;

  return Remote(
    name: remoteName,
    useNewStyle: true,
    buttons: buttons,
  );
}

String _convertToLircHex(RegExpMatch addressMatch, RegExpMatch commandMatch) {
  final int addrByte1 = int.parse(addressMatch.group(1)!, radix: 16);
  final int addrByte2 = int.parse(addressMatch.group(2)!, radix: 16);
  final int cmdByte1 = int.parse(commandMatch.group(1)!, radix: 16);
  final int cmdByte2 = int.parse(commandMatch.group(2)!, radix: 16);

  final int lircCmd = _bitReverse(addrByte1);
  final int lircCmdInv = (addrByte2 == 0) ? (0xFF - lircCmd) : _bitReverse(addrByte2);
  final int lircAddr = _bitReverse(cmdByte1);
  final int lircAddrInv = (cmdByte2 == 0) ? (0xFF - lircAddr) : _bitReverse(cmdByte2);

  return "${lircCmd.toRadixString(16).padLeft(2, '0')}"
          "${lircCmdInv.toRadixString(16).padLeft(2, '0')}"
          "${lircAddr.toRadixString(16).padLeft(2, '0')}"
          "${lircAddrInv.toRadixString(16).padLeft(2, '0')}"
      .toUpperCase();
}

int _bitReverse(int x) {
  return int.parse(
    x.toRadixString(2).padLeft(8, '0').split('').reversed.join(),
    radix: 2,
  );
}

void _reassignIds(List<Remote> remotes) {
  for (int i = 0; i < remotes.length; i++) {
    remotes[i].id = i + 1;
  }
}
