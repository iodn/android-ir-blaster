import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remote_grid_layout.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_custom_grid.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_draft.dart';
import 'package:irblaster_controller/widgets/remote_studio_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('arrangement guidance and controls fit: $locale',
        (tester) async {
      SharedPreferences.setMockInitialValues({});
      const channel = MethodChannel('org.nslabs/irtransmitter');
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(channel, (_) async => true);
      addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
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
              .copyWith(textScaler: const TextScaler.linear(1.5)),
          child: child!,
        ),
        home: RemoteStudioScreen(
            initialDraft: RemoteEditorDraft.fromRemote(Remote(
          name: 'TV',
          buttons: const [
            IRButton(id: 'a', image: 'A', isImage: false),
            IRButton(id: 'b', image: 'B', isImage: false)
          ],
          gridLayout: RemoteGridLayout(columns: 3, cells: ['a', null, 'b']),
        ))),
      ));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(RemoteStudioScreen)))!;
      RemoteGridLayout grid() =>
          tester.widget<RemoteCustomGrid>(find.byType(RemoteCustomGrid)).layout;
      for (final label in [l10n.layoutArrange, l10n.layoutAddRow]) {
        await tester.ensureVisible(find.text(label));
        await tester.pumpAndSettle();
        final p = tester.renderObject<RenderParagraph>(find.text(label));
        if (p.maxLines == 1) {
          expect(p.getMaxIntrinsicWidth(double.infinity),
              lessThanOrEqualTo(p.size.width + 0.1),
              reason: label);
        }
        expect(p.getMaxIntrinsicHeight(p.size.width),
            lessThanOrEqualTo(p.size.height + 0.1));
        expect(tester.takeException(), isNull);
      }
      await tester.ensureVisible(find.text(l10n.layoutArrange));
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.layoutArrange));
      await tester.pumpAndSettle();
      expect(find.text(l10n.layoutArrangeHint), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('a')));
      await tester.tap(find.byKey(const ValueKey('empty-cell-1')));
      await tester.pumpAndSettle();
      expect(grid().cells, [null, 'a', 'b']);
      await tester.tap(find.text(l10n.undo));
      await tester.pumpAndSettle();
      expect(grid().cells, ['a', null, 'b']);
      await tester.ensureVisible(find.text(l10n.layoutAddRow));
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.layoutAddRow));
      await tester.pumpAndSettle();
      expect(grid().cells.length, 6);
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      expect(find.text(l10n.undo), findsOneWidget);
      tester.view.physicalSize = const Size(568, 320);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(tester.getSize(find.byType(RemoteCustomGrid)).height,
          greaterThan(48));
    });
  }
}
