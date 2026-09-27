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
  });
}
