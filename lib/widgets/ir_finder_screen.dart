import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/ir/ir_protocol_types.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_prefs.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_run_controller.dart';
import 'package:irblaster_controller/ir_finder/ir_prefix.dart';
import 'package:irblaster_controller/ir_finder/irblaster_db.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/state/orientation_pref.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class IrFinderScreen extends StatefulWidget {
  const IrFinderScreen({super.key});

  @override
  State<IrFinderScreen> createState() => _IrFinderScreenState();
}

class _IrFinderScreenState extends State<IrFinderScreen> with WidgetsBindingObserver {
  Future<File> _hitsFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_hitsFile');
  }

  Future<void> _persistHitsToDisk() async {
    try {
      final f = await _hitsFilePath();
      final payload = _hits
          .map((h) => {
                'savedAt': h.savedAt.toIso8601String(),
                'protocolId': h.protocolId,
                'protocolName': h.protocolName,
                'code': h.code,
                'source': h.source.name,
                'dbBrand': h.dbBrand,
                'dbModel': h.dbModel,
                'dbLabel': h.dbLabel,
                'dbRemoteId': h.dbRemoteId,
              })
          .toList();
      await f.writeAsString(const JsonEncoder.withIndent('  ').convert(payload), flush: true);
    } catch (_) {}
  }

  Future<void> _loadHitsFromDisk() async {
    try {
      final f = await _hitsFilePath();
      if (!await f.exists()) return;
      final contents = await f.readAsString();
      final dynamic decoded = jsonDecode(contents);
      if (decoded is! List) return;
      final List<IrFinderHit> loaded = decoded
          .whereType<Map>()
          .map((m0) {
            final m = m0.cast<String, dynamic>();
            IrFinderSource src;
            final s = (m['source'] as String?)?.toLowerCase().trim();
            if (s == 'database') {
              src = IrFinderSource.database;
            } else {
              src = IrFinderSource.bruteforce;
            }
            return IrFinderHit(
              savedAt: DateTime.tryParse((m['savedAt'] as String?) ?? '') ?? DateTime.now(),
              protocolId: (m['protocolId'] as String?) ?? 'nec',
              protocolName: ((m['protocolName'] as String?)?.trim().isNotEmpty ?? false)
                  ? (m['protocolName'] as String).trim()
                  : (((m['protocolId'] as String?) ?? 'nec').toUpperCase()),
              code: (m['code'] as String?) ?? '',
              source: src,
              dbBrand: (m['dbBrand'] as String?),
              dbModel: (m['dbModel'] as String?),
              dbLabel: (m['dbLabel'] as String?),
              dbRemoteId: (m['dbRemoteId'] is int) ? m['dbRemoteId'] as int : int.tryParse('${m['dbRemoteId']}'),
            );
          })
          .toList();
      if (loaded.isEmpty) return;
      setState(() {
        _hits
          ..clear()
          ..addAll(loaded);
      });
    } catch (_) {}
  }

  Future<void> _addHitToRemoteWith(BuildContext context, IrFinderHit hit) async {
    final last = hit;

    final List<Remote> list = remotes;
    if (list.isEmpty) {
      final created = await _createRemoteFromHit(context, last);
      if (created) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.newRemoteCreatedFromLastHit)),
        );
      }
      return;
    }

    final Remote? picked = await showDialog<Remote>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(context.l10n.selectRemote),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (_, i) {
                final r = list[i];
                return ListTile(
                  title: Text(r.name.isEmpty ? context.l10n.remoteNumber(r.id.toString()) : r.name),
                  subtitle: Text(context.l10n.remoteButtonCountLabel(r.buttons.length)),
                  onTap: () => Navigator.of(ctx).pop(r),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(context.l10n.cancel),
            ),
            FilledButton.tonal(
              onPressed: () async {
                Navigator.of(ctx).pop();
                final ok = await _createRemoteFromHit(context, last);
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      ok ? context.l10n.newRemoteCreated : context.l10n.failedToCreateRemote,
                    ),
                  ),
                );
              },
              child: Text(context.l10n.newRemoteEllipsis),
            ),
          ],
        );
      },
    );

    if (picked == null) return;
    final ok = await _appendHitToRemote(picked, last);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          ok
              ? context.l10n.addedToRemoteNamed(
                  picked.name.isEmpty ? context.l10n.remoteNumber(picked.id.toString()) : picked.name,
                )
              : context.l10n.failedToAddToRemote,
        ),
      ),
    );
  }

  Future<bool> _appendHitToRemote(Remote remote, IrFinderHit hit) async {
    try {
      final uuid = const Uuid();
      final IRButton btn = IRButton(
        id: uuid.v4(),
        code: null,
        rawData: null,
        frequency: null,
        image: hit.dbLabel ?? hit.code,
        isImage: false,
        protocol: hit.protocolId,
        protocolParams: <String, dynamic>{'hex': hit.code},
      );
      remote.buttons.add(btn);
      await writeRemotelist(remotes);
      notifyRemotesChanged();
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> _createRemoteFromHit(BuildContext context, IrFinderHit hit) async {
    try {
      final uuid = const Uuid();
      final Remote r = Remote(
        name: hit.dbBrand ?? context.l10n.newRemoteDefaultName,
        buttons: <IRButton>[
          IRButton(
            id: uuid.v4(),
            code: null,
            rawData: null,
            frequency: null,
            image: hit.dbLabel ?? hit.code,
            isImage: false,
            protocol: hit.protocolId,
            protocolParams: <String, dynamic>{'hex': hit.code},
          )
        ],
        useNewStyle: true,
      );
      remotes.add(r);
      await writeRemotelist(remotes);
      notifyRemotesChanged();
      return true;
    } catch (_) {
      return false;
    }
  }
  Future<void> _browseDbCandidates(BuildContext context) async {
    final brand = _brand;
    if (!_dbReady || brand == null) return;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _DbCandidatesSheet(
        db: _db,
        brand: brand,
        model: _model,
        protocolId: _dbOnlySelectedProtocol ? _protocolId : null,
        quickWinsFirst: _dbQuickWinsFirst,
        hexPrefixUpper: (_prefixParsed != null && _prefixParsed!.ok && _prefixParsed!.bytes.isNotEmpty)
            ? IrPrefix.formatBytesAsHex(_prefixParsed!.bytes).replaceAll(' ', '').toUpperCase()
            : null,
        onJumpToOffset: (offset) {
          if (!context.mounted) return;
          _run.jumpToOffset(offset);
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.jumpedToOffsetPaused(offset))),
          );
        },
        onSend: (protocolId, codeHex) async {
          try {
            final params = _buildParamsForProtocol(protocolId: protocolId, codeHex: codeHex);
            final c = IrFinderCandidate(
              protocolId: protocolId,
              displayProtocol: IrProtocolRegistry.encoderFor(protocolId).definition.displayName,
              displayCode: _fitHexDigitsForProtocol(protocolId, codeHex),
              params: params,
              source: IrFinderSource.database,
              dbBrand: _brand,
              dbModel: _model,
            );
            await _sendCandidateForRun(c);
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.l10n.sent)),
            );
          } catch (e) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.l10n.failedToSend(e.toString()))),
            );
          }
        },
        onCopy: (protocolId, codeHex) async {
          await Clipboard.setData(ClipboardData(text: '$protocolId:${_fitHexDigitsForProtocol(protocolId, codeHex)}'));
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.copiedProtocolCode)),
          );
        },
      ),
    );
  }
  int _pageIndex = 0;

  IrFinderMode _mode = IrFinderMode.bruteforce;
  String _protocolId = 'nec';

  final TextEditingController _prefixCtl = TextEditingController();
  IrPrefixParseResult? _prefixParsed;

  int _delayMs = 500;
  int _maxAttempts = 200;
  bool _bruteAllCombinations = false;
  int _maxAttemptsBeforeAll = 200;

  final TextEditingController _maxAttemptsCtl = TextEditingController();
  bool _syncingMaxAttemptsText = false;

  bool _dbReady = false;
  bool _dbInitFailed = false;

  String? _brand;
  String? _model;
  bool _dbOnlySelectedProtocol = true;
  bool _dbQuickWinsFirst = true;
  int _dbMaxKeysToTest = 1000000;

  final List<IrFinderHit> _hits = <IrFinderHit>[];
  static const String _hitsFile = 'ir_finder_hits.json';

  final IrBlasterDb _db = IrBlasterDb.instance;

  late final IrFinderRunController _run;

  IrFinderSessionSnapshot? _resumeSession;

  static const Map<String, String> _protocolExampleHex = <String, String>{
    'denon': '0000',
    'f12_relaxed': '100',
    'jvc': '0000',
    'kaseikyo': '80D003',
    'nec': '000000FF',
    'nec2': '000800FF',
    'necx1': '000008F7',
    'necx2': '000C08F7',
    'nrc17': '5C61',
    'pioneer': '1A2B',
    'proton': '0000',
    'rc5': '0000',
    'rc6': '800F',
    'rca_38': 'F00',
    'rcc0082': '000',
    'rcc2026': '0087FBC03FC',
    'rec80': '28C600212100',
    'recs80': '000',
    'recs80_l': '000',
    'samsung32': '0000',
    'samsung36': '00C0001',
    'sharp': '2024',
    'sony12': '000',
    'sony15': '0014',
    'sony20': '0002F',
    'thomson7': '300',
    'xsat': '5935',
  };

  String _kaseikyoVendor = '2002';
  final TextEditingController _kaseikyoVendorCtl = TextEditingController();
  bool _syncingKaseikyoVendorText = false;

  static const Map<String, String> _kaseikyoVendorPresets = {
    'Panasonic': '2002',
    'Denon': '3254',
    'Mitsubishi': 'CB23',
    'Sharp': '5AAA',
    'JVC': '0103',
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _run = IrFinderRunController(
      fetchCandidate: _fetchCandidateForRun,
      sendCandidate: _sendCandidateForRun,
    )..addListener(() {
        if (!mounted) return;
        setState(() {});
      });

    _prefixCtl.addListener(_onPrefixChanged);

    _maxAttemptsCtl.text = _maxAttempts.toString();
    _maxAttemptsCtl.addListener(_onMaxAttemptsTextChanged);

    _kaseikyoVendorCtl.text = _kaseikyoVendor;
    _kaseikyoVendorCtl.addListener(_onKaseikyoVendorChanged);

    _initDb();
    _applyPrefixLimitForCurrentProtocol();
    unawaited(_loadResumeSession());
    unawaited(_loadHitsFromDisk());
    _syncRunConfigToController();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_run.persistNow());

    _run.dispose();

    _prefixCtl.removeListener(_onPrefixChanged);
    _prefixCtl.dispose();

    _maxAttemptsCtl.removeListener(_onMaxAttemptsTextChanged);
    _maxAttemptsCtl.dispose();

    _kaseikyoVendorCtl.removeListener(_onKaseikyoVendorChanged);
    _kaseikyoVendorCtl.dispose();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      unawaited(_run.persistNow());
    }
  }

  Future<void> _loadResumeSession() async {
    final s = await IrFinderPrefs.loadSession();
    if (!mounted) return;
    setState(() => _resumeSession = s);
  }

  void _onMaxAttemptsTextChanged() {
    if (_syncingMaxAttemptsText) return;
    final raw = _maxAttemptsCtl.text.trim();
    if (raw.isEmpty) return;
    final v = int.tryParse(raw);
    if (v == null) return;
    _setMaxAttempts(v, syncText: false);
  }

  void _setMaxAttempts(int v, {bool syncText = true}) {
    final int clamped = v.clamp(1, 2147483647);
    if (!mounted) return;
    setState(() => _maxAttempts = clamped);
    if (syncText) {
      _syncingMaxAttemptsText = true;
      _maxAttemptsCtl.text = clamped.toString();
      _syncingMaxAttemptsText = false;
    }
    _syncRunConfigToController();
  }

  void _toggleBruteAll(bool v) {
    if (!mounted) return;
    setState(() {
      _bruteAllCombinations = v;
      if (v) {
        _maxAttemptsBeforeAll = _maxAttempts;
      } else {
        _setMaxAttempts(_maxAttemptsBeforeAll);
      }
    });
    _syncRunConfigToController();
  }

  void _onKaseikyoVendorChanged() {
    if (_syncingKaseikyoVendorText) return;
    final String norm = _normalizeHexDigitsOnlyUpper(_kaseikyoVendorCtl.text);
    final String clamped = norm.length <= 4 ? norm : norm.substring(0, 4);
    if (clamped != _kaseikyoVendor.toUpperCase()) {
      setState(() => _kaseikyoVendor = clamped.padLeft(4, '0'));
      _syncRunConfigToController();
    }
    if (_kaseikyoVendorCtl.text != clamped) {
      _syncingKaseikyoVendorText = true;
      _kaseikyoVendorCtl.value = TextEditingValue(
        text: clamped,
        selection: TextSelection.collapsed(offset: clamped.length),
      );
      _syncingKaseikyoVendorText = false;
    }
  }

  Future<void> _initDb() async {
    try {
      await _db.ensureInitialized();
      if (!mounted) return;
      setState(() {
        _dbReady = true;
        _dbInitFailed = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _dbReady = false;
        _dbInitFailed = true;
      });
    }
  }

  void _onPrefixChanged() {
    final raw = _prefixCtl.text;
    final parsed = IrPrefix.parse(raw);
    setState(() {
      _prefixParsed = parsed;
    });
    _syncRunConfigToController();
  }

  IrProtocolDefinition _definitionFor(String protocolId) {
    final enc = IrProtocolRegistry.encoderFor(protocolId);
    return enc.definition;
  }

  IrFinderBruteSpec? _bruteSpecFor(String protocolId) {
    try {
      return IrFinderBruteSpec.forProtocol(protocolId);
    } catch (_) {
      return null;
    }
  }

  int _hexDigitCount(String s) {
    int c = 0;
    for (int i = 0; i < s.length; i++) {
      final int u = s.codeUnitAt(i);
      final bool isHex = (u >= 48 && u <= 57) || (u >= 65 && u <= 70) || (u >= 97 && u <= 102);
      if (isHex) c++;
    }
    return c;
  }

  int _totalHexDigitsForProtocol(String protocolId) {
    final ex = _protocolExampleHex[protocolId];
    if (ex != null && ex.isNotEmpty) return ex.length;
    final spec = _bruteSpecFor(protocolId);
    if (spec != null && spec.totalHexDigits > 0) return spec.totalHexDigits;
    try {
      final def = _definitionFor(protocolId);
      if (def.fields.isNotEmpty) {
        final f = def.fields.first;
        final int? maxLen = f.maxLength;
        if (f.type == IrFieldType.string && maxLen != null && maxLen > 0) {
          final int digits = maxLen.clamp(1, 64);
          return digits;
        }
      }
    } catch (_) {}
    return 0;
  }

  int _maxPrefixHexDigitsEvenForProtocol(String protocolId) {
    final int total = _totalHexDigitsForProtocol(protocolId);
    if (total <= 0) return 0;
    return total.isEven ? total : (total - 1).clamp(0, total);
  }

  String? _exampleForProtocol(String protocolId) => _protocolExampleHex[protocolId];

  void _applyPrefixLimitForCurrentProtocol() {
    final int maxDigits = _maxPrefixHexDigitsEvenForProtocol(_protocolId);
    if (maxDigits <= 0) return;
    final String cur = _prefixCtl.text;
    if (_hexDigitCount(cur) <= maxDigits) return;
    final String trimmed = _HexDigitLengthLimitingFormatter.trimText(cur, maxDigits);
    _prefixCtl.value = TextEditingValue(
      text: trimmed,
      selection: TextSelection.collapsed(offset: trimmed.length),
    );
  }

  IrPrefixConstraint? _effectivePrefixConstraint({
    required int totalHexDigits,
    required String displayName,
  }) {
    final parsed = _prefixParsed;
    if (parsed == null) return null;
    if (!parsed.ok) return null;
    if (parsed.bytes.isEmpty) return null;

    final int maxBytesAllowed = (totalHexDigits / 2).floor();
    if (maxBytesAllowed <= 0) return null;

    final int wanted = parsed.bytes.length;
    if (wanted > maxBytesAllowed) {
      return IrPrefixConstraint.invalid(
        'Prefix is too long for $displayName: max $maxBytesAllowed byte(s) ($totalHexDigits hex digit payload).',
        parsed.bytes,
      );
    }

    final String prefixHex = IrPrefix.formatBytesAsHex(parsed.bytes).replaceAll(' ', '');
    final int prefixHexDigits = prefixHex.length;
    if (prefixHexDigits > totalHexDigits) {
      return IrPrefixConstraint.invalid(
        'Prefix exceeds the payload length for $displayName.',
        parsed.bytes,
      );
    }

    return IrPrefixConstraint.valid(parsed.bytes);
  }

  BigInt _bruteTotalSpace({
    required int totalHexDigits,
    required IrPrefixConstraint? prefix,
  }) {
    final int prefixHexDigits = (prefix?.valid ?? false) ? (prefix!.bytes.length * 2).clamp(0, totalHexDigits) : 0;
    final int remainingHexDigits = (totalHexDigits - prefixHexDigits).clamp(0, totalHexDigits);
    return IrBigInt.pow(BigInt.from(16), remainingHexDigits);
  }

  BigInt _clampMaxAttempts(BigInt space, int desired) {
    if (space <= BigInt.zero) return BigInt.zero;
    final BigInt d = BigInt.from(desired);
    return d <= space ? d : space;
  }

  static String _composeHex({
    required int totalHexDigits,
    required BigInt cursor,
    required List<int> prefixBytes,
  }) {
    if (totalHexDigits <= 0) return '';
    final String prefixRaw = IrPrefix.formatBytesAsHex(prefixBytes).replaceAll(' ', '').toUpperCase();
    final int prefixDigits = prefixRaw.length.clamp(0, totalHexDigits);
    final String prefix = prefixRaw.substring(0, prefixDigits);

    final int remaining = (totalHexDigits - prefixDigits).clamp(0, totalHexDigits);

    String tail = remaining <= 0 ? '' : cursor.toRadixString(16).toUpperCase();
    if (remaining > 0) {
      if (tail.length > remaining) {
        tail = tail.substring(tail.length - remaining);
      }
      tail = tail.padLeft(remaining, '0');
    } else {
      tail = '';
    }

    final String out = prefix + tail;
    return out.length >= totalHexDigits ? out : out.padLeft(totalHexDigits, '0');
  }

  static String _normalizeHexDigitsOnlyUpper(String s) {
    final StringBuffer out = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final int u = s.codeUnitAt(i);
      final bool isHex = (u >= 48 && u <= 57) || (u >= 65 && u <= 70) || (u >= 97 && u <= 102);
      if (isHex) out.writeCharCode(u);
    }
    return out.toString().toUpperCase();
  }

  static String _bytesToSpacedHex(List<String> bytes2) {
    return bytes2.map((e) => e.toUpperCase()).join(' ');
  }

  String _fitHexDigitsForProtocol(String protocolId, String codeHexAny) {
    final String pid = protocolId.trim().toLowerCase();
    final int want = _totalHexDigitsForProtocol(pid);
    String s = _normalizeHexDigitsOnlyUpper(codeHexAny);
    if (want <= 0) return s;
    if (s.length > want) {
      s = s.substring(s.length - want);
    } else if (s.length < want) {
      s = s.padLeft(want, '0');
    }
    return s;
  }

  static Map<String, dynamic> _buildKaseikyoParams({
    required String codeHexAny,
    required String vendorAny,
  }) {
    final String vendor = _normalizeHexDigitsOnlyUpper(vendorAny).padLeft(4, '0');
    if (!RegExp(r'^[0-9A-F]{4}$').hasMatch(vendor)) {
      throw ArgumentError('Kaseikyo vendor must be 4 hex digits');
    }

    final String vMsb = vendor.substring(0, 2);
    final String vLsb = vendor.substring(2, 4);

    final String code = _normalizeHexDigitsOnlyUpper(codeHexAny);

    if (code.length == 16) {
      final List<String> addr = <String>[
        code.substring(0, 2),
        code.substring(2, 4),
        code.substring(4, 6),
        code.substring(6, 8),
      ];
      final List<String> cmd = <String>[
        code.substring(8, 10),
        code.substring(10, 12),
        code.substring(12, 14),
        code.substring(14, 16),
      ];
      return <String, dynamic>{
        'address': _bytesToSpacedHex(addr),
        'command': _bytesToSpacedHex(cmd),
      };
    }

    if (code.length == 8) {
      final String b0 = code.substring(0, 2);
      final String cmd0 = code.substring(2, 4);
      final String cmd1 = code.substring(4, 6);
      final String idByte = code.substring(6, 8);
      final String addr = _bytesToSpacedHex(<String>[b0, vLsb, vMsb, idByte]);
      final String cmd = _bytesToSpacedHex(<String>[cmd0, cmd1, '00', '00']);
      return <String, dynamic>{
        'address': addr,
        'command': cmd,
      };
    }

    if (code.length == 6) {
      final String b0 = code.substring(0, 2);
      final String cmd0 = code.substring(2, 4);
      final String cmd1 = code.substring(4, 6);
      final String addr = _bytesToSpacedHex(<String>[b0, vLsb, vMsb, '00']);
      final String cmd = _bytesToSpacedHex(<String>[cmd0, cmd1, '00', '00']);
      return <String, dynamic>{
        'address': addr,
        'command': cmd,
      };
    }

    throw ArgumentError('Kaseikyo brute code must be 6, 8, or 16 hex digits');
  }

  Map<String, dynamic> _buildParamsForProtocol({
    required String protocolId,
    required String codeHex,
  }) {
    final String pid = protocolId.trim().toLowerCase();
    final String fitted = _fitHexDigitsForProtocol(pid, codeHex);

    if (pid == 'kaseikyo') {
      return _buildKaseikyoParams(codeHexAny: fitted, vendorAny: _kaseikyoVendor);
    }

    if (pid == 'pioneer') {
      if (fitted.length != 4) {
        throw ArgumentError('Pioneer brute code must be 4 hex digits');
      }
      return <String, dynamic>{
        'address': fitted.substring(0, 2),
        'command': fitted.substring(2, 4),
      };
    }

    if (pid == 'rca_38') {
      if (fitted.length != 3) {
        throw ArgumentError('RCA brute code must be 3 hex digits');
      }
      return <String, dynamic>{
        'address': fitted.substring(0, 1),
        'command': fitted.substring(1, 3),
      };
    }

    if (pid == 'rc5') {
      if (fitted.length != 4) {
        throw ArgumentError('RC5 brute code must be 4 hex digits');
      }
      return <String, dynamic>{
        'address': fitted.substring(0, 2),
        'command': fitted.substring(2, 4),
      };
    }

    if (pid == 'thomson7') {
      try {
        final def = _definitionFor(pid);
        if (def.fields.isNotEmpty) {
          final f = def.fields.first;
          if (f.type == IrFieldType.intDecimal) {
            return <String, dynamic>{
              f.id: int.parse(fitted.isEmpty ? '0' : fitted, radix: 16),
            };
          }
          if (f.type == IrFieldType.string) {
            return <String, dynamic>{f.id: fitted};
          }
        }
      } catch (_) {}
      return <String, dynamic>{
        'code': int.parse(fitted.isEmpty ? '0' : fitted, radix: 16),
      };
    }

    if (pid == 'xsat') {
      if (fitted.length != 4) {
        throw ArgumentError('XSAT brute code must be 4 hex digits');
      }
      return <String, dynamic>{
        'address': fitted.substring(0, 2),
        'command': fitted.substring(2, 4),
      };
    }

    try {
      final def = _definitionFor(pid);
      if (def.fields.isEmpty) {
        return <String, dynamic>{'hex': fitted};
      }

      if (def.fields.length == 1) {
        final f = def.fields.first;
        if (f.type == IrFieldType.intDecimal) {
          return <String, dynamic>{
            f.id: int.parse(fitted.isEmpty ? '0' : fitted, radix: 16),
          };
        }
        return <String, dynamic>{f.id: fitted};
      }

      final Map<String, IrFieldDef> byId = <String, IrFieldDef>{
        for (final f in def.fields) f.id: f,
      };

      if (byId.containsKey('address') && byId.containsKey('command')) {
        final int digits = fitted.length;
        if (digits >= 4) {
          return <String, dynamic>{
            'address': fitted.substring(0, 2),
            'command': fitted.substring(2, 4),
          };
        }
      }

      return <String, dynamic>{def.fields.first.id: fitted};
    } catch (_) {
      return <String, dynamic>{'hex': fitted};
    }
  }

  bool _isValidKaseikyoVendor() {
    final String v = _normalizeHexDigitsOnlyUpper(_kaseikyoVendor);
    return RegExp(r'^[0-9A-F]{4}$').hasMatch(v.padLeft(4, '0'));
  }

  void _syncRunConfigToController() {
    _run.configure(
      mode: _mode,
      protocolId: _protocolId,
      delayMs: _delayMs,
      maxKeysToTest: _dbMaxKeysToTest,
      bruteMaxAttempts: _maxAttempts,
      bruteAllCombinations: _bruteAllCombinations,
      prefixRaw: _prefixCtl.text,
      kaseikyoVendor: _kaseikyoVendor,
      onlySelectedProtocol: _dbOnlySelectedProtocol,
      quickWinsFirst: _dbQuickWinsFirst,
      brand: _brand,
      model: _model,
    );
  }

  Future<IrFinderCandidate?> _fetchCandidateForRun(IrFinderRunController ctl) async {
    if (ctl.mode == IrFinderMode.bruteforce) {
      final String pid = ctl.protocolId;
      final int totalHexDigits = _totalHexDigitsForProtocol(pid);
      if (totalHexDigits <= 0) return null;

      final def = _definitionFor(pid);

      final prefix = _effectivePrefixConstraint(
        totalHexDigits: totalHexDigits,
        displayName: def.displayName,
      );

      if (prefix != null && !prefix.valid) {
        ctl.lastError = prefix.errorMessage;
        return null;
      }

      final space = _bruteTotalSpace(
        totalHexDigits: totalHexDigits,
        prefix: prefix,
      );

      if (space <= BigInt.zero) return null;

      if (_bruteAllCombinations) {
        if (ctl.bruteCursor >= space) return null;
      } else {
        final BigInt effectiveMax = _clampMaxAttempts(space, _maxAttempts);
        final int effectiveMaxInt = IrBigInt.toIntClamp(effectiveMax, max: 2147483647);
        if (ctl.attempted >= effectiveMaxInt) return null;
      }

      final String codeHex = _composeHex(
        totalHexDigits: totalHexDigits,
        cursor: ctl.bruteCursor,
        prefixBytes: (prefix != null && prefix.valid) ? prefix.bytes : const <int>[],
      );

      Map<String, dynamic> params;
      try {
        params = _buildParamsForProtocol(protocolId: pid, codeHex: codeHex);
      } catch (e) {
        ctl.lastError = e;
        return null;
      }

      return IrFinderCandidate(
        protocolId: pid,
        displayProtocol: def.displayName,
        displayCode: codeHex.toUpperCase(),
        params: params,
        source: IrFinderSource.bruteforce,
      );
    }

    if (!_dbReady) return null;

    final String? brand = _brand;
    if (brand == null || brand.trim().isEmpty) return null;

    final String? hexPrefixUpper = (_prefixParsed != null && _prefixParsed!.ok && _prefixParsed!.bytes.isNotEmpty)
        ? IrPrefix.formatBytesAsHex(_prefixParsed!.bytes).replaceAll(' ', '').toUpperCase()
        : null;

    final rows = await _db.fetchCandidateKeys(
      brand: brand,
      model: _model,
      selectedProtocolId: _dbOnlySelectedProtocol ? _protocolId : null,
      quickWinsFirst: _dbQuickWinsFirst,
      hexPrefixUpper: hexPrefixUpper,
      limit: 1,
      offset: ctl.currentOffset,
    );

    if (rows.isEmpty) return null;

    final row = rows.first;
    final normId = row.protocol.trim().toLowerCase().replaceAll('-', '_');

    IrProtocolDefinition def;
    try {
      def = _definitionFor(normId);
    } catch (_) {
      return null;
    }

    Map<String, dynamic> params;
    try {
      params = _buildParamsForProtocol(protocolId: normId, codeHex: row.hexcode);
    } catch (e) {
      ctl.lastError = e;
      return null;
    }

    return IrFinderCandidate(
      protocolId: normId,
      displayProtocol: def.displayName,
      displayCode: _fitHexDigitsForProtocol(normId, row.hexcode),
      params: params,
      source: IrFinderSource.database,
      dbRemoteId: row.remoteId,
      dbLabel: row.label,
      dbBrand: _brand,
      dbModel: _model,
    );
  }

  Future<void> _sendCandidateForRun(IrFinderCandidate c) async {
    final enc = IrProtocolRegistry.encoderFor(c.protocolId);
    final IrEncodeResult res = enc.encode(c.params);
    final int freq = (res.frequencyHz <= 0) ? 38000 : res.frequencyHz;
    await transmitRaw(freq, res.pattern);
  }

  Future<void> _playPauseToggle() async {
    if (_run.running) {
      if (_run.paused) {
        _run.resume();
        await Haptics.lightImpact();
      } else {
        _run.pause();
        await Haptics.selectionClick();
      }
      return;
    }

    if (_delayMs < 250) {
      setState(() => _delayMs = 250);
    }

    final bool isKaseikyo = _protocolId.trim().toLowerCase() == 'kaseikyo';
    if (isKaseikyo && !_isValidKaseikyoVendor()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.irFinderKaseikyoVendorInvalid)),
      );
      return;
    }

    if (_mode == IrFinderMode.database) {
      if (!_dbReady) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.irFinderDatabaseNotReady)),
        );
        return;
      }
      if (_brand == null || _brand!.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.irFinderSelectBrandFirst)),
        );
        return;
      }
    } else {
      final int totalHexDigits = _totalHexDigitsForProtocol(_protocolId);
      if (totalHexDigits <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.irFinderBruteforceUnavailable)),
        );
        return;
      }

      final def = _definitionFor(_protocolId);
      final prefix = _effectivePrefixConstraint(
        totalHexDigits: totalHexDigits,
        displayName: def.displayName,
      );

      if (prefix != null && !prefix.valid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(prefix.errorMessage ?? context.l10n.irFinderInvalidPrefix)),
        );
        return;
      }

      final space = _bruteTotalSpace(totalHexDigits: totalHexDigits, prefix: prefix);
      if (space > (BigInt.from(1) << 40)) {
        final ok = await _confirmBigSearchSpace(context, space);
        if (!ok) return;
      }
    }

    _syncRunConfigToController();
    await _run.start();
    await Haptics.mediumImpact();
  }

  Future<void> _resumeFromSnapshot(IrFinderSessionSnapshot s) async {
    if (!mounted) return;

    setState(() {
      _mode = s.mode;
      _protocolId = s.protocolId;
      _delayMs = s.delayMs.clamp(250, 20000);
      _dbMaxKeysToTest = s.maxKeysToTest.clamp(1, 2147483647);
      _dbOnlySelectedProtocol = s.onlySelectedProtocol;
      _dbQuickWinsFirst = s.quickWinsFirst;
      _brand = s.brand;
      _model = s.model;
      _maxAttempts = s.bruteMaxAttempts.clamp(1, 2147483647);
      _bruteAllCombinations = s.bruteAllCombinations;
      _kaseikyoVendor = s.kaseikyoVendor.toUpperCase();
      _syncingMaxAttemptsText = true;
      _maxAttemptsCtl.text = _maxAttempts.toString();
      _syncingMaxAttemptsText = false;
      _syncingKaseikyoVendorText = true;
      _kaseikyoVendorCtl.text = _kaseikyoVendor;
      _syncingKaseikyoVendorText = false;
      _prefixCtl.text = s.prefixRaw;
      _prefixParsed = IrPrefix.parse(_prefixCtl.text);
    });

    _applyPrefixLimitForCurrentProtocol();
    _syncRunConfigToController();

    BigInt cursor = BigInt.zero;
    try {
      final String raw = s.bruteCursorHex.trim();
      if (raw.isNotEmpty) {
        cursor = BigInt.parse(raw, radix: 16);
      }
    } catch (_) {
      cursor = BigInt.zero;
    }

    _run.restoreProgress(
      attempted: s.attempted,
      currentOffset: s.currentOffset,
      bruteCursor: cursor,
      startedAt: s.startedAt,
      paused: true,
    );

    setState(() => _pageIndex = 1);

    _run.resume();
    await Haptics.heavyImpact();
  }

  Future<void> _discardResumeSession() async {
    await IrFinderPrefs.clearSession();
    if (!mounted) return;
    setState(() => _resumeSession = null);
  }

  Future<void> _saveHitFromLast() async {
    final c = _run.lastCandidate;
    if (c == null) return;

    final hit = IrFinderHit(
      savedAt: DateTime.now(),
      protocolId: c.protocolId,
      protocolName: c.displayProtocol,
      code: c.displayCode,
      source: c.source,
      dbBrand: c.dbBrand,
      dbModel: c.dbModel,
      dbRemoteId: c.dbRemoteId,
      dbLabel: c.dbLabel,
    );

    setState(() {
      _hits.insert(0, hit);
      _pageIndex = 2;
    });

    await _persistHitsToDisk();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.savedToResults)),
    );
    await Haptics.selectionClick();
  }

  Future<void> _testHit(IrFinderHit h) async {
    Map<String, dynamic> params;
    try {
      params = _buildParamsForProtocol(protocolId: h.protocolId, codeHex: h.code);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.invalidCodeForProtocol(e.toString()))),
      );
      return;
    }

    final c = IrFinderCandidate(
      protocolId: h.protocolId,
      displayProtocol: h.protocolName,
      displayCode: _fitHexDigitsForProtocol(h.protocolId, h.code),
      params: params,
      source: h.source,
      dbBrand: h.dbBrand,
      dbModel: h.dbModel,
      dbRemoteId: h.dbRemoteId,
      dbLabel: h.dbLabel,
    );

    try {
      await _sendCandidateForRun(c);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.sent)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.failedToSend(e.toString()))),
      );
    }
  }

  Future<void> _copyHit(IrFinderHit h) async {
    await Clipboard.setData(ClipboardData(text: '${h.protocolId}:${h.code}'));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.copiedProtocolCode)),
    );
    await Haptics.selectionClick();
  }

  Future<void> _copyCurrentCandidate(BuildContext context) async {
    final c = _run.lastCandidate;
    if (c == null) return;
    final meta = <String>[
      if (c.dbBrand != null && c.dbBrand!.trim().isNotEmpty) context.l10n.irFinderBrandValue(c.dbBrand!),
      if (c.dbModel != null && c.dbModel!.trim().isNotEmpty) context.l10n.irFinderModelValue(c.dbModel!),
      if (c.dbLabel != null && c.dbLabel!.trim().isNotEmpty) context.l10n.irFinderKeyValue(c.dbLabel!),
      if (c.dbRemoteId != null) context.l10n.irFinderRemoteNumber(c.dbRemoteId!.toString()),
    ].join(' · ');
    final text = meta.isEmpty
        ? '${c.protocolId}:${c.displayCode}'
        : '${c.protocolId}:${c.displayCode}  ($meta)';
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.copiedCurrentCandidate)),
    );
    await Haptics.selectionClick();
  }

  Future<void> _showJumpDialog(BuildContext context) async {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final isDb = _mode == IrFinderMode.database;
    final ctl = TextEditingController(text: isDb ? _run.currentOffset.toString() : _run.bruteCursor.toRadixString(16).toUpperCase());

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(isDb ? context.l10n.jumpToOffset : context.l10n.jumpToBruteCursor),
          content: TextField(
            controller: ctl,
            keyboardType: isDb ? TextInputType.number : TextInputType.text,
            inputFormatters: isDb
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Fa-f]'))],
            decoration: InputDecoration(
              helperText: isDb
                  ? context.l10n.irFinderJumpOffsetHelper
                  : context.l10n.irFinderJumpCursorHelper,
              prefixIcon: Icon(isDb ? Icons.numbers_rounded : Icons.hexagon_outlined, color: cs.primary),
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(context.l10n.cancel),
            ),
            FilledButton.tonal(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(context.l10n.jump),
            ),
          ],
        );
      },
    );

    if (!context.mounted) return;
    if (ok != true) return;

    if (isDb) {
      final v = int.tryParse(ctl.text.trim());
      if (v == null) return;
      _run.jumpToOffset(v);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.jumpedToOffsetPaused(v))),
      );
    } else {
      final raw = ctl.text.trim();
      BigInt cursor = BigInt.zero;
      try {
        if (raw.isNotEmpty) cursor = BigInt.parse(raw, radix: 16);
      } catch (_) {
        cursor = BigInt.zero;
      }
      _run.jumpToBrute(cursor);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.l10n.jumpedToCursorPaused(cursor.toRadixString(16).toUpperCase()),
          ),
        ),
      );
    }
  }

  Future<void> _pickBrand() async {
    if (!_dbReady) return;
    final String? picked = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _DbPickerSheet.brand(
        db: _db,
        protocolId: _dbOnlySelectedProtocol ? _protocolId : null,
      ),
    );
    if (!mounted) return;
    if (picked == null) return;
    setState(() {
      _brand = picked;
      _model = null;
    });
    _syncRunConfigToController();
  }

  Future<void> _pickModel() async {
    final brand = _brand;
    if (!_dbReady || brand == null) return;
    final String? picked = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _DbPickerSheet.model(
        db: _db,
        brand: brand,
        protocolId: _dbOnlySelectedProtocol ? _protocolId : null,
      ),
    );
    if (!mounted) return;
    if (picked == null) return;
    setState(() {
      _model = picked;
    });
    _syncRunConfigToController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final IrProtocolDefinition def = _definitionFor(_protocolId);
    final IrFinderBruteSpec? bruteSpec = _bruteSpecFor(_protocolId);

    final IrPrefixParseResult? parsed = _prefixParsed;

    final int totalHexDigits = _totalHexDigitsForProtocol(_protocolId);

    IrPrefixConstraint? prefixConstraint;
    BigInt? bruteSpace;
    BigInt? effectiveMaxAttempts;

    if (_mode == IrFinderMode.bruteforce && totalHexDigits > 0) {
      prefixConstraint = _effectivePrefixConstraint(
        totalHexDigits: totalHexDigits,
        displayName: def.displayName,
      );
      bruteSpace = _bruteTotalSpace(totalHexDigits: totalHexDigits, prefix: prefixConstraint);
      effectiveMaxAttempts = _bruteAllCombinations ? bruteSpace : _clampMaxAttempts(bruteSpace, _maxAttempts);
    }

    final int maxAttemptsUi = () {
      if (_mode == IrFinderMode.database) return _dbMaxKeysToTest;
      if (bruteSpace == null) return _maxAttempts;
      final BigInt eff = effectiveMaxAttempts ?? BigInt.from(_maxAttempts);
      return IrBigInt.toIntClamp(eff, max: 2147483647);
    }();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.irSignalTester),
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
          IconButton(
            tooltip: context.l10n.stop,
            onPressed: _run.running ? () => unawaited(_run.stop(clearPersistedSession: false)) : null,
            icon: const Icon(Icons.stop_circle_outlined),
          ),
        ],
      ),
      body: Transform.rotate(
        angle: RemoteOrientationController.instance.flipped ? 3.1415926535897932 : 0.0,
        child: IndexedStack(
          index: _pageIndex,
          children: <Widget>[
            _buildSetupPage(
              theme: theme,
              def: def,
              bruteSpec: bruteSpec,
              totalHexDigits: totalHexDigits,
              parsed: parsed,
              prefixConstraint: prefixConstraint,
              bruteSpace: bruteSpace,
              effectiveMaxAttempts: effectiveMaxAttempts,
            ),
            _buildTestPage(theme: theme, maxAttemptsUi: maxAttemptsUi),
            _buildResultsPage(theme: theme),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _pageIndex,
        onDestinationSelected: (i) {
          setState(() => _pageIndex = i);
        },
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: const Icon(Icons.tune_rounded),
            label: context.l10n.irFinderSetupTab,
          ),
          NavigationDestination(
            icon: const Icon(Icons.play_circle_outline),
            label: context.l10n.irFinderTestTab,
          ),
          NavigationDestination(
            icon: const Icon(Icons.bookmarks_outlined),
            label: context.l10n.irFinderResultsTab,
          ),
        ],
      ),
    );
  }

  Widget _buildSetupPage({
    required ThemeData theme,
    required IrProtocolDefinition def,
    required IrFinderBruteSpec? bruteSpec,
    required int totalHexDigits,
    required IrPrefixParseResult? parsed,
    required IrPrefixConstraint? prefixConstraint,
    required BigInt? bruteSpace,
    required BigInt? effectiveMaxAttempts,
  }) {
    final int maxPrefixDigitsEven = _maxPrefixHexDigitsEvenForProtocol(_protocolId);
    final int usedPrefixDigits = _hexDigitCount(_prefixCtl.text);
    final String? example = _exampleForProtocol(_protocolId);
    final int maxBytes = maxPrefixDigitsEven > 0 ? (maxPrefixDigitsEven ~/ 2) : 0;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _TopInfoCard(
          protocolName: def.displayName,
          protocolDescription: def.description ?? '',
          mode: _mode,
        ),
        const SizedBox(height: 12),
        _ProtocolPicker(
          protocolId: _protocolId,
          onChanged: _run.running
              ? null
              : (id) {
                  setState(() {
                    _protocolId = id;
                    _applyPrefixLimitForCurrentProtocol();
                    if (_mode == IrFinderMode.database) {
                      _brand = null;
                      _model = null;
                    }
                  });
                  _syncRunConfigToController();
                },
        ),
        const SizedBox(height: 12),
        _ModePicker(
          mode: _mode,
          onChanged: _run.running
              ? null
              : (m) {
                  setState(() {
                    _mode = m;
                    if (_mode == IrFinderMode.database) {
                      _brand ??= null;
                      _model ??= null;
                    }
                  });
                  _syncRunConfigToController();
                },
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _prefixCtl,
          enabled: !_run.running,
          inputFormatters: <TextInputFormatter>[
            if (maxPrefixDigitsEven > 0) _HexDigitLengthLimitingFormatter(maxDigits: maxPrefixDigitsEven),
          ],
          decoration: InputDecoration(
            labelText: context.l10n.irFinderKnownPrefixLabel,
            hintText: context.l10n.irFinderKnownPrefixHint,
            helperText: (totalHexDigits > 0)
                ? (example != null && maxPrefixDigitsEven > 0
                    ? context.l10n.irFinderKnownPrefixHelperPayloadExampleMax(totalHexDigits, example, maxBytes)
                    : example != null
                        ? context.l10n.irFinderKnownPrefixHelperPayloadExample(totalHexDigits, example)
                        : maxPrefixDigitsEven > 0
                            ? context.l10n.irFinderKnownPrefixHelperPayloadMax(totalHexDigits, maxBytes)
                            : context.l10n.irFinderKnownPrefixHelperPayload(totalHexDigits))
                : (example != null
                    ? context.l10n.irFinderKnownPrefixHelperExample(example)
                    : context.l10n.irFinderKnownPrefixHelperFallback),
            suffixText: (maxPrefixDigitsEven > 0) ? '$usedPrefixDigits/$maxPrefixDigitsEven' : null,
            prefixIcon: const Icon(Icons.key_outlined),
            errorText: (parsed != null && !parsed.ok && _prefixCtl.text.trim().isNotEmpty)
                ? parsed.error
                : (prefixConstraint != null && !prefixConstraint.valid)
                    ? prefixConstraint.errorMessage
                    : null,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        _PrefixParsedRow(parsed: parsed),
        const SizedBox(height: 14),
        if (_mode == IrFinderMode.bruteforce)
          _BruteForceSetupCard(
            theme: theme,
            totalHexDigits: totalHexDigits,
            bruteSpec: bruteSpec,
            bruteSpace: bruteSpace,
            effectiveMaxAttempts: effectiveMaxAttempts,
            delayMs: _delayMs,
            maxAttempts: _maxAttempts,
            maxAttemptsAll: _bruteAllCombinations,
            maxAttemptsController: _maxAttemptsCtl,
            onMaxAttemptsAllChanged: _run.running ? null : _toggleBruteAll,
            onDelayChanged: _run.running
                ? null
                : (v) {
                    setState(() => _delayMs = v);
                    _syncRunConfigToController();
                  },
            onMaxAttemptsChanged: _run.running ? null : (v) => _setMaxAttempts(v),
          )
        else
          _DbSetupCard(
            theme: theme,
            dbReady: _dbReady,
            dbInitFailed: _dbInitFailed,
            brand: _brand,
            model: _model,
            onlySelectedProtocol: _dbOnlySelectedProtocol,
            quickWinsFirst: _dbQuickWinsFirst,
            maxKeysToTest: _dbMaxKeysToTest,
            running: _run.running,
            onPickBrand: _pickBrand,
            onPickModel: _pickModel,
            onToggleOnlySelectedProtocol: (v) {
              setState(() => _dbOnlySelectedProtocol = v);
              _syncRunConfigToController();
            },
            onToggleQuickWinsFirst: (v) {
              setState(() => _dbQuickWinsFirst = v);
              _syncRunConfigToController();
            },
            onMaxKeysChanged: (v) {
              setState(() => _dbMaxKeysToTest = v);
              _syncRunConfigToController();
            },
            onRetryDbInit: _initDb,
          ),
        const SizedBox(height: 14),
        FilledButton.icon(
          onPressed: _run.running ? null : () => setState(() => _pageIndex = 1),
          icon: const Icon(Icons.arrow_forward_rounded),
          label: Text(context.l10n.irFinderContinueToTest),
        ),
      ],
    );
  }

  Widget _buildTestPage({required ThemeData theme, required int maxAttemptsUi}) {
    final bool isKaseikyo = _protocolId.trim().toLowerCase() == 'kaseikyo';

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (_resumeSession != null && !_run.running)
          _ResumeBannerCard(
            theme: theme,
            snapshot: _resumeSession!,
            onResume: () => unawaited(_resumeFromSnapshot(_resumeSession!)),
            onDiscard: () => unawaited(_discardResumeSession()),
          ),
        if (_resumeSession != null && !_run.running) const SizedBox(height: 12),
        if (isKaseikyo)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.factory_outlined, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        context.l10n.irFinderKaseikyoVendorTitle,
                        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _kaseikyoVendorPresets.entries.map((e) {
                      final selected = _kaseikyoVendor.toUpperCase() == e.value.toUpperCase();
                      return ChoiceChip(
                        label: Text('${e.key} (${e.value})'),
                        selected: selected,
                        onSelected: _run.running
                            ? null
                            : (_) {
                                final v = e.value.toUpperCase();
                                setState(() => _kaseikyoVendor = v);
                                _syncingKaseikyoVendorText = true;
                                _kaseikyoVendorCtl.value = TextEditingValue(
                                  text: v,
                                  selection: TextSelection.collapsed(offset: v.length),
                                );
                                _syncingKaseikyoVendorText = false;
                                _syncRunConfigToController();
                              },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _kaseikyoVendorCtl,
                    enabled: !_run.running,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Fa-f]')),
                      LengthLimitingTextInputFormatter(4),
                    ],
                    decoration: InputDecoration(
                      labelText: context.l10n.irFinderCustomVendorLabel,
                      prefixIcon: const Icon(Icons.edit_outlined),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (isKaseikyo) const SizedBox(height: 12),
        _RunStatusCard(
          theme: theme,
          mode: _mode,
          running: _run.running,
          paused: _run.paused,
          attempted: _run.attempted,
          maxAttempts: maxAttemptsUi,
          delayMs: _delayMs,
          startedAt: _run.startedAt,
          lastCandidate: _run.lastCandidate,
          lastError: _run.lastError,
          onPlayPause: _playPauseToggle,
          onStop: _run.running ? () => unawaited(_run.stop(clearPersistedSession: false)) : null,
          onStep: (_run.running && _run.paused) ? () async { await _run.step(); await Haptics.selectionClick(); } : null,
          onTrigger: (_run.running) ? () async { await _run.trigger(); await Haptics.lightImpact(); } : null,
          onSkip: (_run.running) ? () { _run.skip(); unawaited(Haptics.selectionClick()); } : null,
          onSaveHit: (_run.lastCandidate != null) ? () => unawaited(_saveHitFromLast()) : null,
          onJump: _run.running ? () => _showJumpDialog(context) : null,
          onCopyCurrent: _run.lastCandidate != null ? () => _copyCurrentCandidate(context) : null,
        ),
        const SizedBox(height: 14),
        if (_mode == IrFinderMode.database)
          FilledButton.tonalIcon(
            onPressed: !_dbReady || _brand == null ? null : () => _browseDbCandidates(context),
            icon: const Icon(Icons.list_alt_rounded),
            label: Text(context.l10n.irFinderBrowseDbCandidates),
          ),
        if (_mode == IrFinderMode.database) const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: _run.running ? null : () => setState(() => _pageIndex = 0),
                icon: const Icon(Icons.tune_rounded),
                label: Text(context.l10n.irFinderEditSetup),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: () => setState(() => _pageIndex = 2),
                icon: const Icon(Icons.bookmarks_outlined),
                label: Text(context.l10n.irFinderResultsTab),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildResultsPage({required ThemeData theme}) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (_hits.isEmpty)
          Text(
            context.l10n.irFinderNoSavedHits,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
            ),
          )
        else
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                for (int i = 0; i < _hits.length; i++) ...[
                  if (i != 0) const Divider(height: 0),
                  _HitTile(
                    hit: _hits[i],
                    onTest: () => unawaited(_testHit(_hits[i])),
                    onCopy: () => unawaited(_copyHit(_hits[i])),
                    onDelete: () => setState(() => _hits.removeAt(i)),
                    onAddToRemote: () => unawaited(_addHitToRemoteWith(context, _hits[i])),
                  ),
                ],
              ],
            ),
          ),
        const SizedBox(height: 10),
        _ResultsNote(theme: theme),
        const SizedBox(height: 14),
        FilledButton.tonalIcon(
          onPressed: () => setState(() => _pageIndex = 1),
          icon: const Icon(Icons.play_arrow_rounded),
          label: Text(context.l10n.irFinderBackToTest),
        ),
      ],
    );
  }
}

