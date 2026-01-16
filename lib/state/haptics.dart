import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HapticsController extends ChangeNotifier {
  HapticsController._();
  static final HapticsController instance = HapticsController._();

  static const String _prefsEnabled = 'haptics_enabled_v1';
  static const String _prefsIntensity = 'haptics_intensity_v1'; // 0=off,1=light,2=medium,3=strong

  bool _enabled = true;
  int _intensity = 2; // default medium

  bool get enabled => _enabled;
  int get intensity => _intensity; // 0..3

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _enabled = prefs.getBool(_prefsEnabled) ?? true;
      _intensity = prefs.getInt(_prefsIntensity) ?? 2;
      notifyListeners();
    } catch (_) {}
  }

  Future<void> setEnabled(bool value) async {
    if (_enabled == value) return;
    _enabled = value;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefsEnabled, value);
    } catch (_) {}
  }

  Future<void> setIntensity(int value) async {
    final v = value.clamp(0, 3);
    if (_intensity == v) return;
    _intensity = v;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_prefsIntensity, v);
    } catch (_) {}
  }
}

/// Convenience wrapper that respects the global haptics setting and intensity.
class Haptics {
  static bool get _on => HapticsController.instance.enabled;
  static int get _level => HapticsController.instance.intensity; // 0..3

  static Future<void> selectionClick() async {
    if (!_on) return;
    switch (_level) {
      case 0: // off
        return;
      case 1: // light
        await HapticFeedback.selectionClick();
        return;
      case 2: // medium
        await HapticFeedback.mediumImpact();
        return;
      case 3: // strong
      default:
        await HapticFeedback.heavyImpact();
        return;
    }
  }

  static Future<void> lightImpact() async {
    if (!_on) return;
    switch (_level) {
      case 0: // off
        return;
      case 1: // light
        await HapticFeedback.selectionClick();
        return;
      case 2: // medium
        await HapticFeedback.mediumImpact();
        return;
      case 3: // strong
      default:
        await HapticFeedback.heavyImpact();
        return;
    }
  }

  static Future<void> mediumImpact() async {
    if (!_on) return;
    switch (_level) {
      case 0: // off
        return;
      case 1: // light
        await HapticFeedback.selectionClick();
        return;
      case 2: // medium
        await HapticFeedback.mediumImpact();
        return;
      case 3: // strong
      default:
        await HapticFeedback.heavyImpact();
        return;
    }
  }

  static Future<void> heavyImpact() async {
    if (!_on) return;
    // Strongest available
    await HapticFeedback.heavyImpact();
  }
}
