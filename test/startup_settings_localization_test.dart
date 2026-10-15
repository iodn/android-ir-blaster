import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/state/orientation_pref.dart';
import 'package:irblaster_controller/state/remote_display_prefs.dart';
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
      final display = RemoteDisplayController.instance;
      await display.load();
      PackageInfo.setMockInitialValues(
          appName: 'IR Blaster',
          packageName: 'org.nslabs.ir_blaster',
          version: '3.4.1',
          buildNumber: '44',
          buildSignature: '');
      final messenger = tester.binding.defaultBinaryMessenger;
      const channel = MethodChannel('org.nslabs/irtransmitter');
      const events = MethodChannel('org.nslabs/irtransmitter_events');
      String? vibrationBlockReason;
      messenger.setMockMethodCallHandler(
          channel,
          (call) async => switch (call.method) {
                'getPreferredTransmitterType' => 'INTERNAL',
                'getTransmitterCapabilities' => {'hasInternal': true},
                'getHapticDiagnostics' => {
                    'hasVibrator': vibrationBlockReason != 'no_vibrator',
                    'masterVibrationEnabled':
                        vibrationBlockReason != 'master_vibration_disabled',
                    'forceOverrideLikelyBlocked': vibrationBlockReason != null,
                    'reasonCode': vibrationBlockReason,
                  },
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
      final overrideTile = find.widgetWithText(
          SwitchListTile, l10n.forceInAppVibrationTitle);
      final overrideToggle =
          find.descendant(of: overrideTile, matching: find.byType(Switch));
      for (final reason in ['no_vibrator', 'master_vibration_disabled']) {
        vibrationBlockReason = reason;
        await tester.ensureVisible(overrideToggle);
        await tester.pumpAndSettle();
        expectReadable(find.text(l10n.forceInAppVibrationTitle));
        await tester.tap(overrideToggle);
        await tester.pumpAndSettle();
        final message = reason == 'no_vibrator'
            ? l10n.forceInAppVibrationNoVibratorWarning
            : l10n.forceInAppVibrationBlockedMasterWarning;
        final notification = find.descendant(
            of: find.byType(SnackBar), matching: find.text(message));
        expectReadable(notification);
        ScaffoldMessenger.of(tester.element(notification)).removeCurrentSnackBar();
        await tester.pumpAndSettle();
        final inline = find.text(message);
        await tester.ensureVisible(inline);
        await tester.pumpAndSettle();
        expectReadable(inline);
        expect(HapticsController.instance.forceVibrationOverride, isTrue);
        await tester.ensureVisible(overrideToggle);
        await tester.pumpAndSettle();
        await tester.tap(overrideToggle);
        await tester.pumpAndSettle();
        expect(find.text(message), findsNothing);
        expect(HapticsController.instance.forceVibrationOverride, isFalse);
      }
      for (final message in [
        l10n.remoteButtonMetadataTitle,
        l10n.remoteButtonMetadataSubtitle,
      ]) {
        await tester.ensureVisible(find.text(message));
        await tester.pumpAndSettle();
        expectReadable(find.text(message));
      }
      final detailsTile = find.widgetWithText(
          SwitchListTile, l10n.remoteButtonMetadataTitle);
      expect(tester.widget<SwitchListTile>(detailsTile).value, isTrue);
      final detailsToggle =
          find.descendant(of: detailsTile, matching: find.byType(Switch));
      for (final value in [false, true]) {
        await tester.ensureVisible(detailsToggle);
        await tester.pumpAndSettle();
        await tester.tap(detailsToggle);
        await tester.pumpAndSettle();
        expect(display.showButtonMetadata, value);
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getBool('remote_view_show_button_metadata_v1'), value);
        final feedback = find.text(value
            ? l10n.remoteButtonMetadataShown
            : l10n.remoteButtonMetadataHidden);
        expectReadable(feedback);
        ScaffoldMessenger.of(tester.element(feedback)).removeCurrentSnackBar();
        await tester.pumpAndSettle();
      }
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(find.text(l10n.backupTitle), 150);
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text(l10n.backupTitle));
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.backupTitle));
      await tester.pumpAndSettle();
      for (final label in [
        l10n.importBackup,
        l10n.importBackupSubtitle,
        l10n.exportBackup,
        l10n.exportBackupSubtitle,
      ]) {
        final text = find.text(label);
        await tester.ensureVisible(text);
        await tester.pumpAndSettle();
        expectReadable(text);
        final tile = find.ancestor(of: text, matching: find.byType(ListTile));
        final bounds = tester.getRect(tile);
        expect(tester.getRect(text).top, greaterThanOrEqualTo(bounds.top));
        expect(tester.getRect(text).bottom, lessThanOrEqualTo(bounds.bottom));
      }
      for (final label in [l10n.importBackup, l10n.exportBackup]) {
        await tester.ensureVisible(find.text(label));
        await tester.pumpAndSettle();
        expect(find.text(label).hitTestable(), findsOneWidget);
      }
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
