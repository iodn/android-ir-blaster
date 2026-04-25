import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/state/orientation_pref.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/ir_transmitter_platform.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/ir_waveform_view.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';

class LearningModeScreen extends StatefulWidget {
  const LearningModeScreen({super.key});

  @override
  State<LearningModeScreen> createState() => _LearningModeScreenState();
}

class _LearningModeScreenState extends State<LearningModeScreen>
    with TickerProviderStateMixin {
  static const int _tiqiaaVid1 = 0x10C4;
  static const int _tiqiaaVid2 = 0x045E;
  static const int _tiqiaaPid = 0x8468;
  static const int _elkSmartVid = 0x045C;
  static const Set<int> _elkSmartPids = <int>{
    0x0131,
    0x0132,
    0x014A,
    0x0184,
    0x0195,
    0x02AA,
  };

  final TextEditingController _buttonNameCtrl = TextEditingController();

  StreamSubscription<IrTransmitterCapabilities>? _capsSub;
  IrTransmitterCapabilities? _caps;
  IrTransmitterType? _preferredType;
  LearnedUsbSignal? _capturedSignal;
  bool _busy = false;
  String? _errorText;
  _LearningCaptureState _captureState = _LearningCaptureState.idle;
  _LearningSaveTarget _saveTarget = _LearningSaveTarget.existingRemote;

  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;
  late final AnimationController _replayWaveformController;
  Timer? _replayLoopTimer;
  bool _replayWaveformActive = false;
  bool _replayLooping = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _replayWaveformController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _loadCaps();
    _capsSub = IrTransmitterPlatform.capabilitiesEvents().listen((caps) {
      if (!mounted) return;
      setState(() => _caps = caps);
    });
  }

  @override
  void dispose() {
    _capsSub?.cancel();
    _replayLoopTimer?.cancel();
    _buttonNameCtrl.dispose();
    _pulseController.dispose();
    _replayWaveformController.dispose();
    super.dispose();
  }

  Future<void> _loadCaps() async {
    try {
      final caps = await IrTransmitterPlatform.getCapabilities();
      final preferredType = await IrTransmitterPlatform.getPreferredType();
      if (!mounted) return;
      setState(() {
        _caps = caps;
        _preferredType = preferredType;
      });
    } catch (_) {}
  }

  List<UsbDeviceInfo> get _learningDevices {
    final caps = _caps;
    if (caps == null) return const [];
    return caps.usbDevices.where(_isLearningFamily).toList(growable: false);
  }

  bool get _audioLearningSelected {
    final type = _preferredType ?? _caps?.currentType;
    return type == IrTransmitterType.audio1Led ||
        type == IrTransmitterType.audio2Led;
  }

  bool get _usbSwitchRecommended {
    final selectedType = _preferredType ?? _caps?.currentType;
    return _learningDevices.isNotEmpty && selectedType != IrTransmitterType.usb;
  }

  bool _isTiqiaaFamily(UsbDeviceInfo d) {
    return d.productId == _tiqiaaPid &&
        (d.vendorId == _tiqiaaVid1 || d.vendorId == _tiqiaaVid2);
  }

  bool _isElkSmartFamily(UsbDeviceInfo d) {
    return d.vendorId == _elkSmartVid && _elkSmartPids.contains(d.productId);
  }

  bool _isLearningFamily(UsbDeviceInfo d) {
    return _isTiqiaaFamily(d) || _isElkSmartFamily(d);
  }

  /// True when the device has Huawei internal IR learning AND no USB learning
  /// dongle is attached (USB takes priority when both are present).
  bool get _huaweiInternalSelected {
    final caps = _caps;
    if (caps == null || !caps.hasHuaweiIrLearning) return false;
    if (_audioLearningSelected) return false;
    return _learningDevices.isEmpty;
  }

  /// True when the device has LG UEI Quickset IR learning AND no USB dongle
  /// or Huawei receiver is available (USB always takes priority).
  bool get _lgInternalSelected {
    final caps = _caps;
    if (caps == null || !caps.hasLgeIrLearning) return false;
    if (_audioLearningSelected) return false;
    if (_learningDevices.isNotEmpty) return false;
    if (_huaweiInternalSelected) return false;
    return true;
  }

  _LearningHardwareState get _hardwareState {
    final caps = _caps;
    if (caps == null) return _LearningHardwareState.checking;
    if (_audioLearningSelected) {
      return _LearningHardwareState.noReceiver;
    }
    // Built-in IR receivers are ready when no USB dongle is present.
    if (_huaweiInternalSelected) return _LearningHardwareState.ready;
    if (_lgInternalSelected) return _LearningHardwareState.ready;
    final devices = _learningDevices;
    if (devices.isEmpty) return _LearningHardwareState.noReceiver;
    if (devices.any((d) => !d.hasPermission) ||
        caps.usbStatus == UsbConnectionStatus.permissionRequired ||
        caps.usbStatus == UsbConnectionStatus.permissionDenied) {
      return _LearningHardwareState.permissionRequired;
    }
    if (caps.usbStatus == UsbConnectionStatus.ready ||
        caps.usbStatus == UsbConnectionStatus.permissionGranted) {
      return _LearningHardwareState.ready;
    }
    return _LearningHardwareState.needsSetup;
  }

  bool get _hardwareReady => _hardwareState == _LearningHardwareState.ready;

  String _buttonLabel(BuildContext context) {
    final value = _buttonNameCtrl.text.trim();
    return value.isEmpty ? context.l10n.learningModeUnnamedCapture : value;
  }

  String get _rawPreview => _capturedSignal?.rawPreview ?? '';

  bool _isLikelyCompleteCapture(LearnedUsbSignal signal) {
    final totalUs = signal.rawPatternUs.fold<int>(0, (sum, v) => sum + v);
    switch (signal.family) {
      case 'audio':
        return signal.opaqueFrameBase64.length >= 2048 && totalUs >= 20 * 1000;
      case 'tiqiaa':
      case 'elksmart':
        return signal.rawPatternUs.length >= 6 &&
            totalUs >= 1000 &&
            signal.opaqueFrameBase64.length >= 16;
      case 'huawei_ir':
        return signal.rawPatternUs.length >= 6 && totalUs >= 1000;
      case 'lge_ir':
        // LG signals have no rawPatternUs; validate the opaque blob is non-empty.
        return signal.opaqueFrameBase64.length >= 4;
      default:
        return signal.rawPatternUs.isNotEmpty &&
            signal.opaqueFrameBase64.isNotEmpty;
    }
  }

  String _capturePreviewBody(LearnedUsbSignal signal) {
    final String header = signal.displayPreview.isNotEmpty
        ? signal.displayPreview
        : signal.family == 'audio'
            ? 'Audio learned capture'
            : signal.family == 'elksmart'
                ? 'ElkSmart USB learned frame'
                : signal.family == 'huawei_ir'
                    ? 'Huawei internal IR learned frame'
                    : signal.family == 'lge_ir'
                        ? 'LG internal IR learned frame (UEI Quickset)'
                        : 'Tiqiaa USB learned frame';
    final lines = <String>[
      header,
      'RAW',
    ];
    if (signal.frequencyHz > 0) {
      lines.add('${signal.frequencyHz} Hz');
    } else if (signal.family == 'audio') {
      lines.add('Carrier unknown');
    }
    return lines.join('\n');
  }

  bool _hasWaveformPreview(LearnedUsbSignal signal) {
    return signal.rawPatternUs.isNotEmpty &&
        signal.rawPatternUs.any((v) => v > 0);
  }

  int _waveformFrequencyHz(LearnedUsbSignal signal) {
    return signal.frequencyHz > 0 ? signal.frequencyHz : 38000;
  }

  Duration _waveformReplayDuration(LearnedUsbSignal signal) {
    final totalUs =
        signal.rawPatternUs.fold<int>(0, (sum, value) => sum + value);
    final millis = (totalUs / 1000).round().clamp(1000, 5000);
    return Duration(milliseconds: millis);
  }

  /// Returns the icon that represents the active learning source.
  IconData _learningDeviceIcon() {
    if (_huaweiInternalSelected || _lgInternalSelected) {
      // Built-in phone IR receiver — not USB
      return Icons.smartphone_rounded;
    }
    if (_audioLearningSelected) {
      return Icons.headset_rounded;
    }
    return Icons.usb_rounded;
  }

  String _learningDeviceLabel(BuildContext context) {
    if (_audioLearningSelected) {
      final selectedType = _preferredType ?? _caps?.currentType;
      return selectedType == IrTransmitterType.audio2Led
          ? 'Audio 2 LED'
          : 'Audio 1 LED';
    }
    if (_huaweiInternalSelected) {
      return 'Huawei built-in IR receiver';
    }
    if (_lgInternalSelected) {
      return 'LG built-in IR receiver (UEI Quickset)';
    }
    if (_caps == null) {
      return 'Checking device…';
    }
    if (_learningDevices.isEmpty) {
      return 'No learning receiver detected';
    }
    final device = _learningDevices.first;
    final productName =
        device.productName.isEmpty ? 'USB learning dongle' : device.productName;
    return '$productName (${device.vendorId.toRadixString(16)}:${device.productId.toRadixString(16)})';
  }

  Future<void> _startListening() async {
    if (!_hardwareReady || _busy) return;
    setState(() {
      _busy = true;
      _errorText = null;
      _capturedSignal = null;
      _captureState = _LearningCaptureState.listening;
    });
    _pulseController.repeat(reverse: true);
    await Haptics.mediumImpact();

    try {
      final learned = _huaweiInternalSelected
          ? await IrTransmitterPlatform.learnHuaweiSignal(timeoutMs: 30000)
          : _lgInternalSelected
              ? await IrTransmitterPlatform.learnLgSignal(timeoutMs: 30000)
              : await IrTransmitterPlatform.learnUsbSignal(timeoutMs: 30000);
      if (!mounted) return;
      _pulseController.stop();
      _pulseController.reset();
      if (learned == null) {
        setState(() {
          _busy = false;
          _captureState = _LearningCaptureState.idle;
        });
        return;
      }
      if (!_isLikelyCompleteCapture(learned)) {
        setState(() {
          _busy = false;
          _captureState = _LearningCaptureState.idle;
          _errorText =
              'The captured signal looks incomplete. Move the remote closer and try again.';
        });
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                'The captured signal looks incomplete. Move the remote closer and try again.',
              ),
            ),
          );
        return;
      }
      setState(() {
        _busy = false;
        _capturedSignal = learned;
        _captureState = _LearningCaptureState.captured;
      });
      await Haptics.selectionClick();
    } catch (e) {
      if (!mounted) return;
      _pulseController.stop();
      _pulseController.reset();
      final message = e is PlatformException
          ? (e.message ?? context.l10n.learningModeCaptureFailed)
          : context.l10n.learningModeCaptureFailed;
      setState(() {
        _busy = false;
        _captureState = _LearningCaptureState.idle;
        _errorText = message;
      });
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(message)));
    }
  }

  Future<void> _requestUsbPermission() async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    setState(() => _busy = true);
    try {
      final ok = await IrTransmitterPlatform.usbScanAndRequest();
      await _loadCaps();
      if (!mounted) return;
      final freshCaps = _caps;
      if (!ok) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.homeUsbDongleNotDetected)),
        );
      } else if (freshCaps == null) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.usbPermissionRequestSent)),
        );
      } else if (freshCaps.usbStatus ==
              UsbConnectionStatus.permissionRequired ||
          freshCaps.usbStatus == UsbConnectionStatus.permissionDenied) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.usbPermissionRequestSentApprove)),
        );
      } else if (freshCaps.usbStatus == UsbConnectionStatus.ready) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.usbAlreadyReady)),
        );
      } else {
        messenger.showSnackBar(
          SnackBar(
              content:
                  Text(freshCaps.usbStatusMessage ?? l10n.usbStatusOpenFailed)),
        );
      }
    } catch (_) {
      if (mounted) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.failedToRequestUsbPermission)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  Future<void> _switchToUsbLearningMode() async {
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _busy = true);
    try {
      await IrTransmitterPlatform.setPreferredType(IrTransmitterType.usb);
      await IrTransmitterPlatform.setActiveType(IrTransmitterType.usb);
      await _loadCaps();
      if (!mounted) return;
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Switched to USB IR dongle')),
        );
    } catch (e) {
      if (!mounted) return;
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('Failed to switch to USB IR dongle: $e')),
        );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _stopListening() async {
    setState(() => _busy = true);
    try {
      if (_huaweiInternalSelected) {
        await IrTransmitterPlatform.cancelHuaweiLearning();
      } else if (_lgInternalSelected) {
        await IrTransmitterPlatform.cancelLgLearning();
      } else {
        await IrTransmitterPlatform.cancelUsbLearning();
      }
    } catch (_) {}
    if (!mounted) return;
    _pulseController.stop();
    _pulseController.reset();
    setState(() {
      _busy = false;
      _captureState = _LearningCaptureState.idle;
    });
    await Haptics.selectionClick();
  }

  Future<void> _replayCapturedSignal({bool showFeedback = true}) async {
    final signal = _capturedSignal;
    if (signal == null || _busy) return;
    setState(() => _busy = true);
    try {
      final previewButton = _buildSavedButton(
        signal,
        _buttonNameCtrl.text.trim().isEmpty
            ? context.l10n.learningModeUnnamedCapture
            : _buttonNameCtrl.text.trim(),
      );
      Future<void>? animation;
      if (_hasWaveformPreview(signal)) {
        _replayWaveformController
          ..duration = _waveformReplayDuration(signal)
          ..stop()
          ..value = 0;
        setState(() => _replayWaveformActive = true);
        animation = _replayWaveformController.forward(from: 0);
      }
      await Future.wait<void>([
        sendIR(previewButton),
        if (animation != null) animation,
      ]);
      if (!mounted) return;
      if (showFeedback) {
        final msg = context.l10n.learningModeReplaySent;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(msg)));
        await Haptics.selectionClick();
      }
    } catch (e) {
      if (!mounted) return;
      final msg = e is PlatformException
          ? (e.message ?? context.l10n.learningModeReplayFailed)
          : context.l10n.learningModeReplayFailed;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      if (mounted) {
        setState(() {
          _busy = false;
          _replayWaveformActive = false;
        });
      }
    }
  }

  void _stopReplayLoop() {
    _replayLoopTimer?.cancel();
    _replayLoopTimer = null;
    if (!mounted) return;
    setState(() {
      _replayLooping = false;
      _replayWaveformActive = false;
    });
  }

  void _toggleReplayLoop() {
    final signal = _capturedSignal;
    if (signal == null) return;
    if (_busy && !_replayLooping) return;
    if (_replayLooping) {
      _stopReplayLoop();
      return;
    }

    final interval =
        _waveformReplayDuration(signal) + const Duration(milliseconds: 180);
    setState(() => _replayLooping = true);
    unawaited(_replayCapturedSignal(showFeedback: false));
    _replayLoopTimer = Timer.periodic(interval, (_) {
      if (!mounted || !_replayLooping || _capturedSignal == null) return;
      unawaited(_replayCapturedSignal(showFeedback: false));
    });
  }

  Future<void> _copyRawPreview() async {
    final raw = _rawPreview.trim();
    if (raw.isEmpty) return;
    await Clipboard.setData(ClipboardData(text: raw));
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(context.l10n.codeCopied)));
    await Haptics.selectionClick();
  }

  Future<void> _learnAnother() async {
    _stopReplayLoop();
    setState(() {
      _capturedSignal = null;
      _captureState = _LearningCaptureState.idle;
      _errorText = null;
    });
    await Haptics.selectionClick();
  }

  Future<void> _saveCapture() async {
    final signal = _capturedSignal;
    if (signal == null || _busy) return;
    final l10n = context.l10n;
    final buttonName = _buttonNameCtrl.text.trim().isEmpty
        ? context.l10n.learningModeUnnamedCapture
        : _buttonNameCtrl.text.trim();
    setState(() => _busy = true);
    try {
      final existingRemotes = await readRemotes();
      Remote? targetRemote;
      if (_saveTarget == _LearningSaveTarget.existingRemote) {
        if (existingRemotes.isEmpty) {
          throw Exception(l10n.learningModeNoRemotesAvailable);
        }
        final selected = await _pickRemote(existingRemotes);
        if (selected == null) return;
        final updated = existingRemotes.map((r) {
          if (r.id != selected.id) return r;
          final next = Remote(
            id: r.id,
            name: r.name,
            useNewStyle: r.useNewStyle,
            buttons: [...r.buttons, _buildSavedButton(signal, buttonName)],
          );
          targetRemote = next;
          return next;
        }).toList(growable: false);
        await writeRemotelist(updated);
      } else {
        final remoteName = await _promptForNewRemoteName();
        if (remoteName == null) return;
        final created = Remote(
          name: remoteName,
          buttons: <IRButton>[_buildSavedButton(signal, buttonName)],
        );
        final updated = [...existingRemotes];
        updated.add(created);
        targetRemote = created;
        await writeRemotelist(updated);
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.learningModeSaveSuccess)));
      remotes = await readRemotes();
      notifyRemotesChanged();
      final refreshedTarget = targetRemote == null
          ? null
          : remotes.cast<Remote?>().firstWhere(
                (r) => r?.id == targetRemote!.id,
                orElse: () => remotes.cast<Remote?>().firstWhere(
                      (r) => r?.name == targetRemote!.name,
                      orElse: () => null,
                    ),
              );
      _buttonNameCtrl.clear();
      _stopReplayLoop();
      setState(() {
        _capturedSignal = null;
        _captureState = _LearningCaptureState.idle;
      });
      await Haptics.mediumImpact();
      await _showPostSaveSheet(refreshedTarget);
    } catch (e) {
      if (!mounted) return;
      final msg = e is Exception
          ? e.toString().replaceFirst('Exception: ', '')
          : l10n.learningModeSaveFailed;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _showPostSaveSheet(Remote? targetRemote) async {
    if (!mounted) return;
    final action = await showModalBottomSheet<String>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (sheetContext) {
        final theme = Theme.of(sheetContext);
        final cs = theme.colorScheme;
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.14),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sheetContext.l10n.learningModeSaveSuccess,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Choose what to do next.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              if (targetRemote != null) ...[
                FilledButton.icon(
                  onPressed: () =>
                      Navigator.of(sheetContext).pop('open_remote'),
                  icon: const Icon(Icons.settings_remote_rounded),
                  label: const Text('Open remote'),
                ),
                const SizedBox(height: 10),
              ],
              OutlinedButton.icon(
                onPressed: () =>
                    Navigator.of(sheetContext).pop('learn_another'),
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: Text(sheetContext.l10n.learningModeLearnAnotherAction),
              ),
            ],
          ),
        );
      },
    );

    if (!mounted) return;
    if (action == 'open_remote' && targetRemote != null) {
      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => RemoteView(remote: targetRemote),
        ),
      );
    }
  }

  IRButton _buildSavedButton(LearnedUsbSignal signal, String buttonName) {
    // Signals that carry standard IR pulse data (frequency + µs pattern) are
    // stored as raw buttons so they play back via ConsumerIrManager or any USB
    // dongle without requiring a device-specific replay channel.
    // LGE signals are opaque UEI blobs — they MUST use protocol params and
    // can only be replayed on the same LG device via the UEI service.
    if (signal.family == 'audio' || signal.family == 'huawei_ir') {
      return IRButton(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        image: buttonName,
        isImage: false,
        frequency: signal.frequencyHz > 0 ? signal.frequencyHz : 38000,
        rawData: signal.rawPreview,
      );
    }
    return IRButton(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      image: buttonName,
      isImage: false,
      frequency: null,
      rawData: null,
      protocol: signal.family == 'elksmart'
          ? IrProtocolIds.elksmartLearned
          : signal.family == 'lge_ir'
              ? IrProtocolIds.lgeIrLearned
              : signal.family == 'audio'
                  ? IrProtocolIds.audioLearned
                  : IrProtocolIds.tiqiaaLearned,
      protocolParams: <String, dynamic>{
        'family': signal.family,
        'opaqueFrameBase64': signal.opaqueFrameBase64,
        'opaqueMeta': signal.opaqueMeta,
        'quality': signal.quality,
        'frequencyHz': signal.frequencyHz,
        'rawPreview': signal.rawPreview,
        'displayPreview': signal.displayPreview,
      },
    );
  }

  Future<Remote?> _pickRemote(List<Remote> remotes) async {
    return showModalBottomSheet<Remote>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheetContext) {
        final theme = Theme.of(sheetContext);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sheetContext.l10n.learningModeChooseRemoteTitle,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: remotes.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, index) {
                      final remote = remotes[index];
                      return ListTile(
                        leading: const Icon(Icons.settings_remote_rounded),
                        title: Text(remote.name),
                        subtitle: Text(
                          sheetContext.l10n.remoteButtonCountLabel(
                            remote.buttons.length,
                          ),
                        ),
                        onTap: () => Navigator.of(sheetContext).pop(remote),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String?> _promptForNewRemoteName() async {
    final ctrl = TextEditingController(text: '${_buttonLabel(context)} Remote');
    try {
      return showDialog<String>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: Text(dialogContext.l10n.learningModeNewRemoteTitle),
            content: TextField(
              controller: ctrl,
              autofocus: true,
              decoration: InputDecoration(
                labelText: dialogContext.l10n.remoteName,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(dialogContext.l10n.cancel),
              ),
              FilledButton(
                onPressed: () {
                  final value = ctrl.text.trim();
                  Navigator.of(dialogContext).pop(value.isEmpty ? null : value);
                },
                child: Text(dialogContext.l10n.learningModeCreateNewRemote),
              ),
            ],
          );
        },
      );
    } finally {
      ctrl.dispose();
    }
  }

  IconData _statusIcon() {
    if (!_hardwareReady) {
      if (_audioLearningSelected) {
        return Icons.headset_off_rounded;
      }
      return switch (_hardwareState) {
        _LearningHardwareState.permissionRequired => Icons.usb_rounded,
        _LearningHardwareState.needsSetup => Icons.build_circle_rounded,
        _LearningHardwareState.noReceiver => Icons.portable_wifi_off_rounded,
        _LearningHardwareState.checking => Icons.sync_rounded,
        _LearningHardwareState.ready => Icons.hearing_rounded,
      };
    }

    return switch (_captureState) {
      _LearningCaptureState.idle => Icons.hearing_rounded,
      _LearningCaptureState.listening => Icons.graphic_eq_rounded,
      _LearningCaptureState.captured => Icons.check_circle_rounded,
    };
  }

  String _statusTitle(BuildContext context) {
    if (!_hardwareReady) {
      if (_audioLearningSelected) {
        return 'Audio learning not supported';
      }
      return switch (_hardwareState) {
        _LearningHardwareState.permissionRequired =>
          context.l10n.learningModeStatusPermissionTitle,
        _LearningHardwareState.needsSetup =>
          context.l10n.learningModeStatusSetupTitle,
        _LearningHardwareState.noReceiver =>
          context.l10n.learningModeStatusNoReceiverTitle,
        _LearningHardwareState.checking =>
          context.l10n.learningModeStatusCheckingTitle,
        _LearningHardwareState.ready =>
          context.l10n.learningModeStatusReadyTitle,
      };
    }
    return switch (_captureState) {
      _LearningCaptureState.idle => context.l10n.learningModeStatusReadyTitle,
      _LearningCaptureState.listening =>
        context.l10n.learningModeStatusListeningTitle,
      _LearningCaptureState.captured =>
        context.l10n.learningModeStatusCapturedTitle,
    };
  }

  String _statusBody(BuildContext context) {
    if (!_hardwareReady) {
      if (_audioLearningSelected) {
        return 'Learning Mode supports compatible USB IR dongles only. Audio IR accessories remain available for transmit.';
      }
      return switch (_hardwareState) {
        _LearningHardwareState.permissionRequired =>
          context.l10n.learningModeHardwarePermissionBody,
        _LearningHardwareState.needsSetup =>
          context.l10n.learningModeHardwareSetupBody,
        _LearningHardwareState.noReceiver =>
          context.l10n.learningModeHardwareNoReceiverBody,
        _LearningHardwareState.checking =>
          context.l10n.learningModeCheckingHardwareBody,
        _LearningHardwareState.ready => '',
      };
    }
    return switch (_captureState) {
      _LearningCaptureState.idle => context.l10n.learningModeReadyToListenBody,
      _LearningCaptureState.listening =>
        context.l10n.learningModeStatusListeningBody,
      _LearningCaptureState.captured =>
        context.l10n.learningModeStatusCapturedBody(_buttonLabel(context)),
    };
  }

  Color _accentColor(ColorScheme cs) {
    if (!_hardwareReady) {
      return switch (_hardwareState) {
        _LearningHardwareState.permissionRequired => cs.tertiary,
        _LearningHardwareState.needsSetup => cs.secondary,
        _LearningHardwareState.noReceiver => cs.error,
        _LearningHardwareState.checking => cs.outline,
        _LearningHardwareState.ready => cs.primary,
      };
    }
    return switch (_captureState) {
      _LearningCaptureState.idle => cs.primary,
      _LearningCaptureState.listening => cs.tertiary,
      _LearningCaptureState.captured => Colors.green,
    };
  }

  Widget _buildStatusCard(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final accent = _accentColor(cs);

    return Card(
      elevation: 0,
      color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                ScaleTransition(
                  scale: _captureState == _LearningCaptureState.listening
                      ? _pulseAnimation
                      : const AlwaysStoppedAnimation(1.0),
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.14),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(_statusIcon(), size: 34, color: accent),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _statusTitle(context),
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: _InfoChip(
                    icon: _learningDeviceIcon(),
                    label: _learningDeviceLabel(context),
                    foreground: cs.onSurface,
                    background: cs.surfaceContainerHighest,
                  ),
                ),
              ],
            ),
            if (_usbSwitchRecommended) ...[
              const SizedBox(height: 14),
              FilledButton.tonalIcon(
                onPressed: _busy ? null : _switchToUsbLearningMode,
                icon: const Icon(Icons.usb_rounded),
                label: const Text('Use USB dongle'),
              ),
            ],
            if (!_audioLearningSelected &&
                _hardwareState ==
                    _LearningHardwareState.permissionRequired) ...[
              const SizedBox(height: 14),
              FilledButton.tonalIcon(
                onPressed: _busy ? null : _requestUsbPermission,
                icon: const Icon(Icons.usb_rounded),
                label: Text(context.l10n.requestUsbPermission),
              ),
            ],
            if (_errorText != null) ...[
              const SizedBox(height: 14),
              _InlineNotice(message: _errorText!, tone: _NoticeTone.error),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSetupCard(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      color: cs.errorContainer.withValues(alpha: 0.32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: cs.error.withValues(alpha: 0.25)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _audioLearningSelected
                  ? 'USB learning only'
                  : context.l10n.learningModeConnectReceiverTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              _audioLearningSelected
                  ? 'Switch to a compatible USB learning dongle such as Tiqiaa, ZaZa, or ElkSmart to use Learning Mode.'
                  : 'No compatible learning receiver was detected.\n\n'
                      '• Plug in a Tiqiaa, ZaZa, or ElkSmart USB IR dongle, or\n'
                      '• Use a Huawei / Honor phone with a built-in IR receiver, or\n'
                      '• Use an LG phone with the UEI Quickset service installed.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                    height: 1.35,
                  ),
            ),
            const SizedBox(height: 14),
            FilledButton.tonalIcon(
              onPressed: _loadCaps,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(context.l10n.learningModeRefreshHardware),
            ),
            if (_usbSwitchRecommended) ...[
              const SizedBox(height: 10),
              FilledButton.icon(
                onPressed: _busy ? null : _switchToUsbLearningMode,
                icon: const Icon(Icons.usb_rounded),
                label: const Text('Use USB dongle'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildListenCard(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final listening = _captureState == _LearningCaptureState.listening;

    return Card(
      elevation: 0,
      color: listening
          ? cs.tertiaryContainer.withValues(alpha: 0.86)
          : cs.primaryContainer.withValues(alpha: 0.72),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: listening
              ? cs.tertiary.withValues(alpha: 0.30)
              : cs.primary.withValues(alpha: 0.24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (listening)
              SizedBox(
                height: 92,
                child: AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(7, (index) {
                        final phase = (_pulseController.value * 2 * math.pi) +
                            (index * 0.7);
                        final wave = (math.sin(phase) + 1) / 2;
                        final height = 18.0 + (wave * 42.0);
                        final opacity = 0.35 + (wave * 0.55);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 120),
                            width: 10,
                            height: height,
                            decoration: BoxDecoration(
                              color: cs.onPrimaryContainer
                                  .withValues(alpha: opacity),
                              borderRadius: BorderRadius.circular(999),
                              boxShadow: [
                                BoxShadow(
                                  color: cs.onPrimaryContainer
                                      .withValues(alpha: 0.12),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              )
            else
              ScaleTransition(
                scale: const AlwaysStoppedAnimation(1.0),
                child: Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cs.onPrimaryContainer.withValues(alpha: 0.12),
                  ),
                  child: Icon(
                    Icons.hearing_rounded,
                    size: 36,
                    color: cs.onPrimaryContainer,
                  ),
                ),
              ),
            const SizedBox(height: 14),
            Text(
              listening
                  ? context.l10n.learningModeListeningNowTitle
                  : context.l10n.learningModeReadyToListenTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: cs.onPrimaryContainer,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              _statusBody(context),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: cs.onPrimaryContainer.withValues(alpha: 0.82),
                height: 1.35,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            if (!listening)
              FilledButton.icon(
                onPressed: _busy ? null : _startListening,
                icon: const Icon(Icons.hearing_rounded),
                label: Text(context.l10n.learningModeStartListening),
              )
            else
              OutlinedButton.icon(
                onPressed: _busy ? null : _stopListening,
                icon: const Icon(Icons.stop_circle_outlined),
                label: Text(context.l10n.cancel),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCapturedCard(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final label = _buttonLabel(context);
    final signal = _capturedSignal!;
    final hasWaveform = _hasWaveformPreview(signal);

    return Column(
      children: [
        Card(
          elevation: 0,
          color: cs.primaryContainer.withValues(alpha: 0.34),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: cs.primary.withValues(alpha: 0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            context.l10n.learningModeCapturedSummary,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _CapturedSignalPreviewTabs(
                  signal: signal,
                  hasWaveform: hasWaveform,
                  rawPreview: _rawPreview,
                  protocolPreview: _capturePreviewBody(signal),
                  replaying: _busy,
                  looping: _replayLooping,
                  replayAnimation: _replayWaveformController,
                  replayWaveformActive: _replayWaveformActive,
                  frequencyHz: _waveformFrequencyHz(signal),
                  onReplay: _busy
                      ? null
                      : () => _replayCapturedSignal(showFeedback: true),
                  onToggleLoop: _toggleReplayLoop,
                  onCopyRaw: _copyRawPreview,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        Card(
          elevation: 0,
          color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.45)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.learningModeResultActionsTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  context.l10n.learningModeResultActionsBody,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _buttonNameCtrl,
                  decoration: InputDecoration(
                    labelText: context.l10n.learningModeButtonNameLabel,
                    hintText: context.l10n.learningModeButtonNameHint,
                    prefixIcon: const Icon(Icons.label_outline_rounded),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 16),
                SegmentedButton<_LearningSaveTarget>(
                  segments: [
                    ButtonSegment<_LearningSaveTarget>(
                      value: _LearningSaveTarget.existingRemote,
                      icon: const Icon(Icons.settings_remote_rounded),
                      label:
                          Text(context.l10n.learningModeSaveToExistingRemote),
                    ),
                    ButtonSegment<_LearningSaveTarget>(
                      value: _LearningSaveTarget.newRemote,
                      icon: const Icon(Icons.add_box_rounded),
                      label: Text(context.l10n.learningModeCreateNewRemote),
                    ),
                  ],
                  selected: <_LearningSaveTarget>{_saveTarget},
                  onSelectionChanged: _busy
                      ? null
                      : (selection) {
                          setState(() => _saveTarget = selection.first);
                        },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _busy ? null : _replayCapturedSignal,
                        icon: const Icon(Icons.play_arrow_rounded),
                        label: Text(context.l10n.learningModeReplayAction),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: _busy ? null : _saveCapture,
                        icon: const Icon(Icons.save_alt_rounded),
                        label: Text(context.l10n.learningModeSaveCapture),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: _busy ? null : _learnAnother,
                    icon: const Icon(Icons.refresh_rounded),
                    label: Text(context.l10n.learningModeLearnAnotherAction),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.learningModeTitle),
        actions: [
          IconButton(
            tooltip: RemoteOrientationController.instance.flipped
                ? context.l10n.remoteOrientationFlippedTooltip
                : context.l10n.remoteOrientationNormalTooltip,
            onPressed: () async {
              final next = !RemoteOrientationController.instance.flipped;
              await RemoteOrientationController.instance.setFlipped(next);
              setState(() {});
            },
            icon: const Icon(Icons.screen_rotation_rounded),
          ),
        ],
      ),
      body: Transform.rotate(
        angle: RemoteOrientationController.instance.flipped
            ? 3.1415926535897932
            : 0.0,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
            children: [
              _buildStatusCard(context),
              const SizedBox(height: 14),
              if (!_hardwareReady)
                _buildSetupCard(context)
              else if (_captureState == _LearningCaptureState.captured)
                _buildCapturedCard(context)
              else
                _buildListenCard(context),
            ],
          ),
        ),
      ),
    );
  }
}

enum _LearningHardwareState {
  checking,
  ready,
  permissionRequired,
  needsSetup,
  noReceiver,
}

enum _LearningCaptureState {
  idle,
  listening,
  captured,
}

enum _LearningSaveTarget {
  existingRemote,
  newRemote,
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
    required this.foreground,
    required this.background,
  });

  final IconData icon;
  final String label;
  final Color foreground;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: foreground),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: foreground,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InlineNotice extends StatelessWidget {
  const _InlineNotice({required this.message, required this.tone});

  final String message;
  final _NoticeTone tone;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final Color fg = tone == _NoticeTone.error ? cs.error : cs.primary;
    final Color bg = tone == _NoticeTone.error
        ? cs.errorContainer.withValues(alpha: 0.55)
        : cs.primaryContainer.withValues(alpha: 0.55);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: fg,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}

enum _NoticeTone { error }

class _CapturedSignalPreviewTabs extends StatelessWidget {
  const _CapturedSignalPreviewTabs({
    required this.signal,
    required this.hasWaveform,
    required this.rawPreview,
    required this.protocolPreview,
    required this.replaying,
    required this.looping,
    required this.replayAnimation,
    required this.replayWaveformActive,
    required this.frequencyHz,
    required this.onReplay,
    required this.onToggleLoop,
    required this.onCopyRaw,
  });

  final LearnedUsbSignal signal;
  final bool hasWaveform;
  final String rawPreview;
  final String protocolPreview;
  final bool replaying;
  final bool looping;
  final Animation<double> replayAnimation;
  final bool replayWaveformActive;
  final int frequencyHz;
  final VoidCallback? onReplay;
  final VoidCallback onToggleLoop;
  final VoidCallback onCopyRaw;

  @override
  Widget build(BuildContext context) {
    final hasRaw = rawPreview.trim().isNotEmpty;
    final tabCount = hasRaw ? 2 : 1;

    return DefaultTabController(
      length: tabCount,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.surface.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .outlineVariant
                    .withValues(alpha: 0.5),
              ),
            ),
            child: TabBar(
              tabs: [
                Tab(text: context.l10n.irWaveformTitle),
                if (hasRaw) Tab(text: context.l10n.learningModeRawPreviewTitle),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: hasWaveform ? 410 : 260,
            child: TabBarView(
              children: [
                _CapturedWaveformTab(
                  signal: signal,
                  hasWaveform: hasWaveform,
                  protocolPreview: protocolPreview,
                  replaying: replaying,
                  looping: looping,
                  replayAnimation: replayAnimation,
                  replayWaveformActive: replayWaveformActive,
                  frequencyHz: frequencyHz,
                  onReplay: onReplay,
                  onToggleLoop: onToggleLoop,
                ),
                if (hasRaw)
                  _RawFallbackTab(
                    rawPreview: rawPreview,
                    onCopyRaw: onCopyRaw,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CapturedWaveformTab extends StatelessWidget {
  const _CapturedWaveformTab({
    required this.signal,
    required this.hasWaveform,
    required this.protocolPreview,
    required this.replaying,
    required this.looping,
    required this.replayAnimation,
    required this.replayWaveformActive,
    required this.frequencyHz,
    required this.onReplay,
    required this.onToggleLoop,
  });

  final LearnedUsbSignal signal;
  final bool hasWaveform;
  final String protocolPreview;
  final bool replaying;
  final bool looping;
  final Animation<double> replayAnimation;
  final bool replayWaveformActive;
  final int frequencyHz;
  final VoidCallback? onReplay;
  final VoidCallback onToggleLoop;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (hasWaveform)
          AnimatedBuilder(
            animation: replayAnimation,
            builder: (context, _) {
              return IrWaveformPanel(
                pattern: signal.rawPatternUs,
                frequencyHz: frequencyHz,
                compact: true,
                playheadProgress:
                    replayWaveformActive ? replayAnimation.value : null,
              );
            },
          ),
        if (hasWaveform) const SizedBox(height: 12),
        _PreviewBlock(
          title: context.l10n.learningModeProtocolPreviewTitle,
          body: protocolPreview,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: onReplay,
                icon: replaying
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.play_arrow_rounded),
                label: Text(context.l10n.learningModeReplayAction),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: onToggleLoop,
                icon: Icon(looping ? Icons.stop_rounded : Icons.loop_rounded),
                label: Text(
                    looping ? context.l10n.stopLoop : context.l10n.startLoop),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RawFallbackTab extends StatelessWidget {
  const _RawFallbackTab({
    required this.rawPreview,
    required this.onCopyRaw,
  });

  final String rawPreview;
  final VoidCallback onCopyRaw;

  @override
  Widget build(BuildContext context) {
    return _PreviewBlock(
      title: context.l10n.learningModeRawPreviewTitle,
      body: rawPreview,
      trailing: FilledButton.tonalIcon(
        onPressed: onCopyRaw,
        icon: const Icon(Icons.copy_rounded),
        label: Text(context.l10n.copyCode),
      ),
    );
  }
}

class _PreviewBlock extends StatelessWidget {
  const _PreviewBlock({
    required this.title,
    required this.body,
    this.trailing,
  });

  final String title;
  final String body;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 12),
                trailing!,
              ],
            ],
          ),
          const SizedBox(height: 8),
          SelectableText(
            body,
            style: theme.textTheme.bodySmall?.copyWith(
              height: 1.35,
              color: cs.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
