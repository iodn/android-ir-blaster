import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransmitterPrefs extends ChangeNotifier {
  TransmitterPrefs._();
  static final TransmitterPrefs instance = TransmitterPrefs._();

  static const String _kAutoSelectAudioKey = 'auto_select_audio_usb_audio_v1';

  bool _autoSelectAudio = true;
  bool get autoSelectAudioForUsbAudio => _autoSelectAudio;

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _autoSelectAudio = prefs.getBool(_kAutoSelectAudioKey) ?? true;
      notifyListeners();
    } catch (_) {}
  }

  Future<void> setAutoSelectAudio(bool v) async {
    if (_autoSelectAudio == v) return;
    _autoSelectAudio = v;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_kAutoSelectAudioKey, v);
    } catch (_) {}
  }
}
