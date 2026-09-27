import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/sharing/share_package.dart';
import 'package:irblaster_controller/sharing/share_transfer.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/macros_io.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/state/macros_state.dart' as macro_state;
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote_grid_layout.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory dir;
  const b = IRButton(
      id: 'original',
      image: 'Power',
      isImage: false,
      frequency: 38000,
      rawData: '9000 4500 560 560');
  setUp(() async {
    dir = await Directory.systemTemp.createTemp('ir-sharing-test');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('plugins.flutter.io/path_provider'),
            (_) async => dir.path);
    state.remotes = [
      Remote(id: 12, name: 'Existing', buttons: [b])
    ];
    macro_state.macros = [];
    await writeRemotelist(state.remotes);
  });
  tearDown(() async {
    await dir.delete(recursive: true);
  });

  test(
      'Classic, Comfort and custom layouts preserve all supported signal metadata',
      () async {
    final buttons = [
      b,
      b.copyWith(id: 'asset', isImage: true, image: defaultImages.first),
      b.copyWith(
          id: 'icon',
          image: '',
          iconCodePoint: 0xe8ac,
          iconFontFamily: 'MaterialIcons',
          iconColor: 0xffff0000),
      const IRButton(id: 'hex', image: 'Power', isImage: false, code: 0xFF01FE),
      for (final definition in IrProtocolRegistry.allDefinitions())
        IRButton(
            id: definition.id,
            image: definition.displayName,
            isImage: false,
            protocol: definition.id,
            frequency: definition.defaultFrequencyHz,
            protocolParams: {
              for (final field in definition.fields)
                if (field.defaultValue != null) field.id: field.defaultValue,
              'rawPreview': '9000 4500 560 560',
            }),
    ];
    for (final remote in [
      Remote(name: 'Classic', buttons: buttons),
      Remote(name: 'Comfort', buttons: buttons, useNewStyle: true),
      Remote(
          name: 'Custom',
          buttons: buttons,
          gridLayout: RemoteGridLayout(
              columns: 3, cells: [null, ...buttons.map((b) => b.id), null])),
      Remote(name: 'Empty', buttons: []),
    ]) {
      final shared = await prepareShare(remotes: [remote]);
      final decoded = SharePackage.decode(shared.encode());
      expect(decoded.remotes.single.toJson(), remote.toJson(),
          reason: remote.name);
      await importShare(decoded);
      expect(state.remotes.last.buttons.length, remote.buttons.length);
      expect(state.remotes.last.useNewStyle, remote.useNewStyle);
    }
  });

  test('legacy built-in image names share in remotes, buttons and macros',
      () async {
    final buttons = [
      for (final asset in defaultImages)
        b.copyWith(
            id: asset,
            image: asset.substring(7, asset.length - 4),
            isImage: true),
    ];
    final remote = Remote(
        name: 'Legacy Comfort',
        buttons: buttons,
        useNewStyle: true,
        gridLayout: RemoteGridLayout(
            columns: 6, cells: [null, ...buttons.map((b) => b.id), null]));
    final macro = TimedMacro(
        id: 'macro',
        name: 'Power',
        remoteName: remote.name,
        steps: [
          MacroStep(
              id: 'step',
              type: MacroStepType.send,
              buttonId: buttons.first.id)
        ]);
    for (final package in [
      await prepareShare(remotes: [remote]),
      await prepareShare(macros: [macro], available: [remote]),
    ]) {
      expect(package.images, isEmpty);
      expect(package.remotes.single.buttons.map((b) => b.image), defaultImages);
      expect(package.remotes.single.gridLayout!.cells, remote.gridLayout!.cells);
      for (var i = 0; i < buttons.length; i++) {
        expect(package.remotes.single.buttons[i].toJson(),
            buttons[i].copyWith(image: defaultImages[i]).toJson());
      }
      await importShare(package);
      expect(state.remotes.last.buttons.map((b) => b.image), defaultImages);
    }
    final single = await prepareShare(button: buttons.first);
    expect(single.remotes.single.buttons.single.image, defaultImages.first);
    expect(buttons.first.image, 'ON');
    final text = await prepareShare(button: b.copyWith(image: 'ON'));
    expect(text.remotes.single.buttons.single.image, 'ON');
  });

  test('legacy blank and padded protocol identifiers share like they replay',
      () async {
    for (final protocol in ['', '   ', ' nec ']) {
      final button = IRButton(
          id: 'legacy',
          image: 'Power',
          isImage: false,
          code: 0xFF01FE,
          protocol: protocol,
          protocolParams: const {'hex': '00FF01FE'});
      final before = previewIRButton(button);
      final package = await prepareShare(button: button, buttonName: 'Power');
      final restored = package.remotes.single.buttons.single;
      expect(restored.toJson(), button.toJson());
      expect(previewIRButton(restored).pattern, before.pattern);
    }
  });

  test('prepare macro includes its remote and rejects missing dependencies',
      () async {
    final macro =
        TimedMacro(id: 'm', name: 'Sequence', remoteName: 'Existing', steps: [
      const MacroStep(id: 's', type: MacroStepType.send, buttonId: 'original')
    ]);
    final package =
        await prepareShare(macros: [macro], available: state.remotes);
    expect(package.remotes.single.buttons.single.rawData, b.rawData);
    expect(package.macros.single.steps.single.buttonId, b.id);
    await expectLater(
        prepareShare(macros: [macro], available: []), throwsFormatException);
    await expectLater(
        prepareShare(macros: [
          macro
        ], available: [
          ...state.remotes,
          Remote(name: 'Existing', buttons: [b]),
        ]),
        throwsFormatException);
    final broken = macro.copyWith(steps: [
      const MacroStep(id: 's', type: MacroStepType.send, buttonId: 'missing')
    ]);
    await expectLater(prepareShare(macros: [broken], available: state.remotes),
        throwsFormatException);
  });

  test(
      'import persists dependencies and usable macro references without replacing existing',
      () async {
    final macro =
        TimedMacro(id: 'm', name: 'Sequence', remoteName: 'Existing', steps: [
      const MacroStep(id: 's', type: MacroStepType.send, buttonId: 'original')
    ]);
    final package =
        await prepareShare(macros: [macro], available: state.remotes);
    await importShare(package);
    final persisted = await readRemotes();
    final persistedMacros = await readMacros();
    expect(persisted.length, 2);
    expect(persisted.first.buttons.single.id, b.id);
    expect(persistedMacros.single.remoteName, persisted.last.name);
    expect(persistedMacros.single.steps.single.buttonId,
        persisted.last.buttons.single.id);
    expect(state.remotes.length, 2);
  });

  test('single button can be added to chosen remote with a fresh id', () async {
    final original = state.remotes.single;
    final package = await prepareShare(button: b, buttonName: 'Power');
    await importShare(package, destination: original);
    expect(state.remotes.length, 1);
    expect(state.remotes.single.id, original.id);
    expect(state.remotes.single.buttons.length, 2);
    expect(state.remotes.single.buttons.last.id, isNot(b.id));
    expect((await readRemotes()).single.buttons.length, 2);
  });

  test('failed macro save rolls back remote dependencies', () async {
    final macro =
        TimedMacro(id: 'm', name: 'M', remoteName: 'Existing', steps: []);
    final package =
        await prepareShare(macros: [macro], available: state.remotes);
    await Directory('${dir.path}/macros.json.tmp').create();
    await expectLater(
        importShare(package), throwsA(isA<FileSystemException>()));
    expect(state.remotes.length, 1);
    expect((await readRemotes()).length, 1);
    expect(macro_state.macros, isEmpty);
  });

  test('custom image is carried as bytes and recreated on recipient', () async {
    final image = File('${dir.path}/original.png');
    final recorder = ui.PictureRecorder();
    ui.Canvas(recorder).drawColor(const ui.Color(0xFFFF0000), ui.BlendMode.src);
    final picture = recorder.endRecording();
    final bitmap = await picture.toImage(2, 2);
    final png = await bitmap.toByteData(format: ui.ImageByteFormat.png);
    await image.writeAsBytes(png!.buffer.asUint8List());
    bitmap.dispose();
    picture.dispose();
    final package = await prepareShare(
        button: b.copyWith(isImage: true, image: image.path),
        buttonName: 'Picture');
    expect(package.images.length, 1);
    expect(package.remotes.single.buttons.single.image, 'shared:0');
    await importShare(SharePackage.decode(package.encode()));
    final path = state.remotes.last.buttons.single.image;
    expect(path, isNot(image.path));
    expect(await File(path).exists(), isTrue);

    final comfort = Remote(name: 'Photo remote', useNewStyle: true, buttons: [
      b.copyWith(isImage: true, image: image.path),
      b.copyWith(id: 'second', isImage: true, image: image.path),
    ]);
    final macro = TimedMacro(
        id: 'photos',
        name: 'Photo macro',
        remoteName: comfort.name,
        steps: [
          MacroStep(id: 'send', type: MacroStepType.send, buttonId: b.id),
        ]);
    final shared = await prepareShare(
        remotes: [comfort], macros: [macro], available: [comfort]);
    expect(shared.images.length, 1);
    expect(shared.remotes.length, 1);
    await importShare(SharePackage.decode(shared.encode()));
    final imported = state.remotes.last;
    expect(imported.useNewStyle, isTrue);
    expect(imported.buttons.first.image, imported.buttons.last.image);
    expect(await File(imported.buttons.first.image).exists(), isTrue);
    expect(macro_state.macros.last.steps.single.buttonId,
        imported.buttons.first.id);
  });

  test('missing and corrupt images fail without altering existing remotes',
      () async {
    final previous = state.remotes.single.toJson();
    final corrupt = File('${dir.path}/corrupt.png');
    await corrupt.writeAsString('not an image');
    for (final path in ['${dir.path}/missing.png', corrupt.path]) {
      await expectLater(
          prepareShare(
              button: b.copyWith(isImage: true, image: path),
              buttonName: 'Image'),
          throwsException);
      expect(state.remotes.single.toJson(), previous);
      expect((await readRemotes()).single.toJson(), previous);
    }
  });
}
