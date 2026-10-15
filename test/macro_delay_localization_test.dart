import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/macro_editor_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('macro wait controls fit: $locale', (tester) async {
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
            child: child!),
        home: MacroEditorScreen(remote: Remote(name: 'TV', buttons: [])),
      ));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(MacroEditorScreen)))!;
      void readable(String text) {
        final f = find.text(text);
        expect(f, findsOneWidget);
        final p = tester.renderObject<RenderParagraph>(f);
        expect(p.didExceedMaxLines, isFalse, reason: text);
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1),
            reason: text);
      }

      final scrollable = find
          .descendant(
              of: find.byType(ListView), matching: find.byType(Scrollable))
          .first;
      await tester.scrollUntilVisible(find.text(l10n.delay), 150,
          scrollable: scrollable);
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.delay));
      await tester.pumpAndSettle();
      readable(l10n.selectDelay);
      final sheetScroll = find.descendant(
          of: find.byType(BottomSheet), matching: find.byType(Scrollable));
      await tester.scrollUntilVisible(
          find.text(l10n.enterCustomDelayDuration), 150,
          scrollable: sheetScroll);
      await tester.pumpAndSettle();
      readable(l10n.enterCustomDelayDuration);
      await Scrollable.ensureVisible(
          tester.element(find.text(l10n.enterCustomDelayDuration)),
          alignment: 1);
      await tester.pumpAndSettle();
      expect(find.text(l10n.enterCustomDelayDuration).hitTestable(),
          findsOneWidget);
      await tester.tap(find.text(l10n.enterCustomDelayDuration));
      await tester.pumpAndSettle();
      readable(l10n.customDelay);
      readable(l10n.delayMillisecondsLabel);
      readable(l10n.recommendedDelayRange);
      final field = find.descendant(
          of: find.byType(AlertDialog), matching: find.byType(TextField));
      tester.view.viewInsets = const FakeViewPadding(bottom: 240);
      await tester.pumpAndSettle();
      for (final invalid in ['', '0']) {
        await tester.enterText(field, invalid);
        await tester.tap(find.widgetWithText(FilledButton, l10n.ok));
        await tester.pumpAndSettle();
        final error = find.descendant(
          of: find.byType(AlertDialog),
          matching: find.text(l10n.enterValidPositiveNumber),
        );
        expect(error, findsOneWidget);
        await Scrollable.ensureVisible(tester.element(error), alignment: 1);
        await tester.pumpAndSettle();
        readable(l10n.enterValidPositiveNumber);
        expect(find.byType(SnackBar), findsNothing);
      }
      await tester.enterText(field, '1250');
      await tester.pumpAndSettle();
      expect(find.text(l10n.enterValidPositiveNumber), findsNothing);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      tester.view.resetViewInsets();
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, l10n.ok));
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsNothing);
      expect(find.byType(BottomSheet), findsNothing);
      tester.state<ScrollableState>(scrollable).position.jumpTo(0);
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
          find.text(l10n.millisecondsShort(1250)), 100,
          scrollable: scrollable);
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.millisecondsShort(1250)));
      await tester.pumpAndSettle();
      readable(l10n.keepMilliseconds(1250));
      await tester.tap(find.text(l10n.keepMilliseconds(1250)));
      await tester.pumpAndSettle();
      expect(find.byType(BottomSheet), findsNothing);
    });
  }
}
