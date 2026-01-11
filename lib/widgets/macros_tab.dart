import 'package:flutter/material.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
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
            title: const Text('Macros'),
            actions: [
              if (macros.isNotEmpty)
                IconButton(
                  tooltip: 'Help',
                  onPressed: _showHelp,
                  icon: const Icon(Icons.help_outline_rounded),
                ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _addMacro,
            icon: const Icon(Icons.add_rounded),
            label: const Text('Create Macro'),
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
              'Timed Macros',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Automate sequences of IR commands with precise timing',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 32),
            _buildFeatureCard(
              icon: Icons.toys_outlined,
              title: 'Perfect for Interactive Toys',
              description:
                  'Control devices like i-cybie robot dogs, i-sobot robots, and other toys that need time between commands to process actions.',
              color: cs.primaryContainer,
              onColor: cs.onPrimaryContainer,
            ),
            const SizedBox(height: 16),
            _buildFeatureCard(
              icon: Icons.timer_outlined,
              title: 'Precise Timing Control',
              description:
                  'Add delays between commands (250ms to custom durations) so your device has time to respond before the next action.',
              color: cs.secondaryContainer,
              onColor: cs.onSecondaryContainer,
            ),
            const SizedBox(height: 16),
            _buildFeatureCard(
              icon: Icons.pause_circle_outline_rounded,
              title: 'Manual Continue Steps',
              description:
                  'Pause execution and wait for your confirmation when animation length varies or you need visual feedback.',
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
                        'Example Use Case',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'i-cybie Advanced Mode:\n'
                    '1. Send "Mode" command\n'
                    '2. Wait 1000ms (toy processes)\n'
                    '3. Send "Action 1"\n'
                    '4. Wait 1000ms\n'
                    '5. Send "Action 2"\n'
                    '…and so on automatically!',
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
                label: const Text('Create Your First Macro'),
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
            ? 'No remote'
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
                                    '$stepCount step${stepCount != 1 ? 's' : ''}',
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
                    tooltip: 'Actions',
                    onSelected: (v) {
                      if (v == 'run') _runMacro(macro);
                      if (v == 'edit') _editMacro(i);
                      if (v == 'duplicate') _duplicateMacro(i);
                      if (v == 'delete') _deleteMacro(i);
                    },
                    itemBuilder: (ctx) => const [
                      PopupMenuItem(
                        value: 'run',
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.play_arrow_rounded),
                          title: Text('Run'),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'edit',
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.edit_outlined),
                          title: Text('Edit'),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'duplicate',
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.content_copy_rounded),
                          title: Text('Duplicate'),
                        ),
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        value: 'delete',
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.delete_outline),
                          title: Text('Delete'),
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
                    'About Timed Macros',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Timed Macros let you automate sequences of IR commands with precise delays between each step.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: cs.onSurface.withValues(alpha: 0.8),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              _buildHelpItem(
                icon: Icons.send_rounded,
                title: 'Send Command',
                description: 'Transmits an IR command from your remote.',
              ),
              const SizedBox(height: 12),
              _buildHelpItem(
                icon: Icons.timer_rounded,
                title: 'Delay',
                description:
                    'Waits for a specified duration (e.g., 1000ms) before the next step.',
              ),
              const SizedBox(height: 12),
              _buildHelpItem(
                icon: Icons.pause_circle_outline_rounded,
                title: 'Manual Continue',
                description:
                    'Pauses execution until you tap Continue (useful for variable-length animations).',
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('Got it'),
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
        const SnackBar(content: Text('Failed to save macros.')),
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
        const SnackBar(content: Text('Failed to save macros.')),
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
        const SnackBar(content: Text('Failed to save macros.')),
      );
    }
  }

  Future<void> _deleteMacro(int index) async {
    final ok = await _confirmDelete();
    if (ok != true) return;
    macros.removeAt(index);
    try {
      await _persistAndNotify();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save macros.')),
      );
    }
  }

  Future<bool?> _confirmDelete() async {
    return showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Delete macro?'),
          content: const Text('This cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('Delete'),
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
        const SnackBar(content: Text('No remotes available.')),
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