Future<bool> _confirmBigSearchSpace(BuildContext context, BigInt space) async {
  final theme = Theme.of(context);
  final String human = IrBigInt.formatHuman(space);
  return await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      icon: Icon(Icons.warning_amber_rounded, color: theme.colorScheme.error),
      title: Text(context.l10n.irFinderLargeSearchSpaceTitle),
      content: Text(
        context.l10n.irFinderLargeSearchSpaceBody(human),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: const Text('Cancel'),
        ),
        FilledButton.tonal(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: Text(context.l10n.proceed),
        ),
      ],
    ),
  ).then((v) => v ?? false);
}

class _ResumeBannerCard extends StatelessWidget {
  final ThemeData theme;
  final IrFinderSessionSnapshot snapshot;
  final VoidCallback onResume;
  final VoidCallback onDiscard;

  const _ResumeBannerCard({
    required this.theme,
    required this.snapshot,
    required this.onResume,
    required this.onDiscard,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;
    final String titleMode = snapshot.mode == IrFinderMode.database
        ? context.l10n.irFinderDatabaseSession
        : context.l10n.irFinderBruteforceSession;
    final String titleProto = snapshot.protocolId.toUpperCase();
    final String brand = snapshot.brand ?? context.l10n.notAvailableSymbol;
    final String model = (snapshot.model != null && snapshot.model!.trim().isNotEmpty)
        ? snapshot.model!
        : context.l10n.notAvailableSymbol;

    final String progress = '${snapshot.attempted}/${snapshot.mode == IrFinderMode.database ? snapshot.maxKeysToTest : snapshot.bruteMaxAttempts}';
    final String when = snapshot.startedAt == null ? context.l10n.notAvailableSymbol : snapshot.startedAt!.toLocal().toString();

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.restore_rounded, color: cs.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    context.l10n.irFinderResumeLastSession,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                TextButton(
                  onPressed: onDiscard,
                  child: Text(context.l10n.discard),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '$titleMode · $titleProto',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              snapshot.mode == IrFinderMode.database
                  ? context.l10n.irFinderResumeBrandModel(brand, model)
                  : context.l10n.irFinderResumePrefix(
                      snapshot.prefixRaw.trim().isEmpty ? context.l10n.notAvailableSymbol : snapshot.prefixRaw.trim(),
                    ),
              style: theme.textTheme.bodySmall?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.72),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              context.l10n.irFinderResumeProgress(progress, when),
              style: theme.textTheme.bodySmall?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.72),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: onResume,
              icon: const Icon(Icons.play_arrow_rounded),
              label: Text(context.l10n.irFinderApplyResume),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopInfoCard extends StatelessWidget {
  final String protocolName;
  final String protocolDescription;
  final IrFinderMode mode;

  const _TopInfoCard({
    required this.protocolName,
    required this.protocolDescription,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String modeLabel = mode == IrFinderMode.bruteforce
        ? context.l10n.irFinderBruteforceMode
        : context.l10n.irFinderDatabaseAssistedMode;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              leading: Icon(Icons.info_outline, color: theme.colorScheme.primary),
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      context.l10n.irFinderProtocolTitle(protocolName),
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      modeLabel,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              children: [
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    protocolDescription.isEmpty ? context.l10n.noDescriptionAvailable : protocolDescription,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.78),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProtocolPicker extends StatelessWidget {
  final String protocolId;
  final ValueChanged<String>? onChanged;

  const _ProtocolPicker({
    required this.protocolId,
    required this.onChanged,
  });

  static const List<String> _knownProtocolIds = <String>[
    'nec',
    'nec2',
    'necx1',
    'necx2',
    'nrc17',
    'denon',
    'f12_relaxed',
    'jvc',
    'kaseikyo',
    'pioneer',
    'proton',
    'rc5',
    'rc6',
    'rca_38',
    'rcc0082',
    'rcc2026',
    'rec80',
    'recs80',
    'recs80_l',
    'samsung32',
    'samsung36',
    'sharp',
    'sony12',
    'sony15',
    'sony20',
    'thomson7',
    'xsat',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = <DropdownMenuItem<String>>[];

    for (final id in _knownProtocolIds) {
      try {
        final def = IrProtocolRegistry.encoderFor(id).definition;
        items.add(
          DropdownMenuItem<String>(
            value: id,
            child: Text('${def.displayName} (${def.id})'),
          ),
        );
      } catch (_) {}
    }

    final String effectiveValue = items.any((e) => e.value == protocolId) ? protocolId : (items.isNotEmpty ? items.first.value! : protocolId);

    return InputDecorator(
      decoration: InputDecoration(
        labelText: context.l10n.irFinderProtocolLabel,
        helperText: context.l10n.irFinderProtocolHelper,
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.waves_outlined),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: effectiveValue,
          isExpanded: true,
          items: items,
          onChanged: (String? v) {
            if (v == null) return;
            onChanged?.call(v);
          },
          icon: Icon(Icons.expand_more, color: theme.colorScheme.onSurface.withValues(alpha: 0.7)),
        ),
      ),
    );
  }
}

class _ModePicker extends StatelessWidget {
  final IrFinderMode mode;
  final ValueChanged<IrFinderMode>? onChanged;

  const _ModePicker({
    required this.mode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<IrFinderMode>(
      segments: <ButtonSegment<IrFinderMode>>[
        ButtonSegment(
          value: IrFinderMode.bruteforce,
          label: Text(context.l10n.irFinderBruteforceMode),
          icon: const Icon(Icons.shuffle_rounded),
        ),
        ButtonSegment(
          value: IrFinderMode.database,
          label: Text(context.l10n.irFinderDatabaseMode),
          icon: const Icon(Icons.storage_rounded),
        ),
      ],
      selected: <IrFinderMode>{mode},
      onSelectionChanged: onChanged == null
          ? null
          : (s) {
              if (s.isEmpty) return;
              onChanged!(s.first);
            },
    );
  }
}

class _PrefixParsedRow extends StatelessWidget {
  final IrPrefixParseResult? parsed;

  const _PrefixParsedRow({required this.parsed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final p = parsed;

    if (p == null || p.raw.trim().isEmpty) {
      return Text(
        context.l10n.irFinderNormalizedPrefixValue(context.l10n.notAvailableSymbol),
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
        ),
      );
    }

    if (!p.ok) {
      return Text(
        context.l10n.irFinderNormalizedPrefixValue(context.l10n.notAvailableSymbol),
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
        ),
      );
    }

    final norm = IrPrefix.formatBytesAsHex(p.bytes);
    return Row(
      children: [
        Text(
          context.l10n.irFinderNormalizedPrefix,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.55),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.35)),
          ),
          child: Text(
            norm,
            style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class _BruteForceSetupCard extends StatelessWidget {
  final ThemeData theme;
  final int totalHexDigits;
  final IrFinderBruteSpec? bruteSpec;
  final BigInt? bruteSpace;
  final BigInt? effectiveMaxAttempts;
  final int delayMs;
  final int maxAttempts;
  final bool maxAttemptsAll;
  final TextEditingController maxAttemptsController;
  final ValueChanged<bool>? onMaxAttemptsAllChanged;
  final ValueChanged<int>? onDelayChanged;
  final ValueChanged<int>? onMaxAttemptsChanged;

  const _BruteForceSetupCard({
    required this.theme,
    required this.totalHexDigits,
    required this.bruteSpec,
    required this.bruteSpace,
    required this.effectiveMaxAttempts,
    required this.delayMs,
    required this.maxAttempts,
    required this.maxAttemptsAll,
    required this.maxAttemptsController,
    required this.onMaxAttemptsAllChanged,
    required this.onDelayChanged,
    required this.onMaxAttemptsChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (totalHexDigits <= 0) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Icon(Icons.block, color: theme.colorScheme.error),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  context.l10n.irFinderBruteforceNotConfigured,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final String spaceText = bruteSpace == null ? '—' : IrBigInt.formatHuman(bruteSpace!);

    const int sliderCap = 2000000;
    final BigInt space = bruteSpace ?? BigInt.zero;
    final int sliderMax = (space <= BigInt.zero) ? 1 : IrBigInt.toIntClamp(space, max: sliderCap).clamp(1, sliderCap);
    final int sliderValue = maxAttempts.clamp(1, sliderMax);
    final int? divisions = (sliderMax <= 1) ? null : (sliderMax <= 400 ? (sliderMax - 1) : 200);

    final BigInt eff = effectiveMaxAttempts ?? BigInt.from(maxAttempts);
    final String effText = maxAttemptsAll ? context.l10n.irFinderAllLimit(spaceText) : IrBigInt.formatHuman(eff);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.shield_outlined, color: theme.colorScheme.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(context.l10n.irFinderTestControls, style: theme.textTheme.titleMedium),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              context.l10n.irFinderPayloadLength(totalHexDigits),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.78),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              context.l10n.irFinderSearchSpace(spaceText),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.78),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              context.l10n.irFinderCooldownMs,
              style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Slider(
              value: delayMs.toDouble().clamp(250, 2000),
              min: 250,
              max: 2000,
              divisions: 35,
              label: '$delayMs ms',
              onChanged: onDelayChanged == null ? null : (v) => onDelayChanged!(v.round()),
            ),
            const SizedBox(height: 10),
            Text(
              context.l10n.irFinderMaxAttemptsPerRun,
              style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: maxAttemptsAll,
              onChanged: onMaxAttemptsAllChanged,
              title: Text(context.l10n.irFinderTestAllCombinations),
              subtitle: Text(
                context.l10n.irFinderTestAllCombinationsHint(effText),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                ),
              ),
            ),
            if (!maxAttemptsAll) ...[
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: maxAttemptsController,
                      enabled: onMaxAttemptsChanged != null,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: context.l10n.irFinderAttempts,
                        helperText: context.l10n.irFinderAttemptsSliderRange(sliderMax),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.numbers_rounded),
                      ),
                      onSubmitted: (_) {
                        final v = int.tryParse(maxAttemptsController.text.trim());
                        if (v != null) onMaxAttemptsChanged?.call(v);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  FilledButton.tonal(
                    onPressed: onMaxAttemptsChanged == null ? null : () => onMaxAttemptsChanged!(sliderMax),
                    child: Text(context.l10n.irFinderMaxButton(sliderMax), textAlign: TextAlign.center),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Slider(
                value: sliderValue.toDouble(),
                min: 1,
                max: sliderMax.toDouble(),
                divisions: divisions,
                label: '$sliderValue',
                onChanged: onMaxAttemptsChanged == null ? null : (v) => onMaxAttemptsChanged!(v.round()),
              ),
              const SizedBox(height: 6),
              Text(
                context.l10n.irFinderEffectiveLimitThisRun(effText),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ] else ...[
              const SizedBox(height: 6),
              Text(
                context.l10n.irFinderEffectiveLimitThisRun(effText),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
            const SizedBox(height: 6),
            Text(
              context.l10n.irFinderBruteforceTip,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DbSetupCard extends StatelessWidget {
  final ThemeData theme;
  final bool dbReady;
  final bool dbInitFailed;
  final String? brand;
  final String? model;
  final bool onlySelectedProtocol;
  final bool quickWinsFirst;
  final int maxKeysToTest;
  final bool running;
  final VoidCallback onPickBrand;
  final VoidCallback onPickModel;
  final ValueChanged<bool> onToggleOnlySelectedProtocol;
  final ValueChanged<bool> onToggleQuickWinsFirst;
  final ValueChanged<int> onMaxKeysChanged;
  final VoidCallback onRetryDbInit;

  const _DbSetupCard({
    required this.theme,
    required this.dbReady,
    required this.dbInitFailed,
    required this.brand,
    required this.model,
    required this.onlySelectedProtocol,
    required this.quickWinsFirst,
    required this.maxKeysToTest,
    required this.running,
    required this.onPickBrand,
    required this.onPickModel,
    required this.onToggleOnlySelectedProtocol,
    required this.onToggleQuickWinsFirst,
    required this.onMaxKeysChanged,
    required this.onRetryDbInit,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;

    if (!dbReady) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              SizedBox(
                width: 18,
                height: 18,
                child: dbInitFailed ? const Icon(Icons.error_outline) : const CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  dbInitFailed ? context.l10n.irFinderDatabaseInitFailed : context.l10n.irFinderPreparingDatabase,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              if (dbInitFailed)
                FilledButton.tonal(
                  onPressed: running ? null : onRetryDbInit,
                  child: Text(context.l10n.retry),
                ),
            ],
          ),
        ),
      );
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.storage_rounded, color: cs.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(context.l10n.irFinderDatabaseAssistedSearch, style: theme.textTheme.titleMedium),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.business_outlined),
              title: Text(context.l10n.irFinderBrand),
              subtitle: Text(brand ?? context.l10n.irFinderSelectBrand),
              trailing: const Icon(Icons.chevron_right),
              onTap: running ? null : onPickBrand,
            ),
            const Divider(height: 0),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.memory_outlined),
              title: Text(context.l10n.irFinderModelOptional),
              subtitle: Text(model ?? (brand == null ? context.l10n.irFinderSelectBrandFirstShort : context.l10n.irFinderSelectModelRecommended)),
              trailing: const Icon(Icons.chevron_right),
              onTap: (running || brand == null) ? null : onPickModel,
            ),
            const SizedBox(height: 10),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: onlySelectedProtocol,
              onChanged: running ? null : onToggleOnlySelectedProtocol,
              title: Text(context.l10n.irFinderOnlySelectedProtocol),
              subtitle: Text(context.l10n.irFinderOnlySelectedProtocolHint),
            ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: quickWinsFirst,
              onChanged: running ? null : onToggleQuickWinsFirst,
              title: Text(context.l10n.irFinderQuickWinsFirst),
              subtitle: Text(context.l10n.irFinderQuickWinsFirstHint),
            ),
            const SizedBox(height: 10),
            Text(
              context.l10n.irFinderMaxKeysPerRun,
              style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Slider(
              value: maxKeysToTest.toDouble().clamp(25, 2000),
              min: 25,
              max: 2000,
              divisions: 79,
              label: '$maxKeysToTest',
              onChanged: running ? null : (v) => onMaxKeysChanged(v.round()),
            ),
          ],
        ),
      ),
    );
  }
}

