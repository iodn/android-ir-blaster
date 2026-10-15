import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/remote_highlights_prefs.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remote_grid_layout.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('remote pin menu and feedback fit: $locale', (tester) async {
      SharedPreferences.setMockInitialValues({});
      const channel = MethodChannel('org.nslabs/irtransmitter');
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(
          channel, (_) async => {'hasInternal': true});
      addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final remote = Remote(id: 1, name: 'TV', buttons: []);
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: RemoteView(remote: remote),
      ));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(RemoteView)))!;
      Future<void> readable(String message) async {
        final text = find.text(message);
        expect(text, findsOneWidget);
        await tester.ensureVisible(text);
        await tester.pumpAndSettle();
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse, reason: message);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1),
            reason: message);
        final rect = tester.getRect(text);
        expect(rect.left, greaterThanOrEqualTo(0));
        expect(rect.right, lessThanOrEqualTo(320));
      }

      for (final layout in [
        l10n.layoutCompact,
        l10n.layoutComfort,
        l10n.layoutCustom
      ]) {
        remote.useNewStyle = layout == l10n.layoutComfort;
        remote.gridLayout =
            layout == l10n.layoutCustom ? RemoteGridLayout(columns: 3) : null;
        await tester.tap(find.byTooltip(l10n.manageRemote));
        await tester.pumpAndSettle();
        await readable(l10n.remoteLayoutSummary(remote.buttons.length, layout));
        Navigator.of(tester.element(find.byType(BottomSheet))).pop();
        await tester.pumpAndSettle();
      }
      for (final pinned in [false, true]) {
        await tester.tap(find.byTooltip(l10n.manageRemote));
        await tester.pumpAndSettle();
        await readable(l10n.pinRemoteSubtitle);
        await readable(l10n.editRemoteActionsSubtitle);
        final action = pinned ? l10n.unpinRemote : l10n.pinRemote;
        await readable(action);
        await tester.tap(find.text(action));
        await tester.pumpAndSettle();
        expect(find.byType(BottomSheet), findsNothing);
        expect(await RemoteHighlightsPrefs.isPinned(remote), !pinned);
        await readable(
            pinned ? l10n.remoteRemovedFromPinned : l10n.remoteAddedToPinned);
        ScaffoldMessenger.of(tester.element(find.byType(RemoteView)))
            .removeCurrentSnackBar();
        await tester.pumpAndSettle();
      }
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
