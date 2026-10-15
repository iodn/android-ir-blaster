import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/sharing/sharing_screen.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/state/macros_state.dart' as macros;
import 'package:irblaster_controller/utils/remote.dart';

void main() {
  test('button counts use natural singular and plural forms', () async {
    const expected = {
      'en': ['0 buttons', '1 button', '2 buttons', '5 buttons', '21 buttons'],
      'de': ['0 Tasten', '1 Taste', '2 Tasten', '5 Tasten', '21 Tasten'],
      'es': ['0 botones', '1 botón', '2 botones', '5 botones', '21 botones'],
      'ru': ['0 кнопок', '1 кнопка', '2 кнопки', '5 кнопок', '21 кнопка'],
      'uk': ['0 кнопок', '1 кнопка', '2 кнопки', '5 кнопок', '21 кнопка'],
      'pl': [
        '0 przycisków',
        '1 przycisk',
        '2 przyciski',
        '5 przycisków',
        '21 przycisków'
      ],
      'ar': ['لا أزرار', 'زر واحد', 'زران', '5 أزرار', '21 زرًا'],
    };
    const counts = [0, 1, 2, 5, 21];
    for (final locale in AppLocalizations.supportedLocales) {
      final l10n = await AppLocalizations.delegate.load(locale);
      for (var i = 0; i < counts.length; i++) {
        final label = l10n.remoteButtonCountSummary(counts[i]);
        for (final layout in [
          l10n.layoutCompact,
          l10n.layoutComfort,
          l10n.layoutCustom
        ]) {
          expect(
              l10n.remoteLayoutSummary(counts[i], layout), '$label · $layout');
        }
        expect(label, isNot(contains('(s)')));
        expect(label, isNot(contains('(es)')));
        if (expected.containsKey(locale.toString())) {
          expect(label, expected[locale.toString()]![i]);
        }
      }
    }
  });

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('sharing remote counts fit enlarged text: $locale',
        (tester) async {
      final oldRemotes = state.remotes;
      final oldMacros = macros.macros;
      addTearDown(() {
        state.remotes = oldRemotes;
        macros.macros = oldMacros;
      });
      state.remotes = [
        for (final count in [0, 1, 2, 5, 21, 101])
          Remote(
              name: 'TV $count',
              buttons: List.generate(count,
                  (i) => IRButton(id: '$i', image: 'Power', isImage: false))),
      ];
      macros.macros = [];
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
        home: const SharingScreen(),
      ));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(SharingScreen)))!;
      for (final count in [0, 1, 2, 5, 21, 101]) {
        final text = find.text(l10n.remoteButtonCountSummary(count));
        await tester.scrollUntilVisible(text, 150,
            scrollable: find.byType(Scrollable).first);
        await tester.pumpAndSettle();
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1));
        expect(tester.getRect(text).left, greaterThanOrEqualTo(0));
        expect(tester.getRect(text).right, lessThanOrEqualTo(320));
      }
    });
  }
}
