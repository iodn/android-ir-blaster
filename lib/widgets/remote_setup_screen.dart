import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_draft.dart';

class RemoteSetupScreen extends StatefulWidget {
  const RemoteSetupScreen({super.key});

  @override
  State<RemoteSetupScreen> createState() => _RemoteSetupScreenState();
}

class _RemoteSetupScreenState extends State<RemoteSetupScreen> {
  late final TextEditingController _nameController;
  RemoteLayoutStyle _layoutStyle = RemoteLayoutStyle.compact;

  bool get _isDirty =>
      _nameController.text.trim().isNotEmpty ||
      _layoutStyle != RemoteLayoutStyle.compact;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _complete({required bool useDefaultName}) {
    final l10n = context.l10n;
    final enteredName = _nameController.text.trim();
    final name = useDefaultName || enteredName.isEmpty
        ? l10n.untitledRemote
        : enteredName;

    Navigator.of(context).pop(
      RemoteEditorDraft.create(
        defaultName: name,
        layoutStyle: _layoutStyle,
      ),
    );
  }

  Future<bool> _confirmDiscardIfNeeded() async {
    if (!_isDirty) return true;
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.l10n.unsavedChangesTitle),
        content: Text(context.l10n.unsavedRemoteSetupChangesMessage),
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

  Widget _buildLayoutPreviewCard(
    BuildContext context, {
    required RemoteLayoutStyle style,
    required bool selected,
  }) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final bool isWide = style == RemoteLayoutStyle.wide;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => setState(() => _layoutStyle = style),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: selected
                  ? cs.primaryContainer.withValues(alpha: 0.75)
                  : cs.surfaceContainerHighest.withValues(alpha: 0.45),
              border: Border.all(
                color: selected ? cs.primary : cs.outlineVariant,
                width: selected ? 1.8 : 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      isWide
                          ? Icons.view_agenda_outlined
                          : Icons.grid_view_outlined,
                      size: 18,
                      color: selected
                          ? cs.onPrimaryContainer
                          : cs.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        isWide
                            ? context.l10n.layoutWide
                            : context.l10n.layoutCompact,
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: selected
                              ? cs.onPrimaryContainer
                              : cs.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  height: 92,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: cs.surface.withValues(alpha: 0.9),
                    border: Border.all(
                      color: cs.outlineVariant.withValues(alpha: 0.55),
                    ),
                  ),
                  child: isWide
                      ? GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                          childAspectRatio: 2.3,
                          children: List.generate(
                            6,
                            (_) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    cs.secondaryContainer.withValues(alpha: 0.75),
                              ),
                            ),
                          ),
                        )
                      : GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                          children: List.generate(
                            8,
                            (_) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    cs.secondaryContainer.withValues(alpha: 0.75),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final l10n = context.l10n;

    return PopScope(
      canPop: !_isDirty,
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
          title: Text(l10n.createRemoteTitle),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [
                      cs.primaryContainer.withValues(alpha: 0.92),
                      cs.secondaryContainer.withValues(alpha: 0.84),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cs.onPrimaryContainer.withValues(alpha: 0.10),
                      ),
                      child: Icon(
                        Icons.settings_remote_rounded,
                        color: cs.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.createRemoteTitle,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: cs.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.remoteSetupIntro,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: cs.onPrimaryContainer.withValues(alpha: 0.84),
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _nameController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: l10n.remoteName,
                      hintText: l10n.remoteNameHint,
                      helperText: l10n.remoteNameHelper,
                      suffixIcon: _nameController.text.trim().isEmpty
                          ? null
                          : IconButton(
                              tooltip: l10n.clearAction,
                              onPressed: () {
                                setState(_nameController.clear);
                              },
                              icon: const Icon(Icons.clear),
                            ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.layoutStyle,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _buildLayoutPreviewCard(
                            context,
                            style: RemoteLayoutStyle.compact,
                            selected:
                                _layoutStyle == RemoteLayoutStyle.compact,
                          ),
                          const SizedBox(width: 10),
                          _buildLayoutPreviewCard(
                            context,
                            style: RemoteLayoutStyle.wide,
                            selected: _layoutStyle == RemoteLayoutStyle.wide,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 180),
                        child: Text(
                          _layoutStyle == RemoteLayoutStyle.wide
                              ? l10n.layoutWideDescription
                              : l10n.layoutCompactDescription,
                          key: ValueKey(_layoutStyle),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: cs.onSurfaceVariant,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _complete(useDefaultName: true),
                  child: Text(l10n.startWithDefault),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => _complete(useDefaultName: false),
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: Text(l10n.continueAction),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
