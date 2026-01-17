import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/create_remote.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class RemoteList extends StatefulWidget {
  const RemoteList({super.key});

  @override
  State<RemoteList> createState() => _RemoteListState();
}

class _RemoteListState extends State<RemoteList> {
  bool _reorderMode = false;

  void _reassignIds() {
    for (int i = 0; i < remotes.length; i++) {
      remotes[i].id = i + 1;
    }
  }

  void _setReorderMode(bool v) {
    if (_reorderMode == v) return;
    setState(() => _reorderMode = v);
    Haptics.selectionClick();
    if (v && mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Reorder mode: long-press and drag a card to move it.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<bool> _confirmDeleteRemote(BuildContext context, Remote remote) async {
    final theme = Theme.of(context);
    return await showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.warning_amber_rounded, size: 44, color: theme.colorScheme.error),
              const SizedBox(height: 12),
              Text(
                "Delete remote?",
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                '"${remote.name}" will be permanently removed. This action can\'t be undone.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(ctx).pop(false),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.error,
                        foregroundColor: theme.colorScheme.onError,
                      ),
                      onPressed: () => Navigator.of(ctx).pop(true),
                      icon: const Icon(Icons.delete_forever),
                      label: const Text("Delete"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ).then((value) => value ?? false);
  }

  Future<void> _addRemote() async {
    if (_reorderMode) _setReorderMode(false);
    try {
      final Remote newRemote = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreateRemote()),
      );
      setState(() {
        remotes.add(newRemote);
        _reassignIds();
      });
      await writeRemotelist(remotes);
      notifyRemotesChanged();
    } catch (_) {}
  }

  Future<void> _editRemoteAt(int index) async {
    if (_reorderMode) _setReorderMode(false);
    final Remote remote = remotes[index];
    try {
      final Remote editedRemote = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateRemote(remote: remote)),
      );
      setState(() {
        remotes[index] = editedRemote;
      });
      await writeRemotelist(remotes);
      notifyRemotesChanged();
      if (!mounted) return;
      Haptics.selectionClick();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Updated "${editedRemote.name}".')),
      );
    } catch (_) {}
  }

  Future<void> _deleteRemoteAt(int index) async {
    if (_reorderMode) _setReorderMode(false);
    final Remote remote = remotes[index];
    final confirmed = await _confirmDeleteRemote(context, remote);
    if (!confirmed) return;
    setState(() {
      remotes.removeAt(index);
      _reassignIds();
    });
    await writeRemotelist(remotes);
    notifyRemotesChanged();
    if (!mounted) return;
    Haptics.selectionClick();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Deleted "${remote.name}". This action can\'t be undone.'),
      ),
    );
  }

  Future<void> _openRemoteActionsSheet(Remote remote, int index) async {
    if (_reorderMode) return;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        final mq = MediaQuery.of(ctx);
        final maxH = mq.size.height * 0.9;
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxH),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: cs.primaryContainer.withValues(alpha: 0.65),
                      child: Icon(Icons.settings_remote_rounded, color: cs.onPrimaryContainer),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            remote.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${remote.buttons.length} button(s) · ${remote.useNewStyle ? 'Comfort' : 'Compact'}',
                            style: theme.textTheme.bodySmall?.copyWith(
                                color: cs.onSurface.withValues(alpha: 0.7),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(height: 0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.play_arrow_rounded),
                  title: const Text('Open'),
                  subtitle: const Text('Use this remote'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {
                    Navigator.of(ctx).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RemoteView(remote: remote),
                      ),
                    );
                  },
                ),
                const Divider(height: 0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.edit_outlined),
                  title: const Text('Edit'),
                  subtitle: const Text('Rename, and edit buttons'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {
                    Navigator.of(ctx).pop();
                    _editRemoteAt(index);
                  },
                ),
                const Divider(height: 0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.delete_outline, color: cs.error),
                  title: Text(
                    'Delete',
                    style: TextStyle(
                      color: cs.error,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: const Text('This cannot be undone'),
                  onTap: () async {
                    Navigator.of(ctx).pop();
                    await _deleteRemoteAt(index);
                  },
                ),
                const SizedBox(height: 6),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> _onWillPop() async {
    if (_reorderMode) {
      _setReorderMode(false);
      return false;
    }
    return true;
  }

  int _calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      if (width >= 1200) return 5;
      if (width >= 900) return 4;
      if (width >= 600) return 3;
      return 2;
    } else {
      if (width >= 900) return 4;
      if (width >= 600) return 3;
      return 2;
    }
  }

  double _calculateChildAspectRatio(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = _calculateCrossAxisCount(context);
    final horizontalPadding = 16.0 * 2;
    final spacing = 12.0 * (crossAxisCount - 1);
    final availableWidth = width - horizontalPadding - spacing;
    final cardWidth = availableWidth / crossAxisCount;
    final cardHeight = cardWidth * 1.15;
    return cardWidth / cardHeight;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = theme.colorScheme.primary.withValues(alpha: 0.16);
    return ValueListenableBuilder<int>(
      valueListenable: remotesRevision,
      builder: (context, _, __) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Remotes"),
              actions: [
                if (!_reorderMode)
                  IconButton(
                    tooltip: 'Search Remotes',
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: RemoteSearchDelegate(
                          remotes,
                          onOpen: (remote) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RemoteView(remote: remote),
                              ),
                            );
                          },
                          onEdit: (remote) async {
                            final int idx = remotes.indexOf(remote);
                            if (idx < 0) return;
                            await _editRemoteAt(idx);
                          },
                          onDelete: (remote) async {
                            final int idx = remotes.indexOf(remote);
                            if (idx < 0) return;
                            await _deleteRemoteAt(idx);
                          },
                        ),
                      );
                    },
                  ),
                IconButton(
                  tooltip: _reorderMode ? 'Done' : 'Reorder remotes',
                  icon: Icon(_reorderMode ? Icons.check_rounded : Icons.drag_indicator_rounded),
                  onPressed: () => _setReorderMode(!_reorderMode),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: _reorderMode ? null : _addRemote,
              icon: const Icon(Icons.add),
              label: const Text('Add remote'),
            ),
            body: SafeArea(
              child: remotes.isEmpty
                  ? _EmptyState(onAdd: _addRemote)
                  : Column(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 180),
                          child: !_reorderMode
                              ? const SizedBox.shrink()
                              : _ReorderHintBanner(
                                  key: const ValueKey('reorder_hint'),
                                  onDone: () => _setReorderMode(false),
                                ),
                        ),
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final crossAxisCount = _calculateCrossAxisCount(context);
                              final aspectRatio = _calculateChildAspectRatio(context);
                              return ReorderableGridView.builder(
                                padding: const EdgeInsets.all(16),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  childAspectRatio: aspectRatio,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12,
                                ),
                                itemCount: remotes.length,
                                dragStartDelay: _reorderMode
                                    ? const Duration(milliseconds: 200)
                                    : const Duration(days: 3650),
                                itemBuilder: (context, index) {
                                  final remote = remotes[index];
                                  return _RemoteCard(
                                    key: ObjectKey(remote),
                                    remote: remote,
                                    color: cardColor,
                                    reorderMode: _reorderMode,
                                    onTap: () {
                                      if (_reorderMode) return;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RemoteView(remote: remote),
                                        ),
                                      );
                                    },
                                    onLongPress: () => _openRemoteActionsSheet(remote, index),
                                    onOverflow: () => _openRemoteActionsSheet(remote, index),
                                  );
                                },
                                onReorder: (oldIndex, newIndex) async {
                                  if (!_reorderMode) return;
                                  setState(() {
                                    if (newIndex > oldIndex) newIndex--;
                                    final Remote movedRemote = remotes.removeAt(oldIndex);
                                    remotes.insert(newIndex, movedRemote);
                                    _reassignIds();
                                  });
                                  await writeRemotelist(remotes);
                                  notifyRemotesChanged();
                                  if (!mounted) return;
                                  Haptics.selectionClick();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _ReorderHintBanner extends StatelessWidget {
  final VoidCallback onDone;

  const _ReorderHintBanner({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Material(
      color: cs.secondaryContainer.withValues(alpha: 0.55),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
        child: Row(
          children: [
            Icon(Icons.drag_indicator_rounded, color: cs.onSecondaryContainer.withValues(alpha: 0.9)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Reorder mode: long-press and drag a card to move it.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: cs.onSecondaryContainer.withValues(alpha: 0.92),
                ),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton.tonal(
              onPressed: onDone,
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}

class _RemoteCard extends StatelessWidget {
  final Remote remote;
  final Color color;
  final bool reorderMode;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onOverflow;

  const _RemoteCard({
    super.key,
    required this.remote,
    required this.color,
    required this.reorderMode,
    required this.onTap,
    required this.onLongPress,
    required this.onOverflow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final int count = remote.buttons.length;
    return Card(
      color: color,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: reorderMode
            ? BorderSide(color: cs.primary.withValues(alpha: 0.35))
            : BorderSide.none,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: reorderMode ? null : onTap,
        onLongPress: reorderMode ? null : onLongPress,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: cs.primaryContainer.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: cs.outlineVariant.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Icon(
                      Icons.settings_remote_rounded,
                      color: cs.onPrimaryContainer,
                      size: 22,
                    ),
                  ),
                  const Spacer(),
                  if (!reorderMode)
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: IconButton(
                        tooltip: 'More',
                        onPressed: onOverflow,
                        icon: const Icon(Icons.more_vert_rounded, size: 20),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    )
                  else
                    Tooltip(
                      message: 'Reorder mode',
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: cs.outlineVariant.withValues(alpha: 0.25),
                          ),
                        ),
                        child: Icon(
                          Icons.drag_indicator_rounded,
                          size: 16,
                          color: cs.onSurface.withValues(alpha: 0.85),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      remote.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.25)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.grid_view_rounded, size: 14, color: cs.onSurface.withValues(alpha: 0.8)),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        '$count button${count != 1 ? 's' : ''}',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: cs.onSurface.withValues(alpha: 0.85),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onAdd;

  const _EmptyState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.grid_view_outlined, size: 52, color: theme.colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              'No remotes yet',
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              'Create a remote to start sending IR codes.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              label: const Text('Add remote'),
            ),
          ],
        ),
      ),
    );
  }
}

class RemoteSearchDelegate extends SearchDelegate {
  final List<Remote> remotes;
  final void Function(Remote remote)? onOpen;
  final Future<void> Function(Remote remote)? onEdit;
  final Future<void> Function(Remote remote)? onDelete;

  RemoteSearchDelegate(
    this.remotes, {
    this.onOpen,
    this.onEdit,
    this.onDelete,
  });

  Future<bool> _confirmDelete(BuildContext context, String remoteName) async {
    final theme = Theme.of(context);
    return await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: Icon(Icons.warning_amber_rounded, color: theme.colorScheme.error, size: 32),
        title: const Text('Delete remote?'),
        content: Text(
          '"$remoteName" will be permanently removed. This action can\'t be undone.',
          style: theme.textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton.tonalIcon(
            onPressed: () => Navigator.of(ctx).pop(true),
            icon: const Icon(Icons.delete_forever),
            label: const Text('Delete'),
            style: FilledButton.styleFrom(
              foregroundColor: theme.colorScheme.onErrorContainer,
              backgroundColor: theme.colorScheme.errorContainer,
            ),
          ),
        ],
      ),
    ).then((v) => v ?? false);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = remotes
        .where((remote) => remote.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildList(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = remotes
        .where((remote) => remote.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildList(context, suggestions);
  }

  Widget _buildList(BuildContext context, List<Remote> items) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (BuildContext context, int index) {
        final remote = items[index];
        return Card(
          key: ObjectKey(remote),
          color: cs.primary.withValues(alpha: 0.12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: cs.primaryContainer.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: cs.outlineVariant.withValues(alpha: 0.25)),
              ),
              child: Icon(Icons.settings_remote_rounded, color: cs.onPrimaryContainer),
            ),
            title: Text(
              remote.name,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w900),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${remote.buttons.length} button(s) · ${remote.useNewStyle ? 'Comfort' : 'Compact'}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.7),
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: PopupMenuButton<_RemoteMenuAction>(
              tooltip: 'Actions',
              onSelected: (_RemoteMenuAction a) async {
                if (a == _RemoteMenuAction.open) {
                  close(context, null);
                  onOpen?.call(remote);
                  return;
                }
                if (a == _RemoteMenuAction.edit) {
                  await onEdit?.call(remote);
                  showSuggestions(context);
                  return;
                }
                if (a == _RemoteMenuAction.delete) {
                  final confirm = await _confirmDelete(context, remote.name);
                  if (!confirm) return;
                  await onDelete?.call(remote);
                  showSuggestions(context);
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Deleted "${remote.name}". This action can\'t be undone.'),
                    ),
                  );
                }
              },
              itemBuilder: (ctx) => const [
                PopupMenuItem(
                  value: _RemoteMenuAction.open,
                  child: ListTile(
                    leading: Icon(Icons.play_arrow_rounded),
                    title: Text('Open'),
                  ),
                ),
                PopupMenuItem(
                  value: _RemoteMenuAction.edit,
                  child: ListTile(
                    leading: Icon(Icons.edit_outlined),
                    title: Text('Edit'),
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: _RemoteMenuAction.delete,
                  child: ListTile(
                    leading: Icon(Icons.delete_outline),
                    title: Text('Delete'),
                  ),
                ),
              ],
            ),
            onTap: () {
              close(context, null);
              onOpen?.call(remote);
            },
          ),
        );
      },
    );
  }
}

enum _RemoteMenuAction { open, edit, delete }
