import 'dart:convert';

import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IrFinderPrefs {
  IrFinderPrefs._();

  static const String sessionKey = 'finder.session.v1';

  static Future<void> saveSession(IrFinderSessionSnapshot snapshot) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(sessionKey, jsonEncode(snapshot.toJson()));
    } catch (_) {}
  }

  static Future<IrFinderSessionSnapshot?> loadSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(sessionKey);
      if (raw == null || raw.trim().isEmpty) return null;
      final map = jsonDecode(raw);
      if (map is! Map) return null;
      return IrFinderSessionSnapshot.fromJson(Map<String, dynamic>.from(map as Map));
    } catch (_) {
      return null;
    }
  }

  static Future<void> clearSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(sessionKey);
    } catch (_) {}
  }
}

class IrFinderSessionSnapshot {
  final int v;
  final IrFinderMode mode;
  final String protocolId;

  final String? brand;
  final String? model;

  final int delayMs;
  final int maxKeysToTest;

  final int bruteMaxAttempts;
  final bool bruteAllCombinations;

  final String prefixRaw;
  final String kaseikyoVendor;

  final bool onlySelectedProtocol;
  final bool quickWinsFirst;

  final int attempted;
  final int currentOffset;

  final String bruteCursorHex;

  final int startedAtMs;
  final bool paused;

  const IrFinderSessionSnapshot({
    required this.v,
    required this.mode,
    required this.protocolId,
    required this.brand,
    required this.model,
    required this.delayMs,
    required this.maxKeysToTest,
    required this.bruteMaxAttempts,
    required this.bruteAllCombinations,
    required this.prefixRaw,
    required this.kaseikyoVendor,
    required this.onlySelectedProtocol,
    required this.quickWinsFirst,
    required this.attempted,
    required this.currentOffset,
    required this.bruteCursorHex,
    required this.startedAtMs,
    required this.paused,
  });

  DateTime? get startedAt =>
      startedAtMs <= 0 ? null : DateTime.fromMillisecondsSinceEpoch(startedAtMs);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'v': v,
      'mode': mode.name,
      'protocolId': protocolId,
      'brand': brand,
      'model': model,
      'delayMs': delayMs,
      'maxKeysToTest': maxKeysToTest,
      'bruteMaxAttempts': bruteMaxAttempts,
      'bruteAllCombinations': bruteAllCombinations,
      'prefixRaw': prefixRaw,
      'kaseikyoVendor': kaseikyoVendor,
      'onlySelectedProtocol': onlySelectedProtocol,
      'quickWinsFirst': quickWinsFirst,
      'attempted': attempted,
      'currentOffset': currentOffset,
      'bruteCursorHex': bruteCursorHex,
      'startedAtMs': startedAtMs,
      'paused': paused,
    };
  }

  static IrFinderSessionSnapshot fromJson(Map<String, dynamic> j) {
    final String modeRaw = (j['mode'] as String?)?.trim().toLowerCase() ?? 'bruteforce';
    final IrFinderMode mode =
        modeRaw == 'database' ? IrFinderMode.database : IrFinderMode.bruteforce;

    final String protocolId = (j['protocolId'] as String?)?.trim().toLowerCase() ?? 'nec';

    return IrFinderSessionSnapshot(
      v: (j['v'] as int?) ?? 1,
      mode: mode,
      protocolId: protocolId,
      brand: (j['brand'] as String?)?.trim(),
      model: (j['model'] as String?)?.trim(),
      delayMs: ((j['delayMs'] as int?) ?? 500).clamp(250, 20000),
      maxKeysToTest: ((j['maxKeysToTest'] as int?) ?? 200).clamp(1, 2147483647),
      bruteMaxAttempts: ((j['bruteMaxAttempts'] as int?) ?? 200).clamp(1, 2147483647),
      bruteAllCombinations: (j['bruteAllCombinations'] as bool?) ?? false,
      prefixRaw: (j['prefixRaw'] as String?) ?? '',
      kaseikyoVendor: ((j['kaseikyoVendor'] as String?) ?? '2002').toUpperCase(),
      onlySelectedProtocol: (j['onlySelectedProtocol'] as bool?) ?? true,
      quickWinsFirst: (j['quickWinsFirst'] as bool?) ?? true,
      attempted: ((j['attempted'] as int?) ?? 0).clamp(0, 2147483647),
      currentOffset: ((j['currentOffset'] as int?) ?? 0).clamp(0, 2147483647),
      bruteCursorHex: ((j['bruteCursorHex'] as String?) ?? '0').trim(),
      startedAtMs: ((j['startedAtMs'] as int?) ?? 0).clamp(0, 9223372036854775807),
      paused: (j['paused'] as bool?) ?? true,
    );
  }
}
