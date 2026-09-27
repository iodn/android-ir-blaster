import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/widgets/home_widget_picker.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/state/home_button_widget_prefs.dart';
import 'package:irblaster_controller/utils/remote.dart';

void main() {
  testWidgets('launcher setup offers button and macro on a compact screen',
      (tester) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(2)),
          child: child!),
      home: Builder(
          builder: (context) => Scaffold(
              body: TextButton(
                  onPressed: () => pickHomeWidget(context),
                  child: const Text('Configure')))),
    ));
    await tester.tap(find.text('Configure'));
    await tester.pumpAndSettle();
    expect(find.text('Button'), findsOneWidget);
    expect(find.text('Macros'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  const button = IRButton(
      id: 'button',
      image: 'Power',
      isImage: false,
      frequency: 38000,
      rawData: '9000 4500 560 560');
  final remote = Remote(name: 'TV', buttons: [button]);
  TimedMacro macro(List<MacroStep> steps) => TimedMacro(
      id: 'macro', name: 'Evening', remoteName: remote.name, steps: steps);
  const send =
      MacroStep(id: 'send', type: MacroStepType.send, buttonId: 'button');
  const delay = MacroStep(id: 'delay', type: MacroStepType.delay, delayMs: 500);

  test('automatic macro preserves ordered sends and delays in a snapshot', () {
    final mapping =
        buildHomeMacroWidgetMapping(macro([send, delay, send]), [remote], {});
    expect(mapping.macroId, 'macro');
    expect(mapping.manual, isFalse);
    expect(mapping.steps, [
      {
        'frequencyHz': 38000,
        'pattern': [9000, 4500, 560, 560]
      },
      {'delayMs': 500},
      {
        'frequencyHz': 38000,
        'pattern': [9000, 4500, 560, 560]
      },
    ]);
    expect(mapping.toJson()['macroId'], 'macro');
    expect(mapping.title, 'Evening');
  });

  test('manual macros open the runner instead of sending a partial sequence',
      () {
    final mapping = buildHomeMacroWidgetMapping(
        macro([
          send,
          const MacroStep(id: 'manual', type: MacroStepType.manualContinue),
          send,
        ]),
        [remote],
        {});
    expect(mapping.manual, isTrue);
    expect(mapping.steps, isEmpty);
    expect(mapping.pattern, isEmpty);
  });

  test('legacy button references bind before compiling the widget', () {
    final mapping = buildHomeMacroWidgetMapping(
        macro([
          const MacroStep(
              id: 'legacy', type: MacroStepType.send, buttonRef: 'Power'),
        ]),
        [remote],
        {});
    expect(mapping.steps.single['frequencyHz'], 38000);
  });

  test('missing or ambiguous dependencies reject the entire macro', () {
    expect(() => buildHomeMacroWidgetMapping(macro([send]), [], {}),
        throwsFormatException);
    expect(
        () => buildHomeMacroWidgetMapping(macro([send]), [remote, remote], {}),
        throwsFormatException);
    expect(
        () => buildHomeMacroWidgetMapping(
            macro([
              send,
              const MacroStep(
                  id: 'missing', type: MacroStepType.send, buttonId: 'missing')
            ]),
            [remote],
            {}),
        throwsFormatException);
    expect(() => buildHomeMacroWidgetMapping(macro([]), [remote], {}),
        throwsFormatException);
  });

  test('invalid delays and native-incompatible signals reject pinning', () {
    for (final ms in [-1, 3600001]) {
      expect(
          () => buildHomeMacroWidgetMapping(
              macro([
                send,
                MacroStep(id: 'delay', type: MacroStepType.delay, delayMs: ms)
              ]),
              [remote],
              {}),
          throwsFormatException);
    }
    final longSignal =
        Remote(name: 'TV', buttons: [button.copyWith(rawData: '2000000 500')]);
    expect(() => buildHomeMacroWidgetMapping(macro([send]), [longSignal], {}),
        throwsFormatException);
  });

  test('existing button mapping JSON is unchanged', () {
    const mapping = HomeButtonWidgetMapping(
        buttonId: 'b',
        title: 'Power',
        subtitle: 'TV',
        frequencyHz: 38000,
        pattern: [9000, 4500, 560]);
    expect(mapping.toJson(), {
      'buttonId': 'b',
      'title': 'Power',
      'subtitle': 'TV',
      'frequencyHz': 38000,
      'pattern': [9000, 4500, 560],
    });
  });
}
