import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteDisplayController extends ChangeNotifier {
  RemoteDisplayController._();

  static final RemoteDisplayController instance = RemoteDisplayController._();

  static const String _showButtonMetadataKey =
      'remote_view_show_button_metadata_v1';

  bool _showButtonMetadata = true;
  bool get showButtonMetadata => _showButtonMetadata;

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _showButtonMetadata = prefs.getBool(_showButtonMetadataKey) ?? true;
      notifyListeners();
    } catch (_) {}
  }

  Future<void> setShowButtonMetadata(bool value) async {
    if (_showButtonMetadata == value) return;
    _showButtonMetadata = value;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_showButtonMetadataKey, value);
    } catch (_) {}
  }
}
