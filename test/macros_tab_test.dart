import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/state/macros_state.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/macros_io.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/macro_editor_screen.dart';
import 'package:irblaster_controller/widgets/macros_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

const original =
    TimedMacro(id: 'original', name: 'Bedtime', remoteName: 'TV', steps: [
  MacroStep(id: 'wait', type: MacroStepType.delay, delayMs: 500),
]);

void main() {
  late Directory dir;
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    dir = await Directory.systemTemp.createTemp('macro-tab-test-');
    setMacros([original]);
    remotes = [Remote(name: 'TV', buttons: [])];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('plugins.flutter.io/path_provider'),
            (_) async => dir.path);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('org.nslabs/irtransmitter'), (_) async => true);
  });
  tearDown(() async {
    await dir.delete(recursive: true);
    setMacros([]);
    remotes = [];
  });

  Future<void> settleSave(WidgetTester tester) async {
    for (var i = 0; i < 10; i++) {
      await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 10)));
      await tester.pump();
    }
    await tester.pumpAndSettle();
  }

  Future<void> open(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MacrosTab(),
    ));
    await tester.pumpAndSettle();
  }

  Future<void> action(WidgetTester tester, String label) async {
    await tester.tap(find.byType(PopupMenuButton<String>).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text(label));
    await tester.pumpAndSettle();
  }

  testWidgets('duplicate saves before publishing and delete undo persists',
      (tester) async {
    await open(tester);
    await action(tester, 'Duplicate');
    await settleSave(tester);
    expect(macros, hasLength(2));
    expect(macros.last.id, isNot(original.id));
    expect(macros.last.steps, original.steps);
    expect((await tester.runAsync(readMacros))!.length, 2);
    await action(tester, 'Delete');
    await tester.tap(find.widgetWithText(FilledButton, 'Delete'));
    await settleSave(tester);
    expect(macros, hasLength(1));
    expect(macros.single.id, isNot(original.id));
    await tester.tap(find.text('Undo'));
    await settleSave(tester);
    expect(macros.first.id, original.id);
    expect((await tester.runAsync(readMacros))!.length, 2);
    await tester.pumpWidget(const SizedBox());
    await tester.pumpAndSettle();
  });

  testWidgets('sharing follows duplicate in macro actions', (tester) async {
    await open(tester);
    await tester.tap(find.byType(PopupMenuButton<String>).first);
    await tester.pumpAndSettle();
    final values = tester
        .widgetList<PopupMenuItem<String>>(find.byType(PopupMenuItem<String>))
        .map((item) => item.value)
        .toList();
    expect(values, ['run', 'edit', 'duplicate', 'share', 'widget', 'delete']);
    await tester.pumpWidget(const SizedBox());
    await tester.pumpAndSettle();
  });

  testWidgets('macro widget pinning requires confirmation and includes the sequence',
      (tester) async {
    final calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('flutter.baseflow.com/permissions/methods'),
            (_) async => {17: 1});
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('org.nslabs/irtransmitter_home_widget'), (call) async {
      calls.add(call);
      return true;
    });
    await tester.runAsync(() async {
      await writeRemotelist(remotes);
      await writeMacrosList(macros);
    });
    await open(tester);
    await action(tester, 'Add home widget');
    for (var i = 0; i < 100 && find.byType(AlertDialog).evaluate().isEmpty; i++) {
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
      await tester.pump();
    }
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(calls.map((c) => c.method), ['isPinSupported']);
    await tester.tap(find.widgetWithText(FilledButton, 'Add home widget'));
    await settleSave(tester);
    final mapping = calls.last.arguments as Map;
    expect(calls.last.method, 'pinButtonWidget');
    expect(mapping['macroId'], original.id);
    expect(mapping['steps'], [{'delayMs': 500}]);
    expect(mapping['manual'], false);
    expect(mapping['labels']['stop'], 'Stop');
  });

  testWidgets('failed duplicate leaves list unchanged and allows retry',
      (tester) async {
    await tester.runAsync(() async {
      await writeMacrosList([original]);
      await Directory('${dir.path}/macros.json.tmp').create();
    });
    await open(tester);
    await action(tester, 'Duplicate');
    await settleSave(tester);
    expect(macros, [original]);
    expect(find.text('Failed to save macros.'), findsOneWidget);
    expect((await tester.runAsync(readMacros))!.single.id, original.id);
    await tester
        .runAsync(() => Directory('${dir.path}/macros.json.tmp').delete());
    await action(tester, 'Duplicate');
    await settleSave(tester);
    expect(macros, hasLength(2));
    await tester.pumpWidget(const SizedBox());
    await tester.pumpAndSettle();
  });

  for (final creating in [true, false]) {
    testWidgets(
        'failed ${creating ? 'create' : 'edit'} never changes saved list',
        (tester) async {
      await tester.runAsync(() async {
        await writeMacrosList([original]);
        await Directory('${dir.path}/macros.json.tmp').create();
      });
      await open(tester);
      if (creating) {
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();
      } else {
        await action(tester, 'Edit');
      }
      final ctx = tester.element(find.byType(MacroEditorScreen));
      Navigator.of(ctx).pop(original.copyWith(
          id: creating ? 'new' : original.id, name: 'Changed'));
      await settleSave(tester);
      expect(macros, [original]);
      expect((await tester.runAsync(readMacros))!.single.name, original.name);
      expect(find.text('Failed to save macros.'), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
