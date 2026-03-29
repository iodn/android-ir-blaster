import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/macros_io.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:xml/xml.dart' as xml;

class ImportResult {
  final List<Remote> remotes;
  final List<TimedMacro>? macros;
  final String message;

  const ImportResult({
    required this.remotes,
    required this.macros,
    required this.message,
  });
}

Future<bool> _requestLegacyStoragePermission(BuildContext context) async {
  if (!Platform.isAndroid) return true;

  final status = await Permission.storage.request();
  if (status.isGranted) return true;

  if (!context.mounted) return false;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(context.l10n.storagePermissionDeniedLegacy)),
  );
  return false;
}

Future<void> exportRemotesToDownloads(
  BuildContext context, {
  required List<Remote> remotes,
  List<TimedMacro> macros = const <TimedMacro>[],
}) async {
  final mediaStore = MediaStore();

  Future<void> doSave() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'irblaster_backup_$timestamp.json';
    final payload = <String, dynamic>{
      'schema': 'irblaster.backup',
      'version': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'remotes': remotes.map((r) => r.toJson()).toList(),
      'macros': macros.map((m) => m.copyWith(version: 1).toJson()).toList(),
    };

    final jsonString = jsonEncode(payload);

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
      SnackBar(content: Text(context.l10n.backupExportedToDownloads)),
    );
  }

  try {
    await doSave();
    return;
  } catch (_) {
    if (!context.mounted) return;
    final ok = await _requestLegacyStoragePermission(context);
    if (!ok) return;

    try {
      await doSave();
      return;
    } catch (e2) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.failedToExport(e2.toString()))),
      );
    }
  }
}

Future<ImportResult?> importRemotesFromPicker(
  BuildContext context, {
  required List<Remote> current,
}) async {
  final l10n = context.l10n;
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: const <String>[
      'json',
      'ir',
      'xml',
      'irplus',
      'conf',
      'cfg',
      'lirc',
    ],
    withData: true,
    withReadStream: true,
  );

  if (result == null || result.files.isEmpty) return null;

  final pf = result.files.single;
  final List<int>? bytes = await _readPlatformFileBytes(pf);

  if (bytes == null) {
    return ImportResult(
      remotes: <Remote>[],
      macros: null,
      message: l10n.importFailedInvalidUnreadableFile,
    );
  }

  final nameLower = pf.name.toLowerCase();
  final extLower = (pf.extension ?? '').toLowerCase();
  final isJson = extLower == 'json' || nameLower.endsWith('.json');
  final isIr = extLower == 'ir' || nameLower.endsWith('.ir');
  final isXmlLike = extLower == 'xml' ||
      extLower == 'irplus' ||
      nameLower.endsWith('.xml') ||
      nameLower.endsWith('.irplus');
  final isConfLike = extLower == 'conf' || extLower == 'cfg' || extLower == 'lirc';

  if (!isJson && !isIr && !isXmlLike && !isConfLike) {
    return ImportResult(
      remotes: <Remote>[],
      macros: null,
      message: l10n.unsupportedFileTypeSelected,
    );
  }

  final contents = utf8.decode(bytes, allowMalformed: true);
  final importedRemoteName = _sanitizeRemoteNameFromFilename(
    pf.name,
    fallbackName: l10n.importedRemoteDefaultName,
  );

  try {
    if (isJson) {
      final dynamic decoded = jsonDecode(contents);

      if (decoded is List) {
        final importedRemotes = decoded
            .whereType<Map>()
            .map((data) => Remote.fromJson(data.cast<String, dynamic>()))
            .toList();
        _reassignIds(importedRemotes);
        return ImportResult(
          remotes: importedRemotes,
          macros: null,
          message: l10n.importedLegacyJsonBackup(importedRemotes.length),
        );
      }

      if (decoded is Map) {
        final hasRemotesKey = decoded.containsKey('remotes');
        final hasMacrosKey = decoded.containsKey('macros');

        final dynamic remotesRaw = decoded['remotes'];
        final dynamic macrosRaw = decoded['macros'];

        if (hasRemotesKey && remotesRaw is! List) {
          return ImportResult(
            remotes: <Remote>[],
            macros: null,
            message: l10n.importFailedRemotesMustBeList,
          );
        }
        if (hasMacrosKey && macrosRaw is! List) {
          return ImportResult(
            remotes: <Remote>[],
            macros: null,
            message: l10n.importFailedMacrosMustBeList,
          );
        }

        final List<Remote> importedRemotes = (remotesRaw is List)
            ? remotesRaw
                .whereType<Map>()
                .map((data) => Remote.fromJson(data.cast<String, dynamic>()))
                .toList()
            : <Remote>[];

        _reassignIds(importedRemotes);

        List<TimedMacro>? importedMacros;
        if (macrosRaw is List) {
          final parsed = macrosRaw
              .whereType<Map>()
              .map((data) => TimedMacro.fromJson(data.cast<String, dynamic>()))
              .toList();

          final byName = <String, Remote>{};
          for (final r in importedRemotes) {
            final k = r.name.trim();
            if (k.isNotEmpty) byName[k] = r;
          }

          importedMacros = parsed.map((m) {
            final r = byName[m.remoteName.trim()];
            if (r == null) return m;
            return bindMacroToRemote(m, r);
          }).toList();
        }

        if (importedRemotes.isEmpty && importedMacros == null) {
          return ImportResult(
            remotes: <Remote>[],
            macros: null,
            message: l10n.importFailedInvalidBackupFormat,
          );
        }

        final rCount = importedRemotes.length;
        final mCount = importedMacros?.length ?? 0;

        return ImportResult(
          remotes: importedRemotes,
          macros: importedMacros,
          message: importedMacros == null
              ? l10n.importedBackupRemotesOnly(rCount)
              : l10n.importedBackupRemotesAndMacros(rCount, mCount),
        );
      }

      return ImportResult(
        remotes: <Remote>[],
        macros: null,
        message: l10n.importFailedInvalidBackupFormat,
      );
    }

    if (isIr) {
      final Remote? remoteFromIr = _parseFlipperIrFile(
        contents,
        remoteName: importedRemoteName,
      );

      if (remoteFromIr == null) {
        return ImportResult(
          remotes: <Remote>[],
          macros: null,
          message: l10n.importFailedNoValidButtonsInIr,
        );
      }

      final next = <Remote>[...current, remoteFromIr];
      _reassignIds(next);
      return ImportResult(
        remotes: next,
        macros: null,
        message: l10n.importedOneRemoteFromFlipper,
      );
    }

    if (isXmlLike) {
      final Remote? remoteFromIrplus = _parseIrplusXml(
        contents,
        filename: pf.name,
        remoteName: importedRemoteName,
        fallbackLabel: l10n.buttonFallbackTitle,
      );

      if (remoteFromIrplus == null) {
        return ImportResult(
          remotes: <Remote>[],
          macros: null,
          message: l10n.importFailedInvalidIrplus,
        );
      }

      final next = <Remote>[...current, remoteFromIrplus];
      _reassignIds(next);
      return ImportResult(
        remotes: next,
        macros: null,
        message: l10n.importedOneRemoteFromIrplus,
      );
    }

    final isLirc = RegExp(
      r'\bbegin\s+remote\b',
      caseSensitive: false,
    ).hasMatch(contents);

    if (isConfLike && isLirc) {
      final Remote? remoteFromLirc = _parseLircConfig(
        contents,
        remoteName: importedRemoteName,
        fallbackLabel: l10n.buttonFallbackTitle,
      );

      if (remoteFromLirc == null) {
        return ImportResult(
          remotes: <Remote>[],
          macros: null,
          message: l10n.importFailedInvalidLirc,
        );
      }

      final next = <Remote>[...current, remoteFromLirc];
      _reassignIds(next);
      return ImportResult(
        remotes: next,
        macros: null,
        message: l10n.importedOneRemoteFromLirc,
      );
    }

    return ImportResult(
      remotes: <Remote>[],
      macros: null,
      message: l10n.unsupportedFileTypeSelected,
    );
  } catch (_) {
    return ImportResult(
      remotes: <Remote>[],
      macros: null,
      message: l10n.importFailedInvalidUnreadableFile,
    );
  }
}

