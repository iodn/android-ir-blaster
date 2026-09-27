import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import '../ir/ir_protocol_registry.dart';
import '../models/macro_step.dart';
import '../models/timed_macro.dart';
import '../utils/remote.dart';
import '../utils/remote_grid_layout.dart';
import 'package:uuid/uuid.dart';

/// A self-contained transfer, independent of the backup and on-disk formats.
class SharePackage {
  static const maxBytes = 8 * 1024 * 1024;
  static const qrLimit = 1200;
  static const qrPrefix = 'IRBLASTER:1:';
  final bool singleButton;
  final List<Remote> remotes;
  final List<TimedMacro> macros;
  final List<int> macroRemotes;
  final Map<String, Uint8List> images;
  bool _qrComputed = false;
  String? _qr;

  SharePackage(
      {required this.remotes,
      this.singleButton = false,
      this.macros = const [],
      this.macroRemotes = const [],
      this.images = const {}});

  bool get hardwareSpecific => remotes.any((r) => r.buttons.any((b) =>
      b.protocol == IrProtocolIds.lgeIrLearned ||
      (b.protocol?.endsWith('_learned') == true &&
          (b.protocolParams?['rawPreview'] as String? ?? '').isEmpty)));

  String encode() => jsonEncode({
        'schema': 'irblaster.share',
        'version': 1,
        'kind': singleButton ? 'button' : 'collection',
        'remotes': remotes.map((r) => r.toJson()).toList(),
        'macros': [
          for (var i = 0; i < macros.length; i++)
            {'remote': macroRemotes[i], 'macro': macros[i].toJson()}
        ],
        'images':
            images.map((key, value) => MapEntry(key, base64Encode(value))),
      });

  String? qrText() {
    if (_qrComputed) return _qr;
    final encoded =
        '$qrPrefix${base64UrlEncode(gzip.encode(utf8.encode(encode())))}';
    _qrComputed = true;
    return _qr = encoded.length <= qrLimit ? encoded : null;
  }

  static SharePackage decode(String text) {
    if (text.length > maxBytes) {
      throw const FormatException('Transfer too large');
    }
    if (text.startsWith(qrPrefix)) {
      if (text.length > qrLimit) throw const FormatException('QR too large');
      final sink = _LimitedBytes();
      final decoder = gzip.decoder.startChunkedConversion(sink);
      decoder.add(base64Url.decode(text.substring(qrPrefix.length)));
      decoder.close();
      text = utf8.decode(sink.bytes.takeBytes());
    }
    if (utf8.encode(text).length > maxBytes) {
      throw const FormatException('Transfer too large');
    }
    final value = jsonDecode(text);
    _checkTree(value, 0);
    if (value is! Map ||
        value['schema'] != 'irblaster.share' ||
        value['version'] != 1 ||
        !['button', 'collection'].contains(value['kind'])) {
      throw const FormatException('Unsupported share');
    }
    final rawRemotes = value['remotes'];
    final rawMacros = value['macros'];
    final rawImages = value['images'];
    if (rawRemotes is! List ||
        rawRemotes.isEmpty ||
        rawRemotes.length > 100 ||
        rawMacros is! List ||
        rawMacros.length > 100 ||
        rawImages is! Map ||
        rawImages.length > 2000) {
      throw const FormatException('Invalid collection');
    }
    final images = <String, Uint8List>{};
    for (final entry in rawImages.entries) {
      if (!RegExp(r'^shared:[0-9]+$').hasMatch(entry.key as String) ||
          entry.value is! String ||
          (entry.value as String).length > 1400000) {
        throw const FormatException('Invalid image');
      }
      final bytes = base64Decode(entry.value as String);
      if (bytes.isEmpty || bytes.length > 1024 * 1024) {
        throw const FormatException('Invalid image');
      }
      images[entry.key as String] = bytes;
    }
    final remotes = <Remote>[];
    var count = 0;
    for (final raw in rawRemotes) {
      if (raw is! Map ||
          raw['buttons'] is! List ||
          raw['name'] is! String ||
          (raw['name'] as String).length > 200) {
        throw const FormatException('Invalid remote');
      }
      final ids = <String>{};
      for (final item in raw['buttons'] as List) {
        if (++count > 2000 ||
            item is! Map ||
            item['id'] is! String ||
            (item['id'] as String).trim().isEmpty ||
            item['id'] != (item['id'] as String).trim() ||
            !ids.add(item['id'] as String)) {
          throw const FormatException('Invalid buttons');
        }
        final b = IRButton.fromJson(Map<String, dynamic>.from(item));
        if (b.id.isEmpty ||
            b.id.length > 200 ||
            b.image.length > 500 ||
            (b.iconCodePoint != null &&
                (b.iconCodePoint! < 0 || b.iconCodePoint! > 0x10ffff)) ||
            (b.protocolParams?['rawPreview'] != null &&
                b.protocolParams!['rawPreview'] is! String) ||
            (b.rawData?.length ?? 0) > 200000 ||
            (b.frequency != null &&
                (b.frequency! < 15000 || b.frequency! > 60000)) ||
            (b.protocol != null &&
                IrProtocolRegistry.definitionFor(b.protocol) == null) ||
            (b.rawData == null && b.code == null && b.protocol == null)) {
          throw const FormatException('Invalid signal');
        }
        if (b.isImage &&
            b.iconCodePoint == null &&
            !defaultImages.contains(b.image) &&
            !images.containsKey(b.image)) {
          throw const FormatException('Image is not included');
        }
      }
      final layout = raw['gridLayout'];
      if (layout != null) {
        if (layout is! Map ||
            layout['columns'] is! int ||
            layout['columns'] < 1 ||
            layout['columns'] > 6 ||
            layout['cells'] is! List ||
            (layout['cells'] as List).length > 4000 ||
            !RemoteButtonShape.values.any((s) => s.name == layout['shape'])) {
          throw const FormatException('Invalid layout');
        }
        final placed = <String>{};
        for (final cell in layout['cells']) {
          if (cell != null &&
              (cell is! String || !ids.contains(cell) || !placed.add(cell))) {
            throw const FormatException('Invalid layout reference');
          }
        }
      }
      remotes.add(Remote.fromJson(Map<String, dynamic>.from(raw)));
    }
    final macros = <TimedMacro>[];
    final owners = <int>[];
    for (final entry in rawMacros) {
      if (entry is! Map ||
          entry['remote'] is! int ||
          entry['remote'] < 0 ||
          entry['remote'] >= remotes.length ||
          entry['macro'] is! Map) {
        throw const FormatException('Invalid macro owner');
      }
      final owner = entry['remote'] as int;
      final raw = Map<String, dynamic>.from(entry['macro'] as Map);
      if (raw['version'] != 1 ||
          raw['name'] is! String ||
          (raw['name'] as String).length > 200 ||
          raw['steps'] is! List ||
          (raw['steps'] as List).length > 1000) {
        throw const FormatException('Invalid macro');
      }
      final buttons = remotes[owner].buttons.map((b) => b.id).toSet();
      // Validate before fromJson's legacy migration can change a reference.
      final steps = <MacroStep>[];
      for (final step in raw['steps']) {
        if (step is! Map ||
            !MacroStepType.values.any((t) => t.name == step['type'])) {
          throw const FormatException('Invalid macro step');
        }
        final type =
            MacroStepType.values.firstWhere((t) => t.name == step['type']);
        if (type == MacroStepType.send && !buttons.contains(step['buttonId'])) {
          throw const FormatException('Missing macro button');
        }
        if (type == MacroStepType.delay &&
            (step['delayMs'] is! int ||
                step['delayMs'] < 0 ||
                step['delayMs'] > 3600000)) {
          throw const FormatException('Invalid delay');
        }
        steps.add(MacroStep(
            id: const Uuid().v4(),
            type: type,
            buttonId:
                type == MacroStepType.send ? step['buttonId'] as String : null,
            delayMs:
                type == MacroStepType.delay ? step['delayMs'] as int : null));
      }
      macros.add(TimedMacro(
          id: const Uuid().v4(),
          name: raw['name'] as String,
          remoteName: remotes[owner].name,
          steps: steps));
      owners.add(owner);
    }
    final single = value['kind'] == 'button';
    if (single && (remotes.length != 1 || count != 1 || macros.isNotEmpty)) {
      throw const FormatException('Invalid button share');
    }
    return SharePackage(
        remotes: remotes,
        macros: macros,
        macroRemotes: owners,
        singleButton: single,
        images: images);
  }

