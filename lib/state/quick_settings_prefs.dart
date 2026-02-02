import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum QuickTileType { power, mute, volumeUp, volumeDown }

class QuickSettingsPrefs {
  QuickSettingsPrefs._();

  static const String _favoritesKey = 'quick_settings_favorites_v1';
  static const String _tileKeyPrefix = 'quick_settings_tile_';

  static String _keyForTile(QuickTileType type) => '$_tileKeyPrefix${type.name}';

  static Future<QuickTileMapping?> loadMapping(QuickTileType type) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_keyForTile(type));
    if (raw == null || raw.trim().isEmpty) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return QuickTileMapping.fromJson(decoded.cast<String, dynamic>());
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveMapping(QuickTileType type, QuickTileMapping? mapping) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _keyForTile(type);
    if (mapping == null) {
      await prefs.remove(key);
      return;
    }
    await prefs.setString(key, jsonEncode(mapping.toJson()));
  }

  static Future<Map<QuickTileType, QuickTileMapping?>> loadAllMappings() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<QuickTileType, QuickTileMapping?> out = {};
    for (final t in QuickTileType.values) {
      final raw = prefs.getString(_keyForTile(t));
      if (raw == null || raw.trim().isEmpty) {
        out[t] = null;
        continue;
      }
      try {
        final decoded = jsonDecode(raw);
        if (decoded is! Map) {
          out[t] = null;
        } else {
          out[t] = QuickTileMapping.fromJson(decoded.cast<String, dynamic>());
        }
      } catch (_) {
        out[t] = null;
      }
    }
    return out;
  }

  static Future<List<QuickTileFavorite>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_favoritesKey);
    if (raw == null || raw.trim().isEmpty) return <QuickTileFavorite>[];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return <QuickTileFavorite>[];
      return decoded
          .whereType<Map>()
          .map((e) => QuickTileFavorite.fromJson(e.cast<String, dynamic>()))
          .toList();
    } catch (_) {
      return <QuickTileFavorite>[];
    }
  }

  static Future<void> saveFavorites(List<QuickTileFavorite> items) async {
    final prefs = await SharedPreferences.getInstance();
    final payload = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString(_favoritesKey, payload);
  }

  static Future<bool> isFavorite(String buttonId) async {
    final items = await loadFavorites();
    return items.any((e) => e.buttonId == buttonId);
  }

  static Future<void> addFavorite(QuickTileFavorite fav) async {
    final items = await loadFavorites();
    if (items.any((e) => e.buttonId == fav.buttonId)) return;
    items.add(fav);
    await saveFavorites(items);
  }

  static Future<void> removeFavorite(String buttonId) async {
    final items = await loadFavorites();
    items.removeWhere((e) => e.buttonId == buttonId);
    await saveFavorites(items);
  }
}

class QuickTileMapping {
  final String buttonId;
  final String title;
  final String subtitle;
  final int frequencyHz;
  final List<int> pattern;

  const QuickTileMapping({
    required this.buttonId,
    required this.title,
    required this.subtitle,
    required this.frequencyHz,
    required this.pattern,
  });

  Map<String, dynamic> toJson() => {
        'buttonId': buttonId,
        'title': title,
        'subtitle': subtitle,
        'frequencyHz': frequencyHz,
        'pattern': pattern,
      };

  factory QuickTileMapping.fromJson(Map<String, dynamic> json) {
    final rawPattern = json['pattern'];
    final List<int> pattern = (rawPattern is List)
        ? rawPattern
            .map((e) => e is int ? e : int.tryParse('$e') ?? 0)
            .where((e) => e > 0)
            .toList()
        : <int>[];
    return QuickTileMapping(
      buttonId: (json['buttonId'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      subtitle: (json['subtitle'] as String?) ?? '',
      frequencyHz: json['frequencyHz'] is int
          ? json['frequencyHz'] as int
          : int.tryParse('${json['frequencyHz']}') ?? 0,
      pattern: pattern,
    );
  }
}

class QuickTileFavorite {
  final String buttonId;
  final String title;
  final String subtitle;

  const QuickTileFavorite({
    required this.buttonId,
    required this.title,
    required this.subtitle,
  });

  Map<String, dynamic> toJson() => {
        'buttonId': buttonId,
        'title': title,
        'subtitle': subtitle,
      };

  factory QuickTileFavorite.fromJson(Map<String, dynamic> json) {
    return QuickTileFavorite(
      buttonId: (json['buttonId'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      subtitle: (json['subtitle'] as String?) ?? '',
    );
  }
}
