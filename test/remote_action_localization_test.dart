import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:irblaster_controller/widgets/create_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('remote actions are readable without sending: $locale',
        (tester) async {
      SharedPreferences.setMockInitialValues({});
      const channel = MethodChannel('org.nslabs/irtransmitter');
      final calls = <MethodCall>[];
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(channel, (call) async {
        calls.add(call);
        if (call.method == 'getTransmitterCapabilities') {
          return {'hasInternal': true};
        }
        return true;
      });
      addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
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
              .copyWith(textScaler: const TextScaler.linear(1.5)),
          child: child!,
        ),
        home: RemoteView(
            remote: Remote(name: 'TV', buttons: const [
          IRButton(id: 'power', image: 'Power', isImage: false, code: 0xFF01FE),
        ])),
      ));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(RemoteView)))!;
      await tester.longPress(find.text('Power').first);
      await tester.pumpAndSettle();
      for (final text in [
        l10n.editButtonSubtitle,
        l10n.newButton,
        l10n.newButtonSubtitle,
        l10n.duplicateButtonSubtitle,
        l10n.deviceControlsButtonSubtitle,
        l10n.quickTileButtonSubtitle,
        l10n.addHomeWidgetSubtitle,
        l10n.duplicateAndEditSubtitle,
      ]) {
        final finder = find.text(text);
        await Scrollable.ensureVisible(tester.element(finder), alignment: 0.5);
        await tester.pumpAndSettle();
        final p = tester.renderObject<RenderParagraph>(finder);
        expect(p.didExceedMaxLines, isFalse, reason: text);
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1),
            reason: text);
        expect(tester.takeException(), isNull);
      }
      expect(
          calls.where((call) => call.method.startsWith('transmit')), isEmpty);
      await Scrollable.ensureVisible(tester.element(find.text(l10n.newButton)),
          alignment: 0.5);
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.newButton));
      await tester.pumpAndSettle();
      expect(
          tester.widget<CreateButton>(find.byType(CreateButton)).button!.image,
          l10n.newButton);
      Navigator.of(tester.element(find.byType(CreateButton))).pop();
      await tester.pumpAndSettle();
      expect(find.byType(RemoteView), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
