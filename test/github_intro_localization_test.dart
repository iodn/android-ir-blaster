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
              {'type': 'dir', 'name': 'TVs', 'path': 'TVs'}
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
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      });
    }
  }
}
