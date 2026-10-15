import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/continue_context_prefs.dart';
import 'package:irblaster_controller/state/remote_highlights_prefs.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/remote_list.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('last remote shortcut readable: $locale', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final oldRemotes = state.remotes;
      addTearDown(() => state.remotes = oldRemotes);
      state.remotes = [Remote(id: 2, name: 'Other', buttons: [])];
      await RemoteHighlightsPrefs.pin(state.remotes.single);
      const channel = MethodChannel('org.nslabs/irtransmitter');
      final messenger = tester.binding.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(
          channel, (_) async => {'hasInternal': true});
      addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
      await ContinueContextsPrefs.saveLastRemote(
          Remote(id: 1, name: 'TV', buttons: []));
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
        home: const RemoteList(),
      ));
      await tester.pumpAndSettle();
      final l10n = await AppLocalizations.delegate.load(locale);
      for (final value in [l10n.continueLastRemoteTitle, 'TV']) {
        final text = find.text(value);
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse, reason: value);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1));
      }
      await tester.tap(find.text('TV'));
      await tester.pumpAndSettle();
      final text = find.text(l10n.continueTargetUnavailable);
      expect(text, findsOneWidget);
      final paragraph = tester.renderObject<RenderParagraph>(text);
      expect(paragraph.didExceedMaxLines, isFalse);
      expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
          lessThanOrEqualTo(paragraph.size.height + 0.1));
      expect(state.remotes.single.id, 2);
      ScaffoldMessenger.of(tester.element(find.byType(RemoteList)))
          .removeCurrentSnackBar();
      final strip = find.byWidgetPredicate(
          (w) => w is ListView && w.scrollDirection == Axis.horizontal);
      final pinned = find.descendant(
          of: strip, matching: find.text(l10n.pinnedRemoteLabel));
      if (pinned.evaluate().isEmpty) {
        await tester.scrollUntilVisible(pinned, 100,
            scrollable:
                find.descendant(of: strip, matching: find.byType(Scrollable)));
      }
      await tester.ensureVisible(pinned);
      await tester.pumpAndSettle();
      final pinnedParagraph = tester.renderObject<RenderParagraph>(pinned);
      expect(pinnedParagraph.didExceedMaxLines, isFalse);
      expect(pinnedParagraph.getMaxIntrinsicHeight(pinnedParagraph.size.width),
          lessThanOrEqualTo(pinnedParagraph.size.height + 0.1));
      expect(find.descendant(of: strip, matching: find.text(l10n.pinRemote)),
          findsNothing);
      expect(pinned.hitTestable(), findsOneWidget);
      await tester.tap(pinned);
      await tester.pumpAndSettle();
      expect(tester.widget<RemoteView>(find.byType(RemoteView)).remote.id, 2);
      expect(
          await RemoteHighlightsPrefs.isPinned(state.remotes.single), isTrue);
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
