import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/l10n.dart';

class IrWaveformPanel extends StatelessWidget {
  final List<int> pattern;
  final int frequencyHz;
  final double? playheadProgress;
  final bool compact;
  final String? title;

  const IrWaveformPanel({
    super.key,
    required this.pattern,
    required this.frequencyHz,
    this.playheadProgress,
    this.compact = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;
    final totalUs = pattern.fold<int>(0, (sum, value) => sum + value);
    final pulseCount = (pattern.length + 1) ~/ 2;
    final longestGap = _longestGapUs(pattern);
    final totalMs = totalUs / 1000.0;
    final graphWidth = waveformWidth(totalUs);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(compact ? 12 : 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer.withValues(alpha: 0.44),
            colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(compact ? 16 : 18),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.show_chart_rounded, color: colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title ?? l10n.irWaveformTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                '${(frequencyHz / 1000).toStringAsFixed(1)} kHz',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _WaveformChip(
                icon: Icons.timelapse_rounded,
                label: '${totalMs.toStringAsFixed(totalMs >= 10 ? 1 : 2)} ms',
              ),
              _WaveformChip(
                icon: Icons.bolt_rounded,
                label: l10n.irWaveformPulseCount(pulseCount),
              ),
              if (!compact)
                _WaveformChip(
                  icon: Icons.horizontal_rule_rounded,
                  label: l10n.irWaveformGapLabel(formatMicros(longestGap)),
                ),
              _WaveformChip(
                icon: Icons.format_list_numbered_rounded,
                label: l10n.irWaveformDurationCount(pattern.length),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: compact ? 150 : 178,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: colorScheme.surface.withValues(alpha: 0.76),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.65),
              ),
            ),
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomPaint(
                  size: Size(graphWidth, compact ? 150 : 178),
                  painter: IrWaveformPainter(
                    pattern: pattern,
                    colorScheme: colorScheme,
                    onLabel: l10n.irWaveformOnLabel,
                    offLabel: l10n.irWaveformOffLabel,
                    playheadProgress: playheadProgress,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.irWaveformActiveHint,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  static int _longestGapUs(List<int> pattern) {
    var longest = 0;
    for (var i = 1; i < pattern.length; i += 2) {
      longest = math.max(longest, pattern[i]);
    }
    return longest;
  }

  static double waveformWidth(int totalUs) {
    if (totalUs <= 0) return 720;
    return (totalUs / 75.0).clamp(720.0, 7200.0);
  }

  static String formatMicros(int micros) {
    if (micros >= 1000) {
      return '${(micros / 1000.0).toStringAsFixed(1)} ms';
    }
    return '$microsµs';
  }
}

class _WaveformChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _WaveformChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.7),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: theme.colorScheme.primary),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class IrWaveformPainter extends CustomPainter {
  final List<int> pattern;
  final ColorScheme colorScheme;
  final String onLabel;
  final String offLabel;
  final double? playheadProgress;

  const IrWaveformPainter({
    required this.pattern,
    required this.colorScheme,
    required this.onLabel,
    required this.offLabel,
    this.playheadProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final totalUs = pattern.fold<int>(0, (sum, value) => sum + value);
    if (pattern.isEmpty || totalUs <= 0) {
      _drawEmpty(canvas, size);
      return;
    }

    final padding = const EdgeInsets.fromLTRB(18, 18, 18, 30);
    final graph = Rect.fromLTWH(
      padding.left,
      padding.top,
      size.width - padding.horizontal,
      size.height - padding.vertical,
    );

    final gridPaint = Paint()
      ..color = colorScheme.outlineVariant.withValues(alpha: 0.5)
      ..strokeWidth = 1;
    final labelPaint = TextPainter(
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );

    for (var i = 0; i <= 6; i++) {
      final x = graph.left + graph.width * (i / 6);
      canvas.drawLine(Offset(x, graph.top), Offset(x, graph.bottom), gridPaint);
      if (i == 0 || i == 6 || i == 3) {
        labelPaint.text = TextSpan(
          text: '${((totalUs * i / 6) / 1000).toStringAsFixed(1)}ms',
          style: TextStyle(
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.78),
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        );
        labelPaint.layout();
        labelPaint.paint(
          canvas,
          Offset(
            (x - labelPaint.width / 2).clamp(0, size.width - labelPaint.width),
            graph.bottom + 8,
          ),
        );
      }
    }

    canvas.drawLine(
      Offset(graph.left, graph.top),
      Offset(graph.right, graph.top),
      gridPaint,
    );
    canvas.drawLine(
      Offset(graph.left, graph.bottom),
      Offset(graph.right, graph.bottom),
      gridPaint,
    );

    final onPaint = Paint()
      ..color = colorScheme.primary
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;
    final offPaint = Paint()
      ..color = colorScheme.onSurfaceVariant.withValues(alpha: 0.72)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;
    final fillPaint = Paint()
      ..color = colorScheme.primary.withValues(alpha: 0.16)
      ..style = PaintingStyle.fill;
    final transitionPaint = Paint()
      ..color = colorScheme.outline.withValues(alpha: 0.36)
      ..strokeWidth = 1;

    final highY = graph.top + graph.height * 0.22;
    final lowY = graph.bottom - graph.height * 0.16;
    var elapsed = 0;

    for (var i = 0; i < pattern.length; i++) {
      final duration = pattern[i].clamp(0, 1 << 30);
      final nextElapsed = elapsed + duration;
      final x1 = graph.left + graph.width * (elapsed / totalUs);
      final x2 = graph.left + graph.width * (nextElapsed / totalUs);
      final isOn = i.isEven;
      final y = isOn ? highY : lowY;
      if (x2 > x1) {
        if (isOn) {
          canvas.drawRect(
            Rect.fromLTRB(x1, highY, x2, lowY).deflate(1),
            fillPaint,
          );
        }
        canvas.drawLine(
          Offset(x1, y),
          Offset(x2, y),
          isOn ? onPaint : offPaint,
        );
      }
      if (i < pattern.length - 1) {
        canvas.drawLine(
          Offset(x2, highY),
          Offset(x2, lowY),
          transitionPaint,
        );
      }
      elapsed = nextElapsed;
    }

    final progress = playheadProgress;
    if (progress != null) {
      final clamped = progress.clamp(0.0, 1.0);
      final x = graph.left + graph.width * clamped;
      final playheadPaint = Paint()
        ..color = colorScheme.error
        ..strokeWidth = 2.6
        ..strokeCap = StrokeCap.round;
      final haloPaint = Paint()
        ..color = colorScheme.error.withValues(alpha: 0.18)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(x, highY), 8, haloPaint);
      canvas.drawLine(
          Offset(x, graph.top - 2), Offset(x, graph.bottom + 2), playheadPaint);
    }

    final legendText = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        children: [
          TextSpan(
            text: onLabel,
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
          TextSpan(
            text: '  /  $offLabel',
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    )..layout();
    legendText.paint(canvas, Offset(graph.left, 4));
  }

  void _drawEmpty(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorScheme.outlineVariant
      ..strokeWidth = 1.5;
    final y = size.height / 2;
    canvas.drawLine(Offset(20, y), Offset(size.width - 20, y), paint);
  }

  @override
  bool shouldRepaint(covariant IrWaveformPainter oldDelegate) {
    return oldDelegate.pattern != pattern ||
        oldDelegate.colorScheme != colorScheme ||
        oldDelegate.onLabel != onLabel ||
        oldDelegate.offLabel != offLabel ||
        oldDelegate.playheadProgress != playheadProgress;
  }
}
