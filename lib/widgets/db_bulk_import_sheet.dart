import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/ir_finder/irblaster_db.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/utils/db_button_import.dart';
import 'package:irblaster_controller/utils/remote.dart';

enum _DbPreset { all, power, volume, channel, navigation }

class DbBulkImportSheet extends StatefulWidget {
  final List<IRButton> existingButtons;
  const DbBulkImportSheet({super.key, required this.existingButtons});

  @override
  State<DbBulkImportSheet> createState() => _DbBulkImportSheetState();
}

class _DbBulkImportSheetState extends State<DbBulkImportSheet> {
  final TextEditingController _dbSearchCtl = TextEditingController();
  final ScrollController _dbScrollCtl = ScrollController();
  Timer? _dbSearchDebounce;

  bool _dbInit = false;
  bool _dbMetaLoading = false;
  bool _dbLoading = false;
  bool _dbExhausted = false;
  int _dbOffset = 0;
  int _dbLoadGeneration = 0;

  String? _dbBrand;
  String? _dbModel;
  String? _dbProtocol;
  List<String> _dbProtocols = <String>[];
  final List<IrDbKeyCandidate> _dbRows = <IrDbKeyCandidate>[];

  final Set<String> _selectedKeys = <String>{};
  bool _skipDuplicates = true;

  _DbPreset _dbPreset = _DbPreset.all;
  bool _filtersExpanded = true;
  final ExpansibleController _filtersTileController = ExpansibleController();

  void _setFiltersExpanded(bool expanded) {
    if (expanded == _filtersExpanded) return;
    setState(() => _filtersExpanded = expanded);
    if (expanded) {
      _filtersTileController.expand();
    } else {
      _filtersTileController.collapse();
    }
  }

  @override
  void initState() {
    super.initState();
    _dbScrollCtl.addListener(_onDbScroll);
  }

  @override
  void dispose() {
    _dbSearchDebounce?.cancel();
    _dbSearchCtl.dispose();
    _dbScrollCtl.dispose();
    super.dispose();
  }

  Future<void> _dbEnsureReady() async {
    if (_dbInit) return;
    setState(() => _dbMetaLoading = true);
    try {
      await IrBlasterDb.instance.ensureInitialized();
      _dbInit = true;
    } finally {
      if (mounted) setState(() => _dbMetaLoading = false);
    }
  }

  void _onDbScroll() {
    if (_dbLoading || _dbExhausted) return;
    if (!_dbScrollCtl.hasClients) return;

    if (_dbScrollCtl.position.pixels >=
        _dbScrollCtl.position.maxScrollExtent - 240) {
      _dbReloadKeys(reset: false);
    }
  }

  String _dbPresetToQuery(_DbPreset preset) {
    switch (preset) {
      case _DbPreset.all:
        return '';
      case _DbPreset.power:
        return 'power';
      case _DbPreset.volume:
        return 'vol';
      case _DbPreset.channel:
        return 'ch';
      case _DbPreset.navigation:
        return 'menu';
    }
  }

  String _dbPresetTitle(_DbPreset preset) {
    switch (preset) {
      case _DbPreset.all:
        return context.l10n.all;
      case _DbPreset.power:
        return context.l10n.presetPower;
      case _DbPreset.volume:
        return context.l10n.presetVolume;
      case _DbPreset.channel:
        return context.l10n.presetChannel;
      case _DbPreset.navigation:
        return context.l10n.presetNavigation;
    }
  }

  IconData _dbPresetIcon(_DbPreset preset) {
    switch (preset) {
      case _DbPreset.all:
        return Icons.list_alt_rounded;
      case _DbPreset.power:
        return Icons.power_settings_new_rounded;
      case _DbPreset.volume:
        return Icons.volume_up_rounded;
      case _DbPreset.channel:
        return Icons.live_tv_rounded;
      case _DbPreset.navigation:
        return Icons.gamepad_rounded;
    }
  }

  String _dbEffectiveSearch() {
    final manual = _dbSearchCtl.text.trim();
    if (manual.isNotEmpty) return manual;
    return _dbPresetToQuery(_dbPreset);
  }

