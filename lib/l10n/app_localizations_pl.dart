// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Wczytywanie…';

  @override
  String get unknownError => 'Nieznany błąd';

  @override
  String get failedToStart => 'Nie udało się uruchomić';

  @override
  String get retry => 'Ponów';

  @override
  String get quickTilePower => 'Zasilanie';

  @override
  String get quickTileMute => 'Wycisz';

  @override
  String get quickTileVolumeUp => 'Głośn. +';

  @override
  String get quickTileVolumeDown => 'Głośn. -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Ten telefon nie ma wbudowanego nadajnika IR. Wykryto dongiel USB IR, ale uprawnienie nie zostało jeszcze przyznane.\n\nZaakceptuj monit o uprawnienie USB, aby włączyć wysyłanie IR.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'Ten telefon nie ma wbudowanego nadajnika IR. Wykryto dongiel USB IR, ale odmówiono uprawnienia USB.\n\nPoproś o uprawnienie ponownie i zaakceptuj monit, aby włączyć wysyłanie IR.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'Ten telefon nie ma wbudowanego nadajnika IR. Dongiel USB IR jest autoryzowany, ale nie jest jeszcze zainicjowany.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Ten telefon nie ma wbudowanego nadajnika IR. Wykryto i autoryzowano dongiel USB IR, ale nie udało się go zainicjować.\n\nPodłącz ponownie dongiel i spróbuj jeszcze raz.';

  @override
  String get homeUsbReadyMessage =>
      'Ten telefon nie ma wbudowanego nadajnika IR.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Ten telefon nie ma wbudowanego nadajnika IR i obecnie nie jest podłączony żaden obsługiwany dongiel USB IR.\n\nNadal możesz tworzyć, importować i zarządzać pilotami, ale do wysyłania sygnałów IR potrzebujesz jednej z opcji poniżej.';

  @override
  String get homeUsbOptionPlugIn =>
      'Podłącz obsługiwany dongiel USB IR, a potem zaakceptuj uprawnienie.';

  @override
  String get homeUsbOptionReady => 'Gotowe do użycia.';

  @override
  String get homeUsbOptionPermissionRequired =>
      'Podłączono. Wymagane uprawnienie.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Odmówiono uprawnienia. Poproś ponownie.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Autoryzowano. Trwa inicjalizacja dongla.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Autoryzowano, ale inicjalizacja nie powiodła się.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Ten telefon nie ma wbudowanego IR. Podłącz dongiel USB IR lub włącz tryb audio w ustawieniach.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Wykryto dongiel USB. Do wysyłania IR wymagane jest uprawnienie.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Odmówiono uprawnienia USB. Poproś ponownie, aby wysyłać IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Dongiel USB autoryzowany. Oczekiwanie na inicjalizację.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Dongiel USB autoryzowany, ale inicjalizacja nie powiodła się.';

  @override
  String get homeHardwareBannerReady => 'USB jest gotowe.';

  @override
  String get homeHardwareRequiredTitle =>
      'Do wysyłania komend wymagany jest sprzęt IR';

  @override
  String get homeUsbDongleRecommended => 'Dongiel USB IR (zalecane)';

  @override
  String get homeAudioAdapterAlternative => 'Adapter audio IR (alternatywa)';

  @override
  String get homeAudioAdapterDescription =>
      'Ustawienia → Nadajnik IR → Audio (1 LED / 2 LED). Wymaga adaptera audio-IR.';

  @override
  String get close => 'Zamknij';

  @override
  String get homeChooseTransmitter => 'Wybierz nadajnik';

  @override
  String get openSettings => 'Otwórz ustawienia';

  @override
  String get homeUsbPermissionSentApprove =>
      'Wysłano żądanie uprawnienia USB. Zaakceptuj monit, aby włączyć USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'Nie wykryto obsługiwanego dongla USB IR. Podłącz go i spróbuj ponownie.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Nie udało się poprosić o uprawnienie USB.';

  @override
  String get working => 'Przetwarzanie…';

  @override
  String get requestUsbPermission => 'Poproś o uprawnienie USB';

  @override
  String get homeHardwareTip =>
      'Wskazówka: już teraz możesz tworzyć i porządkować piloty. Sprzęt jest potrzebny tylko do nadawania.';

  @override
  String get homeNoIrTransmitterTitle => 'Brak dostępnego nadajnika IR';

  @override
  String get homeHardwareRequiredBody =>
      'IR Blaster może tworzyć i zarządzać pilotami na każdym telefonie. Aby jednak naprawdę wysyłać polecenia podczerwieni, urządzenie musi mieć jedną z poniższych opcji sprzętowych.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Nadal możesz teraz tworzyć, importować i porządkować piloty.';

  @override
  String get homeWaysToUseIrBlaster => 'Sposoby używania IR Blaster';

  @override
  String get homeBuiltInIrOptionTitle => 'Telefon z wbudowanym IR';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Działa na obsługiwanych telefonach z wbudowanym nadajnikiem IR. Ten telefon go nie ma.';

  @override
  String get homeBuiltInIrUnavailable => 'Niedostępne na tym telefonie';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'Adapter audio 3,5 mm';

  @override
  String get homeContinueWithoutHardware => 'Kontynuuj bez sprzętu';

  @override
  String get homeHowItWorks => 'Jak to działa';

  @override
  String get settingsNavLabel => 'Ustawienia';

  @override
  String get dismiss => 'Zamknij';

  @override
  String get remotesNavLabel => 'Piloty';

  @override
  String get macrosNavLabel => 'Makra';

  @override
  String get signalTesterNavLabel => 'Tester sygnału';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get remoteNoIrEmitterTitle => 'Brak nadajnika IR';

  @override
  String get remoteNoIrEmitterMessage => 'To urządzenie nie ma nadajnika IR';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Ta aplikacja wymaga nadajnika IR';

  @override
  String get remoteDismiss => 'Zamknij';

  @override
  String get remoteClose => 'Zamknij';

  @override
  String remoteFailedToSend(Object error) {
    return 'Nie udało się wysłać IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Nie udało się uruchomić pętli: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Pętla zatrzymana (wysyłanie nieudane): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Trwa pętla \"$title\". Stuknij Stop na górnym pasku, aby zatrzymać.';
  }

  @override
  String get remoteLoopStopped => 'Pętla zatrzymana.';

  @override
  String get remoteUpdatedNotFound =>
      'Pilot został zaktualizowany na ekranie. Nie znaleziono go na zapisanej liście.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Zaktualizowano \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Usuwanie nieudane: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'Nie znaleziono pilota na zapisanej liście.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Usunięto \"$name\".';
  }

  @override
  String get buttonFallbackTitle => 'Przycisk';

  @override
  String get imageFallbackTitle => 'Obraz';

  @override
  String get noBrowserAvailable => 'Brak dostępnej przeglądarki';

  @override
  String failedToOpen(Object error) {
    return 'Nie udało się otworzyć: $error';
  }

  @override
  String get cancel => 'Anuluj';

  @override
  String get settingsRestoreDemoTitle => 'Przywrócić piloty demo?';

  @override
  String get settingsRestoreDemoMessage =>
      'To zastąpi bieżące piloty wbudowanymi pilotami demo. Jeśli chcesz zachować obecną listę, zalecamy kopię zapasową.';

  @override
  String get settingsRestoreDemoConfirm => 'Przywróć demo';

  @override
  String get settingsDemoRemotesRestored => 'Przywrócono piloty demo.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Usunąć wszystkie piloty?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'To usunie wszystkie piloty z tego urządzenia. Tego działania nie można cofnąć.';

  @override
  String get settingsDeleteAllConfirm => 'Usuń wszystko';

  @override
  String get settingsAllRemotesDeleted => 'Usunięto wszystkie piloty.';

  @override
  String get themeAuto => 'Automatyczny motyw';

  @override
  String get themeLight => 'Jasny motyw';

  @override
  String get themeDark => 'Ciemny motyw';

  @override
  String get themeDescAuto => 'Zgodnie z ustawieniami urządzenia';

  @override
  String get themeDescLight => 'Zawsze jasny i czytelny';

  @override
  String get themeDescDark => 'Łagodny dla oczu';

  @override
  String get themeHintAuto =>
      'Motyw zmienia się automatycznie wraz z przełączeniem urządzenia między trybem jasnym i ciemnym';

  @override
  String get themeHintLight => 'Idealny na dzień i do jasnych miejsc';

  @override
  String get themeHintDark =>
      'Zmniejsza zmęczenie oczu przy słabym świetle i oszczędza baterię na ekranach OLED';

  @override
  String get supportDevelopmentTitle => 'Wesprzyj rozwój';

  @override
  String get supportDevelopmentSubtitle =>
      'Pomóż utrzymać IR Blaster i zgodność ze sprzętem';

  @override
  String get supportDevelopmentBody =>
      'Bez reklam, bez śledzenia, bez blokowanych funkcji. Twoje wsparcie finansuje pracę nad protokołami, obsługę dongli USB i lepszą zgodność między urządzeniami.';

  @override
  String get donate => 'Wesprzyj';

  @override
  String get starRepo => 'Gwiazda repo';

  @override
  String get repositoryLinkCopied => 'Link do repo skopiowany';

  @override
  String get supportPillLocalOnly => 'Tylko lokalnie';

  @override
  String get supportPillNoTracking => 'Bez śledzenia';

  @override
  String get supportPillHardwareAware => 'Świadome sprzętu';

  @override
  String get supportPillOpenSource => 'Open source';

  @override
  String get appearanceTitle => 'Wygląd';

  @override
  String get appearanceSubtitle => 'Dostosuj wygląd aplikacji';

  @override
  String get localizationTitle => 'Lokalizacja';

  @override
  String get localizationSubtitle => 'Język aplikacji i tłumaczenia';

  @override
  String localizationAutoUsing(Object language) {
    return 'Auto: używany $language';
  }

  @override
  String get localizationAutoDescription =>
      'Aplikacja używa języka urządzenia, gdy to możliwe.';

  @override
  String get localizationManualDescription =>
      'Język aplikacji został ustawiony ręcznie.';

  @override
  String get useSystemLanguageTitle => 'Użyj języka systemu';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Zgodnie z językiem urządzenia: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Użyj języka wybranego poniżej zamiast domyślnego języka urządzenia.';

  @override
  String get chooseAppLanguage => 'Wybierz język aplikacji';

  @override
  String get languagePickerDisabledHint =>
      'Wyłącz język systemowy, aby wybrać język ręcznie.';

  @override
  String get searchLanguages => 'Szukaj języków';

  @override
  String get noLanguagesFound => 'Brak pasujących języków';

  @override
  String get localizationHint =>
      'Gdy język systemowy jest włączony, aplikacja używa ustawień językowych urządzenia i wraca do angielskiego, jeśli tłumaczenie nie jest dostępne. Wyłącz tę opcję, aby wymusić konkretny język.';

  @override
  String get appLanguageTitle => 'Język aplikacji';

  @override
  String get appLanguageHint =>
      'Auto używa języka urządzenia. Wybierz tutaj angielski lub francuski, aby nadpisać go tylko w aplikacji.';

  @override
  String get languageAuto => 'Auto (system)';

  @override
  String get languageAutoDescription =>
      'Automatycznie używaj języka urządzenia';

  @override
  String get languageEnglish => 'Angielski';

  @override
  String get languageEnglishDescription => 'Wymuś zawsze angielski w aplikacji';

  @override
  String get languageFrench => 'Francuski';

  @override
  String get languageFrenchDescription => 'Wymuś zawsze francuski w aplikacji';

  @override
  String get languageAutoShort => 'Auto';

  @override
  String get languageEnglishShort => 'Angielski';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'Użyj dynamicznych kolorów';

  @override
  String get themeChoiceAuto => 'Auto';

  @override
  String get themeChoiceLight => 'Jasny';

  @override
  String get themeChoiceDark => 'Ciemny';

  @override
  String get irTransmitterTitle => 'Nadajnik IR';

  @override
  String get irTransmitterSubtitle => 'Wybierz sprzęt wysyłający komendy IR';

  @override
  String get learningModeEntryTitle => 'Tryb uczenia się';

  @override
  String get learningModeEntrySubtitle =>
      'Przechwyć przycisk z fizycznego pilota krok po kroku';

  @override
  String get learningModeTitle => 'Tryb uczenia się';

  @override
  String get learningModeHeroTitle => 'Naucz się czysto zdalnego przycisku';

  @override
  String get learningModeHeroSubtitle =>
      'Skonfiguruj odbiornik, przygotuj oryginalnego pilota, przechwyć jedno polecenie, a następnie przejrzyj je przed zapisaniem w pilocie.';

  @override
  String get learningModeReadyBadge => 'Odbiornik gotowy';

  @override
  String get learningModeNeedsPermissionBadge => 'Wymagane pozwolenie na USB';

  @override
  String get learningModeSetupBadge => 'Wymagana konfiguracja odbiornika';

  @override
  String get learningModeNoReceiverBadge => 'Brak odbiornika uczącego się';

  @override
  String get learningModeCheckingBadge => 'Sprawdzanie sprzętu';

  @override
  String get learningModeFourStepFlow => '4-stopniowy przepływ z przewodnikiem';

  @override
  String get learningModeSaveAnywhereBadge => 'Przejrzyj przed zapisaniem';

  @override
  String get learningModeGuideTitle =>
      'Podnieś miejsce, w którym powinno nastąpić przechwytywanie';

  @override
  String get learningModeStepHardwareShort => 'Sprzęt komputerowy';

  @override
  String get learningModeStepPrepareShort => 'Przygotowywać';

  @override
  String get learningModeStepCaptureShort => 'Schwytać';

  @override
  String get learningModeStepReviewShort => 'Recenzja';

  @override
  String get learningModeStepHardwareTitle => 'Sprawdź sprzęt odbiornika';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Przed rozpoczęciem upewnij się, że zgodny odbiornik do nauki jest podłączony i autoryzowany.';

  @override
  String get learningModeCurrentSenderLabel => 'Przetwornik prądu';

  @override
  String get learningModeReceiverStatusLabel => 'Stan uczenia się';

  @override
  String get learningModeCheckingHardwareBody =>
      'Sprawdzanie stanu dostępnego nadajnika i odbiornika USB.';

  @override
  String get learningModeHardwareReadyBody =>
      'Klucz USB IR jest podłączony i zainicjowany. Jest to właściwe miejsce do rozpoczęcia procesu uczenia się po podłączeniu okablowania przechwytującego.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Klucz USB jest obecny, ale uprawnienia Androida nadal go blokują. Przed rozpoczęciem nauki udziel zezwolenia na USB w sekcji nadajnika.';

  @override
  String get learningModeHardwareSetupBody =>
      'Klucz sprzętowy został częściowo wykryty, ale nadal wymaga konfiguracji lub ponownego podłączenia, zanim nauka będzie mogła się rozpocząć niezawodnie.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Obecnie nie jest dostępny żaden kompatybilny odbiornik. Tryb uczenia się jest przeznaczony dla obsługiwanych zewnętrznych kluczy sprzętowych z możliwością odbioru.';

  @override
  String get learningModeRefreshHardware => 'Odśwież stan sprzętu';

  @override
  String get learningModeHardwareTipTitle => 'Najlepsze miejsce';

  @override
  String get learningModeHardwareTipBody =>
      'Tryb uczenia się podlega nadajnikowi podczerwieni, ponieważ zależy od dostępności sprzętu i jest używany rzadziej niż wysyłanie pilotów.';

  @override
  String get learningModeStepPrepareTitle => 'Przygotuj oryginalny pilot';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Zdecyduj, czego się uczysz, a następnie trzymaj oryginalnego pilota stabilnie i blisko odbiornika.';

  @override
  String get learningModeButtonNameLabel => 'Nazwa przycisku';

  @override
  String get learningModeButtonNameHint =>
      'Na przykład: HDMI 1, Zasilanie, Menu';

  @override
  String get learningModeSinglePress => 'Pojedyncze naciśnięcie';

  @override
  String get learningModeHoldButton => 'Przytrzymaj przycisk';

  @override
  String get learningModePreparationChecklistTitle => 'Zanim schwytasz';

  @override
  String get learningModePreparationItemDistance =>
      'Trzymaj oryginalny pilot w odległości około 2 do 5 cm od odbiornika.';

  @override
  String get learningModePreparationItemOneButton =>
      'Ucz się jednego przycisku na raz i najpierw używaj krótkiego, czystego naciśnięcia.';

  @override
  String get learningModePreparationItemStill =>
      'Trzymaj oba urządzenia nieruchomo, aby uniknąć zakłóceń lub częściowych przechwytów.';

  @override
  String get learningModeStepCaptureTitle => 'Przechwyć sygnał';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Posłuchaj pojedynczego polecenia, a następnie zablokuj wynik przed jego przejrzeniem.';

  @override
  String get learningModeCaptureReadyTitle => 'Gotowy do słuchania';

  @override
  String get learningModeCaptureReadyBody =>
      'Stan Twojego sprzętu wygląda dobrze. W następnym kroku moduł przechwytywania zostanie podłączony do tego kroku.';

  @override
  String get learningModeCaptureBlockedTitle =>
      'Sprzęt nie jest jeszcze gotowy';

  @override
  String get learningModeCaptureBlockedBody =>
      'Nadal możesz teraz sprawdzić przepływ, ale przechwytywanie powinno poczekać, aż odbiornik będzie gotowy.';

  @override
  String get learningModeStartListening => 'Zacznij słuchać';

  @override
  String get learningModeCaptureStubTitle =>
      'Następny jest backend przechwytywania';

  @override
  String get learningModeCaptureStubBody =>
      'Ten ekran jest najpierw w pełni rusztowany, więc ostateczny przepływ przechwytywania może zostać podłączony do rzeczywistych stanów sprzętowych, zamiast być później przykręcany.';

  @override
  String get learningModeCaptureStubMessage =>
      'Przechwytywanie uczenia się nie jest jeszcze podłączone. Ten ekran najpierw przedstawia pełny przepływ.';

  @override
  String get learningModeUnnamedCapture => 'Nienazwane przechwytywanie';

  @override
  String get learningModeStatusCheckingTitle => 'Sprawdzanie odbiornika';

  @override
  String get learningModeStatusNoReceiverTitle => 'Odbiornik nie jest gotowy';

  @override
  String get learningModeStatusPermissionTitle => 'Wymagane zezwolenie na USB';

  @override
  String get learningModeStatusSetupTitle => 'Odbiornik wymaga konfiguracji';

  @override
  String get learningModeStatusReadyTitle => 'Gotowy do nauki';

  @override
  String get learningModeStatusListeningTitle => 'Nasłuchiwanie sygnału';

  @override
  String get learningModeStatusCapturedTitle => 'Sygnał przechwycony';

  @override
  String get learningModeStatusReadyBody =>
      'Nazwij przycisk, skieruj oryginalny pilot na amplituner i zacznij słuchać, kiedy będziesz gotowy.';

  @override
  String get learningModeStatusListeningBody =>
      'Naciśnij teraz oryginalny przycisk pilota. Po podłączeniu przechwytywania stan ten zostanie zablokowany na następnym czystym sygnale.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Podgląd wyuczonego sygnału jest gotowy dla $buttonName. Odtwórz go ponownie, potwierdź, że działa, a następnie zapisz go w swojej bibliotece.';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'Podłącz kompatybilny klucz sprzętowy do nauki';

  @override
  String get learningModeConnectReceiverBody =>
      'Tryb uczenia się zależy od sprzętu zewnętrznego, który może odbierać podczerwień. Po wykryciu i autoryzacji odbiornika ta strona staje się bezpośrednim kanałem odsłuchu, testowania i zapisywania.';

  @override
  String get learningModeListenCardTitle => 'Słuchaj jednego przycisku';

  @override
  String get learningModeListenCardBody =>
      'Jeśli chcesz, najpierw ustaw etykietę, a następnie rozpocznij słuchanie i naciśnij przycisk na oryginalnym pilocie.';

  @override
  String get learningModeReadyToListenTitle => 'Gotowy do słuchania';

  @override
  String get learningModeReadyToListenBody =>
      'To jest główna powierzchnia przechwytywania. Rozpocznij słuchanie tylko wtedy, gdy oryginalny pilot jest wycelowany i stabilnie.';

  @override
  String get learningModeListeningNowTitle => 'Słucham teraz';

  @override
  String get learningModeListeningNowBody =>
      'Naciśnij raz oryginalny przycisk pilota. Użyj przechwytywania podglądu, aby poruszać się po pozostałej części szkieletu, zanim zostanie podłączony prawdziwy moduł przechwytywania.';

  @override
  String get learningModePreviewCaptureAction =>
      'Podgląd przechwyconego sygnału';

  @override
  String get learningModeCapturedSummary => 'Wyuczony podgląd sygnału';

  @override
  String get learningModeResultActionsTitle => 'Testuj i zapisuj';

  @override
  String get learningModeResultActionsBody =>
      'Odtwórz ponownie wyuczony sygnał, sprawdź, czy urządzenie docelowe reaguje, a następnie zapisz go jako przycisk wielokrotnego użytku.';

  @override
  String get learningModeReplayAction => 'Powtórna rozgrywka';

  @override
  String get learningModeReplayStubMessage =>
      'Powtórka nie jest jeszcze podłączona. To jest szkielet interfejsu użytkownika, na którym odbywa się końcowy proces uczenia się, testowania i zapisywania.';

  @override
  String get learningModeSaveStubMessage =>
      'Zapis nie jest jeszcze podłączony. Następnym krokiem jest podłączenie tego ekranu do przycisku Utwórz i istniejących pilotów.';

  @override
  String get learningModeLearnAnotherAction => 'Naucz się kolejnego przycisku';

  @override
  String get learningModeStepReviewTitle => 'Przejrzyj i zapisz';

  @override
  String get learningModeStepReviewSubtitle =>
      'Potwierdź zdobytą wiedzę, a następnie wybierz miejsce, w którym ma się ona znajdować w Twojej zdalnej bibliotece.';

  @override
  String get learningModeSaveToExistingRemote => 'Istniejący pilot';

  @override
  String get learningModeCreateNewRemote => 'Nowy pilot';

  @override
  String get learningModeProtocolPreviewTitle => 'Podgląd protokołu';

  @override
  String get learningModeProtocolPreviewBody =>
      'Zdekodowane szczegóły protokołu pojawią się tutaj, gdy odbiornik przechwyci czyste naciśnięcie przycisku.';

  @override
  String get learningModeRawPreviewTitle => 'Surowy powrót';

  @override
  String get learningModeRawPreviewBody =>
      'Jeśli dekodowanie jest niekompletne, nieprzetworzone przechwycenie taktowania będzie nadal dostępne w tym miejscu do przejrzenia i zapisania.';

  @override
  String get learningModeSaveCapture => 'Zapisz przechwytywanie';

  @override
  String get learningModeReviewTipTitle => 'Gdzie to pójdzie dalej';

  @override
  String get learningModeReviewTipBody =>
      'Następny krok wdrożenia powinien połączyć ten panel recenzji z przyciskiem Utwórz i istniejącymi pilotami, tak aby wyuczony sygnał trafiał bezpośrednio do Twojej biblioteki.';

  @override
  String get learningModeFinishPreview => 'Zakończ podgląd';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interakcja';

  @override
  String get interactionSubtitle => 'Informacja dotykowa i układ pilota';

  @override
  String get hapticFeedbackTitle => 'Informacja haptyczna';

  @override
  String get hapticFeedbackSubtitle => 'Wibruj przy stuknięciach i akcjach';

  @override
  String get forceInAppVibrationTitle => 'Force in-app vibration';

  @override
  String get forceInAppVibrationSubtitle =>
      'Use the vibrator directly even if system touch feedback is off';

  @override
  String get forceInAppVibrationWarning =>
      'Advanced option. This can make the app vibrate even when Android touch feedback is disabled globally.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'Intensywność';

  @override
  String get intensityLight => 'Lekka';

  @override
  String get intensityMedium => 'Średnia';

  @override
  String get intensityStrong => 'Mocna';

  @override
  String get flipRemoteDefaultTitle => 'Domyślnie odwróć widok pilota';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Otwieraj ekrany pilota obrócone o 180° (dla dongli USB montowanych na dole).';

  @override
  String get remoteViewFlipped => 'Widok pilota będzie otwierany odwrócony.';

  @override
  String get remoteViewNormal => 'Widok pilota będzie otwierany normalnie.';

  @override
  String get backupTitle => 'Kopia zapasowa';

  @override
  String get backupSubtitle => 'Import/eksport pilotów i makr';

  @override
  String get importBackup => 'Importuj kopię';

  @override
  String get importBackupSubtitle =>
      'Importuj kopię pilotów/makr albo pliki Flipper Zero, LIRC lub IRPLUS';

  @override
  String get bulkImportFolder => 'Importuj folder';

  @override
  String get bulkImportFolderSubtitle => 'Importuj wiele pilotów z folderu';

  @override
  String get exportBackup => 'Eksportuj kopię';

  @override
  String get exportBackupSubtitle =>
      'Zapisz piloty i makra jako jeden plik JSON do Pobranych';

  @override
  String get restoreDemoRemotes => 'Przywróć piloty demo';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Zastąp bieżące piloty wbudowanym demo';

  @override
  String get deleteAllRemotes => 'Usuń wszystkie piloty';

  @override
  String get deleteAllRemotesSubtitle =>
      'Usuń wszystkie piloty z tego urządzenia';

  @override
  String get backupTip =>
      'Wskazówka: przed większymi zmianami wyeksportuj kopię. Import obsługuje pełne kopie, starsze kopie JSON tylko z pilotami oraz pliki Flipper Zero .ir.';

  @override
  String get aboutTitle => 'O aplikacji';

  @override
  String get aboutSubtitle => 'Informacje o aplikacji i open source';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Wersja $version';
  }

  @override
  String get sourceCode => 'Kod źródłowy';

  @override
  String get viewOnGitHub => 'Zobacz na GitHubie';

  @override
  String get repositoryUrlCopied => 'URL repo skopiowany';

  @override
  String get reportIssue => 'Zgłoś problem';

  @override
  String get reportIssueSubtitle => 'Zgłoszenia błędów i propozycje funkcji';

  @override
  String get issuesUrlCopied => 'URL zgłoszeń skopiowano';

  @override
  String get license => 'Licencja';

  @override
  String get openSourceLicense => 'Licencja open source';

  @override
  String get licenseUrlCopied => 'URL licencji skopiowany';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Odwiedź stronę';

  @override
  String get companyUrlCopied => 'URL firmy skopiowany';

  @override
  String get licenses => 'Licencje';

  @override
  String get openSourceLicenses => 'Licencje open source';

  @override
  String byCreator(Object creator) {
    return 'by $creator';
  }

  @override
  String get deviceControlsTitle => 'Sterowanie urządzeniem';

  @override
  String get deviceControlsSubtitle =>
      'Pokaż ulubione przyciski w systemowym panelu sterowania.';

  @override
  String get manageFavorites => 'Zarządzaj ulubionymi';

  @override
  String get manageFavoritesSubtitle =>
      'Wybierz, które przyciski pojawią się w sterowaniu urządzeniem';

  @override
  String get quickSettingsTitle => 'Szybkie ustawienia';

  @override
  String get quickSettingsSubtitle =>
      'Dodaj kafelki skrótów zasilania i głośności';

  @override
  String get configureTiles => 'Skonfiguruj kafelki';

  @override
  String get configureTilesSubtitle => 'Przypisz kafelki do przycisków pilota';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Uniwersalne przełączanie zasilania dla własnych urządzeń';

  @override
  String get openTvKill => 'Otwórz TVKill';

  @override
  String get openTvKillSubtitle =>
      'Przełączaj kody zasilania (używaj tylko na własnych urządzeniach)';

  @override
  String get failedToLoadTransmitterSettings =>
      'Nie udało się wczytać ustawień nadajnika.';

  @override
  String get usbStatusReady =>
      'Dongiel USB jest podłączony i gotowy do wysyłania IR.';

  @override
  String get usbStatusPermissionRequired =>
      'Wykryto dongiel USB. Poproś o uprawnienie USB i zaakceptuj monit systemowy.';

  @override
  String get usbStatusPermissionDenied =>
      'Dla podłączonego dongla odmówiono uprawnienia USB. Poproś ponownie i zaakceptuj monit.';

  @override
  String get usbStatusPermissionGranted =>
      'Uprawnienie USB zostało przyznane. Dongiel nadal musi zostać zainicjowany, zanim będzie mógł wysyłać IR.';

  @override
  String get usbStatusOpenFailed =>
      'Uprawnienie USB zostało przyznane, ale nie udało się zainicjować dongla. Podłącz go ponownie i spróbuj jeszcze raz.';

  @override
  String get usbStatusNoDevice => 'Nie wykryto obsługiwanego dongla USB IR.';

  @override
  String get usbSelectPermissionRequired =>
      'Wykryto dongiel USB, ale nie został autoryzowany. Stuknij \"Poproś o uprawnienie USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'Odmówiono uprawnienia USB. Stuknij \"Poproś o uprawnienie USB\" i zaakceptuj monit.';

  @override
  String get usbSelectPermissionGranted =>
      'Uprawnienie USB zostało przyznane, ale dongiel nie jest jeszcze zainicjowany. Spróbuj podłączyć go ponownie.';

  @override
  String get usbSelectOpenFailed =>
      'Uprawnienie USB zostało przyznane, ale nie udało się zainicjować dongla. Podłącz go ponownie i spróbuj jeszcze raz.';

  @override
  String get usbSelectNoDevice =>
      'Nie wykryto obsługiwanego dongla USB IR. Plug go in, then tap \"Request uprawnienie USB\".';

  @override
  String get usbSelectReady => 'Dongiel USB jest gotowy.';

  @override
  String get autoSwitchEnabledMessage =>
      'Auto-przełączanie włączone: używa USB, gdy jest podłączone, w przeciwnym razie Wewnętrzny IR.';

  @override
  String get autoSwitchDisabledMessage =>
      'auto-przełączanie wyłączone: wybór nadajnika jest teraz ręczny.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Nie udało się zaktualizować ustawienia auto-przełączania.';

  @override
  String get failedToSwitchTransmitter => 'Nie udało się przełączyć nadajnika.';

  @override
  String get deviceHasNoInternalIr =>
      'To urządzenie nie ma wbudowanego nadajnika IR.';

  @override
  String get audioModeEnabledMessage =>
      'Tryb audio włączony. Użyj maksymalnej głośności multimediów i adaptera audio-do-IR LED.';

  @override
  String get usbPermissionRequestSent => 'Wysłano żądanie uprawnienia USB.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Wysłano żądanie uprawnienia USB. Zaakceptuj monit, aby włączyć USB.';

  @override
  String get usbAlreadyReady => 'Dongiel USB jest już zainicjowany i gotowy.';

  @override
  String get failedToRequestUsbPermission =>
      'Nie udało się poprosić o uprawnienie USB.';

  @override
  String get transmitterHelpInternal =>
      'Użyj wbudowanego nadajnika IR telefonu do wysyłania komend.';

  @override
  String get transmitterHelpUsb =>
      'Użyj dongla USB IR do wysyłania komend. Wymagane uprawnienie.';

  @override
  String get transmitterHelpAudio1 =>
      'Użyj wyjścia audio (mono). Wymaga adaptera audio-do-IR LED i wysokiej głośności multimediów.';

  @override
  String get transmitterHelpAudio2 =>
      'Użyj wyjścia audio (stereo). Wykorzystuje dwa kanały do lepszego sterowania LED z kompatybilnymi adapterami.';

  @override
  String get transmitterInternal => 'Wewnętrzny IR';

  @override
  String get transmitterUsb => 'USB IR Dongle';

  @override
  String get transmitterAudio1 => 'audio (1 LED)';

  @override
  String get transmitterAudio2 => 'audio (2 LEDs)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'nieudane do load transmitter capabilities.';

  @override
  String get selectedTransmitter => 'Wybrany nadajnik';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Active: $active';
  }

  @override
  String get refresh => 'Odśwież';

  @override
  String get autoSwitchTitle => 'Auto-przełączanie';

  @override
  String get autoSwitchDisabledWhileAudio => 'Wyłączone w trybie audio';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Używa USB, gdy jest podłączone, w przeciwnym razie Wewnętrzny';

  @override
  String get unavailableOnThisDevice => 'Niedostępne na tym urządzeniu';

  @override
  String get openOnUsbAttachTitle => 'Otwórz po podłączeniu USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android may suggest opening app gdy a supported dongiel USB IR jest connected.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Aplikacja zasugeruje otwarcie IR Blaster po podłączeniu obsługiwanego dongla USB.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Aplikacja nie będzie sugerować otwarcia po podłączeniu USB.';

  @override
  String get failedToUpdateSetting => 'Nie udało się zaktualizować ustawienia.';

  @override
  String get unnamedButton => 'Przycisk bez nazwy';

  @override
  String get iconFallback => 'Ikona';

  @override
  String get remoteListReorderHint =>
      'Reorder mode: long-press i drag a card do move go.';

  @override
  String get deleteRemoteTitle => 'Usunąć pilot?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" will be permanently removed. This action can\'t be undone.';
  }

  @override
  String get delete => 'Usuń';

  @override
  String get addToDeviceControlsTitle => 'dodaj do sterowanie urządzeniem?';

  @override
  String get addToDeviceControlsDescription =>
      'Szybki dostęp w systemowym sterowaniu urządzeniem.';

  @override
  String get skip => 'Pomiń';

  @override
  String get add => 'Dodaj';

  @override
  String get addedToDeviceControls => 'Dodano do sterowania urządzeniem.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Usunięto \"$name\". This action can\'t be undone.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count przycisków',
      many: '$count przycisków',
      few: '$count przyciski',
      one: '$count przycisk',
    );
    return '$_temp0 · $layout';
  }

  @override
  String get layoutComfort => 'Wygodny';

  @override
  String get layoutCompact => 'Kompaktowy';

  @override
  String get open => 'Otwórz';

  @override
  String get useThisRemote => 'Użyj tego pilota';

  @override
  String get edit => 'Edytuj';

  @override
  String get editRemoteSubtitle => 'Rename, i edytuj przyciski';

  @override
  String get thisCannotBeUndone => 'Tego nie można cofnąć';

  @override
  String get searchRemotes => 'Szukaj pilotów';

  @override
  String get reorderRemotes => 'Zmień kolejność pilotów';

  @override
  String get addRemote => 'Dodaj pilot';

  @override
  String get more => 'Więcej';

  @override
  String get reorderMode => 'Tryb zmiany kolejności';

  @override
  String remoteButtonCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count przycisków',
      many: '$count przycisków',
      few: '$count przyciski',
      one: '$count przycisk',
    );
    return '$_temp0';
  }

  @override
  String get noRemotesYet => 'Brak pilotów';

  @override
  String get noRemotesDescription =>
      'Utwórz pilot, aby zacząć wysyłać kody IR.';

  @override
  String get noRemotesNextStep =>
      'Co dalej: stuknij Dodaj pilot, a potem dodaj pierwsze przyciski.';

  @override
  String get actions => 'Działania';

  @override
  String get macrosTitle => 'Makra';

  @override
  String get help => 'Pomoc';

  @override
  String get createMacro => 'Utwórz makro';

  @override
  String get timedMacrosTitle => 'Makra czasowe';

  @override
  String get timedMacrosSubtitle =>
      'Automatyzuj sekwencje komend IR z dokładnym czasowaniem';

  @override
  String get timedMacrosNextStep =>
      'Co dalej: stuknij Utwórz pierwsze makro, wybierz pilot, a potem dodaj komendy i opóźnienia.';

  @override
  String get macroFeatureToysTitle => 'Idealne do interaktywnych zabawek';

  @override
  String get macroFeatureToysDescription =>
      'Steruj urządzeniami takimi jak robotyczne psy i-cybie, roboty i-sobot i inne zabawki, które potrzebują czasu między komendami, aby przetworzyć akcje.';

  @override
  String get macroFeatureTimingTitle => 'Precyzyjna kontrola czasu';

  @override
  String get macroFeatureTimingDescription =>
      'Dodawaj opóźnienia między komendami (od 250 ms do własnych wartości), aby urządzenie miało czas na reakcję przed następną akcją.';

  @override
  String get macroFeatureManualTitle => 'Kroki z ręcznym wznowieniem';

  @override
  String get macroFeatureManualDescription =>
      'Wstrzymaj wykonanie i czekaj na potwierdzenie, gdy długość animacji się zmienia lub potrzebujesz wizualnej kontroli.';

  @override
  String get exampleUseCase => 'Przykład użycia';

  @override
  String get macroExampleText =>
      'i-cybie Advanced Mode:\n1. wyślij \"Mode\" komenda\n2. Wait 1000ms (toy processes)\n3. wyślij \"Action 1\"\n4. Wait 1000ms\n5. wyślij \"Action 2\"\n…i so na automatically!';

  @override
  String get createFirstMacro => 'Utwórz pierwsze makro';

  @override
  String get noRemote => 'Brak pilota';

  @override
  String macroStepCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kroków',
      many: '$count kroków',
      few: '$count kroki',
      one: '$count krok',
    );
    return '$_temp0';
  }

  @override
  String get aboutTimedMacros => 'O makrach czasowych';

  @override
  String get aboutTimedMacrosDescription =>
      'Makra czasowe pozwalają automatyzować sekwencje komend IR z precyzyjnymi opóźnieniami między krokami.';

  @override
  String get sendCommand => 'Wyślij komendę';

  @override
  String get sendCommandDescription => 'Wysyła komendę IR z twojego pilota.';

  @override
  String get delay => 'Opóźnienie';

  @override
  String get delayDescription =>
      'Czeka określony czas (np. 1000 ms) przed następnym krokiem.';

  @override
  String get manualContinue => 'Ręczne kontynuowanie';

  @override
  String get manualContinueDescription =>
      'Wstrzymuje wykonanie, dopóki nie stukniesz Kontynuuj (przydatne przy animacjach o zmiennej długości).';

  @override
  String get gotIt => 'Rozumiem';

  @override
  String get failedToSaveMacros => 'Nie udało się zapisać makr.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Usunięto \"$name\".';
  }

  @override
  String get undo => 'Cofnij';

  @override
  String get failedToRestoreMacro => 'Nie udało się przywrócić makra.';

  @override
  String get deleteMacroTitle => 'Usunąć makro?';

  @override
  String get deleteMacroMessage =>
      'Możesz do cofnąć z następnego paska powiadomienia.';

  @override
  String get noRemotesAvailable => 'Brak dostępnych pilotów.';

  @override
  String remoteButtonCountSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count przycisków',
      many: '$count przycisków',
      few: '$count przyciski',
      one: '$count przycisk',
    );
    return '$_temp0';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Orientacja: odwrócona (stuknij, aby przywrócić normalną)';

  @override
  String get remoteOrientationNormalTooltip =>
      'Orientacja: normalna (stuknij, aby odwrócić)';

  @override
  String get stopLoop => 'Zatrzymaj pętlę';

  @override
  String get reorderButtons => 'Zmień kolejność przycisków';

  @override
  String get remoteReorderHint =>
      'Reorder mode: long-press i drag a przycisk do move go.';

  @override
  String get manageRemote => 'Zarządzaj pilotem';

  @override
  String get remoteNoButtons => 'Brak przycisków w tym pilocie';

  @override
  String get remoteNoButtonsDescription =>
      'Użyj „Edytuj pilot\", aby dodać lub skonfigurować przyciski.';

  @override
  String get editRemote => 'Edytuj pilot';

  @override
  String get editRemoteActionsSubtitle =>
      'Zmień nazwę, kolejność i edytuj przyciski';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Zaktualizowano \"$name\".';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Dodano \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Przycisk zduplikowany.';

  @override
  String get loopRunningForButton => 'Dla tego przycisku działa pętla.';

  @override
  String get loopTip => 'Wskazówka: użyj pętli, aby powtarzać do zatrzymania.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Kod skopiowany.';

  @override
  String get copyCode => 'Kopiuj kod';

  @override
  String get startLoop => 'Uruchom pętlę';

  @override
  String get editButtonSubtitle =>
      'Zmień etykietę, kod, protokół i częstotliwość';

  @override
  String get newButton => 'Nowy przycisk';

  @override
  String get newButtonSubtitle => 'Utwórz nowy przycisk po tym';

  @override
  String get duplicate => 'Duplikuj';

  @override
  String get duplicateButtonSubtitle => 'Utwórz kopię tego przycisku';

  @override
  String get removeFromDeviceControls => 'Usuń ze sterowania urządzeniem';

  @override
  String get addToDeviceControls => 'Dodaj do sterowania urządzeniem';

  @override
  String get deviceControlsButtonSubtitle =>
      'Pokazuje ten przycisk w systemowym sterowaniu urządzeniem';

  @override
  String get removedFromDeviceControls => 'Usunięto ze sterowania urządzeniem.';

  @override
  String get pinQuickTile => 'Przypnij do ulubionych kafelków';

  @override
  String get unpinQuickTile => 'Odepnij z ulubionych kafelków';

  @override
  String get quickTileButtonSubtitle =>
      'Pokazuje ten przycisk na górze wyboru szybkich kafelków';

  @override
  String get removedFromQuickTileFavorites =>
      'Usunięto z ulubionych szybkich kafelków.';

  @override
  String get pinnedToQuickTileFavorites =>
      'Przypięto do ulubionych szybkich kafelków.';

  @override
  String get duplicateAndEdit => 'Duplikuj i edytuj';

  @override
  String get duplicateAndEditSubtitle => 'Utwórz kopię i od razu ją edytuj';

  @override
  String get done => 'Gotowe';

  @override
  String get run => 'Uruchom';

  @override
  String get untitledRemote => 'Pilot bez nazwy';

  @override
  String get createRemoteTitle => 'Utwórz pilot';

  @override
  String get editRemoteTitle => 'Edytuj pilot';

  @override
  String get removeButtonTitle => 'usuń przycisk?';

  @override
  String get imageButtonRemovedMessage =>
      'Ten przycisk obrazu zostanie usunięty.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" will be removed.';
  }

  @override
  String get remove => 'Usuń';

  @override
  String importedButtonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count przycisków',
      many: '$count przycisków',
      few: '$count przyciski',
      one: '$count przycisk',
    );
    return 'Zaimportowano $_temp0.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count przycisków',
      many: '$count przycisków',
      few: '$count przyciski',
      one: '$count przycisk',
    );
    return 'Zaimportowano $_temp0 z istniejących pilotów.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Change etykieta, signal, i advanced ustawienia';

  @override
  String get createButtonCopySubtitle => 'Utwórz kopię tego przycisku';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Utwórz kopię i od razu ją edytuj';

  @override
  String get undoAvailableInNextSnackbar =>
      'Możesz do cofnąć z następnego paska powiadomienia';

  @override
  String get buttonRemoved => 'Przycisk usunięty.';

  @override
  String get remoteNameCannotBeEmpty => 'Nazwa pilota nie może być pusta.';

  @override
  String get saveRemote => 'Zapisz pilot';

  @override
  String get remoteName => 'Nazwa pilota';

  @override
  String get remoteNameHint => 'np. TV, klimatyzator, pasek LED';

  @override
  String get remoteNameHelper => 'Ta nazwa pojawia się na liście Piloty.';

  @override
  String get layoutStyle => 'Układ';

  @override
  String get layoutWideDescription =>
      'Szeroki: przyciski w 2 kolumnach z dodatkowymi szczegółami (zalecane).';

  @override
  String get layoutCompactDescription =>
      'Kompaktowy: klasyczna siatka 4× (tylko ikony/tekst).';

  @override
  String get importFromRemotes => 'Import z pilotów';

  @override
  String get importFromDatabase => 'Import z bazy';

  @override
  String get addButton => 'Dodaj przycisk';

  @override
  String get noButtonsYet => 'Brak przycisków';

  @override
  String get createRemoteEmptyStateDescription =>
      'Dodaj pierwszy przycisk, a potem przytrzymaj go, aby edytować lub usunąć.';

  @override
  String get createButtonTitle => 'Utwórz przycisk';

  @override
  String get editButtonTitle => 'Edytuj przycisk';

  @override
  String failedToLoadProtocols(Object error) {
    return 'nieudane do load protokoły: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'nieudane do load baza danych klawisze: $error';
  }

  @override
  String get presetPower => 'Zasilanie';

  @override
  String get presetVolume => 'głośność';

  @override
  String get presetChannel => 'Kanał';

  @override
  String get presetNavigation => 'Nawigacja';

  @override
  String get all => 'Wszystko';

  @override
  String get completeRequiredFieldsToSave =>
      'Uzupełnij wymagane pola, aby zapisać';

  @override
  String get buttonLabelStepTitle => 'Etykieta przycisku';

  @override
  String get buttonLabelStepSubtitle =>
      'Wybierz obraz, ikonę lub wpisz etykietę tekstową.';

  @override
  String get buttonColorStepTitle => 'Kolor przycisku';

  @override
  String get buttonColorStepSubtitle => 'Wybierz kolor tła dla tego przycisku.';

  @override
  String get selectColor => 'Wybierz kolor:';

  @override
  String get noImageSelected => 'Nie wybrano obrazu';

  @override
  String get gallery => 'Galeria';

  @override
  String get builtIn => 'Built-in';

  @override
  String get removeImage => 'usuń obraz';

  @override
  String get requiredSelectImageOrSwitch =>
      'Wymagane: wybierz obraz, ikonę lub przełącz na Tekst.';

  @override
  String get iconSelected => 'Wybrano ikonę';

  @override
  String get noIconSelected => 'Nie wybrano ikony';

  @override
  String get chooseIcon => 'Wybierz ikona';

  @override
  String get removeIcon => 'usuń ikona';

  @override
  String get requiredSelectIconOrSwitch =>
      'Wymagane: wybierz ikonę lub przełącz na Obraz/Tekst.';

  @override
  String get buttonText => 'przycisk tekst';

  @override
  String get buttonTextHint => 'e.g., zasilanie, głośność +, HDMI 1';

  @override
  String get buttonTextHelper => 'This tekst will appear na przycisk.';

  @override
  String get requiredEnterButtonLabel => 'Required: enter a przycisk etykieta.';

  @override
  String get defaultColorName => 'Domyślny';

  @override
  String get newRemoteCreatedFromLastHit =>
      'New pilot created z one przycisk from last hit.';

  @override
  String get selectRemote => 'Select pilot';

  @override
  String remoteNumber(Object id) {
    return 'Pilot nr $id';
  }

  @override
  String get newRemoteCreated => 'New pilot created.';

  @override
  String get failedToCreateRemote => 'nieudane do utwórz pilot.';

  @override
  String get newRemoteEllipsis => 'New pilot…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Added do $name.';
  }

  @override
  String get failedToAddToRemote => 'nieudane do dodaj do pilot.';

  @override
  String get newRemoteDefaultName => 'New pilot';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Jumped do offset $offset. wstrzymano — press wznów do kontynuuj.';
  }

  @override
  String get sent => 'Sent.';

  @override
  String failedToSend(Object error) {
    return 'nieudane do wyślij: $error';
  }

  @override
  String get copiedProtocolCode => 'skopiowano (protokół:kod).';

  @override
  String get savedToResults => 'Saved do Results.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Invalid kod dla protokół: $error';
  }

  @override
  String get copiedCurrentCandidate => 'skopiowano current candidate.';

  @override
  String get jumpToOffset => 'Jump do offset';

  @override
  String get jumpToBruteCursor => 'Jump do brute cursor';

  @override
  String get jump => 'Jump';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Jumped do cursor 0x$cursor. wstrzymano — press wznów do kontynuuj.';
  }

  @override
  String get irSignalTester => 'IR Signal Tester';

  @override
  String get stop => 'stop';

  @override
  String get selectButton => 'Select przycisk';

  @override
  String get buttonNotFoundInRemotes => 'przycisk nie znaleziono in piloty.';

  @override
  String sentNamed(Object name) {
    return 'Sent \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'wyślij nieudane: $error';
  }

  @override
  String get noFavoritesYet => 'No ulubione jeszcze';

  @override
  String get deviceControlsEmptyHint =>
      'Long-press a pilot przycisk i select \"dodaj do sterowanie urządzeniem\".';

  @override
  String get sendTest => 'wyślij test';

  @override
  String get testSendCompleted => 'Test wyślij ukończono.';

  @override
  String testSendFailed(Object error) {
    return 'Test wyślij nieudane: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Removed \"$name\".';
  }

  @override
  String get brand => 'Marka';

  @override
  String get model => 'model';

  @override
  String get selectBrand => 'Wybierz markę';

  @override
  String get searchBrand => 'szukaj marka…';

  @override
  String get selectModel => 'Wybierz model';

  @override
  String get searchModel => 'szukaj model…';

  @override
  String get unnamedKey => 'Unnamed klawisz';

  @override
  String get unknown => 'Nieznane';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'szukaj komendy';

  @override
  String get noMatchingCommands => 'No matching komendy';

  @override
  String get quickTileFavoritesTitle => 'Quick kafelek ulubione';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Change mapping dla $tileLabel kafelek';
  }

  @override
  String get pickDifferentButton => 'Pick a different przycisk';

  @override
  String get browseAllRemotesEllipsis => 'Browse wszystkie piloty…';

  @override
  String get invalidMacroFileFormat => 'Invalid makro plik format.';

  @override
  String get failedToParseMacroFile => 'nieudane do parse makro plik.';

  @override
  String get deviceCodeLabel => 'urządzenie kod';

  @override
  String get commandLabel => 'komenda';

  @override
  String get editButtonCodeTitle => 'edytuj kod of przycisk';

  @override
  String get thisRemoteHasNoButtons => 'This pilot has no przyciski.';

  @override
  String get selectCommand => 'Select komenda';

  @override
  String get databaseModeAutofillHint =>
      'baza danych mode auto-fills krok 2 dla you (marka + model + protokół). After importing a klawisz, you can refine anything in Manual.';

  @override
  String get test => 'Test';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'All wybrano przyciski were duplicates.';

  @override
  String get noButtonsImported => 'No przyciski imported.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Imported $addedCount przycisk(s). Skipped $skippedCount duplicate(s).';
  }

  @override
  String get importAllMatchingTitle => 'Import wszystkie matching przyciski?';

  @override
  String get noMatchingKeysFound => 'No matching klawisze znaleziono.';

  @override
  String importAllMatchingMessage(int count) {
    return 'This will import up do $count matching klawisze from current baza danych selection.';
  }

  @override
  String get importAll => 'Import wszystkie';

  @override
  String get importingButtons => 'Importing przyciski…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'All matching przyciski were duplicates.';

  @override
  String get quickPresets => 'Quick presets';

  @override
  String get selectDeviceFirst => 'Select urządzenie first';

  @override
  String get searchByLabelOrHex => 'szukaj by etykieta lub hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Optional: refine $preset preset klawisze';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Select marka, model, i protokół first.';

  @override
  String get importFromDatabaseTitle => 'Import from baza danych';

  @override
  String get importFromDatabaseSubtitle =>
      'Wybierz a urządzenie, load matching klawisze, then import wybrano przyciski.';

  @override
  String get deviceAndFilters => 'urządzenie & filters';

  @override
  String loadedCount(int count) {
    return 'Wczytano $count';
  }

  @override
  String get hideFilters => 'Hide filters';

  @override
  String get showFilters => 'Pokaż filters';

  @override
  String get noProtocolFoundForBrandModel =>
      'No protokół znaleziono dla this marka i model.';

  @override
  String get protocolAutoDetected => 'Protokół';

  @override
  String get protocolAutoDetectedHelper =>
      'Wykryto automatycznie z bazy danych. Przed importem możesz to zmienić.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Select a marka, model, i protokół do load klawisze.';

  @override
  String get noKeysFound => 'Nie znaleziono klawiszy.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Nie znaleziono klawiszy dla \"$query\".';
  }

  @override
  String get skipDuplicates => 'Pomiń duplikaty';

  @override
  String get skipDuplicatesSubtitle =>
      'Nie importuj przycisków, które już istnieją w tym pilocie.';

  @override
  String get importSelected => 'Importuj wybrane';

  @override
  String get noMacrosToExport => 'Brak makr do eksportu.';

  @override
  String get macrosExportedToDownloads => 'Wyeksportowano makra do Pobranych.';

  @override
  String get failedToExportMacros => 'Nie udało się wyeksportować makr.';

  @override
  String get failedToReadFile => 'Nie udało się odczytać pliku.';

  @override
  String get importFromExistingRemotesTitle => 'Import z istniejących pilotów';

  @override
  String selectedCount(int count) {
    return 'Wybrano $count';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Nie znaleziono innych pilotów z przyciskami.';

  @override
  String get sourceRemote => 'Pilot źródłowy';

  @override
  String get searchButtons => 'Szukaj przycisków';

  @override
  String get searchButtonsHint => 'zasilanie, głośność, mute...';

  @override
  String get selectVisible => 'Wybierz widoczne';

  @override
  String get clearVisible => 'Wyczyść widoczne';

  @override
  String protocolNamed(Object name) {
    return 'Protokół: $name';
  }

  @override
  String get rawSignal => 'Raw';

  @override
  String get legacyCode => 'Legacy kod';

  @override
  String importCount(int count) {
    return 'Import $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Storage permission denied (needed na some older Android urządzenia).';

  @override
  String get backupExportedToDownloads => 'Backup exported do Downloads.';

  @override
  String failedToExport(Object error) {
    return 'nieudane do export: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Zaimportowano $count pilotów ze starszej kopii zapasowej JSON. Makra nie zostały zmienione.',
      many:
          'Zaimportowano $count pilotów ze starszej kopii zapasowej JSON. Makra nie zostały zmienione.',
      few:
          'Zaimportowano $count piloty ze starszej kopii zapasowej JSON. Makra nie zostały zmienione.',
      one:
          'Zaimportowano $count pilot ze starszej kopii zapasowej JSON. Makra nie zostały zmienione.',
    );
    return '$_temp0';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Import nieudane: backup \"piloty\" must be a JSON liście gdy present.';

  @override
  String get importFailedMacrosMustBeList =>
      'Import nieudane: backup \"makra\" must be a JSON liście gdy present.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Import nieudane: invalid backup format (expected legacy List lub Map z piloty/makra).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    String _temp0 = intl.Intl.pluralLogic(
      remoteCount,
      locale: localeName,
      other:
          'Zaimportowano $remoteCount pilotów z kopii zapasowej. Makra nie zostały zmienione.',
      many:
          'Zaimportowano $remoteCount pilotów z kopii zapasowej. Makra nie zostały zmienione.',
      few:
          'Zaimportowano $remoteCount piloty z kopii zapasowej. Makra nie zostały zmienione.',
      one:
          'Zaimportowano $remoteCount pilot z kopii zapasowej. Makra nie zostały zmienione.',
    );
    return '$_temp0';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    String _temp0 = intl.Intl.pluralLogic(
      remoteCount,
      locale: localeName,
      other: '$remoteCount pilotów',
      many: '$remoteCount pilotów',
      few: '$remoteCount piloty',
      one: '$remoteCount pilot',
    );
    String _temp1 = intl.Intl.pluralLogic(
      macroCount,
      locale: localeName,
      other: '$macroCount makr',
      many: '$macroCount makr',
      few: '$macroCount makra',
      one: '$macroCount makro',
    );
    return 'Zaimportowano $_temp0 i $_temp1 z kopii zapasowej.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Import nieudane: no valid przyciski znaleziono in.ir plik.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Imported 1 pilot from Flipper.ir. makra were nie changed.';

  @override
  String get importFailedInvalidIrplus =>
      'Import nieudane: invalid irplus plik (no valid przyciski znaleziono).';

  @override
  String get importedOneRemoteFromIrplus =>
      'Imported 1 pilot from irplus. makra were nie changed.';

  @override
  String get importFailedInvalidLirc =>
      'Import nieudane: invalid LIRC plik (no valid kody/raw kody znaleziono).';

  @override
  String get importedOneRemoteFromLirc =>
      'Imported 1 pilot from LIRC config. makra were nie changed.';

  @override
  String get unsupportedFileTypeSelected => 'Unsupported plik type wybrano.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Import nieudany: plik jest nieprawidłowy lub nieczytelny.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Import zbiorczy zakończony: nie znaleziono w folderze obsługiwanych plików.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Import zbiorczy zakończony: nie zaimportowano żadnych pilotów. Pominięto $skippedCount plik(i).';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Import zbiorczy zakończony: zaimportowano $importedCount pilot(y) z $supportedCount obsługiwanych plików. Pominięto $skippedCount plik(i).';
  }

  @override
  String get storagePermissionDenied => 'Odmówiono uprawnienia do pamięci.';

  @override
  String get bulkImportFailedReadFolder =>
      'Import zbiorczy nieudany: nie można odczytać zawartości folderu.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Import zbiorczy zakończony: nie znaleziono obsługiwanych plików ($sourceLabel).';
  }

  @override
  String get clearAction => 'Wyczyść';

  @override
  String get saveAction => 'Zapisz';

  @override
  String buttonsTitleCount(int count) {
    return 'Przyciski ($count)';
  }

  @override
  String get invalidStepEncountered => 'Napotkano nieprawidłowy krok';

  @override
  String failedToSendNamed(Object name) {
    return 'Nie udało się wysłać: $name';
  }

  @override
  String get buttonNotFound => 'Nie znaleziono przycisku';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Nie znaleziono przycisku: $name';
  }

  @override
  String get unknownButton => 'Nieznany przycisk';

  @override
  String durationSecondsShort(int seconds) {
    return '${seconds}s';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '${minutes}m ${seconds}s';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String get orientationFlippedTooltip =>
      'Orientacja: odwrócona (stuknij, aby przywrócić normalną)';

  @override
  String get orientationNormalTooltip =>
      'Orientacja: normalna (stuknij, aby odwrócić)';

  @override
  String get noSteps => 'Brak kroków';

  @override
  String stepProgress(int current, int total) {
    return 'Krok $current / $total';
  }

  @override
  String get completed => 'Zakończono';

  @override
  String get paused => 'Wstrzymano';

  @override
  String get running => 'Trwa';

  @override
  String get ready => 'Gotowe';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total kroków';
  }

  @override
  String get waiting => 'Oczekiwanie';

  @override
  String secondsRemaining(Object seconds) {
    return 'Pozostało ${seconds}s';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Stuknij Kontynuuj, gdy będziesz gotowy na kolejny krok';

  @override
  String get error => 'Błąd';

  @override
  String get macroCompleted => 'Makro ukończone';

  @override
  String finishedIn(Object duration) {
    return 'Ukończono w $duration';
  }

  @override
  String get sequence => 'Sekwencja';

  @override
  String waitMilliseconds(int ms) {
    return 'Czekaj $ms ms';
  }

  @override
  String get runAgain => 'Uruchom ponownie';

  @override
  String get startMacro => 'Uruchom makro';

  @override
  String get continueAction => 'Kontynuuj';

  @override
  String get unnamedRemote => 'Pilot bez nazwy';

  @override
  String get enterMacroName => 'Wpisz nazwę makra';

  @override
  String get addAtLeastOneStep => 'Dodaj co najmniej jeden krok';

  @override
  String get fixInvalidSteps => 'Popraw błędne kroki';

  @override
  String get unknownCommand => 'Nieznana komenda';

  @override
  String get unnamedCommand => 'Komenda bez nazwy';

  @override
  String get iconCommand => 'Komenda ikony';

  @override
  String get selectDelay => 'Wybierz opóźnienie';

  @override
  String keepMilliseconds(int ms) {
    return 'Zachowaj: $ms ms';
  }

  @override
  String get custom => 'Własne';

  @override
  String get enterCustomDelayDuration => 'Wpisz własne opóźnienie';

  @override
  String millisecondsLong(int ms) {
    return '$ms milisekund';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds sekund$plural';
  }

  @override
  String get customDelay => 'Własne opóźnienie';

  @override
  String get delayMillisecondsLabel => 'Opóźnienie (ms)';

  @override
  String get delayMillisecondsHint => 'e.g., 3000';

  @override
  String get recommendedDelayRange =>
      'Zalecane: 250-5000 ms dla większości urządzeń';

  @override
  String get enterValidPositiveNumber => 'Wpisz poprawną dodatnią liczbę';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Pilot';

  @override
  String get macroName => 'Nazwa makra';

  @override
  String get macroNameHint => 'np. i-cybie Advanced Mode';

  @override
  String stepsTitleCount(int count) {
    return 'kroki ($count)';
  }

  @override
  String get noStepsYet => 'Brak kroków';

  @override
  String get addCommandsAndDelaysHint =>
      'Dodaj poniżej komendy i opóźnienia, aby zbudować sekwencję';

  @override
  String get addStep => 'Dodaj krok';

  @override
  String get reorderStepsHint =>
      'Wskazówka: przeciągnij uchwyt, aby zmienić kolejność kroków. Stuknij krok, aby go edytować.';

  @override
  String reorderStep(int index) {
    return 'Zmień kolejność kroku $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Naciśnij i przeciągnij, aby zmienić kolejność kroków';

  @override
  String deleteStep(int index) {
    return 'Usuń krok $index';
  }

  @override
  String get invalidStepTapToFix =>
      'Nieprawidłowy krok — stuknij, aby poprawić';

  @override
  String get sendIrCommand => 'Wyślij komendę IR';

  @override
  String get waitForUserConfirmation => 'Czekaj na potwierdzenie użytkownika';

  @override
  String get notImplemented => 'Niezaimplementowano';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Szeroki';

  @override
  String get iconButton => 'Przycisk ikony';

  @override
  String get imageButton => 'Przycisk obrazu';

  @override
  String get noSignalInfo => 'Brak informacji o sygnale';

  @override
  String get proceed => 'Kontynuuj';

  @override
  String get discard => 'Odrzuć';

  @override
  String get continueEditing => 'Continue editing';

  @override
  String get unsavedChangesTitle => 'Unsaved changes';

  @override
  String get unsavedMacroChangesMessage =>
      'Discard your macro changes and leave this screen?';

  @override
  String get stopMacroBeforeLeaving =>
      'Stop the macro before leaving this screen.';

  @override
  String get stopTestingBeforeLeaving =>
      'Stop testing before leaving this screen.';

  @override
  String get idle => 'Bezczynny';

  @override
  String get start => 'Start';

  @override
  String get resume => 'Wznów';

  @override
  String get pause => 'Wstrzymaj';

  @override
  String get stopped => 'Zatrzymano';

  @override
  String get copy => 'Kopiuj';

  @override
  String get send => 'Wyślij';

  @override
  String get step => 'Krok';

  @override
  String get addToRemote => 'Dodaj do pilota';

  @override
  String get noDescriptionAvailable => 'Brak opisu.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Kaseikyo vendor must be exactly 4 hex digits.';

  @override
  String get irFinderDatabaseNotReady => 'Baza danych nie jest jeszcze gotowa.';

  @override
  String get irFinderSelectBrandFirst =>
      'Najpierw wybierz markę w Konfiguracji.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute force nie jest jeszcze dostępne dla tego protokołu.';

  @override
  String get irFinderInvalidPrefix => 'Nieprawidłowy prefiks.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Marka: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'model: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Klawisz: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Pilot nr $value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Wpisz indeks od 0 w przefiltrowanych, uporządkowanych wynikach bazy.';

  @override
  String get irFinderJumpCursorHelper =>
      'Wpisz kursor szesnastkowy od 0 w przestrzeni brute force.';

  @override
  String get irFinderSetupTab => 'Konfiguracja';

  @override
  String get irFinderTestTab => 'Test';

  @override
  String get irFinderResultsTab => 'Wyniki';

  @override
  String get irFinderContinueToTest => 'Przejdź do testu';

  @override
  String get irFinderKaseikyoVendorTitle => 'Dostawca Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'Własny dostawca (4 hex)';

  @override
  String get irFinderBrowseDbCandidates => 'Przeglądaj kandydatów z bazy…';

  @override
  String get irFinderEditSetup => 'Edytuj konfigurację';

  @override
  String get irFinderNoSavedHits =>
      'Brak zapisanych trafień. Na stronie Test stuknij \"Zapisz trafienie\", gdy urządzenie zareaguje.';

  @override
  String get irFinderBackToTest => 'Wróć do testu';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Duża przestrzeń wyszukiwania';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Ta przestrzeń brute force jest bardzo duża ($human możliwości). IR Finder nadal będzie respektować maksymalną liczbę prób i czas odnowienia, ale uważaj, aby nie spamować urządzeń IR. Zalecenie: najpierw użyj trybu Baza danych i/lub wpisz znane bajty prefiksu, aby zmniejszyć przestrzeń.';
  }

  @override
  String get irFinderDatabaseSession => 'Sesja bazy';

  @override
  String get irFinderBruteforceSession => 'Sesja brute force';

  @override
  String get irFinderResumeLastSession => 'Wznów ostatnią sesję';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Marka: $brand · Model: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Prefiks: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Postęp: $progress · Start: $when';
  }

  @override
  String get irFinderApplyResume => 'Zastosuj i wznów';

  @override
  String get irFinderBruteforceMode => 'Brute force';

  @override
  String get irFinderDatabaseAssistedMode => 'Wspomagane bazą';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Protokół: $name';
  }

  @override
  String get irFinderProtocolLabel => 'IR protokół';

  @override
  String get irFinderProtocolHelper =>
      'Steruje kodowaniem, a więc także przestrzenią wyszukiwania.';

  @override
  String get irFinderKnownPrefixLabel =>
      'Znany prefiks (bajty hex, opcjonalnie)';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Ładunek: $digits cyfr hex';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Ładunek: $digits cyfr hex · Przykład: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Ładunek: $digits cyfr hex · Maks. prefiks: $bytes bajt(y)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Ładunek: $digits cyfr hex · Przykład: $example · Maks. prefiks: $bytes bajt(y)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Przykład: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Wpisz znane pierwsze bajty, aby zmniejszyć przestrzeń wyszukiwania.';

  @override
  String get irFinderDatabaseMode => 'baza danych';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Znormalizowany prefiks: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Znormalizowany prefiks';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Brute force nie jest jeszcze skonfigurowane dla tego protokołu.';

  @override
  String irFinderAllLimit(Object value) {
    return 'All ($value)';
  }

  @override
  String get irFinderTestControls => 'Sterowanie testem';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Długość ładunku: $digits cyfr hex.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Przestrzeń wyszukiwania: $value możliwości (po ograniczeniach prefiksu).';
  }

  @override
  String get irFinderCooldownMs => 'Cooldown (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Maks. prób na uruchomienie';

  @override
  String get irFinderTestAllCombinations => 'Testuj wszystkie kombinacje';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Uruchamia się, aż przestrzeń wyszukiwania zostanie wyczerpana. Skuteczny limit: $value';
  }

  @override
  String get irFinderAttempts => 'Próby';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Zakres suwaka: 1–$max (wpisz dowolną liczbę dla większych wartości)';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Max\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Skuteczny limit tego uruchomienia: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Wskazówka: najpierw użyj trybu bazy danych. Brute force działa najlepiej ze znanym prefiksem, np. pierwszymi 1-4 bajtami.';

  @override
  String get irFinderDatabaseInitFailed =>
      'Inicjalizacja bazy danych nie powiodła się.';

  @override
  String get irFinderPreparingDatabase =>
      'Przygotowywanie lokalnej bazy kodów IR…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Wyszukiwanie wspomagane bazą';

  @override
  String get irFinderBrand => 'Marka';

  @override
  String get irFinderSelectBrand => 'Wybierz markę';

  @override
  String get irFinderModelOptional => 'Model (opcjonalnie)';

  @override
  String get irFinderSelectBrandFirstShort => 'Najpierw wybierz markę';

  @override
  String get irFinderSelectModelRecommended => 'Wybierz model (zalecane)';

  @override
  String get irFinderOnlySelectedProtocol => 'Tylko wybrany protokół';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Filtruje klawisze do wybranego protokołu. Wyłącz, aby przeglądać wszystkie protokoły.';

  @override
  String get irFinderQuickWinsFirst => 'Najpierw szybkie trafienia';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Nadaje priorytet klawiszom zasilania, MUTE, VOL i CH przed głębszymi klawiszami.';

  @override
  String get irFinderMaxKeysPerRun => 'Maks. klawiszy do testu na uruchomienie';

  @override
  String get irFinderTesting => 'Testowanie…';

  @override
  String get irFinderCooldown => 'Czas odnowienia';

  @override
  String get irFinderEta => 'Szacowany czas';

  @override
  String get irFinderMode => 'Tryb';

  @override
  String get irFinderRetryLast => 'Ponów ostatni';

  @override
  String get irFinderTrigger => 'Wyzwalacz';

  @override
  String get irFinderJump => 'Skocz…';

  @override
  String get irFinderSaveHit => 'Zapisz trafienie';

  @override
  String irFinderEtaSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String irFinderEtaMinutesSeconds(int minutes, int seconds) {
    return '${minutes}m ${seconds}s';
  }

  @override
  String irFinderEtaHoursMinutes(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String irFinderLastAttemptedCode(Object value) {
    return 'Ostatni sprawdzony kod: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Uruchom test, aby zobaczyć ostatnio sprawdzony kod.';

  @override
  String irFinderFromDb(Object value) {
    return 'Z bazy: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'From brute-force (generated by protokół encoder).';

  @override
  String irFinderSendError(Object error) {
    return 'Błąd wysyłania: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Source: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Results wsparcie Test i kopiuj immediately. Direct dodaj-do-pilot integration can be extended further in editor flow.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Browse DB candidates';

  @override
  String get irFinderFilterByLabelOrHex => 'Filter by etykieta lub hex…';

  @override
  String get irFinderJumpHere => 'Jump here';

  @override
  String get irFinderSelectModel => 'Wybierz model';

  @override
  String get irFinderSearchBrands => 'szukaj brands…';

  @override
  String get irFinderSearchModels => 'szukaj models…';

  @override
  String get iconPickerTitle => 'Select ikona';

  @override
  String get iconPickerSearchHint => 'szukaj ikony...';

  @override
  String get iconPickerNoIconsFound => 'No ikony znaleziono';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count dostępnych ikon';
  }

  @override
  String get iconPickerCategoryAll => 'Wszystko';

  @override
  String get iconPickerCategoryMedia => 'Media';

  @override
  String get iconPickerCategoryVolume => 'głośność';

  @override
  String get iconPickerCategoryNavigation => 'Nawigacja';

  @override
  String get iconPickerCategoryPower => 'Zasilanie';

  @override
  String get iconPickerCategoryNumbers => 'Numbers';

  @override
  String get iconPickerCategorySettings => 'Ustawienia';

  @override
  String get iconPickerCategoryDisplay => 'Display';

  @override
  String get iconPickerCategoryInput => 'Wejście';

  @override
  String get iconPickerCategoryFavorite => 'ulubiony';

  @override
  String get universalPowerTitle => 'Universal zasilanie';

  @override
  String get universalPowerRunTab => 'Uruchom';

  @override
  String get universalPowerUseResponsibly => 'Use responsibly';

  @override
  String get universalPowerConsentBody =>
      'Universal zasilanie cycles IR zasilanie kody. Use go only na urządzenia you own lub control. stop as soon as urządzenie responds.';

  @override
  String get universalPowerConsentCheckbox => 'I own lub control urządzenie';

  @override
  String get universalPowerSetupBody =>
      'Przełącza kody zasilania dla wybranej marki. Zatrzymaj, gdy tylko urządzenie zareaguje.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Ostatnio wysłano: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'No zasilanie kody znaleziono. Spróbuj broadening szukaj.';

  @override
  String get universalPowerUnableToStart => 'Unable do start.';

  @override
  String get universalPowerAllBrands => 'All brands (no filter)';

  @override
  String get universalPowerClearBrandFilter => 'wyczyść marka filter';

  @override
  String get universalPowerBroadenSearch => 'Broaden szukaj if needed';

  @override
  String get universalPowerBroadenSearchHint =>
      'If no zasilanie labels są znaleziono, include other klawisze.';

  @override
  String get universalPowerAdditionalPatternsDepth =>
      'Additional patterns depth';

  @override
  String get universalPowerDepth1 => 'Priority only: zasilanie/OFF';

  @override
  String get universalPowerDepth2 => 'Include zasilanie aliases';

  @override
  String get universalPowerDepth3 => 'Include secondary zasilanie labels';

  @override
  String get universalPowerDepth4 =>
      'Include wszystkie labels (lowest priority)';

  @override
  String get universalPowerLoopUntilStopped => 'pętla until zatrzymano';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Keeps cycling queue until you stop go.';

  @override
  String get universalPowerDelayBetweenCodes => 'opóźnienie between kody';

  @override
  String get universalPowerStart => 'start Universal zasilanie';

  @override
  String get universalPowerRunStatus => 'uruchom status';

  @override
  String universalPowerProgress(Object value) {
    return 'Postęp: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'wstrzymano because app was backgrounded.';

  @override
  String get universalPowerSendOneCode => 'wyślij one kod';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'stop as soon as urządzenie responds.';

  @override
  String get iconNamePlay => 'Play';

  @override
  String get iconNamePause => 'Wstrzymaj';

  @override
  String get iconNameStop => 'stop';

  @override
  String get iconNameFastForward => 'Fast Forward';

  @override
  String get iconNameRewind => 'Rewind';

  @override
  String get iconNameSkipNext => 'Skip Next';

  @override
  String get iconNameSkipPrevious => 'Skip Previous';

  @override
  String get iconNameReplay => 'Replay';

  @override
  String get iconNameForward10S => 'Forward 10s';

  @override
  String get iconNameForward30S => 'Forward 30s';

  @override
  String get iconNameReplay10S => 'Replay 10s';

  @override
  String get iconNameReplay30S => 'Replay 30s';

  @override
  String get iconNameRecord => 'Record';

  @override
  String get iconNameRecordAlt => 'Record Alt';

  @override
  String get iconNameEject => 'Eject';

  @override
  String get iconNameShuffle => 'Shuffle';

  @override
  String get iconNameRepeat => 'Repeat';

  @override
  String get iconNameRepeatOne => 'Repeat One';

  @override
  String get iconNameVolumeUp => 'Głośniej';

  @override
  String get iconNameVolumeDown => 'Ciszej';

  @override
  String get iconNameVolumeOff => 'Głośność wył.';

  @override
  String get iconNameMute => 'Wycisz';

  @override
  String get iconNameSpeaker => 'Speaker';

  @override
  String get iconNameSurroundSound => 'Dźwięk przestrzenny';

  @override
  String get iconNameEqualizer => 'Equalizer';

  @override
  String get iconNameAudio => 'Audio';

  @override
  String get iconNameMicrophone => 'Mikrofon';

  @override
  String get iconNameMicOff => 'Mikrofon wył.';

  @override
  String get iconNameUp => 'Góra';

  @override
  String get iconNameDown => 'Dół';

  @override
  String get iconNameLeft => 'Lewo';

  @override
  String get iconNameRight => 'Prawo';

  @override
  String get iconNameArrowUp => 'Strzałka w górę';

  @override
  String get iconNameArrowDown => 'Strzałka w dół';

  @override
  String get iconNameArrowLeft => 'Strzałka w lewo';

  @override
  String get iconNameArrowRight => 'Strzałka w prawo';

  @override
  String get iconNameNavigation => 'Nawigacja';

  @override
  String get iconNameChevronLeft => 'Szewron lewo';

  @override
  String get iconNameChevronRight => 'Szewron prawo';

  @override
  String get iconNameExpandLess => 'Zwiń mniej';

  @override
  String get iconNameExpandMore => 'Rozwiń więcej';

  @override
  String get iconNameCollapse => 'Zwiń';

  @override
  String get iconNameExpand => 'Rozwiń';

  @override
  String get iconNameCircleUp => 'Okrąg góra';

  @override
  String get iconNameCircleDown => 'Okrąg dół';

  @override
  String get iconNameCircleLeft => 'Okrąg lewo';

  @override
  String get iconNameCircleRight => 'Okrąg prawo';

  @override
  String get iconNameOkSelect => 'OK/Wybierz';

  @override
  String get iconNameConfirm => 'Potwierdź';

  @override
  String get iconNameCancel => 'Anuluj';

  @override
  String get iconNameClose => 'Zamknij';

  @override
  String get iconNameHome => 'Home';

  @override
  String get iconNameReturn => 'Powrót';

  @override
  String get iconNameExit => 'Wyjście';

  @override
  String get iconNameUndo => 'Cofnij';

  @override
  String get iconNameRedo => 'Ponów';

  @override
  String get iconNamePower => 'Zasilanie';

  @override
  String get iconNamePowerAlt => 'Zasilanie alt';

  @override
  String get iconNamePowerOff => 'Wyłącz';

  @override
  String get iconNameOn => 'Wł.';

  @override
  String get iconNameOff => 'Wył.';

  @override
  String get iconNameToggleOn => 'Przełącz wł.';

  @override
  String get iconNameToggleOff => 'Przełącz wył.';

  @override
  String get iconNameRestart => 'Restart';

  @override
  String get iconNameNum1 => '1';

  @override
  String get iconNameNum2 => '2';

  @override
  String get iconNameNum3 => '3';

  @override
  String get iconNameNum4 => '4';

  @override
  String get iconNameNum5 => '5';

  @override
  String get iconNameNum6 => '6';

  @override
  String get iconNameNum7 => '7';

  @override
  String get iconNameNum8 => '8';

  @override
  String get iconNameNum9 => '9';

  @override
  String get iconNameNum92 => '9+';

  @override
  String get iconNameNum0 => '0';

  @override
  String get iconNameOne => 'Jeden';

  @override
  String get iconNameTwo => 'Dwa';

  @override
  String get iconNameThree => 'Trzy';

  @override
  String get iconNameFour => 'Cztery';

  @override
  String get iconNameFive => 'Pięć';

  @override
  String get iconNameSix => 'Sześć';

  @override
  String get iconNamePlus => 'Plus';

  @override
  String get iconNameMinus => 'Minus';

  @override
  String get iconNameAddCircle => 'Dodaj okrąg';

  @override
  String get iconNameRemoveCircle => 'Usuń okrąg';

  @override
  String get iconNameSettings => 'Ustawienia';

  @override
  String get iconNameMenu => 'Menu';

  @override
  String get iconNameMoreVertical => 'Więcej pionowo';

  @override
  String get iconNameMoreHorizontal => 'Więcej poziomo';

  @override
  String get iconNameTune => 'Dostrój';

  @override
  String get iconNameRemoteSettings => 'Ustawienia pilota';

  @override
  String get iconNameInfo => 'Info';

  @override
  String get iconNameInfoOutline => 'Info obrys';

  @override
  String get iconNameHelp => 'Pomoc';

  @override
  String get iconNameHelpOutline => 'Pomoc obrys';

  @override
  String get iconNameList => 'Lista';

  @override
  String get iconNameViewList => 'Widok listy';

  @override
  String get iconNameViewGrid => 'Widok siatki';

  @override
  String get iconNameApps => 'Aplikacje';

  @override
  String get iconNameWidgets => 'Widgety';

  @override
  String get iconNameTv => 'TV';

  @override
  String get iconNameMonitor => 'Monitor';

  @override
  String get iconNameDesktop => 'Pulpit';

  @override
  String get iconNameBrightnessHigh => 'Jasność wysoka';

  @override
  String get iconNameBrightnessMedium => 'Jasność średnia';

  @override
  String get iconNameBrightnessLow => 'Jasność niska';

  @override
  String get iconNameAutoBrightness => 'Auto jasność';

  @override
  String get iconNameLightMode => 'Tryb jasny';

  @override
  String get iconNameDarkMode => 'Tryb ciemny';

  @override
  String get iconNameContrast => 'Kontrast';

  @override
  String get iconNameHdrOn => 'HDR wł.';

  @override
  String get iconNameHdrOff => 'HDR wył.';

  @override
  String get iconNameAspectRatio => 'Proporcje';

  @override
  String get iconNameCrop => 'Przytnij';

  @override
  String get iconNameZoomIn => 'Powiększ';

  @override
  String get iconNameZoomOut => 'Pomniejsz';

  @override
  String get iconNameFullscreen => 'Pełny ekran';

  @override
  String get iconNameExitFullscreen => 'Wyjdź z pełnego ekranu';

  @override
  String get iconNameFitScreen => 'Dopasuj ekran';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'Swobodne kadrowanie';

  @override
  String get iconNameInput => 'Wejście';

  @override
  String get iconNameCable => 'Kabel';

  @override
  String get iconNameCast => 'Cast';

  @override
  String get iconNameCastConnected => 'Cast połączony';

  @override
  String get iconNameScreenShare => 'Udostępnij ekran';

  @override
  String get iconNameBluetooth => 'Bluetooth';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => 'Router';

  @override
  String get iconNameMemory => 'Pamięć';

  @override
  String get iconNameGameConsole => 'Konsola';

  @override
  String get iconNameGaming => 'Gry';

  @override
  String get iconNameMedia => 'Media';

  @override
  String get iconNameMusicQueue => 'Kolejka muzyki';

  @override
  String get iconNameVideoLibrary => 'Biblioteka wideo';

  @override
  String get iconNamePhotoLibrary => 'Biblioteka zdjęć';

  @override
  String get iconNameComponent => 'Komponent';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => 'Composite';

  @override
  String get iconNameAntenna => 'Antenna';

  @override
  String get iconNameFavorite => 'ulubiony';

  @override
  String get iconNameFavoriteOutline => 'ulubiony Outline';

  @override
  String get iconNameStar => 'Star';

  @override
  String get iconNameStarOutline => 'Star Outline';

  @override
  String get iconNameBookmark => 'Bookmark';

  @override
  String get iconNameBookmarkOutline => 'Bookmark Outline';

  @override
  String get iconNameFlag => 'Flag';

  @override
  String get iconNameCheck => 'Check';

  @override
  String get iconNameDone => 'Gotowe';

  @override
  String get iconNameDoneAll => 'Done All';

  @override
  String get iconNameSchedule => 'Schedule';

  @override
  String get iconNameTimer => 'Timer';

  @override
  String get iconNameTime => 'Time';

  @override
  String get iconNameAlarm => 'Alarm';

  @override
  String get iconNameNotifications => 'Notifications';

  @override
  String get iconNameLock => 'Lock';

  @override
  String get iconNameUnlock => 'Unlock';

  @override
  String get iconNameLight => 'Jasny';

  @override
  String get iconNameLightOutline => 'jasny Outline';

  @override
  String get iconNameWarmLight => 'Warm jasny';

  @override
  String get iconNameSunny => 'Sunny';

  @override
  String get iconNameCloudy => 'Cloudy';

  @override
  String get iconNameNight => 'Night';

  @override
  String get iconNameFlare => 'Flare';

  @override
  String get iconNameGradient => 'Gradient';

  @override
  String get iconNameInvertColors => 'Invert Colors';

  @override
  String get iconNamePalette => 'Palette';

  @override
  String get iconNameColor => 'Color';

  @override
  String get iconNameTonality => 'Tonality';

  @override
  String get iconNameSearch => 'szukaj';

  @override
  String get iconNameRefresh => 'Odśwież';

  @override
  String get iconNameSync => 'Sync';

  @override
  String get iconNameUpdate => 'Update';

  @override
  String get iconNameDownload => 'Download';

  @override
  String get iconNameUpload => 'Upload';

  @override
  String get iconNameCloud => 'Cloud';

  @override
  String get iconNameFolder => 'folder';

  @override
  String get iconNameDelete => 'Usuń';

  @override
  String get iconNameEdit => 'Edytuj';

  @override
  String get iconNameSave => 'Zapisz';

  @override
  String get iconNameShare => 'Share';

  @override
  String get iconNamePrint => 'Print';

  @override
  String get iconNameLanguage => 'język';

  @override
  String get iconNameTranslate => 'Translate';

  @override
  String get iconNameMicNone => 'Mic None';

  @override
  String get iconNameSubtitles => 'Subtitles';

  @override
  String get iconNameClosedCaption => 'Closed Caption';

  @override
  String get iconNameMusic => 'Music';

  @override
  String get iconNameMovie => 'Movie';

  @override
  String get iconNameTheater => 'Theater';

  @override
  String get iconNameLiveTv => 'Live TV';

  @override
  String get iconNameRadio => 'Radio';

  @override
  String get iconNameCamera => 'Camera';

  @override
  String get iconNameVideoCamera => 'Video Camera';

  @override
  String get iconNamePhotoCamera => 'Photo Camera';

  @override
  String get iconNameSlowMotion => 'Slow Motion';

  @override
  String get iconNameSpeed => 'Speed';

  @override
  String get iconNameVideoSettings => 'Video ustawienia';

  @override
  String get iconNameAudioTrack => 'audio Track';

  @override
  String get iconNameGraphicEq => 'Graphic EQ';

  @override
  String get iconNameMusicVideo => 'Music Video';

  @override
  String get iconNamePlaylist => 'Playlist';

  @override
  String get iconNameQueue => 'Queue';

  @override
  String get iconNameNum0Fa => '0 FA';

  @override
  String get iconNameNum1Fa => '1 FA';

  @override
  String get iconNameNum2Fa => '2 FA';

  @override
  String get iconNameNum3Fa => '3 FA';

  @override
  String get iconNameNum4Fa => '4 FA';

  @override
  String get iconNameNum5Fa => '5 FA';

  @override
  String get iconNameNum6Fa => '6 FA';

  @override
  String get iconNameNum7Fa => '7 FA';

  @override
  String get iconNameNum8Fa => '8 FA';

  @override
  String get iconNameNum9Fa => '9 FA';

  @override
  String get iconNameHashFa => 'Hash # FA';

  @override
  String get iconNamePercentFa => 'Percent % FA';

  @override
  String get iconNameDivideFa => 'Divide ÷ FA';

  @override
  String get iconNameMultiplyFa => 'Multiply × FA';

  @override
  String get iconNameEqualsFa => 'Equals = FA';

  @override
  String get iconNameNotEqualFa => 'Not Equal ≠ FA';

  @override
  String get iconNameGreaterThanFa => 'Greater Than > FA';

  @override
  String get iconNameLessThanFa => 'Less Than < FA';

  @override
  String get iconNameAsteriskFa => 'Asterisk * FA';

  @override
  String get iconNameAFa => 'A FA';

  @override
  String get iconNameBFa => 'B FA';

  @override
  String get iconNameCFa => 'C FA';

  @override
  String get iconNameDFa => 'D FA';

  @override
  String get iconNameEFa => 'E FA';

  @override
  String get iconNameFFa => 'F FA';

  @override
  String get iconNameGFa => 'G FA';

  @override
  String get iconNameHFa => 'H FA';

  @override
  String get iconNameIFa => 'I FA';

  @override
  String get iconNameJFa => 'J FA';

  @override
  String get iconNameKFa => 'K FA';

  @override
  String get iconNameLFa => 'L FA';

  @override
  String get iconNameMFa => 'M FA';

  @override
  String get iconNameNFa => 'N FA';

  @override
  String get iconNameOFa => 'O FA';

  @override
  String get iconNamePFa => 'P FA';

  @override
  String get iconNameQFa => 'Q FA';

  @override
  String get iconNameRFa => 'R FA';

  @override
  String get iconNameSFa => 'S FA';

  @override
  String get iconNameTFa => 'T FA';

  @override
  String get iconNameUFa => 'U FA';

  @override
  String get iconNameVFa => 'V FA';

  @override
  String get iconNameWFa => 'W FA';

  @override
  String get iconNameXFa => 'X FA';

  @override
  String get iconNameYFa => 'Y FA';

  @override
  String get iconNameZFa => 'Z FA';

  @override
  String get iconNamePlayFa => 'Play FA';

  @override
  String get iconNamePauseFa => 'wstrzymaj FA';

  @override
  String get iconNameStopFa => 'stop FA';

  @override
  String get iconNamePlayFaOutline => 'Play FA Outline';

  @override
  String get iconNamePauseFaOutline => 'wstrzymaj FA Outline';

  @override
  String get iconNameStopFaOutline => 'stop FA Outline';

  @override
  String get iconNameBackwardFa => 'Backward FA';

  @override
  String get iconNameForwardFa => 'Forward FA';

  @override
  String get iconNamePreviousFa => 'Previous FA';

  @override
  String get iconNameNextFa => 'Next FA';

  @override
  String get iconNameRewindFa => 'Rewind FA';

  @override
  String get iconNameFastForwardFa => 'Fast Forward FA';

  @override
  String get iconNameRepeatFa => 'Repeat FA';

  @override
  String get iconNameShuffleFa => 'Shuffle FA';

  @override
  String get iconNameEjectFa => 'Eject FA';

  @override
  String get iconNameFilmFa => 'Film FA';

  @override
  String get iconNameVideoFa => 'Video FA';

  @override
  String get iconNameMusicFa => 'Music FA';

  @override
  String get iconNameMicrophoneFa => 'Microphone FA';

  @override
  String get iconNameCameraFa => 'Camera FA';

  @override
  String get iconNameCameraRetroFa => 'Camera Retro FA';

  @override
  String get iconNameVolumeHighFa => 'głośność High FA';

  @override
  String get iconNameVolumeLowFa => 'głośność Low FA';

  @override
  String get iconNameVolumeOffFa => 'głośność Off FA';

  @override
  String get iconNameMuteFa => 'Mute FA';

  @override
  String get iconNameMicMuteFa => 'Mic Mute FA';

  @override
  String get iconNameHeadphonesFa => 'Headphones FA';

  @override
  String get iconNameSpeakerFa => 'Speaker FA';

  @override
  String get iconNameUpFa => 'Up FA';

  @override
  String get iconNameDownFa => 'Down FA';

  @override
  String get iconNameLeftFa => 'Left FA';

  @override
  String get iconNameRightFa => 'Right FA';

  @override
  String get iconNameUpFaOutline => 'Up FA Outline';

  @override
  String get iconNameDownFaOutline => 'Down FA Outline';

  @override
  String get iconNameLeftFaOutline => 'Left FA Outline';

  @override
  String get iconNameRightFaOutline => 'Right FA Outline';

  @override
  String get iconNameArrowUpFa => 'Arrow Up FA';

  @override
  String get iconNameArrowDownFa => 'Arrow Down FA';

  @override
  String get iconNameArrowLeftFa => 'Arrow Left FA';

  @override
  String get iconNameArrowRightFa => 'Arrow Right FA';

  @override
  String get iconNameChevronUpFa => 'Chevron Up FA';

  @override
  String get iconNameChevronDownFa => 'Chevron Down FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron Left FA';

  @override
  String get iconNameChevronRightFa => 'Chevron Right FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Outline';

  @override
  String get iconNameCheckFa => 'Check FA';

  @override
  String get iconNameCloseFa => 'zamknij FA';

  @override
  String get iconNameCloseCircleFa => 'zamknij Circle FA';

  @override
  String get iconNameHomeFa => 'Home FA';

  @override
  String get iconNameUndoFa => 'Undo FA';

  @override
  String get iconNameRedoFa => 'Redo FA';

  @override
  String get iconNameRotateFa => 'Rotate FA';

  @override
  String get iconNameSearchFa => 'szukaj FA';

  @override
  String get iconNameRefreshFa => 'odśwież FA';

  @override
  String get iconNamePowerOffFa => 'zasilanie Off FA';

  @override
  String get iconNamePlugFa => 'Plug FA';

  @override
  String get iconNameToggleOnFa => 'Toggle On FA';

  @override
  String get iconNameToggleOffFa => 'Toggle Off FA';

  @override
  String get iconNameSettingsFa => 'ustawienia FA';

  @override
  String get iconNameSettingsAltFa => 'ustawienia Alt FA';

  @override
  String get iconNameMenuFa => 'Menu FA';

  @override
  String get iconNameMoreFa => 'More FA';

  @override
  String get iconNameMoreVerticalFa => 'More Vertical FA';

  @override
  String get iconNameInfoFa => 'Info FA';

  @override
  String get iconNameInfoFaOutline => 'Info FA Outline';

  @override
  String get iconNameHelpFa => 'pomoc FA';

  @override
  String get iconNameHelpFaOutline => 'pomoc FA Outline';

  @override
  String get iconNameListFa => 'List FA';

  @override
  String get iconNameGridFa => 'Grid FA';

  @override
  String get iconNameSlidersFa => 'Sliders FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'Monitor FA';

  @override
  String get iconNameDesktopFa => 'Desktop FA';

  @override
  String get iconNameBrightnessFa => 'Brightness FA';

  @override
  String get iconNameNightModeFa => 'Night Mode FA';

  @override
  String get iconNameLightFa => 'jasny FA';

  @override
  String get iconNameLightFaOutline => 'jasny FA Outline';

  @override
  String get iconNameFlashFa => 'Flash FA';

  @override
  String get iconNameFullscreenFa => 'Fullscreen FA';

  @override
  String get iconNameExitFullscreenFa => 'Exit Fullscreen FA';

  @override
  String get iconNameZoomInFa => 'Zoom In FA';

  @override
  String get iconNameZoomOutFa => 'Zoom Out FA';

  @override
  String get iconNameSubtitlesFa => 'Subtitles FA';

  @override
  String get iconNamePictureInPictureFa => 'Picture in Picture FA';

  @override
  String get iconNameColorFa => 'Color FA';

  @override
  String get iconNamePaintFa => 'Paint FA';

  @override
  String get iconNameInputFa => 'Input FA';

  @override
  String get iconNameWifiFa => 'WiFi FA';

  @override
  String get iconNameBluetoothFa => 'Bluetooth FA';

  @override
  String get iconNameUsbFa => 'USB FA';

  @override
  String get iconNameEthernetFa => 'Ethernet FA';

  @override
  String get iconNameGamepadFa => 'Gamepad FA';

  @override
  String get iconNameBroadcastFa => 'Broadcast FA';

  @override
  String get iconNameSatelliteFa => 'Satellite FA';

  @override
  String get iconNameAntennaFa => 'Antenna FA';

  @override
  String get iconNameNetworkFa => 'Network FA';

  @override
  String get iconNameCloudFa => 'Cloud FA';

  @override
  String get iconNameStarFa => 'Star FA';

  @override
  String get iconNameStarFaOutline => 'Star FA Outline';

  @override
  String get iconNameHeartFa => 'Heart FA';

  @override
  String get iconNameHeartFaOutline => 'Heart FA Outline';

  @override
  String get iconNameBookmarkFa => 'Bookmark FA';

  @override
  String get iconNameBookmarkFaOutline => 'Bookmark FA Outline';

  @override
  String get iconNameFlagFa => 'Flag FA';

  @override
  String get iconNameClockFa => 'Clock FA';

  @override
  String get iconNameClockFaOutline => 'Clock FA Outline';

  @override
  String get iconNameBellFa => 'Bell FA';

  @override
  String get iconNameBellFaOutline => 'Bell FA Outline';

  @override
  String get iconNameTimerFa => 'Timer FA';

  @override
  String get iconNameLockFa => 'Lock FA';

  @override
  String get iconNameUnlockFa => 'Unlock FA';

  @override
  String get iconNameGalleryFa => 'Gallery FA';

  @override
  String get iconNameImagesFa => 'obrazy FA';

  @override
  String get iconNameImageFa => 'obraz FA';

  @override
  String get iconNameVideoFileFa => 'Video plik FA';

  @override
  String get iconNameAudioFileFa => 'audio plik FA';

  @override
  String get iconNamePlayOutlineFa => 'Play Outline FA';

  @override
  String get iconNamePlaySimpleFa => 'Play Simple FA';

  @override
  String get iconNamePauseSimpleFa => 'wstrzymaj Simple FA';

  @override
  String get iconNameStopSimpleFa => 'stop Simple FA';

  @override
  String get iconNameRecordFa => 'Record FA';

  @override
  String get iconNameStopCircleFa => 'stop Circle FA';

  @override
  String get iconNameLoadingFa => 'Loading FA';

  @override
  String get iconNameTextFa => 'tekst FA';

  @override
  String get iconNameTextSizeFa => 'tekst Size FA';

  @override
  String get iconNameLanguageFa => 'język FA';

  @override
  String get iconNameGlobeFa => 'Globe FA';

  @override
  String get iconNameSubtitlesAltFa => 'Subtitles Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Subtitles Alt Outline FA';

  @override
  String get iconNameChannelUpFa => 'kanał Up FA';

  @override
  String get iconNameChannelDownFa => 'kanał Down FA';

  @override
  String get iconNamePageUpFa => 'Page Up FA';

  @override
  String get iconNamePageDownFa => 'Page Down FA';

  @override
  String get iconNameGuideFa => 'Guide FA';

  @override
  String get iconNameGridViewFa => 'Grid View FA';

  @override
  String get iconNameGridAltFa => 'Grid Alt FA';

  @override
  String get iconNameScheduleFa => 'Schedule FA';

  @override
  String get iconNameCalendarFa => 'Calendar FA';

  @override
  String get iconNameRedButtonFa => 'Red przycisk FA';

  @override
  String get iconNameButtonOutlineFa => 'przycisk Outline FA';

  @override
  String get iconNameSquareButtonFa => 'Square przycisk FA';

  @override
  String get iconNameSquareOutlineFa => 'Square Outline FA';

  @override
  String get iconNameDotCircleFa => 'Dot Circle FA';

  @override
  String get iconNameToolsFa => 'Tools FA';

  @override
  String get iconNameScrewdriverFa => 'Screwdriver FA';

  @override
  String get iconNameHammerFa => 'Hammer FA';

  @override
  String get iconNameToolboxFa => 'Toolbox FA';

  @override
  String get iconNameCogFa => 'Cog FA';

  @override
  String get iconNameAdjustFa => 'Adjust FA';

  @override
  String get iconNameFilterFa => 'Filter FA';

  @override
  String get iconNameSortDownFa => 'Sort Down FA';

  @override
  String get iconNameSortUpFa => 'Sort Up FA';

  @override
  String get iconNameSleepFa => 'Sleep FA';

  @override
  String get iconNameTimerStartFa => 'Timer start FA';

  @override
  String get iconNameTimerHalfFa => 'Timer Half FA';

  @override
  String get iconNameTimerEndFa => 'Timer End FA';

  @override
  String get iconNameStopwatchFa => 'Stopwatch FA';

  @override
  String get iconNameAlarmFa => 'Alarm FA';

  @override
  String get iconNameCropAltFa => 'Crop Alt FA';

  @override
  String get iconNameCropFa => 'Crop FA';

  @override
  String get iconNameSquareFullFa => 'Square Full FA';

  @override
  String get iconNameFullscreenAltFa => 'Fullscreen Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Zoom Plus FA';

  @override
  String get iconNameZoomMinusFa => 'Zoom Minus FA';

  @override
  String get iconNameMusicNoteFa => 'Music Note FA';

  @override
  String get iconNameCdFa => 'CD FA';

  @override
  String get iconNameVinylFa => 'Vinyl FA';

  @override
  String get iconNameRssFa => 'RSS FA';

  @override
  String get iconNameMagicFa => 'Magic FA';

  @override
  String get iconNameFingerprintFa => 'Fingerprint FA';

  @override
  String get iconNameUserFa => 'User FA';

  @override
  String get iconNameUsersFa => 'Users FA';

  @override
  String get iconNameChildModeFa => 'Child Mode FA';

  @override
  String get iconNameCastFa => 'Cast FA';

  @override
  String get iconNameStreamFa => 'Stream FA';

  @override
  String get iconNameSignalFa => 'Signal FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => 'Circle Arrow Up FA';

  @override
  String get iconNameCircleArrowDownFa => 'Circle Arrow Down FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Circle Arrow Left FA';

  @override
  String get iconNameCircleArrowRightFa => 'Circle Arrow Right FA';

  @override
  String get iconNameLongArrowUpFa => 'Long Arrow Up FA';

  @override
  String get iconNameLongArrowDownFa => 'Long Arrow Down FA';

  @override
  String get iconNameLongArrowLeftFa => 'Long Arrow Left FA';

  @override
  String get iconNameLongArrowRightFa => 'Long Arrow Right FA';

  @override
  String get iconNamePlusFa => 'Plus FA';

  @override
  String get iconNameMinusFa => 'Minus FA';

  @override
  String get iconNamePlusCircleFa => 'Plus Circle FA';

  @override
  String get iconNameMinusCircleFa => 'Minus Circle FA';

  @override
  String get iconNamePlusSquareFa => 'Plus Square FA';

  @override
  String get iconNameMinusSquareFa => 'Minus Square FA';

  @override
  String get iconNameTimesFa => 'Times FA';

  @override
  String get iconNameTimesCircleFa => 'Times Circle FA';

  @override
  String get iconNameBatteryFullFa => 'Battery Full FA';

  @override
  String get iconNameBattery34Fa => 'Battery 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'Battery Half FA';

  @override
  String get iconNameBattery14Fa => 'Battery 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'Battery Empty FA';

  @override
  String get iconNameChargingFa => 'Charging FA';

  @override
  String get iconNameCloudSunFa => 'Cloud Sun FA';

  @override
  String get iconNameCloudMoonFa => 'Cloud Moon FA';

  @override
  String get iconNameRainFa => 'Rain FA';

  @override
  String get iconNameSnowflakeFa => 'Snowflake FA';

  @override
  String get iconNameFireFa => 'Fire FA';

  @override
  String get iconNameTemperatureFa => 'Temperature FA';

  @override
  String get iconNameBoxFa => 'Box FA';

  @override
  String get iconNameGiftFa => 'Gift FA';

  @override
  String get iconNameTrophyFa => 'Trophy FA';

  @override
  String get iconNameCrownFa => 'Crown FA';

  @override
  String get iconNameGemFa => 'Gem FA';

  @override
  String get unknownLabel => 'Nieznane';

  @override
  String get selectedFilesLabel => 'wybrane pliki';

  @override
  String get folderNotFoundOrInaccessible =>
      'folder nie znaleziono lub inaccessible.';

  @override
  String get importedRemoteDefaultName => 'ImportedRemote';

  @override
  String get demoRemoteName => 'Demo pilot';

  @override
  String get protocolFieldsInvalid =>
      'Fill required protokół fields i ensure częstotliwość jest 15k–60k if set.';

  @override
  String get unknownProtocolSelected => 'Wybrano nieznany protokół.';

  @override
  String get continueSectionTitle => 'Continue';

  @override
  String get continueSectionSubtitle => 'Pick up where you left off.';

  @override
  String get continueLastRemoteTitle => 'Last remote';

  @override
  String get continueLastMacroTitle => 'Last macro';

  @override
  String get continueLastIrFinderHitTitle => 'Last IR Finder hit';

  @override
  String get continueTargetUnavailable => 'That item is no longer available.';

  @override
  String get continueUniversalPowerAllBrands => 'All brands';

  @override
  String get untitledMacro => 'Untitled Macro';

  @override
  String get pinnedRemotesTitle => 'Pinned remotes';

  @override
  String get pinnedRemotesSubtitle =>
      'Keep your most important remotes one tap away.';

  @override
  String get recentlyUsedRemotesTitle => 'Recently used';

  @override
  String get recentlyUsedRemotesSubtitle =>
      'Jump back into the remotes you opened most recently.';

  @override
  String get pinRemote => 'Pin remote';

  @override
  String get unpinRemote => 'Unpin remote';

  @override
  String get pinRemoteSubtitle =>
      'Keep this remote at the top for faster access.';

  @override
  String get remoteAddedToPinned => 'Remote pinned.';

  @override
  String get remoteRemovedFromPinned => 'Remote removed from pinned.';

  @override
  String get homeDeviceControlsTitle => 'Quick controls';

  @override
  String get homeDeviceControlsSubtitle =>
      'Power, mute, and volume without opening a remote.';

  @override
  String get homeDeviceControlsEmptySubtitle =>
      'Set up power, mute, and volume buttons in Device Controls.';

  @override
  String get showDeviceControlsOnHome => 'Show quick controls on home';

  @override
  String get showDeviceControlsOnHomeSubtitle =>
      'Show the compact Power, Mute, and Volume row on the main screen.';

  @override
  String get homeDeviceControlsShown => 'Quick controls shown on home.';

  @override
  String get homeDeviceControlsHidden => 'Quick controls hidden from home.';

  @override
  String get power => 'Power';

  @override
  String get mute => 'Mute';

  @override
  String get volumeUp => 'Vol +';

  @override
  String get volumeDown => 'Vol -';

  @override
  String get manage => 'Manage';

  @override
  String get hide => 'Hide';

  @override
  String get lastActionTitle => 'Last action';

  @override
  String lastActionSent(String title) {
    return 'Sent $title';
  }

  @override
  String lastActionSentTo(String remoteName, String title) {
    return 'Sent $remoteName -> $title';
  }

  @override
  String get repeatAction => 'Repeat';

  @override
  String get globalSearchTitle => 'Search everything';

  @override
  String get globalSearchNoResults => 'No results found.';

  @override
  String get globalSearchTypeRemote => 'REMOTE';

  @override
  String get globalSearchTypeButton => 'BUTTON';

  @override
  String get globalSearchTypeMacro => 'MACRO';

  @override
  String get learningModeCaptureFailed =>
      'Przechwytywanie nauki nie powiodło się.';

  @override
  String get learningModeReplaySent => 'Wyuczony sygnał został odtworzony.';

  @override
  String get learningModeReplayFailed =>
      'Wyuczony sygnał nie mógł zostać odtworzony.';

  @override
  String get learningModeNoRemotesAvailable =>
      'Nie ma jeszcze zapisanych pilotów.';

  @override
  String get learningModeChooseRemoteTitle => 'Wybierz pilota';

  @override
  String get learningModeNewRemoteTitle => 'Utwórz nowego pilota';

  @override
  String get learningModeSaveSuccess => 'Wyuczony przycisk został zapisany.';

  @override
  String get learningModeSaveFailed =>
      'Nie można zapisać wyuczonego przycisku.';

  @override
  String get remoteSetupIntro =>
      'Najpierw wybierz nazwę i układ. Przyciski możesz dodać później.';

  @override
  String get startWithDefault => 'Zacznij od domyślnych ustawień';

  @override
  String get browseGithubStore => 'Przeglądaj GitHub Store';

  @override
  String get addFirstButton => 'Dodaj pierwszy przycisk';

  @override
  String get moreWaysToStart => 'Więcej sposobów rozpoczęcia';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Odrzucić konfigurację nowego pilota i opuścić ten ekran?';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Odrzucić zmiany pilota i opuścić ten ekran?';

  @override
  String get firstButtonAdded => 'Dodano pierwszy przycisk.';

  @override
  String get iconColorTitle => 'Kolor ikony';

  @override
  String get iconColorHelper =>
      'Wybierz kolor symbolu, który pozostanie wyraźny na tle przycisku.';

  @override
  String get colorRed => 'Czerwony';

  @override
  String get colorPink => 'Różowy';

  @override
  String get colorPurple => 'Fioletowy';

  @override
  String get colorDeepPurple => 'Ciemny fiolet';

  @override
  String get colorIndigo => 'Indygo';

  @override
  String get colorBlue => 'Niebieski';

  @override
  String get colorLightBlue => 'Jasnoniebieski';

  @override
  String get colorCyan => 'Cyjan';

  @override
  String get colorTeal => 'Turkusowy';

  @override
  String get colorGreen => 'Zielony';

  @override
  String get colorLightGreen => 'Jasnozielony';

  @override
  String get colorLime => 'Limonkowy';

  @override
  String get colorYellow => 'Żółty';

  @override
  String get colorAmber => 'Bursztynowy';

  @override
  String get colorOrange => 'Pomarańczowy';

  @override
  String get colorDeepOrange => 'Ciemnopomarańczowy';

  @override
  String get colorBrown => 'Brązowy';

  @override
  String get colorGrey => 'Szary';

  @override
  String get colorBlueGrey => 'Niebieskoszary';

  @override
  String get colorBlack => 'Czarny';

  @override
  String get colorWhite => 'Biały';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Kolor przycisku $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Kolor przycisku $colorName, wybrany';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Kolor ikony $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Kolor ikony $colorName, wybrany';
  }

  @override
  String get irWaveformTitle => 'IR waveform';

  @override
  String irWaveformPulseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pulses',
      one: '$count pulse',
    );
    return '$_temp0';
  }

  @override
  String irWaveformGapLabel(String duration) {
    return 'Gap $duration';
  }

  @override
  String irWaveformDurationCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count durations',
      one: '$count duration',
    );
    return '$_temp0';
  }

  @override
  String get irWaveformActiveHint =>
      'High means the IR LED carrier is active; low means silence.';

  @override
  String get irWaveformOnLabel => 'ON';

  @override
  String get irWaveformOffLabel => 'OFF';
}
