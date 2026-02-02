import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/ir_finder/irblaster_db.dart';
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

  bool _dbInit = false;
  bool _dbMetaLoading = false;
  bool _dbLoading = false;
  bool _dbExhausted = false;
  int _dbOffset = 0;

  String? _dbBrand;
  String? _dbModel;
  String? _dbProtocol;
  List<String> _dbProtocols = <String>[];
  List<IrDbKeyCandidate> _dbRows = <IrDbKeyCandidate>[];

  final Set<String> _selectedKeys = <String>{};
  bool _skipDuplicates = true;

  _DbPreset _dbPreset = _DbPreset.all;
  bool _filtersExpanded = true;

  @override
  void initState() {
    super.initState();
    _dbScrollCtl.addListener(_onDbScroll);
  }

  @override
  void dispose() {
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

    if (_dbScrollCtl.position.pixels >= _dbScrollCtl.position.maxScrollExtent - 240) {
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
        return 'All';
      case _DbPreset.power:
        return 'Power';
      case _DbPreset.volume:
        return 'Volume';
      case _DbPreset.channel:
        return 'Channel';
      case _DbPreset.navigation:
        return 'Navigation';
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
      if (mounted) _showSnack('Failed to load protocols: $e');
    } finally {
      if (mounted) setState(() => _dbMetaLoading = false);
    }
  }

  Future<void> _dbReloadKeys({required bool reset}) async {
    if (_dbBrand == null || _dbModel == null) return;
    if (_dbProtocol == null || _dbProtocol!.trim().isEmpty) return;
    if (_dbLoading || _dbExhausted) return;

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
      final rows = await IrBlasterDb.instance.fetchCandidateKeys(
        brand: _dbBrand!,
        model: _dbModel!,
        selectedProtocolId: _dbProtocol,
        quickWinsFirst: true,
        hexPrefixUpper: null,
        search: search,
        limit: 80,
        offset: _dbOffset,
      );
      setState(() {
        _dbRows.addAll(rows);
        _dbOffset += rows.length;
        if (rows.isEmpty) _dbExhausted = true;
      });
    } catch (e) {
      if (mounted) _showSnack('Failed to load database keys: $e');
    } finally {
      if (mounted) setState(() => _dbLoading = false);
    }
  }

  Future<void> _dbSelectBrand() async {
    await _dbEnsureReady();
    final b = await _pickBrand(context);
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
      _filtersExpanded = true;
    });
  }

  Future<void> _dbSelectModel() async {
    await _dbEnsureReady();
    if (_dbBrand == null) return;

    final m = await _pickModel(context, brand: _dbBrand!);
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
      _filtersExpanded = false;
    });

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
      _filtersExpanded = false;
    });
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

    String? selected;
    int offset = 0;
    final items = <String>[];
    bool alive = true;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        final ctl = TextEditingController();
        final scrollCtl = ScrollController();
        bool loading = false;
        bool exhausted = false;

        Future<void> load(StateSetter setModal, {required bool reset}) async {
          if (!alive) return;
          if (loading) return;

          setModal(() => loading = true);

          try {
            if (reset) {
              offset = 0;
              exhausted = false;
              items.clear();
            }

            final next = await IrBlasterDb.instance.listBrands(
              search: ctl.text.trim(),
              limit: 60,
              offset: offset,
            );

            if (!alive) return;

            items.addAll(next);
            offset += next.length;
            if (next.isEmpty) exhausted = true;

            setModal(() {});
          } finally {
            if (!alive) return;
            setModal(() => loading = false);
          }
        }

        void onScroll(StateSetter setModal) {
          if (loading || exhausted) return;
          if (scrollCtl.position.pixels >= scrollCtl.position.maxScrollExtent - 240) {
            load(setModal, reset: false);
          }
        }

        return StatefulBuilder(
          builder: (ctx2, setModal) {
            if (!scrollCtl.hasListeners) {
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
                          child: Text('Select brand', style: Theme.of(ctx2).textTheme.titleLarge),
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
                      decoration: const InputDecoration(
                        hintText: 'Search brand…',
                        prefixIcon: Icon(Icons.search_rounded),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => load(setModal, reset: true),
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
                              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
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
    return selected;
  }

  Future<String?> _pickModel(BuildContext context, {required String brand}) async {
    await IrBlasterDb.instance.ensureInitialized();

    String? selected;
    int offset = 0;
    final items = <String>[];
    bool alive = true;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        final ctl = TextEditingController();
        final scrollCtl = ScrollController();
        bool loading = false;
        bool exhausted = false;

        Future<void> load(StateSetter setModal, {required bool reset}) async {
          if (!alive) return;
          if (loading) return;

          setModal(() => loading = true);

          try {
            if (reset) {
              offset = 0;
              exhausted = false;
              items.clear();
            }

            final next = await IrBlasterDb.instance.listModelsDistinct(
              brand: brand,
              search: ctl.text.trim(),
              limit: 60,
              offset: offset,
            );

            if (!alive) return;

            items.addAll(next);
            offset += next.length;
            if (next.isEmpty) exhausted = true;

            setModal(() {});
          } finally {
            if (!alive) return;
            setModal(() => loading = false);
          }
        }

        void onScroll(StateSetter setModal) {
          if (loading || exhausted) return;
          if (scrollCtl.position.pixels >= scrollCtl.position.maxScrollExtent - 240) {
            load(setModal, reset: false);
          }
        }

        return StatefulBuilder(
          builder: (ctx2, setModal) {
            if (!scrollCtl.hasListeners) {
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
                          child: Text('Select model', style: Theme.of(ctx2).textTheme.titleLarge),
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
                      decoration: const InputDecoration(
                        hintText: 'Search model…',
                        prefixIcon: Icon(Icons.search_rounded),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => load(setModal, reset: true),
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
                              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
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
      final btn = buildButtonFromDbRow(r);
      if (btn == null) continue;
      final key = _dupKeyForButton(btn);
      if (_skipDuplicates && (existing.contains(key) || addedKeys.contains(key))) {
        skipped++;
        continue;
      }
      added.add(btn);
      addedKeys.add(key);
    }

    if (added.isEmpty) {
      _showSnack(skipped > 0 ? 'All selected buttons were duplicates.' : 'No buttons imported.');
      return;
    }

    if (mounted) {
      Navigator.of(context).pop(added);
      if (skipped > 0) {
        _showSnack('Imported ${added.length} button(s). Skipped $skipped duplicate(s).');
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

    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Import all matching?'),
        content: Text(total == 0
            ? 'No matching keys found.'
            : 'This will import $total button(s) from the database.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Cancel')),
          FilledButton(
            onPressed: total == 0 ? null : () => Navigator.of(ctx).pop(true),
            child: const Text('Import all'),
          ),
        ],
      ),
    );
    if (confirm != true || total == 0) return;

    int processed = 0;
    int skipped = 0;
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
              final btn = buildButtonFromDbRow(r);
              if (btn == null) continue;
              final key = _dupKeyForButton(btn);
              if (_skipDuplicates && (existing.contains(key) || addedKeys.contains(key))) {
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
          if (!mounted) return;
          Navigator.of(ctx).pop();
        }

        WidgetsBinding.instance.addPostFrameCallback((_) => run());

        return StatefulBuilder(
          builder: (ctx2, sm) {
            setModal = sm;
            final int pct = total == 0 ? 0 : ((processed / total) * 100).round();
            return AlertDialog(
              title: const Text('Importing buttons…'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(value: total == 0 ? null : processed / total),
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
      _showSnack(skipped > 0 ? 'All matching buttons were duplicates.' : 'No buttons imported.');
      return;
    }
    Navigator.of(context).pop(added);
    if (skipped > 0) {
      _showSnack('Imported ${added.length} button(s). Skipped $skipped duplicate(s).');
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
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
                  fontWeight: value.startsWith('Select') ? FontWeight.w500 : FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: theme.colorScheme.onSurface.withValues(alpha: enabled ? 0.75 : 0.4),
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
                  'Quick presets',
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              if (!enabled)
                Text(
                  'Select device first',
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
    final bool hasProtocol = (_dbProtocol != null && _dbProtocol!.trim().isNotEmpty);
    final bool canBrowseKeys = hasBrand && hasModel && hasProtocol;

    final String effectiveSearch = _dbEffectiveSearch();

    final String searchHint = canBrowseKeys
        ? (_dbSearchCtl.text.trim().isNotEmpty
            ? 'Search by label or hex…'
            : (_dbPreset == _DbPreset.all
                ? 'Search by label or hex…'
                : 'Optional: refine “${_dbPresetTitle(_dbPreset)}” keys…'))
        : 'Select Brand + Model + Protocol first';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Import from database',
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
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
              'Select a device, choose keys, then import multiple buttons at once.',
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
              initiallyExpanded: _filtersExpanded || !canBrowseKeys,
              onExpansionChanged: (v) => setState(() => _filtersExpanded = v),
              tilePadding: EdgeInsets.zero,
              title: Row(
                children: [
                  const Icon(Icons.tune_rounded),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Device & filters',
                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                  if (canBrowseKeys)
                    Text(
                      '${_dbRows.length} loaded',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                ],
              ),
              childrenPadding: const EdgeInsets.only(bottom: 8),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _dbField(
                        label: 'Brand',
                        icon: Icons.factory_outlined,
                        value: hasBrand ? _dbBrand! : 'Select brand',
                        enabled: true,
                        onTap: _dbSelectBrand,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _dbField(
                        label: 'Model',
                        icon: Icons.devices_other_outlined,
                        value: hasModel ? _dbModel! : 'Select model',
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
                        'No protocol found for this Brand/Model.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSecondaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ] else ...[
                    DropdownButtonFormField<String>(
                      value: _dbProtocol,
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
                      decoration: const InputDecoration(
                        labelText: 'Protocol (auto detected)',
                        border: OutlineInputBorder(),
                        helperText: 'Auto-selected from the database for this device.',
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
                  decoration: InputDecoration(
                    hintText: searchHint,
                    prefixIcon: const Icon(Icons.search_rounded),
                    border: const OutlineInputBorder(),
                    suffixIcon: (!canBrowseKeys || _dbSearchCtl.text.trim().isEmpty)
                        ? null
                        : IconButton(
                            tooltip: 'Clear',
                            onPressed: () {
                              setState(() => _dbSearchCtl.clear());
                              _dbReloadKeys(reset: true);
                            },
                            icon: const Icon(Icons.clear),
                          ),
                  ),
                  onChanged: (_) {
                    if (!canBrowseKeys) return;
                    _dbReloadKeys(reset: true);
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.8)),
                ),
                child: !canBrowseKeys
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Text(
                            'Select Brand and Model to load the device protocol and available keys.',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: cs.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ),
                      )
                    : (_dbRows.isEmpty && _dbLoading)
                        ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
                        : (_dbRows.isEmpty)
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Text(
                                    effectiveSearch.isEmpty
                                        ? 'No keys found.'
                                        : 'No keys found for “$effectiveSearch”.\nTry a different preset or search term.',
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: cs.onSurface.withValues(alpha: 0.7),
                                    ),
                                  ),
                                ),
                              )
                            : ListView.separated(
                                controller: _dbScrollCtl,
                                itemCount: _dbRows.length + (_dbLoading ? 1 : 0),
                                separatorBuilder: (_, __) => const Divider(height: 0),
                                itemBuilder: (ctx, i) {
                                  if (i >= _dbRows.length) {
                                    return const Padding(
                                      padding: EdgeInsets.all(14),
                                      child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                                    );
                                  }

                                  final r = _dbRows[i];
                                  final bool selected = _isSelected(r);

                                  final String titleText =
                                      (r.label ?? '').trim().isEmpty ? 'Unnamed key' : (r.label ?? '').trim();
                                  final String protoText =
                                      r.protocol.trim().isEmpty ? 'Unknown' : r.protocol.trim();
                                  final String hexText = r.hexcode.trim().isEmpty ? '—' : r.hexcode.trim();

                                  return CheckboxListTile(
                                    value: selected,
                                    onChanged: (_) => _toggleSelected(r),
                                    title: Text(titleText),
                                    subtitle: Text('$hexText · $protoText'),
                                    secondary: IconButton(
                                      tooltip: 'Copy',
                                      icon: const Icon(Icons.copy_rounded),
                                      onPressed: () => Clipboard.setData(
                                        ClipboardData(text: '$protoText:$hexText'),
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
                  '${_selectedKeys.length} selected',
                  style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                TextButton(
                  onPressed: _dbRows.isEmpty ? null : () => setState(() => _selectedKeys.clear()),
                  child: const Text('Clear'),
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
                  child: const Text('Select visible'),
                ),
              ],
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Skip duplicates'),
              subtitle: const Text('Matches label + protocol/code'),
              value: _skipDuplicates,
              onChanged: (v) => setState(() => _skipDuplicates = v),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _selectedKeys.isEmpty ? null : _importSelected,
                    icon: const Icon(Icons.download_done_rounded),
                    label: const Text('Import selected'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: canBrowseKeys ? _importAllMatching : null,
                    icon: const Icon(Icons.playlist_add_rounded),
                    label: const Text('Import all'),
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
