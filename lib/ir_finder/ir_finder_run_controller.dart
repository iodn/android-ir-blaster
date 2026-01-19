import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_prefs.dart';

typedef IrFinderCandidateFetcher = Future<IrFinderCandidate?> Function(IrFinderRunController controller);
typedef IrFinderCandidateSender = Future<void> Function(IrFinderCandidate candidate);

class IrFinderRunController extends ChangeNotifier {
  final IrFinderCandidateFetcher fetchCandidate;
  final IrFinderCandidateSender sendCandidate;

  IrFinderMode mode = IrFinderMode.bruteforce;

  String protocolId = 'nec';
  String? brand;
  String? model;

  int delayMs = 500;

  int maxKeysToTest = 2000;

  int bruteMaxAttempts = 200;
  bool bruteAllCombinations = false;

  String prefixRaw = '';
  String kaseikyoVendor = '2002';

  bool onlySelectedProtocol = true;
  bool quickWinsFirst = true;

  bool running = false;
  bool paused = false;

  int attempted = 0;
  DateTime? startedAt;

  int currentOffset = 0;

  BigInt bruteCursor = BigInt.zero;

  IrFinderCandidate? lastCandidate;
  Object? lastError;

  Timer? _timer;
  bool _tickBusy = false;
  int _nullCandidateSkips = 0;

  DateTime _lastPersistAt = DateTime.fromMillisecondsSinceEpoch(0);
  Timer? _persistDebounce;

  IrFinderRunController({
    required this.fetchCandidate,
    required this.sendCandidate,
  });

  void configure({
    required IrFinderMode mode,
    required String protocolId,
    required int delayMs,
    required int maxKeysToTest,
    required int bruteMaxAttempts,
    required bool bruteAllCombinations,
    required String prefixRaw,
    required String kaseikyoVendor,
    required bool onlySelectedProtocol,
    required bool quickWinsFirst,
    required String? brand,
    required String? model,
  }) {
    this.mode = mode;
    this.protocolId = protocolId.trim().toLowerCase();
    this.delayMs = delayMs.clamp(250, 20000);
    this.maxKeysToTest = maxKeysToTest.clamp(1, 2147483647);
    this.bruteMaxAttempts = bruteMaxAttempts.clamp(1, 2147483647);
    this.bruteAllCombinations = bruteAllCombinations;
    this.prefixRaw = prefixRaw;
    this.kaseikyoVendor = kaseikyoVendor.toUpperCase();
    this.onlySelectedProtocol = onlySelectedProtocol;
    this.quickWinsFirst = quickWinsFirst;
    this.brand = brand;
    this.model = model;
    _schedulePersist();
    notifyListeners();
  }

  void restoreProgress({
    required int attempted,
    required int currentOffset,
    required BigInt bruteCursor,
    required DateTime? startedAt,
    required bool paused,
  }) {
    this.attempted = attempted.clamp(0, 2147483647);
    this.currentOffset = currentOffset.clamp(0, 2147483647);
    this.bruteCursor = bruteCursor < BigInt.zero ? BigInt.zero : bruteCursor;
    this.startedAt = startedAt;
    this.paused = paused;
    this.running = true;
    _cancelTimer();
    _schedulePersist();
    notifyListeners();
  }

  Future<void> start() async {
    if (running && !paused) return;

    _cancelTimer();

    running = true;
    paused = false;
    attempted = 0;
    currentOffset = 0;
    bruteCursor = BigInt.zero;
    startedAt = DateTime.now();
    lastCandidate = null;
    lastError = null;
    _nullCandidateSkips = 0;

    notifyListeners();
    _schedulePersist();

    _scheduleTimer();
  }

  void pause() {
    if (!running) return;
    if (paused) return;
    paused = true;
    _cancelTimer();
    notifyListeners();
    _schedulePersist();
  }

  void resume() {
    if (!running) return;
    if (!paused) return;
    paused = false;
    notifyListeners();
    _schedulePersist();
    _scheduleTimer();
  }

  Future<void> step() async {
    if (!running) {
      running = true;
      paused = true;
      startedAt ??= DateTime.now();
      notifyListeners();
      _schedulePersist();
    }
    if (!paused) return;
    await _tick(send: true, advance: true);
  }

  Future<void> trigger() async {
    if (!running) return;
    await _tick(send: true, advance: false);
  }

  void skip() {
    if (!running) return;
    _advanceWithoutSend();
    notifyListeners();
    _schedulePersist();
  }

  Future<void> stop({bool clearPersistedSession = false}) async {
    if (!running && !paused) {
      if (clearPersistedSession) {
        await IrFinderPrefs.clearSession();
      }
      return;
    }
    _cancelTimer();
    running = false;
    paused = false;
    notifyListeners();
    if (clearPersistedSession) {
      await IrFinderPrefs.clearSession();
    } else {
      await persistNow();
    }
  }

