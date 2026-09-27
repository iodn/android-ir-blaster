import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/config/build_flags.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/startup_prefs.dart';
import 'package:irblaster_controller/widgets/settings/widgets/section_card.dart';
import 'package:irblaster_controller/widgets/settings_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget settings({Locale locale = const Locale('en')}) => MaterialApp(
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SettingsScreen(),
    );

Future<void> openCategory(WidgetTester tester, String title) async {
  await tester.scrollUntilVisible(find.text(title), 200);
  await tester.pumpAndSettle();
  await tester.tap(find.text(title));
  await tester.pumpAndSettle();
  expect(find.widgetWithText(AppBar, title), findsOneWidget);
}

Future<void> expectSection(WidgetTester tester, String title) async {
  final section = find.byWidgetPredicate(
    (widget) => widget is SectionCard && widget.title == title,
  );
  await tester.scrollUntilVisible(section, 250);
  await tester.pumpAndSettle();
  expect(section, findsOneWidget);
  expect(tester.takeException(), isNull);
}

void main() {
  final nativeCalls = <String>[];
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StartupPrefsController.instance.load();
    nativeCalls.clear();
    PackageInfo.setMockInitialValues(
      appName: 'IR Blaster',
      packageName: 'org.nslabs.ir_blaster',
      version: '3.4.1',
      buildNumber: '44',
      buildSignature: '',
    );
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(
      const MethodChannel('org.nslabs/irtransmitter'),
      (call) async {
        nativeCalls.add(call.method);
        return switch (call.method) {
          'getPreferredTransmitterType' => 'INTERNAL',
          'getTransmitterCapabilities' => {'hasInternal': true},
          'getAutoSwitchEnabled' || 'getOpenOnUsbAttachEnabled' => false,
          _ => null,
        };
      },
    );
    messenger.setMockMethodCallHandler(
      const MethodChannel('org.nslabs/irtransmitter_events'),
      (_) async => null,
    );
  });

  testWidgets(
      'overview has categories, not expanded controls or hardware calls',
      (tester) async {
    await tester.pumpWidget(settings());
    await tester.pumpAndSettle();
    // The overview is lazy: off-screen categories are not all built at once.
    expect(find.byType(ListTile), findsWidgets);
    final l10n =
        AppLocalizations.of(tester.element(find.byType(SettingsScreen)))!;
    await tester.scrollUntilVisible(find.text(l10n.updatesTitle), 200);
    expect(find.text(l10n.updatesTitle), findsOneWidget);
    expect(find.byType(SectionCard), findsNothing);
    expect(find.byType(SwitchListTile), findsNothing);
    expect(nativeCalls, isEmpty);
  });

  testWidgets(
      'all original sections remain reachable and back returns to settings',
      (tester) async {
    await tester.pumpWidget(settings());
    await tester.pumpAndSettle();
    final l10n =
        AppLocalizations.of(tester.element(find.byType(SettingsScreen)))!;
    final groups = <String, List<String>>{
      l10n.settingsHardwareTitle: [
        l10n.irTransmitterTitle,
        l10n.learningModeEntryTitle
      ],
      l10n.appearanceTitle: [l10n.appearanceTitle, l10n.localizationTitle],
      l10n.interactionTitle: [l10n.interactionTitle],
      l10n.settingsToolsTitle: [
        l10n.deviceControlsTitle,
        l10n.quickSettingsTitle,
        'GitHub Store',
        l10n.tvKillTitle,
      ],
      l10n.backupTitle: [l10n.backupTitle],
      l10n.aboutTitle: [
        l10n.aboutTitle,
        if (BuildFlags.showDonations) l10n.supportDevelopmentTitle,
      ],
    };
    for (final group in groups.entries) {
      await openCategory(tester, group.key);
      for (final title in group.value) {
        await expectSection(tester, title);
      }
      if (group.key == l10n.aboutTitle && !BuildFlags.showDonations) {
        await tester.drag(find.byType(ListView).first, const Offset(0, -1500));
        await tester.pumpAndSettle();
        expect(find.text(l10n.supportDevelopmentTitle), findsNothing);
        expect(find.text(l10n.donate), findsNothing);
      }
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(AppBar, l10n.settingsTitle), findsOneWidget);
      expect(find.byType(SectionCard), findsNothing);
    }
  });

  testWidgets('preference edits survive leaving and reopening a category',
      (tester) async {
    await tester.pumpWidget(settings());
    await tester.pumpAndSettle();
    await openCategory(tester, 'Interaction');
    final toggle = find.widgetWithText(
      SwitchListTile,
      'Open last remote at startup',
    );
    expect(tester.widget<SwitchListTile>(toggle).value, isFalse);
    await tester.tap(toggle);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    await openCategory(tester, 'Interaction');
    expect(tester.widget<SwitchListTile>(toggle).value, isTrue);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool('startup_auto_open_last_remote_v1'), isTrue);
  });

  testWidgets('tablet content stays within a readable width', (tester) async {
    tester.view.physicalSize = const Size(1200, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(settings());
    await tester.pumpAndSettle();
    expect(tester.getSize(find.byType(ListView)).width, 760);
    await openCategory(tester, 'Backup');
    expect(tester.getSize(find.byType(ListView)).width, 760);
  });

  for (final locale in [const Locale('de'), const Locale('ar')]) {
    testWidgets('compact settings and subpages with large text: $locale',
        (tester) async {
      tester.view.physicalSize = const Size(320, 568);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 1.5;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await tester.pumpWidget(settings(locale: locale));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(SettingsScreen)))!;
      for (final title in [
        l10n.settingsHardwareTitle,
        l10n.appearanceTitle,
        l10n.interactionTitle,
        l10n.settingsToolsTitle,
        l10n.backupTitle,
        l10n.aboutTitle,
      ]) {
        await openCategory(tester, title);
        expect(tester.takeException(), isNull);
        await tester.drag(find.byType(ListView).first, const Offset(0, -600));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        await tester.tap(find.byType(BackButton));
        await tester.pumpAndSettle();
      }
    });
  }
}
