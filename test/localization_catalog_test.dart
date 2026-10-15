import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('all locale catalogs retain message keys and placeholder names', () {
    final source = jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync())
        as Map<String, dynamic>;
    final placeholder = RegExp(r'\{([A-Za-z]\w*)\s*[,}]');
    Set<String> placeholders(String text) =>
        placeholder.allMatches(text).map((match) => match.group(1)!).toSet();

    final catalogs = Directory('lib/l10n')
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.arb'));
    for (final file in catalogs) {
      final translated =
          jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      for (final entry in source.entries) {
        if (entry.key.startsWith('@')) continue;
        final reason = '${file.path}: ${entry.key}';
        expect(translated[entry.key], isA<String>(), reason: reason);
        expect(placeholders(translated[entry.key] as String),
            placeholders(entry.value as String),
            reason: reason);
      }
    }
  });
}