  Future<void> _dbLoadProtocolsForSelection() async {
    if (_dbBrand == null || _dbModel == null) return;

    setState(() {
      _dbMetaLoading = true;
      _dbProtocols = <String>[];
      _dbProtocol = null;
    });

    try {
      await _dbEnsureReady();
      final prots = await IrBlasterDb.instance.listProtocolsFor(
        brand: _dbBrand!,
        model: _dbModel!,
      );
      setState(() {
        _dbProtocols = prots;
        _dbProtocol = prots.isNotEmpty ? prots.first : null;
      });
    } catch (e) {
      if (mounted) _showSnack(context.l10n.failedToLoadProtocols(e.toString()));
    } finally {
      if (mounted) setState(() => _dbMetaLoading = false);
    }
  }

  Future<void> _dbReloadKeys({required bool reset}) async {
    if (_dbBrand == null || _dbModel == null) return;
    if (_dbProtocol == null || _dbProtocol!.trim().isEmpty) return;
    if (!reset && (_dbLoading || _dbExhausted)) return;

    final int requestGeneration =
        reset ? ++_dbLoadGeneration : _dbLoadGeneration;
    if (reset) {
      setState(() {
        _dbOffset = 0;
        _dbRows.clear();
        _dbExhausted = false;
        _selectedKeys.clear();
      });
    }

    setState(() => _dbLoading = true);

    try {
      await _dbEnsureReady();
      final search = _dbEffectiveSearch();
      final offset = reset ? 0 : _dbOffset;
      final rows = await IrBlasterDb.instance.fetchCandidateKeys(
        brand: _dbBrand!,
        model: _dbModel!,
        selectedProtocolId: _dbProtocol,
        quickWinsFirst: true,
        hexPrefixUpper: null,
        search: search,
        limit: 80,
        offset: offset,
      );
      if (!mounted || requestGeneration != _dbLoadGeneration) return;
      setState(() {
        _dbRows.addAll(rows);
        _dbOffset = offset + rows.length;
        if (rows.isEmpty) _dbExhausted = true;
      });
    } catch (e) {
      if (mounted && requestGeneration == _dbLoadGeneration) {
        _showSnack(context.l10n.failedToLoadDatabaseKeys(e.toString()));
      }
    } finally {
      if (mounted && requestGeneration == _dbLoadGeneration) {
        setState(() => _dbLoading = false);
      }
    }
  }

  void _queueDbSearchReload() {
    _dbSearchDebounce?.cancel();
    _dbSearchDebounce = Timer(const Duration(milliseconds: 280), () {
      if (!mounted) return;
      _dbReloadKeys(reset: true);
    });
  }

  void _runDbSearchNow() {
    _dbSearchDebounce?.cancel();
    FocusManager.instance.primaryFocus?.unfocus();
    if (_dbBrand == null || _dbModel == null || _dbProtocol == null) return;
    _dbReloadKeys(reset: true);
  }

  Future<void> _dbSelectBrand() async {
    await _dbEnsureReady();
    if (!mounted) return;
    final b = await _pickBrand(context);
    if (!mounted) return;
    if (b == null) return;

    setState(() {
      _dbBrand = b;
      _dbModel = null;
      _dbProtocols = <String>[];
      _dbProtocol = null;

      _dbSearchCtl.clear();
      _dbRows.clear();
      _dbOffset = 0;
      _dbExhausted = false;
      _selectedKeys.clear();

      _dbPreset = _DbPreset.all;
    });
    _setFiltersExpanded(true);
  }

  Future<void> _dbSelectModel() async {
    await _dbEnsureReady();
    if (_dbBrand == null) return;
    if (!mounted) return;

    final m = await _pickModel(context, brand: _dbBrand!);
    if (!mounted) return;
    if (m == null) return;

    setState(() {
      _dbModel = m;
      _dbProtocols = <String>[];
      _dbProtocol = null;

      _dbSearchCtl.clear();
      _dbRows.clear();
      _dbOffset = 0;
      _dbExhausted = false;
      _selectedKeys.clear();

      _dbPreset = _DbPreset.all;
    });
    _setFiltersExpanded(false);

    await _dbLoadProtocolsForSelection();
    await _dbReloadKeys(reset: true);
  }

  Future<void> _dbSelectProtocol(String p) async {
    if (_dbBrand == null || _dbModel == null) return;
    setState(() {
      _dbProtocol = p;
      _dbRows.clear();
      _dbOffset = 0;
      _dbExhausted = false;
      _selectedKeys.clear();
    });
    _setFiltersExpanded(false);
    await _dbReloadKeys(reset: true);
  }

