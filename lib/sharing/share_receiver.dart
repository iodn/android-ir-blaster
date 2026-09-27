import 'dart:async';
import 'package:flutter/material.dart';
import '../state/startup_prefs.dart';
import 'sharing_screen.dart';

class ShareReceiver {
  ShareReceiver._();
  static final instance = ShareReceiver._();
  GlobalKey<NavigatorState>? _navigator;
  final _pending = <String?>[];
  bool _ready = false;
  bool _showing = false;

  void initialize(GlobalKey<NavigatorState> navigator) {
    _navigator = navigator;
    remoteSharingChannel.setMethodCallHandler((call) async {
      if (call.method != 'received') return;
      StartupPrefsController.instance.suppressAutoOpenForCurrentLaunch();
      if (_pending.length < 5) _pending.add(call.arguments as String?);
      _dispatch();
    });
  }

  Future<void> ready() async {
    _ready = true;
    try {
      await remoteSharingChannel.invokeMethod<void>('ready');
    } catch (_) {}
    _dispatch();
  }

  void _dispatch() {
    if (!_ready || _showing || _pending.isEmpty) return;
    _showing = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final context = _navigator?.currentState?.overlay?.context;
      try {
        if (context != null && context.mounted) {
          await showReceivedShare(context, _pending.removeAt(0));
        }
      } finally {
        _showing = false;
        if (_pending.isNotEmpty && context != null) _dispatch();
      }
    });
    WidgetsBinding.instance.ensureVisualUpdate();
  }
}
