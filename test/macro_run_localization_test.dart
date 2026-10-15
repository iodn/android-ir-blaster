import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/macro_run_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('macro run messages fit: $locale', (tester) async {
      SharedPreferences.setMockInitialValues({});
      const channel = MethodChannel('org.nslabs/irtransmitter');
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(channel, (_) async => true);
      addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.5)),
          child: child!,
        ),
        home: MacroRunScreen(
          autoStart: false,
          macro: TimedMacro(
              id: 'test',
              name: 'TV',
              remoteName: 'TV',
              steps: const [
                MacroStep(id: 'wait', type: MacroStepType.manualContinue),
              ]),
          remote: Remote(name: 'TV', buttons: []),
        ),
      ));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(MacroRunScreen)))!;
      void readable(String text) {
        final finder = find.text(text);
        expect(finder, findsOneWidget);
        final p = tester.renderObject<RenderParagraph>(finder);
        expect(p.didExceedMaxLines, isFalse, reason: text);
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1),
            reason: text);
      }

      readable(l10n.startMacro);
      await tester.tap(find.text(l10n.startMacro));
      await tester.pumpAndSettle();
      readable(l10n.continueAction);
      await tester.ensureVisible(find.text(l10n.tapContinueWhenReady));
      await tester.pumpAndSettle();
      readable(l10n.tapContinueWhenReady);
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      readable(l10n.stopMacroBeforeLeaving);
      ScaffoldMessenger.of(tester.element(find.byType(MacroRunScreen)))
          .removeCurrentSnackBar();
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.continueAction));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text(l10n.macroCompleted));
      await tester.pumpAndSettle();
      readable(l10n.macroCompleted);
      final completionDetails = find.descendant(
        of: find
            .ancestor(
              of: find.text(l10n.macroCompleted),
              matching: find.byType(Column),
            )
            .first,
        matching: find.byType(Text),
      );
      expect(completionDetails, findsNWidgets(2));
      readable(tester.widget<Text>(completionDetails.last).data!);
      readable(l10n.runAgain);
      await tester.tap(find.text(l10n.runAgain));
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.cancel));
      await tester.pumpAndSettle();
      readable(l10n.startMacro);
    });
  }
}
