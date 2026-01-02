import 'dart:io';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/create_button.dart';

enum _LayoutStyle { compact, wide }

class CreateRemote extends StatefulWidget {
  final Remote? remote;
  const CreateRemote({super.key, this.remote});

  @override
  State<CreateRemote> createState() => _CreateRemoteState();
}

class _CreateRemoteState extends State<CreateRemote> {
  final TextEditingController textEditingController = TextEditingController();
  late Remote remote;
  bool useNewStyle = false;

  @override
  void initState() {
    remote = widget.remote ?? Remote(buttons: [], name: "Untitled Remote");
    textEditingController.value = TextEditingValue(text: remote.name);
    useNewStyle = remote.useNewStyle;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  String get _screenTitle =>
      widget.remote == null ? 'Create remote' : 'Edit remote';

  _LayoutStyle get _layoutStyle =>
      useNewStyle ? _LayoutStyle.wide : _LayoutStyle.compact;

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<bool> _confirmDeleteButton(BuildContext ctx, IRButton b) async {
    return await showDialog<bool>(
      context: ctx,
      builder: (dctx) => AlertDialog(
        icon: const Icon(Icons.warning_amber_rounded),
        title: const Text('Remove button?'),
        content: Text(
          b.isImage ? 'This image button will be removed.' : '"${b.image}" will be removed.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(dctx).pop(false), child: const Text('Cancel')),
          FilledButton.tonalIcon(
            onPressed: () => Navigator.of(dctx).pop(true),
            icon: const Icon(Icons.delete_outline),
            label: const Text('Remove'),
          ),
        ],
      ),
    ).then((v) => v ?? false);
  }

  Future<void> _editButtonAt(int index) async {
    final IRButton current = remote.buttons[index];
    try {
      final IRButton? updated = await Navigator.push<IRButton?>(
        context,
        MaterialPageRoute(
          builder: (context) => CreateButton(button: current),
        ),
      );
      if (updated == null) return;
      setState(() {
        remote.buttons[index] = updated;
      });
    } catch (_) {}
  }

  Future<void> _addButton() async {
    try {
      final IRButton? button = await Navigator.push<IRButton?>(
        context,
        MaterialPageRoute(builder: (context) => const CreateButton()),
      );
      if (button == null) return;
      setState(() {
        remote.buttons.add(button);
      });
    } catch (_) {}
  }

  Future<void> _openButtonActions(int index) async {
    final b = remote.buttons[index];
    final theme = Theme.of(context);
    await showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit_outlined),
                title: const Text('Edit'),
                subtitle: const Text('Change label, signal, and advanced settings'),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _editButtonAt(index);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete_outline, color: theme.colorScheme.error),
                title: Text('Remove', style: TextStyle(color: theme.colorScheme.error)),
                subtitle: const Text('This can\'t be undone'),
                onTap: () async {
                  Navigator.of(ctx).pop();
                  final confirmed = await _confirmDeleteButton(context, b);
                  if (!confirmed) return;
                  if (!mounted) return;
                  setState(() {
                    remote.buttons.removeAt(index);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _pill(BuildContext context, String text, {IconData? icon}) {
    return Chip(
      visualDensity: VisualDensity.compact,
      avatar: icon == null ? null : Icon(icon, size: 16),
      label: Text(text),
    );
  }

  List<Widget> _buildButtonMetaChips(IRButton b) {
    final hasRaw = b.rawData != null && b.rawData!.trim().isNotEmpty;
    final isNecCustom = hasRaw && isNecConfigString(b.rawData);
    final isPlainNec =
        b.code != null && !hasRaw && (b.protocol == null || b.protocol!.trim().isEmpty);
    final chips = <Widget>[];

    if (b.protocol != null && b.protocol!.trim().isNotEmpty) {
      final id = b.protocol!.trim();
      chips.add(_pill(context, IrProtocolRegistry.displayName(id), icon: Icons.tune));
      if (!IrProtocolRegistry.isImplemented(id)) {
        chips.add(_pill(context, 'Not implemented', icon: Icons.hourglass_empty));
      }
      if (b.frequency != null && b.frequency! > 0) {
        chips.add(_pill(context, '${(b.frequency! / 1000).round()} kHz', icon: Icons.waves));
      }
      return chips;
    }

    if (isNecCustom) {
      chips.add(_pill(context, 'NEC', icon: Icons.numbers));
      chips.add(_pill(context, (b.necBitOrder ?? 'msb').toUpperCase(), icon: Icons.swap_horiz));
      if (b.frequency != null && b.frequency! > 0) {
        chips.add(_pill(context, '${(b.frequency! / 1000).round()} kHz', icon: Icons.waves));
      }
    } else if (isPlainNec) {
      chips.add(_pill(context, 'NEC', icon: Icons.numbers));
      chips.add(_pill(context, 'MSB', icon: Icons.swap_horiz));
      chips.add(_pill(context, '${(kDefaultNecFrequencyHz / 1000).round()} kHz', icon: Icons.waves));
    } else if (hasRaw) {
      chips.add(_pill(context, 'RAW', icon: Icons.graphic_eq));
      if (b.frequency != null && b.frequency! > 0) {
        chips.add(_pill(context, '${(b.frequency! / 1000).round()} kHz', icon: Icons.waves));
      }
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final segments = <ButtonSegment<_LayoutStyle>>[
      const ButtonSegment(
        value: _LayoutStyle.compact,
        label: Text('Compact'),
        icon: Icon(Icons.grid_view_outlined),
      ),
      const ButtonSegment(
        value: _LayoutStyle.wide,
        label: Text('Wide'),
        icon: Icon(Icons.view_agenda_outlined),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                label: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (remote.name.trim().isEmpty) {
                    _showSnack("Remote name can't be empty.");
                    return;
                  }
                  remote.useNewStyle = useNewStyle;
                  Navigator.pop(context, remote);
                },
                icon: const Icon(Icons.save),
                label: const Text('Save remote'),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Column(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        controller: textEditingController,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) => remote.name = value,
                        decoration: InputDecoration(
                          labelText: 'Remote name',
                          hintText: 'e.g., TV, Air Conditioner, LED Strip',
                          helperText: 'This name appears in your Remotes list.',
                          suffixIcon: textEditingController.text.trim().isEmpty
                              ? null
                              : IconButton(
                                  tooltip: 'Clear',
                                  onPressed: () {
                                    setState(() {
                                      textEditingController.clear();
                                      remote.name = '';
                                    });
                                  },
                                  icon: const Icon(Icons.clear),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Layout style',
                            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 6),
                          SegmentedButton<_LayoutStyle>(
                            segments: segments,
                            selected: {_layoutStyle},
                            onSelectionChanged: (s) {
                              final next = s.first;
                              setState(() {
                                useNewStyle = (next == _LayoutStyle.wide);
                              });
                            },
                          ),
                          const SizedBox(height: 8),
                          Text(
                            useNewStyle
                                ? 'Wide: 2-column buttons with extra details (recommended).'
                                : 'Compact: classic 4× grid (icons/text only).',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Buttons (${remote.buttons.length})',
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                      FilledButton.tonalIcon(
                        onPressed: _addButton,
                        icon: const Icon(Icons.add),
                        label: const Text('Add button'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: remote.buttons.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.grid_view_outlined,
                                size: 48, color: theme.colorScheme.primary),
                            const SizedBox(height: 12),
                            Text(
                              'No buttons yet',
                              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Add your first button, then long-press it for edit/remove options.',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                              ),
                            ),
                            const SizedBox(height: 16),
                            FilledButton.icon(
                              onPressed: _addButton,
                              icon: const Icon(Icons.add),
                              label: const Text('Add button'),
                            ),
                          ],
                        ),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      itemCount: remote.buttons.length + 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: useNewStyle ? 2 : 4,
                        childAspectRatio: useNewStyle ? 2.2 : 1.0,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        if (index < remote.buttons.length) {
                          final b = remote.buttons[index];
                          return _buildButtonTile(b, index);
                        }
                        return _buildAddTile();
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonTile(IRButton b, int index) {
    final theme = Theme.of(context);
    final meta = _buildButtonMetaChips(b);
    final Widget labelWidget;
    if (b.isImage) {
      labelWidget = b.image.startsWith("assets/")
          ? Image.asset(b.image, fit: BoxFit.contain)
          : Image.file(File(b.image), fit: BoxFit.contain);
    } else {
      labelWidget = Center(
        child: Text(
          b.image,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      );
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.primary.withValues(alpha: 0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => _editButtonAt(index),
        onLongPress: () => _openButtonActions(index),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: useNewStyle
              ? Row(
                  children: [
                    SizedBox(width: 48, height: 48, child: Center(child: labelWidget)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            b.isImage ? 'Image button' : b.image,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 6),
                          if (meta.isNotEmpty) Wrap(spacing: 6, runSpacing: 4, children: meta),
                          if (meta.isEmpty)
                            Text(
                              'No signal info',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.chevron_right),
                  ],
                )
              : Stack(
                  children: [
                    Positioned.fill(child: labelWidget),
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(6),
                          child: Icon(Icons.edit_outlined, size: 16),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildAddTile() {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: _addButton,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_circle_outline,
                    size: 34, color: theme.colorScheme.primary),
                const SizedBox(height: 8),
                Text(
                  'Add',
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
