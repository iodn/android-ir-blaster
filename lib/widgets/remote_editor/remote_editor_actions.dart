import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/create_button.dart';
import 'package:irblaster_controller/widgets/db_bulk_import_sheet.dart';
import 'package:irblaster_controller/widgets/existing_remote_button_import_sheet.dart';
import 'package:irblaster_controller/widgets/github_store_screen.dart';
import 'package:uuid/uuid.dart';

class RemoteEditorActions {
  const RemoteEditorActions._();

  static Future<IRButton?> addButton(BuildContext context) async {
    try {
      return await Navigator.of(context).push<IRButton?>(
        MaterialPageRoute(builder: (_) => const CreateButton()),
      );
    } catch (_) {
      return null;
    }
  }

  static Future<IRButton?> editButton(
    BuildContext context,
    IRButton button,
  ) async {
    try {
      return await Navigator.of(context).push<IRButton?>(
        MaterialPageRoute(builder: (_) => CreateButton(button: button)),
      );
    } catch (_) {
      return null;
    }
  }

  static IRButton duplicateButton(IRButton button) {
    return button.copyWith(id: const Uuid().v4());
  }

  static Future<IRButton?> duplicateAndEditButton(
    BuildContext context,
    IRButton button,
  ) async {
    final duplicate = duplicateButton(button);
    final updated = await editButton(context, duplicate);
    return updated ?? duplicate;
  }

  static Future<bool> confirmDeleteButton(
    BuildContext context,
    IRButton button,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.warning_amber_rounded),
        title: Text(context.l10n.removeButtonTitle),
        content: Text(
          button.isImage
              ? context.l10n.imageButtonRemovedMessage
              : context.l10n.namedButtonRemovedMessage(button.image),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton.tonalIcon(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            icon: const Icon(Icons.delete_outline),
            label: Text(context.l10n.remove),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  static Future<List<IRButton>?> importFromDatabase(
    BuildContext context, {
    required List<IRButton> existingButtons,
  }) async {
    try {
      return await showModalBottomSheet<List<IRButton>>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        builder: (_) => FractionallySizedBox(
          heightFactor: 0.97,
          child: DbBulkImportSheet(existingButtons: existingButtons),
        ),
      );
    } catch (_) {
      return null;
    }
  }

  static Future<List<IRButton>?> importFromExistingRemotes(
    BuildContext context, {
    required List<IRButton> existingButtons,
    int? currentRemoteId,
  }) async {
    try {
      return await showModalBottomSheet<List<IRButton>>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        builder: (_) => FractionallySizedBox(
          heightFactor: 0.97,
          child: ExistingRemoteButtonImportSheet(
            existingButtons: existingButtons,
            currentRemoteId: currentRemoteId,
          ),
        ),
      );
    } catch (_) {
      return null;
    }
  }

  static Future<void> browseGithubStore(BuildContext context) async {
    try {
      await Navigator.of(context).push<void>(
        MaterialPageRoute(builder: (_) => const GitHubStoreScreen()),
      );
    } catch (_) {}
  }
}
