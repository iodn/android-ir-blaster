import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DynamicColorController extends ChangeNotifier {
  DynamicColorController._();
  static final DynamicColorController instance = DynamicColorController._();

  static const String _prefsKey = 'dynamic_color_enabled_v1';

  bool _enabled = Platform.isAndroid; // default: on for Android
  bool get enabled => _enabled;

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final v = prefs.getBool(_prefsKey);
      _enabled = v ?? _enabled;
      notifyListeners();
    } catch (_) {
      // keep default
    }
  }

  Future<void> setEnabled(bool value) async {
    if (_enabled == value) return;
    _enabled = value;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefsKey, value);
    } catch (_) {}
  }
}