Future<ImportResult?> importRemotesFromFolderPicker(
  BuildContext context, {
  required List<Remote> current,
  bool recursive = true,
}) async {
  final l10n = context.l10n;
  if (Platform.isAndroid) {
    final FilePickerResult? res = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const <String>[
        'json',
        'ir',
        'xml',
        'irplus',
        'conf',
        'cfg',
        'lirc',
      ],
      allowMultiple: true,
      withData: true,
      withReadStream: true,
    );

    if (res == null || res.files.isEmpty) return null;
    if (!context.mounted) return null;

    return _bulkImportFromPlatformFiles(
      context,
      current: current,
      files: res.files,
      sourceLabel: l10n.selectedFilesLabel,
    );
  }

  final String? dirPath = await FilePicker.platform.getDirectoryPath();
  if (dirPath == null || dirPath.trim().isEmpty) return null;

  final Directory dir = Directory(dirPath);
  if (!await dir.exists()) {
    return ImportResult(
      remotes: current,
      macros: null,
      message: l10n.folderNotFoundOrInaccessible,
    );
  }

  Future<ImportResult> doImport() async {
    final List<Remote> imported = <Remote>[];
    int supported = 0;
    int skippedUnsupported = 0;
    int skippedBroken = 0;

    await for (final entity in dir.list(
      recursive: recursive,
      followLinks: false,
    )) {
      if (entity is! File) continue;

      final String filePath = entity.path;
      final String fileName = filePath.split(RegExp(r'[\\/]+')).last;
      final String nameLower = fileName.toLowerCase();
      final String extLower = _extensionLower(fileName);

      final bool isSupported = _isSupportedImportFile(nameLower, extLower);
      if (!isSupported) {
        skippedUnsupported++;
        continue;
      }

      supported++;

      List<int> bytes;
      try {
        bytes = await entity.readAsBytes();
      } catch (_) {
        skippedBroken++;
        continue;
      }

      final String contents = utf8.decode(bytes, allowMalformed: true);
      final String remoteNameHint = _sanitizeRemoteNameFromFilename(
        fileName,
        fallbackName: l10n.importedRemoteDefaultName,
      );

      try {
        final List<Remote> remotesFromFile = _parseSupportedFileToRemotes(
          contents,
          filename: fileName,
          extLower: extLower,
          remoteNameHint: remoteNameHint,
          fallbackButtonLabel: l10n.buttonFallbackTitle,
        );

        if (remotesFromFile.isEmpty) {
          skippedBroken++;
          continue;
        }

        imported.addAll(remotesFromFile);
      } catch (_) {
        skippedBroken++;
        continue;
      }
    }

    if (imported.isEmpty) {
      final int skipped = skippedUnsupported + skippedBroken;
      return ImportResult(
        remotes: current,
        macros: null,
        message: supported == 0
            ? l10n.bulkImportNoSupportedFilesInFolder
            : l10n.bulkImportNoRemotesImported(skipped),
      );
    }

    final List<Remote> next = <Remote>[...current, ...imported];
    _reassignIds(next);

    final int skipped = skippedUnsupported + skippedBroken;
    return ImportResult(
      remotes: next,
      macros: null,
      message: l10n.bulkImportComplete(imported.length, supported, skipped),
    );
  }

  try {
    return await doImport();
  } catch (_) {
    if (!context.mounted) {
      return ImportResult(
        remotes: current,
        macros: null,
        message: l10n.storagePermissionDenied,
      );
    }
    final ok = await _requestLegacyStoragePermission(context);
    if (!ok) {
      return ImportResult(
        remotes: current,
        macros: null,
        message: l10n.storagePermissionDenied,
      );
    }

    try {
      return await doImport();
    } catch (_) {
      return ImportResult(
        remotes: current,
        macros: null,
        message: l10n.bulkImportFailedReadFolder,
      );
    }
  }
}

Future<ImportResult> _bulkImportFromPlatformFiles(
  BuildContext context, {
  required List<Remote> current,
  required List<PlatformFile> files,
  required String sourceLabel,
}) async {
  final l10n = context.l10n;
  final List<Remote> imported = <Remote>[];
  int supported = 0;
  int skippedUnsupported = 0;
  int skippedBroken = 0;

  for (final pf in files) {
    final String fileName = pf.name;
    final String nameLower = fileName.toLowerCase();
    String extLower = (pf.extension ?? '').toLowerCase();
    if (extLower.isEmpty) {
      extLower = _extensionLower(fileName);
    }

    final bool isSupported = _isSupportedImportFile(nameLower, extLower);
    if (!isSupported) {
      skippedUnsupported++;
      continue;
    }

    supported++;

    final List<int>? bytes = await _readPlatformFileBytes(pf);
    if (bytes == null) {
      skippedBroken++;
      continue;
    }

    final String contents = utf8.decode(bytes, allowMalformed: true);
    final String remoteNameHint = _sanitizeRemoteNameFromFilename(
      fileName,
      fallbackName: l10n.importedRemoteDefaultName,
    );

    try {
      final List<Remote> remotesFromFile = _parseSupportedFileToRemotes(
        contents,
        filename: fileName,
        extLower: extLower,
        remoteNameHint: remoteNameHint,
        fallbackButtonLabel: l10n.buttonFallbackTitle,
      );

      if (remotesFromFile.isEmpty) {
        skippedBroken++;
        continue;
      }

      imported.addAll(remotesFromFile);
    } catch (_) {
      skippedBroken++;
      continue;
    }
  }

  if (imported.isEmpty) {
    final int skipped = skippedUnsupported + skippedBroken;
    return ImportResult(
      remotes: current,
      macros: null,
      message: supported == 0
          ? l10n.bulkImportNoSupportedFilesSource(sourceLabel)
          : l10n.bulkImportNoRemotesImported(skipped),
    );
  }

  final List<Remote> next = <Remote>[...current, ...imported];
  _reassignIds(next);

  final int skipped = skippedUnsupported + skippedBroken;
  return ImportResult(
    remotes: next,
    macros: null,
    message: l10n.bulkImportComplete(imported.length, supported, skipped),
  );
}

