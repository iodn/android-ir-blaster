import 'package:flutter/material.dart';
import 'package:irblaster_controller/state/quick_settings_prefs.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';

Future<QuickTilePick?> pickButtonForTile(
  BuildContext context, {
  String? tileKey,
}) async {
  if (remotes.isEmpty) {
    try {
      remotes = await readRemotes();
    } catch (_) {}
  }
  if (!context.mounted) return null;
  if (remotes.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('No remotes available.')),
    );
    return null;
  }

  final Object favResult = await _pickFavorite(
    context,
    tileLabel: _tileLabelForKey(tileKey),
  );
  if (favResult == _FavoritePickResult.cancelled) return null;
  if (favResult is QuickTileFavorite) {
    return QuickTilePick.fromFavorite(favResult);
  }

  final Remote? pickedRemote = await showModalBottomSheet<Remote>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => _RemotePickerSheet(remotes: remotes),
  );
  if (pickedRemote == null) return null;

  final IRButton? pickedButton = await showModalBottomSheet<IRButton>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => _ButtonPickerSheet(remote: pickedRemote),
  );
  if (pickedButton == null) return null;

  final title = pickedButton.isImage
      ? formatButtonDisplayName(pickedButton.image)
      : pickedButton.image;

  return QuickTilePick(remote: pickedRemote, button: pickedButton, title: title);
}

Future<QuickTileMapping?> buildQuickTileMapping(QuickTilePick pick) async {
  if (remotes.isEmpty) {
    try {
      remotes = await readRemotes();
    } catch (_) {}
  }
  IRButton? resolved;
  for (final r in remotes) {
    for (final b in r.buttons) {
      if (b.id == pick.button.id) {
        resolved = b;
        break;
      }
    }
    if (resolved != null) break;
  }
  if (resolved == null) return null;
  IrPreview preview;
  try {
    preview = previewIRButton(resolved);
  } catch (_) {
    return null;
  }
  return QuickTileMapping(
    buttonId: resolved.id,
    title: pick.title,
    subtitle: pick.remote.name,
    frequencyHz: preview.frequencyHz,
    pattern: preview.pattern,
  );
}

Future<void> sendButtonPick(BuildContext context, QuickTilePick pick) async {
  if (remotes.isEmpty) {
    try {
      remotes = await readRemotes();
    } catch (_) {}
  }
  IRButton? found;
  for (final r in remotes) {
    for (final b in r.buttons) {
      if (b.id == pick.button.id) {
        found = b;
        break;
      }
    }
    if (found != null) break;
  }
  if (found == null) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Button not found in remotes.')),
    );
    return;
  }
  try {
    await sendIR(found);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sent \"${pick.title}\".')),
    );
  } catch (e) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Send failed: $e')),
    );
  }
}

enum _FavoritePickResult { cancelled, browseAll }

Future<Object> _pickFavorite(
  BuildContext context, {
  String? tileLabel,
}) async {
  final favs = await QuickSettingsPrefs.loadFavorites();
  if (favs.isEmpty || !context.mounted) return _FavoritePickResult.browseAll;
  final result = await showModalBottomSheet<Object>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => _FavoritePickerSheet(
      favorites: favs,
      tileLabel: tileLabel,
    ),
  );
  if (result == null) return _FavoritePickResult.cancelled;
  return result;
}

class QuickTilePick {
  final Remote remote;
  final IRButton button;
  final String title;

  const QuickTilePick({
    required this.remote,
    required this.button,
    required this.title,
  });

  factory QuickTilePick.fromFavorite(QuickTileFavorite fav) {
    return QuickTilePick(
      remote: Remote(buttons: const [], name: fav.subtitle),
      button: IRButton(
        id: fav.buttonId,
        image: fav.title,
        isImage: false,
      ),
      title: fav.title,
    );
  }
}

class _RemotePickerSheet extends StatelessWidget {
  final List<Remote> remotes;
  const _RemotePickerSheet({required this.remotes});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child: Text('Select remote', style: theme.textTheme.titleLarge)),
                IconButton(
                  tooltip: 'Close',
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: remotes.length,
                separatorBuilder: (_, __) => const Divider(height: 0),
                itemBuilder: (context, i) {
                  final r = remotes[i];
                  return ListTile(
                    title: Text(r.name),
                    subtitle: Text('${r.buttons.length} button(s)'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.of(context).pop(r),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonPickerSheet extends StatelessWidget {
  final Remote remote;
  const _ButtonPickerSheet({required this.remote});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child: Text('Select button', style: theme.textTheme.titleLarge)),
                IconButton(
                  tooltip: 'Close',
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: remote.buttons.length,
                separatorBuilder: (_, __) => const Divider(height: 0),
                itemBuilder: (context, i) {
                  final b = remote.buttons[i];
                  final title = b.isImage ? formatButtonDisplayName(b.image) : b.image;
                  return ListTile(
                    leading: const Icon(Icons.circle),
                    title: Text(title),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.of(context).pop(b),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoritePickerSheet extends StatelessWidget {
  final List<QuickTileFavorite> favorites;
  final String? tileLabel;
  const _FavoritePickerSheet({
    required this.favorites,
    this.tileLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child: Text('Quick tile favorites', style: theme.textTheme.titleLarge)),
                IconButton(
                  tooltip: 'Close',
                  onPressed: () => Navigator.of(context).pop(_FavoritePickResult.cancelled),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: favorites.length + 1 + (tileLabel == null ? 0 : 1),
                separatorBuilder: (_, __) => const Divider(height: 0),
                itemBuilder: (context, i) {
                  if (tileLabel != null && i == 0) {
                    return ListTile(
                      leading: const Icon(Icons.edit_rounded),
                      title: Text('Change mapping for $tileLabel tile'),
                      subtitle: const Text('Pick a different button'),
                      onTap: () => Navigator.of(context).pop(_FavoritePickResult.browseAll),
                    );
                  }
                  final index = tileLabel == null ? i : i - 1;
                  if (index == favorites.length) {
                    return ListTile(
                      leading: const Icon(Icons.search_rounded),
                      title: const Text('Browse all remotes…'),
                      onTap: () => Navigator.of(context).pop(_FavoritePickResult.browseAll),
                    );
                  }
                  final f = favorites[index];
                  return ListTile(
                    leading: const Icon(Icons.star_rounded),
                    title: Text(f.title),
                    subtitle: Text(f.subtitle),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.of(context).pop(f),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? _tileLabelForKey(String? key) {
  switch ((key ?? '').trim()) {
    case 'power':
      return 'Power';
    case 'mute':
      return 'Mute';
    case 'volumeUp':
      return 'Vol +';
    case 'volumeDown':
      return 'Vol -';
    default:
      return null;
  }
}
