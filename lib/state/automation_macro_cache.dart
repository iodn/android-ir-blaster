import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../l10n/app_localizations.dart';
import '../models/timed_macro.dart';
import '../utils/remote.dart';
import 'home_button_widget_prefs.dart';

/// Compiled signals for native execution without starting Flutter. Native code
/// checks source fingerprints so a failed refresh never runs outdated commands.
class AutomationMacroCache {
  static const channel = MethodChannel('org.nslabs/irtransmitter_home_widget');
  static Map<String, String>? _labels;
  static Future<bool>? _pending;

  static Future<bool> initialize(AppLocalizations l10n) {
    _labels = {
      'running': l10n.running,
      'stop': l10n.stop,
      'completed': l10n.macroCompleted,
      'failed': l10n.error,
      'cancelled': l10n.stopped,
    };
    return refresh();
  }

  static Future<bool> refresh() {
    if (_labels == null) return Future.value(false);
    final next = (_pending ?? Future.value(false)).then((_) => _refresh());
    _pending = next;
    return next.whenComplete(() {
      if (identical(_pending, next)) _pending = null;
    });
  }

  static Future<bool> _refresh() async {
    if (_labels == null) return false;
    try {
      Directory support;
      try {
        support = await getApplicationSupportDirectory();
      } catch (_) {
        support = await getApplicationDocumentsDirectory();
      }
      final documents = await getApplicationDocumentsDirectory();
      final macrosFile = File('${support.path}/macros.json');
      final remotesFile = File('${documents.path}/remotes.json');
      final macrosText =
          await macrosFile.exists() ? await macrosFile.readAsString() : '[]';
      final remotesText =
          await remotesFile.exists() ? await remotesFile.readAsString() : '[]';
      final macros = (jsonDecode(macrosText) as List)
          .map((m) => TimedMacro.fromJson(Map<String, dynamic>.from(m)))
          .toList();
      final remotes = (jsonDecode(remotesText) as List)
          .map((r) => Remote.fromJson(Map<String, dynamic>.from(r)))
          .toList();
      final mappings = <String, dynamic>{};
      for (final macro in macros) {
        if (mappings.containsKey(macro.id)) {
          mappings[macro.id] = null; // Ambiguous IDs must never select a macro.
          continue;
        }
        try {
          mappings[macro.id] =
              buildHomeMacroWidgetMapping(macro, remotes, _labels!).toJson();
        } catch (_) {
          mappings[macro.id] = null;
        }
      }
      return await channel.invokeMethod<bool>('cacheAutomationMacros', {
            'macrosPath': macrosFile.path,
            'macrosSource': macrosText,
            'remotesPath': remotesFile.path,
            'remotesSource': remotesText,
            'mappings': mappings,
          }) ??
          false;
    } catch (_) {
      // Saving a remote must not fail because an optional native cache failed.
      return false;
    }
  }
}

String macroAutomationCommand(String id) {
  String quote(String text) => "'${text.replaceAll("'", "'\\''")}'";
  final safeId = RegExp(r'^[a-zA-Z0-9_.:-]+$').hasMatch(id);
  final remoteCommand = 'am broadcast -n org.nslabs.ir_blaster/.IrAutomationReceiver '
      '-a org.irblaster.RUN_MACRO --es macro_id ${safeId ? id : quote(id)} --es emitter INTERNAL';
  // adb invokes another shell on Android; escape both layers for imported IDs.
  return 'adb shell ${safeId ? remoteCommand : quote(remoteCommand)}';
}
