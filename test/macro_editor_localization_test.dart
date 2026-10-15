import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/macro_editor_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('macro editor instructions and decisions fit: $locale',
        (tester) async {
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
      final navigator = GlobalKey<NavigatorState>();
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigator,
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.5)),
          child: child!,
        ),
        home: const Scaffold(),
      ));
      Future<TimedMacro?> open() =>
          navigator.currentState!.push<TimedMacro>(MaterialPageRoute(
              builder: (_) =>
                  MacroEditorScreen(remote: Remote(name: 'TV', buttons: []))));
      void readable(String text, {Finder? within}) {
        final f = within == null
            ? find.text(text)
            : find.descendant(of: within, matching: find.text(text));
        expect(f, findsOneWidget);
        final p = tester.renderObject<RenderParagraph>(f);
        expect(p.didExceedMaxLines, isFalse, reason: text);
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1),
            reason: text);
      }

      final saved = open();
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(MacroEditorScreen)))!;
      readable(l10n.createMacro);
      readable(l10n.enterMacroName);
      await tester.ensureVisible(find.byType(TextField));
      await tester.pumpAndSettle();
      readable(l10n.macroName);
      readable(l10n.macroNameHint);
      await tester.enterText(find.byType(TextField), 'Evening');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      readable(l10n.addAtLeastOneStep);
      expect(tester.getRect(find.text(l10n.macroName)).bottom,
          lessThanOrEqualTo(tester.getRect(find.byType(EditableText)).top + 1));
      final scrollable = find
          .descendant(
              of: find.byType(ListView), matching: find.byType(Scrollable))
          .first;
      for (final label in [
        l10n.noStepsYet,
        l10n.addCommandsAndDelaysHint,
        l10n.addStep,
        l10n.commandLabel,
        l10n.delay,
        l10n.manualContinue
      ]) {
        await tester.scrollUntilVisible(find.text(label), 120,
            scrollable: scrollable);
        await tester.pumpAndSettle();
        readable(label);
      }
      await tester.tap(find.text(l10n.manualContinue));
      await tester.pumpAndSettle();
      tester.state<ScrollableState>(scrollable).position.jumpTo(0);
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
          find.text(l10n.waitForUserConfirmation), 120,
          scrollable: scrollable);
      await tester.pumpAndSettle();
      readable(l10n.waitForUserConfirmation);
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      for (final label in [
        l10n.unsavedChangesTitle,
        l10n.unsavedMacroChangesMessage,
        l10n.continueEditing,
        l10n.discard
      ]) {
        readable(label, within: find.byType(AlertDialog));
      }
      await tester.tap(find.text(l10n.continueEditing));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, l10n.saveAction));
      await tester.pumpAndSettle();
      final macro = await saved;
      expect(macro!.name, 'Evening');
      expect(macro.steps.single.type, MacroStepType.manualContinue);
      final discarded = open();
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byType(TextField));
      await tester.enterText(find.byType(TextField), 'Discard me');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.discard));
      await tester.pumpAndSettle();
      expect(await discarded, isNull);
      expect(tester.takeException(), isNull);
    });
  }
}
