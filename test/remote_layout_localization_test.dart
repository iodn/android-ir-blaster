import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote_grid_layout.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_draft.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_layout_picker.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('layout choices fit compact enlarged UI: $locale',
        (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      var style = RemoteLayoutStyle.custom;
      RemoteGridLayout? grid = RemoteGridLayout(columns: 3);
      late AppLocalizations l10n;
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.5)),
          child: child!,
        ),
        home: Scaffold(body: StatefulBuilder(builder: (context, setState) {
          l10n = AppLocalizations.of(context)!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: RemoteLayoutPicker(
              style: style,
              grid: grid,
              onChanged: (nextStyle, nextGrid) => setState(() {
                style = nextStyle;
                grid = nextGrid;
              }),
            ),
          );
        })),
      ));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(l10n.layoutComfort, l10n.layoutWide,
          reason: 'The same preset must have the same name in every screen');
      for (final columns in [1, 6]) {
        final chip = find.widgetWithText(ChoiceChip, '$columns');
        await tester.ensureVisible(chip);
        await tester.pumpAndSettle();
        await tester.tap(chip);
        await tester.pumpAndSettle();
        expect(grid!.columns, columns);
      }
      final labels = [
        l10n.layoutCircle,
        l10n.layoutRoundedSquare,
        l10n.layoutRectangle,
      ];
      for (var i = 0; i < labels.length; i++) {
        final text = find.text(labels[i]);
        await tester.ensureVisible(text);
        await tester.pumpAndSettle();
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse,
            reason: '$locale: ${labels[i]} must remain readable');
        if (paragraph.maxLines == 1) {
          expect(paragraph.getMaxIntrinsicWidth(double.infinity),
              lessThanOrEqualTo(paragraph.size.width + 0.1),
              reason: '$locale: ${labels[i]} must not fade horizontally');
        }
        await tester.tap(text);
        await tester.pumpAndSettle();
        expect(grid!.shape, RemoteButtonShape.values[i]);
        expect(tester.takeException(), isNull);
      }
      for (final entry in {
        l10n.layoutWide: RemoteLayoutStyle.wide,
        l10n.layoutCompact: RemoteLayoutStyle.compact,
      }.entries) {
        await tester.ensureVisible(find.text(entry.key));
        await tester.pumpAndSettle();
        await tester.tap(find.text(entry.key));
        await tester.pumpAndSettle();
        expect(style, entry.value);
        expect(tester.takeException(), isNull);
      }
    });
  }
}
