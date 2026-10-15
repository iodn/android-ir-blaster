import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/macro_run_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('macro running and invalid-step feedback fit: $locale',
        (tester) async {
      SharedPreferences.setMockInitialValues({});
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      Future<AppLocalizations> open(List<MacroStep> steps) async {
        await tester.pumpWidget(MaterialApp(
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.5)),
              child: child!),
          home: MacroRunScreen(
            key: UniqueKey(),
            autoStart: false,
            macro: TimedMacro(
                id: 'test', name: 'TV', remoteName: 'TV', steps: steps),
            remote: Remote(name: 'TV', buttons: []),
          ),
        ));
        await tester.pumpAndSettle();
        return AppLocalizations.of(
            tester.element(find.byType(MacroRunScreen)))!;
      }

      Future<void> readable(String text) async {
        final finder = find.text(text);
        expect(finder, findsOneWidget);
        await tester.ensureVisible(finder);
        await tester.pump();
        final p = tester.renderObject<RenderParagraph>(finder);
        expect(p.didExceedMaxLines, isFalse, reason: text);
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1),
            reason: text);
      }

      var l10n = await open([]);
      await readable(l10n.noSteps);
      l10n = await open(const [
        MacroStep(id: 'wait', type: MacroStepType.delay, delayMs: 5000)
      ]);
      await tester.tap(find.text(l10n.startMacro));
      await tester.pump(const Duration(milliseconds: 100));
      await readable(l10n.running);
      final waitDetails = find.descendant(
        of: find.ancestor(of: find.text(l10n.waiting),
            matching: find.byType(Column)).first,
        matching: find.byType(Text),
      );
      expect(waitDetails, findsNWidgets(3));
      for (final text in tester.widgetList<Text>(waitDetails)) {
        await readable(text.data!);
      }
      await tester.tap(find.text(l10n.cancel));
      await tester.pumpAndSettle();
      l10n = await open(const [
        MacroStep(id: 'invalid', type: MacroStepType.delay, delayMs: -1)
      ]);
      await tester.tap(find.text(l10n.startMacro));
      await tester.pumpAndSettle();
      await readable(l10n.invalidStepEncountered);
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
