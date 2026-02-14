import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/state/orientation_pref.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/button_label.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';

class MacroRunScreen extends StatefulWidget {
  final TimedMacro macro;
  final Remote remote;

  const MacroRunScreen({
    super.key,
    required this.macro,
    required this.remote,
  });

  @override
  State<MacroRunScreen> createState() => _MacroRunScreenState();
}

class _MacroRunScreenState extends State<MacroRunScreen> with SingleTickerProviderStateMixin {
  bool _running = false;
  bool _waitingForManual = false;
  bool _executing = false;
  bool _completed = false;
  int _currentStep = 0;
  int _remainingMs = 0;
  DateTime? _startTime;
  String? _lastError;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _running = false;
    _waitingForManual = false;
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    if (_executing) return;
    if (widget.macro.steps.isEmpty) return;

    setState(() {
      _running = true;
      _waitingForManual = false;
      _completed = false;
      _currentStep = 0;
      _remainingMs = 0;
      _startTime = DateTime.now();
      _lastError = null;
    });

    _pulseController.repeat(reverse: true);
    await Haptics.mediumImpact();

    await _executeSteps();
  }

  void _cancel() {
    setState(() {
      _running = false;
      _waitingForManual = false;
      _remainingMs = 0;
    });
    _pulseController.stop();
    _pulseController.reset();
    Haptics.selectionClick();
  }

  Future<void> _continueManual() async {
    if (!_waitingForManual) return;
    if (_executing) return;

    setState(() {
      _waitingForManual = false;
      if (_currentStep < widget.macro.steps.length) {
        _currentStep++;
      }
    });

    Haptics.selectionClick();

    if (_running) {
      await _executeSteps();
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

  IRButton? _resolveButton(MacroStep step) {
    final byId = _findButtonById(step.buttonId);
    if (byId != null) return byId;

    final byRef = _findButtonByRef(step.buttonRef) ?? _findButtonByRef(step.buttonId);
    return byRef;
  }

  Future<void> _executeSteps() async {
    if (_executing) return;
    _executing = true;

    try {
      final steps = widget.macro.steps;
      while (mounted && _running && _currentStep < steps.length) {
        final step = steps[_currentStep];

        if (!step.isValid) {
          setState(() {
            _running = false;
            _waitingForManual = false;
            _remainingMs = 0;
            _lastError = 'Invalid step encountered';
          });
          _pulseController.stop();
          _pulseController.reset();
          return;
        }

        if (step.type == MacroStepType.send) {
          final button = _resolveButton(step);
          if (button != null) {
            try {
              await sendIR(button);
              Haptics.lightImpact();
              if (!mounted) return;
              setState(() {
                _lastError = null;
              });
            } catch (_) {
              if (!mounted) return;
              setState(() {
                _lastError =
                    'Failed to send: ${displayButtonLabel(button, fallback: 'Unnamed', iconFallback: 'Icon')}';
              });
            }
          } else {
            final fallback = (step.buttonRef ?? step.buttonId ?? '').trim();
            if (!mounted) return;
            setState(() {
              _lastError = fallback.isEmpty
                  ? 'Button not found'
                  : 'Button not found: ${displayButtonRefLabel(fallback, fallback: 'Unknown Button')}';
            });
          }

          if (!mounted) return;
          setState(() {
            _currentStep++;
          });
          continue;
        }

        if (step.type == MacroStepType.delay) {
          final ms = step.delayMs ?? 0;
          if (!mounted) return;
          setState(() {
            _remainingMs = ms;
          });

          await _delayWithCountdown(ms);

          if (!mounted) return;
          if (!_running) return;

          setState(() {
            _remainingMs = 0;
            _currentStep++;
          });
          continue;
        }

        if (step.type == MacroStepType.manualContinue) {
          if (!mounted) return;
          setState(() {
            _waitingForManual = true;
          });
          _pulseController.stop();
          _pulseController.reset();
          return;
        }
      }

      if (!mounted) return;
      if (_running) {
        setState(() {
          _running = false;
          _waitingForManual = false;
          _remainingMs = 0;
          _completed = true;
        });
        _pulseController.stop();
        _pulseController.reset();
        Haptics.heavyImpact();
      }
    } finally {
      _executing = false;
    }
  }

  Future<void> _delayWithCountdown(int ms) async {
    if (ms <= 0) {
      if (mounted) {
        setState(() => _remainingMs = 0);
      }
      return;
    }

    final sw = Stopwatch()..start();
    const tickMs = 100;

    while (mounted && _running) {
      final remaining = ms - sw.elapsedMilliseconds;
      if (remaining <= 0) {
        setState(() => _remainingMs = 0);
        return;
      }

      setState(() => _remainingMs = remaining);

      final sleep = remaining < tickMs ? remaining : tickMs;
      await Future.delayed(Duration(milliseconds: sleep));
    }
  }

  String _formatDuration(Duration d) {
    final int s = d.inSeconds;
    if (s < 60) return '${s}s';
    final int m = s ~/ 60;
    final int rs = s % 60;
    if (m < 60) return '${m}m ${rs}s';
    final int h = m ~/ 60;
    final int rm = m % 60;
    return '${h}h ${rm}m';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final total = widget.macro.steps.length;
    final progress = total == 0 ? 0.0 : (_currentStep / total).clamp(0.0, 1.0);
    final elapsed = _startTime == null ? null : DateTime.now().difference(_startTime!);

    final canStart = !_running && total > 0 && !_completed;
    final canRestart = !_running && total > 0 && _completed;
    final canCancel = _running;
    final canContinue = _waitingForManual;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.macro.name),
        actions: [
          IconButton(
            tooltip: RemoteOrientationController.instance.flipped ? 'Orientation: flipped (tap to normal)' : 'Orientation: normal (tap to flip)',
            onPressed: () async {
              final next = !RemoteOrientationController.instance.flipped;
              await RemoteOrientationController.instance.setFlipped(next);
              setState(() {});
            },
            icon: const Icon(Icons.screen_rotation_rounded),
          ),
          if (canCancel && !canContinue)
            IconButton(
              tooltip: 'Cancel',
              onPressed: _cancel,
              icon: const Icon(Icons.stop_circle_rounded),
            ),
        ],
      ),
      body: SafeArea(
        child: Transform.rotate(
          angle: RemoteOrientationController.instance.flipped ? 3.1415926535897932 : 0.0,
          child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildStatusCard(theme, cs, total, progress, elapsed),
                    const SizedBox(height: 16),
                    if (_running && _remainingMs > 0) _buildDelayCard(theme, cs),
                    if (_waitingForManual) _buildManualContinueCard(theme, cs),
                    if (_lastError != null) _buildErrorCard(theme, cs),
                    if (_completed) _buildCompletionCard(theme, cs, elapsed),
                    const SizedBox(height: 16),
                    _buildStepsList(theme, cs),
                  ],
                ),
              ),
            ),
            _buildControls(theme, cs, canStart, canRestart, canCancel, canContinue),
          ],
        ),
       ),
     ),
   );
  }

  Widget _buildStatusCard(
    ThemeData theme,
    ColorScheme cs,
    int total,
    double progress,
    Duration? elapsed,
  ) {
    final stepLabel = total == 0 ? 'No steps' : 'Step ${(_currentStep + 1).clamp(1, total)} / $total';

    IconData statusIcon;
    Color statusColor;
    String statusLabel;

    if (_completed) {
      statusIcon = Icons.check_circle_rounded;
      statusColor = Colors.green;
      statusLabel = 'Completed';
    } else if (_waitingForManual) {
      statusIcon = Icons.pause_circle_rounded;
      statusColor = cs.tertiary;
      statusLabel = 'Paused';
    } else if (_running) {
      statusIcon = Icons.play_circle_rounded;
      statusColor = cs.primary;
      statusLabel = 'Running';
    } else {
      statusIcon = Icons.radio_button_unchecked_rounded;
      statusColor = cs.onSurface.withValues(alpha: 0.5);
      statusLabel = 'Ready';
    }

    return Card(
      elevation: 0,
      color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                ScaleTransition(
                  scale: _running && !_waitingForManual ? _pulseAnimation : const AlwaysStoppedAnimation(1.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(statusIcon, size: 32, color: statusColor),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        statusLabel,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        stepLabel,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: cs.onSurface.withValues(alpha: 0.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                if (elapsed != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: cs.primaryContainer.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 16,
                          color: cs.onPrimaryContainer,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _formatDuration(elapsed),
                          style: TextStyle(
                            color: cs.onPrimaryContainer,
                            fontWeight: FontWeight.w800,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: cs.surfaceContainerHighest,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(progress * 100).toStringAsFixed(0)}%',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '$_currentStep / $total steps',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDelayCard(ThemeData theme, ColorScheme cs) {
    final sec = (_remainingMs / 1000).toStringAsFixed(1);
    return Card(
      elevation: 0,
      color: cs.secondaryContainer.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cs.secondary.withValues(alpha: 0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cs.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.timer_rounded,
                color: cs.onSecondaryContainer,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Waiting',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: cs.onSecondaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${sec}s remaining',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: cs.onSecondaryContainer.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${_remainingMs}ms',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: cs.onSecondaryContainer,
                fontFeatures: [const FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManualContinueCard(ThemeData theme, ColorScheme cs) {
    return Card(
      elevation: 0,
      color: cs.tertiaryContainer.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cs.tertiary.withValues(alpha: 0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cs.tertiaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.pause_circle_outline_rounded,
                color: cs.onTertiaryContainer,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manual Continue',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: cs.onTertiaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap Continue when ready for the next step',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onTertiaryContainer.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorCard(ThemeData theme, ColorScheme cs) {
    return Card(
      elevation: 0,
      color: cs.errorContainer.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cs.error.withValues(alpha: 0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.error_outline_rounded, color: cs.error),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Error',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: cs.onErrorContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _lastError!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onErrorContainer.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletionCard(ThemeData theme, ColorScheme cs, Duration? elapsed) {
    return Card(
      elevation: 0,
      color: Colors.green.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.green.withValues(alpha: 0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.check_circle_rounded, color: Colors.green),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Macro Completed',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.green.shade800,
                    ),
                  ),
                  if (elapsed != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Finished in ${_formatDuration(elapsed)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepsList(ThemeData theme, ColorScheme cs) {
    if (widget.macro.steps.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sequence',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.macro.steps.length,
          itemBuilder: (context, i) {
            final step = widget.macro.steps[i];
            final isActive = i == _currentStep && _running;
            final isDone = i < _currentStep;
            return _buildStepItem(theme, cs, step, i, isActive, isDone);
          },
        ),
      ],
    );
  }

  Widget _buildStepItem(
    ThemeData theme,
    ColorScheme cs,
    MacroStep step,
    int index,
    bool isActive,
    bool isDone,
  ) {
    IconData icon;
    Color iconColor;

    switch (step.type) {
      case MacroStepType.send:
        icon = Icons.send_rounded;
        iconColor = cs.primary;
        break;
      case MacroStepType.delay:
        icon = Icons.timer_rounded;
        iconColor = cs.secondary;
        break;
      case MacroStepType.manualContinue:
        icon = Icons.pause_circle_outline_rounded;
        iconColor = cs.tertiary;
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isDone
                  ? Colors.green.withValues(alpha: 0.2)
                  : isActive
                      ? iconColor.withValues(alpha: 0.2)
                      : cs.surfaceContainerHighest.withValues(alpha: 0.5),
              shape: BoxShape.circle,
              border: Border.all(
                color: isDone
                    ? Colors.green
                    : isActive
                        ? iconColor
                        : cs.outlineVariant.withValues(alpha: 0.5),
                width: 2,
              ),
            ),
            child: Center(
              child: isDone
                  ? const Icon(Icons.check_rounded, size: 16, color: Colors.green)
                  : Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: isActive ? iconColor : cs.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isActive ? iconColor.withValues(alpha: 0.1) : cs.surfaceContainerHighest.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isActive ? iconColor.withValues(alpha: 0.5) : cs.outlineVariant.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(icon, size: 18, color: iconColor),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _stepLabel(step),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: isActive ? FontWeight.w900 : FontWeight.w600,
                        color: isActive ? cs.onSurface : cs.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _stepLabel(MacroStep step) {
    switch (step.type) {
      case MacroStepType.send:
        final button = _resolveButton(step);
        if (button != null) {
          return displayButtonLabel(
            button,
            fallback: 'Unnamed',
            iconFallback: 'Icon',
          );
        }
        final fallback = (step.buttonRef ?? step.buttonId ?? '').trim();
        return displayButtonRefLabel(fallback, fallback: 'Unknown Button');
      case MacroStepType.delay:
        return 'Wait ${step.delayMs ?? 0}ms';
      case MacroStepType.manualContinue:
        return 'Manual Continue';
    }
  }

  Widget _buildControls(
    ThemeData theme,
    ColorScheme cs,
    bool canStart,
    bool canRestart,
    bool canCancel,
    bool canContinue,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border(
          top: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.5)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (canStart || canRestart)
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _start,
                  icon: Icon(canRestart ? Icons.replay_rounded : Icons.play_arrow_rounded),
                  label: Text(canRestart ? 'Run Again' : 'Start Macro'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            if (canContinue) ...[
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _continueManual,
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Continue'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: canCancel ? _cancel : null,
                  icon: const Icon(Icons.stop_rounded),
                  label: const Text('Cancel'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
            if (canCancel && !canContinue)
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonalIcon(
                  onPressed: _cancel,
                  icon: const Icon(Icons.stop_rounded),
                  label: const Text('Cancel'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
