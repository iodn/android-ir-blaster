import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/quick_tile_chooser.dart';

class HomeButtonWidgetPrefs {
  HomeButtonWidgetPrefs._();

  static const MethodChannel _channel =
      MethodChannel('org.nslabs/irtransmitter_home_widget');

  static Future<bool> isPinSupported() async {
    final raw = await _channel.invokeMethod<bool>('isPinSupported');
    return raw ?? false;
  }

  static Future<bool> pinButtonWidget(HomeButtonWidgetMapping mapping) async {
    final raw = await _channel.invokeMethod<bool>(
      'pinButtonWidget',
      mapping.toJson(),
    );
    return raw ?? false;
  }

  static Future<bool> saveWidgetMapping({
    required int appWidgetId,
    required HomeButtonWidgetMapping mapping,
  }) async {
    final raw = await _channel.invokeMethod<bool>(
      'saveWidgetMapping',
      <String, dynamic>{
        'appWidgetId': appWidgetId,
        'mapping': mapping.toJson(),
      },
    );
    return raw ?? false;
  }
}

class HomeButtonWidgetMapping {
  final String buttonId;
  final String title;
  final String subtitle;
  final int frequencyHz;
  final List<int> pattern;

  const HomeButtonWidgetMapping({
    required this.buttonId,
    required this.title,
    required this.subtitle,
    required this.frequencyHz,
    required this.pattern,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'buttonId': buttonId,
        'title': title,
        'subtitle': subtitle,
        'frequencyHz': frequencyHz,
        'pattern': pattern,
      };

  String encode() => jsonEncode(toJson());
}

Future<HomeButtonWidgetMapping?> buildHomeButtonWidgetMapping(
  QuickTilePick pick,
) async {
  IRButton? resolved;
  final remotesList = await readRemotes();
  for (final r in remotesList) {
    for (final b in r.buttons) {
      if (b.id == pick.button.id) {
        resolved = b;
        break;
      }
    }
    if (resolved != null) break;
  }
  if (resolved == null) return null;

  final IrPreview preview;
  try {
    preview = previewIRButton(resolved);
  } catch (_) {
    return null;
  }
  return HomeButtonWidgetMapping(
    buttonId: resolved.id,
    title: pick.title,
    subtitle: pick.remote.name,
    frequencyHz: preview.frequencyHz,
    pattern: preview.pattern,
  );
}
