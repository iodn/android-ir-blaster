import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/state/orientation_pref.dart';
import 'package:irblaster_controller/ir/ir_protocol_types.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/ir_finder/ir_prefix.dart';
import 'package:irblaster_controller/ir_finder/irblaster_db.dart';
import 'package:irblaster_controller/utils/ir.dart';

class IrFinderScreen extends StatefulWidget {
  const IrFinderScreen({super.key});

  @override
  State<IrFinderScreen> createState() => _IrFinderScreenState();
}

class _IrFinderScreenState extends State<IrFinderScreen> {
  int _pageIndex = 0;

  IrFinderMode _mode = IrFinderMode.bruteforce;

  // Default protocol: NEC
  String _protocolId = 'nec';

  // Prefix input
  final TextEditingController _prefixCtl = TextEditingController();
  IrPrefixParseResult? _prefixParsed;

  // Brute-force controls
  int _delayMs = 500;
  int _maxAttempts = 200;
   bool _bruteAllCombinations = false;
   int _maxAttemptsBeforeAll = 200;
   final TextEditingController _maxAttemptsCtl = TextEditingController();
   bool _syncingMaxAttemptsText = false;
  // DB controls
  bool _dbReady = false;
  bool _dbInitFailed = false;
  String? _brand;
  String? _model;
  bool _dbOnlySelectedProtocol = true;
  bool _dbQuickWinsFirst = true;
  int _dbMaxKeysToTest = 1000000;

  // Test/run state
  bool _running = false;
  int _runToken = 0;
  int _attempted = 0;
  DateTime? _startedAt;
  IrFinderCandidate? _lastCandidate;
  Object? _lastError;

  // Brute cursor is independent from _attempted (supports skip/retry cleanly).
  BigInt _bruteCursor = BigInt.zero;

  // DB candidate paging
  final List<IrDbKeyCandidate> _dbCandidates = <IrDbKeyCandidate>[];
  int _dbOffset = 0;
  bool _dbExhausted = false;
  bool _dbLoadingMore = false;

  // Results (saved hits)
  final List<IrFinderHit> _hits = <IrFinderHit>[];

  // DB singleton
  final IrBlasterDb _db = IrBlasterDb.instance;

  // Protocol hex-length constraints
  static const Map<String, String> _protocolExampleHex = <String, String>{
    'kaseikyo': '000000',
    'denon': '0000',
    'f12_relaxed': '100',
    'jvc': '0000',
    'nec': '000000FF',
    'nec2': '000800FF',
    'necx1': '000008F7',
    'necx2': '000C08F7',
    'pioneer': '00000000',
    'proton': '0000',
    'rc5': '000',
    'rc6': '0000',
    'rca_38': 'F00',
    'rcc0082': '000',
    'rcc2026': '0087FBC03FC',
    'rec80': '28C600212100',
    'recs80': '000',
    'recs80_l': '000',
    'sony12': '000',
    'sony15': '0014',
    'sony20': '0002F',
    'samsung36': '00C0001',
    'sharp': '2024',
    'thomson7': '300',
  };

  @override
  void initState() {
    super.initState();
    _prefixCtl.addListener(_onPrefixChanged);
    _maxAttemptsCtl.text = _maxAttempts.toString();
    _maxAttemptsCtl.addListener(_onMaxAttemptsTextChanged);
    _initDb();
    _applyPrefixLimitForCurrentProtocol();
  }

  @override
  void dispose() {
    _prefixCtl.removeListener(_onPrefixChanged);
    _prefixCtl.dispose();
    _maxAttemptsCtl.removeListener(_onMaxAttemptsTextChanged);
    _maxAttemptsCtl.dispose();
    super.dispose();
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
  }

  void _toggleBruteAll(bool v) {
    if (!mounted) return;
    setState(() {
      _bruteAllCombinations = v;
      if (v) {
        _maxAttemptsBeforeAll = _maxAttempts;
      } else {
        // restore previous "limited" value
        _setMaxAttempts(_maxAttemptsBeforeAll);
      }
    });
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
  }

  IrProtocolDefinition _definitionFor(String protocolId) {
    final enc = IrProtocolRegistry.encoderFor(protocolId);
    return enc.definition;
  }

  IrFinderBruteSpec? _bruteSpecFor(String protocolId) {
    return IrFinderBruteSpec.forProtocol(protocolId);
  }

  int _hexDigitCount(String s) {
    int c = 0;
    for (int i = 0; i < s.length; i++) {
      final int u = s.codeUnitAt(i);
      final bool isHex =
          (u >= 48 && u <= 57) || // 0-9
          (u >= 65 && u <= 70) || // A-F
          (u >= 97 && u <= 102); // a-f
      if (isHex) c++;
    }
    return c;
  }

