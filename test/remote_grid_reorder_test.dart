import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/remote_list.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final layout in ['list', 'compact', 'comfort']) {
    testWidgets('$layout grid uses final drop index and persists order',
        (tester) async {
      SharedPreferences.setMockInitialValues({});
      final oldRemotes = state.remotes;
      final dir = await tester
          .runAsync(() => Directory.systemTemp.createTemp('grid-reorder-'));
      final messenger = tester.binding.defaultBinaryMessenger;
      const paths = MethodChannel('plugins.flutter.io/path_provider');
      const ir = MethodChannel('org.nslabs/irtransmitter');
      messenger.setMockMethodCallHandler(paths, (_) async => dir!.path);
      messenger.setMockMethodCallHandler(
          ir, (_) async => {'hasInternal': true});
      addTearDown(() async {
        state.remotes = oldRemotes;
        messenger.setMockMethodCallHandler(paths, null);
        messenger.setMockMethodCallHandler(ir, null);
        await dir!.delete(recursive: true);
      });
      final remote = Remote(
        id: 1,
        name: 'TV',
        useNewStyle: layout == 'comfort',
        buttons: List.generate(
            3, (i) => IRButton(id: '$i', image: '$i', isImage: false)),
      );
      state.remotes = layout == 'list'
          ? List.generate(3, (i) => Remote(id: i + 1, name: '$i', buttons: []))
          : [remote];
      await tester.pumpWidget(MaterialApp(
        locale: const Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home:
            layout == 'list' ? const RemoteList() : RemoteView(remote: remote),
      ));
      await tester.pumpAndSettle();
      final l10n = await AppLocalizations.delegate.load(const Locale('en'));
      await tester.tap(find.byTooltip(
          layout == 'list' ? l10n.reorderRemotes : l10n.reorderButtons));
      await tester.pumpAndSettle();
      for (final move in [
        (0, 1, ['1', '0', '2']),
        (0, 2, ['0', '2', '1']),
        (2, 0, ['1', '0', '2']),
        (1, 1, ['1', '0', '2'])
      ]) {
        final grid = tester
            .widget<ReorderableGridView>(find.byType(ReorderableGridView));
        // Exercise the callback contract used by the installed grid package.
        await tester.runAsync(() async {
          await (grid.onReorder as dynamic)(move.$1, move.$2);
        });
        await tester.pumpAndSettle();
        final saved = await tester.runAsync(readRemotes);
        final ids = layout == 'list'
            ? state.remotes.map((r) => r.name).toList()
            : remote.buttons.map((b) => b.id).toList();
        final savedIds = layout == 'list'
            ? saved!.map((r) => r.name).toList()
            : saved!.single.buttons.map((b) => b.id).toList();
        expect(ids, move.$3);
        expect(savedIds, move.$3);
      }
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
