import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';

void main() {
  test('countdown uses locale decimal separators and one fractional digit',
      () async {
    const expected = {
      'ar': 'المتبقي: 1.5 ث',
      'ar_EG': 'المتبقي: ١٫٥ ث',
      'de': 'Noch 1,5 s',
      'en': '1.5 s remaining',
      'fr': 'Temps restant : 1,5 s',
      'pt': 'Tempo restante: 1,5 s',
      'pt_BR': 'Tempo restante: 1,5 s',
      'tr': 'Kalan süre: 1,5 sn',
      'uk': 'Залишилося: 1,5 с',
      'ja': '残り1.5秒',
    };
    for (final locale in AppLocalizations.supportedLocales) {
      final l10n = await AppLocalizations.delegate.load(locale);
      if (expected.containsKey(locale.toString())) {
        expect(l10n.secondsRemaining(1.5), expected[locale.toString()]);
      }
      final whole = l10n.secondsRemaining(5);
      expect(whole, matches(RegExp(r'5[.,]0|٥٫٠')));
      expect(l10n.secondsRemaining(1.54), l10n.secondsRemaining(1.5));
      expect(l10n.secondsRemaining(1.56), l10n.secondsRemaining(1.6));
      expect(l10n.waitMilliseconds(1250), contains('1250'));
      expect(l10n.failedToSendNamed('TV Power'), contains('TV Power'));
      expect(l10n.buttonNotFoundNamed('TV Power'), contains('TV Power'));
    }
  });
}