class _RunStatusCard extends StatelessWidget {
  final ThemeData theme;
  final IrFinderMode mode;
  final bool running;
  final bool paused;
  final int attempted;
  final int maxAttempts;
  final int delayMs;
  final DateTime? startedAt;
  final IrFinderCandidate? lastCandidate;
  final Object? lastError;

  final Future<void> Function() onPlayPause;
  final VoidCallback? onStop;
  final Future<void> Function()? onStep;
  final Future<void> Function()? onTrigger;
  final VoidCallback? onSkip;
  final VoidCallback? onSaveHit;
  final VoidCallback? onJump;
  final VoidCallback? onCopyCurrent;

  const _RunStatusCard({
    required this.theme,
    required this.mode,
    required this.running,
    required this.paused,
    required this.attempted,
    required this.maxAttempts,
    required this.delayMs,
    required this.startedAt,
    required this.lastCandidate,
    required this.lastError,
    required this.onPlayPause,
    required this.onStop,
    required this.onStep,
    required this.onTrigger,
    required this.onSkip,
    required this.onSaveHit,
    this.onJump,
    this.onCopyCurrent,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;
    final progress = maxAttempts <= 0 ? 0.0 : (attempted / maxAttempts).clamp(0.0, 1.0);

    final elapsed = (startedAt == null) ? null : DateTime.now().difference(startedAt!);
    String etaText = context.l10n.notAvailableSymbol;
    if (elapsed != null && attempted > 0 && maxAttempts > attempted) {
      final per = elapsed.inMilliseconds / attempted;
      final remaining = (maxAttempts - attempted) * per;
      etaText = _formatEta(context, Duration(milliseconds: remaining.round()));
    }

    final String statusLabel = !running
        ? context.l10n.idle
        : (paused ? context.l10n.paused : context.l10n.irFinderTesting);
    final IconData statusIcon = !running
        ? Icons.pause_circle_outline
        : paused
            ? Icons.pause_circle_filled
            : Icons.bolt_rounded;

    final bool hasError = lastError != null;

    final String playLabel = !running
        ? context.l10n.start
        : (paused ? context.l10n.resume : context.l10n.pause);

    final IconData playIcon = !running
        ? Icons.play_arrow_rounded
        : (paused ? Icons.play_arrow_rounded : Icons.pause_rounded);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(statusIcon, color: cs.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    statusLabel,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '${attempted.clamp(0, maxAttempts)}/$maxAttempts',
                    style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 8,
              children: [
                _MiniChip(label: context.l10n.irFinderCooldown, value: '${delayMs}ms'),
                _MiniChip(label: context.l10n.irFinderEta, value: etaText),
                _MiniChip(
                  label: context.l10n.irFinderMode,
                  value: mode == IrFinderMode.bruteforce
                      ? context.l10n.irFinderBruteforceMode
                      : context.l10n.irFinderDatabaseMode,
                ),
              ],
            ),
            const SizedBox(height: 12),
           _LastAttemptBox(theme: theme, candidate: lastCandidate, error: lastError, onCopy: onCopyCurrent),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => onPlayPause(),
                    icon: Icon(playIcon),
                    label: Text(playLabel),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: onStop,
                    icon: const Icon(Icons.stop_rounded),
                    label: Text(context.l10n.stop),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: onStep == null ? null : () => onStep!.call(),
                    icon: const Icon(Icons.skip_previous_rounded),
                    label: Text(context.l10n.step),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: onTrigger == null ? null : () => onTrigger!.call(),
                    icon: Icon(hasError ? Icons.replay_rounded : Icons.repeat_rounded),
                    label: Text(hasError ? context.l10n.irFinderRetryLast : context.l10n.irFinderTrigger),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
           Row(
             children: [
               Expanded(
                 child: FilledButton.tonalIcon(
                   onPressed: onSkip,
                   icon: const Icon(Icons.skip_next_rounded),
                   label: Text(context.l10n.skip),
                 ),
               ),
               const SizedBox(width: 12),
               Expanded(
                 child: FilledButton.tonalIcon(
                   onPressed: onJump,
                   icon: const Icon(Icons.my_location_rounded),
                   label: Text(context.l10n.irFinderJump),
                 ),
               ),
             ],
           ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: onSaveHit,
              icon: const Icon(Icons.bookmark_add_outlined),
              label: Text(context.l10n.irFinderSaveHit),
            ),
          ],
        ),
      ),
    );
  }

  static String _formatEta(BuildContext context, Duration d) {
    final int s = d.inSeconds;
    if (s < 60) return context.l10n.irFinderEtaSeconds(s);
    final int m = s ~/ 60;
    final int rs = s % 60;
    if (m < 60) return context.l10n.irFinderEtaMinutesSeconds(m, rs);
    final int h = m ~/ 60;
    final int rm = m % 60;
    return context.l10n.irFinderEtaHoursMinutes(h, rm);
  }
}

