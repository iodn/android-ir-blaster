import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/state/continue_context_prefs.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/state/remote_highlights_prefs.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/global_search_delegate.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_draft.dart';
import 'package:irblaster_controller/widgets/remote_setup_screen.dart';
import 'package:irblaster_controller/widgets/remote_studio_screen.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class RemoteList extends StatefulWidget {
  const RemoteList({super.key});

  @override
  State<RemoteList> createState() => _RemoteListState();
}

class _RemoteListState extends State<RemoteList> {
  bool _reorderMode = false;
  ContinueContextsSnapshot _continueContexts = const ContinueContextsSnapshot(
    remote: null,
    macro: null,
    irFinderHit: null,
    universalPower: null,
  );
  List<Remote> _pinnedRemotes = const <Remote>[];

  @override
  void initState() {
    super.initState();
    continueContextsRevision.addListener(_handleContinueContextsChanged);
    remoteHighlightsRevision.addListener(_handleRemoteHighlightsChanged);
    _refreshContinueContexts();
    _refreshRemoteHighlights();
  }

  @override
  void dispose() {
    continueContextsRevision.removeListener(_handleContinueContextsChanged);
    remoteHighlightsRevision.removeListener(_handleRemoteHighlightsChanged);
    super.dispose();
  }

  void _handleContinueContextsChanged() {
    _refreshContinueContexts();
  }

  void _handleRemoteHighlightsChanged() {
    _refreshRemoteHighlights();
  }

  Future<void> _refreshContinueContexts() async {
    final next = await ContinueContextsPrefs.load();
    if (!mounted) return;
    setState(() => _continueContexts = next);
  }

  Future<void> _refreshRemoteHighlights() async {
    final pinnedRefs = await RemoteHighlightsPrefs.loadPinned();
    if (!mounted) return;
    final pinned = _resolveHighlightRefs(pinnedRefs, limit: 6);
    setState(() {
      _pinnedRemotes = pinned;
    });
  }

  void _reassignIds() {
    for (int i = 0; i < remotes.length; i++) {
      remotes[i].id = i + 1;
    }
  }

