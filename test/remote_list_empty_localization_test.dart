import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/db_bulk_import_sheet.dart';
import 'package:irblaster_controller/widgets/remote_list.dart';
import 'package:irblaster_controller/widgets/remote_setup_screen.dart';
import 'package:irblaster_controller/widgets/remote_studio_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('an empty remote list can start with database buttons',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    final previous = state.remotes;
    state.remotes = [];
    addTearDown(() => state.remotes = previous);
    tester.view.physicalSize = const Size(640, 320);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    await tester.pumpWidget(const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: RemoteList(),
    ));
    await tester.pumpAndSettle();
    final l10n = AppLocalizations.of(tester.element(find.byType(RemoteList)))!;
    final import = find.text(l10n.importFromDatabase);

    await tester.ensureVisible(import);
    await tester.pumpAndSettle();
    await tester.tap(import);
    await tester.pumpAndSettle();
    expect(find.byType(DbBulkImportSheet), findsOneWidget);
    expect(find.byType(RemoteSetupScreen), findsNothing);
    final brand = find.text(l10n.selectBrand);
    await tester.ensureVisible(brand);
    await tester.pumpAndSettle();
    expect(brand.hitTestable(), findsOneWidget);
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(state.remotes, isEmpty);

    await tester.ensureVisible(import);
    await tester.pumpAndSettle();
    await tester.tap(import);
    await tester.pumpAndSettle();
    Navigator.of(tester.element(find.byType(DbBulkImportSheet)))
        .pop<List<IRButton>>(const [
      IRButton(id: 'db-power', image: 'Power', isImage: false, code: 0xFF01FE),
    ]);
    await tester.pumpAndSettle();
    final studio = tester.widget<RemoteStudioScreen>(
        find.byType(RemoteStudioScreen));
    expect(studio.initialDraft.buttons.single.id, 'db-power');
    expect(state.remotes, isEmpty);
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.text(l10n.unsavedRemoteStudioChangesMessage), findsOneWidget);
    await tester.tap(find.text(l10n.discard));
    await tester.pumpAndSettle();
    expect(find.byType(RemoteStudioScreen), findsNothing);
    expect(state.remotes, isEmpty);
    expect(tester.takeException(), isNull);
  });

  for (final locale in AppLocalizations.supportedLocales) {
    for (final size in [const Size(320, 640), const Size(640, 320)]) {
      testWidgets('empty remote list readable: $locale $size', (tester) async {
        SharedPreferences.setMockInitialValues({});
        final oldRemotes = state.remotes;
        state.remotes = [];
        addTearDown(() => state.remotes = oldRemotes);
        tester.view.physicalSize = size;
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
        expect(find.byTooltip(l10n.reorderRemotes), findsNothing);
        for (final value in [
          l10n.noRemotesYet,
          l10n.noRemotesDescription,
          l10n.noRemotesNextStep,
          l10n.importFromDatabase,
        ]) {
          final text = find.text(value);
          await tester.ensureVisible(text);
          await tester.pumpAndSettle();
          final paragraph = tester.renderObject<RenderParagraph>(text);
          expect(paragraph.didExceedMaxLines, isFalse);
          expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
              lessThanOrEqualTo(paragraph.size.height + 0.1));
          final rect = tester.getRect(text);
          expect(rect.left, greaterThanOrEqualTo(0));
          expect(rect.right, lessThanOrEqualTo(size.width));
        }
        final add = find.widgetWithText(FilledButton, l10n.addRemote);
        await tester.ensureVisible(add);
        await tester.pumpAndSettle();
        expect(add.hitTestable(), findsOneWidget);
        await tester.tap(add);
        await tester.pumpAndSettle();
        expect(find.byType(RemoteSetupScreen), findsOneWidget);
        expect(state.remotes, isEmpty);
        await tester.pumpWidget(const SizedBox());
        await tester.pumpAndSettle();
      });
    }
  }
}
