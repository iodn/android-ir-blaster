import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/remote.dart';

class MacroEditorScreen extends StatefulWidget {
  final TimedMacro? macro;
  final Remote remote;

  const MacroEditorScreen({
    super.key,
    this.macro,
    required this.remote,
  });

  @override
  State<MacroEditorScreen> createState() => _MacroEditorScreenState();
}

class _MacroEditorScreenState extends State<MacroEditorScreen> {
  final TextEditingController _nameCtl = TextEditingController();
  final List<MacroStep> _steps = <MacroStep>[];

  @override
  void initState() {
    super.initState();
    final m = widget.macro;
    _nameCtl.text = m?.name ?? '';
    _nameCtl.addListener(_onNameChanged);

    final loaded = (m?.steps ?? const <MacroStep>[])
        .map((s) => s.id.trim().isEmpty ? s.copyWith(id: MacroStep.newId()) : s)
        .toList();

    _steps.addAll(loaded);
  }

  @override
  void dispose() {
    _nameCtl.removeListener(_onNameChanged);
    _nameCtl.dispose();
    super.dispose();
  }

  void _onNameChanged() {
    if (mounted) setState(() {});
  }

  String get _screenTitle => widget.macro == null ? 'Create Macro' : 'Edit Macro';

  String get _remoteDisplayName {
    final n = widget.remote.name.trim();
    return n.isEmpty ? 'Unnamed Remote' : n;
  }

  bool get _canSave {
    final nameOk = _nameCtl.text.trim().isNotEmpty;
    final stepsOk = _steps.isNotEmpty && _steps.every((s) => s.isValid);
    return nameOk && stepsOk;
  }

  String? get _saveBlockerMessage {
    if (_nameCtl.text.trim().isEmpty) return 'Enter a macro name';
    if (_steps.isEmpty) return 'Add at least one step';
    if (_steps.any((s) => !s.isValid)) return 'Fix invalid steps';
    return null;
  }

  Future<void> _addSendStep() async {
    final button = await _pickButton();
    if (button == null) return;
    setState(() {
      _steps.add(
        MacroStep(
          id: MacroStep.newId(),
          type: MacroStepType.send,
          buttonId: button.id,
          buttonRef: button.image,
        ),
      );
    });
    HapticFeedback.selectionClick();
  }

  Future<void> _addDelayStep() async {
    final ms = await _pickDelay();
    if (ms == null) return;
    setState(() {
      _steps.add(
        MacroStep(
          id: MacroStep.newId(),
          type: MacroStepType.delay,
          delayMs: ms,
        ),
      );
    });
    HapticFeedback.selectionClick();
  }

  void _addManualContinueStep() {
    setState(() {
      _steps.add(
        MacroStep(
          id: MacroStep.newId(),
          type: MacroStepType.manualContinue,
        ),
      );
    });
    HapticFeedback.selectionClick();
  }

  Future<void> _editStep(int index) async {
    final step = _steps[index];
    if (step.type == MacroStepType.send) {
      final button = await _pickButton();
      if (button == null) return;
      setState(() {
        _steps[index] = step.copyWith(buttonId: button.id, buttonRef: button.image);
      });
      HapticFeedback.selectionClick();
      return;
    }
    if (step.type == MacroStepType.delay) {
      final ms = await _pickDelay(initial: step.delayMs);
      if (ms == null) return;
      setState(() {
        _steps[index] = step.copyWith(delayMs: ms);
      });
      HapticFeedback.selectionClick();
      return;
    }
  }

  IRButton? _findButtonById(String? id) {
    final key = (id ?? '').trim();
    if (key.isEmpty) return null;
    try {
      return widget.remote.buttons.firstWhere((b) => b.id == key);
    } catch (_) {
      return null;
    }
  }

  IRButton? _findButtonByRef(String? ref) {
    final key = normalizeButtonKey(ref ?? '');
    if (key.isEmpty) return null;
    try {
      return widget.remote.buttons.firstWhere((b) => normalizeButtonKey(b.image) == key);
    } catch (_) {
      return null;
    }
  }

  String _stepSendLabel(MacroStep step) {
    final byId = _findButtonById(step.buttonId);
    if (byId != null) return formatButtonDisplayName(byId.image);

    final byRef = _findButtonByRef(step.buttonRef) ?? _findButtonByRef(step.buttonId);
    if (byRef != null) return formatButtonDisplayName(byRef.image);

    final fallback = (step.buttonRef ?? step.buttonId ?? '').trim();
    if (fallback.isEmpty) return 'Unknown Command';
    final pretty = formatButtonDisplayName(fallback);
    return pretty.isEmpty ? 'Unknown Command' : pretty;
  }