  Future<void> _dbSetPreset(_DbPreset preset) async {
    if (_dbBrand == null || _dbModel == null) return;
    if (_dbProtocol == null || _dbProtocol!.trim().isEmpty) return;

    setState(() {
      _dbPreset = preset;
      _dbRows.clear();
      _dbOffset = 0;
      _dbExhausted = false;
      _selectedKeys.clear();
    });

    await _dbReloadKeys(reset: true);
  }

  Future<String?> _pickBrand(BuildContext context) async {
    await IrBlasterDb.instance.ensureInitialized();
    if (!context.mounted) return null;

    String? selected;
    int offset = 0;
    final items = <String>[];
    bool alive = true;
    final ctl = TextEditingController();
    final scrollCtl = ScrollController();
    Timer? searchDebounce;
    bool attachedScrollListener = false;
    bool loading = false;
    bool exhausted = false;
    int generation = 0;

    Future<void> load(StateSetter setModal, {required bool reset}) async {
      if (!alive) return;
      if (!reset && loading) return;

      final requestGeneration = reset ? ++generation : generation;
      setModal(() => loading = true);

      try {
        if (reset) {
          offset = 0;
          exhausted = false;
          items.clear();
          if (scrollCtl.hasClients) scrollCtl.jumpTo(0);
        }

        final next = await IrBlasterDb.instance.listBrands(
          search: ctl.text.trim(),
          limit: 60,
          offset: offset,
        );

        if (!alive || requestGeneration != generation) return;

        items.addAll(next);
        offset += next.length;
        if (next.isEmpty) exhausted = true;

        setModal(() {});
      } finally {
        if (alive && requestGeneration == generation) {
          setModal(() => loading = false);
        }
      }
    }

    void queueSearch(StateSetter setModal) {
      searchDebounce?.cancel();
      searchDebounce = Timer(const Duration(milliseconds: 220), () {
        if (!alive) return;
        load(setModal, reset: true);
      });
    }

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        void onScroll(StateSetter setModal) {
          if (loading || exhausted) return;
          if (scrollCtl.position.pixels >=
              scrollCtl.position.maxScrollExtent - 240) {
            load(setModal, reset: false);
          }
        }

        return StatefulBuilder(
          builder: (ctx2, setModal) {
            if (!attachedScrollListener) {
              attachedScrollListener = true;
              scrollCtl.addListener(() => onScroll(setModal));
              load(setModal, reset: true);
            }

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(context.l10n.selectBrand,
                              style: Theme.of(ctx2).textTheme.titleLarge),
                        ),
                        IconButton(
                          onPressed: () {
                            alive = false;
                            Navigator.of(ctx2).pop();
                          },
                          icon: const Icon(Icons.close_rounded),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: ctl,
                      decoration: InputDecoration(
                        hintText: context.l10n.searchBrand,
                        prefixIcon: Icon(Icons.search_rounded),
                        border: OutlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.search,
                      onChanged: (_) => queueSearch(setModal),
                      onSubmitted: (_) {
                        searchDebounce?.cancel();
                        FocusManager.instance.primaryFocus?.unfocus();
                        load(setModal, reset: true);
                      },
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                        controller: scrollCtl,
                        itemCount: items.length + (loading ? 1 : 0),
                        separatorBuilder: (_, __) => const Divider(height: 0),
                        itemBuilder: (ctx3, i) {
                          if (i >= items.length) {
                            return const Padding(
                              padding: EdgeInsets.all(14),
                              child: Center(
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2)),
                            );
                          }
                          final b = items[i];
                          return ListTile(
                            title: Text(b),
                            onTap: () {
                              selected = b;
                              alive = false;
                              Navigator.of(ctx2).pop();
                            },
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
      },
    );

    alive = false;
    searchDebounce?.cancel();
    ctl.dispose();
    scrollCtl.dispose();
    return selected;
  }

  Future<String?> _pickModel(BuildContext context,
      {required String brand}) async {
    await IrBlasterDb.instance.ensureInitialized();
    if (!context.mounted) return null;

    String? selected;
    int offset = 0;
    final items = <String>[];
    bool alive = true;
    final ctl = TextEditingController();
    final scrollCtl = ScrollController();
    Timer? searchDebounce;
    bool attachedScrollListener = false;
    bool loading = false;
    bool exhausted = false;
    int generation = 0;

    Future<void> load(StateSetter setModal, {required bool reset}) async {
      if (!alive) return;
      if (!reset && loading) return;

      final requestGeneration = reset ? ++generation : generation;
      setModal(() => loading = true);

      try {
        if (reset) {
          offset = 0;
          exhausted = false;
          items.clear();
          if (scrollCtl.hasClients) scrollCtl.jumpTo(0);
        }

        final next = await IrBlasterDb.instance.listModelsDistinct(
          brand: brand,
          search: ctl.text.trim(),
          limit: 60,
          offset: offset,
        );

        if (!alive || requestGeneration != generation) return;

        items.addAll(next);
        offset += next.length;
        if (next.isEmpty) exhausted = true;

        setModal(() {});
      } finally {
        if (alive && requestGeneration == generation) {
          setModal(() => loading = false);
        }
      }
    }

    void queueSearch(StateSetter setModal) {
      searchDebounce?.cancel();
      searchDebounce = Timer(const Duration(milliseconds: 220), () {
        if (!alive) return;
        load(setModal, reset: true);
      });
    }

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        void onScroll(StateSetter setModal) {
          if (loading || exhausted) return;
          if (scrollCtl.position.pixels >=
              scrollCtl.position.maxScrollExtent - 240) {
            load(setModal, reset: false);
          }
        }

        return StatefulBuilder(
          builder: (ctx2, setModal) {
            if (!attachedScrollListener) {
              attachedScrollListener = true;
              scrollCtl.addListener(() => onScroll(setModal));
              load(setModal, reset: true);
            }

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(context.l10n.selectModel,
                              style: Theme.of(ctx2).textTheme.titleLarge),
                        ),
                        IconButton(
                          onPressed: () {
                            alive = false;
                            Navigator.of(ctx2).pop();
                          },
                          icon: const Icon(Icons.close_rounded),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: ctl,
                      decoration: InputDecoration(
                        hintText: context.l10n.searchModel,
                        prefixIcon: Icon(Icons.search_rounded),
                        border: OutlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.search,
                      onChanged: (_) => queueSearch(setModal),
                      onSubmitted: (_) {
                        searchDebounce?.cancel();
                        FocusManager.instance.primaryFocus?.unfocus();
                        load(setModal, reset: true);
                      },
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                        controller: scrollCtl,
                        itemCount: items.length + (loading ? 1 : 0),
                        separatorBuilder: (_, __) => const Divider(height: 0),
                        itemBuilder: (ctx3, i) {
                          if (i >= items.length) {
                            return const Padding(
                              padding: EdgeInsets.all(14),
                              child: Center(
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2)),
                            );
                          }
                          final m = items[i];
                          return ListTile(
                            title: Text(m),
                            onTap: () {
                              selected = m;
                              alive = false;
                              Navigator.of(ctx2).pop();
                            },
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
      },
    );

    alive = false;
    searchDebounce?.cancel();
    ctl.dispose();
    scrollCtl.dispose();
    return selected;
  }

  String _rowKey(IrDbKeyCandidate r) {
    final label = (r.label ?? '').trim().toLowerCase();
    final proto = r.protocol.trim().toLowerCase();
    final hex = r.hexcode.trim().toLowerCase();
    final id = r.remoteId ?? r.id;
    return '$id|$label|$proto|$hex';
  }

  bool _isSelected(IrDbKeyCandidate r) => _selectedKeys.contains(_rowKey(r));

  void _toggleSelected(IrDbKeyCandidate r) {
    final k = _rowKey(r);
    setState(() {
      if (_selectedKeys.contains(k)) {
        _selectedKeys.remove(k);
      } else {
        _selectedKeys.add(k);
      }
    });
  }

  String _dupKeyForButton(IRButton b) {
    final label = b.image.trim().toLowerCase();
    String signal;
    if (b.protocol != null && b.protocol!.trim().isNotEmpty) {
      final p = b.protocol!.trim().toLowerCase();
      final params = b.protocolParams ?? const <String, dynamic>{};
      final keys = params.keys.toList()..sort();
      final parts = <String>[];
      for (final k in keys) {
        parts.add('$k=${params[k]}');
      }
      signal = '$p|${parts.join(',')}';
    } else if (b.code != null) {
      signal = 'nec|${b.code}';
    } else if (b.rawData != null) {
      signal = 'raw|${b.rawData}|${b.frequency ?? ''}';
    } else {
      signal = 'unknown';
    }
    return '$label|$signal';
  }

  Future<void> _importSelected() async {
    final existing = widget.existingButtons.map(_dupKeyForButton).toSet();
    final added = <IRButton>[];
    final addedKeys = <String>{};
    int skipped = 0;

    for (final r in _dbRows) {
      if (!_isSelected(r)) continue;
      final btn =
          buildButtonFromDbRow(r, unnamedLabel: context.l10n.unnamedKey);
      if (btn == null) continue;
      final key = _dupKeyForButton(btn);
      if (_skipDuplicates &&
          (existing.contains(key) || addedKeys.contains(key))) {
        skipped++;
        continue;
      }
      added.add(btn);
      addedKeys.add(key);
    }

    if (added.isEmpty) {
      _showSnack(
        skipped > 0
            ? context.l10n.allSelectedButtonsWereDuplicates
            : context.l10n.noButtonsImported,
      );
      return;
    }

    if (mounted) {
      Navigator.of(context).pop(added);
      if (skipped > 0) {
        _showSnack(context.l10n
            .importedButtonsSkippedDuplicates(added.length, skipped));
      }
    }
  }

  Future<void> _importAllMatching() async {
    if (_dbBrand == null || _dbModel == null || _dbProtocol == null) return;
    final search = _dbEffectiveSearch();
    final total = await IrBlasterDb.instance.countCandidateKeys(
      brand: _dbBrand!,
      model: _dbModel!,
      selectedProtocolId: _dbProtocol,
      hexPrefixUpper: null,
      search: search,
    );
    if (!mounted) return;

    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.importAllMatchingTitle),
        content: Text(total == 0
            ? context.l10n.noMatchingKeysFound
            : context.l10n.importAllMatchingMessage(total)),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(context.l10n.cancel)),
          FilledButton(
            onPressed: total == 0 ? null : () => Navigator.of(ctx).pop(true),
            child: Text(context.l10n.importAll),
          ),
        ],
      ),
    );
    if (!mounted) return;
    if (confirm != true || total == 0) return;

