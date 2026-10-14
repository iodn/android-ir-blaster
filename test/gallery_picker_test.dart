import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/create_button.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const pickerChannel = MethodChannel('plugins.flutter.io/image_picker');
  const pathChannel = MethodChannel('plugins.flutter.io/path_provider');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late Completer<String?> pending;
  late int calls;

  setUp(() {
    calls = 0;
    pending = Completer<String?>();
    messenger.setMockMethodCallHandler(pickerChannel, (call) {
      expect(call.method, 'pickImage');
      calls++;
      return pending.future;
    });
  });
  tearDown(() {
    messenger.setMockMethodCallHandler(pickerChannel, null);
    messenger.setMockMethodCallHandler(pathChannel, null);
  });

  test(
      'concurrent requests do not open a second native picker; cancel permits retry',
      () async {
    final first = getImage();
    expect(await getImage(), isNull);
    pending.complete(null);
    expect(await first, isNull);
    expect(calls, 1);
    pending = Completer<String?>()..complete(null);
    expect(await getImage(), isNull);
    expect(calls, 2);
  });

  test('picker error releases the shared guard', () async {
    pending.completeError(PlatformException(code: 'already_active'));
    await expectLater(getImage(), throwsA(isA<PlatformException>()));
    pending = Completer<String?>()..complete(null);
    expect(await getImage(), isNull);
    expect(calls, 2);
  });

  test(
      'successful selection copies the image; copy failure still permits retry',
      () async {
    final dir = await Directory.systemTemp.createTemp('gallery-test-');
    addTearDown(() => dir.delete(recursive: true));
    final saved = await Directory('${dir.path}/saved').create();
    final image = await File('${dir.path}/image.png').writeAsBytes([1, 2, 3]);
    messenger.setMockMethodCallHandler(pathChannel, (_) async => saved.path);
    pending.complete(image.path);
    expect(await getImage(), '${saved.path}/image.png');
    expect(await File('${saved.path}/image.png').readAsBytes(), [1, 2, 3]);
    pending = Completer<String?>()..complete('${dir.path}/missing.png');
    await expectLater(getImage(), throwsA(isA<FileSystemException>()));
    pending = Completer<String?>()..complete(null);
    expect(await getImage(), isNull);
  });

  Future<void> openEditor(WidgetTester tester) async {
    // Create the native response in the widget test's fake-async zone.
    pending = Completer<String?>();
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CreateButton(
          button: IRButton(
        id: 'test',
        image: 'assets/COOL.png',
        isImage: true,
        code: 0x00FF01FE,
      )),
    ));
    await tester.pumpAndSettle();
  }

  FilledButton gallery(WidgetTester tester) => tester.widget<FilledButton>(find
      .ancestor(of: find.text('Gallery'), matching: find.byType(FilledButton)));

  for (final error in [null, 'already_active', 'photo_access_denied']) {
    testWidgets(
        'gallery handles ${error ?? 'cancel'} and permits retry without a crash',
        (tester) async {
      await openEditor(tester);
      final tap = gallery(tester).onPressed!;
      tap();
      tap(); // Two events before a frame rebuild.
      await tester.pump();
      expect(calls, 1);
      expect(gallery(tester).onPressed, isNull);
      if (error == null) {
        pending.complete(null);
      } else {
        pending.completeError(PlatformException(code: error));
      }
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(gallery(tester).onPressed, isNotNull);
      expect(
          find.byType(SnackBar), error == null ? findsNothing : findsOneWidget);
      pending = Completer<String?>()..complete(null);
      gallery(tester).onPressed!();
      await tester.pumpAndSettle();
      expect(calls, 2);
      await tester.pumpWidget(const SizedBox());
    });
  }

  testWidgets(
      'picker completion after leaving editor does not update disposed state',
      (tester) async {
    await openEditor(tester);
    gallery(tester).onPressed!();
    await tester.pump();
    await tester.pumpWidget(const SizedBox());
    pending.completeError(PlatformException(code: 'already_active'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    pending = Completer<String?>()..complete(null);
    expect(await getImage(), isNull);
  });
}
