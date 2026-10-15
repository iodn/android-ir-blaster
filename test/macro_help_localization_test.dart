import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/state/macros_state.dart';
import 'package:irblaster_controller/widgets/macros_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('macro help and introduction fit: $locale', (tester) async {
      SharedPreferences.setMockInitialValues({});
      setMacros([]);
      addTearDown(() => setMacros([]));
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
              .copyWith(textScaler: const TextScaler.linear(1.5)),
          child: child!,
        ),
        home: const MacrosTab(),
      ));
      await tester.pumpAndSettle();
      final l10n = AppLocalizations.of(tester.element(find.byType(MacrosTab)))!;
      Future<void> readable(String text, {Finder? within}) async {
        final f = within == null
            ? find.text(text)
            : find.descendant(of: within, matching: find.text(text));
        expect(f, findsWidgets);
        await tester.ensureVisible(f.last);
        await tester.pumpAndSettle();
        final p = tester.renderObject<RenderParagraph>(f.last);
        expect(p.didExceedMaxLines, isFalse, reason: text);
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1),
            reason: text);
      }

      for (final text in [
        l10n.timedMacrosTitle,
        l10n.timedMacrosSubtitle,
        l10n.timedMacrosNextStep
      ]) {
        await readable(text);
      }
      setMacros([
        const TimedMacro(
            id: 'one',
            name: 'TV',
            remoteName: 'TV',
            steps: [MacroStep(id: 'wait', type: MacroStepType.manualContinue)])
      ]);
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip(l10n.help));
      await tester.pumpAndSettle();
      for (final text in [
        l10n.aboutTimedMacros,
        l10n.aboutTimedMacrosDescription,
        l10n.sendCommandDescription,
        l10n.delayDescription,
        l10n.manualContinueDescription,
        l10n.gotIt
      ]) {
        await readable(text, within: find.byType(BottomSheet));
      }
      await tester.tap(find.text(l10n.gotIt));
      await tester.pumpAndSettle();
      expect(find.byType(BottomSheet), findsNothing);
    });
  }
}
