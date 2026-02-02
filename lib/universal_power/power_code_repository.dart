import 'package:irblaster_controller/ir_finder/irblaster_db.dart';
import 'package:irblaster_controller/universal_power/curated_power_patterns.dart';
import 'package:irblaster_controller/universal_power/power_code.dart';

class PowerCodeRepository {
  final IrBlasterDb db;

  const PowerCodeRepository({required this.db});

  Future<List<PowerCode>> loadPowerCodes({
    required String brand,
    String? model,
    bool broadenSearch = false,
    int maxCodes = 600,
    int depth = 2,
  }) async {
    await db.ensureInitialized();

    final List<PowerCode> codes = <PowerCode>[];
    final Set<String> seen = <String>{};
    final int maxRank = _maxRankForDepth(depth, broadenSearch: broadenSearch);

    void addCode(PowerCode code) {
      final int rank = powerLabelRank(code.label);
      if (rank > maxRank) return;
      final String key = _dedupeKey(code);
      if (!seen.add(key)) return;
      codes.add(code);
    }

    final String brandNorm = brand.trim().toLowerCase();
    for (final p in curatedPowerPatterns) {
      if (p.brand.trim().toLowerCase() != brandNorm) continue;
      addCode(PowerCode(
        protocolId: 'raw',
        hexCode: '',
        label: 'POWER',
        brand: brand,
        model: model,
        frequencyHz: p.frequencyHz,
        rawPattern: p.cycles,
      ));
      if (codes.length >= maxCodes) return codes;
    }

    Future<void> addFromQuery(String? query, {int limit = 220}) async {
      final rows = await db.fetchCandidateKeys(
        brand: brand,
        model: model,
        selectedProtocolId: null,
        quickWinsFirst: true,
        search: query,
        limit: limit,
        offset: 0,
      );

      for (final r in rows) {
        final label = (r.label ?? '').trim();
        if (label.isEmpty) continue;
        addCode(PowerCode(
          protocolId: r.protocol.trim().toLowerCase().replaceAll('-', '_'),
          hexCode: r.hexcode,
          label: label,
          brand: r.brand,
          model: r.model,
        ));
        if (codes.length >= maxCodes) return;
      }
    }

    await addFromQuery('power');
    if (codes.length < maxCodes) await addFromQuery('off');
    if (codes.length < maxCodes) await addFromQuery('pwr');
    if (codes.length < maxCodes) await addFromQuery('standby');
    if (codes.length < maxCodes) await addFromQuery('sleep');

    if (codes.isEmpty && broadenSearch) {
      await addFromQuery(null, limit: maxCodes);
    }

    if (codes.isEmpty) return codes;

    codes.sort((a, b) {
      final int ra = powerLabelRank(a.label);
      final int rb = powerLabelRank(b.label);
      if (ra != rb) return ra.compareTo(rb);
      final int byBrand = (a.brand ?? '').toUpperCase().compareTo((b.brand ?? '').toUpperCase());
      if (byBrand != 0) return byBrand;
      final int byLabel = a.label.toUpperCase().compareTo(b.label.toUpperCase());
      if (byLabel != 0) return byLabel;
      final int byProto = a.protocolId.compareTo(b.protocolId);
      if (byProto != 0) return byProto;
      return a.hexCode.compareTo(b.hexCode);
    });

    if (codes.length > maxCodes) {
      return codes.sublist(0, maxCodes);
    }
    return codes;
  }

  Future<List<PowerCode>> loadAllPowerCodes({
    bool broadenSearch = false,
    int maxCodes = 1200,
    int depth = 2,
  }) async {
    await db.ensureInitialized();
    final brands = await db.listBrands(limit: 2000, offset: 0);
    if (brands.isEmpty) return <PowerCode>[];

    final List<PowerCode> codes = <PowerCode>[];
    final Set<String> seen = <String>{};
    final int maxRank = _maxRankForDepth(depth, broadenSearch: broadenSearch);

    void addCode(PowerCode code) {
      final int rank = powerLabelRank(code.label);
      if (rank > maxRank) return;
      final String key = _dedupeKey(code);
      if (!seen.add(key)) return;
      codes.add(code);
    }

    for (final p in curatedPowerPatterns) {
      addCode(PowerCode(
        protocolId: 'raw',
        hexCode: '',
        label: 'POWER',
        brand: p.brand,
        frequencyHz: p.frequencyHz,
        rawPattern: p.cycles,
      ));
      if (codes.length >= maxCodes) return codes;
    }

    for (final b in brands) {
      final rows = await db.fetchCandidateKeys(
        brand: b,
        selectedProtocolId: null,
        quickWinsFirst: true,
        search: null,
        limit: 260,
        offset: 0,
      );
      for (final r in rows) {
        final label = (r.label ?? '').trim();
        if (label.isEmpty) continue;
        addCode(PowerCode(
          protocolId: r.protocol.trim().toLowerCase().replaceAll('-', '_'),
          hexCode: r.hexcode,
          label: label,
          brand: r.brand,
          model: r.model,
        ));
        if (codes.length >= maxCodes) return codes;
      }
    }

    if (codes.isEmpty && broadenSearch) {
      for (final b in brands) {
        final rows = await db.fetchCandidateKeys(
          brand: b,
          selectedProtocolId: null,
          quickWinsFirst: false,
          search: null,
          limit: 400,
          offset: 0,
        );
        for (final r in rows) {
          final label = (r.label ?? '').trim();
          if (label.isEmpty) continue;
          addCode(PowerCode(
            protocolId: r.protocol.trim().toLowerCase().replaceAll('-', '_'),
            hexCode: r.hexcode,
            label: label,
            brand: r.brand,
            model: r.model,
          ));
          if (codes.length >= maxCodes) return codes;
        }
      }
    }

    codes.sort((a, b) {
      final int ra = powerLabelRank(a.label);
      final int rb = powerLabelRank(b.label);
      if (ra != rb) return ra.compareTo(rb);
      final int byBrand = (a.brand ?? '').toUpperCase().compareTo((b.brand ?? '').toUpperCase());
      if (byBrand != 0) return byBrand;
      final int byLabel = a.label.toUpperCase().compareTo(b.label.toUpperCase());
      if (byLabel != 0) return byLabel;
      final int byProto = a.protocolId.compareTo(b.protocolId);
      if (byProto != 0) return byProto;
      return a.hexCode.compareTo(b.hexCode);
    });

    if (codes.length > maxCodes) {
      return codes.sublist(0, maxCodes);
    }
    return codes;
  }
}

int _maxRankForDepth(int depth, {required bool broadenSearch}) {
  final int d = depth.clamp(1, 4);
  if (broadenSearch) return 3;
  switch (d) {
    case 1:
      return 0;
    case 2:
      return 1;
    case 3:
      return 2;
    default:
      return 3;
  }
}

String _dedupeKey(PowerCode code) {
  if (code.rawPattern != null && code.frequencyHz != null) {
    return 'raw|${code.frequencyHz}|${code.rawPattern!.join(',')}|${code.brand ?? ''}|${code.model ?? ''}';
  }
  return '${code.protocolId}|${code.hexCode}|${code.label}|${code.brand ?? ''}|${code.model ?? ''}';
}
