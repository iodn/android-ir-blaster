import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/quick_settings_prefs.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/quick_tile_chooser.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('Quick Settings chooser readable: $locale', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final oldRemotes = state.remotes;
      addTearDown(() => state.remotes = oldRemotes);
      final button = IRButton(id: 'power', image: 'Power', isImage: false);
      state.remotes = [
        Remote(id: 1, name: 'TV', buttons: [button])
      ];
      await QuickSettingsPrefs.saveFavorites([
        const QuickTileFavorite(
            buttonId: 'power', title: 'Power', subtitle: 'TV')
      ]);
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final l10n = await AppLocalizations.delegate.load(locale);
      final labels = {
        'power': l10n.quickTilePower,
        'mute': l10n.quickTileMute,
        'volumeUp': l10n.quickTileVolumeUp,
        'volumeDown': l10n.quickTileVolumeDown,
      };
      for (final entry in labels.entries) {
        QuickTilePick? picked;
        await tester.pumpWidget(MaterialApp(
          key: ValueKey(entry.key),
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
                      onPressed: () async {
                        picked = await pickButtonForTile(context,
                            tileKey: entry.key);
                      },
                      child: const Text('Open'),
                    ),
                  )),
        ));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();
        for (final value in [
          l10n.quickTileFavoritesTitle,
          l10n.changeMappingForTile(entry.value),
          l10n.pickDifferentButton,
          l10n.browseAllRemotesEllipsis,
        ]) {
          final text = find.text(value);
          if (text.evaluate().isEmpty) {
            await tester.scrollUntilVisible(text, 100,
                scrollable: find.descendant(
                    of: find.byType(BottomSheet),
                    matching: find.byType(Scrollable)));
          }
          await tester.ensureVisible(text);
          await tester.pumpAndSettle();
          final paragraph = tester.renderObject<RenderParagraph>(text);
          expect(paragraph.didExceedMaxLines, isFalse);
          expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
              lessThanOrEqualTo(paragraph.size.height + 0.1));
        }
        final browse = find.text(l10n.browseAllRemotesEllipsis);
        await tester.tap(browse);
        await tester.pumpAndSettle();
        final count = find.text(l10n.remoteButtonCountLabel(1));
        final paragraph = tester.renderObject<RenderParagraph>(count);
        expect(paragraph.didExceedMaxLines, isFalse);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1));
        await tester.tap(find.text('TV'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Power'));
        await tester.pumpAndSettle();
        expect(picked?.button.id, button.id);
        expect(picked?.remote.id, 1);
      }
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