Future<List<int>?> _readPlatformFileBytes(PlatformFile pf) async {
  if (pf.bytes != null && pf.bytes!.isNotEmpty) return pf.bytes!;

  final Stream<List<int>>? s = pf.readStream;
  if (s != null) {
    final List<int> out = <int>[];
    try {
      await for (final chunk in s) {
        out.addAll(chunk);
      }
      if (out.isNotEmpty) return out;
    } catch (_) {}
  }

  final path = pf.path;
  if (path != null && path.isNotEmpty) {
    try {
      return await File(path).readAsBytes();
    } catch (_) {}
  }

  return null;
}

String _extensionLower(String filename) {
  final String f = filename.trim();
  final int i = f.lastIndexOf('.');
  if (i < 0 || i == f.length - 1) return '';
  return f.substring(i + 1).toLowerCase();
}

bool _isSupportedImportFile(String nameLower, String extLower) {
  if (nameLower.endsWith('.lircd.conf') || nameLower.endsWith('.lirc.conf')) {
    return true;
  }
  switch (extLower) {
    case 'json':
    case 'ir':
    case 'xml':
    case 'irplus':
    case 'conf':
    case 'cfg':
    case 'lirc':
      return true;
    default:
      return false;
  }
}

List<Remote> _parseSupportedFileToRemotes(
  String contents, {
  required String filename,
  required String extLower,
  required String remoteNameHint,
  required String fallbackButtonLabel,
}) {
  final String nameLower = filename.toLowerCase();
  final bool isJson = extLower == 'json' || nameLower.endsWith('.json');
  final bool isIr = extLower == 'ir' || nameLower.endsWith('.ir');
  final bool isXmlLike = extLower == 'xml' ||
      extLower == 'irplus' ||
      nameLower.endsWith('.xml') ||
      nameLower.endsWith('.irplus');
  final bool isConfLike = extLower == 'conf' || extLower == 'cfg' || extLower == 'lirc';

  if (isJson) {
    final dynamic decoded = jsonDecode(contents);

    if (decoded is List) {
      final importedRemotes = decoded
          .whereType<Map>()
          .map((data) => Remote.fromJson(data.cast<String, dynamic>()))
          .toList();
      return importedRemotes;
    }

    if (decoded is Map) {
      final dynamic remotesRaw = decoded['remotes'];
      if (remotesRaw is List) {
        return remotesRaw
            .whereType<Map>()
            .map((data) => Remote.fromJson(data.cast<String, dynamic>()))
            .toList();
      }
      return const <Remote>[];
    }

    return const <Remote>[];
  }

  if (isIr) {
    final Remote? r = _parseFlipperIrFile(contents, remoteName: remoteNameHint);
    if (r == null) return const <Remote>[];
    return <Remote>[r];
  }

  if (isXmlLike) {
    final Remote? r = _parseIrplusXml(
      contents,
      filename: filename,
      remoteName: remoteNameHint,
      fallbackLabel: fallbackButtonLabel,
    );
    if (r == null) return const <Remote>[];
    return <Remote>[r];
  }

  final bool isLirc = RegExp(
    r'\bbegin\s+remote\b',
    caseSensitive: false,
  ).hasMatch(contents);

  if (isConfLike && isLirc) {
    final Remote? r = _parseLircConfig(
      contents,
      remoteName: remoteNameHint,
      fallbackLabel: fallbackButtonLabel,
    );
    if (r == null) return const <Remote>[];
    return <Remote>[r];
  }

  return const <Remote>[];
}

String _sanitizeRemoteNameFromFilename(String filename, {required String fallbackName}) {
  String base = filename.trim();
  if (base.isEmpty) return fallbackName;

  base = base.split(RegExp(r'[\\/]+')).last;

  base = base.replaceAll(
    RegExp(r'\.(lircd\.conf|lirc\.conf)$', caseSensitive: false),
    '',
  );

  base = base.replaceAll(
    RegExp(r'\.(json|ir|xml|irplus|conf|cfg|lirc)$', caseSensitive: false),
    '',
  );

  if (base.contains('.')) {
    base = base.replaceAll(RegExp(r'\.+$'), '');
  }

  final sanitized = base.replaceAll(RegExp(r'[^A-Za-z0-9]'), '');
  if (sanitized.isEmpty) return fallbackName;
  return sanitized;
}

String? _mapFlipperProtocol(String? name) {
  if (name == null) return null;

  final n = name.trim().toLowerCase();
  switch (n) {
    case 'kaseikyo':
      return 'kaseikyo';
    case 'nec':
      return 'nec';
    case 'nec42':
      return 'nec2';
    case 'necext':
      return 'necx1';
    case 'nrc17':
      return 'nrc17';
    case 'pioneer':
      return 'pioneer';
    case 'rc5':
      return 'rc5';
    case 'rc5x':
      return 'rc5';
    case 'rc6':
      return 'rc6';
    case 'rca':
      return 'rca_38';
    case 'samsung32':
      return 'samsung32';
    case 'samsung36':
      return 'samsung36';
    case 'sirc':
      return 'sony12';
    case 'sirc15':
      return 'sony15';
    case 'sirc20':
      return 'sony20';
    case 'xsat':
    case 'x_sat':
    case 'mitsubishi':
      return 'xsat';
    default:
      return null;
  }
}

