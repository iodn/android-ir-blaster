import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/macros_io.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

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
    const SnackBar(
      content: Text(
        'Storage permission denied (needed on some older Android devices).',
      ),
    ),
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
      const SnackBar(content: Text('Backup exported to Downloads.')),
    );
  }

  try {
    await doSave();
    return;
  } catch (_) {
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
        macros: null,
        message: 'Import failed: unable to read the selected file.',
      );
    }
    try {
      bytes = await File(path).readAsBytes();
    } catch (_) {
      return const ImportResult(
        remotes: <Remote>[],
        macros: null,
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
      macros: null,
      message: 'Unsupported file type selected.',
    );
  }

  final contents = utf8.decode(bytes, allowMalformed: true);

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
          message:
              'Imported ${importedRemotes.length} remotes from legacy JSON backup. Macros were not changed.',
        );
      }

      if (decoded is Map) {
        final hasRemotesKey = decoded.containsKey('remotes');
        final hasMacrosKey = decoded.containsKey('macros');

        final dynamic remotesRaw = decoded['remotes'];
        final dynamic macrosRaw = decoded['macros'];

        if (hasRemotesKey && remotesRaw is! List) {
          return const ImportResult(
            remotes: <Remote>[],
            macros: null,
            message:
                'Import failed: backup "remotes" must be a JSON list when present.',
          );
        }
        if (hasMacrosKey && macrosRaw is! List) {
          return const ImportResult(
            remotes: <Remote>[],
            macros: null,
            message:
                'Import failed: backup "macros" must be a JSON list when present.',
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
          return const ImportResult(
            remotes: <Remote>[],
            macros: null,
            message:
                'Import failed: invalid backup format (expected legacy List or Map with remotes/macros).',
          );
        }

        final rCount = importedRemotes.length;
        final mCount = importedMacros?.length ?? 0;

        return ImportResult(
          remotes: importedRemotes,
          macros: importedMacros,
          message: importedMacros == null
              ? 'Imported $rCount remotes from backup. Macros were not changed.'
              : 'Imported $rCount remotes and $mCount macros from backup.',
        );
      }

      return const ImportResult(
        remotes: <Remote>[],
        macros: null,
        message:
            'Import failed: invalid backup format (expected legacy List or Map with remotes/macros).',
      );
    }

    if (isIr) {
      final Remote? remoteFromIr = _parseFlipperIrFile(contents);
      if (remoteFromIr == null) {
        return const ImportResult(
          remotes: <Remote>[],
          macros: null,
          message: 'Import failed: no valid buttons found in .ir file.',
        );
      }

      final next = <Remote>[...current, remoteFromIr];
      _reassignIds(next);

      return ImportResult(
        remotes: next,
        macros: null,
        message: 'Imported 1 remote from Flipper .ir. Macros were not changed.',
      );
    }

    return const ImportResult(
      remotes: <Remote>[],
      macros: null,
      message: 'Unsupported file type selected.',
    );
  } catch (_) {
    return const ImportResult(
      remotes: <Remote>[],
      macros: null,
      message: 'Import failed: invalid or unreadable file.',
    );
  }
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
      return 'samsung36';
    case 'sirc':
      return 'sony12';
    case 'sirc15':
      return 'sony15';
    case 'sirc20':
      return 'sony20';
    default:
      return null;
  }
}

