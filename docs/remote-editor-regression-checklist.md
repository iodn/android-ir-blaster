# Remote Editor Regression Checklist

Use this checklist before and after refactoring the remote creation and editing flow.

Scope
- [create_remote.dart](/home/intra/Documents/Android/apps/android-ir-blaster/lib/widgets/create_remote.dart)
- [remote_view.dart](/home/intra/Documents/Android/apps/android-ir-blaster/lib/widgets/remote_view.dart)
- [remote_list.dart](/home/intra/Documents/Android/apps/android-ir-blaster/lib/widgets/remote_list.dart)

## Entry Points

1. Create a new remote from the Remotes list
- Open the Remotes screen.
- Start remote creation.
- Verify the create screen opens without errors.
- Verify cancel returns to the Remotes list without creating a remote.

2. Edit an existing remote
- Open any existing remote.
- Open the remote edit action.
- Verify the edit screen opens with the existing remote name, layout, and buttons.
- Verify cancel returns without applying changes.

## Core Editing

3. Add button
- Create or edit a remote.
- Add a new button.
- Verify the button appears immediately in the editor grid.
- Save the remote.
- Reopen the remote and verify the button is still present and functional.

4. Duplicate button
- Open the button actions for any existing button.
- Duplicate it.
- Verify the duplicate is inserted next to the original.
- Save the remote.
- Reopen the remote and verify both buttons are present.

5. Delete button
- Open the button actions for any existing button.
- Delete it and confirm.
- Verify the button is removed immediately.
- Verify snackbar undo restores it.
- Delete again, save the remote, and verify the button stays deleted after reopening.

## Import Flows

6. Import from remotes
- Open the remote editor.
- Import one or more buttons from existing remotes.
- Verify imported buttons are added to the current remote.
- Save and reopen the remote.
- Verify imported buttons persist.

7. Import from database
- Open the remote editor.
- Import one or more buttons from the database sheet.
- Verify imported buttons are added to the current remote.
- Save and reopen the remote.
- Verify imported buttons persist.

8. GitHub Store
- Open the remote editor.
- Open GitHub Store.
- Verify navigation succeeds and returns cleanly to the editor.
- Verify returning from GitHub Store does not lose unsaved local changes in the editor.

## Save and Persistence

9. Save remote
- Change the remote name.
- Optionally change the layout.
- Save the remote.
- Verify the updated remote appears correctly in the Remotes list.
- Open the remote and verify:
  - name persisted
  - layout persisted
  - buttons persisted

## Recommended Smoke Matrix

Run at least these combinations:
- New remote with zero buttons, then cancel
- New remote with one manually added button, then save
- New remote populated only by import
- Existing remote with rename only
- Existing remote with layout change only
- Existing remote with add, duplicate, and delete in one session

## Pass Criteria

The refactor is safe only if:
- no entry point is broken
- no button operation loses data
- no import flow regresses
- save persists name, layout, and buttons correctly
- cancel never creates or mutates a remote unexpectedly