    int processed = 0;
    int skipped = 0;
    final unnamedLabel = context.l10n.unnamedKey;
    final existing = widget.existingButtons.map(_dupKeyForButton).toSet();
    final added = <IRButton>[];
    final addedKeys = <String>{};

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        bool alive = true;
        StateSetter? setModal;
        Future<void> run() async {
          int offset = 0;
          while (alive) {
            final rows = await IrBlasterDb.instance.fetchCandidateKeys(
              brand: _dbBrand!,
              model: _dbModel!,
              selectedProtocolId: _dbProtocol,
              quickWinsFirst: true,
              hexPrefixUpper: null,
              search: search,
              limit: 200,
              offset: offset,
            );
            if (rows.isEmpty) break;
            for (final r in rows) {
              final btn = buildButtonFromDbRow(r, unnamedLabel: unnamedLabel);
              if (btn == null) continue;
              final key = _dupKeyForButton(btn);
              if (_skipDuplicates &&
                  (existing.contains(key) || addedKeys.contains(key))) {
                skipped++;
                continue;
              }
              added.add(btn);
              addedKeys.add(key);
            }
            offset += rows.length;
            processed += rows.length;
            if (!mounted) break;
            if (setModal != null) setModal!(() {});
          }
          if (ctx.mounted) {
            Navigator.of(ctx).pop();
          }
        }

