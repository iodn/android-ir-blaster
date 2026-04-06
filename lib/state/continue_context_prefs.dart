import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ValueNotifier<int> continueContextsRevision = ValueNotifier<int>(0);

void notifyContinueContextsChanged() {
  continueContextsRevision.value = continueContextsRevision.value + 1;
}

class ContinueContextsPrefs {
  ContinueContextsPrefs._();

  static const String _remoteKey = 'continue.last_remote.v1';
  static const String _macroKey = 'continue.last_macro.v1';
  static const String _irFinderKey = 'continue.last_ir_finder_hit.v1';
  static const String _universalPowerKey = 'continue.last_universal_power.v1';

  static Future<ContinueContextsSnapshot> load() async {
    final prefs = await SharedPreferences.getInstance();
    return ContinueContextsSnapshot(
      remote: _decodeRemote(prefs.getString(_remoteKey)),
      macro: _decodeMacro(prefs.getString(_macroKey)),
      irFinderHit: _decodeIrFinderHit(prefs.getString(_irFinderKey)),
      universalPower:
          _decodeUniversalPower(prefs.getString(_universalPowerKey)),
    );
  }

  static Future<void> saveLastRemote(Remote remote) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _remoteKey,
      jsonEncode(
        LastRemoteContext(
          remoteId: remote.id,
          remoteName: remote.name,
          buttonCount: remote.buttons.length,
          savedAt: DateTime.now(),
        ).toJson(),
      ),
    );
    notifyContinueContextsChanged();
  }

  static Future<void> saveLastMacro({
    required TimedMacro macro,
    required Remote remote,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _macroKey,
      jsonEncode(
        LastMacroContext(
          macroId: macro.id,
          macroName: macro.name,
          remoteName: remote.name,
          stepCount: macro.steps.length,
          savedAt: DateTime.now(),
        ).toJson(),
      ),
    );
    notifyContinueContextsChanged();
  }

  static Future<void> saveLastIrFinderHit(IrFinderHit hit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _irFinderKey,
      jsonEncode(
        LastIrFinderHitContext(
          protocolId: hit.protocolId,
          protocolName: hit.protocolName,
          code: hit.code,
          source: hit.source.name,
          brand: hit.dbBrand,
          model: hit.dbModel,
          label: hit.dbLabel,
          remoteId: hit.dbRemoteId,
          savedAt: DateTime.now(),
        ).toJson(),
      ),
    );
    notifyContinueContextsChanged();
  }

  static Future<void> saveLastUniversalPower({
    required String? brand,
    required String? model,
  }) async {
    final String? cleanBrand = brand?.trim();
    final String? cleanModel = model?.trim();
    if ((cleanBrand == null || cleanBrand.isEmpty) &&
        (cleanModel == null || cleanModel.isEmpty)) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _universalPowerKey,
      jsonEncode(
        LastUniversalPowerContext(
          brand: cleanBrand,
          model: cleanModel,
          savedAt: DateTime.now(),
        ).toJson(),
      ),
    );
    notifyContinueContextsChanged();
  }

  static LastRemoteContext? _decodeRemote(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return LastRemoteContext.fromJson(decoded.cast<String, dynamic>());
    } catch (_) {
      return null;
    }
  }

  static LastMacroContext? _decodeMacro(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return LastMacroContext.fromJson(decoded.cast<String, dynamic>());
    } catch (_) {
      return null;
    }
  }

  static LastIrFinderHitContext? _decodeIrFinderHit(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return LastIrFinderHitContext.fromJson(decoded.cast<String, dynamic>());
    } catch (_) {
      return null;
    }
  }

  static LastUniversalPowerContext? _decodeUniversalPower(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return LastUniversalPowerContext.fromJson(
          decoded.cast<String, dynamic>());
    } catch (_) {
      return null;
    }
  }
}

class ContinueContextsSnapshot {
  final LastRemoteContext? remote;
  final LastMacroContext? macro;
  final LastIrFinderHitContext? irFinderHit;
  final LastUniversalPowerContext? universalPower;

  const ContinueContextsSnapshot({
    required this.remote,
    required this.macro,
    required this.irFinderHit,
    required this.universalPower,
  });