Remote? _parseFlipperIrFile(
  String content, {
  required String remoteName,
}) {
  final uuid = const Uuid();
  final List<String> blocks = content.split('#');
  final List<IRButton> buttons = <IRButton>[];

  for (String block in blocks) {
    block = block.trim();
    if (block.isEmpty) continue;

    if (block.contains('type: parsed')) {
      final protoMatch = RegExp(r'protocol:\s*(.+)').firstMatch(block);
      final protocolName = protoMatch?.group(1)?.trim();
      final mappedProtocol = _mapFlipperProtocol(protocolName);

      final nameMatch = RegExp(r'name:\s*(.+)').firstMatch(block);
      if (nameMatch == null) continue;
      final String name = nameMatch.group(1)!.trim();

      if (mappedProtocol == 'kaseikyo') {
        final String? fullAddr = RegExp(
          r'address:\s*(([0-9A-Fa-f]{2}\s+){3}[0-9A-Fa-f]{2})',
        ).firstMatch(block)?.group(1);

        final String? fullCmd = RegExp(
          r'command:\s*(([0-9A-Fa-f]{2}\s+){3}[0-9A-Fa-f]{2})',
        ).firstMatch(block)?.group(1);

        if (fullAddr != null && fullCmd != null) {
          final List<String> addrBytes = fullAddr
              .trim()
              .split(RegExp(r'\s+'))
              .where((s) => s.isNotEmpty)
              .toList();

          final List<String> cmdBytes = fullCmd
              .trim()
              .split(RegExp(r'\s+'))
              .where((s) => s.isNotEmpty)
              .toList();

          if (addrBytes.length == 4 && cmdBytes.length == 4) {
            buttons.add(
              IRButton(
                id: uuid.v4(),
                code: null,
                rawData: null,
                frequency: 37000,
                image: name,
                isImage: false,
                protocol: 'kaseikyo',
                protocolParams: <String, dynamic>{
                  'address': addrBytes.map((e) => e.toUpperCase()).join(' '),
                  'command': cmdBytes.map((e) => e.toUpperCase()).join(' '),
                },
              ),
            );
            continue;
          }
        }
        continue;
      }

      final addressMatch = RegExp(
        r'address:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})',
      ).firstMatch(block);

      final commandMatch = RegExp(
        r'command:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})',
      ).firstMatch(block);

      if (addressMatch == null || commandMatch == null) continue;

      if (mappedProtocol != null && mappedProtocol == 'rc5') {
        final int addr = int.parse(addressMatch.group(1)!, radix: 16) & 0x1F;
        final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0x3F;
        final int value = (addr << 6) | cmd;
        final String hex = value.toRadixString(16).toUpperCase();

        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 36000,
            image: name,
            isImage: false,
            protocol: 'rc5',
            protocolParams: <String, dynamic>{'hex': hex},
          ),
        );
      } else if (mappedProtocol == 'rc6') {
        final int addr = int.parse(addressMatch.group(1)!, radix: 16) & 0xFF;
        final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0xFF;
        final String hex = ((addr << 8) | cmd)
            .toRadixString(16)
            .padLeft(4, '0')
            .toUpperCase();

        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 36000,
            image: name,
            isImage: false,
            protocol: 'rc6',
            protocolParams: <String, dynamic>{'hex': hex},
          ),
        );
      } else if (mappedProtocol == 'rca_38') {
        final int addrNibble = int.parse(addressMatch.group(1)!, radix: 16) & 0x0F;
        final String addrHex = addrNibble.toRadixString(16).toUpperCase();
        final String cmdHex = int.parse(commandMatch.group(1)!, radix: 16)
            .toRadixString(16)
            .padLeft(2, '0')
            .toUpperCase();

        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 38000,
            image: name,
            isImage: false,
            protocol: 'rca_38',
            protocolParams: <String, dynamic>{
              'address': addrHex,
              'command': cmdHex,
            },
          ),
        );
      } else if (mappedProtocol == 'pioneer') {
        final String addrHex = int.parse(addressMatch.group(1)!, radix: 16)
            .toRadixString(16)
            .padLeft(2, '0')
            .toUpperCase();

        final String cmdHex = int.parse(commandMatch.group(1)!, radix: 16)
            .toRadixString(16)
            .padLeft(2, '0')
            .toUpperCase();

        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 40000,
            image: name,
            isImage: false,
            protocol: 'pioneer',
            protocolParams: <String, dynamic>{
              'address': addrHex,
              'command': cmdHex,
            },
          ),
        );
      } else if (mappedProtocol == 'sony12') {
        final int addr = int.parse(addressMatch.group(1)!, radix: 16) & 0x1F;
        final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0x7F;

        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 40000,
            image: name,
            isImage: false,
            protocol: 'sony12',
            protocolParams: <String, dynamic>{
              'address': addr.toRadixString(16).toUpperCase(),
              'command': cmd.toRadixString(16).padLeft(2, '0').toUpperCase(),
            },
          ),
        );
      } else if (mappedProtocol == 'sony15') {
        final int addr = int.parse(addressMatch.group(1)!, radix: 16) & 0xFF;
        final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0x7F;

        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 40000,
            image: name,
            isImage: false,
            protocol: 'sony15',
            protocolParams: <String, dynamic>{
              'address': addr.toRadixString(16).padLeft(2, '0').toUpperCase(),
              'command': cmd.toRadixString(16).padLeft(2, '0').toUpperCase(),
            },
          ),
        );
      } else if (mappedProtocol == 'sony20') {
        final int lo = int.parse(addressMatch.group(1)!, radix: 16) & 0xFF;
        final int hi = int.parse(addressMatch.group(2)!, radix: 16) & 0xFF;
        final int addr = ((hi << 8) | lo) & 0x1FFF;
        final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0x7F;

        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 40000,
            image: name,
            isImage: false,
            protocol: 'sony20',
            protocolParams: <String, dynamic>{
              'address': addr.toRadixString(16).toUpperCase(),
              'command': cmd.toRadixString(16).padLeft(2, '0').toUpperCase(),
            },
          ),
        );
      } else if (mappedProtocol != null &&
          (mappedProtocol == 'nec' || mappedProtocol == 'nec2' || mappedProtocol == 'necx1')) {
        final String hexCode = _convertToLircHex(addressMatch, commandMatch);

        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: int.parse(hexCode, radix: 16),
            rawData: null,
            frequency: null,
            image: name,
            isImage: false,
            protocol: mappedProtocol,
            protocolParams: <String, dynamic>{'hex': hexCode},
          ),
        );
      } else {
        final String hexCode = _convertToLircHex(addressMatch, commandMatch);

        buttons.add(
          IRButton(
            id: uuid.v4(),
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
            id: uuid.v4(),
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

class _ProntoParsed {
  final int frequencyHz;
  final String rawDurations;
  const _ProntoParsed({required this.frequencyHz, required this.rawDurations});
}

_ProntoParsed? _tryParseProntoHexToRaw(String payload) {
  final cleaned = payload.replaceAll('\r', ' ').replaceAll('\n', ' ').trim();
  if (cleaned.isEmpty) return null;

  final tokens = cleaned.split(RegExp(r'\s+')).where((e) => e.isNotEmpty).toList();
  if (tokens.length < 6) return null;

  bool looksHex = true;
  for (final t in tokens.take(4)) {
    if (!RegExp(r'^[0-9A-Fa-f]{4}$').hasMatch(t)) {
      looksHex = false;
      break;
    }
  }
  if (!looksHex) return null;

  final List<int> words = <int>[];
  for (final t in tokens) {
    final v = int.tryParse(t, radix: 16);
    if (v == null) return null;
    words.add(v);
  }

  final int type = words[0];
  final int freqWord = words[1];
  if (type != 0x0000 && type != 0x0100) return null;
  if (freqWord <= 0) return null;

  final int seq1 = words[2];
  final int seq2 = words[3];
  final int totalPairs = (seq1 + seq2) * 2;
  final int requiredWords = 4 + totalPairs;
  if (words.length < requiredWords) return null;

  final double carrierPeriodUs = freqWord * 0.241246;
  if (carrierPeriodUs <= 0) return null;

  final int freqHz = (1000000.0 / carrierPeriodUs).round().clamp(10000, 200000);
  final List<int> durations = <int>[];

  for (int i = 4; i < requiredWords; i++) {
    final int w = words[i];
    if (w <= 0) return null;
    final int us = (w * carrierPeriodUs).round();
    if (us <= 0) return null;
    durations.add(us);
  }

  if (durations.length < 6) return null;
  return _ProntoParsed(
    frequencyHz: freqHz,
    rawDurations: durations.join(' '),
  );
}

Remote? _parseIrplusXml(
  String content, {
  String? filename,
  required String remoteName,
  required String fallbackLabel,
}) {
  try {
    final doc = xml.XmlDocument.parse(content);
    final root = doc.rootElement;
    if (root.name.local.toLowerCase() != 'irplus') return null;

    final devices = root.findElements('device').toList();
    if (devices.isEmpty) return null;

    final device = devices.first;
    final format = (device.getAttribute('format') ?? '').trim().toUpperCase();

    final uuid = const Uuid();
    final List<IRButton> buttons = <IRButton>[];

    final String? protoFromFormat = _mapIrplusFormatToProtocol(format);

    for (final b in device.findElements('button')) {
      final isMacro = (b.getAttribute('macro') ?? '').toLowerCase() == 'true';
      if (isMacro) continue;

      final String label = _sanitizeIrplusLabel(
        rawLabel: b.getAttribute('label'),
        altLabel: b.getAttribute('alt'),
        fallbackLabel: fallbackLabel,
      );

      final String payload = b.innerText.trim();
      if (payload.isEmpty) continue;
      if (_isIrplusEmptyHex(payload)) continue;

      if (format.contains('RAW')) {
        final String? rawDurations = _normalizeRawDurations(payload);
        if (rawDurations != null) {
          buttons.add(
            IRButton(
              id: uuid.v4(),
              code: null,
              rawData: rawDurations,
              frequency: 38000,
              image: label,
              isImage: false,
            ),
          );
        }
        continue;
      }

      final pairMatch = RegExp(r'^0x([0-9A-Fa-f]+)\s+0x([0-9A-Fa-f]+)$').firstMatch(payload);
      if (pairMatch != null) {
        final int addr16 = int.parse(pairMatch.group(1)!, radix: 16) & 0xFFFF;
        final int cmd16 = int.parse(pairMatch.group(2)!, radix: 16) & 0xFFFF;
        final String lircHex = _lircHexFromAddrCmdExplicit(addr16, cmd16);
        final String protocol = protoFromFormat ?? 'nec';

        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: int.parse(lircHex, radix: 16),
            rawData: null,
            frequency: null,
            image: label,
            isImage: false,
            protocol: protocol,
            protocolParams: <String, dynamic>{'hex': lircHex},
          ),
        );
        continue;
      }

      final _ProntoParsed? pronto = _tryParseProntoHexToRaw(payload);
      if (pronto != null) {
        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: pronto.rawDurations,
            frequency: pronto.frequencyHz,
            image: label,
            isImage: false,
          ),
        );
        continue;
      }

      final String? rawDurations = _normalizeRawDurations(payload);
      if (rawDurations != null) {
        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: rawDurations,
            frequency: 38000,
            image: label,
            isImage: false,
          ),
        );
      }
    }

    if (buttons.isEmpty) return null;

    return Remote(
      name: remoteName,
      useNewStyle: true,
      buttons: buttons,
    );
  } catch (_) {
    return null;
  }
}

