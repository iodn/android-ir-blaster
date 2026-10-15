import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/macro_editor_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('macro command search remains readable: $locale',
        (tester) async {
      SharedPreferences.setMockInitialValues({});
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.view.resetViewInsets);
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.5)),
          child: child!,
        ),
        home: MacroEditorScreen(
            remote: Remote(name: 'TV', buttons: const [
          IRButton(id: 'power', image: 'Power', isImage: false),
          IRButton(id: 'mute', image: 'Mute', isImage: false),
        ])),
      ));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(MacroEditorScreen)))!;
      final scroll = find
          .descendant(
              of: find.byType(ListView), matching: find.byType(Scrollable))
          .first;
      final addCommand = find.widgetWithText(FilledButton, l10n.commandLabel);
      await tester.scrollUntilVisible(addCommand, 150,
          scrollable: scroll);
      await tester.pumpAndSettle();
      await tester.tap(addCommand);
      await tester.pumpAndSettle();
      void readable(String text) {
        final f = find.text(text);
        expect(f, findsOneWidget);
        final p = tester.renderObject<RenderParagraph>(f);
        expect(p.didExceedMaxLines, isFalse, reason: text);
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1),
            reason: text);
      }

      readable(l10n.selectCommand);
      readable(l10n.searchCommands);
      final field = find.descendant(
          of: find.byType(BottomSheet), matching: find.byType(TextField));
      tester.view.viewInsets = const FakeViewPadding(bottom: 240);
      await tester.enterText(field, 'zz-no-match');
      await tester.pumpAndSettle();
      await Scrollable.ensureVisible(
          tester.element(find.text(l10n.noMatchingCommands)));
      await tester.pumpAndSettle();
      readable(l10n.noMatchingCommands);
      expect(tester.getBottomLeft(find.text(l10n.noMatchingCommands)).dy,
          lessThanOrEqualTo(400));
      await tester.enterText(field, 'pow');
      await tester.pumpAndSettle();
      expect(find.text('Mute'), findsNothing);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      tester.view.resetViewInsets();
      await tester.pumpAndSettle();
      expect(
          tester
              .widget<EditableText>(find.descendant(
                  of: field, matching: find.byType(EditableText)))
              .controller
              .text,
          'pow');
      await tester.tap(find.text('Power'));
      await tester.pumpAndSettle();
      expect(find.byType(BottomSheet), findsNothing);
      await tester.scrollUntilVisible(find.text(l10n.reorderStepsHint), 150,
          scrollable: scroll);
      await tester.pumpAndSettle();
      readable(l10n.reorderStepsHint);
    });
  }
}
