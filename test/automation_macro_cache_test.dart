import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations_en.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/state/automation_macro_cache.dart';
import 'package:irblaster_controller/utils/macros_io.dart';
import 'package:irblaster_controller/utils/remote.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory dir;
  late List<MethodCall> calls;
  const macro = TimedMacro(id: 'macro-1', name: 'Macro', remoteName: 'TV', steps: [
    MacroStep(id: 's', type: MacroStepType.send, buttonId: 'power'),
  ]);
  const button = IRButton(id: 'power', image: 'Power', isImage: false,
      protocol: 'RAW', frequency: 38000, rawData: '9000 4500 560');
  setUp(() async {
    dir = await Directory.systemTemp.createTemp('automation-cache-');
    calls = [];
    final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(const MethodChannel('plugins.flutter.io/path_provider'),
        (_) async => dir.path);
    messenger.setMockMethodCallHandler(AutomationMacroCache.channel, (call) async {
      calls.add(call);
      return true;
    });
    await writeRemotelist([Remote(name: 'TV', buttons: [button])]);
    await writeMacrosList([macro]);
    expect(await AutomationMacroCache.initialize(AppLocalizationsEn()), isTrue);
  });
  tearDown(() async { await dir.delete(recursive: true); });

  Map getMappings() => Map.from((calls.last.arguments as Map)['mappings']);

  test('compiles saved signals and refreshes after button edits', () async {
    expect(getMappings()['macro-1']['steps'][0]['pattern'], [9000, 4500, 560]);
    await writeRemotelist([Remote(name: 'TV', buttons: [
      button.copyWith(rawData: '8000 4000 600'),
    ])]);
    expect(getMappings()['macro-1']['steps'][0]['pattern'], [8000, 4000, 600]);
    final args = calls.last.arguments as Map;
    expect(args['remotesSource'], await File('${dir.path}/remotes.json').readAsString());
    expect(args['macrosSource'], await File('${dir.path}/macros.json').readAsString());
  });

  test('macro deletion removes entry and missing button disables it', () async {
    await writeRemotelist([Remote(name: 'TV', buttons: [])]);
    expect(getMappings()['macro-1'], isNull);
    await writeMacrosList([]);
    expect(getMappings(), isEmpty);
  });

  test('manual macros marked and duplicate IDs rejected', () async {
    await writeMacrosList([macro.copyWith(steps: [
      const MacroStep(id: 'm', type: MacroStepType.manualContinue),
    ])]);
    expect(getMappings()['macro-1']['manual'], isTrue);
    await writeMacrosList([macro, macro]);
    expect(getMappings()['macro-1'], isNull);
  });

  test('cache failure does not prevent saving source data', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(AutomationMacroCache.channel,
            (_) async => throw PlatformException(code: 'FAILED'));
    await writeMacrosList([macro.copyWith(name: 'Saved')]);
    expect((await readMacros()).single.name, 'Saved');
    expect(await AutomationMacroCache.refresh(), isFalse);
  });

  test('copy command defaults to built-in and quotes both shells for arbitrary IDs', () {
    expect(macroAutomationCommand('macro-1'), contains('--es macro_id macro-1 --es emitter INTERNAL'));
    expect(macroAutomationCommand("x'; reboot; '"), startsWith("adb shell 'am broadcast"));
    expect(macroAutomationCommand('x y'), contains("'\\''x y'\\''"));
  });
}