String _sanitizeIrplusLabel({
  String? rawLabel,
  String? altLabel,
  required String fallbackLabel,
}) {
  String s = (rawLabel ?? '').replaceAll('\r', '\n');
  s = s
      .split('\n')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .join(' ');
  s = s.trim();

  if (s.isEmpty || RegExp(r'^_+$').hasMatch(s)) {
    String a = (altLabel ?? '').replaceAll('\r', '\n');
    a = a
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .join(' ');
    a = a.trim();
    if (a.isNotEmpty) return a;
    return fallbackLabel;
  }

  return s;
}

bool _isIrplusEmptyHex(String payload) {
  final p = payload.trim().toLowerCase();
  if (!p.startsWith('0x')) return false;
  final hex = p.replaceAll(RegExp(r'[^0-9a-f]'), '');
  if (hex.isEmpty) return true;
  return RegExp(r'^0+$').hasMatch(hex);
}

String? _normalizeRawDurations(String payload) {
  final cleaned = payload.replaceAll('\r', ' ').replaceAll('\n', ' ').trim();
  if (!RegExp(r'^[0-9\s]+$').hasMatch(cleaned)) return null;

  final parts = cleaned.split(RegExp(r'\s+')).where((e) => e.isNotEmpty).toList();
  if (parts.length < 6) return null;

  for (final p in parts) {
    final v = int.tryParse(p);
    if (v == null || v <= 0) return null;
  }

  return parts.join(' ');
}

String? _mapIrplusFormatToProtocol(String formatUpper) {
  final f = formatUpper.trim().toUpperCase();
  if (f.contains('RC5')) return 'rc5';
  if (f.contains('RC6')) return 'rc6';
  if (f.contains('NRC17')) return 'nrc17';
  if (f.contains('XSAT') || f.contains('MITSUBISHI')) return 'xsat';
  if (f.contains('NEC2')) return 'nec2';
  if (f.contains('NECX') || f.contains('NECEXT')) return 'necx1';
  if (f.contains('NEC')) return 'nec';
  if (f.contains('SPACEENC')) return 'nec';
  return null;
}

String _lircHexFromAddrCmdExplicit(int addr16, int cmd16) {
  final int a1 = (addr16 >> 8) & 0xFF;
  final int a2 = addr16 & 0xFF;
  final int c1 = (cmd16 >> 8) & 0xFF;
  final int c2 = cmd16 & 0xFF;

  return a1.toRadixString(16).padLeft(2, '0').toUpperCase() +
      a2.toRadixString(16).padLeft(2, '0').toUpperCase() +
      c1.toRadixString(16).padLeft(2, '0').toUpperCase() +
      c2.toRadixString(16).padLeft(2, '0').toUpperCase();
}

int _bitReverse(int x) {
  return int.parse(
    x.toRadixString(2).padLeft(8, '0').split('').reversed.join(),
    radix: 2,
  );
}

