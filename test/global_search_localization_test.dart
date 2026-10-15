import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/state/macros_state.dart' as macro_state;
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/global_search_delegate.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('global search labels readable: $locale', (tester) async {
      final oldRemotes = state.remotes;
      final oldMacros = macro_state.macros;
      addTearDown(() {
        state.remotes = oldRemotes;
        macro_state.macros = oldMacros;
      });
      state.remotes = [
        Remote(id: 1, name: 'TV', buttons: [
          const IRButton(id: 'power', image: 'Power', isImage: false)
        ])
      ];
      macro_state.macros = [
        const TimedMacro(
            id: 'macro', name: 'TV sequence', remoteName: 'TV', steps: [])
      ];
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
        home: Builder(
            builder: (context) => Scaffold(
                  body: TextButton(
                    onPressed: () => showSearch<void>(
                        context: context,
                        delegate: GlobalSearchDelegate(),
                        query: 'TV'),
                    child: const Text('Open'),
                  ),
                )),
      ));
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      final l10n = await AppLocalizations.delegate.load(locale);
      for (final value in [
        l10n.globalSearchTypeRemote,
        l10n.remoteButtonCountLabel(1),
        l10n.globalSearchTypeButton,
        l10n.globalSearchTypeMacro,
        'TV · ${l10n.macroStepCountLabel(0)}',
      ]) {
        final text = find.text(value);
        if (text.evaluate().isEmpty) {
          await tester.scrollUntilVisible(text, 100,
              scrollable: find.descendant(
                  of: find.byType(ListView),
                  matching: find.byType(Scrollable)));
        }
        await tester.ensureVisible(text);
        await tester.pumpAndSettle();
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse, reason: value);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1));
        final rect = tester.getRect(text);
        expect(rect.left, greaterThanOrEqualTo(0));
        expect(rect.right, lessThanOrEqualTo(320));
      }
      await tester.enterText(find.byType(TextField), 'zzzzmissing');
      await tester.pumpAndSettle();
      final text = find.text(l10n.globalSearchNoResults);
      expect(text, findsOneWidget);
      final paragraph = tester.renderObject<RenderParagraph>(text);
      expect(paragraph.didExceedMaxLines, isFalse);
      expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
          lessThanOrEqualTo(paragraph.size.height + 0.1));
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
