import 'dart:io';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/l10n/icon_picker_names.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/utils/button_color_accessibility.dart';
import 'package:irblaster_controller/utils/button_label.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_actions.dart';

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
    remote = widget.remote ?? Remote(buttons: [], name: context.l10n.untitledRemote);
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
      widget.remote == null ? context.l10n.createRemoteTitle : context.l10n.editRemoteTitle;

  _LayoutStyle get _layoutStyle =>
      useNewStyle ? _LayoutStyle.wide : _LayoutStyle.compact;

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _editButtonAt(int index) async {
    final IRButton current = remote.buttons[index];
    final IRButton? updated = await RemoteEditorActions.editButton(context, current);
    if (updated == null || !mounted) return;
    setState(() {
      remote.buttons[index] = updated;
    });
  }

  Future<void> _addButton() async {
    final IRButton? button = await RemoteEditorActions.addButton(context);
    if (button == null || !mounted) return;
    setState(() {
      remote.buttons.add(button);
    });
  }

  Future<void> _openBulkImport() async {
    final imported = await RemoteEditorActions.importFromDatabase(
      context,
      existingButtons: remote.buttons,
    );
    if (imported == null || imported.isEmpty || !mounted) return;
    setState(() {
      remote.buttons.addAll(imported);
    });
    _showSnack(context.l10n.importedButtonCount(imported.length));
  }

  Future<void> _openImportFromExistingRemotes() async {
    final imported = await RemoteEditorActions.importFromExistingRemotes(
      context,
      existingButtons: remote.buttons,
      currentRemoteId: remote.id,
    );
    if (imported == null || imported.isEmpty || !mounted) return;

    final int before = remote.buttons.length;
    setState(() {
      remote.buttons.addAll(imported);
    });
    final int added = remote.buttons.length - before;
    _showSnack(context.l10n.importedButtonsFromExistingRemotes(added));
  }

  Future<void> _openGitHubStore() async {
    await RemoteEditorActions.browseGithubStore(context);
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
                title: Text(context.l10n.edit),
                subtitle: Text(context.l10n.editButtonSettingsSubtitle),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _editButtonAt(index);
                },
              ),
              ListTile(
                leading: const Icon(Icons.copy_all_outlined),
                title: Text(context.l10n.duplicate),
                subtitle: Text(context.l10n.createButtonCopySubtitle),
                onTap: () {
                  Navigator.of(ctx).pop();
                  final dup = RemoteEditorActions.duplicateButton(b);
                  setState(() {
                    remote.buttons.insert(index + 1, dup);
                  });
                  _showSnack(context.l10n.buttonDuplicated);
                },
              ),
              ListTile(
                leading: const Icon(Icons.copy_rounded),
                title: Text(context.l10n.duplicateAndEdit),
                subtitle: Text(context.l10n.duplicateAndEditButtonSubtitle),
                onTap: () async {
                  Navigator.of(ctx).pop();
                  final dup = RemoteEditorActions.duplicateButton(b);
                  final int newIdx = index + 1;
                  setState(() {
                    remote.buttons.insert(newIdx, dup);
                  });
                  final IRButton? updated = await RemoteEditorActions.editButton(
                    context,
                    dup,
                  );
                  if (updated != null && mounted) {
                    setState(() {
                      remote.buttons[newIdx] = updated;
                    });
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.delete_outline, color: theme.colorScheme.error),
                title: Text(context.l10n.remove, style: TextStyle(color: theme.colorScheme.error)),
                subtitle: Text(context.l10n.undoAvailableInNextSnackbar),
                onTap: () async {
                  Navigator.of(ctx).pop();
                  final confirmed = await RemoteEditorActions.confirmDeleteButton(
                    context,
                    b,
                  );
                  if (!confirmed) return;
                  if (!mounted) return;
                  final removedIndex = index;
                  final removedButton = remote.buttons[index];
                  setState(() {
                    remote.buttons.removeAt(removedIndex);
                  });
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.l10n.buttonRemoved),
                      action: SnackBarAction(
                        label: context.l10n.undo,
                        onPressed: () {
                          if (!mounted) return;
                          setState(() {
                            final restoreAt = removedIndex.clamp(0, remote.buttons.length);
                            remote.buttons.insert(restoreAt, removedButton);
                          });
                        },
                      ),
                    ),
                  );
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
        chips.add(_pill(context, context.l10n.notImplemented, icon: Icons.hourglass_empty));
      }
      if (b.frequency != null && b.frequency! > 0) {
        chips.add(_pill(context, context.l10n.frequencyKhz((b.frequency! / 1000).round()), icon: Icons.waves));
      }
      return chips;
    }

    if (isNecCustom) {
      chips.add(_pill(context, context.l10n.necProtocolShort, icon: Icons.numbers));
      chips.add(_pill(context, (b.necBitOrder ?? 'msb').toUpperCase(), icon: Icons.swap_horiz));
      if (b.frequency != null && b.frequency! > 0) {
        chips.add(_pill(context, context.l10n.frequencyKhz((b.frequency! / 1000).round()), icon: Icons.waves));
      }
    } else if (isPlainNec) {
      chips.add(_pill(context, context.l10n.necProtocolShort, icon: Icons.numbers));
      chips.add(_pill(context, context.l10n.msbShort, icon: Icons.swap_horiz));
      chips.add(_pill(context, context.l10n.frequencyKhz((kDefaultNecFrequencyHz / 1000).round()), icon: Icons.waves));
    } else if (hasRaw) {
      chips.add(_pill(context, context.l10n.rawSignal, icon: Icons.graphic_eq));
      if (b.frequency != null && b.frequency! > 0) {
        chips.add(_pill(context, context.l10n.frequencyKhz((b.frequency! / 1000).round()), icon: Icons.waves));
      }
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final segments = <ButtonSegment<_LayoutStyle>>[
      ButtonSegment(
        value: _LayoutStyle.compact,
        label: Text(context.l10n.layoutCompact),
        icon: Icon(Icons.grid_view_outlined),
      ),
      ButtonSegment(
        value: _LayoutStyle.wide,
        label: Text(context.l10n.layoutWide),
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
                label: Text(context.l10n.cancel),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (remote.name.trim().isEmpty) {
                    _showSnack(context.l10n.remoteNameCannotBeEmpty);
                    return;
                  }
                  remote.useNewStyle = useNewStyle;
                  Navigator.pop(context, remote);
                },
                icon: const Icon(Icons.save),
                label: Text(context.l10n.saveRemote),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: remote.buttons.isEmpty
            // ── Empty state ────────────────────────────────────────────────
            // Wrap everything in a SingleChildScrollView so the header and the
            // "Add button" call-to-action can never be obscured by the
            // bottomNavigationBar on small screens or when the keyboard is open.
            ? SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeaderContent(context, theme, segments),
                    const SizedBox(height: 32),
                    Icon(Icons.grid_view_outlined,
                        size: 48, color: theme.colorScheme.primary),
                    const SizedBox(height: 12),
                    Text(
                      context.l10n.noButtonsYet,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.l10n.createRemoteEmptyStateDescription,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FilledButton.icon(
                      onPressed: _addButton,
                      icon: const Icon(Icons.add),
                      label: Text(context.l10n.addButton),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.tonalIcon(
                            onPressed: _openImportFromExistingRemotes,
                            icon: const Icon(Icons.merge_type_rounded),
                            label: Text(context.l10n.importFromRemotes),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: FilledButton.tonalIcon(
                            onPressed: _openBulkImport,
                            icon: const Icon(Icons.playlist_add_rounded),
                            label: Text(context.l10n.importFromDatabase),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            // ── Has buttons ────────────────────────────────────────────────
            // Fixed header + independently scrolling GridView; structure
            // unchanged from the original so no regressions here.
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                    child: _buildHeaderContent(context, theme, segments),
                  ),
                  Expanded(
                    child: GridView.builder(
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

  /// The name field, layout toggle, and import buttons — shared between the
  /// empty-state scroll view and the has-buttons fixed header.
  Widget _buildHeaderContent(
    BuildContext context,
    ThemeData theme,
    List<ButtonSegment<_LayoutStyle>> segments,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                labelText: context.l10n.remoteName,
                hintText: context.l10n.remoteNameHint,
                helperText: context.l10n.remoteNameHelper,
                suffixIcon: textEditingController.text.trim().isEmpty
                    ? null
                    : IconButton(
                        tooltip: context.l10n.clearAction,
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
                  context.l10n.layoutStyle,
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
                      ? context.l10n.layoutWideDescription
                      : context.l10n.layoutCompactDescription,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          context.l10n.buttonsTitleCount(remote.buttons.length),
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: _openImportFromExistingRemotes,
                icon: const Icon(Icons.merge_type_rounded),
                label: Text(context.l10n.importFromRemotes),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: _openBulkImport,
                icon: const Icon(Icons.playlist_add_rounded),
                label: Text(context.l10n.importFromDatabase),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        FilledButton.tonalIcon(
          onPressed: _openGitHubStore,
          icon: const Icon(Icons.storefront_rounded),
          label: const Text('Browse GitHub Store'),
        ),
      ],
    );
  }

  Widget _buildButtonTile(IRButton b, int index) {
    final theme = Theme.of(context);
    final meta = _buildButtonMetaChips(b);
    final Color cardColor = resolveButtonBackground(
      b.buttonColor == null ? null : Color(b.buttonColor!),
      theme.colorScheme.primary.withValues(alpha: 0.15),
    );
    final Color textColor = resolveButtonForeground(
      b.buttonColor == null ? null : Color(b.buttonColor!),
      theme.colorScheme.onSurface,
    );
    final String fallbackLabel = displayButtonLabel(
      b,
      fallback: context.l10n.buttonFallbackTitle,
      iconFallback: context.l10n.iconFallback,
      iconNameLocalizer: (name) => localizedIconPickerName(context.l10n, name),
    );
    final Widget labelWidget;
    final bool canRenderIcon = b.iconCodePoint != null &&
        ((b.iconFontFamily?.trim().isNotEmpty ?? false) ||
            (b.iconFontPackage?.trim().isNotEmpty ?? false));
    if (canRenderIcon) {
      final iconColor = b.iconColor != null
          ? Color(b.iconColor!)
          : textColor;
      labelWidget = Center(
        child: Icon(
          IconData(
            b.iconCodePoint!,
            fontFamily: b.iconFontFamily,
            fontPackage: b.iconFontPackage,
          ),
          size: 32,
          color: iconColor,
        ),
      );
    } else if (b.isImage) {
      labelWidget = b.image.trim().isEmpty
          ? Center(
              child: Text(
                fallbackLabel,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
            )
          : (b.image.startsWith('assets/')
              ? Image.asset(
                  b.image,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Center(
                    child: Text(
                      fallbackLabel,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                  ),
                )
              : Image.file(
                  File(b.image),
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Center(
                    child: Text(
                      fallbackLabel,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                  ),
                ));
    } else {
      labelWidget = Center(
        child: Text(
          fallbackLabel,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      );
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      color: cardColor,
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
                            b.iconCodePoint != null
                                ? context.l10n.iconButton
                                : b.isImage
                                    ? context.l10n.imageButton
                                    : b.image,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 6),
                          if (meta.isNotEmpty) Wrap(spacing: 6, runSpacing: 4, children: meta),
                          if (meta.isEmpty)
                            Text(
                              context.l10n.noSignalInfo,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: b.buttonColor != null
                                    ? textColor
                                    : theme.colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(Icons.chevron_right, color: textColor),
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
                  context.l10n.add,
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
