import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/widgets/github_store_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('saving a changed token clears previous connection results',
      (tester) async {
    const key = 'irblaster.store.githubAuthToken';
    SharedPreferences.setMockInitialValues({key: 'old-test-token'});
    await tester.pumpWidget(const MaterialApp(
      locale: Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: GitHubStoreScreen(),
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('GitHub connection'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Test GitHub access'), 300,
        scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
    var requests = 0;
    final check = tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Test GitHub access'));
    await http.runWithClient(
        () => (check.onPressed! as Future<void> Function())(),
        () => MockClient((request) async {
              requests++;
              expect(
                  request.url.toString(), 'https://api.github.com/rate_limit');
              expect(
                  request.headers['Authorization'], contains('old-test-token'));
              return http.Response('{"rate":{"limit":60,"remaining":59}}', 200);
            }));
    await tester.pumpAndSettle();
    expect(requests, 1);
    await tester.scrollUntilVisible(find.text('Connection ready'), 300,
        scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
    expect(find.text('Remaining: 59'), findsOneWidget);
    final field = find.byType(TextField);
    await tester.scrollUntilVisible(field, -300,
        scrollable: find.byType(Scrollable).first);
    await tester.enterText(field, 'new-test-token');
    await tester.ensureVisible(find.text('Update token'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Update token'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Settings saved'), 300,
        scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
    expect(find.text('Connection ready'), findsNothing);
    expect(find.text('Remaining: 59'), findsNothing);
    expect(find.text('Limit: 60'), findsNothing);
    expect(find.text('Token saved on this device.'), findsOneWidget);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(key), 'new-test-token');
    expect(requests, 1);
    await tester.pumpWidget(const SizedBox());
  });

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('GitHub token save feedback $locale', (tester) async {
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
      await tester.tap(find.byTooltip('GitHub connection'));
      await tester.pumpAndSettle();
      final l10n = await AppLocalizations.delegate.load(locale);
      final prefs = await SharedPreferences.getInstance();
      const key = 'irblaster.store.githubAuthToken';

      Future<void> reveal(Finder finder, double direction) async {
        await tester.scrollUntilVisible(finder, direction,
            scrollable: find.byType(Scrollable).first);
        await tester.ensureVisible(finder);
        await tester.pumpAndSettle();
      }

      Future<void> checkMessage(String text, {bool tooltip = false}) async {
        final finder = find.text(text);
        if (!tooltip) await reveal(finder, 300);
        final paragraph = tester.renderObject<RenderParagraph>(finder);
        expect(paragraph.didExceedMaxLines, isFalse, reason: text);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1),
            reason: text);
        if (tooltip) {
          final rect = tester.getRect(finder);
          expect(rect.top, greaterThanOrEqualTo(0));
          expect(rect.bottom, lessThanOrEqualTo(640));
          expect(rect.left, greaterThanOrEqualTo(0));
          expect(rect.right, lessThanOrEqualTo(320));
        } else {
          expect(finder.hitTestable(), findsOneWidget, reason: text);
        }
      }

      final field = find.byType(TextField);
      await reveal(field, 300);
      expect(tester.widget<TextField>(field).obscureText, isTrue);
      await checkMessage(l10n.githubTokenTitle);
      await checkMessage(l10n.githubTokenOptionalBody);
      await reveal(field, 300);
      await tester.enterText(field, 'visibility-test');
      await tester.longPress(find.byTooltip(l10n.githubShowToken));
      await tester.pumpAndSettle();
      await checkMessage(l10n.githubShowToken, tooltip: true);
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip(l10n.githubShowToken));
      await tester.pumpAndSettle();
      expect(tester.widget<TextField>(field).obscureText, isFalse);
      expect(
          tester.widget<TextField>(field).controller!.text, 'visibility-test');
      await tester.longPress(find.byTooltip(l10n.githubHideToken));
      await tester.pumpAndSettle();
      await checkMessage(l10n.githubHideToken, tooltip: true);
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip(l10n.githubHideToken));
      await tester.pumpAndSettle();
      expect(tester.widget<TextField>(field).obscureText, isTrue);
      expect(prefs.containsKey(key), isFalse);
      await checkMessage(l10n.githubTokenStorageNote);
      for (final (token, label) in [
        ('test-token', l10n.githubSaveToken),
        ('updated-token', l10n.githubUpdateToken),
      ]) {
        await reveal(field, -300);
        await tester.enterText(field, '  $token  ');
        await checkMessage(label);
        expect(tester.getSize(find.text(label)).height, lessThanOrEqualTo(160),
            reason: 'Token actions should not become narrow columns of text');
        await tester.tap(find.text(label));
        await tester.pumpAndSettle();
        expect(prefs.getString(key), token);
        await checkMessage(l10n.githubSettingsSaved);
        await checkMessage(l10n.githubTokenSaved);
        expect(find.text('Connection ready'), findsNothing);
        expect(find.text('GitHub token is working.'), findsNothing);
      }
      await reveal(find.text(l10n.remove), -300);
      await tester.tap(find.text(l10n.remove));
      await tester.pumpAndSettle();
      expect(prefs.containsKey(key), isFalse);
      await checkMessage(l10n.githubSettingsSaved);
      await checkMessage(l10n.githubTokenRemoved);
      expect(find.text('Connection ready'), findsNothing);
      await reveal(field, -300);
      expect(tester.widget<TextField>(field).controller!.text, isEmpty);
      await checkMessage(l10n.githubSaveToken);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    });
  }
}
