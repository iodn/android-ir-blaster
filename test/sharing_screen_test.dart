import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/sharing/share_package.dart';
import 'package:irblaster_controller/sharing/sharing_screen.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/state/macros_state.dart' as macros;
import 'package:irblaster_controller/utils/remote.dart';

void main() {
  final calls = <MethodCall>[];
  final remote = Remote(id: 1, name: 'Living room', buttons: [
    const IRButton(
        id: 'power',
        image: 'Power',
        isImage: false,
        frequency: 38000,
        rawData: '9000 4500 560 560'),
  ]);
  final macro = TimedMacro(
      id: 'm', name: 'Movie night', remoteName: 'Living room', steps: []);
  final package =
      SharePackage(remotes: [remote], macros: [macro], macroRemotes: [0]);
  Widget app(Widget child, {double scale = 1}) => MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(scale)),
            child: child!),
        home: child,
      );
  setUp(() {
    state.remotes = [remote];
    macros.macros = [macro];
    calls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(remoteSharingChannel, (call) async {
      calls.add(call);
      return null;
    });
  });
  testWidgets('macro preview does not transmit, import or share automatically',
      (tester) async {
    await tester.pumpWidget(
        app(ShareScreen(receiving: true, prepare: () async => package)));
    await tester.pumpAndSettle();
    expect(find.text('Movie night'), findsOneWidget);
    expect(find.text('Living room'), findsOneWidget);
    expect(find.text('Add copies'), findsOneWidget);
    expect(state.remotes.length, 1);
    expect(macros.macros.length, 1);
    expect(calls, isEmpty);
  });
  testWidgets(
      'share sends a self-contained macro attachment only after tapping',
      (tester) async {
    await tester.pumpWidget(app(ShareScreen(prepare: () async => package)));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
        find.text('Share with another device'), 200);
    await tester.tap(find.text('Share with another device'));
    await tester.pumpAndSettle();
    expect(calls.single.method, 'share');
    final sent = SharePackage.decode(calls.single.arguments['text'] as String);
    expect(sent.macros.single.name, macro.name);
    expect(sent.remotes.single.buttons.single.rawData,
        remote.buttons.single.rawData);
  });
  testWidgets(
      'hub and preview remain scrollable on compact phones with large text',
      (tester) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(app(const SharingScreen(), scale: 2));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Movie night'), 180);
    expect(tester.takeException(), isNull);
    await tester
        .pumpWidget(app(ShareScreen(prepare: () async => package), scale: 2));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Show QR code'), 200);
    expect(tester.takeException(), isNull);
  });
  testWidgets('invalid transfer cannot be imported', (tester) async {
    await tester.pumpWidget(app(ShareScreen(
        receiving: true, prepare: () async => throw const FormatException())));
    await tester.pumpAndSettle();
    expect(find.text('Add copies'), findsNothing);
    expect(state.remotes.length, 1);
    expect(calls, isEmpty);
  });
}
