import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    test('macro seconds retain millisecond precision: $locale', () async {
      final l10n = await AppLocalizations.delegate.load(locale);
      for (final ms in [1000, 1001, 1010, 1100, 1250, 1999, 3000, 21000]) {
        final text = l10n.secondsLong(ms / 1000);
        var normalized = text.replaceAll(',', '.').replaceAll('٫', '.');
        for (var digit = 0; digit < 10; digit++) {
          normalized = normalized.replaceAll(
              String.fromCharCode(0x0660 + digit), '$digit');
        }
        final number = RegExp(r'\d+(?:\.\d+)?').firstMatch(normalized);
        expect(number, isNotNull, reason: text);
        expect(double.parse(number!.group(0)!), ms / 1000, reason: text);
        expect(text, isNot(contains('true')));
        expect(text, isNot(contains('false')));
        expect(text, isNot(contains('{')));
      }
    });
  }

  test('duration units use singular, plural and fractional forms', () async {
    final expected = {
      'en': [
        '1 millisecond',
        '2 milliseconds',
        '1 second',
        '2 seconds',
        '1.25 seconds'
      ],
      'de': [
        '1 Millisekunde',
        '2 Millisekunden',
        '1 Sekunde',
        '2 Sekunden',
        '1,25 Sekunden'
      ],
      'fr': [
        '1 milliseconde',
        '2 millisecondes',
        '1 seconde',
        '2 secondes',
        '1,25 seconde'
      ],
      'pl': [
        '1 milisekunda',
        '2 milisekundy',
        '1 sekunda',
        '2 sekundy',
        '1,25 sekundy'
      ],
      'ru': [
        '1 миллисекунда',
        '2 миллисекунды',
        '1 секунда',
        '2 секунды',
        '1,25 секунды'
      ],
      'uk': [
        '1 мілісекунда',
        '2 мілісекунди',
        '1 секунда',
        '2 секунди',
        '1,25 секунди'
      ],
      'ms': ['1 milisaat', '2 milisaat', '1 saat', '2 saat', '1.25 saat'],
      'tr': [
        '1 milisaniye',
        '2 milisaniye',
        '1 saniye',
        '2 saniye',
        '1,25 saniye'
      ],
      'pt_BR': [
        '1 milissegundo',
        '2 milissegundos',
        '1 segundo',
        '2 segundos',
        '1,25 segundo'
      ],
    };
    for (final locale in AppLocalizations.supportedLocales) {
      final values = expected[locale.toString()];
      if (values == null) continue;
      final l10n = await AppLocalizations.delegate.load(locale);
      expect([
        l10n.millisecondsLong(1),
        l10n.millisecondsLong(2),
        l10n.secondsLong(1),
        l10n.secondsLong(2),
        l10n.secondsLong(1.25),
      ], values, reason: '$locale');
    }
  });
}
