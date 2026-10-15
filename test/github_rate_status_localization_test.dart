import 'dart:async';
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
        SharedPreferences.setMockInitialValues({
          if (use24Hour) 'irblaster.store.githubAuthToken': 'test-token',
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
              alwaysUse24HourFormat: use24Hour,
            ),
            child: child!,
          ),
          home: const GitHubStoreScreen(),
        ));
        await tester.pumpAndSettle();
        await tester.tap(find.byTooltip('GitHub connection'));
        await tester.pumpAndSettle();
        final l10n = await AppLocalizations.delegate.load(locale);
        Future<void> checkLabel(String label,
            {bool longMessage = false}) async {
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
          if (longMessage) {
            await Scrollable.ensureVisible(tester.element(finder),
                alignment: 0);
            await tester.pumpAndSettle();
            expect(tester.getRect(finder).top, greaterThanOrEqualTo(0));
            await Scrollable.ensureVisible(tester.element(finder),
                alignment: 1);
            await tester.pumpAndSettle();
            expect(tester.getRect(finder).bottom, lessThanOrEqualTo(640));
          } else {
            expect(finder.hitTestable(), findsOneWidget, reason: label);
          }
        }

        await checkLabel(l10n.githubConnectionTestTitle);
        await checkLabel(l10n.githubConnectionTestBody);
        await checkLabel(l10n.githubTestAccess);
        final check = tester.widget<FilledButton>(
            find.widgetWithText(FilledButton, l10n.githubTestAccess));
        final reset = DateTime.utc(2030, 3, 15, 13, 5);
        final remaining = use24Hour ? 0 : 1234;
        final response = Completer<http.Response>();
        final requests = <http.Request>[];
        final pending = http.runWithClient(
          () => (check.onPressed! as Future<void> Function())(),
          () => MockClient((request) async {
            requests.add(request);
            return response.future;
          }),
        );
        await tester.pump();
        expect(requests, hasLength(1));
        expect(requests.single.url.path, '/rate_limit');
        expect(requests.single.headers['Authorization'],
            use24Hour ? 'Bearer test-token' : isNull);
        expect(
            tester
                .widget<FilledButton>(
                    find.widgetWithText(FilledButton, l10n.githubTestingAccess))
                .onPressed,
            isNull);
        final pendingLabel = tester
            .renderObject<RenderParagraph>(find.text(l10n.githubTestingAccess));
        expect(pendingLabel.didExceedMaxLines, isFalse);
        response.complete(http.Response(
            jsonEncode({
              'rate': {
                'limit': 5000,
                'remaining': remaining,
                'reset': reset.millisecondsSinceEpoch ~/ 1000,
              }
            }),
            200));
        await pending;
        await tester.pumpAndSettle();
        final material = MaterialLocalizations.of(
            tester.element(find.text(l10n.githubTestAccess)));
        final localReset = reset.toLocal();
        final formatted = '${material.formatCompactDate(localReset)} '
            '${material.formatTimeOfDay(TimeOfDay.fromDateTime(localReset), alwaysUse24HourFormat: use24Hour)}';
        expect(l10n.githubRequestLimit(5000),
            contains(material.formatDecimal(5000)));
        expect(l10n.githubRequestsRemaining(remaining),
            contains(material.formatDecimal(remaining)));
        for (final label in [
          l10n.githubConnectionSuccessful,
          use24Hour
              ? l10n.githubTokenAccessWorking
              : l10n.githubPublicAccessWorking,
          l10n.githubRequestsRemaining(remaining),
          l10n.githubRequestLimit(5000),
          l10n.githubLimitResetTime(formatted),
        ]) {
          await checkLabel(label);
        }
        if (use24Hour) {
          final retry = tester.widget<FilledButton>(
              find.widgetWithText(FilledButton, l10n.githubTestAccess));
          await http.runWithClient(
              () => (retry.onPressed! as Future<void> Function())(),
              () => MockClient((_) async => http.Response('{}', 401)));
          await tester.pumpAndSettle();
          await checkLabel(l10n.githubConnectionTestFailed);
          await checkLabel(l10n.githubAuthenticationFailed, longMessage: true);
          expect(find.text(l10n.githubConnectionSuccessful), findsNothing);
          expect(
              find.text(l10n.githubRequestsRemaining(remaining)), findsNothing);
          expect(
              tester
                  .widget<FilledButton>(
                      find.widgetWithText(FilledButton, l10n.githubTestAccess))
                  .onPressed,
              isNotNull);
        }
        for (final hasResetTime in [false, true]) {
          final retry = tester.widget<FilledButton>(
              find.widgetWithText(FilledButton, l10n.githubTestAccess));
          await http.runWithClient(
              () => (retry.onPressed! as Future<void> Function())(),
              () => MockClient((_) async => http.Response('{}', 403, headers: {
                    if (hasResetTime)
                      'x-ratelimit-reset':
                          '${reset.millisecondsSinceEpoch ~/ 1000}',
                  })));
          await tester.pumpAndSettle();
          final message = hasResetTime
              ? l10n.githubRateLimitAfter(formatted)
              : l10n.githubRateLimitLater;
          await checkLabel(
              use24Hour
                  ? message
                  : '$message\n\n${l10n.githubRateLimitTokenHint}',
              longMessage: true);
          expect(find.text(l10n.githubConnectionSuccessful), findsNothing);
        }
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      });
    }
  }
}
