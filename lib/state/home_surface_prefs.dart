import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ValueNotifier<int> homeSurfaceRevision = ValueNotifier<int>(0);

void notifyHomeSurfaceChanged() {
  homeSurfaceRevision.value = homeSurfaceRevision.value + 1;
}

class HomeSurfacePrefs {
  HomeSurfacePrefs._();

  static const String _showDeviceControlsRowKey =
      'home_surface_show_device_controls_row_v1';

  static Future<bool> showDeviceControlsRow() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_showDeviceControlsRowKey) ?? true;
  }

  static Future<void> setShowDeviceControlsRow(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_showDeviceControlsRowKey, value);
    notifyHomeSurfaceChanged();
  }
}
