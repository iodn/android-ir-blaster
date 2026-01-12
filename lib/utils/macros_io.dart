import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

Future<Directory> _baseDir() async {
  try {
    return await getApplicationSupportDirectory();
  } catch (_) {
    return await getApplicationDocumentsDirectory();
  }
}

Future<File> _macrosFile() async {
  final dir = await _baseDir();
  await dir.create(recursive: true);
  return File('${dir.path}/macros.json');
}

Future<void> writeMacrosList(List<TimedMacro> macros) async {
  final file = await _macrosFile();
  final tmp = File('${file.path}.tmp');
  final payload = jsonEncode(macros.map((m) => m.copyWith(version: 1).toJson()).toList());
  await tmp.writeAsString(payload, flush: true);
  try {
    if (await file.exists()) {
      await file.delete();
    }
  } catch (_) {}
  await tmp.rename(file.path);
}

Future<List<TimedMacro>> readMacros() async {
  try {
    final file = await _macrosFile();
    if (!await file.exists()) return <TimedMacro>[];
    final contents = await file.readAsString();
    final decoded = jsonDecode(contents);
    if (decoded is! List) return <TimedMacro>[];
    return decoded.whereType<Map>().map((e) => TimedMacro.fromJson(e.cast<String, dynamic>())).toList();
  } catch (_) {
    return <TimedMacro>[];
  }
}

TimedMacro bindMacroToRemote(TimedMacro macro, Remote remote) {
  var changed = false;

  IRButton? findById(String? id) {
    final key = (id ?? '').trim();
    if (key.isEmpty) return null;
    try {
      return remote.buttons.firstWhere((b) => b.id == key);
    } catch (_) {
      return null;
    }
  }

  IRButton? findByRef(String? ref) {
    final key = normalizeButtonKey(ref ?? '');
    if (key.isEmpty) return null;
    try {
      return remote.buttons.firstWhere((b) => normalizeButtonKey(b.image) == key);
    } catch (_) {
      return null;
    }
  }

  final newSteps = <MacroStep>[];
  for (final s in macro.steps) {
    if (s.type != MacroStepType.send) {
      newSteps.add(s);
      continue;
    }

    final byId = findById(s.buttonId);
    if (byId != null) {
      if ((s.buttonRef ?? '').trim().isEmpty) {
        newSteps.add(s.copyWith(buttonRef: byId.image));
        changed = true;
      } else {
        newSteps.add(s);
      }
      continue;
    }

    final byRef = findByRef(s.buttonRef) ?? findByRef(s.buttonId);
    if (byRef != null) {
      newSteps.add(s.copyWith(buttonId: byRef.id, buttonRef: byRef.image));
      changed = true;
      continue;
    }

    newSteps.add(s);
  }

  if (!changed && macro.version >= 1) return macro;
  return macro.copyWith(steps: newSteps, version: 1);
}

Future<void> exportMacrosToDownloads(
  BuildContext context, {
  required List<TimedMacro> macros,
}) async {
  if (macros.isEmpty) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('No macros to export.')),
    );
    return;
  }

  final mediaStore = MediaStore();

  try {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'irblaster_macros_$timestamp.json';

    final payload = {
      'schema': 'irblaster.macros',
      'version': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'macros': macros.map((m) => m.copyWith(version: 1).toJson()).toList(),
    };

    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/$fileName';
    final tempFile = File(tempPath);
    await tempFile.writeAsString(jsonEncode(payload), flush: true);

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
      const SnackBar(content: Text('Macros exported to Downloads.')),
    );
  } catch (_) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Failed to export macros.')),
    );
  }
}

Future<List<TimedMacro>?> importMacrosFromPicker(BuildContext context) async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: const <String>['json'],
    withData: true,
  );
  if (result == null || result.files.isEmpty) return null;

  final pf = result.files.single;
  List<int>? bytes = pf.bytes;

  if (bytes == null) {
    final path = pf.path;
    if (path == null) {
      if (!context.mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to read file.')),
      );
      return null;
    }
    try {
      bytes = await File(path).readAsBytes();
    } catch (_) {
      if (!context.mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to read file.')),
      );
      return null;
    }
  }

  final contents = utf8.decode(bytes, allowMalformed: true);

  try {
    final decoded = jsonDecode(contents);

    List<dynamic>? macrosList;
    if (decoded is Map) {
      final inner = decoded['macros'];
      if (inner is List) macrosList = inner;
    } else if (decoded is List) {
      macrosList = decoded;
    }

    if (macrosList == null) {
      if (!context.mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid macro file format.')),
      );
      return null;
    }

    final imported = macrosList
        .whereType<Map>()
        .map((data) => TimedMacro.fromJson(data.cast<String, dynamic>()))
        .toList();

    return _regenerateMacroIds(imported);
  } catch (_) {
    if (!context.mounted) return null;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Failed to parse macro file.')),
    );
    return null;
  }
}

List<TimedMacro> _regenerateMacroIds(List<TimedMacro> macros) {
  final uuid = const Uuid();
  return macros.map((m) {
    final newSteps = m.steps.map((s) => s.copyWith(id: MacroStep.newId())).toList();
    return m.copyWith(
      id: uuid.v4(),
      steps: newSteps,
      version: 1,
    );
  }).toList();
}
