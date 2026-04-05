import 'package:flutter/material.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/state/macros_state.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/macros_io.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/macro_editor_screen.dart';
import 'package:irblaster_controller/widgets/macro_run_screen.dart';

class MacrosTab extends StatefulWidget {
  const MacrosTab({super.key});

  @override
  State<MacrosTab> createState() => _MacrosTabState();
}

class _MacrosTabState extends State<MacrosTab> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: macrosRevision,
      builder: (context, _, __) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.macrosTitle),
            actions: [
              if (macros.isNotEmpty)
                IconButton(
                  tooltip: context.l10n.help,
                  onPressed: _showHelp,
                  icon: const Icon(Icons.help_outline_rounded),
                ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _addMacro,
            icon: const Icon(Icons.add_rounded),
            label: Text(context.l10n.createMacro),
          ),
          body: macros.isEmpty ? _buildEmptyState() : _buildMacroList(),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: cs.primaryContainer.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.playlist_play_rounded,
                size: 64,
                color: cs.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              context.l10n.timedMacrosTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              context.l10n.timedMacrosSubtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: cs.outlineVariant.withValues(alpha: 0.4),
                ),
              ),
              child: Text(
                context.l10n.timedMacrosNextStep,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: cs.onSurface.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 32),
            _buildFeatureCard(
              icon: Icons.toys_outlined,
              title: context.l10n.macroFeatureToysTitle,
              description: context.l10n.macroFeatureToysDescription,
              color: cs.primaryContainer,
              onColor: cs.onPrimaryContainer,
            ),
            const SizedBox(height: 16),
            _buildFeatureCard(
              icon: Icons.timer_outlined,
              title: context.l10n.macroFeatureTimingTitle,
              description: context.l10n.macroFeatureTimingDescription,
              color: cs.secondaryContainer,
              onColor: cs.onSecondaryContainer,
            ),
            const SizedBox(height: 16),
            _buildFeatureCard(
              icon: Icons.pause_circle_outline_rounded,
              title: context.l10n.macroFeatureManualTitle,
              description: context.l10n.macroFeatureManualDescription,
              color: cs.tertiaryContainer,
              onColor: cs.onTertiaryContainer,
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: cs.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline_rounded,
                        size: 20,
                        color: cs.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        context.l10n.exampleUseCase,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.l10n.macroExampleText,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: cs.onSurface.withValues(alpha: 0.8),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _addMacro,
                icon: const Icon(Icons.add_rounded),
                label: Text(context.l10n.createFirstMacro),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required Color onColor,
  }) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: onColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMacroList() {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
      itemCount: macros.length,
      itemBuilder: (context, i) {
        final macro = macros[i];
        final remoteLabel = macro.remoteName.trim().isEmpty
            ? context.l10n.noRemote
            : macro.remoteName;
        final stepCount = macro.steps.length;
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 0,
          color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: cs.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _runMacro(macro),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: cs.primaryContainer.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.playlist_play_rounded,
                      color: cs.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          macro.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.settings_remote_outlined,
                              size: 14,
                              color: cs.onSurface.withValues(alpha: 0.6),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                remoteLabel,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: cs.onSurface.withValues(alpha: 0.7),
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: cs.secondaryContainer
                                    .withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.format_list_numbered_rounded,
                                    size: 12,
                                    color: cs.onSecondaryContainer,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    context.l10n.macroStepCountLabel(stepCount),
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800,
                                      color: cs.onSecondaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  PopupMenuButton<String>(
                    tooltip: context.l10n.actions,
                    onSelected: (v) {
                      if (v == 'run') _runMacro(macro);
                      if (v == 'edit') _editMacro(i);
                      if (v == 'duplicate') _duplicateMacro(i);
                      if (v == 'delete') _deleteMacro(i);
                    },
                    itemBuilder: (ctx) => [
                      PopupMenuItem(
                        value: 'run',
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.play_arrow_rounded),
                          title: Text(context.l10n.run),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'edit',
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.edit_outlined),
                          title: Text(context.l10n.edit),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'duplicate',
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.content_copy_rounded),
                          title: Text(context.l10n.duplicate),
                        ),
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        value: 'delete',
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.delete_outline),
                          title: Text(context.l10n.delete),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showHelp() {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.help_outline_rounded, color: cs.primary),
                  const SizedBox(width: 12),
                  Text(
                    context.l10n.aboutTimedMacros,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                context.l10n.aboutTimedMacrosDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: cs.onSurface.withValues(alpha: 0.8),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              _buildHelpItem(
                icon: Icons.send_rounded,
                title: context.l10n.sendCommand,
                description: context.l10n.sendCommandDescription,
              ),
              const SizedBox(height: 12),
              _buildHelpItem(
                icon: Icons.timer_rounded,
                title: context.l10n.delay,
                description: context.l10n.delayDescription,
              ),
              const SizedBox(height: 12),
              _buildHelpItem(
                icon: Icons.pause_circle_outline_rounded,
                title: context.l10n.manualContinue,
                description: context.l10n.manualContinueDescription,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: Text(context.l10n.gotIt),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHelpItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: cs.primaryContainer.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: cs.onPrimaryContainer),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: cs.onSurface.withValues(alpha: 0.7),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _persistAndNotify() async {
    await writeMacrosList(macros);
    notifyMacrosChanged();
  }

  Remote? _findRemoteByName(String name) {
    final key = name.trim();
    if (key.isEmpty) return null;
    try {
      return remotes.firstWhere((r) => r.name == key);
    } catch (_) {
      return null;
    }
  }

  Future<void> _addMacro() async {
    final remote = await _pickRemote();
    if (remote == null) return;
    if (!mounted) return;
    final macro = await Navigator.push<TimedMacro>(
      context,
      MaterialPageRoute(
        builder: (context) => MacroEditorScreen(remote: remote),
      ),
    );
    if (macro == null) return;
    macros.add(macro);
    try {
      await _persistAndNotify();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.failedToSaveMacros)),
      );
    }
  }

  Future<void> _editMacro(int index) async {
    final macro = macros[index];
    final auto = _findRemoteByName(macro.remoteName);
    final remote = auto ?? await _pickRemote();
    if (remote == null) return;
    if (!mounted) return;
    final edited = await Navigator.push<TimedMacro>(
      context,
      MaterialPageRoute(
        builder: (context) => MacroEditorScreen(macro: macro, remote: remote),
      ),
    );
    if (edited == null) return;
    macros[index] = edited;
    try {
      await _persistAndNotify();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.failedToSaveMacros)),
      );
    }
  }

  Future<void> _duplicateMacro(int index) async {
    final original = macros[index];
    final nowId = DateTime.now().millisecondsSinceEpoch.toString();
    final dup = original.copyWith(
      id: nowId,
      name: '${original.name} (Copy)',
    );
    macros.insert(index + 1, dup);
    try {
      await _persistAndNotify();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.failedToSaveMacros)),
      );
    }
  }

  Future<void> _deleteMacro(int index) async {
    final ok = await _confirmDelete();
    if (ok != true) return;
    final removedIndex = index;
    final removedMacro = macros[index];
    macros.removeAt(removedIndex);
    try {
      await _persistAndNotify();
    } catch (_) {
      macros.insert(removedIndex.clamp(0, macros.length), removedMacro);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.failedToSaveMacros)),
      );
      return;
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.l10n.deletedMacroNamed(removedMacro.name)),
        action: SnackBarAction(
          label: context.l10n.undo,
          onPressed: () async {
            macros.insert(
              removedIndex.clamp(0, macros.length),
              removedMacro,
            );
            try {
              await _persistAndNotify();
            } catch (_) {
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.failedToRestoreMacro)),
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool?> _confirmDelete() async {
    return showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(context.l10n.deleteMacroTitle),
          content: Text(context.l10n.deleteMacroMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(context.l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(context.l10n.delete),
            ),
          ],
        );
      },
    );
  }

  Future<void> _runMacro(TimedMacro macro) async {
    final auto = _findRemoteByName(macro.remoteName);
    final remote = auto ?? await _pickRemote();
    if (remote == null) return;
    if (!mounted) return;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MacroRunScreen(macro: macro, remote: remote),
      ),
    );
  }

  Future<Remote?> _pickRemote() async {
    if (remotes.isEmpty) {
      if (!mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.noRemotesAvailable)),
      );
      return null;
    }
    if (remotes.length == 1) return remotes.first;
    return showModalBottomSheet<Remote>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (ctx) {
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: remotes.length,
          itemBuilder: (context, i) {
            final r = remotes[i];
            return ListTile(
              title: Text(r.name),
              onTap: () => Navigator.of(ctx).pop(r),
            );
          },
        );
      },
    );
  }
}