  /// Total payload hex digits for the selected protocol.
  /// Source of truth: your example table. (Only fall back to brute spec if missing.)
  int _totalHexDigitsForProtocol(String protocolId) {
    final ex = _protocolExampleHex[protocolId];
    if (ex != null) return ex.length;
    final spec = _bruteSpecFor(protocolId);
    return spec?.totalHexDigits ?? 0;
  }

  /// Prefix UI is byte-oriented (pairs of hex digits). Clamp to the nearest even <= total.
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
        'Prefix is too long for $displayName: '
        'max ${maxBytesAllowed} byte(s) (${totalHexDigits} hex digit payload).',
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
    final int prefixHexDigits =
        (prefix?.valid ?? false) ? (prefix!.bytes.length * 2).clamp(0, totalHexDigits) : 0;
    final int remainingHexDigits = (totalHexDigits - prefixHexDigits).clamp(0, totalHexDigits);
    return IrBigInt.pow(BigInt.from(16), remainingHexDigits);
  }

  BigInt _clampMaxAttempts(BigInt space, int desired) {
    if (space <= BigInt.zero) return BigInt.zero;
    final BigInt d = BigInt.from(desired);
    return d <= space ? d : space;
  }

  String _normalizedProtocolIdFromDb(String s) {
    return s.trim().toLowerCase().replaceAll('-', '_');
  }

  // Kaseikyo vendor selection for brute-force
  String _kaseikyoVendor = '2002'; // Panasonic default
  static const Map<String,String> _kaseikyoVendorPresets = {
    'Panasonic': '2002',
    'Denon': '3254',
    'Mitsubishi': 'CB23',
    'Sharp': '5AAA',
    'JVC': '0103',
  };

 static String _composeHex({
    required int totalHexDigits,
    required BigInt cursor,
    required List<int> prefixBytes,
  }) {
    if (totalHexDigits <= 0) return '';

    final String prefixRaw =
        IrPrefix.formatBytesAsHex(prefixBytes).replaceAll(' ', '').toUpperCase();
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

    final String out = (prefix + tail);
    return out.length >= totalHexDigits ? out : out.padLeft(totalHexDigits, '0');
  }

  Future<void> _ensureDbCandidatesLoadedIfNeeded() async {
    if (_dbLoadingMore || _dbExhausted) return;
    if (_dbCandidates.length >= _dbMaxKeysToTest) return;

    final brand = _brand;
    if (brand == null || brand.trim().isEmpty) {
      _dbExhausted = true;
      return;
    }

    setState(() => _dbLoadingMore = true);

    try {
      final prefix = (_prefixParsed != null && _prefixParsed!.ok && _prefixParsed!.bytes.isNotEmpty)
          ? IrPrefix.formatBytesAsHex(_prefixParsed!.bytes).replaceAll(' ', '').toUpperCase()
          : null;

      final rows = await _db.fetchCandidateKeys(
        brand: brand,
        model: _model,
        selectedProtocolId: _dbOnlySelectedProtocol ? _protocolId : null,
        quickWinsFirst: _dbQuickWinsFirst,
        hexPrefixUpper: prefix,
        limit: 100,
        offset: _dbOffset,
      );

      if (!mounted) return;

      setState(() {
        _dbOffset += rows.length.toInt();
        if (rows.isEmpty) _dbExhausted = true;
        _dbCandidates.addAll(rows);
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _dbExhausted = true;
        _lastError = e;
      });
    } finally {
      if (!mounted) return;
      setState(() => _dbLoadingMore = false);
    }
  }

  Future<IrFinderCandidate?> _nextCandidate() async {
    if (_mode == IrFinderMode.bruteforce) {
      final int totalHexDigits = _totalHexDigitsForProtocol(_protocolId);
      if (totalHexDigits <= 0) return null;

      final def = _definitionFor(_protocolId);

      final prefix = _effectivePrefixConstraint(
        totalHexDigits: totalHexDigits,
        displayName: def.displayName,
      );
      if (prefix != null && !prefix.valid) {
        _lastError = prefix.errorMessage;
        return null;
      }

      final space = _bruteTotalSpace(totalHexDigits: totalHexDigits, prefix: prefix);
      if (space <= BigInt.zero) return null;
      if (_bruteCursor >= space) return null;

      final String codeHex = _composeHex(
        totalHexDigits: totalHexDigits,
        cursor: _bruteCursor,
        prefixBytes: (prefix != null && prefix.valid) ? prefix.bytes : const <int>[],
      );

      final params = IrFinderParams.buildParamsForProtocol(
        _protocolId,
        codeHex,
        kaseikyoVendor: _protocolId.trim().toLowerCase() == 'kaseikyo' ? _kaseikyoVendor : null,
      );

      final candidate = IrFinderCandidate(
        protocolId: _protocolId,
        displayProtocol: def.displayName,
        displayCode: codeHex.toUpperCase(),
        params: params,
        source: IrFinderSource.bruteforce,
      );

      _bruteCursor += BigInt.one;
      return candidate;
    }

    // DB-assisted
    await _ensureDbCandidatesLoadedIfNeeded();
    if (_dbCandidates.isEmpty) return null;
    final int idx = _attempted;
    if (idx < 0 || idx >= _dbCandidates.length) return null;

    final row = _dbCandidates[idx];
    final normId = _normalizedProtocolIdFromDb(row.protocol);

    IrProtocolDefinition def;
    try {
      def = _definitionFor(normId);
    } catch (_) {
      return null; // unknown protocol in registry
    }

    final params = IrFinderParams.buildParamsForProtocol(normId, row.hexcode);

    return IrFinderCandidate(
      protocolId: normId,
      displayProtocol: def.displayName,
      displayCode: row.hexcode.toUpperCase(),
      params: params,
      source: IrFinderSource.database,
      dbRemoteId: row.remoteId,
      dbLabel: row.label,
      dbBrand: _brand,
      dbModel: _model,
    );
  }

  Future<void> _sendCandidate(IrFinderCandidate c) async {
    final enc = IrProtocolRegistry.encoderFor(c.protocolId);
    final IrEncodeResult res = enc.encode(c.params);
    final int freq = res.frequencyHz;

    // Uses your existing validation in transmitRaw().
    await transmitRaw(freq, res.pattern);
  }

  Future<void> _start() async {
    if (_running) return;

    if (_delayMs < 250) {
      setState(() => _delayMs = 250);
    }

    if (_mode == IrFinderMode.database) {
      if (!_dbReady) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Database is not ready yet.')),
        );
        return;
      }
      if (_brand == null || _brand!.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Select a Brand first (Setup).')),
        );
        return;
      }

      _attempted = 0;
      _lastCandidate = null;
      _lastError = null;

      if (_dbCandidates.isEmpty) {
        await _ensureDbCandidatesLoadedIfNeeded();
      }
    } else {
      final int totalHexDigits = _totalHexDigitsForProtocol(_protocolId);
      if (totalHexDigits <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Brute-force is not available for this protocol yet.')),
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
          SnackBar(content: Text(prefix.errorMessage ?? 'Invalid prefix.')),
        );
        return;
      }

      final space = _bruteTotalSpace(totalHexDigits: totalHexDigits, prefix: prefix);
      if (space > (BigInt.from(1) << 40)) {
        final ok = await _confirmBigSearchSpace(context, space);
        if (!ok) return;
      }

      _bruteCursor = BigInt.zero;
      _attempted = 0;
      _lastCandidate = null;
      _lastError = null;
    }

    final token = ++_runToken;
    setState(() {
      _running = true;
      _startedAt = DateTime.now();
      _lastError = null;
    });

    int failures = 0;

    try {
      while (mounted && _running && token == _runToken) {
        if (_mode == IrFinderMode.database) {
          if (_attempted >= _dbMaxKeysToTest) break;
        } else {
          // Brute-force: if "all combinations" is enabled, we stop when the space is exhausted.
          final int totalHexDigits = _totalHexDigitsForProtocol(_protocolId);
          final def = _definitionFor(_protocolId);
          final prefix = _effectivePrefixConstraint(
            totalHexDigits: totalHexDigits,
            displayName: def.displayName,
          );
          if (prefix != null && !prefix.valid) break;
          final space = _bruteTotalSpace(totalHexDigits: totalHexDigits, prefix: prefix);
          if (_bruteAllCombinations) {
            if (space <= BigInt.zero) break;
            if (_bruteCursor >= space) break;
          } else {
            final BigInt effectiveMax = _clampMaxAttempts(space, _maxAttempts);
            final int effectiveMaxInt = IrBigInt.toIntClamp(effectiveMax, max: 2147483647);
            if (_attempted >= effectiveMaxInt) break;
          }
        }

        final candidate = await _nextCandidate();

        if (candidate == null) {
          if (_mode == IrFinderMode.bruteforce) {
            // No more candidates in brute-force means the space is exhausted or invalid.
            break;
          }
          // Database mode:
          // If we've run out of loaded candidates, try to load more without consuming an "attempt".
          if (_attempted >= _dbCandidates.length) {
            await _ensureDbCandidatesLoadedIfNeeded();
            if (_dbExhausted && _attempted >= _dbCandidates.length) break;
            continue;
          }
          // Otherwise, treat as a skipped row (e.g., unsupported protocol).
          setState(() => _attempted += 1);
          continue;          
        }

        try {
          await _sendCandidate(candidate);
          failures = 0;
        } catch (e) {
          failures += 1;
          _lastError = e;
          if (failures >= 5) break;
        }

        if (!mounted) break;

        setState(() {
          _lastCandidate = candidate;
          _attempted += 1;
        });

        if (_mode == IrFinderMode.database && (_attempted + 5) >= _dbCandidates.length) {
          unawaited(_ensureDbCandidatesLoadedIfNeeded());
        }

        await Future<void>.delayed(Duration(milliseconds: _delayMs));
      }
    } finally {
      if (!mounted) return;
      if (token != _runToken) return;
      setState(() {
        _running = false;
      });
    }
  }

  void _stop() {
    if (!_running) return;
    setState(() {
      _running = false;
    });
    _runToken += 1;
  }

  Future<void> _retryLast() async {
    final c = _lastCandidate;
    if (c == null) return;
    try {
      await _sendCandidate(c);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sent again.')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send: $e')),
      );
    }
  }

  void _skipOne() {
    if (!_running) return;
    setState(() {
      _attempted += 1;
    });
  }

  void _saveHitFromLast() {
    final c = _lastCandidate;
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
      _pageIndex = 2; // jump to Results
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saved to Results.')),
   );
   Haptics.selectionClick();
  }

  Future<void> _testHit(IrFinderHit h) async {
    final params = IrFinderParams.buildParamsForProtocol(h.protocolId, h.code);

    final c = IrFinderCandidate(
      protocolId: h.protocolId,
      displayProtocol: h.protocolName,
      displayCode: h.code,
      params: params,
      source: h.source,
      dbBrand: h.dbBrand,
      dbModel: h.dbModel,
      dbRemoteId: h.dbRemoteId,
      dbLabel: h.dbLabel,
    );

    try {
      await _sendCandidate(c);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sent.')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send: $e')),
      );
    }
  }

  Future<void> _copyHit(IrFinderHit h) async {
    await Clipboard.setData(
      ClipboardData(text: '${h.protocolId}:${h.code}'),
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied (protocol:code).')),
   );
   Haptics.selectionClick();
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
      _dbCandidates.clear();
      _dbOffset = 0;
      _dbExhausted = false;
    });
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
      _dbCandidates.clear();
      _dbOffset = 0;
      _dbExhausted = false;
    });
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
      effectiveMaxAttempts = _bruteAllCombinations
          ? bruteSpace
          : _clampMaxAttempts(bruteSpace, _maxAttempts);
     }

    final int maxAttemptsUi = () {
      if (_mode == IrFinderMode.database) return _dbMaxKeysToTest;
      if (bruteSpace == null) return _maxAttempts;
      final BigInt eff = effectiveMaxAttempts ?? BigInt.from(_maxAttempts);
      return IrBigInt.toIntClamp(eff, max: 2147483647);
    }();


    return Scaffold(
      appBar: AppBar(
        title: const Text('IR Signal Tester'),
        actions: [
          IconButton(
            tooltip: RemoteOrientationController.instance.flipped ? 'Orientation: flipped (tap to normal)' : 'Orientation: normal (tap to flip)',
            onPressed: () async {
              final next = !RemoteOrientationController.instance.flipped;
              await RemoteOrientationController.instance.setFlipped(next);
              setState(() {});
            },
            icon: const Icon(Icons.screen_rotation_rounded),
          ),
          IconButton(
            tooltip: 'Stop',
            onPressed: _running ? _stop : null,
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
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.tune_rounded),
            label: 'Setup',
          ),
          NavigationDestination(
            icon: Icon(Icons.play_circle_outline),
            label: 'Test',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmarks_outlined),
            label: 'Results',
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
          onChanged: _running
              ? null
              : (id) {
                  setState(() {
                    _protocolId = id;
                    _applyPrefixLimitForCurrentProtocol();
                    _bruteCursor = BigInt.zero;

                    _dbCandidates.clear();
                    _dbOffset = 0;
                    _dbExhausted = false;

                    if (_mode == IrFinderMode.database) {
                      _brand = null;
                      _model = null;
                    }
                  });
                },
        ),
        const SizedBox(height: 12),
        _ModePicker(
          mode: _mode,
          onChanged: _running
              ? null
              : (m) {
                  setState(() {
                    _mode = m;
                    _attempted = 0;
                    _lastCandidate = null;
                    _lastError = null;

                    if (_mode == IrFinderMode.database) {
                      _dbCandidates.clear();
                      _dbOffset = 0;
                      _dbExhausted = false;
                    }
                  });
                },
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _prefixCtl,
          enabled: !_running,
          inputFormatters: <TextInputFormatter>[
            if (maxPrefixDigitsEven > 0) _HexDigitLengthLimitingFormatter(maxDigits: maxPrefixDigitsEven),
          ],
          decoration: InputDecoration(
            labelText: 'Known prefix (hex bytes, optional)',
            hintText: 'A1B2, A1 B2, A1:B2, 0xA1 0xB2',
            helperText: (totalHexDigits > 0)
                ? 'Payload: $totalHexDigits hex digit(s)'
                    '${example != null ? ' · Example: $example' : ''}'
                    '${maxPrefixDigitsEven > 0 ? ' · Max prefix: $maxBytes byte(s)' : ''}'
                : (example != null ? 'Example: $example' : 'Enter any known first bytes to reduce the search space.'),
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
        if (_mode == IrFinderMode.bruteforce) ...[
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
            onMaxAttemptsAllChanged: _running ? null : _toggleBruteAll,
            onDelayChanged: _running ? null : (v) => setState(() => _delayMs = v),
            onMaxAttemptsChanged: _running ? null : (v) => _setMaxAttempts(v),
          ),
        ] else ...[
          _DbSetupCard(
            theme: theme,
            dbReady: _dbReady,
            dbInitFailed: _dbInitFailed,
            brand: _brand,
            model: _model,
            onlySelectedProtocol: _dbOnlySelectedProtocol,
            quickWinsFirst: _dbQuickWinsFirst,
            maxKeysToTest: _dbMaxKeysToTest,
            running: _running,
            onPickBrand: _pickBrand,
            onPickModel: _pickModel,
            onToggleOnlySelectedProtocol: (v) {
              setState(() {
                _dbOnlySelectedProtocol = v;
                _dbCandidates.clear();
                _dbOffset = 0;
                _dbExhausted = false;
              });
            },
            onToggleQuickWinsFirst: (v) {
              setState(() {
                _dbQuickWinsFirst = v;
                _dbCandidates.clear();
                _dbOffset = 0;
                _dbExhausted = false;
              });
            },
            onMaxKeysChanged: (v) => setState(() => _dbMaxKeysToTest = v),
            onRetryDbInit: _initDb,
          ),
        ],
        const SizedBox(height: 14),
        FilledButton.icon(
          onPressed: _running ? null : () => setState(() => _pageIndex = 1),
          icon: const Icon(Icons.arrow_forward_rounded),
          label: const Text('Continue to Test'),
        ),
      ],
    );
  }

  Widget _buildTestPage({required ThemeData theme, required int maxAttemptsUi}) {
    final bool isKaseikyo = _protocolId.trim().toLowerCase() == 'kaseikyo';
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _RunControls(
          running: _running,
          mode: _mode,
          onStart: _running ? null : _start,
          onStop: _running ? _stop : null,
        ),
        const SizedBox(height: 12),
        if (isKaseikyo) ...[
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
                      Text('Kaseikyo Vendor', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
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
                        onSelected: (_) => setState(() => _kaseikyoVendor = e.value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Custom vendor (4 hex)',
                      prefixIcon: Icon(Icons.edit_outlined),
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(text: _kaseikyoVendor),
                    onChanged: (v) => setState(() => _kaseikyoVendor = v.toUpperCase().replaceAll(RegExp(r'[^0-9A-Fa-f]'), '')),
                  ),
                ],
              ),
            ),
          ),
        ],

        _RunStatusCard(
          theme: theme,
          mode: _mode,
          running: _running,
          attempted: _attempted,
          maxAttempts: maxAttemptsUi,
          delayMs: _delayMs,
          startedAt: _startedAt,
          lastCandidate: _lastCandidate,
          lastError: _lastError,
          onRetryLast: (_running && _lastCandidate != null) ? _retryLast : null,
          onSkip: _running ? _skipOne : null,
          onSaveHit: (_lastCandidate != null) ? _saveHitFromLast : null,
        ),
        const SizedBox(height: 12),
        if (_mode == IrFinderMode.database)
          _DbPreviewCard(
            theme: theme,
            brand: _brand,
            model: _model,
            loaded: _dbCandidates.length,
            exhausted: _dbExhausted,
            loadingMore: _dbLoadingMore,
            onlySelectedProtocol: _dbOnlySelectedProtocol,
            quickWinsFirst: _dbQuickWinsFirst,
          ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: _running ? null : () => setState(() => _pageIndex = 0),
                icon: const Icon(Icons.tune_rounded),
                label: const Text('Edit Setup'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: () => setState(() => _pageIndex = 2),
                icon: const Icon(Icons.bookmarks_outlined),
                label: const Text('Results'),
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
            'No saved hits yet. In the Test page, press “Save hit” when the device responds.',
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
                    onTest: () => _testHit(_hits[i]),
                    onCopy: () => _copyHit(_hits[i]),
                    onDelete: () => setState(() => _hits.removeAt(i)),
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
          label: const Text('Back to Test'),
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
      title: const Text('Large search space'),
      content: Text(
        'This brute-force space is very large ($human possibilities). '
        'IR Finder will still respect your “Max attempts” and cooldown, but be mindful of '
        'spamming IR devices.\n\n'
        'Recommendation: use Database mode first, and/or enter known prefix bytes to reduce the space.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: const Text('Cancel'),
        ),
        FilledButton.tonal(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: const Text('Proceed'),
        ),
      ],
    ),
  ).then((v) => v ?? false);
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
    final String modeLabel = mode == IrFinderMode.bruteforce ? 'Brute-force' : 'Database-assisted';

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.info_outline, color: theme.colorScheme.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Protocol: $protocolName',
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
            ]),
            const SizedBox(height: 10),
            Text(
              protocolDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.78),
              ),
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
    'samsung36',
    'sharp',
    'sony12',
    'sony15',
    'sony20',
    'thomson7',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final items = _knownProtocolIds.map((id) {
      final def = IrProtocolRegistry.encoderFor(id).definition;
      return DropdownMenuItem<String>(
        value: id,
        child: Text('${def.displayName} (${def.id})'),
      );
    }).toList(growable: false);

    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'IR protocol',
        helperText: 'Controls encoding and therefore the search space.',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.waves_outlined),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: protocolId,
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
      segments: const <ButtonSegment<IrFinderMode>>[
        ButtonSegment(
          value: IrFinderMode.bruteforce,
          label: Text('Brute-force'),
          icon: Icon(Icons.shuffle_rounded),
        ),
        ButtonSegment(
          value: IrFinderMode.database,
          label: Text('Database'),
          icon: Icon(Icons.storage_rounded),
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
        'Normalized prefix: —',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
        ),
      );
    }

    if (!p.ok) {
      return Text(
        'Normalized prefix: —',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
        ),
      );
    }

    final norm = IrPrefix.formatBytesAsHex(p.bytes);

    return Row(
      children: [
        Text(
          'Normalized prefix:',
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
                  'Brute-force is not configured for this protocol yet.',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final String spaceText = bruteSpace == null ? '—' : IrBigInt.formatHuman(bruteSpace!);
    const int sliderCap = 2000000; // slider remains usable; text field can exceed this.
    final BigInt space = bruteSpace ?? BigInt.zero;
    final int sliderMax = (space <= BigInt.zero)
        ? 1
        : IrBigInt.toIntClamp(space, max: sliderCap).clamp(1, sliderCap);
    final int sliderValue = maxAttempts.clamp(1, sliderMax);
    final int? divisions = (sliderMax <= 1)
        ? null
        : (sliderMax <= 400 ? (sliderMax - 1) : 200);
    final BigInt eff = effectiveMaxAttempts ?? BigInt.from(maxAttempts);
    final String effText = maxAttemptsAll
        ? 'All ($spaceText)'
        : IrBigInt.formatHuman(eff);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.shield_outlined, color: theme.colorScheme.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text('Test controls', style: theme.textTheme.titleMedium),
              ),
            ]),
            const SizedBox(height: 10),
            Text(
              'Payload length: $totalHexDigits hex digit(s).',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.78),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Search space: $spaceText possibilities (after prefix constraints).',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.78),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Cooldown (ms)',
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
              'Max attempts (per run)',
              style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: maxAttemptsAll,
              onChanged: onMaxAttemptsAllChanged,
              title: const Text('Test all combinations'),
              subtitle: Text(
                'Runs until the search space is exhausted. Effective limit: $effText',
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
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        labelText: 'Attempts',
                        helperText: 'Slider range: 1–$sliderMax (type any number for larger values)',
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
                    child: Text('Max\n$sliderMax', textAlign: TextAlign.center),
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
                'Effective limit this run: $effText',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ] else ...[
              const SizedBox(height: 6),
              Text(
                'Effective limit this run: $effText',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
            const SizedBox(height: 6),
            Text(
              'Tip: Use Database mode first; brute-force is best with a known prefix (e.g., first 1–4 bytes).',
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
                child: dbInitFailed
                    ? const Icon(Icons.error_outline)
                    : const CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  dbInitFailed ? 'Database initialization failed.' : 'Preparing local IR code database…',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              if (dbInitFailed)
                FilledButton.tonal(
                  onPressed: running ? null : onRetryDbInit,
                  child: const Text('Retry'),
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
            Row(children: [
              Icon(Icons.storage_rounded, color: cs.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text('Database-assisted search', style: theme.textTheme.titleMedium),
              ),
            ]),
            const SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.business_outlined),
              title: const Text('Brand'),
              subtitle: Text(brand ?? 'Select a brand'),
              trailing: const Icon(Icons.chevron_right),
              onTap: running ? null : onPickBrand,
            ),
            const Divider(height: 0),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.memory_outlined),
              title: const Text('Model (optional)'),
              subtitle: Text(model ?? (brand == null ? 'Select a brand first' : 'Select a model (recommended)')),
              trailing: const Icon(Icons.chevron_right),
              onTap: (running || brand == null) ? null : onPickModel,
            ),
            const SizedBox(height: 10),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: onlySelectedProtocol,
              onChanged: running ? null : onToggleOnlySelectedProtocol,
              title: const Text('Only selected protocol'),
              subtitle: const Text('Filters keys to the selected protocol. Disable to browse all protocols.'),
            ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: quickWinsFirst,
              onChanged: running ? null : onToggleQuickWinsFirst,
              title: const Text('Quick wins first'),
              subtitle: const Text('Prioritizes POWER/MUTE/VOL/CH style keys before deeper keys.'),
            ),
            const SizedBox(height: 10),
            Text(
              'Max keys to test (per run)',
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

class _RunControls extends StatelessWidget {
  final bool running;
  final IrFinderMode mode;
  final Future<void> Function()? onStart;
  final VoidCallback? onStop;

  const _RunControls({
    required this.running,
    required this.mode,
    required this.onStart,
    required this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: running ? null : () => onStart?.call(),
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Start'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FilledButton.tonalIcon(
            onPressed: running ? onStop : null,
            icon: const Icon(Icons.stop_rounded),
            label: const Text('Stop'),
          ),
        ),
      ],
    );
  }
}

