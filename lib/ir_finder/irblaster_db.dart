/* lib/ir_finder/irblaster_db.dart */
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/ir_finder/ir_signal_matcher.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class IrBlasterDb {
  IrBlasterDb._();
  static final IrBlasterDb instance = IrBlasterDb._();

  static const String _assetDbPath = 'assets/db/irblaster.sqlite';
  static const String _dbFileName = 'irblaster.sqlite';

  Database? _db;
  Future<void>? _initFuture;
  bool _perfTuned = false;

  // Protocol normalization cache: normalizedKey -> canonical DB value as stored in keys.protocol
  bool _protocolMapLoaded = false;
  final Map<String, String> _canonicalProtocolByKey = <String, String>{};

  Future<void> ensureInitialized() {
    _initFuture ??= _open();
    return _initFuture!;
  }

  Future<void> _open() async {
    if (_db != null) return;

    final String dbDir = await getDatabasesPath();
    final String dbPath = p.join(dbDir, _dbFileName);

    final bool exists = await databaseExists(dbPath);
    if (!exists) {
      await _copyAssetTo(dbPath);
    } else {
      final File f = File(dbPath);
      if (await f.exists()) {
        final int len = await f.length();
        if (len <= 0) {
          await _copyAssetTo(dbPath);
        }
      }
    }

    // Open writable so we can create indexes (no data mutations; just performance indexes).
    _db = await openDatabase(
      dbPath,
      readOnly: false,
      singleInstance: true,
    );

    await _ensurePerformanceTuning();
  }

  Future<void> _copyAssetTo(String targetPath) async {
    final ByteData data = await rootBundle.load(_assetDbPath);
    final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    final File outFile = File(targetPath);
    await outFile.parent.create(recursive: true);
    await outFile.writeAsBytes(bytes, flush: true);
  }

  Database _requireDb() {
    final Database? db = _db;
    if (db == null) {
      throw StateError('IrBlasterDb not initialized. Call ensureInitialized() first.');
    }
    return db;
  }

  Future<void> _ensurePerformanceTuning() async {
    if (_perfTuned) return;
    final db = _requireDb();

    Future<void> tryExec(String sql) async {
      try {
        await db.execute(sql);
      } catch (_) {
        // ignore
      }
    }

    await tryExec('PRAGMA temp_store=MEMORY;');
    await tryExec('PRAGMA cache_size=-20000;'); // ~20MB cache (negative => KB pages)
    await tryExec('PRAGMA mmap_size=268435456;'); // 256MB mmap (best-effort)
    await tryExec('PRAGMA synchronous=NORMAL;');
    await tryExec('PRAGMA foreign_keys=OFF;');

    // Core indexes
    await tryExec('CREATE INDEX IF NOT EXISTS idx_keys_protocol_id ON keys(protocol, id);');
    await tryExec('CREATE INDEX IF NOT EXISTS idx_keys_id ON keys(id);');
    await tryExec('CREATE INDEX IF NOT EXISTS idx_models_brand_id ON models(brand, id);');
    await tryExec('CREATE INDEX IF NOT EXISTS idx_models_brand_model ON models(brand, model);');
    await tryExec('CREATE INDEX IF NOT EXISTS idx_brands_name_nocase ON brands(name COLLATE NOCASE);');

    // Helpful optional indexes for case-insensitive / normalized protocol matching:
    await tryExec('CREATE INDEX IF NOT EXISTS idx_keys_protocol_nocase_id ON keys(protocol COLLATE NOCASE, id);');

    // Expression index (best-effort; supported on modern SQLite). If unsupported, it will be ignored.
    await tryExec(
      "CREATE INDEX IF NOT EXISTS idx_keys_protocol_norm_id ON keys("
      "lower(replace(replace(replace(protocol,'-',''),'_',''),' ','')), id"
      ");",
    );

    await tryExec('PRAGMA optimize;');

    _perfTuned = true;
  }

  // ---- Protocol normalization helpers ----

  static String _protocolKey(String s) {
    // Keep only [a-z0-9] after lowercasing; this makes:
    // "RCA-38" == "rca_38" == "RCA 38" -> "rca38"
    return s
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '');
  }

  static String _sqlProtocolNormExpr(String column) {
    // Mirror a subset of _protocolKey() in SQL (fast enough + indexable via expression index).
    // We normalize by removing '-', '_' and spaces and lowercasing.
    return "lower(replace(replace(replace($column,'-',''),'_',''),' ',''))";
  }

  Future<void> _ensureProtocolMapLoaded() async {
    if (_protocolMapLoaded) return;
    final db = _requireDb();

    // Distinct over protocol is usually cheap with idx_keys_protocol_id.
    final rows = await db.rawQuery('SELECT DISTINCT protocol FROM keys WHERE protocol IS NOT NULL;');
    for (final r in rows) {
      final v = r['protocol'];
      if (v == null) continue;
      final String protoStr = v.toString();
      final String key = _protocolKey(protoStr);
      if (key.isEmpty) continue;
      _canonicalProtocolByKey.putIfAbsent(key, () => protoStr);
    }

    _protocolMapLoaded = true;
  }

  Future<_ProtocolFilter?> _resolveProtocolFilter(String? selectedProtocolId) async {
    final String? s = (selectedProtocolId == null || selectedProtocolId.trim().isEmpty)
        ? null
        : selectedProtocolId.trim();
    if (s == null) return null;

    final String key = _protocolKey(s);
    if (key.isEmpty) return null;

    await _ensureProtocolMapLoaded();

    // If DB has a canonical spelling for this normalized key, use it (fast path).
    final String? canonical = _canonicalProtocolByKey[key];

    return _ProtocolFilter(
      normalizedKey: key,
      canonicalDbValue: canonical,
    );
  }

  void _appendProtocolWhere({
    required List<String> where,
    required List<Object?> args,
    required String column,
    required _ProtocolFilter filter,
  }) {
    if (filter.canonicalDbValue != null) {
      // Exact DB value -> uses idx_keys_protocol_id
      where.add('$column = ?');
      args.add(filter.canonicalDbValue);
    } else {
      // Fallback normalized expression (works even if DB uses different separators/case)
      where.add('${_sqlProtocolNormExpr(column)} = ?');
      args.add(filter.normalizedKey);
    }
  }

  // ---- Public API ----

  Future<List<String>> listProtocolsFor({required String brand, required String model}) async {
    await ensureInitialized();
    final db = _requireDb();
    final String b = brand.trim();
    final String m = model.trim();
    if (b.isEmpty || m.isEmpty) return <String>[];

    final rows = await db.rawQuery('''
      SELECT DISTINCT k.protocol AS protocol
      FROM models m
      JOIN keys k ON k.id = m.id
      WHERE m.brand = ? AND m.model = ? AND k.protocol IS NOT NULL
      ORDER BY UPPER(k.protocol) ASC
    ''', [b, m]);
    return rows
        .map((r) => (r['protocol'] as String?)?.trim())
        .whereType<String>()
        .toList(growable: false);
  }

  /// Returns distinct protocols used by [brand] across all its models,
  /// ordered alphabetically. Used to auto-adjust the protocol when a
  /// brand is selected in the IR Finder without a protocol filter.
  Future<List<String>> listProtocolsForBrand(String brand) async {
    await ensureInitialized();
    final db = _requireDb();
    final String b = brand.trim();
    if (b.isEmpty) return <String>[];

    final rows = await db.rawQuery('''
      SELECT DISTINCT k.protocol AS protocol
      FROM models m
      JOIN keys k ON k.id = m.id
      WHERE m.brand = ? AND k.protocol IS NOT NULL
      ORDER BY UPPER(k.protocol) ASC
    ''', [b]);
    return rows
        .map((r) => (r['protocol'] as String?)?.trim())
        .whereType<String>()
        .toList(growable: false);
  }

  Future<List<String>> listBrands({
    String? search,
    String? protocolId,
    int limit = 60,
    int offset = 0,
  }) async {
    await ensureInitialized();
    final db = _requireDb();

    final String? q = (search == null || search.trim().isEmpty) ? null : search.trim();
    final _ProtocolFilter? pf = await _resolveProtocolFilter(protocolId);

    // Always query through models+keys so the returned brand names are
    // exactly the same strings stored in models.brand. This is critical for
    // consistency: listProtocolsForBrand, listModelsDistinct, and the signal
    // test all query models.brand with an exact-match WHERE clause. If we
    // returned brand names from the separate `brands` display table they might
    // differ in capitalisation or spacing (e.g. "O General" vs "O-General"),
    // causing those follow-up queries to return zero results.
    final where = <String>[];
    final args = <Object?>[];

    final codeWhere = <String>['k.id = m.id'];
    if (pf != null) {
      _appendProtocolWhere(where: codeWhere, args: args, column: 'k.protocol', filter: pf);
    }
    // A model may contain hundreds of keys. Check existence instead of
    // expanding every key only to discard those duplicates with DISTINCT.
    where.add('EXISTS (SELECT 1 FROM keys k WHERE ${codeWhere.join(' AND ')})');

    if (q != null) {
      where.add('m.brand LIKE ? ESCAPE \'\\\'');
      args.add('%${_escapeLike(q)}%');
    }

    final String whereSql =
        where.isEmpty ? '' : 'WHERE ${where.join(' AND ')}';

    final sql = '''
      SELECT DISTINCT m.brand AS name
      FROM models m
      $whereSql
      ORDER BY name COLLATE NOCASE ASC
      LIMIT ? OFFSET ?
    ''';

    args.add(limit);
    args.add(offset);

    final rows = await db.rawQuery(sql, args);
    return rows.map((r) => (r['name'] as String)).toList(growable: false);
  }

  Future<List<String>> listModelsDistinct({
    required String brand,
    String? search,
    String? protocolId,
    int limit = 60,
    int offset = 0,
  }) async {
    await ensureInitialized();
    final db = _requireDb();

    final String b = brand.trim();
    if (b.isEmpty) return <String>[];

    final String? q = (search == null || search.trim().isEmpty) ? null : search.trim();
    final _ProtocolFilter? pf = await _resolveProtocolFilter(protocolId);

    // No protocol filter: keep it simple.
    if (pf == null) {
      final where = <String>['brand = ?'];
      final args = <Object?>[b];

      if (q != null) {
        where.add('model LIKE ? ESCAPE \'\\\'');
        args.add('%${_escapeLike(q)}%');
      }

      final rows = await db.query(
        'models',
        columns: const <String>['model'],
        distinct: true,
        where: where.join(' AND '),
        whereArgs: args,
        orderBy: 'model COLLATE NOCASE ASC',
        limit: limit,
        offset: offset,
      );
      return rows.map((r) => (r['model'] as String)).toList(growable: false);
    }

    // Protocol-filtered models for a brand:
    final where = <String>['m.brand = ?'];
    final args = <Object?>[b];

    _appendProtocolWhere(where: where, args: args, column: 'k.protocol', filter: pf);

    if (q != null) {
      where.add('m.model LIKE ? ESCAPE \'\\\'');
      args.add('%${_escapeLike(q)}%');
    }

    final sql = '''
      SELECT DISTINCT m.model AS model
      FROM models m
      JOIN keys k ON k.id = m.id
      WHERE ${where.join(' AND ')}
      ORDER BY model COLLATE NOCASE ASC
      LIMIT ? OFFSET ?
    ''';

    args.add(limit);
    args.add(offset);

    final rows = await db.rawQuery(sql, args);
    return rows.map((r) => (r['model'] as String)).toList(growable: false);
  }

  bool _signalIndexReady = false;

  Future<void> _ensureSignalIndex(Database db) async {
    if (_signalIndexReady) return;
    try {
      await db.execute(
        'CREATE INDEX IF NOT EXISTS idx_keys_protocol_hex ON keys(protocol, hexcode);',
      );
    } catch (_) {
      // Best effort: the lookups still work, just slower.
    }
    _signalIndexReady = true;
  }

  /// `SELECT id FROM keys ... INTERSECT ...`: the ids of the remotes that contain
  /// every one of [codes].
  _RemoteIdsQuery _remoteIdsContaining(List<DecodedIrSignal> codes) {
    final parts = <String>[];
    final args = <Object?>[];
    for (final code in codes) {
      final String marks =
          List<String>.filled(code.hexcodes.length, '?').join(',');
      parts.add(
        'SELECT id FROM keys WHERE protocol = ? AND hexcode IN ($marks)',
      );
      args.add(code.protocol);
      args.addAll(code.hexcodes);
    }
    return _RemoteIdsQuery(parts.join(' INTERSECT '), args);
  }

  /// Brands and models whose remote contains *all* of [codes], most models first.
  /// Each code is a `(protocol, hexcodes)` pair; [hexcodes] are alternative
  /// encodings of the same code.
  Future<IrDbSignalMatches> findBrandsForCodes({
    required List<DecodedIrSignal> codes,
    int brandLimit = 6,
    int sampleModels = 3,
  }) async {
    if (codes.isEmpty || codes.any((c) => c.hexcodes.isEmpty)) {
      return IrDbSignalMatches.empty;
    }
    await ensureInitialized();
    final db = _requireDb();
    await _ensureSignalIndex(db);
    final q = _remoteIdsContaining(codes);

    final totals = await db.rawQuery(
      'SELECT COUNT(DISTINCT m.brand) AS brands, '
      "COUNT(DISTINCT m.brand || '|' || m.model) AS models "
      'FROM models m WHERE m.id IN (${q.sql});',
      q.args,
    );
    final int totalBrands = (totals.first['brands'] as int?) ?? 0;
    final int totalModels = (totals.first['models'] as int?) ?? 0;
    if (totalBrands == 0) return IrDbSignalMatches.empty;

    // Usual label of the newest code among the matching remotes.
    final last = codes.last;
    final String lastMarks =
        List<String>.filled(last.hexcodes.length, '?').join(',');
    final labelRows = await db.rawQuery(
      'SELECT k.label AS label, COUNT(*) AS c FROM keys k '
      'WHERE k.protocol = ? AND k.hexcode IN ($lastMarks) '
      'AND k.id IN (${q.sql}) '
      'GROUP BY k.label ORDER BY c DESC LIMIT 3;',
      <Object?>[last.protocol, ...last.hexcodes, ...q.args],
    );
    final List<String> labels = labelRows
        .map((r) => (r['label'] as String?)?.trim() ?? '')
        .where((l) => l.isNotEmpty)
        .toList(growable: false);

    final brandRows = await db.rawQuery(
      'SELECT m.brand AS brand, COUNT(DISTINCT m.model) AS models '
      'FROM models m WHERE m.id IN (${q.sql}) '
      'GROUP BY m.brand ORDER BY models DESC, m.brand ASC LIMIT ?;',
      <Object?>[...q.args, brandLimit],
    );

    final brands = <IrDbBrandMatch>[];
    for (final row in brandRows) {
      final String brand = (row['brand'] as String?) ?? '';
      if (brand.isEmpty) continue;
      final modelRows = await db.rawQuery(
        'SELECT DISTINCT m.model AS model FROM models m '
        'WHERE m.id IN (${q.sql}) AND m.brand = ? '
        'ORDER BY m.model LIMIT ?;',
        <Object?>[...q.args, brand, sampleModels],
      );
      brands.add(
        IrDbBrandMatch(
          brand: brand,
          modelCount: (row['models'] as int?) ?? 0,
          sampleModels: modelRows
              .map((r) => (r['model'] as String?) ?? '')
              .where((m) => m.isNotEmpty)
              .toList(growable: false),
        ),
      );
    }

    return IrDbSignalMatches(
      totalBrands: totalBrands,
      totalModels: totalModels,
      commonLabels: labels,
      brands: brands,
    );
  }

  /// Models of [brand] whose remote contains all of [codes], with the remote id.
  Future<List<IrDbModelMatch>> listModelsForCodes({
    required String brand,
    required List<DecodedIrSignal> codes,
    int limit = 300,
  }) async {
    if (codes.isEmpty || codes.any((c) => c.hexcodes.isEmpty)) {
      return <IrDbModelMatch>[];
    }
    await ensureInitialized();
    final db = _requireDb();
    await _ensureSignalIndex(db);
    final q = _remoteIdsContaining(codes);
    final rows = await db.rawQuery(
      'SELECT m.model AS model, m.id AS remote_id FROM models m '
      'WHERE m.id IN (${q.sql}) AND m.brand = ? '
      'GROUP BY m.model, m.id ORDER BY m.model LIMIT ?;',
      <Object?>[...q.args, brand, limit],
    );
    return rows
        .map(
          (r) => IrDbModelMatch(
            model: (r['model'] as String?) ?? '',
            remoteId: (r['remote_id'] as int?) ?? 0,
          ),
        )
        .where((m) => m.model.isNotEmpty && m.remoteId > 0)
        .toList(growable: false);
  }

  /// Keys of one database remote. Some remotes mix protocols (for example TV and
  /// DVD codes); pass [protocol] to keep only the keys of the matched protocol.
  Future<List<IrDbKeyCandidate>> fetchRemoteKeys(
    int remoteId, {
    String? protocol,
  }) async {
    await ensureInitialized();
    final db = _requireDb();
    final rows = await db.rawQuery(
      'SELECT label, hexcode, protocol FROM keys WHERE id = ? '
      '${protocol == null ? '' : 'AND protocol = ? '}'
      'ORDER BY label COLLATE NOCASE, hexcode;',
      <Object?>[remoteId, if (protocol != null) protocol],
    );
    return rows
        .map(
          (r) => IrDbKeyCandidate(
            id: remoteId,
            protocol: (r['protocol'] as String?) ?? '',
            hexcode: (r['hexcode'] as String?) ?? '',
            remoteId: remoteId,
            label: r['label'] as String?,
          ),
        )
        .toList(growable: false);
  }

  Future<List<IrDbKeyCandidate>> fetchCandidateKeys({
    required String brand,
    String? model,
    String? selectedProtocolId,
    required bool quickWinsFirst,
    String? hexPrefixUpper,
    String? search,
    bool uniqueSignals = false,
    int limit = 100,
    int offset = 0,
  }) async {
    await ensureInitialized();
    final db = _requireDb();

    final String b = brand.trim();
    if (b.isEmpty) return <IrDbKeyCandidate>[];

    final String? m = (model == null || model.trim().isEmpty) ? null : model.trim();
    final String? prefix = (hexPrefixUpper == null || hexPrefixUpper.trim().isEmpty)
        ? null
        : hexPrefixUpper.replaceAll(RegExp(r'\s+'), '').toUpperCase();

    final _ProtocolFilter? pf = await _resolveProtocolFilter(selectedProtocolId);

    final args = <Object?>[];
    final where = <String>[];

    where.add('m.brand = ?');
    args.add(b);

    if (m != null) {
      where.add('m.model = ?');
      args.add(m);
    }

    if (pf != null) {
      _appendProtocolWhere(where: where, args: args, column: 'k.protocol', filter: pf);
    }

    if (prefix != null) {
      where.add('UPPER(k.hexcode) LIKE ?');
      args.add('$prefix%');
    }

    final String? q = (search == null || search.trim().isEmpty) ? null : _escapeLike(search.trim());
    if (q != null) {
      where.add('(UPPER(k.label) LIKE UPPER(?) ESCAPE \'\\\' OR UPPER(k.hexcode) LIKE UPPER(?))');
      args.add('%$q%');
      args.add('%${q.toUpperCase()}%');
    }

    final String orderBy = quickWinsFirst
        ? '''
 CASE
 WHEN UPPER(k.label) LIKE '%POWER%' OR UPPER(k.label) IN ('PWR','POWER','ON','OFF') THEN 0
 WHEN UPPER(k.label) LIKE '%MUTE%' OR UPPER(k.label) = 'MUTE' THEN 1
 WHEN UPPER(k.label) LIKE 'VOL%' OR UPPER(k.label) LIKE '%VOLUME%' THEN 2
 WHEN UPPER(k.label) LIKE 'CH%' OR UPPER(k.label) LIKE '%CHANNEL%' THEN 3
 WHEN UPPER(k.label) IN ('OK','ENTER','MENU','HOME','BACK','UP','DOWN','LEFT','RIGHT') THEN 4
 ELSE 9
 END ASC,
 UPPER(k.label) ASC,
 UPPER(k.protocol) ASC,
 UPPER(k.hexcode) ASC,
 k.id ASC
 '''
        : '''
 UPPER(k.label) ASC,
 UPPER(k.protocol) ASC,
 UPPER(k.hexcode) ASC,
 k.id ASC
 ''';

    final modelFilterCount = m == null ? 1 : 2;
    final keyFilters = where.skip(modelFilterCount).join(' AND ');
    // Imports retain every named key. Finder scans can instead select one
    // real database row per signal, without expanding thousands of model aliases.
    final sql = uniqueSignals ? '''
 WITH matched AS (
   SELECT k.rowid AS key_rowid, k.id AS remote_id,
          k.label, k.hexcode, k.protocol, m.brand, m.model
   FROM (
     SELECT id, brand, MIN(model) AS model FROM models m
     WHERE ${where.take(modelFilterCount).join(' AND ')} GROUP BY id
   ) m
   JOIN keys k ON k.id = m.id
   ${keyFilters.isEmpty ? '' : 'WHERE $keyFilters'}
 ), chosen AS (
   SELECT MIN(key_rowid) AS key_rowid FROM matched GROUP BY protocol, hexcode
 )
 SELECT k.* FROM matched k JOIN chosen USING (key_rowid)
 ORDER BY ${orderBy.replaceAll('k.id', 'k.remote_id')}
 LIMIT ? OFFSET ?
 ''' : '''
 SELECT
   k.id AS remote_id,
   k.label AS label,
   k.hexcode AS hexcode,
   k.protocol AS protocol,
   m.brand AS brand,
   m.model AS model
 FROM models m
 JOIN keys k ON k.id = m.id
 WHERE ${where.join(' AND ')}
 ORDER BY $orderBy
 LIMIT ? OFFSET ?
''';

    args.add(limit);
    args.add(offset);

    final rows = await db.rawQuery(sql, args);

    return rows.map((r) {
      final int remoteId = (r['remote_id'] as int);
      final String label = (r['label'] as String);
      final String hex = (r['hexcode'] as String);
      final String protocol = (r['protocol'] as String);
      final String rb = (r['brand'] as String);
      final String rm = (r['model'] as String);

      return IrDbKeyCandidate(
        id: remoteId,
        protocol: protocol,
        hexcode: hex,
        remoteId: remoteId,
        label: label,
        brand: rb,
        model: rm,
      );
    }).toList(growable: false);
  }

  Future<int> countCandidateKeys({
    required String brand,
    String? model,
    String? selectedProtocolId,
    String? hexPrefixUpper,
    String? search,
  }) async {
    await ensureInitialized();
    final db = _requireDb();

    final String b = brand.trim();
    if (b.isEmpty) return 0;

    final String? m = (model == null || model.trim().isEmpty) ? null : model.trim();
    final String? prefix = (hexPrefixUpper == null || hexPrefixUpper.trim().isEmpty)
        ? null
        : hexPrefixUpper.replaceAll(RegExp(r'\s+'), '').toUpperCase();

    final _ProtocolFilter? pf = await _resolveProtocolFilter(selectedProtocolId);

    final args = <Object?>[];
    final where = <String>[];

    where.add('m.brand = ?');
    args.add(b);

    if (m != null) {
      where.add('m.model = ?');
      args.add(m);
    }

    if (pf != null) {
      _appendProtocolWhere(where: where, args: args, column: 'k.protocol', filter: pf);
    }

    if (prefix != null) {
      where.add('UPPER(k.hexcode) LIKE ?');
      args.add('$prefix%');
    }

    final String? q = (search == null || search.trim().isEmpty) ? null : _escapeLike(search.trim());
    if (q != null) {
      where.add('(UPPER(k.label) LIKE UPPER(?) ESCAPE \'\\\' OR UPPER(k.hexcode) LIKE UPPER(?))');
      args.add('%$q%');
      args.add('%${q.toUpperCase()}%');
    }

    final sql = '''
 SELECT COUNT(1) AS cnt
 FROM models m
 JOIN keys k ON k.id = m.id
 WHERE ${where.join(' AND ')}
''';

    final rows = await db.rawQuery(sql, args);
    if (rows.isEmpty) return 0;
    final dynamic v = rows.first['cnt'];
    if (v is int) return v;
    return int.tryParse('$v') ?? 0;
  }

  static String _escapeLike(String input) {
    return input.replaceAll('\\', '\\\\').replaceAll('%', '\\%').replaceAll('_', '\\_');
  }
}

class _ProtocolFilter {
  final String normalizedKey;
  final String? canonicalDbValue;
  const _ProtocolFilter({
    required this.normalizedKey,
    required this.canonicalDbValue,
  });
}

class _RemoteIdsQuery {
  const _RemoteIdsQuery(this.sql, this.args);

  final String sql;
  final List<Object?> args;
}
