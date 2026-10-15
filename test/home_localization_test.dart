import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir_finder/irblaster_db.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/widgets/home_shell.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // Home keeps the Finder tab mounted. Complete its database setup before
  // testing layout so an unrelated loading spinner cannot block settling.
  setUpAll(() async {
    databaseFactory = databaseFactorySqflitePlugin;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('com.tekartik.sqflite'),
            (call) async {
      return switch (call.method) {
        'getDatabasesPath' => '/tmp/home-localization-test',
        'databaseExists' => true,
        'openDatabase' => {'id': 1},
        'query' => <Map<String, Object?>>[],
        _ => null,
      };
    });
    await IrBlasterDb.instance.ensureInitialized();
  });
  tearDownAll(() => TestDefaultBinaryMessengerBinding
      .instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
          const MethodChannel('com.tekartik.sqflite'), null));
  for (final locale in AppLocalizations.supportedLocales) {
    for (final status in [
      'NO_DEVICE',
      'PERMISSION_REQUIRED',
      'PERMISSION_DENIED',
      'PERMISSION_GRANTED',
      'OPEN_FAILED',
    ]) {
      testWidgets('hardware onboarding fits compact screen: $locale / $status',
          (tester) async {
        SharedPreferences.setMockInitialValues({});
        PackageInfo.setMockInitialValues(
          appName: 'IR Blaster',
          packageName: 'org.nslabs.ir_blaster',
          version: '3.4.5',
          buildNumber: '48',
          buildSignature: '',
        );
        final messenger =
            TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
        const channel = MethodChannel('org.nslabs/irtransmitter');
        const events = MethodChannel('org.nslabs/irtransmitter_events');
        messenger.setMockMethodCallHandler(channel, (call) async {
          if (call.method == 'performHaptic') return true;
          if (call.method == 'getPreferredTransmitterType') return 'INTERNAL';
          if (call.method == 'getTransmitterCapabilities') {
            return {
              'hasInternal': false,
              'hasUsb': status != 'NO_DEVICE',
              'usbStatus': status,
              'usbDevices': [],
            };
          }
          return null;
        });
        messenger.setMockMethodCallHandler(events, (_) async => null);
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
          home: const HomeShell(),
        ));
        await tester.runAsync(IrBlasterDb.instance.ensureInitialized);
        await tester.pumpAndSettle();
        final l10n =
            AppLocalizations.of(tester.element(find.byType(HomeShell)))!;
        expect(find.text(l10n.homeHardwareRequiredTitle), findsOneWidget);
        expect(find.text(l10n.homeHardwareRequiredBody), findsOneWidget);
        expect(find.text(l10n.homeUsbDongleRecommended), findsOneWidget);
        final message = switch (status) {
          'PERMISSION_REQUIRED' => l10n.homeUsbPermissionRequiredMessage,
          'PERMISSION_DENIED' => l10n.homeUsbPermissionDeniedMessage,
          'PERMISSION_GRANTED' => l10n.homeUsbPermissionGrantedMessage,
          'OPEN_FAILED' => l10n.homeUsbOpenFailedMessage,
          _ => l10n.homeUsbNoDeviceMessage,
        };
        expect(find.text(message), findsWidgets);
        expect(tester.takeException(), isNull);
        final proceed =
            find.widgetWithText(TextButton, l10n.homeContinueWithoutHardware);
        await tester.ensureVisible(proceed);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        await tester.tap(proceed);
        await tester.pumpAndSettle();
        expect(find.text(l10n.homeHardwareRequiredTitle), findsNothing);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
        await tester.pumpAndSettle();
      });
    }
  }
}