class _RunStatusCard extends StatelessWidget {
  final ThemeData theme;
  final IrFinderMode mode;
  final bool running;
  final int attempted;
  final int maxAttempts;
  final int delayMs;
  final DateTime? startedAt;
  final IrFinderCandidate? lastCandidate;
  final Object? lastError;
  final Future<void> Function()? onRetryLast;
  final VoidCallback? onSkip;
  final VoidCallback? onSaveHit;

  const _RunStatusCard({
    required this.theme,
    required this.mode,
    required this.running,
    required this.attempted,
    required this.maxAttempts,
    required this.delayMs,
    required this.startedAt,
    required this.lastCandidate,
    required this.lastError,
    required this.onRetryLast,
    required this.onSkip,
    required this.onSaveHit,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;
    final progress = maxAttempts <= 0 ? 0.0 : (attempted / maxAttempts).clamp(0.0, 1.0);
    final elapsed = (startedAt == null) ? null : DateTime.now().difference(startedAt!);

    String etaText = '—';
    if (elapsed != null && attempted > 0 && maxAttempts > attempted) {
      final per = elapsed.inMilliseconds / attempted;
      final remaining = (maxAttempts - attempted) * per;
      etaText = _formatEta(Duration(milliseconds: remaining.round()));
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(running ? Icons.bolt_rounded : Icons.pause_circle_outline, color: cs.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  running ? 'Testing…' : 'Idle',
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
            ]),
            const SizedBox(height: 10),
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 8,
              children: [
                _MiniChip(label: 'Cooldown', value: '${delayMs}ms'),
                _MiniChip(label: 'ETA', value: etaText),
                _MiniChip(
                  label: 'Mode',
                  value: mode == IrFinderMode.bruteforce ? 'Brute-force' : 'Database',
                ),
              ],
            ),
            const SizedBox(height: 12),
            _LastAttemptBox(theme: theme, candidate: lastCandidate, error: lastError),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: onRetryLast == null ? null : () => onRetryLast!.call(),
                    icon: const Icon(Icons.replay_rounded),
                    label: const Text('Retry'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: onSkip,
                    icon: const Icon(Icons.skip_next_rounded),
                    label: const Text('Skip'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: onSaveHit,
              icon: const Icon(Icons.bookmark_add_outlined),
              label: const Text('Save hit'),
            ),
          ],
        ),
      ),
    );
  }

  static String _formatEta(Duration d) {
    final int s = d.inSeconds;
    if (s < 60) return '${s}s';
    final int m = s ~/ 60;
    final int rs = s % 60;
    if (m < 60) return '${m}m ${rs}s';
    final int h = m ~/ 60;
    final int rm = m % 60;
    return '${h}h ${rm}m';
  }
}

