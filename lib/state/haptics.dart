import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HapticDiagnostics {
  const HapticDiagnostics({
    required this.hasVibrator,
    required this.systemTouchFeedbackEnabled,
    required this.masterVibrationEnabled,
    required this.forceOverrideLikelyBlocked,
    this.reasonCode,
  });

  final bool hasVibrator;
  final bool systemTouchFeedbackEnabled;
  final bool masterVibrationEnabled;
  final bool forceOverrideLikelyBlocked;
  final String? reasonCode;

  static const unknown = HapticDiagnostics(
    hasVibrator: true,
    systemTouchFeedbackEnabled: true,
    masterVibrationEnabled: true,
    forceOverrideLikelyBlocked: false,
  );

  factory HapticDiagnostics.fromMap(Map<Object?, Object?> map) {
    return HapticDiagnostics(
      hasVibrator: map['hasVibrator'] == true,
      systemTouchFeedbackEnabled: map['systemTouchFeedbackEnabled'] != false,
      masterVibrationEnabled: map['masterVibrationEnabled'] != false,
      forceOverrideLikelyBlocked: map['forceOverrideLikelyBlocked'] == true,
      reasonCode: map['reasonCode'] as String?,
    );
  }
}

class HapticsController extends ChangeNotifier {
  HapticsController._();
  static final HapticsController instance = HapticsController._();

  static const String _prefsEnabled = 'haptics_enabled_v1';
  static const String _prefsIntensity = 'haptics_intensity_v1'; // 0=off,1=light,2=medium,3=strong
  static const String _prefsForceVibrationOverride = 'haptics_force_vibration_override_v1';

  bool _enabled = true;
  int _intensity = 2; // default medium
  bool _forceVibrationOverride = false;
  HapticDiagnostics _diagnostics = HapticDiagnostics.unknown;

  bool get enabled => _enabled;
  int get intensity => _intensity; // 0..3
  bool get forceVibrationOverride => _forceVibrationOverride;
  HapticDiagnostics get diagnostics => _diagnostics;

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _enabled = prefs.getBool(_prefsEnabled) ?? true;
      _intensity = prefs.getInt(_prefsIntensity) ?? 2;
      _forceVibrationOverride = prefs.getBool(_prefsForceVibrationOverride) ?? false;
    } catch (_) {}
    await refreshDiagnostics(notify: false);
    notifyListeners();
  }

  Future<void> setEnabled(bool value) async {
    if (_enabled == value) return;
    _enabled = value;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefsEnabled, value);
    } catch (_) {}
    await refreshDiagnostics();
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

  Future<void> setForceVibrationOverride(bool value) async {
    if (_forceVibrationOverride == value) return;
    _forceVibrationOverride = value;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefsForceVibrationOverride, value);
    } catch (_) {}
    await refreshDiagnostics();
  }

  Future<void> refreshDiagnostics({bool notify = true}) async {
    if (defaultTargetPlatform != TargetPlatform.android) {
      _diagnostics = HapticDiagnostics.unknown;
      if (notify) notifyListeners();
      return;
    }
    try {
      final raw = await Haptics.channel.invokeMapMethod<Object?, Object?>('getHapticDiagnostics');
      if (raw != null) {
        _diagnostics = HapticDiagnostics.fromMap(raw);
        if (notify) notifyListeners();
      }
    } catch (_) {}
  }
}

/// Convenience wrapper that respects the global haptics setting and intensity.
class Haptics {
  static const MethodChannel _channel = MethodChannel('org.nslabs/irtransmitter');
  static MethodChannel get channel => _channel;
  static bool get _on => HapticsController.instance.enabled;
  static int get _level => HapticsController.instance.intensity; // 0..3
  static bool get _forceVibrationOverride => HapticsController.instance.forceVibrationOverride;

  static Future<void> selectionClick() async {
    if (!_on) return;
    await _perform('selection');
  }

  static Future<void> lightImpact() async {
    if (!_on) return;
    await _perform('light');
  }

  static Future<void> mediumImpact() async {
    if (!_on) return;
    await _perform('medium');
  }

  static Future<void> heavyImpact() async {
    if (!_on) return;
    await _perform('heavy');
  }

  static Future<void> _perform(String type) async {
    if (_level <= 0) return;
    if (defaultTargetPlatform == TargetPlatform.android) {
      try {
        final performed = await _channel.invokeMethod<bool>('performHaptic', <String, dynamic>{
          'type': type,
          'intensity': _level,
          'forceVibrationOverride': _forceVibrationOverride,
        });
        if (performed == true) return;
        if (_forceVibrationOverride) return;
      } catch (_) {
        // Fall back to Flutter's built-in mapping if the native path fails.
      }
    }
    await _flutterFallback(type);
  }

  static Future<void> _flutterFallback(String type) async {
    switch (_level) {
      case 0:
        return;
      case 1:
        await HapticFeedback.selectionClick();
        return;
      case 2:
        if (type == 'selection') {
          await HapticFeedback.selectionClick();
        } else {
          await HapticFeedback.mediumImpact();
        }
        return;
      case 3:
      default:
        await HapticFeedback.heavyImpact();
        return;
    }
  }
}
