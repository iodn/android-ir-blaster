import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/updates/update_controller.dart';
import 'package:irblaster_controller/updates/update_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  for (final source in ['github', 'fdroid', 'play', 'unknown']) {
    testWidgets('$source update screen fits compact large-text layout',
        (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({});
      final calls = <String>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(updateChannel, (call) async {
        calls.add(call.method);
        return {
          'source': source,
          'version': '3.4.2',
          'build': 45,
          'abi': 'arm64-v8a',
          'ready': true,
          'canInstall': false
        };
      });
      final controller = UpdateController();
      await controller.initialize();
      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(2)),
            child: child!),
        home: UpdateScreen(controller: controller),
      ));
      await tester.pumpAndSettle();
      final l = AppLocalizations.of(tester.element(find.byType(UpdateScreen)))!;
      await tester.scrollUntilVisible(find.byType(SwitchListTile), 150);
      expect(tester.widget<SwitchListTile>(find.byType(SwitchListTile)).value,
          isFalse);
      final target = switch (source) {
        'github' => l.updatesAllowInstall,
        'fdroid' => l.updatesOpenFdroid,
        'play' => l.updatesOpenPlay,
        _ => l.updatesCheck,
      };
      await tester.scrollUntilVisible(find.text(target), 150);
      await tester.pumpAndSettle();
      expect(find.text(target), findsOneWidget);
      expect(tester.takeException(), isNull);
      expect(calls, ['info']);
      if (source != 'github') {
        expect(find.text(l.updatesAllowInstall), findsNothing);
        expect(find.text(l.updatesDownload), findsNothing);
      }
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(updateChannel, null);
    });
  }
}