Remote? _parseLircConfig(
  String content, {
  required String remoteName,
  required String fallbackLabel,
}) {
  final String normalized = content.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
  final uuid = const Uuid();

  final remoteBlocks = RegExp(
    r'begin\s+remote(.*?)end\s+remote',
    caseSensitive: false,
    dotAll: true,
  )
      .allMatches(normalized)
      .map((m) => m.group(1) ?? '')
      .where((s) => s.trim().isNotEmpty)
      .toList();

  if (remoteBlocks.isEmpty) return null;

  final List<IRButton> buttons = <IRButton>[];

  for (final blockRaw in remoteBlocks) {
    final block = blockRaw;

    final lircRemoteName = RegExp(
      r'^\s*name\s+(.+?)\s*$',
      multiLine: true,
      caseSensitive: false,
    ).firstMatch(block)?.group(1)?.trim();

    final String prefix =
        (remoteBlocks.length > 1 && lircRemoteName != null && lircRemoteName.isNotEmpty)
            ? '${lircRemoteName}_'
            : '';

    final int frequency = _lircReadInt(block, 'frequency') ?? 38000;
    final String flags = _lircReadString(block, 'flags') ?? '';

    final rawSection = RegExp(
      r'begin\s+raw_codes(.*?)end\s+raw_codes',
      caseSensitive: false,
      dotAll: true,
    ).firstMatch(block)?.group(1);

    if (rawSection != null && rawSection.trim().isNotEmpty) {
      final rawButtons = _parseLircRawCodesSection(rawSection);

      for (final rb in rawButtons) {
        final String label = _sanitizeLircButtonLabel(
          prefix + rb.name,
          fallbackLabel: fallbackLabel,
        );
        final String? rawData = _normalizeRawDurations(rb.durations.join(' '));
        if (rawData == null) continue;

        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: rawData,
            frequency: frequency,
            image: label,
            isImage: false,
          ),
        );
      }
      continue;
    }

    final codesSection = RegExp(
      r'begin\s+codes(.*?)end\s+codes',
      caseSensitive: false,
      dotAll: true,
    ).firstMatch(block)?.group(1);

    if (codesSection == null || codesSection.trim().isEmpty) {
      continue;
    }

    final int? bits = _lircReadInt(block, 'bits');
    final int? preBits = _lircReadInt(block, 'pre_data_bits');
    final int? postBits = _lircReadInt(block, 'post_data_bits');

    final BigInt? preData = _lircReadBigInt(block, 'pre_data');
    final BigInt? postData = _lircReadBigInt(block, 'post_data');

    final List<int>? header = _lircReadPair(block, 'header');
    final List<int>? one = _lircReadPair(block, 'one');
    final List<int>? zero = _lircReadPair(block, 'zero');

    final int? ptrail = _lircReadInt(block, 'ptrail');
    final int? gap = _lircReadInt(block, 'gap');

    final parsedCodes = _parseLircCodesSection(codesSection);

    for (final c in parsedCodes) {
      final String label = _sanitizeLircButtonLabel(
        prefix + c.name,
        fallbackLabel: fallbackLabel,
      );

      final String? raw = _encodeLircSpaceEncToRaw(
        flags: flags,
        header: header,
        one: one,
        zero: zero,
        ptrail: ptrail,
        gap: gap,
        preDataBits: preBits,
        preData: preData,
        codeBits: bits,
        code: c.value,
        postDataBits: postBits,
        postData: postData,
      );

      if (raw != null) {
        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: raw,
            frequency: frequency,
            image: label,
            isImage: false,
          ),
        );
      } else {
        final String? inferredProto = _inferLircProtocolId(
          flags: flags,
          remoteName: lircRemoteName,
          header: header,
          one: one,
          zero: zero,
          codeBits: bits,
        );
        final IRButton? mapped = _buildProtocolButtonFromLircCode(
          id: uuid.v4(),
          label: label,
          frequency: frequency,
          protocolId: inferredProto,
          value: c.value,
          codeBits: bits,
        );
        if (mapped != null) {
          buttons.add(mapped);
          continue;
        }
        buttons.add(
          IRButton(
            id: uuid.v4(),
            code: c.value.toInt(),
            rawData: null,
            frequency: null,
            image: label,
            isImage: false,
          ),
        );
      }
    }
  }

  if (buttons.isEmpty) return null;

  return Remote(
    name: remoteName,
    useNewStyle: true,
    buttons: buttons,
  );
}

String? _inferLircProtocolId({
  required String flags,
  required String? remoteName,
  required List<int>? header,
  required List<int>? one,
  required List<int>? zero,
  required int? codeBits,
}) {
  final String f = flags.toUpperCase();
  if (f.contains('RC5')) return 'rc5';
  if (f.contains('RC6')) return 'rc6';
  if (f.contains('NRC17')) return 'nrc17';
  if (f.contains('XSAT') || f.contains('MITSUBISHI')) return 'xsat';

  final String n = (remoteName ?? '').trim().toUpperCase();
  final bool nameSony = n.contains('SONY') || n.contains('SIRC');
  final bool nameJvc = n.contains('JVC');
  final bool nameXsat = n.contains('XSAT') || n.contains('MITSUBISHI');
  final bool nameSamsung = n.contains('SAMSUNG');
  final bool nameNec2 = n.contains('NEC2');
  final bool nameNecx = n.contains('NECX') || n.contains('NECEXT');

  final int bits = codeBits ?? 0;
  if (nameSony || _looksSony(header)) {
    if (bits == 12) return 'sony12';
    if (bits == 15) return 'sony15';
    if (bits == 20) return 'sony20';
  }
  if (nameJvc || _looksJvc(header)) return 'jvc';
  if (nameXsat || _looksXsat(header, one, zero, bits)) return 'xsat';
  if (nameSamsung || _looksSamsung(header)) {
    if (bits == 36) return 'samsung36';
    if (bits == 32) return 'samsung32';
  }
  if (_looksNecLike(header, one, zero, bits)) {
    if (nameNec2) return 'nec2';
    if (nameNecx) return 'necx1';
    return 'nec';
  }

  return null;
}

bool _within(int v, int target, int tol) => (v - target).abs() <= tol;

bool _looksSony(List<int>? header) {
  if (header == null || header.length != 2) return false;
  return _within(header[0], 2400, 700) && _within(header[1], 600, 300);
}

bool _looksJvc(List<int>? header) {
  if (header == null || header.length != 2) return false;
  return _within(header[0], 8400, 1800) && _within(header[1], 4200, 1200);
}

bool _looksSamsung(List<int>? header) {
  if (header == null || header.length != 2) return false;
  return _within(header[0], 4500, 1300) && _within(header[1], 4500, 1300);
}

bool _looksXsat(List<int>? header, List<int>? one, List<int>? zero, int bits) {
  if (bits != 16) return false;
  if (header == null || one == null || zero == null) return false;
  if (header.length != 2 || one.length != 2 || zero.length != 2) return false;
  final bool headerLike = _within(header[0], 8000, 1800) && _within(header[1], 4000, 1200);
  final bool marksLike = _within(one[0], 526, 200) && _within(zero[0], 526, 200);
  final bool total0Like = _within(zero[0] + zero[1], 1000, 300);
  final bool total1Like = _within(one[0] + one[1], 2000, 400);
  return headerLike && marksLike && total0Like && total1Like;
}

bool _looksNecLike(List<int>? header, List<int>? one, List<int>? zero, int bits) {
  if (bits < 24) return false;
  if (header == null || one == null || zero == null) return false;
  if (header.length != 2 || one.length != 2 || zero.length != 2) return false;

  final bool headerLike = _within(header[0], 9000, 1800) && _within(header[1], 4500, 1200);
  final bool marksLike = _within(one[0], 560, 220) && _within(zero[0], 560, 220);
  final bool spacesLike = (one[1] - zero[1]).abs() >= 500;
  return headerLike && marksLike && spacesLike;
}

