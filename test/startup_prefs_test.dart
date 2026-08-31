import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/state/startup_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('last remote startup preference is opt-in and persisted', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final controller = StartupPrefsController.instance;

    await controller.load();
    expect(controller.autoOpenLastRemote, isFalse);
    expect(controller.shouldAutoOpenLastRemote, isFalse);

    await controller.setAutoOpenLastRemote(true);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool('startup_auto_open_last_remote_v1'), isTrue);
    expect(controller.shouldAutoOpenLastRemote, isTrue);

    controller.suppressAutoOpenForCurrentLaunch();
    expect(controller.autoOpenLastRemote, isTrue);
    expect(controller.shouldAutoOpenLastRemote, isFalse);
  });
}
