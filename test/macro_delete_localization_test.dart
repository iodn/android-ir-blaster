import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/state/macros_state.dart';
import 'package:irblaster_controller/utils/macros_io.dart';
import 'package:irblaster_controller/widgets/macros_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('macro deletion and undo are readable: $locale',
        (tester) async {
      SharedPreferences.setMockInitialValues({});
      final dir = (await tester.runAsync(
          () => Directory.systemTemp.createTemp('macro-delete-l10n-')))!;
      const channel = MethodChannel('plugins.flutter.io/path_provider');
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(channel, (_) async => dir.path);
      addTearDown(() async {
        messenger.setMockMethodCallHandler(channel, null);
        setMacros([]);
        await dir.delete(recursive: true);
      });
      const macro = TimedMacro(
          id: 'one',
          name: 'Living room television and sound system evening sequence',
          remoteName: 'TV',
          steps: [MacroStep(id: 'wait', type: MacroStepType.manualContinue)]);
      setMacros([macro]);
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
        home: const MacrosTab(),
      ));
      await tester.pumpAndSettle();
      final l10n = AppLocalizations.of(tester.element(find.byType(MacrosTab)))!;
      void readable(String text, Finder within) {
        final f = find.descendant(of: within, matching: find.text(text));
        expect(f, findsOneWidget);
        final p = tester.renderObject<RenderParagraph>(f);
        expect(p.didExceedMaxLines, isFalse, reason: text);
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1),
            reason: text);
      }

      Future<void> deletionDialog() async {
        await tester.tap(find.byType(PopupMenuButton<String>));
        await tester.pumpAndSettle();
        await tester.tap(find.text(l10n.delete));
        await tester.pumpAndSettle();
      }

      Future<void> waitForSave() async {
        final deadline = DateTime.now().add(const Duration(seconds: 10));
        do {
          await tester.runAsync(
              () => Future<void>.delayed(const Duration(milliseconds: 10)));
          await tester.pump();
          final saving = tester
              .widget<AbsorbPointer>(find
                  .descendant(
                      of: find.byType(MacrosTab),
                      matching: find.byType(AbsorbPointer))
                  .first)
              .absorbing;
          if (!saving) break;
          expect(DateTime.now().isBefore(deadline), isTrue);
        } while (true);
        await tester.pumpAndSettle();
      }

      await deletionDialog();
      for (final label in [
        l10n.deleteMacroTitle,
        l10n.deleteMacroMessage,
        l10n.cancel,
        l10n.delete
      ]) {
        readable(label, find.byType(AlertDialog));
      }
      await tester.tap(find.widgetWithText(TextButton, l10n.cancel));
      await tester.pumpAndSettle();
      expect(macros, [macro]);
      await deletionDialog();
      await tester.tap(find.widgetWithText(FilledButton, l10n.delete));
      await waitForSave();
      expect(macros, isEmpty);
      readable(l10n.deletedMacroNamed(macro.name), find.byType(SnackBar));
      readable(l10n.undo, find.byType(SnackBar));
      await tester.tap(find.text(l10n.undo));
      await waitForSave();
      expect(macros, [macro]);
      expect((await tester.runAsync(readMacros))!.single.id, macro.id);
      await tester
          .runAsync(() => Directory('${dir.path}/macros.json.tmp').create());
      await deletionDialog();
      await tester.tap(find.widgetWithText(FilledButton, l10n.delete));
      await waitForSave();
      expect(macros, [macro]);
      readable(l10n.failedToSaveMacros, find.byType(SnackBar));
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
