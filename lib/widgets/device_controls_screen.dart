import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/icon_picker_names.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/state/device_controls_prefs.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/button_label.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';

class DeviceControlsScreen extends StatefulWidget {
  const DeviceControlsScreen({super.key});

  @override
  State<DeviceControlsScreen> createState() => _DeviceControlsScreenState();
}

class _DeviceControlsScreenState extends State<DeviceControlsScreen> {
  List<DeviceControlFavorite> _items = <DeviceControlFavorite>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final items = await DeviceControlsPrefs.load();
    if (remotes.isEmpty) {
      try {
        remotes = await readRemotes();
      } catch (_) {}
    }
    if (!mounted) return;
    setState(() {
      _items = items;
      _loading = false;
    });
  }

  String _displayTitle(DeviceControlFavorite fav) {
    for (final r in remotes) {
      for (final b in r.buttons) {
        if (b.id == fav.buttonId) {
          return displayButtonLabel(
            b,
            fallback: context.l10n.unnamedButton,
            iconFallback: context.l10n.iconFallback,
            iconNameLocalizer: (name) => localizedIconPickerName(context.l10n, name),
          );
        }
      }
    }
    if (fav.title.trim().isNotEmpty) return fav.title.trim();
    return context.l10n.unnamedButton;
  }

  Future<void> _remove(DeviceControlFavorite fav) async {
    final removedIndex = _items.indexWhere((e) => e.buttonId == fav.buttonId);
    await DeviceControlsPrefs.remove(fav.buttonId);
    if (!mounted) return;
    setState(() {
      _items.removeWhere((e) => e.buttonId == fav.buttonId);
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.l10n.removedNamed(_displayTitle(fav))),
        action: SnackBarAction(
          label: context.l10n.undo,
          onPressed: () async {
            if (!mounted) return;
            await DeviceControlsPrefs.add(fav);
            if (!mounted) return;
            setState(() {
              final restoreAt = removedIndex < 0
                  ? _items.length
                  : removedIndex.clamp(0, _items.length);
              _items.insert(restoreAt, fav);
            });
          },
        ),
      ),
    );
  }

  Future<void> _sendTest(DeviceControlFavorite fav) async {
    IRButton? found;
    if (remotes.isEmpty) {
      try {
        remotes = await readRemotes();
      } catch (_) {}
    }
    for (final r in remotes) {
      for (final b in r.buttons) {
        if (b.id == fav.buttonId) {
          found = b;
          break;
        }
      }
      if (found != null) break;
    }

    if (found == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.buttonNotFoundInRemotes)),
      );
      return;
    }

    try {
      await sendIR(found);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.testSendCompleted)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.testSendFailed(e.toString()))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.deviceControlsTitle)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _items.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.l10n.noFavoritesYet, style: theme.textTheme.titleLarge),
                      const SizedBox(height: 6),
                      Text(
                        context.l10n.deviceControlsEmptyHint,
                        style: theme.textTheme.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => const Divider(height: 0),
                  itemBuilder: (context, i) {
                    final fav = _items[i];
                    return ListTile(
                      leading: const Icon(Icons.power_rounded),
                      title: Text(_displayTitle(fav)),
                      subtitle: Text(fav.subtitle),
                      trailing: Wrap(
                        spacing: 4,
                        children: [
                          IconButton(
                            tooltip: context.l10n.sendTest,
                            onPressed: () => _sendTest(fav),
                            icon: const Icon(Icons.play_arrow_rounded),
                          ),
                          IconButton(
                            tooltip: context.l10n.remove,
                            onPressed: () => _remove(fav),
                            icon: Icon(Icons.delete_outline, color: cs.error),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
