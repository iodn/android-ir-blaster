import 'package:shared_preferences/shared_preferences.dart';

class UniversalPowerPrefs {
  UniversalPowerPrefs._();

  static const String _consentKey = 'universal_power_consent_v1';
  static const String _lastLabelKey = 'universal_power_last_label';
  static const String _lastProtocolKey = 'universal_power_last_protocol';
  static const String _lastHexKey = 'universal_power_last_hex';
  static const String _lastAtKey = 'universal_power_last_at';

  static Future<bool> hasConsent() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_consentKey) ?? false;
  }

  static Future<void> setConsent(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_consentKey, value);
  }

  static Future<void> saveLastSent({
    required String label,
    required String protocolId,
    required String hexCode,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastLabelKey, label);
    await prefs.setString(_lastProtocolKey, protocolId);
    await prefs.setString(_lastHexKey, hexCode);
    await prefs.setString(_lastAtKey, DateTime.now().toIso8601String());
  }

  static Future<UniversalPowerLastSent?> loadLastSent() async {
    final prefs = await SharedPreferences.getInstance();
    final label = prefs.getString(_lastLabelKey);
    final protocol = prefs.getString(_lastProtocolKey);
    final hex = prefs.getString(_lastHexKey);
    final rawAt = prefs.getString(_lastAtKey);
    if (label == null || protocol == null || hex == null) return null;
    DateTime? at;
    if (rawAt != null) {
      at = DateTime.tryParse(rawAt);
    }
    return UniversalPowerLastSent(
      label: label,
      protocolId: protocol,
      hexCode: hex,
      sentAt: at,
    );
  }
}

class UniversalPowerLastSent {
  final String label;
  final String protocolId;
  final String hexCode;
  final DateTime? sentAt;

  const UniversalPowerLastSent({
    required this.label,
    required this.protocolId,
    required this.hexCode,
    required this.sentAt,
  });
}
