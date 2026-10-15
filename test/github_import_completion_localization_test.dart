import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/github_store_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    for (final count in [0, 1, 2, 9]) {
      testWidgets('GitHub import completion $locale / $count remotes',
          (tester) async {
        final dir = Directory.systemTemp.createTempSync('github-completion-');
        final original = state.remotes;
        state.remotes = [Remote(id: 100, name: 'Existing TV', buttons: [])];
        final messenger =
            TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
        const channel = MethodChannel('plugins.flutter.io/path_provider');
        messenger.setMockMethodCallHandler(channel, (_) async => dir.path);
        addTearDown(() {
          messenger.setMockMethodCallHandler(channel, null);
          state.remotes = original;
          dir.deleteSync(recursive: true);
        });
        final contents = jsonEncode([
          for (var i = 0; i < count; i++)
            Remote(id: i + 1, name: 'Imported $i', buttons: [
              IRButton(id: 'power-$i', image: 'Power', isImage: false, code: 1),
              IRButton(
                  id: 'volume-$i', image: 'Volume', isImage: false, code: 2),
            ]).toJson(),
        ]);
        String key(String prefix, String raw) =>
            '$prefix${base64Url.encode(utf8.encode(raw))}';
        final now = DateTime.now().millisecondsSinceEpoch;
        SharedPreferences.setMockInitialValues({
          'irblaster.store.lastRepo': jsonEncode({
            'owner': 'test',
            'repo': 'remotes',
            'branch': 'main',
            'path': '',
            'originalUrl': 'https://github.com/test/remotes/tree/main',
          }),
          key('irblaster.github.cache.dir.',
              'dir:v2|test|remotes|main||public'): jsonEncode({
            'savedAt': now,
            'items': [
              {'type': 'file', 'name': 'remote.json', 'path': 'remote.json'}
            ],
          }),
          key('irblaster.github.cache.file.',
              'file|test|remotes|main|remote.json|public'): jsonEncode({
            'savedAt': now,
            'name': 'remote.json',
            'path': 'remote.json',
            'size': contents.length,
            'text': contents,
          }),
        });
        tester.view.physicalSize = const Size(800, 1000);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        var scale = 1.0;
        Widget app() => MaterialApp(
              locale: locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(scale)),
                child: child!,
              ),
              home: const GitHubStoreScreen(),
            );
        await tester.pumpWidget(app());
        await tester.pumpAndSettle();
        final l10n = await AppLocalizations.delegate.load(locale);
        if (count == 0) {
          tester.view.physicalSize = const Size(320, 640);
          scale = 2;
          await tester.pumpWidget(app());
          await tester.pumpAndSettle();
          for (final label in [
            l10n.githubRepositoryUrl,
            l10n.githubBrowse,
            l10n.githubSaveRepository
          ]) {
            final text = find.text(label);
            await tester.ensureVisible(text);
            await tester.pumpAndSettle();
            final paragraph = tester.renderObject<RenderParagraph>(text);
            expect(paragraph.didExceedMaxLines, isFalse);
            expect(paragraph.size.height, lessThanOrEqualTo(160),
                reason: label);
            expect(text.hitTestable(), findsOneWidget);
          }
        }
        await tester.ensureVisible(find.text(l10n.githubBrowse));
        await tester.pumpAndSettle();
        await tester.tap(find.text(l10n.githubBrowse));
        await tester.pumpAndSettle();
        if (count == 0) {
          final filter =
              find.widgetWithText(TextField, l10n.githubFilterFolder);
          await tester.scrollUntilVisible(filter, 300,
              scrollable: find.byType(Scrollable).first);
          await tester.ensureVisible(filter);
          await tester.pumpAndSettle();
          final hint = tester.renderObject<RenderParagraph>(
              find.text(l10n.githubFilterFolder));
          expect(hint.didExceedMaxLines, isFalse);
          expect(hint.getMaxIntrinsicHeight(hint.size.width),
              lessThanOrEqualTo(hint.size.height + 0.1));
          final parent = find.text(l10n.githubParentFolder);
          await tester.ensureVisible(parent);
          await tester.pumpAndSettle();
          final p = tester.renderObject<RenderParagraph>(parent);
          expect(p.didExceedMaxLines, isFalse);
          expect(p.getMaxIntrinsicHeight(p.size.width),
              lessThanOrEqualTo(p.size.height + 0.1));
          await tester.enterText(filter, 'does-not-exist');
          await tester.pumpAndSettle();
          expect(find.widgetWithText(ListTile, 'remote.json'), findsNothing);
          await tester.enterText(filter, 'remote');
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pumpAndSettle();
          expect(tester.widget<TextField>(filter).controller!.text, 'remote');
          tester.view.physicalSize = const Size(800, 1000);
          scale = 1;
          await tester.pumpWidget(app());
          await tester.pumpAndSettle();
        }
        await tester
            .ensureVisible(find.widgetWithText(ListTile, 'remote.json').first);
        await tester.tap(find.widgetWithText(ListTile, 'remote.json').first);
        await tester.pumpAndSettle();
        tester.view.physicalSize = const Size(320, 640);
        scale = 2;
        await tester.pumpWidget(app());
        await tester.pumpAndSettle();
        for (final label in [
          l10n.importPreviewJsonFormat,
          count == 0 ? l10n.githubImportUnavailable : l10n.githubImportReady,
          count == 0
              ? l10n.importPreviewNoJsonButtons
              : l10n.importPreviewReady,
          l10n.githubImportPreviewCounts(count, count * 2),
          if (count > 8) l10n.githubImportMoreRemotes(count - 8),
          if (count == 0) l10n.githubImportFileIssues,
          if (count == 0) l10n.importPreviewJsonGuidance,
        ]) {
          final text = find.text(label);
          await tester.scrollUntilVisible(text, 250,
              scrollable: find.byType(Scrollable).first);
          await tester.ensureVisible(text);
          await tester.pumpAndSettle();
          final paragraph = tester.renderObject<RenderParagraph>(text);
          expect(paragraph.didExceedMaxLines, isFalse, reason: label);
          expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
              lessThanOrEqualTo(paragraph.size.height + 0.1),
              reason: label);
          expect(tester.getRect(text).top, greaterThanOrEqualTo(0));
          expect(tester.getRect(text).bottom, lessThanOrEqualTo(640));
        }
        final previewTitle = find.text(l10n.githubFilePreview);
        await tester.scrollUntilVisible(previewTitle, 300,
            scrollable: find.byType(Scrollable).first);
        await tester.pumpAndSettle();
        final titleParagraph =
            tester.renderObject<RenderParagraph>(previewTitle);
        expect(titleParagraph.didExceedMaxLines, isFalse);
        expect(titleParagraph.getMaxIntrinsicHeight(titleParagraph.size.width),
            lessThanOrEqualTo(titleParagraph.size.height + 0.1));
        for (final tooltip in [l10n.githubUnwrapLines, l10n.githubWrapLines]) {
          final toggle = find.byTooltip(tooltip);
          await tester.ensureVisible(toggle);
          await tester.pumpAndSettle();
          expect(toggle.hitTestable(), findsOneWidget);
          await tester.longPress(toggle);
          await tester.pumpAndSettle();
          final tooltipText = find.text(tooltip);
          final paragraph = tester.renderObject<RenderParagraph>(tooltipText);
          expect(paragraph.didExceedMaxLines, isFalse);
          expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
              lessThanOrEqualTo(paragraph.size.height + 0.1));
          Tooltip.dismissAllToolTips();
          await tester.pumpAndSettle();
          await tester.tap(toggle);
          await tester.pumpAndSettle();
          final horizontalPreview = find.byWidgetPredicate((widget) =>
              widget is SingleChildScrollView &&
              widget.scrollDirection == Axis.horizontal);
          expect(
              horizontalPreview,
              tooltip == l10n.githubUnwrapLines
                  ? findsOneWidget
                  : findsNothing);
        }
        final newRemoteLabel = count == 1
            ? l10n.githubImportNewRemote
            : l10n.githubImportNewRemotes;
        for (final label in [newRemoteLabel, l10n.githubImportIntoRemote]) {
          final text = find.text(label);
          await tester.scrollUntilVisible(text, 300,
              scrollable: find.byType(Scrollable).first);
          await tester.ensureVisible(text);
          await tester.pumpAndSettle();
          final paragraph = tester.renderObject<RenderParagraph>(text);
          expect(paragraph.didExceedMaxLines, isFalse, reason: label);
          expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
              lessThanOrEqualTo(paragraph.size.height + 0.1),
              reason: label);
          expect(text.hitTestable(), findsOneWidget);
          expect(tester.getRect(text).top, greaterThanOrEqualTo(0));
          expect(tester.getRect(text).bottom, lessThanOrEqualTo(640));
        }
        final save = find.widgetWithText(FilledButton, newRemoteLabel);
        await tester.ensureVisible(save);
        if (count == 0) {
          expect(tester.widget<FilledButton>(save).onPressed, isNull);
          expect(
              tester
                  .widget<OutlinedButton>(find.widgetWithText(
                      OutlinedButton, l10n.githubImportIntoRemote))
                  .onPressed,
              isNull);
          expect(state.remotes, hasLength(1));
          await tester.pumpWidget(const SizedBox());
          return;
        }
        await tester.runAsync(() async {
          tester.widget<FilledButton>(save).onPressed!();
        });
        final deadline = DateTime.now().add(const Duration(seconds: 10));
        while (find.byType(BottomSheet).evaluate().isEmpty &&
            DateTime.now().isBefore(deadline)) {
          await tester.runAsync(
              () => Future<void>.delayed(const Duration(milliseconds: 20)));
          await tester.pump();
        }
        await tester.pumpAndSettle();
        expect(state.remotes, hasLength(count + 1));
        tester.view.physicalSize = const Size(320, 640);
        scale = 2;
        await tester.pumpWidget(app());
        await tester.pumpAndSettle();
        final sheet = find.byType(BottomSheet);
        expect(sheet, findsOneWidget);
        for (final label in [
          l10n.githubImportComplete,
          count == 1
              ? l10n.githubImportNextStep
              : l10n.githubImportRemoteCount(count),
          if (count == 1) l10n.githubImportOpenRemote,
          l10n.githubImportContinueBrowsing,
        ]) {
          final text = find.descendant(of: sheet, matching: find.text(label));
          final p = tester.renderObject<RenderParagraph>(text);
          expect(p.didExceedMaxLines, isFalse, reason: label);
          expect(p.getMaxIntrinsicHeight(p.size.width),
              lessThanOrEqualTo(p.size.height + 0.1),
              reason: label);
          await tester.ensureVisible(text);
          await tester.pumpAndSettle();
          if (label == l10n.githubImportOpenRemote ||
              label == l10n.githubImportContinueBrowsing) {
            expect(text.hitTestable(), findsOneWidget);
            expect(tester.getRect(text).top, greaterThanOrEqualTo(0));
            expect(tester.getRect(text).bottom, lessThanOrEqualTo(640));
          }
        }
        if (count > 1) {
          expect(find.text(l10n.githubImportOpenRemote), findsNothing);
        }
        final browse = find.text(l10n.githubImportContinueBrowsing);
        expect(browse.hitTestable(), findsOneWidget);
        tester.view.physicalSize = const Size(800, 1000);
        scale = 1;
        await tester.pumpWidget(app());
        await tester.pumpAndSettle();
        await tester.ensureVisible(browse);
        await tester.tap(browse);
        final returnDeadline = DateTime.now().add(const Duration(seconds: 5));
        while (find.byType(GitHubStoreScreen).evaluate().isEmpty &&
            DateTime.now().isBefore(returnDeadline)) {
          await tester.runAsync(
              () => Future<void>.delayed(const Duration(milliseconds: 20)));
          await tester.pumpAndSettle();
        }
        expect(find.byType(BottomSheet), findsNothing);
        expect(find.byType(GitHubStoreScreen), findsOneWidget);
        expect(save, findsNothing);
        await tester.pumpWidget(const SizedBox());
      });
    }
  }
}
