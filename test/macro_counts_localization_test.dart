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
  test('step counts use the correct plural forms', () async {
    final expected = {
      'en': ['1 step', '2 steps', '5 steps', '21 steps'],
      'ar': ['خطوة واحدة', 'خطوتان', '5 خطوات', '21 خطوة'],
      'ar_EG': ['خطوة واحدة', 'خطوتان', '5 خطوات', '21 خطوة'],
      'fr': ['1 étape', '2 étapes', '5 étapes', '21 étapes'],
      'pl': ['1 krok', '2 kroki', '5 kroków', '21 kroków'],
      'ru': ['1 шаг', '2 шага', '5 шагов', '21 шаг'],
      'uk': ['1 крок', '2 кроки', '5 кроків', '21 крок'],
      'pt_BR': ['1 etapa', '2 etapas', '5 etapas', '21 etapas'],
      'tr': ['1 adım', '2 adım', '5 adım', '21 adım'],
    };
    for (final locale in AppLocalizations.supportedLocales) {
      final values = expected[locale.toString()];
      if (values == null) continue;
      final l10n = await AppLocalizations.delegate.load(locale);
      expect([1, 2, 5, 21].map(l10n.macroStepCountLabel).toList(), values,
          reason: '$locale');
    }
  });

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('macro counts and copied names are localized: $locale',
        (tester) async {
      SharedPreferences.setMockInitialValues({});
      final dir = (await tester.runAsync(
          () => Directory.systemTemp.createTemp('macro-count-l10n-')))!;
      const channel = MethodChannel('plugins.flutter.io/path_provider');
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(channel, (_) async => dir.path);
      addTearDown(() async {
        messenger.setMockMethodCallHandler(channel, null);
        setMacros([]);
        await dir.delete(recursive: true);
      });
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      TimedMacro macroWithSteps(int count) => TimedMacro(
          id: 'original',
          name: 'TV',
          remoteName: 'TV',
          steps: List.generate(count,
              (i) => MacroStep(id: '$i', type: MacroStepType.manualContinue)));
      setMacros([macroWithSteps(1)]);
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: const MacrosTab(),
      ));
      await tester.pumpAndSettle();
      final l10n = AppLocalizations.of(tester.element(find.byType(MacrosTab)))!;
      for (final count in [0, 1, 2, 3, 5, 11, 21, 101]) {
        setMacros([macroWithSteps(count)]);
        await tester.pumpAndSettle();
        final text = l10n.macroStepCountLabel(count);
        final f = find.text(text);
        expect(f, findsOneWidget);
        final p = tester.renderObject<RenderParagraph>(f);
        expect(p.didExceedMaxLines, isFalse, reason: text);
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1),
            reason: text);
        if (locale.languageCode != 'en') expect(text, isNot(contains('step')));
      }
      final original = macros.single;
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.duplicate));
      final deadline = DateTime.now().add(const Duration(seconds: 10));
      while (true) {
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
      }
      await tester.pumpAndSettle();
      expect(macros, hasLength(2));
      expect(macros.first, original);
      expect(macros.last.name, l10n.macroCopyName(original.name));
      expect(macros.last.id, isNot(original.id));
      expect(macros.last.steps, original.steps);
      final stored = (await tester.runAsync(readMacros))!;
      expect(stored.last.name, l10n.macroCopyName(original.name));
      expect(
          stored.last.steps.map((s) => s.id), original.steps.map((s) => s.id));
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
