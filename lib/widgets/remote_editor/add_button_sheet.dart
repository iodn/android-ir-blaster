import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/l10n.dart';

enum AddButtonSheetAction {
  addButton,
  importFromRemotes,
  importFromDatabase,
  browseGithubStore,
}

class AddButtonSheet extends StatelessWidget {
  const AddButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton.icon(
            onPressed: () => Navigator.of(context).pop(AddButtonSheetAction.addButton),
            icon: const Icon(Icons.add_circle_outline_rounded),
            label: Text(l10n.addButton),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              l10n.importFromRemotes,
              style: theme.textTheme.labelLarge?.copyWith(
                color: cs.onSurfaceVariant,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.merge_type_rounded),
                  title: Text(l10n.importFromRemotes),
                  onTap: () => Navigator.of(context)
                      .pop(AddButtonSheetAction.importFromRemotes),
                ),
                const Divider(height: 0),
                ListTile(
                  leading: const Icon(Icons.playlist_add_rounded),
                  title: Text(l10n.importFromDatabase),
                  subtitle: Text(l10n.importFromDatabaseSubtitle),
                  onTap: () => Navigator.of(context)
                      .pop(AddButtonSheetAction.importFromDatabase),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 4),
            leading: Icon(
              Icons.storefront_rounded,
              color: cs.onSurfaceVariant,
            ),
            title: Text(
              l10n.browseGithubStore,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: cs.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pop(AddButtonSheetAction.browseGithubStore),
          ),
        ],
      ),
    );
  }
}