Remote? _parseFlipperIrFile(String content) {
  final uuid = const Uuid();
  final List<String> blocks = content.split('#');
  final List<IRButton> buttons = <IRButton>[];
  const String remoteName = 'Flipper IR Remote';

  for (String block in blocks) {
    block = block.trim();
    if (block.isEmpty) continue;

    if (block.contains('type: parsed')) {
      final protoMatch = RegExp(r'protocol:\s*(.+)').firstMatch(block);
      final protocolName = protoMatch?.group(1)?.trim();
      final mappedProtocol = _mapFlipperProtocol(protocolName);
      final nameMatch = RegExp(r'name:\s*(.+)').firstMatch(block);
      final addressMatch = RegExp(r'address:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})')
          .firstMatch(block);
      final commandMatch = RegExp(r'command:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})')
          .firstMatch(block);

      if (nameMatch != null && addressMatch != null && commandMatch != null) {
        final String name = nameMatch.group(1)!.trim();

        // If Flipper protocol says Kaseikyo, map to our Kaseikyo encoder with params.
        if (mappedProtocol == 'kaseikyo') {
          // Flipper parsed format provides 4 bytes for address and command. We only need first 2 for each.
          final fullAddr = RegExp(r'address:\s*(([0-9A-Fa-f]{2}\s+){3}[0-9A-Fa-f]{2})').firstMatch(block)?.group(1) ?? '';
          final fullCmd = RegExp(r'command:\s*(([0-9A-Fa-f]{2}\s+){3}[0-9A-Fa-f]{2})').firstMatch(block)?.group(1) ?? '';
          final List<String> addrBytes = fullAddr.trim().split(RegExp(r'\s+')).where((s) => s.isNotEmpty).toList();
          final List<String> cmdBytes = fullCmd.trim().split(RegExp(r'\s+')).where((s) => s.isNotEmpty).toList();

          if (addrBytes.length >= 4 && cmdBytes.length >= 4) {
            // Flipper Kaseikyo parsed fields observations:
            // address: [B0, V_LSB, V_MSB, A_MSB]
            // command: [CMD, CMD_HI, 00, 00]
            final int vLsb = int.parse(addrBytes[1], radix: 16) & 0xFF;
            final int vMsb = int.parse(addrBytes[2], radix: 16) & 0xFF;
            final String vendorHex = ((vMsb << 8) | vLsb)
                .toRadixString(16)
                .padLeft(4, '0')
                .toUpperCase();

            final int aMsb = int.parse(addrBytes[3], radix: 16) & 0xFF;
            final int aLsb = int.parse(addrBytes[0], radix: 16) & 0xFF;
            final int addrVal12 = ((aMsb << 8) | aLsb) & 0x0FFF;
            final String addressHex = addrVal12.toRadixString(16).padLeft(3, '0').toUpperCase();

            final String commandHex = cmdBytes[0].toUpperCase();

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
                  'vendor': vendorHex,
                  'address': addressHex,
                  'command': commandHex,
                },
              ),
            );
            continue;
          }
        }

        // If protocol maps to one of our structured encoders with hex field, capture params accordingly.
        // Protocol-specific structured mappings
        if (mappedProtocol != null && mappedProtocol == 'rc5') {
          // RC5: 5-bit address + 6-bit command => up to 11 bits -> up to 3 hex
          final int addr = int.parse(addressMatch.group(1)!, radix: 16) & 0x1F;
          final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0x3F;
          final int value = (addr << 6) | cmd;
          final String hex = value.toRadixString(16).toUpperCase();
          buttons.add(IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 36000,
            image: name,
            isImage: false,
            protocol: 'rc5',
            protocolParams: <String, dynamic>{'hex': hex},
          ));
        } else if (mappedProtocol == 'rc6') {
          // RC6: Use 16-bit payload = (address<<8)|command (last 4 hex used by encoder)
          final int addr = int.parse(addressMatch.group(1)!, radix: 16) & 0xFF;
          final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0xFF;
          final String hex = ((addr << 8) | cmd).toRadixString(16).padLeft(4, '0').toUpperCase();
          buttons.add(IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 36000,
            image: name,
            isImage: false,
            protocol: 'rc6',
            protocolParams: <String, dynamic>{'hex': hex},
          ));
        } else if (mappedProtocol == 'rca_38') {
          // RCA_38: 12 bits = high nibble + low byte => 3 hex = (addr&0xF)<<8 | cmd
          final int addr = int.parse(addressMatch.group(1)!, radix: 16) & 0x0F;
          final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0xFF;
          final String hex = (((addr << 8) | cmd) & 0xFFF).toRadixString(16).padLeft(3, '0').toUpperCase();
          buttons.add(IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 38700,
            image: name,
            isImage: false,
            protocol: 'rca_38',
            protocolParams: <String, dynamic>{'hex': hex},
          ));
        } else if (mappedProtocol == 'pioneer') {
          // Pioneer: build 32-bit as [addr,00,cmd,00]
          final String addrHex = int.parse(addressMatch.group(1)!, radix: 16).toRadixString(16).padLeft(2, '0').toUpperCase();
          final String cmdHex = int.parse(commandMatch.group(1)!, radix: 16).toRadixString(16).padLeft(2, '0').toUpperCase();
          final String hex32 = addrHex + '00' + cmdHex + '00';
          buttons.add(IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 40000,
            image: name,
            isImage: false,
            protocol: 'pioneer',
            protocolParams: <String, dynamic>{'hex': hex32},
          ));
        } else if (mappedProtocol == 'sony12') {
          // SIRC 12: 7-bit command + 5-bit address -> 12-bit value
          final int addr = int.parse(addressMatch.group(1)!, radix: 16) & 0x1F;
          final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0x7F;
          final String hex = (((addr << 7) | cmd) & 0xFFF).toRadixString(16).padLeft(3, '0').toUpperCase();
          buttons.add(IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 40000,
            image: name,
            isImage: false,
            protocol: 'sony12',
            protocolParams: <String, dynamic>{'hex': hex},
          ));
        } else if (mappedProtocol == 'sony15') {
          // SIRC 15: 7-bit command + 8-bit address -> 15-bit
          final int addr = int.parse(addressMatch.group(1)!, radix: 16) & 0xFF;
          final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0x7F;
          final String hex = (((addr << 7) | cmd) & 0x7FFF).toRadixString(16).padLeft(4, '0').toUpperCase();
          buttons.add(IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 40000,
            image: name,
            isImage: false,
            protocol: 'sony15',
            protocolParams: <String, dynamic>{'hex': hex},
          ));
        } else if (mappedProtocol == 'sony20') {
          // SIRC 20: 7-bit command + 5-bit extended(assume 0) + 8-bit address -> 20-bit
          final int addr = int.parse(addressMatch.group(1)!, radix: 16) & 0xFF;
          final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0x7F;
          final int extended = 0;
          final int value = ((addr & 0xFF) << 12) | ((extended & 0x1F) << 7) | (cmd & 0x7F);
          final String hex = value.toRadixString(16).padLeft(5, '0').toUpperCase();
          buttons.add(IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 40000,
            image: name,
            isImage: false,
            protocol: 'sony20',
            protocolParams: <String, dynamic>{'hex': hex},
          ));
        } else if (mappedProtocol == 'samsung36') {
          // Samsung36 expects 7 hex [A(2),B(2),C(1),D(2)] and internally inverts D.
          // Heuristic: A=addr, B=~addr, C=0, D=cmd.
          final int addr = int.parse(addressMatch.group(1)!, radix: 16) & 0xFF;
          final int invAddr = (~addr) & 0xFF;
          final int cmd = int.parse(commandMatch.group(1)!, radix: 16) & 0xFF;
          final String hex = addr.toRadixString(16).padLeft(2, '0').toUpperCase() +
              invAddr.toRadixString(16).padLeft(2, '0').toUpperCase() +
              '0' +
              cmd.toRadixString(16).padLeft(2, '0').toUpperCase();
          buttons.add(IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: 38000,
            image: name,
            isImage: false,
            protocol: 'samsung36',
            protocolParams: <String, dynamic>{'hex': hex},
          ));
        } else if (mappedProtocol != null && (mappedProtocol == 'nec' || mappedProtocol == 'nec2' || mappedProtocol == 'necx1')) {
          // For these protocols, Flipper provides first two bytes for address/command; we can combine as hex if needed.
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
              protocolParams: <String, dynamic>{
                'hex': hexCode,
              },
            ),
          );
        } else {
          // Fallback legacy: interpret as NEC-like 32-bit code only
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
