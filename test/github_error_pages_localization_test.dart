import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/widgets/github_store_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    for (final preview in [false, true]) {
      testWidgets('GitHub error page $locale / preview=$preview',
          (tester) async {
        final cache =
            base64Url.encode(utf8.encode('dir:v2|test|remotes|main||public'));
        SharedPreferences.setMockInitialValues({
          'irblaster.store.lastRepo': jsonEncode({
            'owner': 'test',
            'repo': 'remotes',
            'branch': 'main',
            'path': '',
            'originalUrl': 'https://github.com/test/remotes/tree/main',
          }),
          if (preview)
            'irblaster.github.cache.dir.$cache': jsonEncode({
              'savedAt': DateTime.now().millisecondsSinceEpoch,
              'items': [
                {'type': 'file', 'name': 'code.ir', 'path': 'code.ir'}
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
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(2),
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          ),
          home: const GitHubStoreScreen(),
        ));
        await tester.pumpAndSettle();
        final l10n = await AppLocalizations.delegate.load(locale);
        final reset = DateTime.utc(2030, 3, 15, 13, 5);
        final material = MaterialLocalizations.of(
            tester.element(find.byType(GitHubStoreScreen)));
        final local = reset.toLocal();
        final date = '${material.formatCompactDate(local)} '
            '${material.formatTimeOfDay(TimeOfDay.fromDateTime(local), alwaysUse24HourFormat: true)}';
        final message = '${l10n.githubRateLimitAfter(date)}\n\n'
            '${l10n.githubRateLimitTokenHint}';
        Finder action = find.text(l10n.githubBrowseRepository);
        await tester.scrollUntilVisible(action, 300,
            scrollable: find.byType(Scrollable).first);
        await tester.pumpAndSettle();
        if (preview) {
          await tester.tap(action);
          await tester.pumpAndSettle();
          action = find.byWidgetPredicate((widget) =>
              widget is ListTile &&
              widget.title is Text &&
              (widget.title! as Text).data == 'code.ir');
          await tester.scrollUntilVisible(action, 300,
              scrollable: find.byType(Scrollable).first);
          await tester.pumpAndSettle();
        }
        var requests = 0;
        await http.runWithClient(() async {
          await tester.tap(action);
          await tester.pumpAndSettle();
        },
            () => MockClient((_) async {
                  requests++;
                  return http.Response('{}', 403, headers: {
                    'x-ratelimit-reset':
                        '${reset.millisecondsSinceEpoch ~/ 1000}',
                  });
                }));
        expect(requests, 1);
        final error = find.text(message);
        expect(error, findsOneWidget);
        final paragraph = tester.renderObject<RenderParagraph>(error);
        expect(paragraph.didExceedMaxLines, isFalse);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1),
            reason: message);
        await Scrollable.ensureVisible(tester.element(error), alignment: 0);
        await tester.pumpAndSettle();
        expect(tester.getRect(error).top, greaterThanOrEqualTo(0));
        await Scrollable.ensureVisible(tester.element(error), alignment: 1);
        await tester.pumpAndSettle();
        expect(tester.getRect(error).bottom, lessThanOrEqualTo(640));
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      });
    }
  }
}
