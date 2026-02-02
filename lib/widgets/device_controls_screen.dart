import 'package:flutter/material.dart';
import 'package:irblaster_controller/state/device_controls_prefs.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
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
    if (!mounted) return;
    setState(() {
      _items = items;
      _loading = false;
    });
  }

  Future<void> _remove(DeviceControlFavorite fav) async {
    await DeviceControlsPrefs.remove(fav.buttonId);
    if (!mounted) return;
    setState(() {
      _items.removeWhere((e) => e.buttonId == fav.buttonId);
    });
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
        const SnackBar(content: Text('Button not found in remotes.')),
      );
      return;
    }

    try {
      await sendIR(found);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Test send completed.')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Test send failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Device Controls')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _items.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('No favorites yet', style: theme.textTheme.titleLarge),
                      const SizedBox(height: 6),
                      Text(
                        'Long-press a remote button and select “Add to Device Controls”.',
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
                      title: Text(fav.title.isEmpty ? 'Unnamed button' : fav.title),
                      subtitle: Text(fav.subtitle),
                      trailing: Wrap(
                        spacing: 4,
                        children: [
                          IconButton(
                            tooltip: 'Send test',
                            onPressed: () => _sendTest(fav),
                            icon: const Icon(Icons.play_arrow_rounded),
                          ),
                          IconButton(
                            tooltip: 'Remove',
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
