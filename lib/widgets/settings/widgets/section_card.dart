import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? titleSuffix;
  final Widget child;

  const SectionCard({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.titleSuffix,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        if (titleSuffix != null) ...[
                          const SizedBox(width: 8),
                          titleSuffix!,
                        ],
                      ],
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 0,
          color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.3)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: child,
          ),
        ),
      ],
    );
  }
}