IRButton? _buildProtocolButtonFromLircCode({
  required String id,
  required String label,
  required int frequency,
  required String? protocolId,
  required BigInt value,
  required int? codeBits,
}) {
  if (protocolId == null) return null;

  if (protocolId == 'rc5') {
    final String hex = _lircRc5PayloadHex(value: value, codeBits: codeBits);
    return IRButton(
      id: id,
      code: null,
      rawData: null,
      frequency: frequency,
      image: label,
      isImage: false,
      protocol: 'rc5',
      protocolParams: <String, dynamic>{'hex': hex},
    );
  }

  if (protocolId == 'rc6') {
    final String hex = _lircRc6PayloadHex(value: value, codeBits: codeBits);
    return IRButton(
      id: id,
      code: null,
      rawData: null,
      frequency: frequency,
      image: label,
      isImage: false,
      protocol: 'rc6',
      protocolParams: <String, dynamic>{'hex': hex},
    );
  }

  if (protocolId == 'nrc17') {
    final int n = value.toInt() & 0xFFFF;
    final int command = n & 0xFF;
    final int address = (n >> 8) & 0x0F;
    final int subcode = (n >> 12) & 0x0F;
    final String hex = command.toRadixString(16).padLeft(2, '0').toUpperCase() +
        address.toRadixString(16).toUpperCase() +
        subcode.toRadixString(16).toUpperCase();
    return IRButton(
      id: id,
      code: null,
      rawData: null,
      frequency: frequency,
      image: label,
      isImage: false,
      protocol: 'nrc17',
      protocolParams: <String, dynamic>{'hex': hex},
    );
  }

  final int n = value.toInt();
  final int bitCount = (codeBits ?? 0).clamp(1, 63).toInt();
  final int masked = (codeBits != null && codeBits > 0) ? (n & ((1 << bitCount) - 1)) : n;

  if (protocolId == 'xsat') {
    final int data = masked & 0xFFFF;
    final int address = data & 0xFF;
    final int command = (data >> 8) & 0xFF;
    return IRButton(
      id: id,
      code: null,
      rawData: null,
      frequency: frequency,
      image: label,
      isImage: false,
      protocol: 'xsat',
      protocolParams: <String, dynamic>{
        'address': address.toRadixString(16).padLeft(2, '0').toUpperCase(),
        'command': command.toRadixString(16).padLeft(2, '0').toUpperCase(),
      },
    );
  }

  if (protocolId == 'sony12') {
    final int data = masked & 0x0FFF;
    final int cmd = data & 0x7F;
    final int addr = (data >> 7) & 0x1F;
    return IRButton(
      id: id,
      code: null,
      rawData: null,
      frequency: frequency,
      image: label,
      isImage: false,
      protocol: 'sony12',
      protocolParams: <String, dynamic>{
        'address': addr.toRadixString(16).toUpperCase(),
        'command': cmd.toRadixString(16).toUpperCase(),
      },
    );
  }

  if (protocolId == 'sony15') {
    final int data = masked & 0x7FFF;
    final int cmd = data & 0x7F;
    final int addr = (data >> 7) & 0xFF;
    return IRButton(
      id: id,
      code: null,
      rawData: null,
      frequency: frequency,
      image: label,
      isImage: false,
      protocol: 'sony15',
      protocolParams: <String, dynamic>{
        'address': addr.toRadixString(16).padLeft(2, '0').toUpperCase(),
        'command': cmd.toRadixString(16).toUpperCase(),
      },
    );
  }

  if (protocolId == 'sony20') {
    final int data = masked & 0xFFFFF;
    final int cmd = data & 0x7F;
    final int addr = (data >> 7) & 0x1FFF;
    return IRButton(
      id: id,
      code: null,
      rawData: null,
      frequency: frequency,
      image: label,
      isImage: false,
      protocol: 'sony20',
      protocolParams: <String, dynamic>{
        'address': addr.toRadixString(16).toUpperCase(),
        'command': cmd.toRadixString(16).toUpperCase(),
      },
    );
  }

  if (protocolId == 'jvc') {
    final String hex = (masked & 0xFFFF).toRadixString(16).padLeft(4, '0').toUpperCase();
    return IRButton(
      id: id,
      code: null,
      rawData: null,
      frequency: frequency,
      image: label,
      isImage: false,
      protocol: 'jvc',
      protocolParams: <String, dynamic>{'hex': hex},
    );
  }

  if (protocolId == 'samsung32') {
    final int data = masked & 0xFFFFFFFF;
    final int addr = data & 0xFF;
    final int cmd = (data >> 16) & 0xFF;
    return IRButton(
      id: id,
      code: null,
      rawData: null,
      frequency: frequency,
      image: label,
      isImage: false,
      protocol: 'samsung32',
      protocolParams: <String, dynamic>{
        'address': addr.toRadixString(16).padLeft(2, '0').toUpperCase(),
        'command': cmd.toRadixString(16).padLeft(2, '0').toUpperCase(),
      },
    );
  }

  if (protocolId == 'samsung36') {
    final int core28 = masked & 0x0FFFFFFF;
    final String hex = core28.toRadixString(16).padLeft(7, '0').toUpperCase();
    return IRButton(
      id: id,
      code: null,
      rawData: null,
      frequency: frequency,
      image: label,
      isImage: false,
      protocol: 'samsung36',
      protocolParams: <String, dynamic>{'hex': hex},
    );
  }

  if (protocolId == 'nec' || protocolId == 'nec2' || protocolId == 'necx1') {
    final String hex = (masked & 0xFFFFFFFF).toRadixString(16).padLeft(8, '0').toUpperCase();
    return IRButton(
      id: id,
      code: null,
      rawData: null,
      frequency: frequency,
      image: label,
      isImage: false,
      protocol: protocolId,
      protocolParams: <String, dynamic>{'hex': hex},
    );
  }

  return null;
}

String _lircRc5PayloadHex({
  required BigInt value,
  required int? codeBits,
}) {
  final int n = value.toInt();
  final int bitCount = (codeBits ?? 0).clamp(1, 63).toInt();
  final int masked = (codeBits != null && codeBits > 0)
      ? (n & ((1 << bitCount) - 1))
      : n;
  final int payload11 = masked & 0x7FF;
  return payload11.toRadixString(16).toUpperCase();
}

String _lircRc6PayloadHex({
  required BigInt value,
  required int? codeBits,
}) {
  final int n = value.toInt();
  final int bitCount = (codeBits ?? 0).clamp(1, 63).toInt();
  final int masked = (codeBits != null && codeBits > 0)
      ? (n & ((1 << bitCount) - 1))
      : n;
  final int payload16 = masked & 0xFFFF;
  return payload16.toRadixString(16).padLeft(4, '0').toUpperCase();
}

class _LircRawButton {
  final String name;
  final List<int> durations;
  const _LircRawButton({required this.name, required this.durations});
}

class _LircCodeEntry {
  final String name;
  final BigInt value;
  const _LircCodeEntry({required this.name, required this.value});
}

List<_LircRawButton> _parseLircRawCodesSection(String section) {
  final String s = section.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
  final nameRegex = RegExp(
    r'^\s*name\s+(.+?)\s*$',
    multiLine: true,
    caseSensitive: false,
  );

  final matches = nameRegex.allMatches(s).toList();
  if (matches.isEmpty) return const <_LircRawButton>[];

  final List<_LircRawButton> out = <_LircRawButton>[];

  for (int i = 0; i < matches.length; i++) {
    final current = matches[i];
    final String name = (current.group(1) ?? '').trim();
    if (name.isEmpty) continue;

    final int start = current.end;
    final int end = (i + 1 < matches.length) ? matches[i + 1].start : s.length;
    if (end <= start) continue;

    final String chunk = s.substring(start, end);
    final nums = RegExp(r'\d+')
        .allMatches(chunk)
        .map((m) => int.tryParse(m.group(0) ?? '') ?? 0)
        .where((v) => v > 0)
        .toList();

    if (nums.length < 6) continue;
    out.add(_LircRawButton(name: name, durations: nums));
  }

  return out;
}

