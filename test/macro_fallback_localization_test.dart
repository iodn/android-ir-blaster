import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/state/macros_state.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/macros_tab.dart';
import 'package:irblaster_controller/widgets/macro_editor_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('missing names and invalid macro steps are readable: $locale',
        (tester) async {
      SharedPreferences.setMockInitialValues({});
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(() => setMacros([]));
      Future<void> open(Widget home) async {
        await tester.pumpWidget(MaterialApp(
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.5)),
              child: child!),
          home: home,
        ));
        await tester.pumpAndSettle();
      }

      Future<void> readable(String text, {Finder? within}) async {
        final f = within == null
            ? find.text(text)
            : find.descendant(of: within, matching: find.text(text));
        expect(f, findsOneWidget);
        await tester.ensureVisible(f);
        await tester.pumpAndSettle();
        final p = tester.renderObject<RenderParagraph>(f);
        expect(p.didExceedMaxLines, isFalse, reason: text);
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1),
            reason: text);
      }

      setMacros([
        const TimedMacro(id: 'missing', name: 'TV', remoteName: '', steps: [
          MacroStep(id: 'wait', type: MacroStepType.manualContinue),
        ])
      ]);
      await open(const MacrosTab());
      final l10n = AppLocalizations.of(tester.element(find.byType(MacrosTab)))!;
      await readable(l10n.macrosTitle);
      await readable(l10n.noRemote);
      await open(MacroEditorScreen(
        macro: const TimedMacro(id: 'edit', name: 'TV', remoteName: '', steps: [
          MacroStep(id: 'bad', type: MacroStepType.send),
        ]),
        remote: Remote(name: '', buttons: const [
          IRButton(id: 'unnamed', image: '', isImage: false),
          IRButton(
              id: 'icon',
              image: '',
              isImage: false,
              iconCodePoint: 0x10ffff,
              iconFontFamily: 'MaterialIcons'),
        ]),
      ));
      await readable(l10n.unnamedRemote);
      final scroll = find
          .descendant(
              of: find.byType(ListView), matching: find.byType(Scrollable))
          .first;
      await tester.scrollUntilVisible(find.text(l10n.unknownCommand), 150,
          scrollable: scroll);
      await tester.pumpAndSettle();
      await readable(l10n.unknownCommand);
      await readable(l10n.invalidStepTapToFix);
      await tester.tap(find.text(l10n.invalidStepTapToFix));
      await tester.pumpAndSettle();
      final sheet = find.byType(BottomSheet);
      await readable(l10n.unnamedCommand, within: sheet);
      await readable(l10n.iconCommand, within: sheet);
      await tester.tap(
          find.descendant(of: sheet, matching: find.text(l10n.iconCommand)));
      await tester.pumpAndSettle();
      expect(find.text(l10n.invalidStepTapToFix), findsNothing);
      await readable(l10n.iconCommand);
      await tester.tap(find.text(l10n.iconCommand));
      await tester.pumpAndSettle();
      await tester.tap(
          find.descendant(of: sheet, matching: find.text(l10n.unnamedCommand)));
      await tester.pumpAndSettle();
      await readable(l10n.unnamedCommand,
          within: find.byKey(const ValueKey('bad')));
    });
  }
}
