import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import '../models/macro_step.dart';
import '../models/timed_macro.dart';
import '../state/remotes_state.dart' as state;
import '../state/macros_state.dart' as macro_state;
import '../utils/macros_io.dart';
import '../utils/remote.dart';
import 'share_package.dart';

Future<Uint8List> _portableImage(Uint8List bytes) async {
  final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
  ui.ImageDescriptor? descriptor;
  ui.Codec? codec;
  ui.Image? image;
  try {
    descriptor = await ui.ImageDescriptor.encoded(buffer);
    if (descriptor.width <= 0 ||
        descriptor.height <= 0 ||
        descriptor.width > 30000 ||
        descriptor.height > 30000) {
      throw const FormatException('Invalid image dimensions');
    }
    final scale = 512 /
        (descriptor.width > descriptor.height
            ? descriptor.width
            : descriptor.height);
    codec = await descriptor.instantiateCodec(
        targetWidth: scale < 1
            ? (descriptor.width * scale).round().clamp(1, 512)
            : descriptor.width,
        targetHeight: scale < 1
            ? (descriptor.height * scale).round().clamp(1, 512)
            : descriptor.height);
    image = (await codec.getNextFrame()).image;
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    if (data == null || data.lengthInBytes > 1024 * 1024) {
      throw const FormatException('Image too large');
    }
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  } finally {
    image?.dispose();
    codec?.dispose();
    descriptor?.dispose();
    buffer.dispose();
  }
}

Future<SharePackage> prepareShare(
    {List<Remote> remotes = const [],
    List<TimedMacro> macros = const [],
    List<Remote> available = const [],
    IRButton? button,
    String? buttonName}) async {
  final selected = remotes.toList();
  if (button != null) {
    selected.add(Remote(name: buttonName ?? button.image, buttons: [button]));
  }
  final bound = <TimedMacro>[];
  final owners = <int>[];
  for (final macro in macros) {
    final matches = available.where((r) => r.name == macro.remoteName).toList();
    if (matches.length != 1) {
      throw const FormatException('Macro remote missing or ambiguous');
    }
    final remote = matches.single;
    var owner = selected.indexOf(remote);
    if (owner < 0) {
      owner = selected.length;
      selected.add(remote);
    }
    final normalized = bindMacroToRemote(macro, remote);
    for (final step
        in normalized.steps.where((s) => s.type == MacroStepType.send)) {
      if (!remote.buttons.any((b) => b.id == step.buttonId)) {
        throw const FormatException('Macro button missing');
      }
    }
    owners.add(owner);
    bound.add(normalized);
  }
  final images = <String, Uint8List>{};
  final imageKeys = <String, String>{};
  final copies = <Remote>[];
  for (final remote in selected) {
    final buttons = <IRButton>[];
    for (final b in remote.buttons) {
      var image = b.image;
      // Older remotes can store a bundled image's name without its asset path.
      // Canonicalize only known assets, and only in the outgoing copy.
      if (b.isImage &&
          b.iconCodePoint == null &&
          defaultImages.contains('assets/$image.png')) {
        image = 'assets/$image.png';
      }
      if (b.isImage &&
          b.iconCodePoint == null &&
          !defaultImages.contains(image)) {
        if (!imageKeys.containsKey(image)) {
          final docs = await (await getApplicationDocumentsDirectory())
              .resolveSymbolicLinks();
          final file = File(await File(image).resolveSymbolicLinks());
          if (!file.path.startsWith('$docs${Platform.pathSeparator}') ||
              await file.length() > 10 * 1024 * 1024) {
            throw const FormatException('Image is not an app image');
          }
          final key = 'shared:${images.length}';
          images[key] = await _portableImage(await file.readAsBytes());
          imageKeys[image] = key;
        }
        image = imageKeys[image]!;
      }
      buttons.add(b.copyWith(image: image));
    }
    copies.add(Remote(
        id: remote.id,
        name: remote.name,
        buttons: buttons,
        useNewStyle: remote.useNewStyle,
        gridLayout: remote.gridLayout));
  }
  final package = SharePackage(
      remotes: copies,
      macros: bound,
      macroRemotes: owners,
      images: images,
      singleButton: button != null);
  // Use the same validation on both sides; never produce a truncated transfer.
  return compute(_validateShare, package.encode());
}

SharePackage _validateShare(String text) {
  final package = SharePackage.decode(text);
  package.qrText();
  return package;
}

/// Persist before publishing. Save dependencies before macros so an interrupted
/// import cannot leave macros pointing at buttons that were never saved.
Future<void> importShare(SharePackage package, {Remote? destination}) async {
  if (destination != null &&
      (!package.singleButton || !state.remotes.contains(destination))) {
    throw const FormatException('Invalid destination');
  }
  final created = <File>[];
  final paths = <String, String>{};
  var remotesSaved = false;
  final previous = state.remotes.toList();
  try {
    if (package.images.isNotEmpty) {
      final root = await getApplicationDocumentsDirectory();
      final dir = await Directory('${root.path}/shared_buttons')
          .create(recursive: true);
      for (final entry in package.images.entries) {
        final png = await _portableImage(entry.value);
        final file = File('${dir.path}/${const Uuid().v4()}.png');
        created.add(file);
        await file.writeAsBytes(png, flush: true);
        paths[entry.key] = file.path;
      }
    }
    final fresh = package.freshCopies(state.remotes, macro_state.macros, paths);
    final next = state.remotes.toList();
    if (destination != null) {
      final buttons = [
        ...destination.buttons,
        fresh.remotes.single.buttons.single
      ];
      next[next.indexOf(destination)] = Remote(
          id: destination.id,
          name: destination.name,
          buttons: buttons,
          useNewStyle: destination.useNewStyle,
          gridLayout:
              destination.gridLayout?.reconcile(buttons.map((b) => b.id)));
    } else {
      next.addAll(fresh.remotes);
    }
    await writeRemotelist(next);
    remotesSaved = true;
    final nextMacros = [...macro_state.macros, ...fresh.macros];
    if (fresh.macros.isNotEmpty) await writeMacrosList(nextMacros);
    state.remotes = next;
    state.notifyRemotesChanged();
    if (fresh.macros.isNotEmpty) macro_state.setMacros(nextMacros);
  } catch (_) {
    if (remotesSaved) {
      // If rollback fails, retain referenced images rather than breaking the
      // successfully saved dependency remotes.
      await writeRemotelist(previous);
    }
    for (final file in created) {
      if (await file.exists()) await file.delete();
    }
    rethrow;
  }
}