class _LastAttemptBox extends StatelessWidget {
  final ThemeData theme;
  final IrFinderCandidate? candidate;
  final Object? error;
  final VoidCallback? onCopy;

  const _LastAttemptBox({
    required this.theme,
    required this.candidate,
    required this.error,
    this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;
    final c = candidate;

    final String title = (c == null)
        ? context.l10n.irFinderLastAttemptedCode(context.l10n.notAvailableSymbol)
        : context.l10n.irFinderLastAttemptedCode('${c.displayProtocol} ${c.displayCode}');

    final String subtitle = (c == null)
        ? context.l10n.irFinderStartTestingToSeeLastCode
        : (c.source == IrFinderSource.database)
            ? [
                context.l10n.irFinderFromDb(c.dbBrand ?? context.l10n.notAvailableSymbol),
                if (c.dbModel != null && c.dbModel!.trim().isNotEmpty) c.dbModel!,
                if (c.dbLabel != null && c.dbLabel!.trim().isNotEmpty) context.l10n.irFinderKeyValue(c.dbLabel!),
                if (c.dbRemoteId != null) context.l10n.irFinderRemoteNumber(c.dbRemoteId!.toString()),
              ].join(' · ')
            : context.l10n.irFinderFromBruteforce;

    final bool hasError = error != null;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: hasError ? cs.errorContainer.withValues(alpha: 0.65) : cs.surfaceContainerHighest.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
           children: [
             Expanded(
               child: Text(
                 title,
                 style: theme.textTheme.bodyMedium?.copyWith(
                   fontWeight: FontWeight.w700,
                   color: hasError ? cs.onErrorContainer : cs.onSurface,
                 ),
               ),
             ),
             if (onCopy != null)
               IconButton(
                 tooltip: context.l10n.copiedCurrentCandidate,
                 icon: Icon(Icons.copy_rounded, color: hasError ? cs.onErrorContainer : cs.onSurface),
                 onPressed: onCopy,
               ),
           ],
         ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: hasError ? cs.onErrorContainer.withValues(alpha: 0.9) : cs.onSurface.withValues(alpha: 0.75),
            ),
          ),
          if (hasError) ...[
            const SizedBox(height: 8),
            Text(
              context.l10n.irFinderSendError(error.toString()),
              style: theme.textTheme.bodySmall?.copyWith(
                color: cs.onErrorContainer.withValues(alpha: 0.9),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _HitTile extends StatelessWidget {
  final IrFinderHit hit;
  final VoidCallback onTest;
  final VoidCallback onCopy;
  final VoidCallback onDelete;
  final VoidCallback onAddToRemote;

  const _HitTile({
    required this.hit,
    required this.onTest,
    required this.onCopy,
    required this.onDelete,
    required this.onAddToRemote,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final subtitle = <String>[
      context.l10n.irFinderSourceValue(
        hit.source == IrFinderSource.database ? context.l10n.irFinderDatabaseMode : context.l10n.irFinderBruteforceMode,
      ),
      if (hit.dbBrand != null && hit.dbBrand!.trim().isNotEmpty) context.l10n.irFinderBrandValue(hit.dbBrand!),
      if (hit.dbModel != null && hit.dbModel!.trim().isNotEmpty) context.l10n.irFinderModelValue(hit.dbModel!),
      if (hit.dbLabel != null && hit.dbLabel!.trim().isNotEmpty) context.l10n.irFinderKeyValue(hit.dbLabel!),
      if (hit.dbRemoteId != null) context.l10n.irFinderRemoteNumber(hit.dbRemoteId!.toString()),
    ].join(' · ');

    return ListTile(
      title: Text('${hit.protocolName} ${hit.code}'),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
      trailing: Wrap(
        spacing: 8,
        children: [
          IconButton(
            tooltip: context.l10n.addToRemote,
            onPressed: onAddToRemote,
            icon: const Icon(Icons.add_circle_outline_rounded),
          ),
          IconButton(
            tooltip: context.l10n.irFinderTestTab,
            onPressed: onTest,
            icon: const Icon(Icons.play_arrow_rounded),
          ),
          IconButton(
            tooltip: context.l10n.copy,
            onPressed: onCopy,
            icon: const Icon(Icons.copy_rounded),
          ),
          IconButton(
            tooltip: context.l10n.delete,
            onPressed: onDelete,
            icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
          ),
        ],
      ),
    );
  }
}

class _ResultsNote extends StatelessWidget {
  final ThemeData theme;

  const _ResultsNote({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.irFinderResultsNote,
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
      ),
    );
  }
}

class _MiniChip extends StatelessWidget {
  final String label;
  final String value;

  const _MiniChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.35)),
      ),
      child: Text(
        '$label: $value',
        style: TextStyle(
          color: cs.onSurface.withValues(alpha: 0.85),
          fontWeight: FontWeight.w700,
          fontSize: 12.5,
        ),
      ),
    );
  }
}

