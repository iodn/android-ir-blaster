import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/widgets/github_store_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('saved GitHub links: $locale', (tester) async {
      SharedPreferences.setMockInitialValues({});
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
        home: const GitHubStoreScreen(),
      ));
      await tester.pumpAndSettle();
      final l10n = await AppLocalizations.delegate.load(locale);
      final context = tester.element(find.byType(GitHubStoreScreen));
      final messenger = ScaffoldMessenger.of(context);
      void checkReadable(String text) {
        final finder = find.text(text);
        expect(finder, findsOneWidget);
        final paragraph = tester.renderObject<RenderParagraph>(finder);
        expect(paragraph.didExceedMaxLines, isFalse, reason: text);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1),
            reason: text);
        expect(tester.getRect(finder).top, greaterThanOrEqualTo(0));
        expect(tester.getRect(finder).bottom, lessThanOrEqualTo(640));
      }

      final saved = find.byWidgetPredicate((widget) =>
          widget is IconButton && widget.tooltip == l10n.githubSavedLinks);
      expect(tester.widget<IconButton>(saved).onPressed, isNull);
      // The empty state is guarded by a disabled button; check its message
      // independently rather than invoking an unreachable UI action.
      messenger.showSnackBar(SnackBar(content: Text(l10n.githubNoSavedLinks)));
      await tester.pumpAndSettle();
      checkReadable(l10n.githubNoSavedLinks);
      messenger.removeCurrentSnackBar();
      await tester.pumpAndSettle();

      final save = find.text(l10n.githubSaveRepository);
      await tester.ensureVisible(save);
      await tester.pumpAndSettle();
      await tester.tap(save);
      await tester.pumpAndSettle();
      checkReadable(l10n.githubLinkSaved);
      final prefs = await SharedPreferences.getInstance();
      const key = 'irblaster.store.sources';
      final stored = prefs.getString(key)!;
      final sources = jsonDecode(stored) as List;
      expect(sources, hasLength(1));
      expect(sources.single['originalUrl'],
          'https://github.com/Lucaslhm/Flipper-IRDB');
      messenger.removeCurrentSnackBar();
      await tester.pumpAndSettle();

      await tester.ensureVisible(save);
      await tester.pumpAndSettle();
      await tester.tap(save);
      await tester.pumpAndSettle();
      checkReadable(l10n.githubLinkAlreadySaved);
      expect(prefs.getString(key), stored);
      messenger.removeCurrentSnackBar();
      await tester.pumpAndSettle();

      await tester.longPress(saved);
      await tester.pumpAndSettle();
      checkReadable(l10n.githubSavedLinks);
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await tester.tap(saved);
      await tester.pumpAndSettle();
      checkReadable(l10n.githubChooseLink);
      // Find the saved alias rather than the URL, which also appears above.
      final link = find.widgetWithText(ListTile, 'Lucaslhm/Flipper-IRDB').last;
      await tester.tap(link);
      await tester.pumpAndSettle();
      expect(find.byType(BottomSheet), findsNothing);
      expect(prefs.getString(key), stored);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    });
  }
}
