import 'package:flutter/material.dart';
import 'package:irblaster_controller/state/quick_settings_prefs.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/quick_tile_chooser.dart';

class QuickSettingsScreen extends StatefulWidget {
  const QuickSettingsScreen({super.key});

  @override
  State<QuickSettingsScreen> createState() => _QuickSettingsScreenState();
}

class _QuickSettingsScreenState extends State<QuickSettingsScreen> {
  Map<QuickTileType, QuickTileMapping?> _mappings = {};
  bool _loading = true;

  bool get _hasAnyMapping => _mappings.values.any((m) => m != null);

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final maps = await QuickSettingsPrefs.loadAllMappings();
    if (!mounted) return;
    setState(() {
      _mappings = maps;
      _loading = false;
    });
  }

  String _tileLabel(QuickTileType t) {
    switch (t) {
      case QuickTileType.power:
        return 'Power tile';
      case QuickTileType.mute:
        return 'Mute tile';
      case QuickTileType.volumeUp:
        return 'Volume Up tile';
      case QuickTileType.volumeDown:
        return 'Volume Down tile';
    }
  }

  Future<void> _pickMapping(QuickTileType type) async {
    final pick = await pickButtonForTile(context);
    if (pick == null) return;
    final mapping = await buildQuickTileMapping(pick);
    if (mapping == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Button not found in remotes.')),
      );
      return;
    }
    await QuickSettingsPrefs.saveMapping(type, mapping);
    if (!mounted) return;
    setState(() => _mappings[type] = mapping);
  }

  Future<void> _clearMapping(QuickTileType type) async {
    await QuickSettingsPrefs.saveMapping(type, null);
    if (!mounted) return;
    setState(() => _mappings[type] = null);
  }

  Future<void> _sendTest(QuickTileType type) async {
    final mapping = _mappings[type];
    if (mapping == null) {
      final pick = await pickButtonForTile(context);
      if (pick == null) return;
      await sendButtonPick(context, pick);
      return;
    }
    await sendButtonPick(
      context,
      QuickTilePick(
        remote: Remote(buttons: const [], name: mapping.subtitle),
        button: IRButton(id: mapping.buttonId, image: mapping.title, isImage: false),
        title: mapping.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Quick Settings tiles')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(12),
              children: [
                if (!_hasAnyMapping) ...[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.tune_rounded, color: cs.primary),
                              const SizedBox(width: 8),
                              Text(
                                'No tiles configured',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'What next: pick a command for at least one tile, then add the tile from Android Quick Settings edit menu.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 12),
                          FilledButton.icon(
                            onPressed: () => _pickMapping(QuickTileType.power),
                            icon: const Icon(Icons.add_rounded),
                            label: const Text('Set Power tile'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                Text(
                  'Choose which button each tile sends. Add tiles from Android Quick Settings edit menu.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                ),
                const SizedBox(height: 12),
                ...QuickTileType.values.map((t) {
                  final mapping = _mappings[t];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      leading: Icon(_iconFor(t), color: cs.primary),
                      title: Text(_tileLabel(t)),
                      subtitle: Text(mapping == null
                          ? 'Not set'
                          : '${mapping.title} · ${mapping.subtitle}'),
                      trailing: Wrap(
                        spacing: 4,
                        children: [
                          IconButton(
                            tooltip: 'Send test',
                            onPressed: () async {
                              await _sendTest(t);
                            },
                            icon: const Icon(Icons.play_arrow_rounded),
                          ),
                          IconButton(
                            tooltip: 'Pick button',
                            onPressed: () => _pickMapping(t),
                            icon: const Icon(Icons.edit_rounded),
                          ),
                          IconButton(
                            tooltip: 'Clear',
                            onPressed: mapping == null ? null : () => _clearMapping(t),
                            icon: Icon(Icons.delete_outline, color: cs.error),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
    );
  }

  IconData _iconFor(QuickTileType t) {
    switch (t) {
      case QuickTileType.power:
        return Icons.power_settings_new_rounded;
      case QuickTileType.mute:
        return Icons.volume_off_rounded;
      case QuickTileType.volumeUp:
        return Icons.volume_up_rounded;
      case QuickTileType.volumeDown:
        return Icons.volume_down_rounded;
    }
  }
}
