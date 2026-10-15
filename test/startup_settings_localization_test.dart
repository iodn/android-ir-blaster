import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/state/orientation_pref.dart';
import 'package:irblaster_controller/state/startup_prefs.dart';
import 'package:irblaster_controller/widgets/settings_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('startup setting readable and persisted: $locale',
        (tester) async {
      SharedPreferences.setMockInitialValues({});
      final controller = StartupPrefsController.instance;
      await controller.load();
      final orientation = RemoteOrientationController.instance;
      await orientation.load();
      PackageInfo.setMockInitialValues(
          appName: 'IR Blaster',
          packageName: 'org.nslabs.ir_blaster',
          version: '3.4.1',
          buildNumber: '44',
          buildSignature: '');
      final messenger = tester.binding.defaultBinaryMessenger;
      const channel = MethodChannel('org.nslabs/irtransmitter');
      const events = MethodChannel('org.nslabs/irtransmitter_events');
      messenger.setMockMethodCallHandler(
          channel,
          (call) async => switch (call.method) {
                'getPreferredTransmitterType' => 'INTERNAL',
                'getTransmitterCapabilities' => {'hasInternal': true},
                'getAutoSwitchEnabled' || 'getOpenOnUsbAttachEnabled' => false,
                _ => null,
              });
      messenger.setMockMethodCallHandler(events, (_) async => null);
      await HapticsController.instance.load();
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
              .copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: const SettingsScreen(),
      ));
      await tester.pumpAndSettle();
      final l10n = await AppLocalizations.delegate.load(locale);
      void expectReadable(Finder text) {
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1));
      }

      await tester.scrollUntilVisible(find.text(l10n.interactionTitle), 150);
      await tester.pumpAndSettle();
      expectReadable(find.text(l10n.interactionTitle));
      expectReadable(find.text(l10n.settingsInteractionSubtitle));
      await tester.ensureVisible(find.text(l10n.interactionTitle));
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.interactionTitle));
      await tester.pumpAndSettle();
      final heading = find.descendant(
          of: find.byType(AppBar), matching: find.text(l10n.interactionTitle));
      expectReadable(heading);
      final bounds = tester.getRect(find.byType(AppBar));
      expect(tester.getRect(heading).bottom, lessThanOrEqualTo(bounds.bottom));
      expectReadable(find.text(l10n.interactionTitle).last);
      expectReadable(find.text(l10n.interactionSubtitle));
      for (final value in [
        l10n.autoOpenLastRemoteTitle,
        l10n.autoOpenLastRemoteSubtitle
      ]) {
        final text = find.text(value);
        await tester.ensureVisible(text);
        await tester.pumpAndSettle();
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1));
      }
      final tile =
          find.widgetWithText(SwitchListTile, l10n.autoOpenLastRemoteTitle);
      expect(tester.widget<SwitchListTile>(tile).value, isFalse);
      final toggle = find.descendant(of: tile, matching: find.byType(Switch));
      for (final value in [true, false]) {
        await tester.ensureVisible(toggle);
        await tester.pumpAndSettle();
        await tester.tap(toggle);
        await tester.pumpAndSettle();
        expect(controller.autoOpenLastRemote, value);
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getBool('startup_auto_open_last_remote_v1'), value);
      }
      for (final value in [
        l10n.flipRemoteDefaultTitle,
        l10n.flipRemoteDefaultSubtitle,
      ]) {
        await tester.ensureVisible(find.text(value));
        await tester.pumpAndSettle();
        expectReadable(find.text(value));
      }
      final orientationTile =
          find.widgetWithText(SwitchListTile, l10n.flipRemoteDefaultTitle);
      expect(tester.widget<SwitchListTile>(orientationTile).value, isFalse);
      final orientationToggle =
          find.descendant(of: orientationTile, matching: find.byType(Switch));
      for (final value in [true, false]) {
        await tester.ensureVisible(orientationToggle);
        await tester.pumpAndSettle();
        await tester.tap(orientationToggle);
        await tester.pumpAndSettle();
        expect(orientation.flipped, value);
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getBool('remote_view_flipped_v1'), value);
        final feedback = find.text(
            value ? l10n.remoteViewFlipped : l10n.remoteViewNormal);
        expectReadable(feedback);
        ScaffoldMessenger.of(tester.element(feedback)).removeCurrentSnackBar();
        await tester.pumpAndSettle();
      }
      for (final label in [
        l10n.hapticFeedbackTitle,
        l10n.hapticFeedbackSubtitle,
        l10n.intensity,
      ]) {
        await tester.ensureVisible(find.text(label));
        await tester.pumpAndSettle();
        expectReadable(find.text(label));
      }
      final levels = [
        l10n.intensityLight,
        l10n.intensityMedium,
        l10n.intensityStrong
      ];
      for (var index = 0; index < levels.length; index++) {
        final label = find.text(levels[index]);
        await tester.ensureVisible(label);
        await tester.pumpAndSettle();
        expectReadable(label);
        final segment =
            find.ancestor(of: label, matching: find.byType(TextButton));
        expect(tester.getRect(label).left,
            greaterThanOrEqualTo(tester.getRect(segment).left));
        expect(tester.getRect(label).right,
            lessThanOrEqualTo(tester.getRect(segment).right));
        await tester.tap(label);
        await tester.pumpAndSettle();
        expect(HapticsController.instance.intensity, index + 1);
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getInt('haptics_intensity_v1'), index + 1);
      }
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
