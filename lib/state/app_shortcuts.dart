import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/state/continue_context_prefs.dart';
import 'package:irblaster_controller/state/macros_state.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/macros_io.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/ir_finder_screen.dart';
import 'package:irblaster_controller/widgets/macro_run_screen.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:irblaster_controller/widgets/universal_power_screen.dart';

class AppShortcutController {
  AppShortcutController._();

  static final AppShortcutController instance = AppShortcutController._();
  static const MethodChannel _channel = MethodChannel('org.nslabs/app_shortcuts');

  GlobalKey<NavigatorState>? _navigatorKey;
  String? _pendingAction;
  bool _initialized = false;
  bool _bootstrapReady = false;
  bool _dispatchScheduled = false;

  Future<void> initialize(GlobalKey<NavigatorState> navigatorKey) async {
    _navigatorKey = navigatorKey;
    if (!_initialized) {
      _initialized = true;
      _channel.setMethodCallHandler((call) async {
        if (call.method != 'openShortcut') return;
        final action = _readAction(call.arguments);
        if (action == null) return;
        _pendingAction = action;
        _scheduleDispatch();
      });
      try {
        final initial =
            await _channel.invokeMethod<String>('consumeInitialShortcutAction');
        if (initial != null && initial.trim().isNotEmpty) {
          _pendingAction = initial.trim();
        }
      } catch (_) {}
    }
    _scheduleDispatch();
  }

  void markBootstrapReady() {
    _bootstrapReady = true;
    _scheduleDispatch();
  }

  Future<void> sync(AppLocalizations l10n) async {
    final snapshot = await ContinueContextsPrefs.load();
    final items = <Map<String, String>>[
      if (snapshot.remote != null)
        {
          'id': _ShortcutAction.lastRemote.value,
          'shortLabel': l10n.continueLastRemoteTitle,
          'longLabel': _longLabel(
            l10n.continueLastRemoteTitle,
            snapshot.remote!.remoteName.trim(),
          ),
        },
      {
        'id': _ShortcutAction.irFinder.value,
        'shortLabel': l10n.signalTesterNavLabel,
        'longLabel': l10n.signalTesterNavLabel,
      },
      if (snapshot.macro != null)
        {
          'id': _ShortcutAction.lastMacro.value,
          'shortLabel': l10n.startMacro,
          'longLabel': _longLabel(
            l10n.startMacro,
            snapshot.macro!.macroName.trim().isEmpty
                ? l10n.untitledMacro
                : snapshot.macro!.macroName.trim(),
          ),
        },
      {
        'id': _ShortcutAction.universalPower.value,
        'shortLabel': l10n.universalPowerTitle,
        'longLabel': _longLabel(
          l10n.universalPowerTitle,
          snapshot.universalPower?.brand?.trim().isNotEmpty == true
              ? snapshot.universalPower!.brand!.trim()
              : '',
        ),
      },
    ];

    try {
      await _channel.invokeMethod<void>(
        'updateDynamicShortcuts',
        <String, dynamic>{'items': items},
      );
    } catch (_) {}
  }

  String _longLabel(String prefix, String detail) {
    if (detail.isEmpty) return prefix;
    return '$prefix: $detail';
  }

  String? _readAction(dynamic arguments) {
    if (arguments is String && arguments.trim().isNotEmpty) {
      return arguments.trim();
    }
    if (arguments is Map) {
      final raw = arguments['action'];
      if (raw is String && raw.trim().isNotEmpty) {
        return raw.trim();
      }
    }
    return null;
  }

  void _scheduleDispatch() {
    if (_dispatchScheduled) return;
    _dispatchScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dispatchScheduled = false;
      unawaited(_dispatchPendingShortcut());
    });
  }

  Future<void> _dispatchPendingShortcut() async {
    if (!_bootstrapReady) {
      _scheduleDispatch();
      return;
    }
    final action = _pendingAction;
    if (action == null || action.isEmpty) return;
    final navigator = _navigatorKey?.currentState;
    final context = _navigatorKey?.currentContext;
    if (navigator == null || context == null) {
      _scheduleDispatch();
      return;
    }

    _pendingAction = null;
    await _openShortcutAction(context, navigator, action);
  }

  Future<void> _ensureDataLoaded() async {
    if (remotes.isEmpty) {
      try {
        remotes = await readRemotes();
      } catch (_) {}
    }
    if (macros.isEmpty) {
      try {
        macros = await readMacros();
      } catch (_) {}
    }
  }

  Future<void> _openShortcutAction(
    BuildContext context,
    NavigatorState navigator,
    String action,
  ) async {
    await _ensureDataLoaded();
    final snapshot = await ContinueContextsPrefs.load();

    switch (_ShortcutAction.fromWire(action)) {
      case _ShortcutAction.lastRemote:
        final remote = _findRemote(snapshot.remote);
        if (remote == null) return;
        await navigator.push(
          MaterialPageRoute(builder: (_) => RemoteView(remote: remote)),
        );
        break;
      case _ShortcutAction.irFinder:
        await navigator.push(
          MaterialPageRoute(builder: (_) => const IrFinderScreen()),
        );
        break;
      case _ShortcutAction.lastMacro:
        final macro = _findMacro(snapshot.macro);
        final remote = _findMacroRemote(snapshot.macro);
        if (macro == null || remote == null) return;
        await navigator.push(
          MaterialPageRoute(
            builder: (_) =>
                MacroRunScreen(macro: macro, remote: remote, autoStart: true),
          ),
        );
        break;
      case _ShortcutAction.universalPower:
        await navigator.push(
          MaterialPageRoute(
            builder: (_) => UniversalPowerScreen(
              initialBrand: snapshot.universalPower?.brand,
              initialModel: snapshot.universalPower?.model,
            ),
          ),
        );
        break;
      case null:
        return;
    }
  }

  Remote? _findRemote(LastRemoteContext? ctx) {
    if (ctx == null) return null;
    final wantedName = ctx.remoteName.trim();
    if (wantedName.isNotEmpty) {
      try {
        return remotes.firstWhere((r) => r.name.trim() == wantedName);
      } catch (_) {}
    }
    try {
      return remotes.firstWhere((r) => r.id == ctx.remoteId);
    } catch (_) {
      return null;
    }
  }

  TimedMacro? _findMacro(LastMacroContext? ctx) {
    if (ctx == null) return null;
    final macroId = ctx.macroId.trim();
    if (macroId.isNotEmpty) {
      try {
        return macros.firstWhere((m) => m.id.trim() == macroId);
      } catch (_) {}
    }
    final macroName = ctx.macroName.trim();
    if (macroName.isNotEmpty) {
      try {
        return macros.firstWhere((m) => m.name.trim() == macroName);
      } catch (_) {}
    }
    return null;
  }

  Remote? _findMacroRemote(LastMacroContext? ctx) {
    if (ctx == null) return null;
    final wantedName = ctx.remoteName.trim();
    if (wantedName.isEmpty) return null;
    try {
      return remotes.firstWhere((r) => r.name.trim() == wantedName);
    } catch (_) {
      return null;
    }
  }
}

enum _ShortcutAction {
  lastRemote('last_remote'),
  irFinder('ir_finder'),
  lastMacro('last_macro'),
  universalPower('universal_power');

  final String value;
  const _ShortcutAction(this.value);

  static _ShortcutAction? fromWire(String raw) {
    for (final value in _ShortcutAction.values) {
      if (value.value == raw) return value;
    }
    return null;
  }
}
