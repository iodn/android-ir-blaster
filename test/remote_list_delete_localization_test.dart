import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/remote_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    for (final search in [false, true]) {
      testWidgets('list deletion warning fits $locale search=$search',
          (tester) async {
        SharedPreferences.setMockInitialValues({});
        final oldRemotes = state.remotes;
        addTearDown(() => state.remotes = oldRemotes);
        final name =
            List.filled(3, 'Living room TV and media center').join(' / ');
        final remote = Remote(id: 1, name: name, buttons: []);
        state.remotes = [remote];
        var deletions = 0;
        tester.view.physicalSize = const Size(320, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        await tester.pumpWidget(MaterialApp(
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(2)),
            child: child!,
          ),
          home: search
              ? Builder(
                  builder: (context) => Scaffold(
                          body: TextButton(
                        child: const Text('Open'),
                        onPressed: () => showSearch<void>(
                          context: context,
                          delegate: RemoteSearchDelegate([remote],
                              onDelete: (_) async {
                            deletions++;
                          }),
                        ),
                      )))
              : const RemoteList(),
        ));
        await tester.pumpAndSettle();
        final l10n = await AppLocalizations.delegate.load(locale);
        if (search) {
          await tester.tap(find.text('Open'));
          await tester.pumpAndSettle();
        }
        for (final confirm in search ? [false, true] : [false]) {
          if (search) {
            await tester.tap(find.byTooltip(l10n.actions));
            await tester.pumpAndSettle();
            await tester.tap(find.text(l10n.delete));
          } else {
            await tester.longPress(find.text(name).first);
            await tester.pumpAndSettle();
            final action = find.text(l10n.delete);
            await tester.ensureVisible(action);
            await tester.pumpAndSettle();
            await tester.tap(action);
          }
          await tester.pumpAndSettle();
          expect(deletions, 0);
          final surface =
              search ? find.byType(AlertDialog) : find.byType(BottomSheet);
          for (final value in [
            l10n.deleteRemoteTitle,
            l10n.deleteRemoteMessage(name),
            l10n.cancel,
            l10n.delete
          ]) {
            final text =
                find.descendant(of: surface, matching: find.text(value));
            expect(text, findsOneWidget);
            await tester.ensureVisible(text);
            await tester.pumpAndSettle();
            final paragraph = tester.renderObject<RenderParagraph>(text);
            expect(paragraph.didExceedMaxLines, isFalse);
            expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
                lessThanOrEqualTo(paragraph.size.height + 0.1));
          }
          final choice = find.descendant(
              of: surface,
              matching: find.text(confirm ? l10n.delete : l10n.cancel));
          await tester.ensureVisible(choice);
          await tester.pumpAndSettle();
          expect(choice.hitTestable(), findsOneWidget);
          await tester.tap(choice);
          await tester.pumpAndSettle();
          expect(deletions, confirm ? 1 : 0);
          expect(state.remotes, [remote]);
          expect(surface, findsNothing);
          if (confirm) {
            final feedback = find.text(l10n.deletedRemoteUndoUnavailable(name));
            expect(feedback, findsOneWidget);
            final paragraph = tester.renderObject<RenderParagraph>(feedback);
            expect(paragraph.didExceedMaxLines, isFalse);
            expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
                lessThanOrEqualTo(paragraph.size.height + 0.1));
          }
        }
        await tester.pumpWidget(const SizedBox());
        await tester.pumpAndSettle();
      });
    }
  }
}
