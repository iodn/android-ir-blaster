import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocaleController extends ChangeNotifier {
  AppLocaleController._();
  static final AppLocaleController instance = AppLocaleController._();

  static const String _prefsKey = 'app_locale_override_v1';

  Locale? _overrideLocale;
  Locale? get overrideLocale => _overrideLocale;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _overrideLocale = _decode(prefs.getString(_prefsKey));
    notifyListeners();
  }

  Future<void> setOverride(Locale? locale) async {
    if (_sameLocale(_overrideLocale, locale)) return;
    _overrideLocale = locale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_prefsKey);
    } else {
      await prefs.setString(_prefsKey, _encode(locale));
    }
  }

  Locale resolveActiveLocale(List<Locale> supportedLocales, Locale? systemLocale) {
    if (_overrideLocale != null) {
      return _matchSupportedLocale(_overrideLocale!, supportedLocales) ?? supportedLocales.first;
    }
    if (systemLocale != null) {
      return _matchSupportedLocale(systemLocale, supportedLocales) ?? supportedLocales.first;
    }
    return supportedLocales.first;
  }

  static String _encode(Locale locale) {
    final countryCode = locale.countryCode;
    if (countryCode == null || countryCode.isEmpty) return locale.languageCode;
    return '${locale.languageCode}_$countryCode';
  }

  static Locale? _decode(String? raw) {
    final value = (raw ?? '').trim();
    if (value.isEmpty) return null;
    final parts = value.split(RegExp('[-_]'));
    if (parts.length >= 2) {
      return Locale(parts[0], parts[1]);
    }
    return Locale(parts[0]);
  }

  static Locale? _matchSupportedLocale(Locale wanted, List<Locale> supportedLocales) {
    for (final locale in supportedLocales) {
      if (_sameLocale(locale, wanted)) return locale;
    }
    for (final locale in supportedLocales) {
      if (locale.languageCode == wanted.languageCode) return locale;
    }
    return null;
  }

  static bool _sameLocale(Locale? a, Locale? b) {
    if (a == null || b == null) return a == b;
    return a.languageCode == b.languageCode && (a.countryCode ?? '') == (b.countryCode ?? '');
  }
}
