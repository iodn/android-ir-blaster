import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/state/last_action_strip.dart';
import 'package:irblaster_controller/utils/remote_grid_layout.dart';
import 'package:irblaster_controller/widgets/create_button.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_custom_grid.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_draft.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_grid_button.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_layout_picker.dart';
import 'package:irblaster_controller/widgets/remote_studio_screen.dart';
import 'package:irblaster_controller/widgets/remote_setup_screen.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_settings_sheet.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:irblaster_controller/widgets/remote_list.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:shared_preferences/shared_preferences.dart';

const power = IRButton(id: 'power', image: 'Power', isImage: false, code: 123);
const zero = IRButton(id: 'zero', image: '0', isImage: false, code: 456);
Remote remote() => Remote(
    id: 10,
    name: 'TV',
    buttons: [power, zero],
    gridLayout: RemoteGridLayout(columns: 3, cells: ['power', null, 'zero']));
Widget app(Widget home, {Locale locale = const Locale('en')}) => MaterialApp(
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: home,
    );
RemoteGridLayout grid(WidgetTester tester) =>
    tester.widget<RemoteCustomGrid>(find.byType(RemoteCustomGrid)).layout;

void main() {
  final sends = <MethodCall>[];
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    sends.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('org.nslabs/irtransmitter'), (call) async {
      if (call.method.startsWith('transmit')) sends.add(call);
      if (call.method == 'performHaptic') return true;
      if (call.method == 'getTransmitterCapabilities') {
        return {'hasInternal': true};
      }
      return null;
    });
  });

  tearDown(clearLastAction);

  testWidgets('tap to move, drag to swap, empty rows and Undo', (tester) async {
    final original = remote();
    await tester.pumpWidget(app(RemoteStudioScreen(
        initialDraft: RemoteEditorDraft.fromRemote(original))));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Arrange layout'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('power')));
    await tester.tap(find.byKey(const ValueKey('empty-cell-1')));
    await tester.pumpAndSettle();
    expect(grid(tester).cells, [null, 'power', 'zero']);
    await tester.tap(find.text('Undo'));
    await tester.pumpAndSettle();
    expect(grid(tester).cells, ['power', null, 'zero']);
    final gesture = await tester
        .startGesture(tester.getCenter(find.byKey(const ValueKey('power'))));
    await tester.pump(const Duration(milliseconds: 600));
    await gesture.moveTo(tester.getCenter(find.byKey(const ValueKey('zero'))));
    await tester.pump();
    await gesture.up();
    await tester.pumpAndSettle();
    expect(grid(tester).cells, ['zero', null, 'power']);
    await tester.tap(find.text('Add empty row'));
    await tester.pumpAndSettle();
    expect(grid(tester).cells, ['zero', null, 'power', null, null, null]);
    await tester.tap(find.text('Undo'));
    await tester.pumpAndSettle();
    expect(grid(tester).cells.length, 3);
    expect(original.gridLayout!.cells, ['power', null, 'zero']);
    expect(sends, isEmpty);
  });

  testWidgets('new buttons can fill a chosen gap without moving neighbors',
      (tester) async {
    await tester.pumpWidget(app(RemoteStudioScreen(
        initialDraft: RemoteEditorDraft.fromRemote(remote()))));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('empty-cell-1')));
    await tester.pumpAndSettle();
    expect(find.byType(CreateButton), findsOneWidget);
    Navigator.of(tester.element(find.byType(CreateButton))).pop(
        const IRButton(id: 'new', image: 'New', isImage: false, code: 789));
    await tester.pumpAndSettle();
    expect(grid(tester).cells, ['power', 'new', 'zero']);
    expect(sends, isEmpty);
  });

  testWidgets('Save returns the layout; backing out can discard it',
      (tester) async {
    Remote? saved;
    await tester.pumpWidget(app(Builder(
        builder: (context) => Scaffold(
              body: TextButton(
                  onPressed: () async {
                    saved = await Navigator.of(context).push<Remote>(
                        MaterialPageRoute(
                            builder: (_) => RemoteStudioScreen(
                                initialDraft:
                                    RemoteEditorDraft.fromRemote(remote()))));
                  },
                  child: const Text('Open')),
            ))));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add empty row'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(TextButton, 'Save'));
    await tester.pumpAndSettle();
    expect(saved!.gridLayout!.cells.length, 6);
    expect(saved!.buttons.length, 2);
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add empty row'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.tap(find.text('Discard'));
    await tester.pumpAndSettle();
    expect(saved, isNull);
  });

  testWidgets(
      'deleting a custom button leaves its cell empty and Undo restores it',
      (tester) async {
    await tester.pumpWidget(app(RemoteStudioScreen(
        initialDraft: RemoteEditorDraft.fromRemote(remote()))));
    await tester.pumpAndSettle();
    await tester.longPress(find.byKey(const ValueKey('power')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Remove'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Remove'));
    await tester.pumpAndSettle();
    expect(grid(tester).cells, [null, null, 'zero']);
    expect(find.byType(RemoteGridButton), findsOneWidget);
    await tester.tap(find.text('Undo'));
    await tester.pumpAndSettle();
    expect(grid(tester).cells, ['power', null, 'zero']);
    expect(find.byType(RemoteGridButton), findsNWidgets(2));
  });

  testWidgets(
      'normal use sends real buttons only and retains long-press actions',
      (tester) async {
    await tester.pumpWidget(app(RemoteView(remote: remote())));
    await tester.pumpAndSettle();
    expect(find.byType(RemoteGridButton), findsNWidgets(2));
    expect(find.byKey(const ValueKey('empty-cell-1')), findsNothing);
    final a = tester.getCenter(find.byKey(const ValueKey('power')));
    final b = tester.getCenter(find.byKey(const ValueKey('zero')));
    await tester.tapAt(Offset((a.dx + b.dx) / 2, a.dy));
    await tester.pumpAndSettle();
    expect(sends, isEmpty);
    await tester.tap(find.byKey(const ValueKey('power')));
    await tester.pumpAndSettle();
    expect(sends.length, 1);
    await tester.longPress(find.byKey(const ValueKey('power')));
    await tester.pumpAndSettle();
    expect(find.byType(BottomSheet), findsOneWidget);
    final labels = tester
        .widgetList<ListTile>(find.descendant(
            of: find.byType(BottomSheet), matching: find.byType(ListTile)))
        .map((tile) => (tile.title as Text?)?.data)
        .toList();
    final l = AppLocalizations.of(tester.element(find.byType(RemoteView)))!;
    expect(labels.indexOf(l.shareTitle), labels.indexOf(l.addHomeWidget) + 1);
    expect(sends.length, 1);
    clearLastAction();
  });

  testWidgets('remote list and remote screen place sharing after pin',
      (tester) async {
    final previous = state.remotes;
    state.remotes = [remote()];
    addTearDown(() => state.remotes = previous);
    for (final screen in [
      const RemoteList(),
      RemoteView(remote: state.remotes.single)
    ]) {
      await tester.pumpWidget(app(screen));
      await tester.pumpAndSettle();
      if (screen is RemoteList) {
        await tester.longPress(find.text('TV').first);
      } else {
        await tester.tap(find.byIcon(Icons.more_vert_rounded));
      }
      await tester.pumpAndSettle();
      final l = AppLocalizations.of(tester.element(find.byType(BottomSheet)))!;
      final labels = tester
          .widgetList<ListTile>(find.descendant(
              of: find.byType(BottomSheet), matching: find.byType(ListTile)))
          .map((tile) => (tile.title as Text?)?.data)
          .toList();
      expect(labels.indexOf(l.pinRemote), greaterThanOrEqualTo(0));
      expect(labels.indexOf(l.shareTitle), labels.indexOf(l.pinRemote) + 1);
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    }
  });

  testWidgets('columns and shapes are independent with a live preview',
      (tester) async {
    var style = RemoteLayoutStyle.compact;
    RemoteGridLayout? layout;
    await tester.pumpWidget(app(StatefulBuilder(
        builder: (context, setState) => Scaffold(
                body: SingleChildScrollView(
                    child: RemoteLayoutPicker(
              style: style,
              grid: layout,
              onChanged: (nextStyle, nextGrid) => setState(() {
                style = nextStyle;
                layout = nextGrid;
              }),
            ))))));
    await tester.tap(find.text('Custom'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('5'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Circle'));
    await tester.pumpAndSettle();
    expect(layout!.columns, 5);
    expect(layout!.shape, RemoteButtonShape.circle);
    expect(tester.takeException(), isNull);
  });

  testWidgets('create setup returns the chosen custom layout', (tester) async {
    RemoteEditorDraft? result;
    await tester.pumpWidget(app(Builder(
        builder: (context) => Scaffold(
              body: TextButton(
                  onPressed: () async {
                    result = await Navigator.of(context)
                        .push<RemoteEditorDraft>(MaterialPageRoute(
                            builder: (_) => const RemoteSetupScreen()));
                  },
                  child: const Text('Open')),
            ))));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Custom'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Custom'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('5'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('5'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Circle'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Circle'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(result!.layoutStyle, RemoteLayoutStyle.custom);
    expect(result!.gridLayout!.columns, 5);
    expect(result!.gridLayout!.shape, RemoteButtonShape.circle);
    expect(result!.buttons, isEmpty);
  });

  testWidgets('editing layout settings preserves button positions',
      (tester) async {
    await tester.pumpWidget(app(RemoteStudioScreen(
        initialDraft: RemoteEditorDraft.fromRemote(remote()))));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Edit remote'));
    await tester.pumpAndSettle();
    expect(find.byType(RemoteSettingsSheet), findsOneWidget);
    await tester.tap(find.text('2'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Rectangle'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Rectangle'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Done'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();
    expect(grid(tester).columns, 2);
    expect(grid(tester).shape, RemoteButtonShape.rectangle);
    expect(grid(tester).cells, ['power', null, 'zero', null]);
  });

  testWidgets('six columns keep touch sizes and physical positions in RTL',
      (tester) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 1.5;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    final r = remote()
      ..gridLayout = RemoteGridLayout(
          columns: 6,
          shape: RemoteButtonShape.rectangle,
          cells: ['power', null, 'zero', null, null, null]);
    await tester.pumpWidget(app(
        RemoteStudioScreen(initialDraft: RemoteEditorDraft.fromRemote(r)),
        locale: const Locale('ar')));
    await tester.pumpAndSettle();
    final size = tester.getSize(find.byKey(const ValueKey('power')));
    expect(size.width, greaterThanOrEqualTo(48));
    expect(size.height, greaterThanOrEqualTo(48));
    expect(tester.getCenter(find.byKey(const ValueKey('power'))).dx,
        lessThan(tester.getCenter(find.byKey(const ValueKey('zero'))).dx));
    expect(grid(tester).columns, 6);
    expect(tester.takeException(), isNull);
  });

  for (final locale in [const Locale('de'), const Locale('ar')]) {
    for (final size in [const Size(320, 568), const Size(568, 320)]) {
      testWidgets('layout choices fit $locale at $size with large text',
          (tester) async {
        tester.view.physicalSize = size;
        tester.view.devicePixelRatio = 1;
        tester.platformDispatcher.textScaleFactorTestValue = 1.8;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
        await tester.pumpWidget(app(
            Scaffold(
                body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: RemoteLayoutPicker(
                    style: RemoteLayoutStyle.custom,
                    grid: RemoteGridLayout(columns: 6),
                    onChanged: (_, __) {},
                  )),
            )),
            locale: locale));
        await tester.pumpAndSettle();
        await tester.drag(
            find.byType(SingleChildScrollView), const Offset(0, -1400));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      });
    }
  }
}
