import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/universal_power/power_code.dart';
import 'package:irblaster_controller/universal_power/power_params.dart';
import 'package:irblaster_controller/utils/ir.dart';

class UniversalPowerController extends ChangeNotifier {
  List<PowerCode> _queue = <PowerCode>[];
  int index = 0;
  int delayMs = 800;
  bool loop = false;
  bool running = false;
  bool paused = false;
  DateTime? startedAt;
  PowerCode? lastSent;
  Object? lastError;

  Timer? _timer;
  bool _busy = false;

  List<PowerCode> get queue => _queue;

  Future<bool> start({
    required List<PowerCode> queue,
    required int delayMs,
    required bool loop,
  }) async {
    if (queue.isEmpty) return false;
    _queue = queue;
    this.delayMs = delayMs.clamp(400, 4000);
    this.loop = loop;
    index = 0;
    running = true;
    paused = false;
    startedAt = DateTime.now();
    lastSent = null;
    lastError = null;
    _cancelTimer();
    notifyListeners();
    await _tick();
    return true;
  }

  void pause() {
    if (!running || paused) return;
    paused = true;
    _cancelTimer();
    notifyListeners();
  }

  void resume() {
    if (!running || !paused) return;
    paused = false;
    notifyListeners();
    _scheduleNext();
  }

  Future<void> step() async {
    if (!running || !paused) return;
    await _tick();
  }

  Future<void> stop() async {
    if (!running && !paused) return;
    _cancelTimer();
    running = false;
    paused = false;
    notifyListeners();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _scheduleNext() {
    _cancelTimer();
    if (!running || paused) return;
    _timer = Timer(Duration(milliseconds: delayMs), () {
      _tick();
    });
  }

  Future<void> _tick() async {
    if (!running || paused) return;
    if (_busy) return;
    if (_queue.isEmpty) {
      await stop();
      return;
    }
    if (index >= _queue.length) {
      if (loop) {
        index = 0;
      } else {
        await stop();
        return;
      }
    }

    _busy = true;
    try {
      final code = _queue[index];
      await _send(code);
      lastSent = code;
      lastError = null;
      index++;
    } catch (e) {
      lastError = e;
      index++;
    } finally {
      _busy = false;
      notifyListeners();
      if (running && !paused) {
        _scheduleNext();
      }
    }
  }

  Future<void> _send(PowerCode code) async {
    final raw = code.rawPattern;
    final int? rawFreq = code.frequencyHz;
    if (raw != null && rawFreq != null && rawFreq > 0) {
      await transmitRawCycles(rawFreq, raw);
      return;
    }
    final params = buildParamsForProtocol(
      protocolId: code.protocolId,
      codeHex: code.hexCode,
    );
    final enc = IrProtocolRegistry.encoderFor(code.protocolId);
    final res = enc.encode(params);
    final int freqHz = res.frequencyHz > 0 ? res.frequencyHz : 38000;
    await transmitRaw(freqHz, res.pattern);
  }
}