class _DbPickerSheet extends StatefulWidget {
  final IrBlasterDb db;
  final _DbPickerKind kind;
  final String? protocolId;
  final String? brand;

  const _DbPickerSheet._({
    required this.db,
    required this.kind,
    required this.protocolId,
    this.brand,
  });

  factory _DbPickerSheet.brand({required IrBlasterDb db, required String? protocolId}) {
    return _DbPickerSheet._(db: db, kind: _DbPickerKind.brand, protocolId: protocolId);
  }

  factory _DbPickerSheet.model({
    required IrBlasterDb db,
    required String brand,
    required String? protocolId,
  }) {
    return _DbPickerSheet._(
      db: db,
      kind: _DbPickerKind.model,
      brand: brand,
      protocolId: protocolId,
    );
  }

  @override
  State<_DbPickerSheet> createState() => _DbPickerSheetState();
}

enum _DbPickerKind { brand, model }

class _DbCandidatesSheet extends StatefulWidget {
  final IrBlasterDb db;
  final String brand;
  final String? model;
  final String? protocolId;
  final bool quickWinsFirst;
  final String? hexPrefixUpper;
  final ValueChanged<int> onJumpToOffset;
  final Future<void> Function(String protocolId, String codeHex) onSend;
  final Future<void> Function(String protocolId, String codeHex) onCopy;

