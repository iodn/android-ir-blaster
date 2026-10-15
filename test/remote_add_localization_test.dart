import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/widgets/remote_editor/add_button_sheet.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_draft.dart';
import 'package:irblaster_controller/widgets/remote_studio_screen.dart';

Widget app(Locale locale, Widget home) => MaterialApp(
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1.5)),
        child: child!,
      ),
      home: home,
    );

void compactScreen(WidgetTester tester) {
  tester.view.physicalSize = const Size(320, 640);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('empty studio actions fit: $locale', (tester) async {
      compactScreen(tester);
      await tester.pumpWidget(app(
          locale,
          RemoteStudioScreen(
              initialDraft: RemoteEditorDraft.create(defaultName: 'TV'))));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(RemoteStudioScreen)))!;
      expect(tester.takeException(), isNull);
      for (final label in [
        l10n.importFromDatabase,
        l10n.addButton,
        l10n.importFromRemotes,
        l10n.browseGithubStore,
      ]) {
        final button = find.ancestor(
            of: find.text(label),
            matching: find
                .byWidgetPredicate((widget) => widget is ButtonStyleButton));
        await tester.ensureVisible(button);
        await tester.pumpAndSettle();
        final bounds = tester.getRect(button);
        final text = tester.getRect(find.text(label));
        final paragraph =
            tester.renderObject<RenderParagraph>(find.text(label));
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1),
            reason: '$locale: $label must not be clipped vertically');
        expect(text.top, greaterThanOrEqualTo(bounds.top));
        expect(text.bottom, lessThanOrEqualTo(bounds.bottom));
        expect(bounds.height, greaterThanOrEqualTo(48));
        expect(tester.takeException(), isNull);
      }
    });

    testWidgets('localized add sheet returns the right action: $locale',
        (tester) async {
      compactScreen(tester);
      await tester.pumpWidget(app(locale, const Scaffold()));
      final context = tester.element(find.byType(Scaffold));
      final l10n = AppLocalizations.of(context)!;
      for (final entry in {
        l10n.addButton: AddButtonSheetAction.addButton,
        l10n.importFromRemotes: AddButtonSheetAction.importFromRemotes,
        l10n.importFromDatabase: AddButtonSheetAction.importFromDatabase,
        l10n.browseGithubStore: AddButtonSheetAction.browseGithubStore,
      }.entries) {
        final result = showModalBottomSheet<AddButtonSheetAction>(
          context: context,
          useSafeArea: true,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (_) => const SingleChildScrollView(child: AddButtonSheet()),
        );
        await tester.pumpAndSettle();
        expect(find.text(l10n.moreWaysToStart), findsOneWidget);
        final action = find.text(entry.key).last;
        await tester.ensureVisible(action);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        await tester.tap(action);
        await tester.pumpAndSettle();
        expect(await result, entry.value);
      }
    });
  }
}
