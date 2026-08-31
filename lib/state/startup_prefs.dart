import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartupPrefsController extends ChangeNotifier {
  StartupPrefsController._();

  static final StartupPrefsController instance = StartupPrefsController._();
  static const String _autoOpenLastRemoteKey =
      'startup_auto_open_last_remote_v1';

  bool _autoOpenLastRemote = false;
  bool _explicitLaunchActionReceived = false;

  bool get autoOpenLastRemote => _autoOpenLastRemote;
  bool get shouldAutoOpenLastRemote =>
      _autoOpenLastRemote && !_explicitLaunchActionReceived;

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _autoOpenLastRemote = prefs.getBool(_autoOpenLastRemoteKey) ?? false;
      notifyListeners();
    } catch (_) {}
  }

  Future<void> setAutoOpenLastRemote(bool value) async {
    if (_autoOpenLastRemote == value) return;
    _autoOpenLastRemote = value;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_autoOpenLastRemoteKey, value);
    } catch (_) {}
  }

  void suppressAutoOpenForCurrentLaunch() {
    _explicitLaunchActionReceived = true;
  }
}
