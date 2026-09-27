import 'dart:io';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
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

  testWidgets('send preview offers a focused receive page', (tester) async {
    await tester.pumpWidget(app(ShareScreen(prepare: () async => package)));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(TextButton, 'Receive'));
    await tester.pumpAndSettle();
    expect(find.text('Scan QR code'), findsOneWidget);
    expect(find.text('Open shared file'), findsOneWidget);
    expect(find.byType(CheckboxListTile), findsNothing);
    expect(find.text('Share with another device'), findsNothing);
    expect(calls, isEmpty);
  });

  testWidgets('receive reads content URI files without a local path',
      (tester) async {
    final originalPicker = FilePickerPlatform.instance;
    addTearDown(() => FilePickerPlatform.instance = originalPicker);
    FilePickerPlatform.instance = _ReceiveFilePicker(
        _ContentFile(Uint8List.fromList(utf8.encode(package.encode()))));
    await tester.pumpWidget(app(const SharingScreen(receiveOnly: true)));
    await tester.runAsync(() async {
      await tester.tap(find.text('Open shared file'));
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await tester.pump();
      await Future<void>.delayed(const Duration(seconds: 1));
    });
    await tester.pumpAndSettle();
    expect(find.text('Movie night'), findsOneWidget);
    expect(find.text('Add copies'), findsOneWidget);
    expect(state.remotes.length, 1);
    expect(calls, isEmpty);
  });

  for (final single in [false, true]) {
    testWidgets(
        'scan previews and imports ${single ? 'a button into a chosen remote' : 'a remote copy'}',
        (tester) async {
      final dir = Directory.systemTemp.createTempSync('receive-test');
      addTearDown(() => dir.delete(recursive: true));
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (_) async => dir.path);
      messenger.setMockMethodCallHandler(
          const MethodChannel('flutter.baseflow.com/permissions/methods'),
          (_) async => {1: 1});
      final incoming = SharePackage(remotes: [remote], singleButton: single);
      messenger.setMockMethodCallHandler(remoteSharingChannel, (call) async {
        calls.add(call);
        return call.method == 'scan' ? incoming.qrText() : null;
      });
      await tester.pumpWidget(app(const SharingScreen(receiveOnly: true)));
      await tester.runAsync(() async {
        await tester.tap(find.text('Scan QR code'));
        await Future<void>.delayed(const Duration(milliseconds: 50));
        await tester.pump();
        await Future<void>.delayed(const Duration(seconds: 1));
      });
      await tester.pumpAndSettle();
      expect(calls.single.method, 'scan');
      expect(find.text('Add copies'), findsOneWidget);
      expect(state.remotes.length, 1);
      if (single) {
        await tester.tap(find.byType(DropdownButtonFormField<int>));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Living room').last);
        await tester.pumpAndSettle();
      }
      await tester.runAsync(() async {
        await tester.tap(find.text('Add copies'));
        for (var i = 0; i < 100; i++) {
          if (single
              ? state.remotes.single.buttons.length == 2
              : state.remotes.length == 2) {
            break;
          }
          await Future<void>.delayed(const Duration(milliseconds: 20));
        }
      });
      await tester.pumpAndSettle();
      expect(state.remotes.length, single ? 1 : 2);
      expect(state.remotes.last.buttons.length, single ? 2 : 1);
      expect(state.remotes.last.buttons.last.rawData,
          remote.buttons.single.rawData);
      expect(state.remotes.last.buttons.last.id, isNot('power'));
      expect(calls.length, 1);
    });
  }

  testWidgets('denied camera permission does not start scanning',
      (tester) async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('flutter.baseflow.com/permissions/methods'),
            (_) async => {1: 0});
    await tester.pumpWidget(app(const SharingScreen(receiveOnly: true)));
    await tester.tap(find.text('Scan QR code'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(calls, isEmpty);
    expect(state.remotes.length, 1);
  });
}

class _ReceiveFilePicker extends FilePickerPlatform {
  _ReceiveFilePicker(this.file);
  final PlatformFile file;

  @override
  Future<PlatformFile?> pickFile({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    int compressionQuality = 0,
    AndroidOptions androidOptions = const AndroidOptions(),
    DarwinOptions darwinOptions = const DarwinOptions(),
    WindowsOptions windowsOptions = const WindowsOptions(),
    LinuxOptions linuxOptions = const LinuxOptions(),
    WebOptions webOptions = const WebOptions(),
  }) async =>
      file;
}

final class _ContentFile extends PlatformFile {
  _ContentFile(this.bytes);
  final Uint8List bytes;
  @override
  Uri get uri => Uri.parse('content://documents/shared.json');
  @override
  Stream<Uint8List> readAsByteStream() => Stream.value(bytes);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
