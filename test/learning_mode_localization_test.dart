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
      var incomplete = true;
      var preferredType = 'AUDIO_2_LED';
      var family = 'elksmart';
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      const channel = MethodChannel('org.nslabs/irtransmitter');
      const events = MethodChannel('org.nslabs/irtransmitter_events');
      messenger.setMockMethodCallHandler(events, (_) async => null);
      messenger.setMockMethodCallHandler(channel, (call) async {
        if (call.method == 'performHaptic') return true;
        if (call.method == 'getPreferredTransmitterType') return preferredType;
        if (call.method == 'setPreferredTransmitterType' ||
            call.method == 'setTransmitterType') {
          preferredType = call.arguments['type'] as String;
          return preferredType;
        }
        if (['learnUsbSignal', 'learnHuaweiSignal', 'learnLgSignal']
            .contains(call.method)) {
          return {
            'family': family,
            'frequencyHz': 38000,
            'rawPatternUs': family == 'lge_ir'
                ? <int>[]
                : incomplete
                    ? [560, 560]
                    : [9000, 4500, 560, 560, 560, 560],
            'opaqueFrameBase64': 'AAAAAAAAAAAAAAAA',
            'displayPreview': 'Native English preview',
          };
        }
        if (call.method == 'getTransmitterCapabilities') {
          return {
            'hasUsb': true,
            'usbOpened': true,
            'usbStatus': 'READY',
            'currentType': 'USB',
            'hasHuaweiIrLearning': family == 'huawei_ir',
            'hasLgeIrLearning': family == 'lge_ir',
            'usbDevices': [
              if (family == 'elksmart')
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
      expect(find.text(l10n.learningModeAudioUnavailableTitle), findsOneWidget);
      expect(find.text(l10n.transmitterAudio2), findsOneWidget);
      expect(find.text(l10n.learningModeSupportedReceivers), findsOneWidget);
      final useUsb =
          find.widgetWithText(FilledButton, l10n.learningModeUseUsb).first;
      await tester.ensureVisible(useUsb);
      await tester.pumpAndSettle();
      await tester.tap(useUsb);
      await tester.pumpAndSettle();
      expect(find.text(l10n.learningModeSwitchedUsb), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      expect(find.text(l10n.learningModeReadyToListenBody), findsOneWidget);
      expect(find.textContaining(l10n.learningModeUsbReceiver), findsOneWidget);
      final start =
          find.widgetWithText(FilledButton, l10n.learningModeStartListening);
      await tester.ensureVisible(start);
      await tester.pumpAndSettle();
      expect(tester.widget<FilledButton>(start).onPressed, isNotNull);
      expect(tester.takeException(), isNull);
      await tester.tap(start);
      await tester.pumpAndSettle();
      expect(find.text(l10n.learningModeIncompleteSignal), findsWidgets);
      expect(tester.takeException(), isNull);
      incomplete = false;
      await tester.pump(const Duration(seconds: 5));
      await tester.ensureVisible(start);
      await tester.pumpAndSettle();
      await tester.tap(start);
      await tester.pumpAndSettle();
      expect(find.text(l10n.learningModeCapturedSummary), findsWidgets);
      final rawTab = find.widgetWithText(Tab, l10n.learningModeRawPreviewTitle);
      await tester.ensureVisible(rawTab);
      await tester.pumpAndSettle();
      await tester.tap(rawTab);
      await tester.pumpAndSettle();
      expect(find.widgetWithText(FilledButton, l10n.copyCode), findsOneWidget);
      final save =
          find.widgetWithText(FilledButton, l10n.learningModeSaveCapture);
      await tester.ensureVisible(save);
      await tester.pumpAndSettle();
      expect(tester.widget<FilledButton>(save).onPressed, isNotNull);
      expect(tester.takeException(), isNull);
      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
      for (final internalFamily in ['huawei_ir', 'lge_ir']) {
        family = internalFamily;
        preferredType = 'INTERNAL';
        await tester.pumpWidget(app);
        await tester.pumpAndSettle();
        await tester.ensureVisible(start);
        await tester.pumpAndSettle();
        await tester.tap(start);
        await tester.pumpAndSettle();
        await tester.ensureVisible(find.byType(TabBar));
        await tester.pumpAndSettle();
        final previewText = family == 'lge_ir'
            ? l10n.learningModeLgReplayRestriction
            : l10n.learningModeTimingCount(6);
        await tester.scrollUntilVisible(
          find.textContaining(previewText),
          100,
          scrollable: find.descendant(
            of: find.byType(TabBarView),
            matching: find.byWidgetPredicate((widget) =>
                widget is Scrollable &&
                widget.axisDirection == AxisDirection.down),
          ).first,
        );
        await tester.pumpAndSettle();
        expect(find.textContaining('Native English preview'), findsNothing);
        if (family == 'lge_ir') {
          expect(find.textContaining(l10n.learningModeLgReplayRestriction),
              findsOneWidget);
          expect(find.textContaining(l10n.learningModeByteCount(12)),
              findsOneWidget);
        } else {
          expect(find.textContaining(l10n.learningModeTimingCount(6)),
              findsOneWidget);
        }
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
        await tester.pumpAndSettle();
      }
    });
  }
}