  Future<IRButton?> _pickButton() async {
    if (widget.remote.buttons.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('This remote has no buttons.')),
      );
      return null;
    }

    return showModalBottomSheet<IRButton>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (ctx) {
        final theme = Theme.of(ctx);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Row(
                children: [
                  Icon(Icons.send_rounded, color: theme.colorScheme.primary),
                  const SizedBox(width: 12),
                  Text(
                    'Select Command',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                itemCount: widget.remote.buttons.length,
                itemBuilder: (context, i) {
                  final b = widget.remote.buttons[i];
                  final label = formatButtonDisplayName(b.image).trim();
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.touch_app_rounded,
                          size: 20,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      title: Text(label.isEmpty ? 'Unnamed Command' : label),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () => Navigator.of(ctx).pop(b),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  Future<int?> _pickDelay({int? initial}) async {
    final theme = Theme.of(context);
    final presets = <int>[250, 500, 1000, 1500, 2000, 3000, 5000];
    return showModalBottomSheet<int>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Row(
                children: [
                  Icon(Icons.timer_rounded, color: theme.colorScheme.primary),
                  const SizedBox(width: 12),
                  Text(
                    'Select Delay',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                children: [
                  if (initial != null)
                    Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.3),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.check_circle_rounded,
                            size: 20,
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                        ),
                        title: Text('Keep: ${initial}ms'),
                        subtitle: Text(_formatDelay(initial)),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () => Navigator.of(ctx).pop(initial),
                      ),
                    ),
                  for (final ms in presets)
                    Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.timer_rounded,
                            size: 20,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        title: Text('${ms}ms'),
                        subtitle: Text(_formatDelay(ms)),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () => Navigator.of(ctx).pop(ms),
                      ),
                    ),
                  Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiaryContainer.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.edit_rounded,
                          size: 20,
                          color: theme.colorScheme.onTertiaryContainer,
                        ),
                      ),
                      title: const Text('Custom'),
                      subtitle: const Text('Enter a custom delay duration'),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () async {
                        final custom = await _promptCustomDelay(ctx, initial: initial);
                        if (custom != null && ctx.mounted) {
                          Navigator.of(ctx).pop(custom);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  String _formatDelay(int ms) {
    if (ms < 1000) return '$ms milliseconds';
    final sec = ms / 1000;
    return '${sec.toStringAsFixed(sec.truncateToDouble() == sec ? 0 : 1)} second${sec != 1 ? 's' : ''}';
  }

  Future<int?> _promptCustomDelay(BuildContext context, {int? initial}) async {
    final ctl = TextEditingController(text: initial?.toString() ?? '');
    final theme = Theme.of(context);
    return showDialog<int>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Custom Delay'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: ctl,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Delay (milliseconds)',
                  hintText: 'e.g., 3000',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.timer_rounded),
                ),
                autofocus: true,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lightbulb_outline_rounded,
                      size: 16,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Recommended: 250-5000ms for most devices',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final v = int.tryParse(ctl.text.trim());
                if (v == null || v <= 0) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid positive number')),
                  );
                  return;
                }
                Navigator.of(ctx).pop(v);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _deleteStep(int index) {
    setState(() {
      _steps.removeAt(index);
    });
    HapticFeedback.selectionClick();
  }

  void _reorderSteps(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final step = _steps.removeAt(oldIndex);
      _steps.insert(newIndex, step);
    });
    HapticFeedback.mediumImpact();
  }

  void _save() {
    if (!_canSave) return;
    final macro = TimedMacro(
      id: widget.macro?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameCtl.text.trim(),
      remoteName: widget.remote.name,
      steps: List<MacroStep>.from(_steps),
      version: 1,
    );
    Navigator.of(context).pop(macro);
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
        actions: [
          if (_canSave)
            IconButton(
              tooltip: 'Save',
              onPressed: _save,
              icon: const Icon(Icons.check_rounded),
            ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!_canSave && _saveBlockerMessage != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: cs.errorContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: cs.error.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: 20, color: cs.error),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _saveBlockerMessage!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onErrorContainer,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                    label: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _canSave ? _save : null,
                    icon: const Icon(Icons.save_rounded),
                    label: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 0,
            color: cs.primaryContainer.withValues(alpha: 0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: cs.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: cs.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.settings_remote_outlined,
                      color: cs.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Remote',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: cs.onPrimaryContainer.withValues(alpha: 0.7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _remoteDisplayName,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: cs.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _nameCtl,
            decoration: InputDecoration(
              labelText: 'Macro Name',
              hintText: 'e.g., i-cybie Advanced Mode',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.label_outline_rounded),
              suffixIcon: _nameCtl.text.trim().isNotEmpty
                  ? IconButton(
                      tooltip: 'Clear',
                      onPressed: () => _nameCtl.clear(),
                      icon: const Icon(Icons.clear_rounded),
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Icon(Icons.format_list_numbered_rounded, color: cs.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Steps (${_steps.length})',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (_steps.isEmpty)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: cs.outlineVariant.withValues(alpha: 0.5),
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.playlist_add_rounded,
                    size: 48,
                    color: cs.onSurface.withValues(alpha: 0.4),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No steps yet',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Add commands and delays below to build your sequence',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          if (_steps.isNotEmpty)
            ReorderableListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _steps.length,
              onReorder: _reorderSteps,
              itemBuilder: (context, i) {
                final step = _steps[i];
                return _buildStepCard(step, i);
              },
            ),
          const SizedBox(height: 16),
          Text(
            'Add Step',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton.tonalIcon(
                onPressed: _addSendStep,
                icon: const Icon(Icons.send_rounded),
                label: const Text('Command'),
              ),
              FilledButton.tonalIcon(
                onPressed: _addDelayStep,
                icon: const Icon(Icons.timer_rounded),
                label: const Text('Delay'),
              ),
              FilledButton.tonalIcon(
                onPressed: _addManualContinueStep,
                icon: const Icon(Icons.pause_circle_outline_rounded),
                label: const Text('Manual Continue'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cs.surfaceContainerHighest.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: cs.outlineVariant.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline_rounded, size: 20, color: cs.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Tip: Drag the handle to reorder steps. Tap a step to edit it.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurface.withValues(alpha: 0.8),
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard(MacroStep step, int index) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final isValid = step.isValid;
    final canEdit = step.type != MacroStepType.manualContinue;

    Color containerColor;
    Color iconColor;
    IconData icon;

    switch (step.type) {
      case MacroStepType.send:
        containerColor = cs.primaryContainer;
        iconColor = cs.onPrimaryContainer;
        icon = Icons.send_rounded;
        break;
      case MacroStepType.delay:
        containerColor = cs.secondaryContainer;
        iconColor = cs.onSecondaryContainer;
        icon = Icons.timer_rounded;
        break;
      case MacroStepType.manualContinue:
        containerColor = cs.tertiaryContainer;
        iconColor = cs.onTertiaryContainer;
        icon = Icons.pause_circle_outline_rounded;
        break;
    }

    return Card(
      key: ValueKey(step.id),
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      color: isValid ? cs.surfaceContainerHighest.withValues(alpha: 0.5) : cs.errorContainer.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isValid ? cs.outlineVariant.withValues(alpha: 0.5) : cs.error.withValues(alpha: 0.5),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: canEdit ? () => _editStep(index) : null,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ReorderableDragStartListener(
                index: index,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.drag_handle_rounded,
                    size: 20,
                    color: cs.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: containerColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 20, color: iconColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _stepTitle(step),
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    if (_stepSubtitle(step) != null) ...[
                      const SizedBox(height: 4),
                      _stepSubtitle(step)!,
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                tooltip: 'Delete',
                onPressed: () => _deleteStep(index),
                icon: Icon(Icons.delete_outline_rounded, color: cs.error),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _stepTitle(MacroStep step) {
    switch (step.type) {
      case MacroStepType.send:
        return _stepSendLabel(step);
      case MacroStepType.delay:
        return '${step.delayMs ?? 0}ms';
      case MacroStepType.manualContinue:
        return 'Manual Continue';
    }
  }

  Widget? _stepSubtitle(MacroStep step) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    if (!step.isValid) {
      return Text(
        'Invalid step — tap to fix',
        style: theme.textTheme.bodySmall?.copyWith(
          color: cs.error,
          fontWeight: FontWeight.w700,
        ),
      );
    }

    if (step.type == MacroStepType.send) {
      return Text(
        'Send IR command',
        style: theme.textTheme.bodySmall?.copyWith(
          color: cs.onSurface.withValues(alpha: 0.7),
        ),
      );
    }

    if (step.type == MacroStepType.delay) {
      return Text(
        _formatDelay(step.delayMs ?? 0),
        style: theme.textTheme.bodySmall?.copyWith(
          color: cs.onSurface.withValues(alpha: 0.7),
        ),
      );
    }

    if (step.type == MacroStepType.manualContinue) {
      return Text(
        'Wait for user confirmation',
        style: theme.textTheme.bodySmall?.copyWith(
          color: cs.onSurface.withValues(alpha: 0.7),
        ),
      );
    }

    return null;
  }
}
