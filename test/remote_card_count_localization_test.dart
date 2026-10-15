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
    testWidgets('remote card counts readable: $locale', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final oldRemotes = state.remotes;
      addTearDown(() => state.remotes = oldRemotes);
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final l10n = await AppLocalizations.delegate.load(locale);
      for (final count in [0, 1, 2, 5, 21, 101]) {
        expect(l10n.remoteButtonCountLabel(count),
            l10n.remoteButtonCountSummary(count));
        state.remotes = [
          Remote(
              id: 1,
              name: 'TV',
              buttons: List.generate(count,
                  (i) => IRButton(id: '$i', image: '$i', isImage: false)))
        ];
        await tester.pumpWidget(MaterialApp(
          key: ValueKey(count),
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
        final text = find.text(l10n.remoteButtonCountLabel(count));
        expect(text, findsOneWidget);
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse, reason: '$locale: $count');
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1));
        final card = find.ancestor(of: text, matching: find.byType(Card));
        final bounds = tester.getRect(card);
        final rect = tester.getRect(text);
        expect(rect.left, greaterThanOrEqualTo(bounds.left));
        expect(rect.right, lessThanOrEqualTo(bounds.right));
        expect(rect.bottom, lessThanOrEqualTo(bounds.bottom));
      }
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