        WidgetsBinding.instance.addPostFrameCallback((_) => run());

        return StatefulBuilder(
          builder: (ctx2, sm) {
            setModal = sm;
            final int pct =
                total == 0 ? 0 : ((processed / total) * 100).round();
            return AlertDialog(
              title: Text(context.l10n.importingButtons),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(
                      value: total == 0 ? null : processed / total),
                  const SizedBox(height: 12),
                  Text('$processed / $total  ($pct%)'),
                ],
              ),
            );
          },
        );
      },
    );

    if (!mounted) return;
    if (added.isEmpty) {
      _showSnack(
        skipped > 0
            ? context.l10n.allMatchingButtonsWereDuplicates
            : context.l10n.noButtonsImported,
      );
      return;
    }
    Navigator.of(context).pop(added);
    if (skipped > 0) {
      _showSnack(
          context.l10n.importedButtonsSkippedDuplicates(added.length, skipped));
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFiltersExpanded() {
    _setFiltersExpanded(!_filtersExpanded);
  }

  Widget _dbField({
    required String label,
    required IconData icon,
    required String value,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: enabled ? onTap : null,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
          enabled: enabled,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: value.startsWith('Select')
                      ? FontWeight.w500
                      : FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: theme.colorScheme.onSurface
                  .withValues(alpha: enabled ? 0.75 : 0.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPresetBar({required bool enabled}) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    Widget chip(_DbPreset p) {
      final selected = _dbPreset == p;
      return ChoiceChip(
        selected: selected,
        showCheckmark: false,
        label: Text(_dbPresetTitle(p)),
        avatar: Icon(_dbPresetIcon(p), size: 18),
        onSelected: enabled
            ? (v) {
                if (!v) return;
                _dbSetPreset(p);
              }
            : null,
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.flash_on_rounded, color: cs.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  context.l10n.quickPresets,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              if (!enabled)
                Text(
                  context.l10n.selectDeviceFirst,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.65),
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                chip(_DbPreset.all),
                const SizedBox(width: 8),
                chip(_DbPreset.power),
                const SizedBox(width: 8),
                chip(_DbPreset.volume),
                const SizedBox(width: 8),
                chip(_DbPreset.channel),
                const SizedBox(width: 8),
                chip(_DbPreset.navigation),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final bool hasBrand = (_dbBrand != null && _dbBrand!.trim().isNotEmpty);
    final bool hasModel = (_dbModel != null && _dbModel!.trim().isNotEmpty);
    final bool hasProtocol =
        (_dbProtocol != null && _dbProtocol!.trim().isNotEmpty);
    final bool canBrowseKeys = hasBrand && hasModel && hasProtocol;

    final String effectiveSearch = _dbEffectiveSearch();

    final String searchHint = canBrowseKeys
        ? (_dbSearchCtl.text.trim().isNotEmpty
            ? context.l10n.searchByLabelOrHex
            : (_dbPreset == _DbPreset.all
                ? context.l10n.searchByLabelOrHex
                : context.l10n
                    .optionalRefinePresetKeys(_dbPresetTitle(_dbPreset))))
        : context.l10n.selectBrandModelProtocolFirst;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    context.l10n.importFromDatabaseTitle,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              context.l10n.importFromDatabaseSubtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.75),
              ),
            ),
            const SizedBox(height: 8),
            if (_dbMetaLoading) ...[
              const LinearProgressIndicator(minHeight: 2),
              const SizedBox(height: 10),
            ],
            ExpansionTile(
              controller: _filtersTileController,
              initiallyExpanded: _filtersExpanded || !canBrowseKeys,
              onExpansionChanged: (v) => setState(() => _filtersExpanded = v),
              tilePadding: EdgeInsets.zero,
              title: Row(
                children: [
                  const Icon(Icons.tune_rounded),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      context.l10n.deviceAndFilters,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                  if (canBrowseKeys)
                    Text(
                      context.l10n.loadedCount(_dbRows.length),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                ],
              ),
              trailing: canBrowseKeys
                  ? FilledButton.tonalIcon(
                      onPressed: _toggleFiltersExpanded,
                      icon: Icon(
                        _filtersExpanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                      ),
                      label: Text(
                        _filtersExpanded
                            ? context.l10n.hideFilters
                            : context.l10n.showFilters,
                      ),
                      style: FilledButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                  : null,
              childrenPadding: const EdgeInsets.only(bottom: 8),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _dbField(
                        label: context.l10n.brand,
                        icon: Icons.factory_outlined,
                        value: hasBrand ? _dbBrand! : context.l10n.selectBrand,
                        enabled: true,
                        onTap: _dbSelectBrand,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _dbField(
                        label: context.l10n.model,
                        icon: Icons.devices_other_outlined,
                        value: hasModel ? _dbModel! : context.l10n.selectModel,
                        enabled: hasBrand,
                        onTap: _dbSelectModel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (hasBrand && hasModel) ...[
                  if (_dbProtocols.isEmpty && !_dbMetaLoading) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: cs.secondaryContainer.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        context.l10n.noProtocolFoundForBrandModel,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSecondaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ] else ...[
                    DropdownButtonFormField<String>(
                      initialValue: _dbProtocol,
                      isExpanded: true,
                      items: _dbProtocols
                          .map((p) => DropdownMenuItem<String>(
                                value: p,
                                child: Text(p),
                              ))
                          .toList(growable: false),
                      onChanged: (v) {
                        if (v == null) return;
                        _dbSelectProtocol(v);
                      },
                      decoration: InputDecoration(
                        labelText: context.l10n.protocolAutoDetected,
                        border: OutlineInputBorder(),
                        helperText: context.l10n.protocolAutoDetectedHelper,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                ],
                _buildPresetBar(enabled: canBrowseKeys),
                const SizedBox(height: 10),
                TextField(
                  controller: _dbSearchCtl,
                  enabled: canBrowseKeys,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: searchHint,
                    prefixIcon: const Icon(Icons.search_rounded),
                    border: const OutlineInputBorder(),
                    suffixIcon:
                        (!canBrowseKeys || _dbSearchCtl.text.trim().isEmpty)
                            ? null
                            : IconButton(
                                tooltip: context.l10n.clearAction,
                                onPressed: () {
                                  setState(() => _dbSearchCtl.clear());
                                  _runDbSearchNow();
                                },
                                icon: const Icon(Icons.clear),
                              ),
                  ),
                  onChanged: (_) {
                    if (!canBrowseKeys) return;
                    _queueDbSearchReload();
                  },
                  onSubmitted: (_) => _runDbSearchNow(),
                  onTapOutside: (_) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: cs.outlineVariant.withValues(alpha: 0.8)),
                ),
                child: !canBrowseKeys
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Text(
                            context.l10n.selectBrandModelToLoadKeys,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: cs.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ),
                      )
                    : (_dbRows.isEmpty && _dbLoading)
                        ? const Center(
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : (_dbRows.isEmpty)
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Text(
                                    effectiveSearch.isEmpty
                                        ? context.l10n.noKeysFound
                                        : context.l10n.noKeysFoundForSearch(
                                            effectiveSearch),
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color:
                                          cs.onSurface.withValues(alpha: 0.7),
                                    ),
                                  ),
                                ),
                              )
                            : ListView.separated(
                                controller: _dbScrollCtl,
                                itemCount:
                                    _dbRows.length + (_dbLoading ? 1 : 0),
                                separatorBuilder: (_, __) =>
                                    const Divider(height: 0),
                                itemBuilder: (ctx, i) {
                                  if (i >= _dbRows.length) {
                                    return const Padding(
                                      padding: EdgeInsets.all(14),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2)),
                                    );
                                  }

                                  final r = _dbRows[i];
                                  final bool selected = _isSelected(r);

                                  final String titleText =
                                      (r.label ?? '').trim().isEmpty
                                          ? context.l10n.unnamedKey
                                          : (r.label ?? '').trim();
                                  final String protoText =
                                      r.protocol.trim().isEmpty
                                          ? context.l10n.unknown
                                          : r.protocol.trim();
                                  final String hexText =
                                      r.hexcode.trim().isEmpty
                                          ? context.l10n.emDash
                                          : r.hexcode.trim();

                                  return CheckboxListTile(
                                    value: selected,
                                    onChanged: (_) => _toggleSelected(r),
                                    title: Text(titleText),
                                    subtitle: Text('$hexText · $protoText'),
                                    secondary: IconButton(
                                      tooltip: context.l10n.copyCode,
                                      icon: const Icon(Icons.copy_rounded),
                                      onPressed: () => Clipboard.setData(
                                        ClipboardData(
                                            text: '$protoText:$hexText'),
                                      ),
                                    ),
                                  );
                                },
                              ),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  context.l10n.selectedCount(_selectedKeys.length),
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                TextButton(
                  onPressed: _dbRows.isEmpty
                      ? null
                      : () => setState(() => _selectedKeys.clear()),
                  child: Text(context.l10n.clearAction),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: _dbRows.isEmpty
                      ? null
                      : () => setState(() {
                            for (final r in _dbRows) {
                              _selectedKeys.add(_rowKey(r));
                            }
                          }),
                  child: Text(context.l10n.selectVisible),
                ),
              ],
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(context.l10n.skipDuplicates),
              subtitle: Text(context.l10n.skipDuplicatesSubtitle),
              value: _skipDuplicates,
              onChanged: (v) => setState(() => _skipDuplicates = v),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _selectedKeys.isEmpty ? null : _importSelected,
                    icon: const Icon(Icons.download_done_rounded),
                    label: Text(context.l10n.importSelected),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: canBrowseKeys ? _importAllMatching : null,
                    icon: const Icon(Icons.playlist_add_rounded),
                    label: Text(context.l10n.importAll),
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
