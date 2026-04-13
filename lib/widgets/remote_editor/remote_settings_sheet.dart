import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_draft.dart';

class RemoteSettingsResult {
  const RemoteSettingsResult({
    required this.name,
    required this.layoutStyle,
  });

  final String name;
  final RemoteLayoutStyle layoutStyle;
}

class RemoteSettingsSheet extends StatefulWidget {
  const RemoteSettingsSheet({
    super.key,
    required this.initialName,
    required this.initialLayoutStyle,
  });

  final String initialName;
  final RemoteLayoutStyle initialLayoutStyle;

  @override
  State<RemoteSettingsSheet> createState() => _RemoteSettingsSheetState();
}

class _RemoteSettingsSheetState extends State<RemoteSettingsSheet> {
  late final TextEditingController _nameController;
  late RemoteLayoutStyle _layoutStyle;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _layoutStyle = widget.initialLayoutStyle;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submit() {
    final l10n = context.l10n;
    Navigator.of(context).pop(
      RemoteSettingsResult(
        name: _nameController.text.trim().isEmpty
            ? l10n.untitledRemote
            : _nameController.text.trim(),
        layoutStyle: _layoutStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        8,
        16,
        16 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.editRemote,
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _nameController,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
            decoration: InputDecoration(
              labelText: l10n.remoteName,
              hintText: l10n.remoteNameHint,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.layoutStyle,
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          SegmentedButton<RemoteLayoutStyle>(
            segments: [
              ButtonSegment(
                value: RemoteLayoutStyle.compact,
                icon: const Icon(Icons.grid_view_outlined),
                label: Text(l10n.layoutCompact),
              ),
              ButtonSegment(
                value: RemoteLayoutStyle.wide,
                icon: const Icon(Icons.view_agenda_outlined),
                label: Text(l10n.layoutWide),
              ),
            ],
            selected: {_layoutStyle},
            onSelectionChanged: (selection) {
              setState(() => _layoutStyle = selection.first);
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(l10n.cancel),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: _submit,
                  child: Text(l10n.done),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
