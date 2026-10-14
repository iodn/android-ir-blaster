import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/widgets/learning_mode_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('learning instructions fit a compact screen: $locale',
        (tester) async {
      SharedPreferences.setMockInitialValues({});
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      const channel = MethodChannel('org.nslabs/irtransmitter');
      const events = MethodChannel('org.nslabs/irtransmitter_events');
      messenger.setMockMethodCallHandler(events, (_) async => null);
      messenger.setMockMethodCallHandler(channel, (call) async {
        if (call.method == 'getPreferredTransmitterType') return 'USB';
        if (call.method == 'getTransmitterCapabilities') {
          return {
            'hasUsb': true,
            'usbOpened': true,
            'usbStatus': 'READY',
            'currentType': 'USB',
            'usbDevices': [
              {'vendorId': 0x045c, 'productId': 0x0134, 'hasPermission': true}
            ],
          };
        }
        return null;
      });
      addTearDown(() {
        messenger.setMockMethodCallHandler(channel, null);
        messenger.setMockMethodCallHandler(events, null);
      });
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.3)),
          child: child!,
        ),
        home: const LearningModeScreen(),
      ));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(LearningModeScreen)))!;
      expect(find.text(l10n.learningModeReadyToListenBody), findsOneWidget);
      final start =
          find.widgetWithText(FilledButton, l10n.learningModeStartListening);
      await tester.ensureVisible(start);
      await tester.pumpAndSettle();
      expect(tester.widget<FilledButton>(start).onPressed, isNotNull);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
