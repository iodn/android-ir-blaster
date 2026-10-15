import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remote_grid_layout.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_custom_grid.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_draft.dart';
import 'package:irblaster_controller/widgets/remote_studio_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    for (final scale in [1.5, 2.0]) {
      testWidgets(
          'editor feedback and discard actions are readable: $locale / $scale',
          (tester) async {
        SharedPreferences.setMockInitialValues({});
        const channel = MethodChannel('org.nslabs/irtransmitter');
        final messenger =
            TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
        messenger.setMockMethodCallHandler(channel, (_) async => null);
        addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
        tester.view.physicalSize = const Size(320, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final navigator = GlobalKey<NavigatorState>();
        await tester.pumpWidget(MaterialApp(
          navigatorKey: navigator,
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(scale)),
            child: child!,
          ),
          home: const Scaffold(),
        ));
        Future<Remote?> open({String name = 'TV'}) =>
            navigator.currentState!.push<Remote>(MaterialPageRoute(
              builder: (_) => RemoteStudioScreen(
                initialDraft: RemoteEditorDraft.fromRemote(Remote(
                  name: name,
                  buttons: const [
                    IRButton(id: 'power', image: 'Power', isImage: false)
                  ],
                  gridLayout: RemoteGridLayout(columns: 3, cells: ['power']),
                )),
              ),
            ));
        RemoteGridLayout grid() => tester
            .widget<RemoteCustomGrid>(find.byType(RemoteCustomGrid))
            .layout;
        void readable(String text, {Finder? within}) {
          final finder = within == null
              ? find.text(text)
              : find.descendant(of: within, matching: find.text(text));
          expect(finder, findsOneWidget);
          final p = tester.renderObject<RenderParagraph>(finder);
          expect(p.didExceedMaxLines, isFalse, reason: text);
          expect(p.getMaxIntrinsicHeight(p.size.width),
              lessThanOrEqualTo(p.size.height + 0.1),
              reason: text);
        }

        final result = open();
        await tester.pumpAndSettle();
        final l10n = AppLocalizations.of(
            tester.element(find.byType(RemoteStudioScreen)))!;
        readable(l10n.saveAction);
        await tester.longPress(find.byKey(const ValueKey('power')));
        await tester.pumpAndSettle();
        for (final label in [
          l10n.edit,
          l10n.editButtonSettingsSubtitle,
          l10n.duplicate,
          l10n.createButtonCopySubtitle,
          l10n.duplicateAndEdit,
          l10n.duplicateAndEditButtonSubtitle,
        ]) {
          await Scrollable.ensureVisible(tester.element(find.text(label)),
              alignment: 0.5);
          await tester.pumpAndSettle();
          readable(label);
        }
        await tester.ensureVisible(find.text(l10n.undoAvailableInNextSnackbar));
        await tester.pumpAndSettle();
        readable(l10n.undoAvailableInNextSnackbar);
        await Scrollable.ensureVisible(tester.element(find.text(l10n.remove)),
            alignment: 0.5);
        await tester.pumpAndSettle();
        await tester.tap(find.text(l10n.remove));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithText(FilledButton, l10n.remove));
        await tester.pumpAndSettle();
        readable(l10n.buttonRemoved);
        readable(l10n.undo);
        expect(grid().cells.whereType<String>(), isEmpty);
        await tester.tap(find.text(l10n.undo));
        await tester.pumpAndSettle();
        expect(grid().cells.whereType<String>(), ['power']);

        await tester.ensureVisible(find.text(l10n.layoutAddRow));
        await tester.tap(find.text(l10n.layoutAddRow));
        await tester.pumpAndSettle();
        final changedCells = grid().cells;
        await tester.tap(find.byType(BackButton));
        await tester.pumpAndSettle();
        for (final label in [
          l10n.unsavedChangesTitle,
          l10n.unsavedRemoteStudioChangesMessage,
          l10n.continueEditing,
          l10n.discard
        ]) {
          readable(label, within: find.byType(AlertDialog));
        }
        await tester.tap(find.text(l10n.continueEditing));
        await tester.pumpAndSettle();
        expect(grid().cells, changedCells);
        await tester.tap(find.text(l10n.saveAction));
        await tester.pumpAndSettle();
        expect((await result)!.gridLayout!.cells, changedCells);

        final discarded = open();
        await tester.pumpAndSettle();
        await tester.ensureVisible(find.text(l10n.layoutAddRow));
        await tester.tap(find.text(l10n.layoutAddRow));
        await tester.pumpAndSettle();
        await tester.tap(find.byType(BackButton));
        await tester.pumpAndSettle();
        await tester.tap(find.descendant(
            of: find.byType(AlertDialog), matching: find.text(l10n.discard)));
        await tester.pumpAndSettle();
        expect(await discarded, isNull);

        final invalid = open(name: '');
        await tester.pumpAndSettle();
        await tester.tap(find.text(l10n.saveAction));
        await tester.pumpAndSettle();
        readable(l10n.remoteNameCannotBeEmpty);
        expect(find.byType(RemoteStudioScreen), findsOneWidget);
        await tester.tap(find.byType(BackButton));
        await tester.pumpAndSettle();
        expect(await invalid, isNull);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
