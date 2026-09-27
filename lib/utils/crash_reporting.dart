import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class CrashReporting {
  static const channel = MethodChannel('org.nslabs/crash_reports');
  static bool _recording = false;

  static Future<void> record(Object error, StackTrace stack) async {
    if (_recording) return;
    _recording = true;
    try {
      await channel.invokeMethod<void>('record', {
        'trace': 'Dart: ${Platform.version}\n'
            'Build mode: ${kReleaseMode ? 'release' : kProfileMode ? 'profile' : 'debug'}\n'
            '$error\n$stack',
      });
    } catch (e) {
      debugPrint('Could not store crash report: $e');
      _recording = false;
    }
  }

  static void frameworkError(FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // IR helpers report handled transmission failures through this hook too.
    if (details.silent || details.library == 'IR Blaster') return;
    record(details.toString(), details.stack ?? StackTrace.current);
  }
}
