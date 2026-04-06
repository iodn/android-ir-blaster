import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';

final ValueNotifier<LastActionEntry?> lastActionStrip =
    ValueNotifier<LastActionEntry?>(null);

Timer? _lastActionTimer;

void showLastAction({
  required String title,
  String? remoteName,
  required Future<void> Function() onRepeat,
  Duration duration = const Duration(seconds: 6),
}) {
  _lastActionTimer?.cancel();
  lastActionStrip.value = LastActionEntry(
    title: title,
    remoteName: remoteName?.trim(),
    onRepeat: onRepeat,
    shownAt: DateTime.now(),
  );
  _lastActionTimer = Timer(duration, () {
    if (identical(lastActionStrip.value?.onRepeat, onRepeat)) {
      lastActionStrip.value = null;
    }
  });
}

void showLastActionForButton({
  required IRButton button,
  required String title,
  String? remoteName,
  Duration duration = const Duration(seconds: 6),
}) {
  showLastAction(
    title: title,
    remoteName: remoteName,
    duration: duration,
    onRepeat: () => sendIR(button),
  );
}

void clearLastAction() {
  _lastActionTimer?.cancel();
  _lastActionTimer = null;
  lastActionStrip.value = null;
}

class LastActionEntry {
  final String title;
  final String? remoteName;
  final Future<void> Function() onRepeat;
  final DateTime shownAt;

  const LastActionEntry({
    required this.title,
    required this.remoteName,
    required this.onRepeat,
    required this.shownAt,
  });
}
