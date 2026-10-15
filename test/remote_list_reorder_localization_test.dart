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
    testWidgets('remote reorder guidance readable: $locale', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final oldRemotes = state.remotes;
      state.remotes = [Remote(id: 1, name: 'TV', buttons: [])];
      addTearDown(() => state.remotes = oldRemotes);
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
        home: const RemoteList(),
      ));
      await tester.pumpAndSettle();
      final l10n = await AppLocalizations.delegate.load(locale);
      await tester.tap(find.byTooltip(l10n.reorderRemotes));
      await tester.pumpAndSettle();
      final hint = find.text(l10n.remoteListReorderHint).first;
      final paragraph = tester.renderObject<RenderParagraph>(hint);
      expect(paragraph.didExceedMaxLines, isFalse);
      expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
          lessThanOrEqualTo(paragraph.size.height + 0.1));
      expect(find.byTooltip('Reorder mode'), findsNothing);
      expect(find.byTooltip(l10n.reorderRemotes), findsOneWidget);
      final done = find.widgetWithText(FilledButton, l10n.done);
      expect(done.hitTestable(), findsOneWidget);
      await tester.tap(done);
      await tester.pumpAndSettle();
      expect(find.widgetWithText(FilledButton, l10n.done), findsNothing);
      expect(state.remotes.single.name, 'TV');
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
