import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/utils/remote_grid_layout.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_draft.dart';

class RemoteLayoutPicker extends StatelessWidget {
  const RemoteLayoutPicker({
    super.key,
    required this.style,
    required this.grid,
    required this.onChanged,
  });

  final RemoteLayoutStyle style;
  final RemoteGridLayout? grid;
  final void Function(RemoteLayoutStyle, RemoteGridLayout?) onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final custom = grid ?? RemoteGridLayout(columns: 3);
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.layoutStyle, style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: _preset(
                    context, RemoteLayoutStyle.compact, l10n.layoutCompact, 4)),
            const SizedBox(width: 10),
            Expanded(
                child: _preset(
                    context, RemoteLayoutStyle.wide, l10n.layoutWide, 2)),
          ],
        ),
        const SizedBox(height: 10),
        Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          color: style == RemoteLayoutStyle.custom
              ? theme.colorScheme.primaryContainer
              : theme.colorScheme.surfaceContainerHighest,
          child: ListTile(
            leading: const Icon(Icons.dashboard_customize_outlined),
            title: Text(l10n.layoutCustom),
            subtitle: Text(l10n.layoutCustomDescription),
            trailing: style == RemoteLayoutStyle.custom
                ? const Icon(Icons.check_circle)
                : const Icon(Icons.chevron_right),
            selected: style == RemoteLayoutStyle.custom,
            onTap: () => onChanged(RemoteLayoutStyle.custom, custom),
          ),
        ),
        if (style == RemoteLayoutStyle.custom) ...[
          const SizedBox(height: 20),
          Text(l10n.layoutColumns, style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              for (var columns = 1; columns <= 6; columns++)
                ChoiceChip(
                  label: Text('$columns'),
                  selected: custom.columns == columns,
                  onSelected: (_) =>
                      onChanged(style, custom.copyWith(columns: columns)),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(l10n.layoutShape, style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          RadioGroup<RemoteButtonShape>(
            groupValue: custom.shape,
            onChanged: (shape) {
              if (shape != null) {
                onChanged(style, custom.copyWith(shape: shape));
              }
            },
            child: Column(children: [
              for (final shape in RemoteButtonShape.values)
                RadioListTile<RemoteButtonShape>(
                  value: shape,
                  contentPadding: EdgeInsets.zero,
                  secondary: Icon(
                      switch (shape) {
                        RemoteButtonShape.circle => Icons.circle_outlined,
                        RemoteButtonShape.roundedSquare =>
                          Icons.crop_square_rounded,
                        RemoteButtonShape.rectangle =>
                          Icons.crop_landscape_rounded,
                      },
                      size: 18),
                  title: Text(switch (shape) {
                    RemoteButtonShape.circle => l10n.layoutCircle,
                    RemoteButtonShape.roundedSquare => l10n.layoutRoundedSquare,
                    RemoteButtonShape.rectangle => l10n.layoutRectangle,
                  }),
                  selected: custom.shape == shape,
                ),
            ]),
          ),
          const SizedBox(height: 16),
          _preview(context, custom.columns, custom.shape),
          const SizedBox(height: 10),
          Text(l10n.layoutReflowHint, style: theme.textTheme.bodySmall),
        ],
      ],
    );
  }

  Widget _preset(BuildContext context, RemoteLayoutStyle value, String label,
      int columns) {
    final cs = Theme.of(context).colorScheme;
    final selected = style == value;
    return Semantics(
      selected: selected,
      child: Material(
        color: selected ? cs.primaryContainer : cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => onChanged(value, grid),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(label, style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 10),
                _preview(
                    context,
                    columns,
                    value == RemoteLayoutStyle.wide
                        ? RemoteButtonShape.rectangle
                        : RemoteButtonShape.roundedSquare),
                const SizedBox(height: 6),
                Icon(selected ? Icons.check_circle : Icons.circle_outlined,
                    color: cs.primary, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _preview(BuildContext context, int columns, RemoteButtonShape shape) {
    final cs = Theme.of(context).colorScheme;
    return ExcludeSemantics(
      child: Container(
        height: 88,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          for (var row = 0; row < 2; row++)
            Expanded(
                child: Row(children: [
              for (var column = 0; column < columns; column++)
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Center(
                      child: AspectRatio(
                    aspectRatio: shape == RemoteButtonShape.rectangle ? 2 : 1,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                      color: cs.primaryContainer,
                      borderRadius: BorderRadius.circular(
                          shape == RemoteButtonShape.circle ? 100 : 6),
                    )),
                  )),
                )),
            ])),
        ]),
      ),
    );
  }
}
