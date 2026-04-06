import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/icon_picker_names.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/state/macros_state.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/button_label.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/macro_run_screen.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';

class GlobalSearchDelegate extends SearchDelegate<void> {
  @override
  String? get searchFieldLabel => null;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      if (query.isNotEmpty)
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear_rounded),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _buildResults(context);

  @override
  Widget buildSuggestions(BuildContext context) => _buildResults(context);

  Widget _buildResults(BuildContext context) {
    final items = _collectResults(context, query);
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search_off_rounded,
                size: 44,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.6),
              ),
              const SizedBox(height: 12),
              Text(
                context.l10n.globalSearchNoResults,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = items[index];
        return _SearchResultCard(item: item);
      },
    );
  }

  List<_SearchResultItem> _collectResults(BuildContext context, String q) {
    final normalized = q.trim().toLowerCase();
    if (normalized.isEmpty) {
      return <_SearchResultItem>[
        ...remotes.take(6).map((r) => _SearchResultItem.remote(remote: r)),
        ...macros.take(6).map((m) => _SearchResultItem.macro(macro: m)),
      ];
    }

    final List<_SearchResultItem> out = <_SearchResultItem>[];
    for (final remote in remotes) {
      final remoteName = remote.name.trim();
      if (remoteName.toLowerCase().contains(normalized)) {
        out.add(_SearchResultItem.remote(remote: remote));
      }

      for (final button in remote.buttons) {
        final label = displayButtonLabel(
          button,
          fallback: context.l10n.unnamedButton,
          iconFallback: context.l10n.iconFallback,
          iconNameLocalizer: (name) =>
              localizedIconPickerName(context.l10n, name),
        );
        if (label.toLowerCase().contains(normalized) ||
            remoteName.toLowerCase().contains(normalized)) {
          out.add(
            _SearchResultItem.button(
              remote: remote,
              button: button,
              buttonLabel: label,
            ),
          );
        }
      }
    }

    for (final macro in macros) {
      final macroName = macro.name.trim().toLowerCase();
      final remoteName = macro.remoteName.trim().toLowerCase();
      if (macroName.contains(normalized) || remoteName.contains(normalized)) {
        out.add(_SearchResultItem.macro(macro: macro));
      }
    }

    return _dedupe(out);
  }

  List<_SearchResultItem> _dedupe(List<_SearchResultItem> items) {
    final seen = <String>{};
    final out = <_SearchResultItem>[];
    for (final item in items) {
      if (seen.add(item.key)) {
        out.add(item);
      }
    }
    return out;
  }
}

enum _SearchItemType { remote, button, macro }

class _SearchResultItem {
  final _SearchItemType type;
  final String key;
  final Remote? remote;
  final IRButton? button;
  final TimedMacro? macro;
  final String title;
  final String subtitle;
  final String badge;
  final IconData icon;

  const _SearchResultItem._({
    required this.type,
    required this.key,
    required this.remote,
    required this.button,
    required this.macro,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.icon,
  });

  factory _SearchResultItem.remote({required Remote remote}) {
    return _SearchResultItem._(
      type: _SearchItemType.remote,
      key: 'remote:${remote.id}:${remote.name}',
      remote: remote,
      button: null,
      macro: null,
      title: remote.name,
      subtitle: '',
      badge: '',
      icon: Icons.settings_remote_rounded,
    );
  }

  factory _SearchResultItem.button({
    required Remote remote,
    required IRButton button,
    required String buttonLabel,
  }) {
    return _SearchResultItem._(
      type: _SearchItemType.button,
      key: 'button:${button.id}',
      remote: remote,
      button: button,
      macro: null,
      title: buttonLabel,
      subtitle: remote.name,
      badge: '',
      icon: Icons.radio_button_checked_rounded,
    );
  }

  factory _SearchResultItem.macro({required TimedMacro macro}) {
    return _SearchResultItem._(
      type: _SearchItemType.macro,
      key: 'macro:${macro.id}',
      remote: null,
      button: null,
      macro: macro,
      title: macro.name,
      subtitle: macro.remoteName,
      badge: '',
      icon: Icons.playlist_play_rounded,
    );
  }
}

class _SearchResultCard extends StatelessWidget {
  final _SearchResultItem item;

  const _SearchResultCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final effectiveSubtitle = switch (item.type) {
      _SearchItemType.remote =>
        context.l10n.remoteButtonCountLabel(item.remote!.buttons.length),
      _SearchItemType.button => item.subtitle,
      _SearchItemType.macro => item.macro!.remoteName.trim().isEmpty
          ? context.l10n.macroStepCountLabel(item.macro!.steps.length)
          : '${item.macro!.remoteName} · ${context.l10n.macroStepCountLabel(item.macro!.steps.length)}',
    };
    final effectiveBadge = switch (item.type) {
      _SearchItemType.remote => context.l10n.globalSearchTypeRemote,
      _SearchItemType.button => context.l10n.globalSearchTypeButton,
      _SearchItemType.macro => context.l10n.globalSearchTypeMacro,
    };
    return Card(
      elevation: 0,
      color: cs.surfaceContainerHigh,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.35)),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _open(context),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: cs.primaryContainer.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: cs.onPrimaryContainer),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      effectiveSubtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onSurface.withValues(alpha: 0.72),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: cs.secondaryContainer.withValues(alpha: 0.75),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  effectiveBadge,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: cs.onSecondaryContainer,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _open(BuildContext context) async {
    Navigator.of(context).pop();
    switch (item.type) {
      case _SearchItemType.remote:
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => RemoteView(remote: item.remote!),
          ),
        );
        break;
      case _SearchItemType.button:
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => RemoteView(
              remote: item.remote!,
              initialFocusButtonId: item.button!.id,
            ),
          ),
        );
        break;
      case _SearchItemType.macro:
        final macro = item.macro!;
        final Remote? remote = _findRemoteByName(macro.remoteName);
        if (remote == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.continueTargetUnavailable)),
          );
          return;
        }
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MacroRunScreen(macro: macro, remote: remote),
          ),
        );
        break;
    }
  }

  Remote? _findRemoteByName(String rawName) {
    final key = rawName.trim();
    if (key.isEmpty) return null;
    try {
      return remotes.firstWhere((r) => r.name.trim() == key);
    } catch (_) {
      return null;
    }
  }
}