List<_LircCodeEntry> _parseLircCodesSection(String section) {
  final String s = section.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
  final lines = s.split('\n');

  final List<_LircCodeEntry> out = <_LircCodeEntry>[];

  for (final lineRaw in lines) {
    final String line = lineRaw.split('#').first.trim();
    if (line.isEmpty) continue;

    final m = RegExp(r'^\s*(\S+)\s+(\S+)\s*$', caseSensitive: false).firstMatch(line);
    if (m == null) continue;

    final String name = (m.group(1) ?? '').trim();
    final String vStr = (m.group(2) ?? '').trim();
    if (name.isEmpty || vStr.isEmpty) continue;

    final BigInt? v = _parseBigIntLoose(vStr);
    if (v == null) continue;

    out.add(_LircCodeEntry(name: name, value: v));
  }

  return out;
}

String _sanitizeLircButtonLabel(String label, {required String fallbackLabel}) {
  String s = label.replaceAll('\r', ' ').replaceAll('\n', ' ').trim();
  if (s.isEmpty) return fallbackLabel;
  s = s.replaceAll(RegExp(r'\s+'), ' ');
  return s;
}

String? _encodeLircSpaceEncToRaw({
  required String flags,
  required List<int>? header,
  required List<int>? one,
  required List<int>? zero,
  required int? ptrail,
  required int? gap,
  required int? preDataBits,
  required BigInt? preData,
  required int? codeBits,
  required BigInt code,
  required int? postDataBits,
  required BigInt? postData,
}) {
  final String f = flags.toUpperCase();
  if (!f.contains('SPACE_ENC')) return null;

  if (one == null || zero == null) return null;
  if (one.length != 2 || zero.length != 2) return null;
  if (codeBits == null || codeBits <= 0) return null;

  final List<int> pat = <int>[];

  if (header != null && header.length == 2) {
    if (header[0] > 0 && header[1] > 0) {
      pat.add(header[0]);
      pat.add(header[1]);
    }
  }

  final bool lsbFirst = _lircShouldUseLsbFirst(
    flags: f,
    header: header,
    one: one,
    zero: zero,
    codeBits: codeBits,
  );

  if (preDataBits != null && preDataBits > 0 && preData != null) {
    _appendSpaceEncBits(
      pat: pat,
      value: preData,
      bits: preDataBits,
      one: one,
      zero: zero,
      lsbFirst: lsbFirst,
    );
  }

  _appendSpaceEncBits(
    pat: pat,
    value: code,
    bits: codeBits,
    one: one,
    zero: zero,
    lsbFirst: lsbFirst,
  );

  if (postDataBits != null && postDataBits > 0 && postData != null) {
    _appendSpaceEncBits(
      pat: pat,
      value: postData,
      bits: postDataBits,
      one: one,
      zero: zero,
      lsbFirst: lsbFirst,
    );
  }

  if (ptrail != null && ptrail > 0) {
    pat.add(ptrail);
  }

  final int gapUs = (gap != null && gap > 0) ? gap : 0;
  if (gapUs > 0) {
    _appendOff(pat, gapUs);
  } else {
    if (pat.isNotEmpty && pat.length.isOdd) {
      _appendOff(pat, 10000);
    }
  }

  if (pat.length < 6) return null;

  for (final v in pat) {
    if (v <= 0) return null;
  }

  return pat.join(' ');
}

bool _lircShouldUseLsbFirst({
  required String flags,
  required List<int>? header,
  required List<int>? one,
  required List<int>? zero,
  required int codeBits,
}) {
  if (flags.contains('REVERSE')) return true;

  if (header == null || one == null || zero == null) return false;
  if (header.length != 2 || one.length != 2 || zero.length != 2) return false;

  final int hm = header[0];
  final int hs = header[1];
  final int om = one[0];
  final int os = one[1];
  final int zm = zero[0];
  final int zs = zero[1];

  final bool headerLikeNec = hm >= 8000 && hm <= 10000 && hs >= 3500 && hs <= 5500;
  final bool marksLikeNec = (om >= 350 && om <= 800) && (zm >= 350 && zm <= 800) && (om - zm).abs() <= 250;
  final bool spacesDifferent = (os - zs).abs() >= 400;

  if (headerLikeNec && marksLikeNec && spacesDifferent && codeBits >= 8) {
    return true;
  }

  return false;
}

void _appendSpaceEncBits({
  required List<int> pat,
  required BigInt value,
  required int bits,
  required List<int> one,
  required List<int> zero,
  required bool lsbFirst,
}) {
  if (bits <= 0) return;

  final BigInt mask = (BigInt.one << bits) - BigInt.one;
  final BigInt v = value & mask;

  for (int i = 0; i < bits; i++) {
    final int shift = lsbFirst ? i : (bits - 1 - i);
    final bool isOne = ((v >> shift) & BigInt.one) == BigInt.one;

    final List<int> pair = isOne ? one : zero;
    final int mark = pair[0];
    final int space = pair[1];

    if (mark > 0 && space > 0) {
      pat.add(mark);
      pat.add(space);
    }
  }
}

void _appendOff(List<int> pat, int offUs) {
  if (offUs <= 0) return;
  if (pat.isEmpty) return;

  if (pat.length.isOdd) {
    pat.add(offUs);
  } else {
    pat[pat.length - 1] = pat[pat.length - 1] + offUs;
  }
}

int? _lircReadInt(String block, String key) {
  final m = RegExp(
    r'^\s*' + key + r'\s+([0-9]+)\s*$',
    multiLine: true,
    caseSensitive: false,
  ).firstMatch(block);

  if (m == null) return null;
  return int.tryParse(m.group(1) ?? '');
}

String? _lircReadString(String block, String key) {
  final m = RegExp(
    r'^\s*' + key + r'\s+(.+?)\s*$',
    multiLine: true,
    caseSensitive: false,
  ).firstMatch(block);

  if (m == null) return null;
  return (m.group(1) ?? '').trim();
}

List<int>? _lircReadPair(String block, String key) {
  final m = RegExp(
    r'^\s*' + key + r'\s+([0-9]+)\s+([0-9]+)\s*$',
    multiLine: true,
    caseSensitive: false,
  ).firstMatch(block);

  if (m == null) return null;

  final a = int.tryParse(m.group(1) ?? '');
  final b = int.tryParse(m.group(2) ?? '');
  if (a == null || b == null) return null;
  if (a <= 0 || b <= 0) return null;

  return <int>[a, b];
}

BigInt? _lircReadBigInt(String block, String key) {
  final m = RegExp(
    r'^\s*' + key + r'\s+(\S+)\s*$',
    multiLine: true,
    caseSensitive: false,
  ).firstMatch(block);

  if (m == null) return null;
  final s = (m.group(1) ?? '').trim();
  return _parseBigIntLoose(s);
}

BigInt? _parseBigIntLoose(String s) {
  final String v = s.trim();
  if (v.isEmpty) return null;

  try {
    if (v.startsWith('0x') || v.startsWith('0X')) {
      return BigInt.parse(v.substring(2), radix: 16);
    }
    return BigInt.parse(v);
  } catch (_) {
    return null;
  }
}

void _reassignIds(List<Remote> remotes) {
  for (int i = 0; i < remotes.length; i++) {
    remotes[i].id = i + 1;
  }
}