class _LastAttemptBox extends StatelessWidget {
  final ThemeData theme;
  final IrFinderCandidate? candidate;
  final Object? error;

  const _LastAttemptBox({
    required this.theme,
    required this.candidate,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;
    final c = candidate;

    final String title =
        (c == null) ? 'Last attempted code: —' : 'Last attempted code: ${c.displayProtocol} ${c.displayCode}';

    final String subtitle = (c == null)
        ? 'Start testing to see the last attempted code.'
        : (c.source == IrFinderSource.database)
            ? 'From DB: ${c.dbBrand ?? '—'}'
                '${(c.dbModel != null && c.dbModel!.trim().isNotEmpty) ? ' · ${c.dbModel}' : ''}'
                '${(c.dbLabel != null && c.dbLabel!.trim().isNotEmpty) ? ' · Key: ${c.dbLabel}' : ''}'
                '${(c.dbRemoteId != null) ? ' · Remote #${c.dbRemoteId}' : ''}'
            : 'From brute-force (generated by protocol encoder).';

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
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: hasError ? cs.onErrorContainer : cs.onSurface,
            ),
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
              'Send error: $error',
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

class _DbPreviewCard extends StatelessWidget {
  final ThemeData theme;
  final String? brand;
  final String? model;
  final int loaded;
  final bool exhausted;
  final bool loadingMore;
  final bool onlySelectedProtocol;
  final bool quickWinsFirst;

  const _DbPreviewCard({
    required this.theme,
    required this.brand,
    required this.model,
    required this.loaded,
    required this.exhausted,
    required this.loadingMore,
    required this.onlySelectedProtocol,
    required this.quickWinsFirst,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.list_alt_outlined, color: cs.primary),
              const SizedBox(width: 10),
              Expanded(child: Text('DB candidate queue', style: theme.textTheme.titleMedium)),
              if (loadingMore)
                const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            ]),
            const SizedBox(height: 10),
            Text(
              'Brand: ${brand ?? '—'}'
              '${(model != null && model!.trim().isNotEmpty) ? ' · Model: $model' : ''}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.78),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Loaded keys: $loaded'
              '${exhausted ? ' (exhausted)' : ''}'
              ' · Protocol filter: ${onlySelectedProtocol ? 'ON' : 'OFF'}'
              ' · Quick wins: ${quickWinsFirst ? 'ON' : 'OFF'}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HitTile extends StatelessWidget {
  final IrFinderHit hit;
  final VoidCallback onTest;
  final VoidCallback onCopy;
  final VoidCallback onDelete;

  const _HitTile({
    required this.hit,
    required this.onTest,
    required this.onCopy,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final subtitle = <String>[
      'Source: ${hit.source == IrFinderSource.database ? 'Database' : 'Brute-force'}',
      if (hit.dbBrand != null && hit.dbBrand!.trim().isNotEmpty) 'Brand: ${hit.dbBrand}',
      if (hit.dbModel != null && hit.dbModel!.trim().isNotEmpty) 'Model: ${hit.dbModel}',
      if (hit.dbLabel != null && hit.dbLabel!.trim().isNotEmpty) 'Key: ${hit.dbLabel}',
      if (hit.dbRemoteId != null) 'Remote #${hit.dbRemoteId}',
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
            tooltip: 'Test',
            onPressed: onTest,
            icon: const Icon(Icons.play_arrow_rounded),
          ),
          IconButton(
            tooltip: 'Copy',
            onPressed: onCopy,
            icon: const Icon(Icons.copy_rounded),
          ),
          IconButton(
            tooltip: 'Delete',
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
      'Note: Direct “Add to Remote/Button” integration depends on your Remote/IRButton editing flow. '
      'For now, Results support “Test” and “Copy” so you can paste into your existing Remote editor. '
      'When you share your Remote editor files, this screen can be extended to insert hits directly.',
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
  final String? protocolId; // was String
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

class _DbPickerSheetState extends State<_DbPickerSheet> {
  final TextEditingController _searchCtl = TextEditingController();
  final ScrollController _scrollCtl = ScrollController();

  bool _loading = false;
  bool _exhausted = false;
  int _offset = 0;
  final List<String> _items = <String>[];

  Timer? _debounce; // NEW

  @override
  void initState() {
    super.initState();
    _searchCtl.addListener(_onSearch);
    _scrollCtl.addListener(_onScroll);
    _load(reset: true);
  }

  @override
  void dispose() {
    _debounce?.cancel(); // NEW
    _searchCtl.removeListener(_onSearch);
    _scrollCtl.removeListener(_onScroll);
    _searchCtl.dispose();
    _scrollCtl.dispose();
    super.dispose();
  }

  void _onSearch() {
    // Debounce to avoid hammering SQLite on each keystroke.
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
          protocolId: widget.protocolId, // now nullable
          limit: 60,
          offset: _offset,
        );
      } else {
        rows = await widget.db.listModelsDistinct(
          brand: widget.brand!,
          search: q.isEmpty ? null : q,
          protocolId: widget.protocolId, // now nullable
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
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = widget.kind == _DbPickerKind.brand ? 'Select brand' : 'Select model';
    final hint = widget.kind == _DbPickerKind.brand ? 'Search brands…' : 'Search models…';

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
            Row(children: [
              Expanded(child: Text(title, style: theme.textTheme.titleLarge)),
              IconButton(
                tooltip: 'Close',
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close_rounded),
              ),
            ]),
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
