import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DeviceControlsPrefs {
  DeviceControlsPrefs._();

  static const String _key = 'device_controls_favorites_v1';

  static Future<List<DeviceControlFavorite>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.trim().isEmpty) return <DeviceControlFavorite>[];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return <DeviceControlFavorite>[];
      return decoded
          .whereType<Map>()
          .map((e) => DeviceControlFavorite.fromJson(e.cast<String, dynamic>()))
          .toList();
    } catch (_) {
      return <DeviceControlFavorite>[];
    }
  }

  static Future<void> save(List<DeviceControlFavorite> items) async {
    final prefs = await SharedPreferences.getInstance();
    final payload = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString(_key, payload);
  }

  static Future<bool> isFavorite(String buttonId) async {
    final items = await load();
    return items.any((e) => e.buttonId == buttonId);
  }

  static Future<void> add(DeviceControlFavorite fav) async {
    final items = await load();
    if (items.any((e) => e.buttonId == fav.buttonId)) return;
    items.add(fav);
    await save(items);
  }

  static Future<void> remove(String buttonId) async {
    final items = await load();
    items.removeWhere((e) => e.buttonId == buttonId);
    await save(items);
  }
}

class DeviceControlFavorite {
  final String buttonId;
  final String title;
  final String subtitle;

  const DeviceControlFavorite({
    required this.buttonId,
    required this.title,
    required this.subtitle,
  });

  Map<String, dynamic> toJson() => {
        'buttonId': buttonId,
        'title': title,
        'subtitle': subtitle,
      };

  factory DeviceControlFavorite.fromJson(Map<String, dynamic> json) {
    return DeviceControlFavorite(
      buttonId: (json['buttonId'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      subtitle: (json['subtitle'] as String?) ?? '',
    );
  }
}
