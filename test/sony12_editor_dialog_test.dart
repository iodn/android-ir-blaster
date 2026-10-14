import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/create_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('SONY12 code dialog survives keyboard changes during dismissal',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(
      locale: Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: CreateButton(
        button: IRButton(
          id: 'sony',
          image: 'Power',
          isImage: false,
          protocol: 'sony12',
          protocolParams: {'address': 1, 'command': 2},
        ),
      ),
    ));
    await tester.pumpAndSettle();
    for (var i = 0; i < 2; i++) {
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
    }
    final edit = find.text('Edit Code of the button');
    await tester.ensureVisible(edit);
    await tester.pumpAndSettle();
    await tester.tap(edit);
    await tester.pumpAndSettle();
    final dialog = find.byType(AlertDialog);
    await tester.enterText(
        find.descendant(of: dialog, matching: find.byType(TextField)), 'A90');
    await tester.tap(find.descendant(of: dialog, matching: find.text('Save')));
    await tester.pump();
    tester.view.viewInsets = const FakeViewPadding(bottom: 100);
    addTearDown(tester.view.resetViewInsets);
    await tester.pump();
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(dialog, findsNothing);
    tester.view.resetViewInsets();
    await tester.pumpAndSettle();
    await tester.ensureVisible(edit);
    await tester.pumpAndSettle();
    await tester.tap(edit);
    await tester.pumpAndSettle();
    final input = tester.widget<TextField>(
        find.descendant(of: dialog, matching: find.byType(TextField)));
    expect(input.controller!.text, 'A90');
  });
}
