import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/quick_tile_chooser.dart';
import '../models/macro_step.dart';
import '../models/timed_macro.dart';
import '../utils/macros_io.dart';

class HomeButtonWidgetPrefs {
  HomeButtonWidgetPrefs._();

  static const MethodChannel _channel =
      MethodChannel('org.nslabs/irtransmitter_home_widget');

  static Future<bool> isPinSupported() async {
    final raw = await _channel.invokeMethod<bool>('isPinSupported');
    return raw ?? false;
  }

  static Future<bool> pinButtonWidget(HomeButtonWidgetMapping mapping) async {
    final raw = await _channel.invokeMethod<bool>(
      'pinButtonWidget',
      mapping.toJson(),
    );
    return raw ?? false;
  }

  static Future<bool> saveWidgetMapping({
    required int appWidgetId,
    required HomeButtonWidgetMapping mapping,
  }) async {
    final raw = await _channel.invokeMethod<bool>(
      'saveWidgetMapping',
      <String, dynamic>{
        'appWidgetId': appWidgetId,
        'mapping': mapping.toJson(),
      },
    );
    return raw ?? false;
  }
}

class HomeButtonWidgetMapping {
  final String buttonId;
  final String title;
  final String subtitle;
  final int frequencyHz;
  final List<int> pattern;
  final String? macroId;
  final bool manual;
  final List<Map<String, Object>> steps;
  final Map<String, String> labels;

  const HomeButtonWidgetMapping({
    required this.buttonId,
    required this.title,
    required this.subtitle,
    required this.frequencyHz,
    required this.pattern,
    this.macroId,
    this.manual = false,
    this.steps = const [],
    this.labels = const {},
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'buttonId': buttonId,
        'title': title,
        'subtitle': subtitle,
        'frequencyHz': frequencyHz,
        'pattern': pattern,
        if (macroId != null) ...{
          'macroId': macroId,
          'manual': manual,
          'steps': steps,
          'labels': labels,
        },
      };

  String encode() => jsonEncode(toJson());
}

HomeButtonWidgetMapping buildHomeMacroWidgetMapping(
    TimedMacro macro, List<Remote> remotes, Map<String, String> labels) {
  final matches = remotes.where((r) => r.name == macro.remoteName).toList();
  if (matches.length != 1 ||
      macro.id.isEmpty ||
      macro.steps.isEmpty ||
      macro.steps.length > 1000) {
    throw const FormatException('Invalid macro or missing remote');
  }
  final remote = matches.single;
  final bound = bindMacroToRemote(macro, remote);
  final manual = bound.steps.any((s) => s.type == MacroStepType.manualContinue);
  final steps = <Map<String, Object>>[];
  for (final step in bound.steps) {
    if (!step.isValid) throw const FormatException('Invalid macro step');
    switch (step.type) {
      case MacroStepType.manualContinue:
        break;
      case MacroStepType.delay:
        if (step.delayMs! > 3600000) {
          throw const FormatException('Delay too long');
        }
        steps.add({'delayMs': step.delayMs!});
      case MacroStepType.send:
        final buttons =
            remote.buttons.where((b) => b.id == step.buttonId).toList();
        if (buttons.length != 1) {
          throw const FormatException('Missing macro button');
        }
        if (manual) continue;
        final preview = previewIRButton(buttons.single);
        if (preview.frequencyHz < 10000 ||
            preview.frequencyHz > 100000 ||
            preview.pattern.isEmpty ||
            preview.pattern.length > 4096 ||
            preview.pattern.any((n) => n <= 0) ||
            preview.pattern.fold<int>(0, (a, b) => a + b) >= 2000000) {
          throw const FormatException('Unsupported widget signal');
        }
        steps.add(
            {'frequencyHz': preview.frequencyHz, 'pattern': preview.pattern});
    }
  }
  return HomeButtonWidgetMapping(
      buttonId: macro.id,
      title: macro.name,
      subtitle: remote.name,
      frequencyHz: 0,
      pattern: const [],
      macroId: macro.id,
      manual: manual,
      steps: manual ? const [] : steps,
      labels: labels);
}

Future<HomeButtonWidgetMapping?> buildHomeButtonWidgetMapping(
  QuickTilePick pick,
) async {
  IRButton? resolved;
  final remotesList = await readRemotes();
  for (final r in remotesList) {
    for (final b in r.buttons) {
      if (b.id == pick.button.id) {
        resolved = b;
        break;
      }
    }
    if (resolved != null) break;
  }
  if (resolved == null) return null;

  final IrPreview preview;
  try {
    preview = previewIRButton(resolved);
  } catch (_) {
    return null;
  }
  return HomeButtonWidgetMapping(
    buttonId: resolved.id,
    title: pick.title,
    subtitle: pick.remote.name,
    frequencyHz: preview.frequencyHz,
    pattern: preview.pattern,
  );
}