  bool get isEmpty =>
      remote == null &&
      macro == null &&
      irFinderHit == null &&
      universalPower == null;
}

class LastRemoteContext {
  final int remoteId;
  final String remoteName;
  final int buttonCount;
  final DateTime savedAt;

  const LastRemoteContext({
    required this.remoteId,
    required this.remoteName,
    required this.buttonCount,
    required this.savedAt,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'remoteId': remoteId,
        'remoteName': remoteName,
        'buttonCount': buttonCount,
        'savedAt': savedAt.toIso8601String(),
      };

  factory LastRemoteContext.fromJson(Map<String, dynamic> json) {
    return LastRemoteContext(
      remoteId: json['remoteId'] is int
          ? json['remoteId'] as int
          : int.tryParse('${json['remoteId']}') ?? 0,
      remoteName: (json['remoteName'] as String?) ?? '',
      buttonCount: json['buttonCount'] is int
          ? json['buttonCount'] as int
          : int.tryParse('${json['buttonCount']}') ?? 0,
      savedAt: DateTime.tryParse((json['savedAt'] as String?) ?? '') ??
          DateTime.now(),
    );
  }
}

class LastMacroContext {
  final String macroId;
  final String macroName;
  final String remoteName;
  final int stepCount;
  final DateTime savedAt;

  const LastMacroContext({
    required this.macroId,
    required this.macroName,
    required this.remoteName,
    required this.stepCount,
    required this.savedAt,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'macroId': macroId,
        'macroName': macroName,
        'remoteName': remoteName,
        'stepCount': stepCount,
        'savedAt': savedAt.toIso8601String(),
      };

  factory LastMacroContext.fromJson(Map<String, dynamic> json) {
    return LastMacroContext(
      macroId: (json['macroId'] as String?) ?? '',
      macroName: (json['macroName'] as String?) ?? '',
      remoteName: (json['remoteName'] as String?) ?? '',
      stepCount: json['stepCount'] is int
          ? json['stepCount'] as int
          : int.tryParse('${json['stepCount']}') ?? 0,
      savedAt: DateTime.tryParse((json['savedAt'] as String?) ?? '') ??
          DateTime.now(),
    );
  }
}

class LastIrFinderHitContext {
  final String protocolId;
  final String protocolName;
  final String code;
  final String source;
  final String? brand;
  final String? model;
  final String? label;
  final int? remoteId;
  final DateTime savedAt;

  const LastIrFinderHitContext({
    required this.protocolId,
    required this.protocolName,
    required this.code,
    required this.source,
    required this.brand,
    required this.model,
    required this.label,
    required this.remoteId,
    required this.savedAt,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'protocolId': protocolId,
        'protocolName': protocolName,
        'code': code,
        'source': source,
        'brand': brand,
        'model': model,
        'label': label,
        'remoteId': remoteId,
        'savedAt': savedAt.toIso8601String(),
      };

  factory LastIrFinderHitContext.fromJson(Map<String, dynamic> json) {
    return LastIrFinderHitContext(
      protocolId: (json['protocolId'] as String?) ?? '',
      protocolName: (json['protocolName'] as String?) ?? '',
      code: (json['code'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      brand: (json['brand'] as String?)?.trim(),
      model: (json['model'] as String?)?.trim(),
      label: (json['label'] as String?)?.trim(),
      remoteId: json['remoteId'] is int
          ? json['remoteId'] as int
          : int.tryParse('${json['remoteId'] ?? ''}'),
      savedAt: DateTime.tryParse((json['savedAt'] as String?) ?? '') ??
          DateTime.now(),
    );
  }
}

class LastUniversalPowerContext {
  final String? brand;
  final String? model;
  final DateTime savedAt;

  const LastUniversalPowerContext({
    required this.brand,
    required this.model,
    required this.savedAt,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'brand': brand,
        'model': model,
        'savedAt': savedAt.toIso8601String(),
      };

  factory LastUniversalPowerContext.fromJson(Map<String, dynamic> json) {
    return LastUniversalPowerContext(
      brand: (json['brand'] as String?)?.trim(),
      model: (json['model'] as String?)?.trim(),
      savedAt: DateTime.tryParse((json['savedAt'] as String?) ?? '') ??
          DateTime.now(),
    );
  }
}
