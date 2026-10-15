import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/widgets/remote_list.dart';
import 'package:irblaster_controller/widgets/remote_setup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    for (final size in [const Size(320, 640), const Size(640, 320)]) {
      testWidgets('empty remote list readable: $locale $size', (tester) async {
        SharedPreferences.setMockInitialValues({});
        final oldRemotes = state.remotes;
        state.remotes = [];
        addTearDown(() => state.remotes = oldRemotes);
        tester.view.physicalSize = size;
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
        for (final value in [
          l10n.noRemotesYet,
          l10n.noRemotesDescription,
          l10n.noRemotesNextStep
        ]) {
          final text = find.text(value);
          await tester.ensureVisible(text);
          await tester.pumpAndSettle();
          final paragraph = tester.renderObject<RenderParagraph>(text);
          expect(paragraph.didExceedMaxLines, isFalse);
          expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
              lessThanOrEqualTo(paragraph.size.height + 0.1));
          final rect = tester.getRect(text);
          expect(rect.left, greaterThanOrEqualTo(0));
          expect(rect.right, lessThanOrEqualTo(size.width));
        }
        final add = find.widgetWithText(FilledButton, l10n.addRemote);
        await tester.ensureVisible(add);
        await tester.pumpAndSettle();
        expect(add.hitTestable(), findsOneWidget);
        await tester.tap(add);
        await tester.pumpAndSettle();
        expect(find.byType(RemoteSetupScreen), findsOneWidget);
        expect(state.remotes, isEmpty);
        await tester.pumpWidget(const SizedBox());
        await tester.pumpAndSettle();
      });
    }
  }
}
