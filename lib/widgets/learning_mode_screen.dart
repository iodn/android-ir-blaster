import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/state/orientation_pref.dart';
import 'package:irblaster_controller/utils/ir_transmitter_platform.dart';
import 'package:irblaster_controller/utils/remote.dart';

class LearningModeScreen extends StatefulWidget {
  const LearningModeScreen({super.key});

  @override
  State<LearningModeScreen> createState() => _LearningModeScreenState();
}

class _LearningModeScreenState extends State<LearningModeScreen>
    with SingleTickerProviderStateMixin {
  static const int _tiqiaaVid1 = 0x10C4;
  static const int _tiqiaaVid2 = 0x045E;
  static const int _tiqiaaPid = 0x8468;

  final TextEditingController _buttonNameCtrl = TextEditingController();

  StreamSubscription<IrTransmitterCapabilities>? _capsSub;
  IrTransmitterCapabilities? _caps;
  LearnedUsbSignal? _capturedSignal;
  bool _busy = false;
  String? _errorText;
  _LearningCaptureState _captureState = _LearningCaptureState.idle;
  _LearningSaveTarget _saveTarget = _LearningSaveTarget.existingRemote;

  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

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
    _loadCaps();
    _capsSub = IrTransmitterPlatform.capabilitiesEvents().listen((caps) {
      if (!mounted) return;
      setState(() => _caps = caps);
    });
  }

  @override
  void dispose() {
    _capsSub?.cancel();
    _buttonNameCtrl.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _loadCaps() async {
    try {
      final caps = await IrTransmitterPlatform.getCapabilities();
      if (!mounted) return;
      setState(() => _caps = caps);
    } catch (_) {}
  }

  List<UsbDeviceInfo> get _learningDevices {
    final caps = _caps;
    if (caps == null) return const [];
    return caps.usbDevices.where(_isTiqiaaFamily).toList(growable: false);
  }

  bool _isTiqiaaFamily(UsbDeviceInfo d) {
    return d.productId == _tiqiaaPid &&
        (d.vendorId == _tiqiaaVid1 || d.vendorId == _tiqiaaVid2);
  }

  _LearningHardwareState get _hardwareState {
    final caps = _caps;
    if (caps == null) return _LearningHardwareState.checking;
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
      final learned = await IrTransmitterPlatform.learnUsbSignal(timeoutMs: 30000);
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

  Future<void> _stopListening() async {
    setState(() => _busy = true);
    try {
      await IrTransmitterPlatform.cancelUsbLearning();
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

  Future<void> _replayCapturedSignal() async {
    final signal = _capturedSignal;
    if (signal == null || _busy) return;
    setState(() => _busy = true);
    try {
      final ok = await IrTransmitterPlatform.replayLearnedUsbSignal(
        family: signal.family,
        opaqueFrameBase64: signal.opaqueFrameBase64,
      );
      if (!mounted) return;
      final msg = ok
          ? context.l10n.learningModeReplaySent
          : context.l10n.learningModeReplayFailed;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(msg)));
      await Haptics.selectionClick();
    } catch (e) {
      if (!mounted) return;
      final msg = e is PlatformException
          ? (e.message ?? context.l10n.learningModeReplayFailed)
          : context.l10n.learningModeReplayFailed;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _learnAnother() async {
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
    setState(() => _busy = true);
    try {
      final remotes = await readRemotes();
      if (_saveTarget == _LearningSaveTarget.existingRemote) {
        if (remotes.isEmpty) {
          throw Exception(l10n.learningModeNoRemotesAvailable);
        }
        final selected = await _pickRemote(remotes);
        if (selected == null) return;
        final updated = remotes.map((r) {
          if (r.id != selected.id) return r;
          return Remote(
            id: r.id,
            name: r.name,
            useNewStyle: r.useNewStyle,
            buttons: [...r.buttons, _buildSavedButton(signal)],
          );
        }).toList(growable: false);
        await writeRemotelist(updated);
      } else {
        final remoteName = await _promptForNewRemoteName();
        if (remoteName == null) return;
        final updated = [...remotes];
        updated.add(
          Remote(
            name: remoteName,
            buttons: <IRButton>[_buildSavedButton(signal)],
          ),
        );
        await writeRemotelist(updated);
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.learningModeSaveSuccess)));
      await Haptics.mediumImpact();
    } catch (e) {
      if (!mounted) return;
      final msg =
          e is Exception ? e.toString().replaceFirst('Exception: ', '') : l10n.learningModeSaveFailed;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  IRButton _buildSavedButton(LearnedUsbSignal signal) {
    return IRButton(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      image: _buttonLabel(context),
      isImage: false,
      frequency: signal.frequencyHz,
      rawData: signal.rawPreview,
      protocol: IrProtocolIds.tiqiaaLearned,
      protocolParams: <String, dynamic>{
        'family': signal.family,
        'opaqueFrameBase64': signal.opaqueFrameBase64,
        'opaqueMeta': signal.opaqueMeta,
        'quality': signal.quality,
        'frequencyHz': signal.frequencyHz,
        'rawPreview': signal.rawPreview,
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
      return switch (_hardwareState) {
        _LearningHardwareState.permissionRequired =>
          context.l10n.learningModeStatusPermissionTitle,
        _LearningHardwareState.needsSetup =>
          context.l10n.learningModeStatusSetupTitle,
        _LearningHardwareState.noReceiver =>
          context.l10n.learningModeStatusNoReceiverTitle,
        _LearningHardwareState.checking =>
          context.l10n.learningModeStatusCheckingTitle,
        _LearningHardwareState.ready => context.l10n.learningModeStatusReadyTitle,
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
                    icon: Icons.usb_rounded,
                    label: _learningDevices.isEmpty
                        ? 'Tiqiaa / ZaZa USB'
                        : '${_learningDevices.first.productName.isEmpty ? 'Tiqiaa / ZaZa USB' : _learningDevices.first.productName} (${_learningDevices.first.vendorId.toRadixString(16)}:${_learningDevices.first.productId.toRadixString(16)})',
                    foreground: cs.onSurface,
                    background: cs.surfaceContainerHighest,
                  ),
                ),
              ],
            ),
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
              context.l10n.learningModeConnectReceiverTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              context.l10n.learningModeConnectReceiverBody,
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
      color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.45)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: listening
                      ? [
                          cs.tertiaryContainer.withValues(alpha: 0.86),
                          cs.primaryContainer.withValues(alpha: 0.74),
                        ]
                      : [
                          cs.primaryContainer.withValues(alpha: 0.82),
                          cs.secondaryContainer.withValues(alpha: 0.64),
                        ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ScaleTransition(
                    scale: listening
                        ? _pulseAnimation
                        : const AlwaysStoppedAnimation(1.0),
                    child: Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cs.onPrimaryContainer.withValues(alpha: 0.12),
                      ),
                      child: Icon(
                        listening
                            ? Icons.graphic_eq_rounded
                            : Icons.hearing_rounded,
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
                _PreviewBlock(
                  title: context.l10n.learningModeProtocolPreviewTitle,
                  body: 'Tiqiaa USB learned frame\n${IrProtocolRegistry.displayName(IrProtocolIds.tiqiaaLearned)}\n${signal.frequencyHz} Hz',
                  trailing: FilledButton.tonal(
                    onPressed: _busy ? null : _replayCapturedSignal,
                    child: Text(context.l10n.learningModeReplayAction),
                  ),
                ),
                const SizedBox(height: 12),
                _PreviewBlock(
                  title: context.l10n.learningModeRawPreviewTitle,
                  body: _rawPreview,
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
                      label: Text(context.l10n.learningModeSaveToExistingRemote),
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
