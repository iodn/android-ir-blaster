import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ValueNotifier<int> remoteHighlightsRevision = ValueNotifier<int>(0);

void notifyRemoteHighlightsChanged() {
  remoteHighlightsRevision.value = remoteHighlightsRevision.value + 1;
}

class RemoteHighlightsPrefs {
  RemoteHighlightsPrefs._();

  static const String _pinnedKey = 'remote_highlights_pinned_v1';
  static const String _recentKey = 'remote_highlights_recent_v1';
  static const int maxRecent = 6;
  static const int maxPinned = 6;

  static Future<List<RemoteHighlightRef>> loadPinned() async {
    final prefs = await SharedPreferences.getInstance();
    return _decodeList(prefs.getString(_pinnedKey));
  }

  static Future<List<RemoteHighlightRef>> loadRecent() async {
    final prefs = await SharedPreferences.getInstance();
    return _decodeList(prefs.getString(_recentKey));
  }

  static Future<bool> isPinned(Remote remote) async {
    final pinned = await loadPinned();
    return pinned.any((e) => e.matches(remote));
  }

  static Future<void> pin(Remote remote) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await loadPinned();
    items.removeWhere((e) => e.matches(remote));
    items.insert(0, RemoteHighlightRef.fromRemote(remote));
    if (items.length > maxPinned) {
      items.removeRange(maxPinned, items.length);
    }
    await prefs.setString(_pinnedKey, _encodeList(items));
    notifyRemoteHighlightsChanged();
  }

  static Future<void> unpin(Remote remote) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await loadPinned();
    items.removeWhere((e) => e.matches(remote));
    await prefs.setString(_pinnedKey, _encodeList(items));
    notifyRemoteHighlightsChanged();
  }

  static Future<void> togglePinned(Remote remote) async {
    if (await isPinned(remote)) {
      await unpin(remote);
    } else {
      await pin(remote);
    }
  }

  static Future<void> addRecent(Remote remote) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await loadRecent();
    items.removeWhere((e) => e.matches(remote));
    items.insert(0, RemoteHighlightRef.fromRemote(remote));
    if (items.length > maxRecent) {
      items.removeRange(maxRecent, items.length);
    }
    await prefs.setString(_recentKey, _encodeList(items));
    notifyRemoteHighlightsChanged();
  }

  static Future<void> removeForRemote(Remote remote) async {
    final prefs = await SharedPreferences.getInstance();
    final pinned = await loadPinned();
    final recent = await loadRecent();
    pinned.removeWhere((e) => e.matches(remote));
    recent.removeWhere((e) => e.matches(remote));
    await prefs.setString(_pinnedKey, _encodeList(pinned));
    await prefs.setString(_recentKey, _encodeList(recent));
    notifyRemoteHighlightsChanged();
  }

  static List<RemoteHighlightRef> _decodeList(String? raw) {
    if (raw == null || raw.trim().isEmpty) return <RemoteHighlightRef>[];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return <RemoteHighlightRef>[];
      return decoded
          .whereType<Map>()
          .map((e) => RemoteHighlightRef.fromJson(e.cast<String, dynamic>()))
          .toList();
    } catch (_) {
      return <RemoteHighlightRef>[];
    }
  }

  static String _encodeList(List<RemoteHighlightRef> items) {
    return jsonEncode(items.map((e) => e.toJson()).toList());
  }
}

class RemoteHighlightRef {
  final int remoteId;
  final String remoteName;
  final int buttonCount;
  final DateTime savedAt;

  const RemoteHighlightRef({
    required this.remoteId,
    required this.remoteName,
    required this.buttonCount,
    required this.savedAt,
  });

  factory RemoteHighlightRef.fromRemote(Remote remote) {
    return RemoteHighlightRef(
      remoteId: remote.id,
      remoteName: remote.name,
      buttonCount: remote.buttons.length,
      savedAt: DateTime.now(),
    );
  }

  factory RemoteHighlightRef.fromJson(Map<String, dynamic> json) {
    return RemoteHighlightRef(
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

  Map<String, dynamic> toJson() => <String, dynamic>{
        'remoteId': remoteId,
        'remoteName': remoteName,
        'buttonCount': buttonCount,
        'savedAt': savedAt.toIso8601String(),
      };

  bool matches(Remote remote) {
    final wantedName = remoteName.trim();
    final actualName = remote.name.trim();
    if (wantedName.isNotEmpty && wantedName == actualName) return true;
    return remote.id == remoteId;
  }
}
