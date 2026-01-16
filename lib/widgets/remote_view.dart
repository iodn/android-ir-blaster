import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/state/orientation_pref.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/create_remote.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class RemoteView extends StatefulWidget {
  final Remote remote;
  final VoidCallback? onEditRemote;
  final Future<void> Function()? onDeleteRemote;

  const RemoteView({
    super.key,
    required this.remote,
    this.onEditRemote,
    this.onDeleteRemote,
  });

  @override
  RemoteViewState createState() => RemoteViewState();
}

class RemoteViewState extends State<RemoteView> {
  bool _reorderMode = false;

  bool _rotate180 = false;
  final RemoteOrientationController _orientation = RemoteOrientationController.instance;

  late Remote _remote;

  static const Duration _kLoopInterval = Duration(milliseconds: 250);
  Timer? _loopTimer;
  IRButton? _loopButton;
  bool _loopSending = false;

  bool get _isLooping => _loopTimer != null;
  bool _isLoopingThis(IRButton b) => _isLooping && identical(_loopButton, b);

  @override
  void initState() {
    super.initState();
    _remote = widget.remote;

    _rotate180 = _orientation.flipped;

    hasIrEmitter().then((value) {
      if (!value && mounted) {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('No IR emitter'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('This device does not have an IR emitter'),
                    Text('This app needs an IR emitter to function'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Dismiss'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: const Text('Close'),
                  onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void didUpdateWidget(covariant RemoteView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.remote, widget.remote)) {
      _remote = widget.remote;
    }
  }

  @override
  void dispose() {
    _stopLoop(silent: true);
    super.dispose();
  }

  Future<void> _sendOnce(IRButton button, {bool silent = false}) async {
    if (!silent) await Haptics.lightImpact();
    try {
      await sendIR(button);
    } catch (e) {
      if (!silent && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send IR: $e')),
        );
      }
      rethrow;
    }
  }

  Future<void> _handleButtonPress(IRButton button) async {
    await _sendOnce(button);
  }

  void _startLoop(IRButton button) {
    _stopLoop(silent: true);

    setState(() {
      _loopButton = button;
      _loopSending = false;
    });

    _sendOnce(button, silent: true).catchError((e) {
      _stopLoop(silent: true);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to start loop: $e')),
      );
    });

    _loopTimer = Timer.periodic(_kLoopInterval, (_) async {
      if (_loopSending) return;
      final b = _loopButton;
      if (b == null) return;

      _loopSending = true;
      try {
        await sendIR(b);
      } catch (e) {
        _stopLoop(silent: true);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Loop stopped (send failed): $e')),
        );
      } finally {
        _loopSending = false;
      }
    });

    if (!mounted) return;
    final title = _buttonTitle(button);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Looping "$title". Tap Stop in the top bar to stop.'),
        duration: const Duration(seconds: 3),
      ),
    );
    Haptics.selectionClick();
  }

  void _stopLoop({bool silent = false}) {
    _loopTimer?.cancel();
    _loopTimer = null;

    final hadLoop = _loopButton != null;
    setState(() {
      _loopButton = null;
      _loopSending = false;
    });

    if (!silent && hadLoop && mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Loop stopped.'),
          duration: Duration(seconds: 2),
        ),
      );
      Haptics.selectionClick();
    }
  }

  int _findRemoteIndexInGlobalList() {
    final int byIdentity = remotes.indexWhere((r) => identical(r, _remote));
    if (byIdentity >= 0) return byIdentity;

    final int id = _remote.id;
    if (id > 0) {
      final int byId = remotes.indexWhere((r) => r.id == id);
      if (byId >= 0) return byId;
    }

    return -1;
  }

  void _reassignIds() {
    for (int i = 0; i < remotes.length; i++) {
      remotes[i].id = i + 1;
    }
  }

  Future<void> _editRemote() async {
    if (_isLooping) _stopLoop(silent: false);

    if (widget.onEditRemote != null) {
      widget.onEditRemote!.call();
      return;
    }

    final int idx = _findRemoteIndexInGlobalList();

    try {
      final Remote edited = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateRemote(remote: _remote)),
      );

      if (!mounted) return;

      setState(() => _remote = edited);

      if (idx >= 0 && idx < remotes.length) {
        remotes[idx] = edited;
        await writeRemotelist(remotes);
        notifyRemotesChanged();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Remote updated on screen. It was not found in the saved list.',
            ),
          ),
        );
      }

      HapticFeedback.selectionClick();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Updated "${edited.name}".')),
      );
    } catch (_) {}
  }

  Future<void> _deleteRemote() async {
    if (_isLooping) _stopLoop(silent: false);

    if (widget.onDeleteRemote != null) {
      final ok = await _confirmDeleteRemote();
      if (!ok) return;

      try {
        await widget.onDeleteRemote!.call();
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Delete failed: $e')),
        );
        return;
      }

      if (!mounted) return;
      Navigator.of(context).maybePop();
      return;
    }

    final bool ok = await _confirmDeleteRemote();
    if (!ok) return;

    final int idx = _findRemoteIndexInGlobalList();
    if (idx < 0 || idx >= remotes.length) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Remote not found in saved list.')),
      );
      return;
    }

    final String name = _remote.name;

    setState(() {
      remotes.removeAt(idx);
      _reassignIds();
    });

    await writeRemotelist(remotes);
    notifyRemotesChanged();

    if (!mounted) return;
    HapticFeedback.selectionClick();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Deleted "$name".')),
    );
    Navigator.of(context).maybePop();
  }

  String _stripFileExtension(String s) {
    final int dot = s.lastIndexOf('.');
    if (dot <= 0) return s;
    return s.substring(0, dot);
  }

  String _buttonTitle(IRButton b) {
    final raw = b.image.trim();
    if (raw.isEmpty) return 'Button';
    if (!b.isImage) return raw;

    final s = raw.replaceAll('\\', '/');
    final parts = s.split('/');
    final last = parts.isNotEmpty ? parts.last : raw;
    final clean = last.isEmpty ? 'Image' : _stripFileExtension(last);
    return clean.isEmpty ? 'Image' : clean;
  }

  bool _hasProtocol(IRButton b) => b.protocol != null && b.protocol!.trim().isNotEmpty;

  Map<String, dynamic>? _protocolParams(IRButton b) {
    final dynamic p = b.protocolParams;
    if (p is Map<String, dynamic>) return p;
    if (p is Map) return p.map((k, v) => MapEntry(k.toString(), v));
    return null;
  }

  String _protocolLabel(IRButton b) {
    if (_hasProtocol(b)) return IrProtocolRegistry.displayName(b.protocol);
    if (_isRawSignalButton(b)) return 'RAW';
    return 'NEC';
  }

  bool _isRawProtocol(IRButton b) {
    if (!_hasProtocol(b)) return false;
    final String id = b.protocol!.trim();
    if (id != 'raw') return false;

    final params = _protocolParams(b);
    if (params == null) return true;

    final pattern = params['pattern'];
    return pattern is String && pattern.trim().isNotEmpty;
  }

  bool _isLegacyRawSignalButton(IRButton b) {
    final String? raw = b.rawData?.trim();
    if (raw == null || raw.isEmpty) return false;
    if (_hasProtocol(b)) return false;
    if (isNecConfigString(raw)) return false;

    final int numbers = RegExp(r'-?\d+').allMatches(raw).length;
    final bool hasSeparators = RegExp(r'[,\s]').hasMatch(raw);
    return numbers >= 6 && hasSeparators;
  }

  bool _isRawSignalButton(IRButton b) {
    if (_isRawProtocol(b)) return true;
    return _isLegacyRawSignalButton(b);
  }

  String _formatHex(int value, {required int minWidth}) {
    final s = value.toRadixString(16).toUpperCase();
    if (s.length >= minWidth) return s;
    return s.padLeft(minWidth, '0');
  }

  bool _isAllZeros(String token) {
    if (token.isEmpty) return true;
    for (int i = 0; i < token.length; i++) {
      if (token.codeUnitAt(i) != 48) return false;
    }
    return true;
  }

  String? _extractHexToken(String s) {
    final m0x = RegExp(r'0x([0-9a-fA-F]{1,16})').firstMatch(s);
    if (m0x != null) return m0x.group(1)!.toUpperCase();

    final matches = RegExp(r'(?<![0-9a-fA-F])([0-9a-fA-F]{1,16})(?![0-9a-fA-F])').allMatches(s).toList();
    if (matches.isEmpty) return null;

    String best = matches.first.group(1)!.toUpperCase();
    int bestLen = best.length;
    bool bestNonZero = !_isAllZeros(best);
    int bestStart = matches.first.start;

    for (final m in matches.skip(1)) {
      final token = m.group(1)!.toUpperCase();
      final len = token.length;
      final nonZero = !_isAllZeros(token);
      final start = m.start;

      final bool better =
          (len > bestLen) ||
          (len == bestLen && nonZero && !bestNonZero) ||
          (len == bestLen && nonZero == bestNonZero && start < bestStart);

      if (better) {
        best = token;
        bestLen = len;
        bestNonZero = nonZero;
        bestStart = start;
      }
    }

    return best;
  }

  String? _dynToHex(dynamic v, {int minWidth = 4}) {
    if (v == null) return null;

    if (v is int) {
      return _formatHex(v, minWidth: minWidth);
    }

    if (v is num) {
      return _formatHex(v.toInt(), minWidth: minWidth);
    }

    if (v is String) {
      final t = v.trim();
      if (t.isEmpty) return null;
      final extracted = _extractHexToken(t);
      if (extracted == null) return null;
      return extracted.padLeft(minWidth, '0');
    }

    if (v is Iterable) {
      for (final e in v) {
        final hex = _dynToHex(e, minWidth: minWidth);
        if (hex == null) continue;
        if (_isAllZeros(hex)) continue;
        return hex;
      }
      for (final e in v) {
        final hex = _dynToHex(e, minWidth: minWidth);
        if (hex != null) return hex;
      }
    }

    return null;
  }

  String? _paramHex(Map<String, dynamic>? params, List<String> keys, {int minWidth = 4}) {
    if (params == null) return null;
    for (final k in keys) {
      if (!params.containsKey(k)) continue;
      final hex = _dynToHex(params[k], minWidth: minWidth);
      if (hex != null) return hex;
    }
    return null;
  }

  String? _displayHex(IRButton b) {
    if (_isRawSignalButton(b)) return null;

    final params = _protocolParams(b);
    final String protoId = (b.protocol ?? '').trim().toLowerCase();

    final String? cmd = _paramHex(
      params,
      const ['command', 'cmd', 'function', 'subcommand', 'scancode', 'keycode'],
      minWidth: 4,
    );

    final String? addr = _paramHex(
      params,
      const ['address', 'addr', 'device', 'dev', 'subdevice'],
      minWidth: 4,
    );

    final String? vendor = _paramHex(
      params,
      const ['vendor', 'vendorId', 'vendor_id', 'maker', 'manufacturer', 'manuf'],
      minWidth: 4,
    );

    if (protoId == 'kaseikyo' || protoId.startsWith('kaseikyo')) {
      if (vendor != null && addr != null && cmd != null) return '$vendor-$addr-$cmd';
      if (addr != null && cmd != null) return '$addr-$cmd';
      if (cmd != null) return cmd;
    }

    if (addr != null && cmd != null) return '$addr-$cmd';
    if (cmd != null) return cmd;

    final String? directHex = _paramHex(
      params,
      const ['hex', 'code', 'value', 'data'],
      minWidth: 4,
    );
    if (directHex != null) return directHex;

    final int? v = b.code;
    if (v != null) return _formatHex(v, minWidth: 4);

    final String? raw = b.rawData?.trim();
    if (raw != null && raw.isNotEmpty) {
      final extracted = _extractHexToken(raw);
      if (extracted != null) return extracted.padLeft(4, '0');
    }

    return null;
  }

  int _effectiveFrequencyHz(IRButton b) {
    if (_isRawProtocol(b)) {
      final params = _protocolParams(b);
      final dynamic f = params?['frequencyHz'];
      if (f is int && f > 0) return f;
      if (f is num && f.toInt() > 0) return f.toInt();
    }

    final int? f = b.frequency;
    if (f != null && f > 0) return f;

    if (_hasProtocol(b)) return 38000;
    if (_isRawSignalButton(b)) return 38000;
    return kDefaultNecFrequencyHz;
  }

  String _freqLabelKhz(IRButton b) {
    final int khz = (_effectiveFrequencyHz(b) / 1000).round();
    return '${khz}kHz';
  }

  Widget _pill(
    BuildContext context,
    String text, {
    Color? bg,
    Color? fg,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    double radius = 999,
    double fontSize = 10,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color background = bg ?? colorScheme.secondaryContainer.withValues(alpha: 0.9);
    final Color foreground = fg ?? colorScheme.onSecondaryContainer;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.25),
        ),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          color: foreground,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Future<void> _openRemoteActionsSheet() async {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: cs.primaryContainer.withValues(alpha: 0.65),
                      child: Icon(Icons.settings_remote_rounded, color: cs.onPrimaryContainer),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _remote.name,
                            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${_remote.buttons.length} button(s) · ${_remote.useNewStyle ? 'Comfort' : 'Compact'}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: cs.onSurface.withValues(alpha: 0.7),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(height: 0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.edit_outlined),
                  title: const Text('Edit remote'),
                  subtitle: const Text('Rename, reorder, and edit buttons'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {
                    Navigator.of(ctx).pop();
                    _editRemote();
                  },
                ),
                const Divider(height: 0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.delete_outline, color: cs.error),
                  title: Text(
                    'Delete remote',
                    style: TextStyle(color: cs.error, fontWeight: FontWeight.w800),
                  ),
                  subtitle: const Text('This cannot be undone'),
                  onTap: () async {
                    Navigator.of(ctx).pop();
                    await _deleteRemote();
                  },
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<bool> _confirmDeleteRemote() async {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: Icon(Icons.warning_amber_rounded, color: cs.error),
        title: const Text('Delete remote?'),
        content: Text(
          '"${_remote.name}" will be deleted permanently.',
          style: theme.textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton.tonal(
            style: FilledButton.styleFrom(
              foregroundColor: cs.onErrorContainer,
              backgroundColor: cs.errorContainer,
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    ).then((v) => v ?? false);
  }

  Future<void> _openButtonActions(IRButton b) async {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final String label = _buttonTitle(b);
    final String proto = _protocolLabel(b);
    final String freq = _freqLabelKhz(b);
    final bool isRaw = _isRawSignalButton(b);
    final String? displayHex = _displayHex(b);
    final bool loopingThis = _isLoopingThis(b);

    final String typeLine = 'Type: $proto';
    final String codeLine = isRaw ? 'Code: Raw signal' : 'Code: ${displayHex ?? 'NO CODE'}';
    final String freqLine = 'Frequency: $freq';

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: cs.secondaryContainer.withValues(alpha: 0.75),
                      child: Icon(Icons.touch_app_outlined, color: cs.onSecondaryContainer),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            typeLine,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: cs.onSurface.withValues(alpha: 0.7),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: cs.outlineVariant.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        codeLine,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontFamily: isRaw ? null : 'monospace',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        freqLine,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurface.withValues(alpha: 0.75),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            loopingThis ? Icons.sync_rounded : Icons.info_outline,
                            size: 16,
                            color: cs.onSurface.withValues(alpha: 0.75),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              loopingThis ? 'Loop is running for this button.' : 'Tip: Use Loop to repeat until you stop it.',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: cs.onSurface.withValues(alpha: 0.75),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          _handleButtonPress(b);
                        },
                        icon: const Icon(Icons.play_arrow_rounded),
                        label: const Text('Send'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.tonalIcon(
                        onPressed: (isRaw || displayHex == null)
                            ? null
                            : () async {
                                await Clipboard.setData(
                                  ClipboardData(text: displayHex),
                                );
                                if (!mounted) return;
                                Navigator.of(ctx).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Code copied.')),
                                );
                                HapticFeedback.selectionClick();
                              },
                        icon: const Icon(Icons.copy_rounded),
                        label: const Text('Copy code'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: loopingThis
                      ? FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: cs.error,
                            foregroundColor: cs.onError,
                          ),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            _stopLoop(silent: false);
                          },
                          icon: const Icon(Icons.stop_rounded),
                          label: const Text('Stop loop'),
                        )
                      : FilledButton.tonalIcon(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            _startLoop(b);
                          },
                          icon: const Icon(Icons.loop_rounded),
                          label: const Text('Start loop'),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final bool useNewStyle = _remote.useNewStyle;
    final int count = _remote.buttons.length;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_remote.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 2),
            Text(
              '$count button(s)',
              style: theme.textTheme.labelSmall?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.65),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: _rotate180 ? 'Orientation: flipped (tap to normal)' : 'Orientation: normal (tap to flip)',
            onPressed: () async {
              final next = !_rotate180;
              setState(() => _rotate180 = next);
              await _orientation.setFlipped(next);
            },
            icon: const Icon(Icons.screen_rotation_rounded),
          ),
          if (_isLooping)
            IconButton(
              tooltip: 'Stop loop',
              onPressed: () => _stopLoop(silent: false),
              icon: Icon(Icons.stop_circle_rounded, color: cs.error),
            ),
          IconButton(
            tooltip: _reorderMode ? 'Done' : 'Reorder buttons',
            onPressed: () {
              setState(() => _reorderMode = !_reorderMode);
              Haptics.selectionClick();

              if (_reorderMode && mounted) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Reorder mode: long-press and drag a button to move it.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            icon: Icon(_reorderMode ? Icons.check_rounded : Icons.drag_indicator_rounded),
          ),
          IconButton(
            tooltip: 'Manage remote',
            onPressed: _openRemoteActionsSheet,
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: _onWillPop,
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: (!_reorderMode || count == 0)
                    ? const SizedBox.shrink()
                    : _ReorderHintBanner(
                        key: const ValueKey('reorder_hint'),
                        onDone: () => setState(() => _reorderMode = false),
                      ),
              ),
              Expanded(
                child: Transform.rotate(
                  angle: _rotate180 ? 3.1415926535897932 : 0.0,
                  child: count == 0
                      ? _EmptyRemoteState(onManage: _openRemoteActionsSheet)
                      : (useNewStyle ? _buildComfortGrid() : _buildCompactGrid()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_reorderMode) {
      setState(() => _reorderMode = false);
      return false;
    }
    return true;
  }

  Widget _buildCompactGrid() {
    final dragDelay = _reorderMode ? const Duration(milliseconds: 200) : const Duration(days: 3650);
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final cardColor = cs.primary.withValues(alpha: 0.20);

    return ReorderableGridView.builder(
      padding: EdgeInsets.fromLTRB(
        12,
        12,
        12,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      itemCount: _remote.buttons.length,
      dragStartDelay: dragDelay,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final IRButton button = _remote.buttons[index];
        final String proto = _protocolLabel(button);

        final Widget content = button.isImage
            ? (button.image.startsWith("assets/") ? Image.asset(button.image, fit: BoxFit.contain) : Image.file(File(button.image), fit: BoxFit.contain))
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    button.image,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: cs.onSurface,
                      height: 1.1,
                    ),
                  ),
                ),
              );

        return Material(
          key: ValueKey(button.id),
          color: cardColor,
          borderRadius: BorderRadius.circular(14),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => _handleButtonPress(button),
            onLongPress: _reorderMode ? null : () => _openButtonActions(button),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: content,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: _pill(
                    context,
                    proto,
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      onReorder: (oldIndex, newIndex) async {
        if (!_reorderMode) return;

        setState(() {
          if (newIndex > oldIndex) newIndex--;
          final moved = _remote.buttons.removeAt(oldIndex);
          _remote.buttons.insert(newIndex, moved);
        });

        final idx = _findRemoteIndexInGlobalList();
        if (idx >= 0) {
          remotes[idx] = _remote;
          await writeRemotelist(remotes);
          notifyRemotesChanged();
        }

        if (mounted) Haptics.selectionClick();
      },
    );
  }

  Widget _buildComfortGrid() {
    final dragDelay = _reorderMode ? const Duration(milliseconds: 200) : const Duration(days: 3650);
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final cardColor = cs.primary.withValues(alpha: 0.20);

    return ReorderableGridView.builder(
      padding: EdgeInsets.fromLTRB(
        12,
        12,
        12,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 130,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: _remote.buttons.length,
      dragStartDelay: dragDelay,
      onReorder: (oldIndex, newIndex) async {
        if (!_reorderMode) return;

        setState(() {
          if (newIndex > oldIndex) newIndex--;
          final moved = _remote.buttons.removeAt(oldIndex);
          _remote.buttons.insert(newIndex, moved);
        });

        final idx = _findRemoteIndexInGlobalList();
        if (idx >= 0) {
          remotes[idx] = _remote;
          await writeRemotelist(remotes);
          notifyRemotesChanged();
        }

        if (mounted) Haptics.selectionClick();
      },
      itemBuilder: (context, index) {
        final IRButton button = _remote.buttons[index];

        final bool isRaw = _isRawSignalButton(button);
        final String title = _buttonTitle(button);
        final String proto = _protocolLabel(button);
        final String freq = _freqLabelKhz(button);
        final String? displayHex = _displayHex(button);
        final String codeText = isRaw ? 'RAW' : (displayHex ?? 'NO CODE');

        return Card(
          key: ValueKey(button.id),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.35)),
          ),
          color: cardColor,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => _handleButtonPress(button),
            onLongPress: _reorderMode ? null : () => _openButtonActions(button),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: cs.onSurface,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      codeText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontFamily: isRaw ? null : 'monospace',
                        fontWeight: FontWeight.w800,
                        color: cs.onSurface.withValues(alpha: 0.82),
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      _pill(context, proto, fontSize: 9),
                      _pill(context, freq, fontSize: 9),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ReorderHintBanner extends StatelessWidget {
  final VoidCallback onDone;

  const _ReorderHintBanner({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Material(
      color: cs.secondaryContainer.withValues(alpha: 0.55),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
        child: Row(
          children: [
            Icon(Icons.drag_indicator_rounded, color: cs.onSecondaryContainer.withValues(alpha: 0.9)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Reorder mode: long-press and drag a button to move it.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: cs.onSecondaryContainer.withValues(alpha: 0.92),
                ),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton.tonal(
              onPressed: onDone,
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyRemoteState extends StatelessWidget {
  final VoidCallback onManage;

  const _EmptyRemoteState({required this.onManage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.grid_off_rounded, size: 52, color: cs.onSurface.withValues(alpha: 0.45)),
            const SizedBox(height: 12),
            Text(
              'No buttons in this remote',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              'Use "Edit remote" to add or configure buttons.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.7),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            FilledButton.tonalIcon(
              onPressed: onManage,
              icon: const Icon(Icons.more_horiz_rounded),
              label: const Text('Manage remote'),
            ),
          ],
        ),
      ),
    );
  }
}
