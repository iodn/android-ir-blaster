import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/state/continue_context_prefs.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/state/last_action_strip.dart';
import 'package:irblaster_controller/state/remote_highlights_prefs.dart';
import 'package:irblaster_controller/state/orientation_pref.dart';
import 'package:irblaster_controller/state/device_controls_prefs.dart';
import 'package:irblaster_controller/state/quick_settings_prefs.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/button_color_accessibility.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/create_button.dart';
import 'package:irblaster_controller/widgets/create_remote.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:uuid/uuid.dart';

class RemoteView extends StatefulWidget {
  final Remote remote;
  final VoidCallback? onEditRemote;
  final Future<void> Function()? onDeleteRemote;
  final String? initialFocusButtonId;

  const RemoteView({
    super.key,
    required this.remote,
    this.onEditRemote,
    this.onDeleteRemote,
    this.initialFocusButtonId,
  });

  @override
  RemoteViewState createState() => RemoteViewState();
}

class RemoteViewState extends State<RemoteView> {
  bool _reorderMode = false;
  bool _rotate180 = false;
  String? _highlightButtonId;
  String? _pressedButtonId;
  Timer? _highlightTimer;
  final ScrollController _gridScrollController = ScrollController();

  final RemoteOrientationController _orientation =
      RemoteOrientationController.instance;

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
    _highlightButtonId = widget.initialFocusButtonId?.trim();
    unawaited(ContinueContextsPrefs.saveLastRemote(_remote));
    unawaited(RemoteHighlightsPrefs.addRecent(_remote));
    _scheduleHighlightClear();
    _scheduleScrollToHighlightedButton();

