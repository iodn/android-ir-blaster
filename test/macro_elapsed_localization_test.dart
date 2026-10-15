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
    testWidgets('macro elapsed time and status fit enlarged text: $locale',
        (tester) async {
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
            child: child!),
        home: MacroRunScreen(
          autoStart: false,
          macro: const TimedMacro(
              id: 'elapsed',
              name: 'TV',
              remoteName: 'TV',
              steps: [
                MacroStep(id: 'wait', type: MacroStepType.manualContinue),
              ]),
          remote: Remote(name: 'TV', buttons: []),
        ),
      ));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(MacroRunScreen)))!;
      await tester.tap(find.text(l10n.startMacro));
      await tester.pumpAndSettle();
      Future<void> readable(Finder finder) async {
        expect(finder, findsOneWidget);
        await tester.ensureVisible(finder);
        await tester.pumpAndSettle();
        final p = tester.renderObject<RenderParagraph>(finder);
        expect(p.didExceedMaxLines, isFalse);
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1));
        final rect = tester.getRect(finder);
        expect(rect.left, greaterThanOrEqualTo(0));
        expect(rect.right, lessThanOrEqualTo(320));
      }

      await readable(find.text(l10n.paused));
      await readable(find.text(l10n.stepProgress(1, 1)));
      final elapsed = find.descendant(
        of: find
            .ancestor(
                of: find.byIcon(Icons.timer_outlined),
                matching: find.byType(Row))
            .first,
        matching: find.byType(Text),
      );
      await readable(elapsed);
      await tester.tap(find.text(l10n.cancel));
      await tester.pumpAndSettle();
    });
  }
}
