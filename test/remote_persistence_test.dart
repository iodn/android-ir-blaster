import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/utils/remote.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory dir;
  const channel = MethodChannel('plugins.flutter.io/path_provider');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  Remote remote(String name) => Remote(id: 1, name: name, buttons: []);

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('remote-persistence-');
    messenger.setMockMethodCallHandler(channel, (_) async => dir.path);
  });
  tearDown(() async {
    messenger.setMockMethodCallHandler(channel, null);
    await dir.delete(recursive: true);
  });

  test('save snapshots mutable input before path lookup', () async {
    final input = [remote('Original')];
    final saving = writeRemotelist(input);
    input.clear();
    await saving;
    expect((await readRemotes()).single.name, 'Original');
  });

  test('a delayed older save cannot overwrite a newer save', () async {
    final started = Completer<void>();
    final release = Completer<String>();
    var calls = 0;
    messenger.setMockMethodCallHandler(channel, (_) async {
      if (++calls == 1) {
        started.complete();
        return release.future;
      }
      return dir.path;
    });
    final first = writeRemotelist([remote('Old')]);
    await started.future;
    final second = writeRemotelist([remote('New')]);
    // Drain pending callbacks: a queued save must not start its path lookup.
    await Future<void>.delayed(Duration.zero);
    final lookupsWhileBlocked = calls;
    release.complete(dir.path);
    await Future.wait([first, second]);
    expect(lookupsWhileBlocked, 1);
    expect((await readRemotes()).single.name, 'New');
  });

  test('failed replacement preserves the saved file and permits retry',
      () async {
    await writeRemotelist([remote('Original')]);
    final obstruction =
        await Directory('${dir.path}/remotes.json.tmp').create();
    await expectLater(
        writeRemotelist([remote('Lost')]), throwsA(isA<FileSystemException>()));
    expect((await readRemotes()).single.name, 'Original');
    await obstruction.delete();
    await writeRemotelist([remote('Recovered')]);
    expect((await readRemotes()).single.name, 'Recovered');
    expect(await File('${dir.path}/remotes.json.tmp').exists(), isFalse);
  });
}