  Remote? _findRemoteForContinue(LastRemoteContext ctx) {
    final String wantedName = ctx.remoteName.trim();
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

  Remote? _findRemoteByRef(RemoteHighlightRef ctx) {
    final String wantedName = ctx.remoteName.trim();
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

  List<Remote> _resolveHighlightRefs(
    List<RemoteHighlightRef> refs, {
    required int limit,
  }) {
    final List<Remote> out = <Remote>[];
    final Set<int> seenIds = <int>{};
    for (final ref in refs) {
      final remote = _findRemoteByRef(ref);
      if (remote == null) continue;
      if (seenIds.contains(remote.id)) continue;
      out.add(remote);
      seenIds.add(remote.id);
      if (out.length >= limit) break;
    }
    return out;
  }

  void _showContinueUnavailable() {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.continueTargetUnavailable)),
    );
  }

  void _setReorderMode(bool v) {
    if (_reorderMode == v) return;
    setState(() => _reorderMode = v);
    Haptics.selectionClick();
    if (v && mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.remoteListReorderHint),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _openLastRemote(LastRemoteContext ctx) async {
    final remote = _findRemoteForContinue(ctx);
    if (remote == null) {
      _showContinueUnavailable();
      return;
    }
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RemoteView(remote: remote)),
    );
  }

  Future<void> _togglePinnedRemote(Remote remote) async {
    final wasPinned = await RemoteHighlightsPrefs.isPinned(remote);
    await RemoteHighlightsPrefs.togglePinned(remote);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          wasPinned
              ? context.l10n.remoteRemovedFromPinned
              : context.l10n.remoteAddedToPinned,
        ),
      ),
    );
  }

  List<_TopRemoteAccessCardData> _topRemoteAccessItems(BuildContext context) {
    final List<_TopRemoteAccessCardData> items = <_TopRemoteAccessCardData>[];
    final lastRemoteCtx = _continueContexts.remote;
    String? lastRemoteKey;

    if (lastRemoteCtx != null) {
      lastRemoteKey =
          '${lastRemoteCtx.remoteId}:${lastRemoteCtx.remoteName.trim()}';
      items.add(
        _TopRemoteAccessCardData(
          icon: Icons.history_rounded,
          eyebrow: context.l10n.continueLastRemoteTitle,
          title: lastRemoteCtx.remoteName.trim().isEmpty
              ? context.l10n.unnamedRemote
              : lastRemoteCtx.remoteName,
          subtitle: context.l10n.remoteButtonCountLabel(
            lastRemoteCtx.buttonCount,
          ),
          pinned: false,
          onTap: () => _openLastRemote(lastRemoteCtx),
        ),
      );
    }

    for (final remote in _pinnedRemotes) {
      final key = '${remote.id}:${remote.name.trim()}';
      if (lastRemoteKey != null && key == lastRemoteKey) continue;
      items.add(
        _TopRemoteAccessCardData(
          icon: Icons.push_pin_rounded,
          eyebrow: context.l10n.pinRemote,
          title: remote.name,
          subtitle: context.l10n.remoteButtonCountLabel(remote.buttons.length),
          pinned: true,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RemoteView(remote: remote)),
            );
          },
        ),
      );
    }

    return items;
  }

  Widget _buildTopRemoteAccessStrip(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final verySmallPhone = screenWidth < 380;
    final items = _topRemoteAccessItems(context);
    if (items.isEmpty) return const SizedBox.shrink();
    final visibleItems = verySmallPhone ? items.take(4).toList() : items;
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: SizedBox(
        height: 68,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: visibleItems.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, index) => _TopRemoteAccessCard(
            item: visibleItems[index],
            colorScheme: cs,
            compactWidth: verySmallPhone,
          ),
        ),
      ),
    );
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
              Icon(Icons.warning_amber_rounded,
                  size: 44, color: theme.colorScheme.error),
              const SizedBox(height: 12),
              Text(
                context.l10n.deleteRemoteTitle,
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                context.l10n.deleteRemoteMessage(remote.name),
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
                      child: Text(context.l10n.cancel),
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
                      label: Text(context.l10n.delete),
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
      final RemoteEditorDraft? setupDraft = await Navigator.push<RemoteEditorDraft?>(
        context,
        MaterialPageRoute(builder: (context) => const RemoteSetupScreen()),
      );
      if (setupDraft == null || !mounted) return;
      final Remote? newRemote = await Navigator.push<Remote?>(
        context,
        MaterialPageRoute(
          builder: (context) => RemoteStudioScreen(initialDraft: setupDraft),
        ),
      );
      if (newRemote == null || !mounted) return;
      setState(() {
        remotes.add(newRemote);
        _reassignIds();
      });
      await writeRemotelist(remotes);
      notifyRemotesChanged();
      if (!mounted) return;
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RemoteView(remote: newRemote)),
      );
    } catch (_) {}
  }

  Future<void> _editRemoteAt(int index) async {
    if (_reorderMode) _setReorderMode(false);
    final Remote remote = remotes[index];
    try {
      final Remote? editedRemote = await Navigator.push<Remote?>(
        context,
        MaterialPageRoute(
          builder: (context) => RemoteStudioScreen(
            initialDraft: RemoteEditorDraft.fromRemote(remote),
          ),
        ),
      );
      if (editedRemote == null || !mounted) return;
      setState(() {
        remotes[index] = editedRemote;
      });
      await writeRemotelist(remotes);
      notifyRemotesChanged();
      if (!mounted) return;
      Haptics.selectionClick();
    } catch (_) {}
  }

  Future<void> _deleteRemoteAt(int index) async {
    if (_reorderMode) _setReorderMode(false);
    final Remote remote = remotes[index];
    final confirmed = await _confirmDeleteRemote(context, remote);
    if (!confirmed) return;
    await RemoteHighlightsPrefs.removeForRemote(remote);
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
        content: Text(context.l10n.deletedRemoteUndoUnavailable(remote.name)),
      ),
    );
  }

  Future<void> _openRemoteActionsSheet(Remote remote, int index) async {
    if (_reorderMode) return;
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final bool pinned = await RemoteHighlightsPrefs.isPinned(remote);
    if (!mounted) return;
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
                          backgroundColor:
                              cs.primaryContainer.withValues(alpha: 0.65),
                          child: Icon(Icons.settings_remote_rounded,
                              color: cs.onPrimaryContainer),
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
                                context.l10n.remoteLayoutSummary(
                                  remote.buttons.length,
                                  remote.useNewStyle
                                      ? context.l10n.layoutComfort
                                      : context.l10n.layoutCompact,
                                ),
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
                      title: Text(context.l10n.open),
                      subtitle: Text(context.l10n.useThisRemote),
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
                      leading: Icon(
                        pinned
                            ? Icons.push_pin_rounded
                            : Icons.push_pin_outlined,
                      ),
                      title: Text(
                        pinned
                            ? context.l10n.unpinRemote
                            : context.l10n.pinRemote,
                      ),
                      subtitle: Text(context.l10n.pinRemoteSubtitle),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () async {
                        Navigator.of(ctx).pop();
                        await _togglePinnedRemote(remote);
                      },
                    ),
                    const Divider(height: 0),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.edit_outlined),
                      title: Text(context.l10n.edit),
                      subtitle: Text(context.l10n.editRemoteSubtitle),
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
                        context.l10n.delete,
                        style: TextStyle(
                          color: cs.error,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      subtitle: Text(context.l10n.thisCannotBeUndone),
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
        return PopScope(
          canPop: !_reorderMode,
          onPopInvokedWithResult: (didPop, _) async {
            if (didPop) return;
            await _onWillPop();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(context.l10n.remotesNavLabel),
              actions: [
                if (!_reorderMode)
                  IconButton(
                    tooltip: context.l10n.globalSearchTitle,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: GlobalSearchDelegate(),
                      );
                    },
                  ),
                IconButton(
                  tooltip: _reorderMode
                      ? context.l10n.done
                      : context.l10n.reorderRemotes,
                  icon: Icon(_reorderMode
                      ? Icons.check_rounded
                      : Icons.drag_indicator_rounded),
                  onPressed: () => _setReorderMode(!_reorderMode),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: _reorderMode ? null : _addRemote,
              icon: const Icon(Icons.add),
              label: Text(context.l10n.addRemote),
            ),
            body: SafeArea(
              child: remotes.isEmpty
                  ? CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: _buildTopRemoteAccessStrip(context),
                        ),
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: _EmptyState(onAdd: _addRemote),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _buildTopRemoteAccessStrip(context),
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
                              final crossAxisCount =
                                  _calculateCrossAxisCount(context);
                              final aspectRatio =
                                  _calculateChildAspectRatio(context);
                              return ReorderableGridView.builder(
                                padding: const EdgeInsets.all(16),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
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
                                          builder: (context) =>
                                              RemoteView(remote: remote),
                                        ),
                                      );
                                    },
                                    onLongPress: () =>
                                        _openRemoteActionsSheet(remote, index),
                                    onOverflow: () =>
                                        _openRemoteActionsSheet(remote, index),
                                  );
                                },
                                onReorder: (oldIndex, newIndex) async {
                                  if (!_reorderMode) return;
                                  setState(() {
                                    if (newIndex > oldIndex) newIndex--;
                                    final Remote movedRemote =
                                        remotes.removeAt(oldIndex);
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
            Icon(Icons.drag_indicator_rounded,
                color: cs.onSecondaryContainer.withValues(alpha: 0.9)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                context.l10n.remoteListReorderHint,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: cs.onSecondaryContainer.withValues(alpha: 0.92),
                ),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton.tonal(
              onPressed: onDone,
              child: Text(context.l10n.done),
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
                        tooltip: context.l10n.more,
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
                          color: cs.surfaceContainerHighest
                              .withValues(alpha: 0.55),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                      color: cs.outlineVariant.withValues(alpha: 0.25)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.grid_view_rounded,
                        size: 14, color: cs.onSurface.withValues(alpha: 0.8)),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        context.l10n.remoteButtonCountLabel(count),
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

class _TopRemoteAccessCardData {
  final IconData icon;
  final String eyebrow;
  final String title;
  final String subtitle;
  final bool pinned;
  final Future<void> Function() onTap;

  const _TopRemoteAccessCardData({
    required this.icon,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    required this.pinned,
    required this.onTap,
  });
}

class _TopRemoteAccessCard extends StatelessWidget {
  final _TopRemoteAccessCardData item;
  final ColorScheme colorScheme;
  final bool compactWidth;

  const _TopRemoteAccessCard({
    required this.item,
    required this.colorScheme,
    this.compactWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Tooltip(
      message: item.subtitle,
      waitDuration: const Duration(milliseconds: 350),
      child: SizedBox(
        width: compactWidth ? 142 : 148,
        child: Material(
          color: item.pinned
              ? colorScheme.surfaceContainerHigh
              : colorScheme.secondaryContainer.withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(14),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => item.onTap(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: item.pinned
                          ? colorScheme.primaryContainer.withValues(alpha: 0.72)
                          : colorScheme.onSecondaryContainer
                              .withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Icon(
                      item.icon,
                      size: 16,
                      color: item.pinned
                          ? colorScheme.onPrimaryContainer
                          : colorScheme.onSecondaryContainer,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.eyebrow,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: item.pinned
                                ? colorScheme.primary
                                : colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.w900,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            height: 1.05,
                            color: item.pinned
                                ? colorScheme.onSurface
                                : colorScheme.onSecondaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
            Icon(Icons.grid_view_outlined,
                size: 52, color: theme.colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              context.l10n.noRemotesYet,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.noRemotesDescription,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              context.l10n.noRemotesNextStep,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              label: Text(context.l10n.addRemote),
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
        icon: Icon(Icons.warning_amber_rounded,
            color: theme.colorScheme.error, size: 32),
        title: Text(context.l10n.deleteRemoteTitle),
        content: Text(
          context.l10n.deleteRemoteMessage(remoteName),
          style: theme.textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton.tonalIcon(
            onPressed: () => Navigator.of(ctx).pop(true),
            icon: const Icon(Icons.delete_forever),
            label: Text(context.l10n.delete),
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
        .where(
            (remote) => remote.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildList(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = remotes
        .where(
            (remote) => remote.name.toLowerCase().contains(query.toLowerCase()))
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: cs.primaryContainer.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: cs.outlineVariant.withValues(alpha: 0.25)),
              ),
              child: Icon(Icons.settings_remote_rounded,
                  color: cs.onPrimaryContainer),
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
              tooltip: context.l10n.actions,
              onSelected: (_RemoteMenuAction a) async {
                if (a == _RemoteMenuAction.open) {
                  close(context, null);
                  onOpen?.call(remote);
                  return;
                }
                if (a == _RemoteMenuAction.edit) {
                  await onEdit?.call(remote);
                  if (!context.mounted) return;
                  showSuggestions(context);
                  return;
                }
                if (a == _RemoteMenuAction.delete) {
                  final confirm = await _confirmDelete(context, remote.name);
                  if (!confirm) return;
                  await onDelete?.call(remote);
                  if (!context.mounted) return;
                  showSuggestions(context);
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.l10n
                          .deletedRemoteUndoUnavailable(remote.name)),
                    ),
                  );
                }
              },
              itemBuilder: (ctx) => [
                PopupMenuItem(
                  value: _RemoteMenuAction.open,
                  child: ListTile(
                    leading: Icon(Icons.play_arrow_rounded),
                    title: Text(context.l10n.open),
                  ),
                ),
                PopupMenuItem(
                  value: _RemoteMenuAction.edit,
                  child: ListTile(
                    leading: Icon(Icons.edit_outlined),
                    title: Text(context.l10n.edit),
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: _RemoteMenuAction.delete,
                  child: ListTile(
                    leading: Icon(Icons.delete_outline),
                    title: Text(context.l10n.delete),
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