  /// New IDs and unique names prevent overwriting existing items or binding a
  /// macro to an unrelated remote with the same name.
  SharePackage freshCopies(List<Remote> existing,
      List<TimedMacro> existingMacros, Map<String, String> imagePaths) {
    var nextId = existing.fold<int>(0, (n, r) => r.id > n ? r.id : n);
    final names = existing.map((r) => r.name).toSet();
    final macroNames = existingMacros.map((m) => m.name).toSet();
    String unique(String name, Set<String> used) {
      var result = name;
      var suffix = 2;
      while (!used.add(result)) {
        result = '$name (${suffix++})';
      }
      return result;
    }

    final maps = <Map<String, String>>[];
    final copies = <Remote>[];
    for (final remote in remotes) {
      final ids = {for (final b in remote.buttons) b.id: const Uuid().v4()};
      maps.add(ids);
      copies.add(Remote(
          id: ++nextId,
          name: unique(remote.name, names),
          useNewStyle: remote.useNewStyle,
          gridLayout: remote.gridLayout?.remap(ids),
          buttons: remote.buttons
              .map((b) => b.copyWith(
                  id: ids[b.id], image: imagePaths[b.image] ?? b.image))
              .toList()));
    }
    return SharePackage(
        remotes: copies,
        singleButton: singleButton,
        macroRemotes: macroRemotes,
        macros: [
          for (var i = 0; i < macros.length; i++)
            macros[i].copyWith(
                id: const Uuid().v4(),
                name: unique(macros[i].name, macroNames),
                remoteName: copies[macroRemotes[i]].name,
                steps: macros[i]
                    .steps
                    .map((s) => MacroStep(
                        id: const Uuid().v4(),
                        type: s.type,
                        buttonId: maps[macroRemotes[i]][s.buttonId],
                        delayMs: s.delayMs))
                    .toList())
        ]);
  }
}

void _checkTree(dynamic value, int depth) {
  if (depth > 16) throw const FormatException('Data is too deeply nested');
  if (value is Map) {
    for (final v in value.values) {
      _checkTree(v, depth + 1);
    }
  }
  if (value is List) {
    for (final v in value) {
      _checkTree(v, depth + 1);
    }
  }
}

class _LimitedBytes extends ByteConversionSinkBase {
  final bytes = BytesBuilder(copy: false);
  @override
  void add(List<int> chunk) {
    if (bytes.length + chunk.length > SharePackage.maxBytes) {
      throw const FormatException('Transfer too large');
    }
    bytes.add(chunk);
  }

  @override
  void close() {}
}
