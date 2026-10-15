import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';

void main() {
  test('button import counts select grammatical forms', () async {
    const expected = {
      'en': ['1 button.', '2 buttons.', '5 buttons.', '21 buttons.'],
      'de': ['1 Taste', '2 Tasten', '5 Tasten', '21 Tasten'],
      'es': ['1 botón.', '2 botones.', '5 botones.', '21 botones.'],
      'fr': ['1 bouton ', '2 boutons ', '5 boutons ', '21 boutons '],
      'hi': [
        '1 बटन इंपोर्ट किया गया',
        '2 बटन इंपोर्ट किए गए',
        '5 बटन इंपोर्ट किए गए',
        '21 बटन इंपोर्ट किए गए',
      ],
      'it': ['1 pulsante.', '2 pulsanti.', '5 pulsanti.', '21 pulsanti.'],
      'nl': ['1 knop ', '2 knoppen ', '5 knoppen ', '21 knoppen '],
      'pl': ['1 przycisk.', '2 przyciski.', '5 przycisków.', '21 przycisków.'],
      'pt': ['1 botão.', '2 botões.', '5 botões.', '21 botões.'],
      'pt_BR': ['1 botão ', '2 botões ', '5 botões ', '21 botões '],
      'ru': ['1 кнопка.', '2 кнопки.', '5 кнопок.', '21 кнопка.'],
      'uk': ['1 кнопку.', '2 кнопки.', '5 кнопок.', '21 кнопку.'],
    };
    for (final locale in AppLocalizations.supportedLocales) {
      final fragments = expected[locale.toString()];
      if (fragments == null) continue;
      final l10n = await AppLocalizations.delegate.load(locale);
      for (final (index, count) in [1, 2, 5, 21].indexed) {
        expect(l10n.importedButtonCount(count), contains(fragments[index]),
            reason: '$locale: $count');
        expect(l10n.importedButtonsSkippedDuplicates(count, 0),
            contains(fragments[index]),
            reason: '$locale: added $count');
      }
    }
    final en = await AppLocalizations.delegate.load(const Locale('en'));
    expect(en.importedButtonsSkippedDuplicates(1, 2),
        'Imported 1 button. Skipped 2 duplicates.');
    expect(en.importedButtonsSkippedDuplicates(2, 1),
        'Imported 2 buttons. Skipped 1 duplicate.');
    expect(en.importedButtonsSkippedDuplicates(0, 1),
        'Imported 0 buttons. Skipped 1 duplicate.');
    final pl = await AppLocalizations.delegate.load(const Locale('pl'));
    expect(pl.importedButtonsSkippedDuplicates(1, 22),
        'Zaimportowano 1 przycisk. Pominięto 22 duplikaty.');
    final ru = await AppLocalizations.delegate.load(const Locale('ru'));
    expect(ru.importedButtonsSkippedDuplicates(5, 21),
        'Импортировано 5 кнопок. Пропущен 21 дубликат.');
  });

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('button import feedback fits compact large text: $locale',
        (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      late BuildContext context;
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: Scaffold(body: Builder(builder: (ctx) {
          context = ctx;
          return const SizedBox();
        })),
      ));
      await tester.pumpAndSettle();
      final l10n = AppLocalizations.of(context)!;
      final messages = <String>[
        for (final count in [0, 1, 2, 5, 11, 21, 22, 101, 1000]) ...[
          l10n.importedButtonCount(count),
          l10n.importedButtonsFromExistingRemotes(count),
        ],
        for (final (added, skipped) in [
          (0, 1),
          (1, 0),
          (1, 2),
          (2, 1),
          (21, 22),
          (1000, 1000),
        ])
          l10n.importedButtonsSkippedDuplicates(added, skipped),
      ];
      for (final message in messages) {
        expect(message, isNot(contains('(s)')));
        expect(message, isNot(contains('{')));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
        await tester.pumpAndSettle();
        final finder = find.text(message);
        final paragraph = tester.renderObject<RenderParagraph>(finder);
        expect(paragraph.didExceedMaxLines, isFalse, reason: message);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1),
            reason: message);
        expect(tester.getRect(finder).top, greaterThanOrEqualTo(0));
        expect(tester.getRect(finder).bottom, lessThanOrEqualTo(640));
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        await tester.pumpAndSettle();
      }
      await tester.pumpWidget(const SizedBox());
    });
  }
}