    hasIrEmitter().then((value) {
      if (!value && mounted) {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(context.l10n.remoteNoIrEmitterTitle),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(context.l10n.remoteNoIrEmitterMessage),
                    Text(context.l10n.remoteNoIrEmitterNeedsEmitter),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(context.l10n.remoteDismiss),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text(context.l10n.remoteClose),
                  onPressed: () => SystemChannels.platform
                      .invokeMethod('SystemNavigator.pop'),
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
    if (oldWidget.initialFocusButtonId != widget.initialFocusButtonId) {
      _highlightButtonId = widget.initialFocusButtonId?.trim();
      _scheduleHighlightClear();
      _scheduleScrollToHighlightedButton();
    }
  }

  @override
  void dispose() {
    _highlightTimer?.cancel();
    _gridScrollController.dispose();
    _stopLoop(silent: true);
    super.dispose();
  }

  void _scheduleHighlightClear() {
    _highlightTimer?.cancel();
    final focusId = _highlightButtonId;
    if (focusId == null || focusId.isEmpty) return;
    _highlightTimer = Timer(const Duration(seconds: 5), () {
      if (!mounted) return;
      if (_highlightButtonId == focusId) {
        setState(() => _highlightButtonId = null);
      }
    });
  }

  void _scheduleScrollToHighlightedButton() {
    final focusId = _highlightButtonId;
    if (focusId == null || focusId.isEmpty) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _highlightButtonId != focusId) return;
      _scrollToHighlightedButton(focusId);
    });
  }

  void _scrollToHighlightedButton(String focusId) {
    if (!_gridScrollController.hasClients) return;
    final int index = _remote.buttons.indexWhere((b) => b.id == focusId);
    if (index < 0) return;

    final double topPadding = 12;
    final double targetOffset = _remote.useNewStyle
        ? _estimatedComfortOffset(index, topPadding)
        : _estimatedCompactOffset(index, topPadding);
    final double maxOffset = _gridScrollController.position.maxScrollExtent;
    final double clampedOffset = targetOffset.clamp(0.0, maxOffset);
    final double currentOffset = _gridScrollController.offset;

    if ((currentOffset - clampedOffset).abs() < 8) return;

    _gridScrollController.animateTo(
      clampedOffset,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  double _estimatedCompactOffset(int index, double topPadding) {
    const int crossAxisCount = 4;
    const double spacing = 10;
    const double horizontalPadding = 24;
    final double width = MediaQuery.sizeOf(context).width - horizontalPadding;
    final double tileWidth = (width - (spacing * (crossAxisCount - 1))) /
        crossAxisCount;
    final double rowExtent = tileWidth + spacing;
    final int row = index ~/ crossAxisCount;
    return topPadding + (row * rowExtent) - 16;
  }

  double _estimatedComfortOffset(int index, double topPadding) {
    const int crossAxisCount = 2;
    const double rowExtent = 130 + 12;
    final int row = index ~/ crossAxisCount;
    return topPadding + (row * rowExtent) - 16;
  }

  void _setPressedButton(IRButton button, bool pressed) {
    final String id = button.id;
    if (pressed) {
      if (_pressedButtonId == id) return;
      if (!mounted) return;
      setState(() => _pressedButtonId = id);
      return;
    }
    if (_pressedButtonId != id) return;
    if (!mounted) return;
    setState(() => _pressedButtonId = null);
  }

  Color _interactiveButtonColor(
    Color base,
    ColorScheme cs, {
    required bool highlighted,
    required bool pressed,
    required bool looping,
  }) {
    Color color = highlighted
        ? cs.tertiaryContainer.withValues(alpha: 0.92)
        : base;
    if (looping) {
      color = Color.alphaBlend(
        cs.secondaryContainer.withValues(alpha: 0.42),
        color,
      );
    }
    if (pressed) {
      color = Color.alphaBlend(
        cs.primary.withValues(alpha: highlighted ? 0.18 : 0.14),
        color,
      );
    }
    return color;
  }

  Future<void> _sendOnce(IRButton button, {bool silent = false}) async {
    if (!silent) await Haptics.lightImpact();
    try {
      await sendIR(button);
      showLastActionForButton(
        button: button,
        title: _buttonTitle(button),
        remoteName: _remote.name,
      );
    } catch (e) {
      if (!silent && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(context.l10n.remoteFailedToSend(e.toString()))),
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
        SnackBar(
            content: Text(context.l10n.remoteFailedToStartLoop(e.toString()))),
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
          SnackBar(
              content:
                  Text(context.l10n.remoteLoopStoppedFailed(e.toString()))),
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
        content: Text(context.l10n.remoteLoopingHint(title)),
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
        SnackBar(
          content: Text(context.l10n.remoteLoopStopped),
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

  Future<void> _persistRemote({bool showNotFoundSnack = false}) async {
    final int gi = _findRemoteIndexInGlobalList();
    if (gi >= 0 && gi < remotes.length) {
      remotes[gi] = _remote;
      await writeRemotelist(remotes);
      notifyRemotesChanged();
      return;
    }

    if (showNotFoundSnack && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.l10n.remoteUpdatedNotFound,
          ),
        ),
      );
    }
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
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              context.l10n.remoteUpdatedNotFound,
            ),
          ),
        );
      }

      Haptics.selectionClick();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.remoteUpdatedNamed(edited.name))),
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
          SnackBar(
              content: Text(context.l10n.remoteDeleteFailed(e.toString()))),
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
        SnackBar(content: Text(context.l10n.remoteNotFoundSavedList)),
      );
      return;
    }

    final String name = _remote.name;
    await RemoteHighlightsPrefs.removeForRemote(_remote);
    setState(() {
      remotes.removeAt(idx);
      _reassignIds();
    });

    await writeRemotelist(remotes);
    notifyRemotesChanged();

    if (!mounted) return;

    Haptics.selectionClick();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.remoteDeletedNamed(name))),
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
    if (raw.isEmpty) return context.l10n.buttonFallbackTitle;
    if (!b.isImage) return raw;

    final s = raw.replaceAll('\\', '/');
    final parts = s.split('/');
    final last = parts.isNotEmpty ? parts.last : raw;
    final clean = last.isEmpty
        ? context.l10n.imageFallbackTitle
        : _stripFileExtension(last);
    return clean.isEmpty ? context.l10n.imageFallbackTitle : clean;
  }

  bool _hasRenderableIcon(IRButton b) {
    if (b.iconCodePoint == null) return false;
    final family = b.iconFontFamily?.trim();
    return family != null && family.isNotEmpty;
  }

  Color _buttonBgColor(IRButton b, Color fallback) {
    return resolveButtonBackground(
      b.buttonColor == null ? null : Color(b.buttonColor!),
      fallback,
    );
  }

  Color _buttonFgColor(IRButton b, Color fallback) {
    return resolveButtonForeground(
      b.buttonColor == null ? null : Color(b.buttonColor!),
      fallback,
    );
  }

  Widget _buildPrimaryButtonVisual(
    IRButton button, {
    required ThemeData theme,
    required Color textColor,
    int maxLines = 2,
  }) {
    final String fallbackLabel = _buttonTitle(button);

    if (_hasRenderableIcon(button)) {
      return Center(
        child: Icon(
          IconData(
            button.iconCodePoint!,
            fontFamily: button.iconFontFamily,
            fontPackage: button.iconFontPackage,
          ),
          size: 34,
          color: textColor,
        ),
      );
    }

    if (button.isImage && button.image.trim().isNotEmpty) {
      if (button.image.startsWith('assets/')) {
        return Image.asset(
          button.image,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Center(
            child: Text(
              fallbackLabel,
              textAlign: TextAlign.center,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
            ),
          ),
        );
      }
      return Image.file(
        File(button.image),
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => Center(
          child: Text(
            fallbackLabel,
            textAlign: TextAlign.center,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: textColor,
            ),
          ),
        ),
      );
    }

    return Center(
      child: Text(
        fallbackLabel,
        textAlign: TextAlign.center,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
      ),
    );
  }

  bool _hasProtocol(IRButton b) =>
      b.protocol != null && b.protocol!.trim().isNotEmpty;

  Map<String, dynamic>? _protocolParams(IRButton b) {
    final dynamic p = b.protocolParams;
    if (p is Map<String, dynamic>) return p;
    if (p is Map) return p.map((k, v) => MapEntry(k.toString(), v));
    return null;
  }

  String _protocolLabel(IRButton b) {
    if (_hasProtocol(b)) {
      final String id = b.protocol!.trim();
      if (id == IrProtocolIds.tiqiaaLearned ||
          id == IrProtocolIds.elksmartLearned ||
          id == IrProtocolIds.audioLearned) {
        return 'RAW';
      }
      return IrProtocolRegistry.displayName(b.protocol);
    }
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

    final matches =
        RegExp(r'(?<![0-9a-fA-F])([0-9a-fA-F]{1,16})(?![0-9a-fA-F])')
            .allMatches(s)
            .toList();
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

      final bool better = (len > bestLen) ||
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

  String? _paramHex(
    Map<String, dynamic>? params,
    List<String> keys, {
    int minWidth = 4,
  }) {
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
      const [
        'vendor',
        'vendorId',
        'vendor_id',
        'maker',
        'manufacturer',
        'manuf',
      ],
      minWidth: 4,
    );

    if (protoId == 'kaseikyo' || protoId.startsWith('kaseikyo')) {
      if (vendor != null && addr != null && cmd != null) {
        return '$vendor-$addr-$cmd';
      }
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
    if ((b.protocol?.trim() ?? '') == IrProtocolIds.audioLearned) {
      return 0;
    }
    if (_isRawProtocol(b)) {
      final params = _protocolParams(b);
      final dynamic f = params?['frequencyHz'];
      if (f is int && f > 0) return f;
      if (f is num && f.toInt() > 0) return f.toInt();
    }

    final int? f = b.frequency;
    if (f != null && f > 0) return f;

    if (_hasProtocol(b)) {
      final String? pid = b.protocol?.trim();
      if (pid != null && pid.isNotEmpty) {
        final def = IrProtocolRegistry.definitionFor(pid);
        if (def != null && def.defaultFrequencyHz > 0) {
          return def.defaultFrequencyHz;
        }
      }
      return 38000;
    }
    if (_isRawSignalButton(b)) return 38000;

    return kDefaultNecFrequencyHz;
  }

  String _freqLabelKhz(IRButton b) {
    if (_effectiveFrequencyHz(b) <= 0) return '';
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
    final Color background =
        bg ?? colorScheme.secondaryContainer.withValues(alpha: 0.9);
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
    final bool pinned = await RemoteHighlightsPrefs.isPinned(_remote);
    if (!mounted) return;

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        final mq = MediaQuery.of(ctx);
        final maxH = mq.size.height * 0.9;

        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxH),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              cs.primaryContainer.withValues(alpha: 0.65),
                          child: Icon(
                            Icons.settings_remote_rounded,
                            color: cs.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _remote.name,
                                style: theme.textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w900),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                context.l10n.remoteLayoutSummary(
                                  _remote.buttons.length,
                                  _remote.useNewStyle
                                      ? context.l10n.layoutComfort
                                      : context.l10n.layoutCompact,
                                ),
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
                      leading: Icon(
                        pinned
                            ? Icons.push_pin_rounded
                            : Icons.push_pin_outlined,
                      ),
                      title: Text(
                        pinned
                            ? context.l10n.unpinRemote
                            : context.l10n.pinRemote,
                      ),
                      subtitle: Text(context.l10n.pinRemoteSubtitle),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () async {
                        Navigator.of(ctx).pop();
                        await RemoteHighlightsPrefs.togglePinned(_remote);
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              pinned
                                  ? context.l10n.remoteRemovedFromPinned
                                  : context.l10n.remoteAddedToPinned,
                            ),
                          ),
                        );
                      },
                    ),
                    const Divider(height: 0),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.edit_outlined),
                      title: Text(context.l10n.editRemote),
                      subtitle: Text(context.l10n.editRemoteActionsSubtitle),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        Future.microtask(_editRemote);
                      },
                    ),
                    const Divider(height: 0),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.delete_outline, color: cs.error),
                      title: Text(
                        context.l10n.deleteRemoteTitle,
                        style: TextStyle(
                          color: cs.error,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      subtitle: Text(context.l10n.thisCannotBeUndone),
                      onTap: () async {
                        Navigator.of(ctx).pop();
                        await _deleteRemote();
                      },
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
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
        title: Text(context.l10n.deleteRemoteTitle),
        content: Text(
          context.l10n.deleteRemoteMessage(_remote.name),
          style: theme.textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton.tonal(
            style: FilledButton.styleFrom(
              foregroundColor: cs.onErrorContainer,
              backgroundColor: cs.errorContainer,
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(context.l10n.delete),
          ),
        ],
      ),
    ).then((v) => v ?? false);
  }

  Future<void> _editButton(IRButton b) async {
    if (_isLoopingThis(b)) _stopLoop(silent: false);

    final int idx = _remote.buttons.indexOf(b);
    if (idx < 0) return;

    final IRButton? updated = await Navigator.push<IRButton?>(
      context,
      MaterialPageRoute(builder: (context) => CreateButton(button: b)),
    );

    if (updated == null || !mounted) return;

    setState(() {
      _remote.buttons[idx] = updated;
    });

    await _persistRemote(showNotFoundSnack: false);

    if (!mounted) return;
    Haptics.selectionClick();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              context.l10n.remoteUpdatedNamedButton(_buttonTitle(updated)))),
    );
  }

  IRButton _draftBlankButtonFrom(IRButton anchor) {
    return anchor.copyWith(
      id: const Uuid().v4(),
      image: 'New',
      isImage: false,
      protocol: null,
      protocolParams: null,
      rawData: null,
      code: null,
      frequency: null,
    );
  }

  Future<void> _createNewButtonAfter(IRButton after) async {
    if (_isLooping) _stopLoop(silent: false);

    final int idx = _remote.buttons.indexOf(after);
    final int insertAt = idx >= 0 ? idx + 1 : _remote.buttons.length;

    final IRButton draft = _draftBlankButtonFrom(after);

    final IRButton? created = await Navigator.push<IRButton?>(
      context,
      MaterialPageRoute(builder: (context) => CreateButton(button: draft)),
    );

    if (created == null || !mounted) return;

    setState(() {
      _remote.buttons.insert(insertAt, created);
    });

    await _persistRemote(showNotFoundSnack: false);

    if (!mounted) return;
    Haptics.selectionClick();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(context.l10n.buttonAddedNamed(_buttonTitle(created)))),
    );
  }

  Future<void> _duplicateButton(IRButton b) async {
    final dup = b.copyWith(id: const Uuid().v4());

    setState(() {
      final idx = _remote.buttons.indexOf(b);
      final insertAt = idx >= 0 ? idx + 1 : _remote.buttons.length;
      _remote.buttons.insert(insertAt, dup);
    });

    await _persistRemote(showNotFoundSnack: false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.buttonDuplicated)),
      );
    }
  }

  Future<void> _duplicateAndEditButton(IRButton b) async {
    final dup = b.copyWith(id: const Uuid().v4());
    final int idx = _remote.buttons.indexOf(b);
    final int newIdx = (idx >= 0 ? idx + 1 : _remote.buttons.length);

    setState(() {
      _remote.buttons.insert(newIdx, dup);
    });

    await _persistRemote(showNotFoundSnack: false);

    if (!mounted) return;
    final IRButton? updated = await Navigator.push<IRButton?>(
      context,
      MaterialPageRoute(builder: (context) => CreateButton(button: dup)),
    );

    if (updated != null && mounted) {
      setState(() {
        if (newIdx >= 0 && newIdx < _remote.buttons.length) {
          _remote.buttons[newIdx] = updated;
        }
      });

      await _persistRemote(showNotFoundSnack: false);
    }
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
    final bool isControlFav = await DeviceControlsPrefs.isFavorite(b.id);
    final bool isQuickFav = await QuickSettingsPrefs.isFavorite(b.id);
    if (!mounted) return;

    final String typeLine = 'Type: $proto';
    final String codeLine =
        isRaw ? 'Code: Raw signal' : 'Code: ${displayHex ?? 'NO CODE'}';
    final String? freqLine = freq.isEmpty ? null : 'Frequency: $freq';

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        final mq = MediaQuery.of(ctx);
        final maxH = mq.size.height * 0.9;

        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxH),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              cs.secondaryContainer.withValues(alpha: 0.75),
                          child: Icon(
                            Icons.touch_app_outlined,
                            color: cs.onSecondaryContainer,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                label,
                                style: theme.textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w900),
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
                        color:
                            cs.surfaceContainerHighest.withValues(alpha: 0.55),
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
                          if (freqLine != null) ...[
                            Text(
                              freqLine,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: cs.onSurface.withValues(alpha: 0.75),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                          Row(
                            children: [
                              Icon(
                                loopingThis
                                    ? Icons.sync_rounded
                                    : Icons.info_outline,
                                size: 16,
                                color: cs.onSurface.withValues(alpha: 0.75),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  loopingThis
                                      ? context.l10n.loopRunningForButton
                                      : context.l10n.loopTip,
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
                            label: Text(context.l10n.sendCommand),
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
                                    if (!mounted || !ctx.mounted) return;
                                    Navigator.of(ctx).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text(context.l10n.codeCopied)),
                                    );
                                    Haptics.selectionClick();
                                  },
                            icon: const Icon(Icons.copy_rounded),
                            label: Text(context.l10n.copyCode),
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
                              label: Text(context.l10n.stopLoop),
                            )
                          : FilledButton.tonalIcon(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                _startLoop(b);
                              },
                              icon: const Icon(Icons.loop_rounded),
                              label: Text(context.l10n.startLoop),
                            ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(height: 0),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.edit_rounded),
                      title: Text(context.l10n.edit),
                      subtitle: Text(context.l10n.editButtonSubtitle),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        Future.microtask(() => _editButton(b));
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.add_circle_outline_rounded),
                      title: Text(context.l10n.newButton),
                      subtitle: Text(context.l10n.newButtonSubtitle),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        Future.microtask(() => _createNewButtonAfter(b));
                      },
                    ),
                    const Divider(height: 0),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.copy_all_outlined),
                      title: Text(context.l10n.duplicate),
                      subtitle: Text(context.l10n.duplicateButtonSubtitle),
                      onTap: () async {
                        Navigator.of(ctx).pop();
                        await _duplicateButton(b);
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(isControlFav
                          ? Icons.remove_circle_outline
                          : Icons.add_circle_outline),
                      title: Text(isControlFav
                          ? context.l10n.removeFromDeviceControls
                          : context.l10n.addToDeviceControls),
                      subtitle: Text(context.l10n.deviceControlsButtonSubtitle),
                      onTap: () async {
                        Navigator.of(ctx).pop();
                        if (isControlFav) {
                          await DeviceControlsPrefs.remove(b.id);
                        } else {
                          await DeviceControlsPrefs.add(DeviceControlFavorite(
                            buttonId: b.id,
                            title: label,
                            subtitle: _remote.name,
                          ));
                        }
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(isControlFav
                                ? context.l10n.removedFromDeviceControls
                                : context.l10n.addedToDeviceControls),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(isQuickFav
                          ? Icons.star_rounded
                          : Icons.star_border_rounded),
                      title: Text(isQuickFav
                          ? context.l10n.unpinQuickTile
                          : context.l10n.pinQuickTile),
                      subtitle: Text(context.l10n.quickTileButtonSubtitle),
                      onTap: () async {
                        Navigator.of(ctx).pop();
                        if (isQuickFav) {
                          await QuickSettingsPrefs.removeFavorite(b.id);
                        } else {
                          await QuickSettingsPrefs.addFavorite(
                              QuickTileFavorite(
                            buttonId: b.id,
                            title: label,
                            subtitle: _remote.name,
                          ));
                        }
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(isQuickFav
                                ? context.l10n.removedFromQuickTileFavorites
                                : context.l10n.pinnedToQuickTileFavorites),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.copy_rounded),
                      title: Text(context.l10n.duplicateAndEdit),
                      subtitle: Text(context.l10n.duplicateAndEditSubtitle),
                      onTap: () async {
                        Navigator.of(ctx).pop();
                        await _duplicateAndEditButton(b);
                      },
                    ),
                  ],
                ),
              ),
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
            Text(
              _remote.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              context.l10n.remoteButtonCountSummary(count),
              style: theme.textTheme.labelSmall?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.65),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: _rotate180
                ? context.l10n.remoteOrientationFlippedTooltip
                : context.l10n.remoteOrientationNormalTooltip,
            onPressed: () async {
              final next = !_rotate180;
              setState(() => _rotate180 = next);
              await _orientation.setFlipped(next);
            },
            icon: const Icon(Icons.screen_rotation_rounded),
          ),
          if (_isLooping)
            IconButton(
              tooltip: context.l10n.stopLoop,
              onPressed: () => _stopLoop(silent: false),
              icon: Icon(Icons.stop_circle_rounded, color: cs.error),
            ),
          IconButton(
            tooltip:
                _reorderMode ? context.l10n.done : context.l10n.reorderButtons,
            onPressed: () {
              setState(() => _reorderMode = !_reorderMode);
              Haptics.selectionClick();
              if (_reorderMode && mounted) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      context.l10n.remoteReorderHint,
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            icon: Icon(_reorderMode
                ? Icons.check_rounded
                : Icons.drag_indicator_rounded),
          ),
          IconButton(
            tooltip: context.l10n.manageRemote,
            onPressed: _openRemoteActionsSheet,
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: PopScope(
          canPop: !_reorderMode,
          onPopInvokedWithResult: (didPop, _) async {
            if (didPop) return;
            await _onWillPop();
          },
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
                      : (useNewStyle
                          ? _buildComfortGrid()
                          : _buildCompactGrid()),
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
    final dragDelay = _reorderMode
        ? const Duration(milliseconds: 200)
        : const Duration(days: 3650);
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final cardColor = cs.primary.withValues(alpha: 0.20);

    return ReorderableGridView.builder(
      controller: _gridScrollController,
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
        final bool highlighted = _highlightButtonId == button.id;
        final bool pressed = _pressedButtonId == button.id;
        final bool loopingThis = _isLoopingThis(button);
        final String proto = _protocolLabel(button);
        final Color bgColor = _buttonBgColor(button, cardColor);
        final Color fgColor = _buttonFgColor(button, cs.onSurface);
        final Color surfaceColor = _interactiveButtonColor(
          bgColor,
          cs,
          highlighted: highlighted,
          pressed: pressed,
          looping: loopingThis,
        );
        final Widget content = Padding(
          padding: const EdgeInsets.all(6),
          child: _buildPrimaryButtonVisual(
            button,
            theme: theme,
            textColor: fgColor,
            maxLines: 3,
          ),
        );

        return AnimatedScale(
          key: ValueKey(button.id),
          scale: pressed ? 0.965 : 1,
          duration: const Duration(milliseconds: 110),
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeOutCubic,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: pressed
                  ? []
                  : [
                      BoxShadow(
                        color: cs.shadow.withValues(alpha: loopingThis ? 0.12 : 0.08),
                        blurRadius: loopingThis ? 14 : 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
            ),
            child: Material(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(14),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                splashFactory: InkSparkle.splashFactory,
                splashColor: cs.primary.withValues(alpha: 0.16),
                highlightColor: cs.primary.withValues(alpha: 0.08),
                onHighlightChanged: (value) => _setPressedButton(button, value),
                onTap: () => _handleButtonPress(button),
                onLongPress:
                    _reorderMode ? null : () => _openButtonActions(button),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: content,
                    ),
                    if (highlighted)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: cs.tertiary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: _pill(
                        context,
                        proto,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 3),
                        fontSize: 9,
                      ),
                    ),
                    if (loopingThis)
                      Positioned(
                        left: 4,
                        top: 4,
                        child: _pill(
                          context,
                          context.l10n.loopingBadge,
                          bg: cs.secondary,
                          fg: cs.onSecondary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 3),
                          fontSize: 9,
                        ),
                      ),
                  ],
                ),
              ),
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

        await _persistRemote(showNotFoundSnack: false);
        if (mounted) Haptics.selectionClick();
      },
    );
  }

  Widget _buildComfortGrid() {
    final dragDelay = _reorderMode
        ? const Duration(milliseconds: 200)
        : const Duration(days: 3650);
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final cardColor = cs.primary.withValues(alpha: 0.20);

    return ReorderableGridView.builder(
      controller: _gridScrollController,
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

        await _persistRemote(showNotFoundSnack: false);
        if (mounted) Haptics.selectionClick();
      },
      itemBuilder: (context, index) {
        final IRButton button = _remote.buttons[index];
        final bool highlighted = _highlightButtonId == button.id;
        final bool pressed = _pressedButtonId == button.id;
        final bool loopingThis = _isLoopingThis(button);
        final bool isRaw = _isRawSignalButton(button);

        final String proto = _protocolLabel(button);
        final String freq = _freqLabelKhz(button);
        final Color bgColor = _buttonBgColor(button, cardColor);
        final Color fgColor = _buttonFgColor(button, cs.onSurface);
        final Color surfaceColor = _interactiveButtonColor(
          bgColor,
          cs,
          highlighted: highlighted,
          pressed: pressed,
          looping: loopingThis,
        );

        final String? displayHex = _displayHex(button);
        final String codeText = isRaw ? 'RAW' : (displayHex ?? 'NO CODE');
        return AnimatedScale(
          key: ValueKey(button.id),
          scale: pressed ? 0.975 : 1,
          duration: const Duration(milliseconds: 110),
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeOutCubic,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: pressed
                  ? []
                  : [
                      BoxShadow(
                        color: cs.shadow.withValues(alpha: loopingThis ? 0.12 : 0.07),
                        blurRadius: loopingThis ? 16 : 12,
                        offset: const Offset(0, 5),
                      ),
                    ],
            ),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: highlighted
                      ? cs.tertiary
                      : (loopingThis
                          ? cs.secondary.withValues(alpha: 0.65)
                          : cs.outlineVariant.withValues(alpha: 0.35)),
                  width: highlighted ? 2 : (loopingThis ? 1.5 : 1),
                ),
              ),
              color: surfaceColor,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                splashFactory: InkSparkle.splashFactory,
                splashColor: cs.primary.withValues(alpha: 0.14),
                highlightColor: cs.primary.withValues(alpha: 0.08),
                onHighlightChanged: (value) => _setPressedButton(button, value),
                onTap: () => _handleButtonPress(button),
                onLongPress:
                    _reorderMode ? null : () => _openButtonActions(button),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (loopingThis)
                            _pill(
                              context,
                              context.l10n.loopingBadge,
                              bg: cs.secondary,
                              fg: cs.onSecondary,
                              fontSize: 9,
                            ),
                          if (loopingThis) const Spacer() else const SizedBox.shrink(),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            width: 72,
                            height: 72,
                            child: _buildPrimaryButtonVisual(
                              button,
                              theme: theme,
                              textColor: fgColor,
                              maxLines: 2,
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
                            color: fgColor.withValues(alpha: 0.82),
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
                          if (freq.isNotEmpty) _pill(context, freq, fontSize: 9),
                        ],
                      ),
                    ],
                  ),
                ),
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
            Icon(
              Icons.drag_indicator_rounded,
              color: cs.onSecondaryContainer.withValues(alpha: 0.9),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                context.l10n.remoteReorderHint,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: cs.onSecondaryContainer.withValues(alpha: 0.92),
                ),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton.tonal(
              onPressed: onDone,
              child: Text(context.l10n.done),
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
            Icon(
              Icons.grid_off_rounded,
              size: 52,
              color: cs.onSurface.withValues(alpha: 0.45),
            ),
            const SizedBox(height: 12),
            Text(
              context.l10n.remoteNoButtons,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              context.l10n.remoteNoButtonsDescription,
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
              label: Text(context.l10n.manageRemote),
            ),
          ],
        ),
      ),
    );
  }
}
