import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irblaster_controller/ir_finder/irblaster_db.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/universal_power/power_code_repository.dart';
import 'package:irblaster_controller/universal_power/universal_power_controller.dart';
import 'package:irblaster_controller/universal_power/universal_power_prefs.dart';
import 'package:irblaster_controller/utils/ir_transmitter_platform.dart';

class UniversalPowerScreen extends StatefulWidget {
  const UniversalPowerScreen({super.key});

  @override
  State<UniversalPowerScreen> createState() => _UniversalPowerScreenState();
}

class _UniversalPowerScreenState extends State<UniversalPowerScreen>
    with WidgetsBindingObserver {
  final IrBlasterDb _db = IrBlasterDb.instance;
  late final PowerCodeRepository _repo = PowerCodeRepository(db: _db);
  final UniversalPowerController _controller = UniversalPowerController();

  StreamSubscription<IrTransmitterCapabilities>? _capsSub;
  IrTransmitterCapabilities? _caps;

  bool _dbReady = false;
  bool _dbInitFailed = false;

  bool _consentLoaded = false;
  bool _consented = false;
  bool _consentChecked = false;

  String? _brand;
  String? _model;
  bool _loop = false;
  bool _broadenSearch = false;
  int _delayMs = 800;
  int _depth = 2;

  bool _pausedByLifecycle = false;
  int _pageIndex = 0;

  bool _lastRunning = false;
  UniversalPowerLastSent? _lastSent;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller.addListener(_onControllerChange);
    _initDb();
    _loadConsent();
    _loadLastSent();
    _capsSub = IrTransmitterPlatform.capabilitiesEvents().listen((caps) {
      if (!mounted) return;
      setState(() => _caps = caps);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _capsSub?.cancel();
    _capsSub = null;
    _controller.removeListener(_onControllerChange);
    _controller.stop();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_controller.running) return;
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      if (_controller.paused) return;
      _controller.pause();
      _pausedByLifecycle = true;
      setState(() {});
    } else if (state == AppLifecycleState.resumed && _pausedByLifecycle) {
      _pausedByLifecycle = false;
      setState(() {});
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

  Future<void> _loadConsent() async {
    final v = await UniversalPowerPrefs.hasConsent();
    if (!mounted) return;
    setState(() {
      _consented = v;
      _consentLoaded = true;
      _consentChecked = v;
    });
  }

  Future<void> _loadLastSent() async {
    final v = await UniversalPowerPrefs.loadLastSent();
    if (!mounted) return;
    setState(() => _lastSent = v);
  }

  void _onControllerChange() {
    if (!mounted) return;
    final running = _controller.running;
    if (_lastRunning && !running) {
      final last = _controller.lastSent;
      if (last != null) {
        UniversalPowerPrefs.saveLastSent(
          label: last.label,
          protocolId: last.protocolId,
          hexCode: last.hexCode,
        );
        _lastSent = UniversalPowerLastSent(
          label: last.label,
          protocolId: last.protocolId,
          hexCode: last.hexCode,
          sentAt: DateTime.now(),
        );
      }
    }
    _lastRunning = running;
    setState(() {});
  }

  bool _hasTransmitter() {
    final caps = _caps;
    if (caps == null) return true;
    return caps.hasInternal || caps.usbReady || caps.hasAudio;
  }

  Future<void> _startRun() async {
    if (!_dbReady) return;
    if (!_hasTransmitter()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No IR transmitter available.')),
      );
      return;
    }

    final String? brand = _brand?.trim();
    final codes = (brand == null || brand.isEmpty)
        ? await _repo.loadAllPowerCodes(
            broadenSearch: _broadenSearch,
            maxCodes: 1200,
            depth: _depth,
          )
        : await _repo.loadPowerCodes(
            brand: brand,
            model: _model?.trim(),
            broadenSearch: _broadenSearch,
            maxCodes: 600,
            depth: _depth,
          );

    if (!mounted) return;
    if (codes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No power codes found. Try broadening the search.')),
      );
      return;
    }

    final ok = await _controller.start(
      queue: codes,
      delayMs: _delayMs,
      loop: _loop,
    );

    if (!mounted) return;
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to start.')),
      );
      return;
    }

    setState(() => _pageIndex = 1);
    await Haptics.selectionClick();
  }

  Future<void> _stopRun() async {
    await _controller.stop();
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _pickBrand() async {
    if (!_dbReady) return;
    final picked = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _PowerDbPickerSheet.brand(db: _db),
    );
    if (!mounted) return;
    if (picked == null) return;
    setState(() {
      _brand = picked;
      _model = null;
    });
  }

  Future<void> _pickModel() async {
    final brand = _brand;
    if (!_dbReady || brand == null) return;
    final picked = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _PowerDbPickerSheet.model(db: _db, brand: brand),
    );
    if (!mounted) return;
    if (picked == null) return;
    setState(() => _model = picked);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!_consentLoaded) {
      return Scaffold(
        appBar: AppBar(title: const Text('Universal Power')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (!_consented) {
      return Scaffold(
        appBar: AppBar(title: const Text('Universal Power')),
        body: _buildConsent(theme),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Universal Power'),
        actions: [
          IconButton(
            tooltip: 'Stop',
            onPressed: _controller.running ? _stopRun : null,
            icon: const Icon(Icons.stop_circle_outlined),
          ),
        ],
      ),
      body: IndexedStack(
        index: _pageIndex,
        children: [
          _buildSetup(theme),
          _buildRun(theme),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _pageIndex,
        onDestinationSelected: (i) {
          if (_controller.running && i == 0) return;
          setState(() => _pageIndex = i);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.tune_rounded), label: 'Setup'),
          NavigationDestination(icon: Icon(Icons.power_settings_new), label: 'Run'),
        ],
      ),
    );
  }

  Widget _buildConsent(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, color: theme.colorScheme.error),
                    const SizedBox(width: 8),
                    Text('Use responsibly', style: theme.textTheme.titleLarge),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Universal Power cycles IR power codes. Use only on devices you own or control. Stop as soon as the device responds.',
                ),
                const SizedBox(height: 12),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _consentChecked,
                  onChanged: (v) => setState(() => _consentChecked = v ?? false),
                  title: const Text('I own or control the device'),
                ),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: _consentChecked
                      ? () async {
                          await UniversalPowerPrefs.setConsent(true);
                          if (!mounted) return;
                          setState(() => _consented = true);
                        }
                      : null,
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSetup(ThemeData theme) {
    final cs = theme.colorScheme;
    final last = _lastSent;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.power_settings_new_rounded, color: cs.primary),
                    const SizedBox(width: 10),
                    Text('Universal Power', style: theme.textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('Cycles power codes for your selected brand. Stop as soon as the device responds.'),
                if (last != null) ...[
                  const SizedBox(height: 10),
                  Text('Last sent: ${last.label} · ${last.protocolId.toUpperCase()} ${last.hexCode}',
                      style: theme.textTheme.bodySmall),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (!_dbReady)
          Card(
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: _dbInitFailed
                        ? const Icon(Icons.error_outline)
                        : const CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _dbInitFailed ? 'Database initialization failed.' : 'Preparing local IR code database…',
                    ),
                  ),
                  if (_dbInitFailed)
                    FilledButton.tonal(
                      onPressed: _initDb,
                      child: const Text('Retry'),
                    ),
                ],
              ),
            ),
          ),
        if (!_dbReady) const SizedBox(height: 12),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.business_outlined),
          title: const Text('Brand'),
          subtitle: Text(_brand ?? 'All brands (no filter)'),
          trailing: Wrap(
            spacing: 8,
            children: [
              if (_brand != null)
                IconButton(
                  tooltip: 'Clear brand filter',
                  onPressed: () => setState(() {
                    _brand = null;
                    _model = null;
                  }),
                  icon: const Icon(Icons.close_rounded),
                ),
              const Icon(Icons.chevron_right),
            ],
          ),
          onTap: _dbReady ? _pickBrand : null,
        ),
        const Divider(height: 0),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.memory_outlined),
          title: const Text('Model (optional)'),
          subtitle: Text(_model ?? (_brand == null ? 'Select a brand first' : 'Select a model (recommended)')),
          trailing: const Icon(Icons.chevron_right),
          onTap: (_dbReady && _brand != null) ? _pickModel : null,
        ),
        const SizedBox(height: 12),
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          value: _broadenSearch,
          onChanged: (v) => setState(() => _broadenSearch = v),
          title: const Text('Broaden search if needed'),
          subtitle: const Text('If no power labels are found, include other keys.'),
        ),
        const SizedBox(height: 6),
        Text(
          'Additional patterns depth',
          style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        Slider(
          value: _depth.toDouble().clamp(1, 4),
          min: 1,
          max: 4,
          divisions: 3,
          label: _depth.toString(),
          onChanged: (v) => setState(() => _depth = v.round()),
        ),
        Text(
          _depth == 1
              ? 'Priority only: POWER/OFF'
              : _depth == 2
                  ? 'Include POWER aliases'
                  : _depth == 3
                      ? 'Include secondary power labels'
                      : 'Include all labels (lowest priority)',
          style: theme.textTheme.bodySmall,
        ),
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          value: _loop,
          onChanged: (v) => setState(() => _loop = v),
          title: const Text('Loop until stopped'),
          subtitle: const Text('Keeps cycling the queue until you stop it.'),
        ),
        const SizedBox(height: 10),
        Text(
          'Delay between codes',
          style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        Slider(
          value: _delayMs.toDouble().clamp(400, 4000),
          min: 400,
          max: 4000,
          divisions: 18,
          label: '${_delayMs}ms',
          onChanged: (v) => setState(() => _delayMs = v.round()),
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: _controller.running ? null : _startRun,
          icon: const Icon(Icons.play_arrow_rounded),
          label: const Text('Start Universal Power'),
        ),
      ],
    );
  }

  Widget _buildRun(ThemeData theme) {
    final running = _controller.running;
    final paused = _controller.paused;
    final last = _controller.lastSent;
    final queueSize = _controller.queue.length;
    final index = _controller.index;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.power_settings_new_rounded, color: theme.colorScheme.primary),
                    const SizedBox(width: 10),
                    Text('Run status', style: theme.textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 10),
                Text(running
                    ? (paused ? 'Paused' : 'Running')
                    : 'Stopped'),
                const SizedBox(height: 6),
                if (queueSize > 0)
                  Text('Progress: ${index.clamp(0, queueSize)}/$queueSize'),
                if (_pausedByLifecycle && paused)
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text('Paused because the app was backgrounded.'),
                  ),
                if (last != null) ...[
                  const SizedBox(height: 8),
                  Text('Last sent: ${last.label} · ${last.protocolId.toUpperCase()} ${last.hexCode}'),
                ],
                if (_controller.lastError != null) ...[
                  const SizedBox(height: 8),
                  Text('Last error: ${_controller.lastError}'),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: running
                    ? (paused ? _controller.resume : _controller.pause)
                    : null,
                icon: Icon(paused ? Icons.play_arrow_rounded : Icons.pause_rounded),
                label: Text(paused ? 'Resume' : 'Pause'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: running ? _stopRun : () => setState(() => _pageIndex = 0),
                icon: Icon(running ? Icons.stop_rounded : Icons.tune_rounded),
                label: Text(running ? 'Stop' : 'Edit Setup'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        FilledButton.tonalIcon(
          onPressed: (running && paused) ? () async { await _controller.step(); await Haptics.selectionClick(); } : null,
          icon: const Icon(Icons.skip_next_rounded),
          label: const Text('Send one code'),
        ),
        const SizedBox(height: 8),
        Text(
          'Stop as soon as the device responds.',
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _PowerDbPickerSheet extends StatefulWidget {
  final IrBlasterDb db;
  final String? brandName;
  final _PowerDbPickerKind kind;

  const _PowerDbPickerSheet._({
    required this.db,
    required this.kind,
    this.brandName,
  });

  static Widget brand({required IrBlasterDb db}) {
    return _PowerDbPickerSheet._(db: db, kind: _PowerDbPickerKind.brand);
  }

  static Widget model({required IrBlasterDb db, required String brand}) {
    return _PowerDbPickerSheet._(db: db, kind: _PowerDbPickerKind.model, brandName: brand);
  }

  @override
  State<_PowerDbPickerSheet> createState() => _PowerDbPickerSheetState();
}

enum _PowerDbPickerKind { brand, model }

class _PowerDbPickerSheetState extends State<_PowerDbPickerSheet> {
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

      if (widget.kind == _PowerDbPickerKind.brand) {
        rows = await widget.db.listBrands(
          search: q.isEmpty ? null : q,
          limit: 60,
          offset: _offset,
        );
      } else {
        rows = await widget.db.listModelsDistinct(
          brand: widget.brandName!,
          search: q.isEmpty ? null : q,
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
    final title = widget.kind == _PowerDbPickerKind.brand ? 'Select brand' : 'Select model';
    final hint = widget.kind == _PowerDbPickerKind.brand ? 'Search brands…' : 'Search models…';

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
                  tooltip: 'Close',
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
