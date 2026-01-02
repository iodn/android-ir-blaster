/* lib/ir_finder/irblaster_db.dart */
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
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

    // Fast path: no protocol filter -> brands table
    if (pf == null) {
      final where = <String>[];
      final args = <Object?>[];

      if (q != null) {
        where.add('name LIKE ? ESCAPE \'\\\'');
        args.add('%${_escapeLike(q)}%');
      }

      final rows = await db.query(
        'brands',
        columns: const <String>['name'],
        where: where.isEmpty ? null : where.join(' AND '),
        whereArgs: args,
        orderBy: 'name COLLATE NOCASE ASC',
        limit: limit,
        offset: offset,
      );
      return rows.map((r) => (r['name'] as String)).toList(growable: false);
    }

    // Protocol-filtered brands:
    final where = <String>[];
    final args = <Object?>[];

    _appendProtocolWhere(where: where, args: args, column: 'k.protocol', filter: pf);

    if (q != null) {
      where.add('m.brand LIKE ? ESCAPE \'\\\'');
      args.add('%${_escapeLike(q)}%');
    }

    final sql = '''
      SELECT DISTINCT m.brand AS name
      FROM models m
      JOIN keys k ON k.id = m.id
      WHERE ${where.join(' AND ')}
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

  Future<List<IrDbKeyCandidate>> fetchCandidateKeys({
    required String brand,
    String? model,
    String? selectedProtocolId,
    required bool quickWinsFirst,
    String? hexPrefixUpper,
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

    final sql = '''
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