  const _DbCandidatesSheet({
    required this.db,
    required this.brand,
    required this.model,
    required this.protocolId,
    required this.quickWinsFirst,
    required this.hexPrefixUpper,
    required this.onJumpToOffset,
    required this.onSend,
    required this.onCopy,
  });

  @override
  State<_DbCandidatesSheet> createState() => _DbCandidatesSheetState();
}

class _DbCandidatesSheetState extends State<_DbCandidatesSheet> {
  Timer? _debounce;
  final TextEditingController _searchCtl = TextEditingController();
  final ScrollController _scrollCtl = ScrollController();
  bool _loading = false;
  bool _exhausted = false;
  int _offset = 0;
  final List<IrDbKeyCandidate> _rows = <IrDbKeyCandidate>[];

  @override
  void initState() {
    super.initState();
    _scrollCtl.addListener(_onScroll);
    _searchCtl.addListener(() {
      _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 250), () {
        if (!mounted) return;
        _load(reset: true);
      });
    });
    _load(reset: true);
  }

  @override
  void dispose() {
    _scrollCtl.removeListener(_onScroll);
    _scrollCtl.dispose();
    _searchCtl.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_loading || _exhausted) return;
    if (_scrollCtl.position.pixels >= _scrollCtl.position.maxScrollExtent - 240) {
      _load(reset: false);
    }
  }

  Future<void> _load({required bool reset}) async {
    if (_loading) return;
    setState(() => _loading = true);
    try {
      if (reset) {
        _offset = 0;
        _exhausted = false;
        _rows.clear();
      }
      final rows = await widget.db.fetchCandidateKeys(
        brand: widget.brand,
        model: widget.model,
        selectedProtocolId: widget.protocolId,
        quickWinsFirst: widget.quickWinsFirst,
        hexPrefixUpper: widget.hexPrefixUpper,
        search: _searchCtl.text.trim(),
        limit: 60,
        offset: _offset,
      );
      if (!mounted) return;
      setState(() {
        _rows.addAll(rows);
        _offset += rows.length;
        if (rows.isEmpty) _exhausted = true;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _exhausted = true);
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child: Text(context.l10n.irFinderBrowseDbCandidatesTitle, style: theme.textTheme.titleLarge)),
                IconButton(
                  tooltip: context.l10n.close,
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _searchCtl,
              decoration: InputDecoration(
                hintText: context.l10n.irFinderFilterByLabelOrHex,
                prefixIcon: const Icon(Icons.search_rounded),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _rows.isEmpty && _loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      controller: _scrollCtl,
                      itemCount: _rows.length + (_loading ? 1 : 0),
                      separatorBuilder: (_, __) => const Divider(height: 0),
                      itemBuilder: (context, i) {
                        if (i >= _rows.length) {
                          return const Padding(
                            padding: EdgeInsets.all(14),
                            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                          );
                        }
                        final r = _rows[i];
                        final protoNorm = r.protocol.trim().toLowerCase().replaceAll('-', '_');
                        return ListTile(
                          title: Text('${r.label} · ${r.hexcode}'),
                          subtitle: Text(
                            [
                              context.l10n.irFinderRemoteNumber(r.remoteId.toString()),
                              r.protocol,
                              r.brand,
                              if ((r.model ?? '').trim().isNotEmpty) r.model!,
                            ].join(' · '),
                          ),
                          trailing: Wrap(
                            spacing: 8,
                            children: [
                              IconButton(
                                tooltip: context.l10n.irFinderJumpHere,
                                onPressed: () => widget.onJumpToOffset(i),
                                icon: const Icon(Icons.my_location_rounded),
                              ),
                              IconButton(
                                tooltip: context.l10n.send,
                                onPressed: () => widget.onSend(protoNorm, r.hexcode),
                                icon: const Icon(Icons.play_arrow_rounded),
                              ),
                              IconButton(
                                tooltip: context.l10n.copy,
                                onPressed: () => widget.onCopy(protoNorm, r.hexcode),
                                icon: const Icon(Icons.copy_rounded),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}


class _DbPickerSheetState extends State<_DbPickerSheet> {
  final TextEditingController _searchCtl = TextEditingController();
  final ScrollController _scrollCtl = ScrollController();
  bool _loading = false;
  bool _exhausted = false;
  int _offset = 0;
  final List<String> _items = <String>[];
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchCtl.addListener(_onSearch);
    _scrollCtl.addListener(_onScroll);
    _load(reset: true);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtl.removeListener(_onSearch);
    _scrollCtl.removeListener(_onScroll);
    _searchCtl.dispose();
    _scrollCtl.dispose();
    super.dispose();
  }

  void _onSearch() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 250), () {
      if (!mounted) return;
      _load(reset: true);
    });
  }

  void _onScroll() {
    if (_loading || _exhausted) return;
    if (_scrollCtl.position.pixels >= _scrollCtl.position.maxScrollExtent - 240) {
      _load(reset: false);
    }
  }

  Future<void> _load({required bool reset}) async {
    if (_loading) return;
    setState(() => _loading = true);
    try {
      if (reset) {
        _offset = 0;
        _exhausted = false;
        _items.clear();
      }

      final q = _searchCtl.text.trim();
      final List<String> rows;

      if (widget.kind == _DbPickerKind.brand) {
        rows = await widget.db.listBrands(
          search: q.isEmpty ? null : q,
          protocolId: widget.protocolId,
          limit: 60,
          offset: _offset,
        );
      } else {
        rows = await widget.db.listModelsDistinct(
          brand: widget.brand!,
          search: q.isEmpty ? null : q,
          protocolId: widget.protocolId,
          limit: 60,
          offset: _offset,
        );
      }

      if (!mounted) return;
      setState(() {
        _items.addAll(rows);
        _offset += rows.length;
        if (rows.isEmpty) _exhausted = true;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _exhausted = true);
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = widget.kind == _DbPickerKind.brand ? context.l10n.irFinderSelectBrand : context.l10n.irFinderSelectModel;
    final hint = widget.kind == _DbPickerKind.brand ? context.l10n.irFinderSearchBrands : context.l10n.irFinderSearchModels;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child: Text(title, style: theme.textTheme.titleLarge)),
                IconButton(
                  tooltip: context.l10n.close,
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _searchCtl,
              decoration: InputDecoration(
                hintText: hint,
                prefixIcon: const Icon(Icons.search_rounded),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _items.isEmpty && _loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      controller: _scrollCtl,
                      itemCount: _items.length + (_loading ? 1 : 0),
                      separatorBuilder: (_, __) => const Divider(height: 0),
                      itemBuilder: (context, i) {
                        if (i >= _items.length) {
                          return const Padding(
                            padding: EdgeInsets.all(14),
                            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                          );
                        }
                        final v = _items[i];
                        return ListTile(
                          title: Text(v),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.of(context).pop(v),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HexDigitLengthLimitingFormatter extends TextInputFormatter {
  final int maxDigits;

  _HexDigitLengthLimitingFormatter({required this.maxDigits});

  static bool _isHexChar(int u) {
    return (u >= 48 && u <= 57) || (u >= 65 && u <= 70) || (u >= 97 && u <= 102);
  }

  static String trimText(String input, int maxDigits) {
    if (maxDigits <= 0) return input;
    int digits = 0;
    final StringBuffer out = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      final int u = input.codeUnitAt(i);
      if (_isHexChar(u)) {
        if (digits >= maxDigits) break;
        digits++;
        out.writeCharCode(u);
      } else {
        if (digits < maxDigits) out.writeCharCode(u);
      }
    }
    return out.toString();
  }

  int _countDigits(String s) {
    int c = 0;
    for (int i = 0; i < s.length; i++) {
      if (_isHexChar(s.codeUnitAt(i))) c++;
    }
    return c;
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (maxDigits <= 0) return newValue;
    final int digits = _countDigits(newValue.text);
    if (digits <= maxDigits) return newValue;
    final String trimmed = trimText(newValue.text, maxDigits);
    return TextEditingValue(
      text: trimmed,
      selection: TextSelection.collapsed(offset: trimmed.length),
    );
  }
}
