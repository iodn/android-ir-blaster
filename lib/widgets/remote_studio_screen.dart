import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/l10n/icon_picker_names.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/utils/button_color_accessibility.dart';
import 'package:irblaster_controller/utils/button_label.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/remote_editor/add_button_sheet.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_actions.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_draft.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_settings_sheet.dart';

class RemoteStudioScreen extends StatefulWidget {
  const RemoteStudioScreen({
    super.key,
    required this.initialDraft,
  });

  final RemoteEditorDraft initialDraft;

  @override
  State<RemoteStudioScreen> createState() => _RemoteStudioScreenState();
}

class _RemoteStudioScreenState extends State<RemoteStudioScreen> {
  late final RemoteEditorDraft _draft;

  @override
  void initState() {
    super.initState();
    _draft = widget.initialDraft.copy();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1400),
        ),
      );
  }

  Future<bool> _confirmDiscardIfNeeded() async {
    if (!_draft.isDirty) return true;
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.l10n.unsavedChangesTitle),
        content: Text(context.l10n.unsavedRemoteStudioChangesMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(context.l10n.continueEditing),
          ),
          FilledButton.tonal(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(context.l10n.discard),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  Future<void> _finish() async {
    if (_draft.name.trim().isEmpty) {
      _showSnack(context.l10n.remoteNameCannotBeEmpty);
      return;
    }
    Navigator.of(context).pop(_draft.toRemote());
  }

  Future<void> _addButton() async {
    final wasEmpty = _draft.buttonCount == 0;
    final button = await RemoteEditorActions.addButton(context);
    if (button == null || !mounted) return;
    setState(() => _draft.addButton(button));
    if (wasEmpty) {
      _showSnack(context.l10n.firstButtonAdded);
    }
  }

  Future<void> _openBulkImport() async {
    final imported = await RemoteEditorActions.importFromDatabase(
      context,
      existingButtons: _draft.buttons,
    );
    if (imported == null || imported.isEmpty || !mounted) return;
    setState(() => _draft.addButtons(imported));
    _showSnack(context.l10n.importedButtonCount(imported.length));
  }

  Future<void> _openImportFromExistingRemotes() async {
    final imported = await RemoteEditorActions.importFromExistingRemotes(
      context,
      existingButtons: _draft.buttons,
      currentRemoteId: _draft.remoteId,
    );
    if (imported == null || imported.isEmpty || !mounted) return;
    final before = _draft.buttonCount;
    setState(() => _draft.addButtons(imported));
    final added = _draft.buttonCount - before;
    _showSnack(context.l10n.importedButtonsFromExistingRemotes(added));
  }

  Future<void> _openGitHubStore() async {
    await RemoteEditorActions.browseGithubStore(context);
  }

  Future<void> _openAddSheet() async {
    final action = await showModalBottomSheet<AddButtonSheetAction>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (_) => const AddButtonSheet(),
    );
    if (!mounted || action == null) return;
    switch (action) {
      case AddButtonSheetAction.addButton:
        await _addButton();
        break;
      case AddButtonSheetAction.importFromRemotes:
        await _openImportFromExistingRemotes();
        break;
      case AddButtonSheetAction.importFromDatabase:
        await _openBulkImport();
        break;
      case AddButtonSheetAction.browseGithubStore:
        await _openGitHubStore();
        break;
    }
  }

  Future<void> _editButtonAt(int index) async {
    final current = _draft.buttons[index];
    final updated = await RemoteEditorActions.editButton(context, current);
    if (updated == null || !mounted) return;
    setState(() => _draft.replaceButtonAt(index, updated));
  }

  Future<void> _openButtonActions(int index) async {
    final button = _draft.buttons[index];
    final theme = Theme.of(context);
    await showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: Text(context.l10n.edit),
              subtitle: Text(context.l10n.editButtonSettingsSubtitle),
              onTap: () {
                Navigator.of(sheetContext).pop();
                _editButtonAt(index);
              },
            ),
              ListTile(
                leading: const Icon(Icons.copy_all_outlined),
                title: Text(context.l10n.duplicate),
                subtitle: Text(context.l10n.createButtonCopySubtitle),
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  setState(() {
                    _draft.insertButton(
                      index + 1,
                      RemoteEditorActions.duplicateButton(button),
                    );
                  });
                  _showSnack(context.l10n.buttonDuplicated);
                },
            ),
            ListTile(
              leading: const Icon(Icons.copy_rounded),
              title: Text(context.l10n.duplicateAndEdit),
              subtitle: Text(context.l10n.duplicateAndEditButtonSubtitle),
              onTap: () async {
                Navigator.of(sheetContext).pop();
                final duplicate = RemoteEditorActions.duplicateButton(button);
                final newIndex = index + 1;
                setState(() => _draft.insertButton(newIndex, duplicate));
                final updated = await RemoteEditorActions.editButton(
                  context,
                  duplicate,
                );
                if (updated != null && mounted) {
                  setState(() => _draft.replaceButtonAt(newIndex, updated));
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.delete_outline, color: theme.colorScheme.error),
              title: Text(
                context.l10n.remove,
                style: TextStyle(color: theme.colorScheme.error),
              ),
              subtitle: Text(context.l10n.undoAvailableInNextSnackbar),
              onTap: () async {
                Navigator.of(sheetContext).pop();
                final confirmed = await RemoteEditorActions.confirmDeleteButton(
                  context,
                  button,
                );
                if (!confirmed || !mounted) return;
                final removedIndex = index;
                final removedButton = _draft.removeButtonAt(index);
                setState(() {});
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.l10n.buttonRemoved),
                    action: SnackBarAction(
                      label: context.l10n.undo,
                      onPressed: () {
                        if (!mounted) return;
                        setState(() {
                          final restoreAt = removedIndex.clamp(0, _draft.buttons.length);
                          _draft.insertButton(restoreAt, removedButton);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openSettingsSheet() async {
    final result = await showModalBottomSheet<RemoteSettingsResult>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => RemoteSettingsSheet(
        initialName: _draft.name,
        initialLayoutStyle: _draft.layoutStyle,
      ),
    );
    if (result == null || !mounted) return;
    setState(() {
      _draft.updateName(result.name);
      _draft.updateLayoutStyle(result.layoutStyle);
    });
  }

  Future<void> _renameRemoteInline() async {
    final controller = TextEditingController(text: _draft.name);
    final result = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.l10n.remoteName),
        content: TextField(
          controller: controller,
          textInputAction: TextInputAction.done,
          autofocus: true,
          onSubmitted: (value) => Navigator.of(dialogContext).pop(value.trim()),
          decoration: InputDecoration(
            hintText: context.l10n.remoteNameHint,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.of(dialogContext).pop(controller.text.trim()),
            child: Text(context.l10n.done),
          ),
        ],
      ),
    );
    controller.dispose();
    if (result == null || !mounted) return;
    setState(() {
      _draft.updateName(result.isEmpty ? context.l10n.untitledRemote : result);
    });
  }

  Widget _pill(BuildContext context, String text, {IconData? icon}) {
    return Chip(
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      avatar: icon == null ? null : Icon(icon, size: 16),
      label: Text(text),
    );
  }

  List<Widget> _buildButtonMetaChips(IRButton button) {
    final hasRaw = button.rawData != null && button.rawData!.trim().isNotEmpty;
    final isNecCustom = hasRaw && isNecConfigString(button.rawData);
    final isPlainNec = button.code != null &&
        !hasRaw &&
        (button.protocol == null || button.protocol!.trim().isEmpty);
    final chips = <Widget>[];

    if (button.protocol != null && button.protocol!.trim().isNotEmpty) {
      final id = button.protocol!.trim();
      chips.add(_pill(context, IrProtocolRegistry.displayName(id), icon: Icons.tune));
      if (!IrProtocolRegistry.isImplemented(id)) {
        chips.add(_pill(context, context.l10n.notImplemented, icon: Icons.hourglass_empty));
      }
      if (button.frequency != null && button.frequency! > 0) {
        chips.add(
          _pill(
            context,
            context.l10n.frequencyKhz((button.frequency! / 1000).round()),
            icon: Icons.waves,
          ),
        );
      }
      return chips.take(2).toList(growable: false);
    }

    if (isNecCustom) {
      chips.add(_pill(context, context.l10n.necProtocolShort, icon: Icons.numbers));
      chips.add(_pill(context, (button.necBitOrder ?? 'msb').toUpperCase(), icon: Icons.swap_horiz));
      if (button.frequency != null && button.frequency! > 0) {
        chips.add(
          _pill(
            context,
            context.l10n.frequencyKhz((button.frequency! / 1000).round()),
            icon: Icons.waves,
          ),
        );
      }
    } else if (isPlainNec) {
      chips.add(_pill(context, context.l10n.necProtocolShort, icon: Icons.numbers));
      chips.add(_pill(context, context.l10n.msbShort, icon: Icons.swap_horiz));
      chips.add(
        _pill(
          context,
          context.l10n.frequencyKhz((kDefaultNecFrequencyHz / 1000).round()),
          icon: Icons.waves,
        ),
      );
    } else if (hasRaw) {
      chips.add(_pill(context, context.l10n.rawSignal, icon: Icons.graphic_eq));
      if (button.frequency != null && button.frequency! > 0) {
        chips.add(
          _pill(
            context,
            context.l10n.frequencyKhz((button.frequency! / 1000).round()),
            icon: Icons.waves,
          ),
        );
      }
    }
    return chips.take(2).toList(growable: false);
  }

  Widget _buildButtonTile(IRButton button, int index) {
    final theme = Theme.of(context);
    final meta = _buildButtonMetaChips(button);
    final cardColor = resolveButtonBackground(
      button.buttonColor == null ? null : Color(button.buttonColor!),
      theme.colorScheme.primary.withValues(alpha: 0.15),
    );
    final textColor = resolveButtonForeground(
      button.buttonColor == null ? null : Color(button.buttonColor!),
      theme.colorScheme.onSurface,
    );
    final fallbackLabel = displayButtonLabel(
      button,
      fallback: context.l10n.buttonFallbackTitle,
      iconFallback: context.l10n.iconFallback,
      iconNameLocalizer: (name) => localizedIconPickerName(context.l10n, name),
    );
    late final Widget labelWidget;

    final canRenderIcon = button.iconCodePoint != null &&
        ((button.iconFontFamily?.trim().isNotEmpty ?? false) ||
            (button.iconFontPackage?.trim().isNotEmpty ?? false));

    if (canRenderIcon) {
      final iconColor = button.iconColor != null
          ? Color(button.iconColor!)
          : textColor;
      labelWidget = Center(
        child: Icon(
          IconData(
            button.iconCodePoint!,
            fontFamily: button.iconFontFamily,
            fontPackage: button.iconFontPackage,
          ),
          size: 32,
          color: iconColor,
        ),
      );
    } else if (button.isImage) {
      labelWidget = button.image.trim().isEmpty
          ? _fallbackText(theme, fallbackLabel, textColor)
          : (button.image.startsWith('assets/')
              ? Image.asset(
                  button.image,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) =>
                      _fallbackText(theme, fallbackLabel, textColor),
                )
              : Image.file(
                  File(button.image),
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) =>
                      _fallbackText(theme, fallbackLabel, textColor),
                ));
    } else {
      labelWidget = _fallbackText(theme, fallbackLabel, textColor);
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
          child: _draft.useNewStyle
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
                            button.iconCodePoint != null
                                ? context.l10n.iconButton
                                : button.isImage
                                    ? context.l10n.imageButton
                                    : button.image,
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
                                color: button.buttonColor != null
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

  Widget _fallbackText(ThemeData theme, String fallbackLabel, Color textColor) {
    return Center(
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

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    final compactPhone = MediaQuery.sizeOf(context).width < 400;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(compactPhone ? 18 : 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.grid_view_outlined,
              size: compactPhone ? 42 : 52,
              color: theme.colorScheme.primary,
            ),
            SizedBox(height: compactPhone ? 10 : 12),
            Text(
              context.l10n.noButtonsYet,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
            ),
            SizedBox(height: compactPhone ? 6 : 8),
            Text(
              context.l10n.createRemoteEmptyStateDescription,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.35,
              ),
            ),
            SizedBox(height: compactPhone ? 16 : 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: compactPhone ? 2.5 : 2.8,
              children: [
                FilledButton.icon(
                  onPressed: _openBulkImport,
                  icon: const Icon(Icons.storage_rounded),
                  label: Text(context.l10n.importFromDatabase),
                ),
                FilledButton.tonalIcon(
                  onPressed: _addButton,
                  icon: const Icon(Icons.edit_note_rounded),
                  label: Text(context.l10n.addButton),
                ),
                OutlinedButton.icon(
                  onPressed: _openImportFromExistingRemotes,
                  icon: const Icon(Icons.import_export_rounded),
                  label: Text(context.l10n.importFromRemotes),
                ),
                OutlinedButton.icon(
                  onPressed: _openGitHubStore,
                  icon: const FaIcon(FontAwesomeIcons.github, size: 18),
                  label: Text(context.l10n.browseGithubStore),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final compactPhone = screenWidth < 400;
    final title = _draft.name.trim().isEmpty
        ? context.l10n.untitledRemote
        : _draft.name.trim();

    return PopScope(
      canPop: !_draft.isDirty,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final discard = await _confirmDiscardIfNeeded();
        if (!context.mounted) return;
        if (discard) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: compactPhone
              ? InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: _renameRemoteInline,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: _renameRemoteInline,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      context.l10n.remoteLayoutSummary(
                        _draft.buttonCount,
                        _draft.useNewStyle
                            ? context.l10n.layoutWide
                            : context.l10n.layoutCompact,
                      ),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
          actions: [
            IconButton(
              tooltip: context.l10n.remoteName,
              onPressed: _renameRemoteInline,
              icon: const Icon(Icons.edit_outlined),
            ),
            IconButton(
              tooltip: context.l10n.editRemote,
              onPressed: _openSettingsSheet,
              icon: const Icon(Icons.tune_rounded),
            ),
            TextButton.icon(
              onPressed: _finish,
              icon: const Icon(Icons.save_outlined, size: 18),
              label: Text(context.l10n.saveAction),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            compactPhone
                ? FloatingActionButton.small(
                    heroTag: 'remote_studio_save',
                    onPressed: _finish,
                    tooltip: context.l10n.saveAction,
                    child: const Icon(Icons.save_outlined),
                  )
                : FloatingActionButton.extended(
                    heroTag: 'remote_studio_save',
                    onPressed: _finish,
                    icon: const Icon(Icons.save_outlined),
                    label: Text(context.l10n.saveAction),
                  ),
            const SizedBox(width: 12),
            compactPhone
                ? FloatingActionButton(
                    heroTag: 'remote_studio_add',
                    onPressed: _openAddSheet,
                    tooltip: context.l10n.addButton,
                    child: const Icon(Icons.add),
                  )
                : FloatingActionButton.extended(
                    heroTag: 'remote_studio_add',
                    onPressed: _openAddSheet,
                    icon: const Icon(Icons.add),
                    label: Text(context.l10n.addButton),
                  ),
          ],
        ),
        body: SafeArea(
          child: _draft.buttons.isEmpty
              ? _buildEmptyState(context)
              : GridView.builder(
                  padding: EdgeInsets.fromLTRB(
                    12,
                    compactPhone ? 10 : 16,
                    12,
                    compactPhone ? 84 : 96,
                  ),
                  itemCount: _draft.buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _draft.useNewStyle ? 2 : 4,
                    childAspectRatio: _draft.useNewStyle ? 2.2 : 1.0,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) =>
                      _buildButtonTile(_draft.buttons[index], index),
                ),
        ),
      ),
    );
  }
}
