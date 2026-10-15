import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_draft.dart';
import 'package:irblaster_controller/widgets/remote_setup_screen.dart';

void main() {
  Future<void> revealName(WidgetTester tester) async {
    final scrollable = find
        .descendant(
            of: find.byType(ListView), matching: find.byType(Scrollable))
        .first;
    tester.state<ScrollableState>(scrollable).position.jumpTo(0);
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.byType(TextField), 100,
        scrollable: scrollable);
    await tester.pumpAndSettle();
  }

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('remote setup is readable and preserves choices: $locale',
        (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final navigator = GlobalKey<NavigatorState>();
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navigator,
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.3)),
          child: child!,
        ),
        home: const Scaffold(),
      ));
      for (final useDefault in [false, true]) {
        final result = navigator.currentState!.push<RemoteEditorDraft>(
          MaterialPageRoute(builder: (_) => const RemoteSetupScreen()),
        );
        await tester.pumpAndSettle();
        final l10n = AppLocalizations.of(
            tester.element(find.byType(RemoteSetupScreen)))!;
        await revealName(tester);
        await tester.pumpAndSettle();
        final helper = tester
            .renderObject<RenderParagraph>(find.text(l10n.remoteNameHelper));
        expect(helper.didExceedMaxLines, isFalse,
            reason: 'Name guidance must not be truncated in $locale');
        await tester.enterText(find.byType(TextField), 'Living room');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();
        await tester.ensureVisible(find.text(l10n.layoutWide));
        await tester.tap(find.text(l10n.layoutWide));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        await tester.tap(find
            .text(useDefault ? l10n.startWithDefault : l10n.continueAction));
        await tester.pumpAndSettle();
        final draft = await result;
        expect(draft, isNotNull);
        expect(draft!.name, useDefault ? l10n.untitledRemote : 'Living room');
        expect(draft.layoutStyle, RemoteLayoutStyle.wide);
        expect(tester.takeException(), isNull);
      }
      final cancelled = navigator.currentState!.push<RemoteEditorDraft>(
        MaterialPageRoute(builder: (_) => const RemoteSetupScreen()),
      );
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(RemoteSetupScreen)))!;
      await revealName(tester);
      await tester.enterText(find.byType(TextField), 'Unsaved');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      expect(find.text(l10n.unsavedRemoteSetupChangesMessage), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.tap(find.text(l10n.discard));
      await tester.pumpAndSettle();
      expect(await cancelled, isNull);
      expect(find.byType(RemoteSetupScreen), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }
}
