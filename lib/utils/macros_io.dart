import 'dart:convert';
import 'dart:io';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:path_provider/path_provider.dart';

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

  final payload = jsonEncode(macros.map((m) => m.toJson()).toList());
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

    return decoded
        .whereType<Map>()
        .map((e) => TimedMacro.fromJson(e.cast<String, dynamic>()))
        .toList();
  } catch (_) {
    return <TimedMacro>[];
  }
}
