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
    for (final use24Hour in [false, true]) {
      testWidgets('GitHub rate status $locale / 24h=$use24Hour',
          (tester) async {
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
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(2),
              alwaysUse24HourFormat: use24Hour,
            ),
            child: child!,
          ),
          home: const GitHubStoreScreen(),
        ));
        await tester.pumpAndSettle();
        await tester.tap(find.byTooltip('GitHub connection'));
        await tester.pumpAndSettle();
        await tester.scrollUntilVisible(find.text('Test GitHub access'), 300,
            scrollable: find.byType(Scrollable).first);
        await tester.pumpAndSettle();
        final check = tester.widget<FilledButton>(
            find.widgetWithText(FilledButton, 'Test GitHub access'));
        final reset = DateTime.utc(2030, 3, 15, 13, 5);
        final remaining = use24Hour ? 0 : 1234;
        await http.runWithClient(
          () => (check.onPressed! as Future<void> Function())(),
          () => MockClient((request) async {
            expect(request.url.path, '/rate_limit');
            return http.Response(
                jsonEncode({
                  'rate': {
                    'limit': 5000,
                    'remaining': remaining,
                    'reset': reset.millisecondsSinceEpoch ~/ 1000,
                  }
                }),
                200);
          }),
        );
        await tester.pumpAndSettle();
        final l10n = await AppLocalizations.delegate.load(locale);
        final material = MaterialLocalizations.of(
            tester.element(find.text('Test GitHub access')));
        final localReset = reset.toLocal();
        final formatted = '${material.formatCompactDate(localReset)} '
            '${material.formatTimeOfDay(TimeOfDay.fromDateTime(localReset), alwaysUse24HourFormat: use24Hour)}';
        expect(l10n.githubRequestLimit(5000),
            contains(material.formatDecimal(5000)));
        expect(l10n.githubRequestsRemaining(remaining),
            contains(material.formatDecimal(remaining)));
        for (final label in [
          l10n.githubRequestsRemaining(remaining),
          l10n.githubRequestLimit(5000),
          l10n.githubLimitResetTime(formatted),
        ]) {
          final finder = find.text(label);
          await tester.scrollUntilVisible(finder, 300,
              scrollable: find.byType(Scrollable).first);
          await tester.ensureVisible(finder);
          await tester.pumpAndSettle();
          final paragraph = tester.renderObject<RenderParagraph>(finder);
          expect(paragraph.didExceedMaxLines, isFalse, reason: label);
          expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
              lessThanOrEqualTo(paragraph.size.height + 0.1),
              reason: label);
          expect(finder.hitTestable(), findsOneWidget, reason: label);
        }
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      });
    }
  }
}
