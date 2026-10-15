import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/widgets/github_store_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    for (final example in [true, false]) {
      testWidgets('GitHub introduction $locale / example=$example',
          (tester) async {
        final owner = example ? 'Lucaslhm' : 'test';
        final repo = example ? 'Flipper-IRDB' : 'remotes';
        final url = 'https://github.com/$owner/$repo';
        final rawKey = 'dir:v2|$owner|$repo|||public';
        SharedPreferences.setMockInitialValues({
          'irblaster.store.lastRepo': jsonEncode({
            'owner': owner,
            'repo': repo,
            'branch': '',
            'path': '',
            'originalUrl': url,
          }),
          'irblaster.github.cache.dir.${base64Url.encode(utf8.encode(rawKey))}':
              jsonEncode({
            'savedAt': DateTime.now().millisecondsSinceEpoch,
            'items': [
              {'type': 'dir', 'name': 'TVs', 'path': 'TVs'},
              if (!example)
                {'type': 'file', 'name': 'photo.png', 'path': 'photo.png'},
              if (!example)
                {'type': 'file', 'name': 'remote.ir', 'path': 'remote.ir'},
            ],
          }),
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
          home: const GitHubStoreScreen(),
        ));
        await tester.pumpAndSettle();
        final l10n = await AppLocalizations.delegate.load(locale);
        void checkText(String text) {
          final finder = find.text(text);
          final paragraph = tester.renderObject<RenderParagraph>(finder);
          expect(paragraph.didExceedMaxLines, isFalse, reason: text);
          expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
              lessThanOrEqualTo(paragraph.size.height + 0.1),
              reason: text);
          expect(finder.hitTestable(), findsOneWidget);
        }

        if (!example) {
          final prefs = await SharedPreferences.getInstance();
          final before = prefs.getString('irblaster.store.lastRepo');
          final field = find.byType(TextField);
          final messenger = ScaffoldMessenger.of(
              tester.element(find.byType(GitHubStoreScreen)));
          for (final invalid in [
            '',
            'https://example.com/remotes',
            'https://github.com/owner'
          ]) {
            await tester.ensureVisible(field);
            await tester.pumpAndSettle();
            await tester.enterText(field, invalid);
            await tester.testTextInput.receiveAction(TextInputAction.go);
            await tester.pumpAndSettle();
            checkText(l10n.githubEnterRepositoryLink);
            expect(
                tester
                    .getRect(find.text(l10n.githubEnterRepositoryLink))
                    .bottom,
                lessThanOrEqualTo(640));
            expect(tester.widget<TextField>(field).controller!.text, invalid);
            expect(prefs.getString('irblaster.store.lastRepo'), before);
            messenger.removeCurrentSnackBar();
            await tester.pumpAndSettle();
          }
          await tester.enterText(field, url);
        }
        final title =
            example ? l10n.githubExampleTitle : l10n.githubUnopenedTitle;
        final body = example ? l10n.githubExampleBody : l10n.githubUnopenedBody;
        final action =
            example ? l10n.githubBrowseExample : l10n.githubBrowseRepository;
        for (final text in [title, body, action]) {
          final finder = find.text(text);
          await tester.scrollUntilVisible(finder, 300,
              scrollable: find.byType(Scrollable).first);
          await tester.ensureVisible(finder);
          await tester.pumpAndSettle();
          final paragraph = tester.renderObject<RenderParagraph>(finder);
          expect(paragraph.didExceedMaxLines, isFalse, reason: text);
          expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
              lessThanOrEqualTo(paragraph.size.height + 0.1),
              reason: text);
          expect(finder.hitTestable(), findsOneWidget, reason: text);
        }
        expect(
            tester.getRect(find.text(action)).bottom, lessThanOrEqualTo(640));
        await tester.tap(find.text(action));
        await tester.pumpAndSettle();
        expect(find.text(title), findsNothing);
        final directory = find.byWidgetPredicate((widget) =>
            widget is ListTile &&
            widget.title is Text &&
            (widget.title! as Text).data == 'TVs');
        await tester.scrollUntilVisible(directory, 300,
            scrollable: find.byType(Scrollable).first);
        await tester.pumpAndSettle();
        expect(directory.hitTestable(), findsOneWidget);
        if (!example) {
          for (final label in [
            l10n.githubFileImportLabel,
            l10n.githubFileUnsupportedLabel
          ]) {
            await tester.scrollUntilVisible(find.text(label), 300,
                scrollable: find.byType(Scrollable).first);
            await tester.ensureVisible(find.text(label));
            await tester.pumpAndSettle();
            checkText(label);
          }
          final unsupported = find.byWidgetPredicate((widget) =>
              widget is ListTile &&
              widget.title is Text &&
              (widget.title! as Text).data == 'photo.png');
          await tester.scrollUntilVisible(unsupported, 300,
              scrollable: find.byType(Scrollable).first);
          await tester.pumpAndSettle();
          await tester.tap(unsupported);
          await tester.pumpAndSettle();
          checkText(l10n.githubUnsupportedFileType);
          expect(find.byType(GitHubStoreScreen), findsOneWidget);
          ScaffoldMessenger.of(tester.element(find.byType(GitHubStoreScreen)))
              .removeCurrentSnackBar();
          await tester.pumpAndSettle();
          final filter =
              find.widgetWithText(TextField, l10n.githubFilterFolder);
          await tester.scrollUntilVisible(filter, -300,
              scrollable: find.byType(Scrollable).first);
          await tester.pumpAndSettle();
          await tester.enterText(filter, 'no-match');
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pumpAndSettle();
          final empty = find.text(l10n.githubNoMatchingItems);
          await tester.scrollUntilVisible(empty, 300,
              scrollable: find.byType(Scrollable).first);
          await tester.pumpAndSettle();
          checkText(l10n.githubNoMatchingItems);
          expect(tester.widget<TextField>(filter).controller!.text, 'no-match');
          await tester.enterText(filter, 'TV');
          await tester.pumpAndSettle();
          expect(empty, findsNothing);
          await tester.scrollUntilVisible(directory, 300,
              scrollable: find.byType(Scrollable).first);
          expect(directory, findsOneWidget);
        }
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      });
    }
  }
}
