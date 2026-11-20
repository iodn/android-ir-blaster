import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir_finder/irblaster_db.dart';
import 'package:irblaster_controller/utils/db_catalog_search.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/widgets/db_catalog_picker.dart';
import 'package:irblaster_controller/widgets/db_bulk_import_sheet.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:sqflite/sqflite.dart';

// Run the real sqflite queries against a disposable copy of the bundled data.
// The sqlite3 CLI avoids adding a native desktop database dependency to the app.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  var sqliteAvailable = false;
  try {
    sqliteAvailable = Process.runSync('sqlite3', ['--version']).exitCode == 0;
  } on ProcessException {
    // Report a skipped integration test on machines without the SQLite CLI.
  }
  late Directory directory;
  late String databasePath;
  const channel = MethodChannel('com.tekartik.sqflite');

  List<dynamic> query(String sql, [List<dynamic> arguments = const []]) {
    var index = 0;
    final bound = sql.replaceAllMapped(RegExp(r'\?'), (_) {
      final value = arguments[index++];
      if (value == null) return 'NULL';
      if (value is num) return '$value';
      return "'${value.toString().replaceAll("'", "''")}'";
    });
    final result = Process.runSync('sqlite3', ['-json', databasePath, bound]);
    expect(result.exitCode, 0, reason: result.stderr.toString());
    final output = (result.stdout as String).trim();
    return output.isEmpty ? [] : jsonDecode(output) as List;
  }

  group('bundled database', () {
    setUpAll(() async {
      databaseFactory = databaseFactorySqflitePlugin;
      directory = Directory.systemTemp.createTempSync('ir-catalog-test-');
      databasePath = '${directory.path}/irblaster.sqlite';
      File('assets/db/irblaster.sqlite').copySync(databasePath);
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
        final args = call.arguments as Map? ?? {};
        switch (call.method) {
          case 'getDatabasesPath':
            return directory.path;
          case 'databaseExists':
            return true;
          case 'openDatabase':
            return {'id': 1};
          case 'query':
            return query(
                args['sql'] as String, args['arguments'] as List? ?? []);
          case 'execute':
            query(args['sql'] as String, args['arguments'] as List? ?? []);
            return null;
          default:
            return null;
        }
      });
      await IrBlasterDb.instance.ensureInitialized();
    });

    tearDownAll(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
      directory.deleteSync(recursive: true);
    });

    test('suggested remote lookup returns keys of every protocol', () async {
      final keys = await IrBlasterDb.instance.fetchRemoteKeys(2);
      expect(keys.map((key) => key.protocol).toSet(), {'NEC', 'NEC2'});
    });

    test('faster brand query returns exactly the previous catalog', () async {
      final brands = await IrBlasterDb.instance.listBrands(limit: 1 << 30);
      final previous = query('''
        SELECT DISTINCT m.brand AS name FROM models m
        JOIN keys k ON k.id = m.id ORDER BY name COLLATE NOCASE
      ''').map((row) => row['name']).toList();
      expect(brands, previous);
      expect(DbCatalogSearch(brands).search('sony').first, 'SONY');
      expect(DbCatalogSearch(brands).search('tcl').first, 'TCL');
      expect(await IrBlasterDb.instance.listBrands(limit: 7, offset: 7),
          brands.sublist(7, 14));
    });

    test('protocol filters and literal searches preserve the old results',
        () async {
      for (final protocol in ['SONY12', 'NEC', 'RC5', 'RCA_38']) {
        final brands = await IrBlasterDb.instance
            .listBrands(protocolId: protocol, limit: 1 << 30);
        final previous = query('''
          SELECT DISTINCT m.brand AS name FROM models m
          JOIN keys k ON k.id = m.id WHERE k.protocol = ?
          ORDER BY name COLLATE NOCASE
        ''', [protocol]).map((row) => row['name']).toList();
        expect(brands, previous, reason: protocol);
      }
      expect(await IrBlasterDb.instance.listBrands(search: '%'), isEmpty);
      expect(await IrBlasterDb.instance.listBrands(search: 'sony'),
          contains('SONY'));
    });

    test('actual Sony and TCL model searches still resolve to importable keys',
        () async {
      for (final brand in ['SONY', 'TCL']) {
        final models = await IrBlasterDb.instance
            .listModelsDistinct(brand: brand, limit: 1 << 30);
        expect(models.length, brand == 'SONY' ? 12121 : 53);
        final model = models.first;
        final compact = model.replaceAll(RegExp(r'[\s-]'), '').toLowerCase();
        expect(DbCatalogSearch(models).search(compact), contains(model));
        final keys = await IrBlasterDb.instance.fetchCandidateKeys(
            brand: brand, model: model, quickWinsFirst: true);
        expect(keys, isNotEmpty);
        expect(keys.every((key) => key.brand == brand && key.model == model),
            isTrue);
      }
    });

    test('Finder scans unique TCL signals while imports retain all named keys',
        () async {
      final db = IrBlasterDb.instance;
      final imported = await db.fetchCandidateKeys(
          brand: 'TCL', quickWinsFirst: true, limit: 10000);
      final scanned = await db.fetchCandidateKeys(
          brand: 'TCL',
          quickWinsFirst: true,
          uniqueSignals: true,
          limit: 10000);
      String identity(dynamic row) => '${row.protocol}:${row.hexcode}';
      expect(imported.length, 2144);
      expect(scanned.length, 598);
      expect(scanned.map(identity).toSet(), imported.map(identity).toSet());
      for (final row in scanned) {
        expect(
            imported.any((original) =>
                identity(original) == identity(row) &&
                original.remoteId == row.remoteId &&
                original.model == row.model &&
                original.label == row.label),
            isTrue);
      }
      final page = await db.fetchCandidateKeys(
          brand: 'TCL',
          quickWinsFirst: true,
          uniqueSignals: true,
          limit: 80,
          offset: 80);
      expect(page.map(identity), scanned.skip(80).take(80).map(identity));
      expect(
          await db.fetchCandidateKeys(
              brand: 'TCL',
              quickWinsFirst: true,
              uniqueSignals: true,
              offset: scanned.length),
          isEmpty);
    });

    test('unique Finder scans respect model, protocol and prefix filters',
        () async {
      for (final brand in ['SONY', 'TCL']) {
        final rows = await IrBlasterDb.instance.fetchCandidateKeys(
            brand: brand, quickWinsFirst: true, uniqueSignals: true, limit: 80);
        expect(rows, isNotEmpty);
        final sample = rows.first;
        final prefix = sample.hexcode.substring(0, 2);
        final filtered = await IrBlasterDb.instance.fetchCandidateKeys(
            brand: brand,
            model: sample.model,
            selectedProtocolId: sample.protocol,
            hexPrefixUpper: prefix,
            uniqueSignals: true,
            quickWinsFirst: true);
        expect(filtered, isNotEmpty);
        expect(
            filtered.every((row) =>
                row.brand == brand &&
                row.model == sample.model &&
                row.protocol == sample.protocol &&
                row.hexcode.startsWith(prefix)),
            isTrue);
      }
    });

    testWidgets('bulk import guides brand to model and returns selected codes',
        (tester) async {
      tester.view.physicalSize = const Size(420, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      // Database method-channel futures need real event-loop turns between
      // frames that open each successive sheet.
      Future<void> settleDatabase() async {
        for (var i = 0; i < 6; i++) {
          await tester.pump(const Duration(milliseconds: 100));
          await tester.runAsync(
              () => Future<void>.delayed(const Duration(milliseconds: 10)));
        }
        await tester.pumpAndSettle();
      }

      List<IRButton>? imported;
      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
            builder: (context) => Scaffold(
                    body: TextButton(
                  child: const Text('Open'),
                  onPressed: () async {
                    imported = await showModalBottomSheet<List<IRButton>>(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => const FractionallySizedBox(
                        heightFactor: 0.97,
                        child: DbBulkImportSheet(existingButtons: []),
                      ),
                    );
                  },
                ))),
      ));
      await tester.tap(find.text('Open'));
      await settleDatabase();
      await tester.tap(find.text('Select brand'));
      await settleDatabase();
      Finder searchField() => find.descendant(
          of: find.byType(DbCatalogPicker), matching: find.byType(TextField));
      await tester.enterText(searchField(), 'tcl');
      await settleDatabase();
      await tester.tap(find.widgetWithText(ListTile, 'TCL'));
      await settleDatabase();
      expect(tester.widget<DbCatalogPicker>(find.byType(DbCatalogPicker)).brand,
          'TCL');
      await tester.enterText(searchField(), '19b12h');
      await settleDatabase();
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await settleDatabase();
      await tester.tap(find.widgetWithText(ListTile, '19B12H'));
      await settleDatabase();
      expect(find.byType(DbCatalogPicker), findsNothing);
      expect(find.byType(CheckboxListTile), findsWidgets);
      await tester.tap(find.byType(CheckboxListTile).first);
      await settleDatabase();
      await tester.tap(find.text('Import selected'));
      await settleDatabase();
      expect(imported, hasLength(1));
      expect(imported!.single.code, isNotNull);
    });
  }, skip: sqliteAvailable ? false : 'Requires the sqlite3 command-line tool');
}
