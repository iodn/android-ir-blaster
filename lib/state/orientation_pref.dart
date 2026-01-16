import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteOrientationController extends ChangeNotifier {
  RemoteOrientationController._();
  static final RemoteOrientationController instance = RemoteOrientationController._();

  static const String _prefsKey = 'remote_view_flipped_v1';

  bool _flipped = false;
  bool get flipped => _flipped;

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _flipped = prefs.getBool(_prefsKey) ?? false;
      notifyListeners();
    } catch (_) {}
  }

  Future<void> setFlipped(bool value) async {
    if (_flipped == value) return;
    _flipped = value;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefsKey, value);
    } catch (_) {}
  }
}
