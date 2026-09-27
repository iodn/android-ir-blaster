import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../l10n/l10n.dart';
import '../models/timed_macro.dart';
import '../state/home_button_widget_prefs.dart';
import '../utils/macros_io.dart';
import '../utils/remote.dart';
import 'quick_tile_chooser.dart';

Future<HomeButtonWidgetMapping?> prepareMacroWidget(
    BuildContext context, TimedMacro macro) async {
  try {
    final saved = (await readMacros()).where((m) => m.id == macro.id).toList();
    if (saved.length != 1) throw const FormatException('Missing macro');
    final remotes = await readRemotes();
    if (!context.mounted) return null;
    final l10n = context.l10n;
    final mapping = buildHomeMacroWidgetMapping(saved.single, remotes, {
      'running': l10n.running,
      'stop': l10n.stop,
      'completed': l10n.macroCompleted,
      'failed': l10n.error,
      'cancelled': l10n.stopped,
    });
    final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
              scrollable: true,
              title: Text(macro.name),
              content: Text(l10n.macroWidgetInfo),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: Text(l10n.cancel)),
                FilledButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: Text(l10n.addHomeWidget)),
              ],
            ));
    if (confirmed != true) return null;
    if (!mapping.manual) {
      // A denied permission does not block the widget: tapping it again stops it.
      await Permission.notification.request();
    }
    return mapping;
  } catch (_) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.macroWidgetUnavailable)));
    }
    return null;
  }
}

Future<void> pinMacroWidget(BuildContext context, TimedMacro macro) async {
  try {
    final supported = await HomeButtonWidgetPrefs.isPinSupported();
    if (!context.mounted) return;
    if (!supported) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.homeWidgetUnsupportedLauncher)));
      return;
    }
    final mapping = await prepareMacroWidget(context, macro);
    if (mapping == null || !context.mounted) return;
    final ok = await HomeButtonWidgetPrefs.pinButtonWidget(mapping);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(ok
            ? context.l10n.homeWidgetRequestSent
            : context.l10n.homeWidgetRequestRejected)));
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(context.l10n.homeWidgetSetupFailed(e.toString()))));
    }
  }
}

Future<HomeButtonWidgetMapping?> pickHomeWidget(BuildContext context) async {
  final macro = await showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (ctx) => Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(
                leading: const Icon(Icons.radio_button_checked),
                title: Text(ctx.l10n.buttonFallbackTitle),
                onTap: () => Navigator.pop(ctx, false)),
            ListTile(
                leading: const Icon(Icons.playlist_play),
                title: Text(ctx.l10n.macrosTitle),
                onTap: () => Navigator.pop(ctx, true)),
          ]));
  if (!context.mounted || macro == null) return null;
  if (!macro) {
    final pick = await pickButtonForTile(context);
    if (pick == null) return null;
    final mapping = await buildHomeButtonWidgetMapping(pick);
    if (mapping == null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.homeWidgetButtonUnsupported)));
    }
    return mapping;
  }
  final macros = await readMacros();
  if (!context.mounted) return null;
  final selected = await showModalBottomSheet<TimedMacro>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (ctx) => ListView(shrinkWrap: true, children: [
            if (macros.isEmpty)
              Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(ctx.l10n.createMacro)),
            for (final m in macros)
              ListTile(
                  leading: const Icon(Icons.playlist_play),
                  title: Text(m.name),
                  subtitle: Text(m.remoteName),
                  onTap: () => Navigator.pop(ctx, m)),
          ]));
  if (!context.mounted || selected == null) return null;
  return prepareMacroWidget(context, selected);
}