  Future<void> persistNow() async {
    final snap = snapshot();
    await IrFinderPrefs.saveSession(snap);
  }

  IrFinderSessionSnapshot snapshot() {
    return IrFinderSessionSnapshot(
      v: 1,
      mode: mode,
      protocolId: protocolId,
      brand: brand,
      model: model,
      delayMs: delayMs,
      maxKeysToTest: maxKeysToTest,
      bruteMaxAttempts: bruteMaxAttempts,
      bruteAllCombinations: bruteAllCombinations,
      prefixRaw: prefixRaw,
      kaseikyoVendor: kaseikyoVendor,
      onlySelectedProtocol: onlySelectedProtocol,
      quickWinsFirst: quickWinsFirst,
      attempted: attempted,
      currentOffset: currentOffset,
      bruteCursorHex: bruteCursor.toRadixString(16),
      startedAtMs: startedAt?.millisecondsSinceEpoch ?? 0,
      paused: paused,
    );
  }

  void _scheduleTimer() {
    _cancelTimer();
    if (!running || paused) return;
    final int ms = delayMs.clamp(250, 20000);
    _timer = Timer.periodic(Duration(milliseconds: ms), (_) {
      unawaited(_tick(send: true, advance: true));
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _schedulePersist() {
    _persistDebounce?.cancel();
    _persistDebounce = Timer(const Duration(milliseconds: 200), () async {
      _persistDebounce = null;
      final now = DateTime.now();
      if (now.difference(_lastPersistAt).inMilliseconds < 200) return;
      _lastPersistAt = now;
      await persistNow();
    });
  }

  Future<void> _tick({required bool send, required bool advance}) async {
    if (!running) return;
    if (_tickBusy) return;

    if (mode == IrFinderMode.database) {
      if (attempted >= maxKeysToTest) {
        await stop(clearPersistedSession: false);
        return;
      }
    } else {
      if (!bruteAllCombinations && attempted >= bruteMaxAttempts) {
        await stop(clearPersistedSession: false);
        return;
      }
    }

    _tickBusy = true;
    try {
      if (!send) return;

      IrFinderCandidate? c;

      if (!advance && lastCandidate != null) {
        c = lastCandidate;
      } else {
        c = await fetchCandidate(this);
      }

      if (c == null) {
        _nullCandidateSkips += 1;
        if (mode == IrFinderMode.bruteforce) {
          lastError ??= 'No more candidates (exhausted).';
          await stop(clearPersistedSession: false);
          return;
        }
        if (_nullCandidateSkips >= 25) {
          lastError ??= 'Database candidate missing repeatedly. The DB may have changed; restart recommended.';
          await stop(clearPersistedSession: false);
          return;
        }
        if (advance) {
          _advanceWithoutSend();
        }
        notifyListeners();
        _schedulePersist();
        return;
      }

      Object? err;
      try {
        await sendCandidate(c);
        err = null;
      } catch (e) {
        err = e;
      }

      lastCandidate = c;
      lastError = err;
      _nullCandidateSkips = 0;

      if (advance) {
        _advanceAfterSend();
      }

      notifyListeners();
      _schedulePersist();
    } finally {
      _tickBusy = false;
    }
  }

  void _advanceAfterSend() {
    attempted = (attempted + 1).clamp(0, 2147483647);
    currentOffset = (currentOffset + 1).clamp(0, 2147483647);
    if (mode == IrFinderMode.bruteforce) {
      bruteCursor += BigInt.one;
    }
  }

  void _advanceWithoutSend() {
    attempted = (attempted + 1).clamp(0, 2147483647);
    currentOffset = (currentOffset + 1).clamp(0, 2147483647);
    if (mode == IrFinderMode.bruteforce) {
      bruteCursor += BigInt.one;
    }
  }

  // Jump methods to reposition safely without breaking DB ordering
  void jumpToOffset(int value) {
    final int v = value.clamp(0, 2147483647);
    currentOffset = v;
    // Pause to avoid racing the timer while relocating
    paused = true;
    _cancelTimer();
    _schedulePersist();
    notifyListeners();
  }

  void jumpToBrute(BigInt value) {
    final BigInt v = (value < BigInt.zero) ? BigInt.zero : value;
    bruteCursor = v;
    paused = true;
    _cancelTimer();
    _schedulePersist();
    notifyListeners();
  }

  @override
  void dispose() {
    _cancelTimer();
    _persistDebounce?.cancel();
    _persistDebounce = null;
    super.dispose();
  }
}
