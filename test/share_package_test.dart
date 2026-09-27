import 'dart:convert';
import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/sharing/share_package.dart';
import 'package:irblaster_controller/models/macro_step.dart';
import 'package:irblaster_controller/models/timed_macro.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remote_grid_layout.dart';

void main() {
  IRButton button(String id) => IRButton(
      id: id,
      image: 'Power',
      isImage: false,
      rawData: '9000 4500 560 560 560 1690',
      frequency: 38000,
      iconColor: 0xffff0000,
      buttonColor: 0xff123456);
  Remote remote() => Remote(
      id: 4,
      name: 'Fan',
      buttons: [button('old')],
      gridLayout: RemoteGridLayout(
          columns: 3,
          shape: RemoteButtonShape.circle,
          cells: [null, 'old', null]));

  test('JSON and QR preserve learned timings, colors and blank layout cells',
      () {
    final source = SharePackage(remotes: [remote()]);
    for (final text in [source.encode(), source.qrText()!]) {
      final restored = SharePackage.decode(text).remotes.single;
      expect(restored.toJson(), source.remotes.single.toJson());
    }
  });

  test('macro dependencies remap together and preserve delay/manual steps', () {
    final macro =
        TimedMacro(id: 'm', name: 'Evening', remoteName: 'Fan', steps: [
      const MacroStep(id: 's1', type: MacroStepType.send, buttonId: 'old'),
      const MacroStep(id: 's2', type: MacroStepType.delay, delayMs: 2500),
      const MacroStep(id: 's3', type: MacroStepType.manualContinue),
    ]);
    final source =
        SharePackage(remotes: [remote()], macros: [macro], macroRemotes: [0]);
    final decoded = SharePackage.decode(source.qrText()!);
    final fresh = decoded.freshCopies([remote()], [macro], {});
    final r = fresh.remotes.single;
    final m = fresh.macros.single;
    expect(r.name, 'Fan (2)');
    expect(r.id, 5);
    expect(m.name, 'Evening (2)');
    expect(m.remoteName, r.name);
    expect(m.steps.first.buttonId, r.buttons.single.id);
    expect(m.steps[1].delayMs, 2500);
    expect(m.steps.last.type, MacroStepType.manualContinue);
    expect(r.buttons.single.id, isNot('old'));
    expect(r.gridLayout!.cells, [null, r.buttons.single.id, null]);
    final again =
        decoded.freshCopies([...fresh.remotes, remote()], [macro], {});
    expect(again.remotes.single.name, 'Fan (3)');
    expect(again.remotes.single.buttons.single.id, isNot(r.buttons.single.id));
  });

  test('shared images are references, never trusted filesystem paths', () {
    final raw = jsonDecode(SharePackage(remotes: [remote()]).encode());
    raw['remotes'][0]['buttons'][0]['isImage'] = true;
    for (final path in [
      '/data/data/private/file',
      'https://example.com/image',
      '../secret'
    ]) {
      raw['remotes'][0]['buttons'][0]['image'] = path;
      expect(() => SharePackage.decode(jsonEncode(raw)), throwsFormatException);
    }
  });

  test('new imported images use receiver paths and leave source unchanged', () {
    final r = Remote(
        name: 'Photos',
        buttons: [button('old').copyWith(image: 'shared:0', isImage: true)]);
    final copy = SharePackage(remotes: [r])
        .freshCopies([], [], {'shared:0': '/receiver/image.png'});
    expect(copy.remotes.single.buttons.single.image, '/receiver/image.png');
    expect(r.buttons.single.image, 'shared:0');
  });

  test(
      'reject unknown schema, version, missing dependencies and invalid step types',
      () {
    final macro = TimedMacro(id: 'm', name: 'M', remoteName: 'Fan', steps: [
      const MacroStep(id: 's', type: MacroStepType.send, buttonId: 'old')
    ]);
    final source =
        SharePackage(remotes: [remote()], macros: [macro], macroRemotes: [0])
            .encode();
    for (final mutate in <void Function(dynamic)>[
      (v) => v['version'] = 999,
      (v) => v['schema'] = 'notours',
      (v) => v['macros'][0]['remote'] = 100,
      (v) => v['macros'][0]['macro']['steps'][0]['buttonId'] = 'missing',
      (v) => v['macros'][0]['macro']['steps'][0]['type'] = 'execute',
      (v) => v['remotes'][0]['gridLayout']['cells'] = ['unknown'],
      (v) => v['remotes'][0]['gridLayout']['cells'] = ['old', 'old'],
      (v) => v['remotes'][0]['buttons'].add(v['remotes'][0]['buttons'][0]),
      (v) => v['remotes'][0]['buttons'][0]['id'] = ' ',
      (v) => v['remotes'][0]['buttons'][0]['iconCodePoint'] = -1,
      (v) {
        final button = v['remotes'][0]['buttons'][0];
        button['rawData'] = null;
        button['code'] = null;
        button['protocol'] = ' ';
      },
      (v) =>
          v['remotes'][0]['buttons'][0]['protocolParams'] = {'rawPreview': 42},
    ]) {
      final raw = jsonDecode(source);
      mutate(raw);
      expect(() => SharePackage.decode(jsonEncode(raw)), throwsFormatException);
    }
  });

  test('reject oversized, malformed, deeply nested and unrelated QR input', () {
    for (final input in [
      'https://example.org',
      'IRBLASTER:1:%%%',
      'IRBLASTER:2:abcd',
      'x' * (SharePackage.maxBytes + 1),
      '${'[' * 30}0${']' * 30}'
    ]) {
      expect(() => SharePackage.decode(input), throwsFormatException);
    }
  });

  test('large collection keeps complete file while declining dense QR', () {
    final random = Random(1);
    final buttons = List.generate(
        200,
        (i) => button('$i').copyWith(
            rawData: List.generate(150, (_) => 100 + random.nextInt(10000))
                .join(' ')));
    final source =
        SharePackage(remotes: [Remote(name: 'Large', buttons: buttons)]);
    expect(source.qrText(), isNull);
    expect(SharePackage.decode(source.encode()).remotes.single.buttons.length,
        200);
  });

  test('LG opaque signals always show hardware compatibility warning', () {
    final r = Remote(name: 'LG', buttons: [
      const IRButton(
          id: 'b',
          image: 'Power',
          isImage: false,
          protocol: ' lge_ir_learned ',
          protocolParams: {'rawPreview': '123', 'opaqueFrameBase64': 'AQID'})
    ]);
    expect(
        SharePackage.decode(SharePackage(remotes: [r]).encode())
            .hardwareSpecific,
        isTrue);
  });
}
