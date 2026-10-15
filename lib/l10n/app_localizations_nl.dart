// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Laden…';

  @override
  String get unknownError => 'Onbekende fout';

  @override
  String get failedToStart => 'Start mislukt';

  @override
  String get retry => 'Opnieuw';

  @override
  String get quickTilePower => 'Aan/uit';

  @override
  String get quickTileMute => 'Dempen';

  @override
  String get quickTileVolumeUp => 'Volume +';

  @override
  String get quickTileVolumeDown => 'Volume -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'USB-IR-adapter gevonden. Sta USB-toegang toe om opdrachten te verzenden.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'USB-toegang is geweigerd. Vraag opnieuw toestemming en sta toegang toe om opdrachten te verzenden.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'USB-toegang is toegestaan, maar de adapter is nog niet klaar.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Er is toestemming, maar verbinden met de USB-adapter is niet gelukt. Koppel hem los, sluit hem opnieuw aan en probeer het nogmaals.';

  @override
  String get homeUsbReadyMessage => 'USB-IR-adapter klaar.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Deze telefoon heeft geen ingebouwde IR-zender en er is geen ondersteunde USB-IR-adapter aangesloten.';

  @override
  String get homeUsbOptionPlugIn =>
      'Sluit een ondersteunde USB-IR-adapter aan en sta toegang toe.';

  @override
  String get homeUsbOptionReady => 'Klaar om te verzenden.';

  @override
  String get homeUsbOptionPermissionRequired =>
      'Aangesloten. Sta USB-toegang toe.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Toegang geweigerd. Vraag opnieuw toestemming.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Toegang toegestaan. Wachten op de adapter.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Verbinding mislukt. Sluit de adapter opnieuw aan.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Geen ingebouwde IR-zender. Gebruik een compatibele USB-IR-adapter of een audio-IR-accessoire.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Aangesloten. Sta USB-toegang toe.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Toegang geweigerd. Vraag opnieuw toestemming.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Toegang toegestaan. Wachten op de adapter.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Verbinding mislukt. Sluit de adapter opnieuw aan.';

  @override
  String get homeHardwareBannerReady => 'Klaar om te verzenden.';

  @override
  String get homeHardwareRequiredTitle => 'IR-zender nodig';

  @override
  String get homeUsbDongleRecommended => 'USB-IR-adapter (aanbevolen)';

  @override
  String get homeAudioAdapterAlternative => 'Audio-IR-adapter';

  @override
  String get homeAudioAdapterDescription =>
      'Een audio-IR-adapter is nodig. Kies Audio (1 of 2 leds) in de instellingen en zet het mediavolume hoger.';

  @override
  String get close => 'Sluiten';

  @override
  String get homeChooseTransmitter => 'Zender kiezen';

  @override
  String get openSettings => 'Open Instellingen';

  @override
  String get homeUsbPermissionSentApprove =>
      'Toestemming gevraagd. Sta USB-toegang toe in het Android-venster.';

  @override
  String get homeUsbDongleNotDetected =>
      'Geen ondersteunde USB-IR-adapter gevonden. Sluit hem aan en probeer het opnieuw.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Kan geen USB-toegang aanvragen. Probeer het opnieuw.';

  @override
  String get working => 'Bezig…';

  @override
  String get requestUsbPermission => 'USB-toegang vragen';

  @override
  String get homeHardwareTip =>
      'Je kunt je afstandsbedieningen alvast instellen. Een IR-zender is alleen nodig om opdrachten te verzenden.';

  @override
  String get homeNoIrTransmitterTitle => 'Geen IR-zender beschikbaar';

  @override
  String get homeHardwareRequiredBody =>
      'Zonder IR-zender kun je al afstandsbedieningen maken en ordenen. Gebruik een van de onderstaande opties om een apparaat te bedienen.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Je kunt nog steeds afstandsbedieningen maken, importeren en ordenen.';

  @override
  String get homeWaysToUseIrBlaster => 'Hardwareopties';

  @override
  String get homeBuiltInIrOptionTitle => 'Ingebouwde IR-zender';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Sommige telefoons hebben een ingebouwde IR-zender. Deze telefoon heeft er geen.';

  @override
  String get homeBuiltInIrUnavailable => 'Niet ingebouwd in deze telefoon';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'Audio-IR-adapter';

  @override
  String get homeContinueWithoutHardware => 'Doorgaan zonder zenden';

  @override
  String get homeHowItWorks => 'Hoe werkt het?';

  @override
  String get settingsNavLabel => 'Instellingen';

  @override
  String get dismiss => 'Sluiten';

  @override
  String get remotesNavLabel => 'Afstandsbedieningen';

  @override
  String get macrosNavLabel => 'Macro\'s';

  @override
  String get signalTesterNavLabel => 'Signaaltester';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get remoteNoIrEmitterTitle => 'IR-zender niet beschikbaar';

  @override
  String get remoteNoIrEmitterMessage =>
      'Er is geen bruikbare IR-zender gevonden.';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Om signalen te versturen heb je een ingebouwde IR-zender of een geschikte externe zender nodig.';

  @override
  String get remoteDismiss => 'Verder bekijken';

  @override
  String get remoteClose => 'App sluiten';

  @override
  String remoteFailedToSend(Object error) {
    return 'IR verzenden mislukt: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Lus starten mislukt: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Lus gestopt verzenden mislukt: $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Lus \"$title\". Tik bovenaan op Stop om te stoppen.';
  }

  @override
  String get remoteLoopStopped => 'Lus gestopt.';

  @override
  String get remoteUpdatedNotFound =>
      'Afstandsbediening op scherm bijgewerkt. Niet gevonden in de opgeslagen lijst.';

  @override
  String remoteUpdatedNamed(Object name) {
    return '\"$name\" bijgewerkt.';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'De afstandsbediening kon niet worden verwijderd: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'Deze afstandsbediening staat niet in de opgeslagen lijst.';

  @override
  String remoteDeletedNamed(Object name) {
    return '‘$name’ verwijderd.';
  }

  @override
  String get buttonFallbackTitle => 'Knop';

  @override
  String get imageFallbackTitle => 'Afbeelding';

  @override
  String get noBrowserAvailable => 'Geen browser beschikbaar';

  @override
  String failedToOpen(Object error) {
    return 'Openen mislukt: $error';
  }

  @override
  String get cancel => 'Annuleren';

  @override
  String get settingsRestoreDemoTitle => 'Demo-afstandsbedieningen herstellen?';

  @override
  String get settingsRestoreDemoMessage =>
      'Hiermee vervang je je huidige afstandsbedieningen door de ingebouwde demo-afstandsbedieningen. Een back-up is aanbevolen als je je huidige lijst wilt behouden.';

  @override
  String get settingsRestoreDemoConfirm => 'Demo herstellen';

  @override
  String get settingsDemoRemotesRestored =>
      'Demo-afstandsbedieningen hersteld.';

  @override
  String get settingsDeleteAllRemotesTitle =>
      'Alle afstandsbedieningen verwijderen?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Hiermee verwijder je elke afstandsbediening van dit apparaat. Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String get settingsDeleteAllConfirm => 'Alles verwijderen';

  @override
  String get settingsAllRemotesDeleted =>
      'Alle afstandsbedieningen verwijderd.';

  @override
  String get themeAuto => 'Automatisch thema';

  @override
  String get themeLight => 'Licht thema';

  @override
  String get themeDark => 'Donker thema';

  @override
  String get themeDescAuto => 'Volgt je apparaatinstellingen';

  @override
  String get themeDescLight => 'Altijd helder en duidelijk';

  @override
  String get themeDescDark => 'Rustig voor de ogen';

  @override
  String get themeHintAuto =>
      'Het thema wisselt automatisch wanneer je op je apparaat tussen licht en donker schakelt';

  @override
  String get themeHintLight =>
      'Perfect voor overdag en goed verlichte omgevingen';

  @override
  String get themeHintDark =>
      'Vermindert oogbelasting bij weinig licht en bespaart batterij op OLED-schermen';

  @override
  String get supportDevelopmentTitle => 'Ontwikkeling steunen';

  @override
  String get supportDevelopmentSubtitle =>
      'Help IR Blaster onderhouden en hardwarecompatibel te houden';

  @override
  String get supportDevelopmentBody =>
      'Geen advertenties, geen tracking, geen vergrendelde functies. Jouw steun financiert protocolwerk, USB-dongleondersteuning en betere compatibiliteit op apparaten.';

  @override
  String get donate => 'Doneren';

  @override
  String get starRepo => 'Repo sterren';

  @override
  String get repositoryLinkCopied => 'Repositoriumlink gekopieerd';

  @override
  String get supportPillLocalOnly => 'Alleen lokaal';

  @override
  String get supportPillNoTracking => 'Geen tracking';

  @override
  String get supportPillHardwareAware => 'Hardwarebewust';

  @override
  String get supportPillOpenSource => 'Open source';

  @override
  String get appearanceTitle => 'Weergave';

  @override
  String get appearanceSubtitle => 'Pas je visuele ervaring aan';

  @override
  String get localizationTitle => 'Lokalisatie';

  @override
  String get localizationSubtitle => 'App-taal en vertaalgedrag';

  @override
  String localizationAutoUsing(Object language) {
    return 'Auto gebruikt $language';
  }

  @override
  String get localizationAutoDescription =>
      'De app volgt je apparaattaal wanneer mogelijk.';

  @override
  String get localizationManualDescription =>
      'De app-taal is handmatig ingesteld.';

  @override
  String get useSystemLanguageTitle => 'Systeemtaal gebruiken';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Volgt je apparaattaal: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Gebruik de hieronder gekozen taal in plaats van de standaard van het apparaat.';

  @override
  String get chooseAppLanguage => 'Kies app-taal';

  @override
  String get languagePickerDisabledHint =>
      'Schakel systeemtaal uit om handmatig een taal te kiezen.';

  @override
  String get searchLanguages => 'Zoek talen';

  @override
  String get noLanguagesFound => 'Geen talen gevonden';

  @override
  String get localizationHint =>
      'Wanneer systeemtaal is ingeschakeld volgt de app je apparaatlocale en valt terug op Engels als een vertaling ontbreekt. Schakel dit uit om de app op een vaste taal te zetten.';

  @override
  String get appLanguageTitle => 'App-taal';

  @override
  String get appLanguageHint =>
      'Auto volgt je apparaattaal. Kies hier Engels of Frans om dit alleen voor de app te overschrijven.';

  @override
  String get languageAuto => 'Auto (systeem)';

  @override
  String get languageAutoDescription => 'Volg automatisch je apparaattaal';

  @override
  String get languageEnglish => 'Engels';

  @override
  String get languageEnglishDescription =>
      'Dwing de app altijd Engels te gebruiken';

  @override
  String get languageFrench => 'Frans';

  @override
  String get languageFrenchDescription =>
      'Dwing de app altijd Frans te gebruiken';

  @override
  String get languageAutoShort => 'Auto';

  @override
  String get languageEnglishShort => 'Engels';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'Dynamische kleuren gebruiken';

  @override
  String get themeChoiceAuto => 'Auto';

  @override
  String get themeChoiceLight => 'Licht';

  @override
  String get themeChoiceDark => 'Donker';

  @override
  String get irTransmitterTitle => 'IR-zender';

  @override
  String get irTransmitterSubtitle =>
      'Kies welke hardware IR-opdrachten verzendt';

  @override
  String get learningModeEntryTitle => 'Leermodus';

  @override
  String get learningModeEntrySubtitle =>
      'Neem het IR-signaal van een afstandsbedieningsknop over.';

  @override
  String get learningModeTitle => 'Leermodus';

  @override
  String get learningModeHeroTitle =>
      'Leer een afstandsbedieningsknop netjes kennen';

  @override
  String get learningModeHeroSubtitle =>
      'Stel uw ontvanger in, bereid de originele afstandsbediening voor, leg één opdracht vast en bekijk deze voordat u deze op een afstandsbediening opslaat.';

  @override
  String get learningModeReadyBadge => 'Ontvanger klaar';

  @override
  String get learningModeNeedsPermissionBadge => 'USB-toestemming vereist';

  @override
  String get learningModeSetupBadge => 'Ontvangerconfiguratie vereist';

  @override
  String get learningModeNoReceiverBadge => 'Geen lerende ontvanger';

  @override
  String get learningModeCheckingBadge => 'Hardware controleren';

  @override
  String get learningModeFourStepFlow => 'Begeleide stroom in 4 stappen';

  @override
  String get learningModeSaveAnywhereBadge =>
      'Controleer voordat u het opslaat';

  @override
  String get learningModeGuideTitle =>
      'Ga verder waar de opname zou moeten plaatsvinden';

  @override
  String get learningModeStepHardwareShort => 'Hardware';

  @override
  String get learningModeStepPrepareShort => 'Voorbereiden';

  @override
  String get learningModeStepCaptureShort => 'Vastlegging';

  @override
  String get learningModeStepReviewShort => 'Beoordeling';

  @override
  String get learningModeStepHardwareTitle =>
      'Controleer de hardware van de ontvanger';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Zorg ervoor dat een compatibele leerontvanger is aangesloten en geautoriseerd voordat u begint.';

  @override
  String get learningModeCurrentSenderLabel => 'Huidige zender';

  @override
  String get learningModeReceiverStatusLabel => 'Leerstatus';

  @override
  String get learningModeCheckingHardwareBody =>
      'Zender en IR-ontvanger worden gecontroleerd.';

  @override
  String get learningModeHardwareReadyBody =>
      'Er is een USB IR-dongle aangesloten en geïnitialiseerd. Dit is de juiste plaats om het leerproces te starten zodra de capture-bedrading is aangesloten.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Geef toegang tot de USB-dongle en start daarna het aanleren.';

  @override
  String get learningModeHardwareSetupBody =>
      'De ontvanger is niet klaar. Controleer de instellingen of sluit hem opnieuw aan en probeer het nogmaals.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Sluit een geschikte IR-ontvanger aan om signalen aan te leren.';

  @override
  String get learningModeRefreshHardware => 'Ontvanger controleren';

  @override
  String get learningModeHardwareTipTitle => 'Beste plaatsing';

  @override
  String get learningModeHardwareTipBody =>
      'De leermodus leeft onder de IR-zender omdat deze afhankelijk is van de beschikbaarheid van hardware en minder vaak wordt gebruikt dan het verzenden van afstandsbedieningen.';

  @override
  String get learningModeStepPrepareTitle =>
      'Bereid de originele afstandsbediening voor';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Bepaal wat u gaat leren en houd de originele afstandsbediening stabiel en dicht bij de ontvanger.';

  @override
  String get learningModeButtonNameLabel => 'Knopnaam';

  @override
  String get learningModeButtonNameHint =>
      'Bijvoorbeeld: Aan/uit, HDMI 1, Menu';

  @override
  String get learningModeSinglePress => 'Enkele druk';

  @override
  String get learningModeHoldButton => 'Houd de knop vast';

  @override
  String get learningModePreparationChecklistTitle => 'Voordat je vastlegt';

  @override
  String get learningModePreparationItemDistance =>
      'Houd de originele afstandsbediening op ongeveer 2 tot 5 cm afstand van de ontvanger.';

  @override
  String get learningModePreparationItemOneButton =>
      'Leer één knop tegelijk en gebruik eerst een korte, zuivere druk.';

  @override
  String get learningModePreparationItemStill =>
      'Houd beide apparaten stabiel om luidruchtige of gedeeltelijke opnames te voorkomen.';

  @override
  String get learningModeStepCaptureTitle => 'Leg het signaal vast';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Luister naar een enkele opdracht en vergrendel het resultaat voordat u het bekijkt.';

  @override
  String get learningModeCaptureReadyTitle => 'Klaar om te luisteren';

  @override
  String get learningModeCaptureReadyBody =>
      'Uw hardwarestatus ziet er goed uit. De capture-backend wordt als volgende in deze stap aangesloten.';

  @override
  String get learningModeCaptureBlockedTitle => 'Hardware nog niet gereed';

  @override
  String get learningModeCaptureBlockedBody =>
      'U kunt de stroom nu nog steeds bekijken, maar het vastleggen moet wachten totdat de ontvanger gereed is.';

  @override
  String get learningModeStartListening => 'Ontvangst starten';

  @override
  String get learningModeCaptureStubTitle =>
      'De capture-backend komt als volgende';

  @override
  String get learningModeCaptureStubBody =>
      'Dit scherm wordt eerst volledig in de steigers gezet, zodat de uiteindelijke opnamestroom kan worden aangesloten op echte hardwarestatussen in plaats van later te worden vastgeschroefd.';

  @override
  String get learningModeCaptureStubMessage =>
      'Leren vastleggen is nog niet bedraad. Dit scherm ondersteunt eerst de volledige stroom.';

  @override
  String get learningModeUnnamedCapture => 'Naamloos signaal';

  @override
  String get learningModeStatusCheckingTitle => 'Ontvanger controleren';

  @override
  String get learningModeStatusNoReceiverTitle => 'Ontvanger niet gereed';

  @override
  String get learningModeStatusPermissionTitle => 'USB-toestemming nodig';

  @override
  String get learningModeStatusSetupTitle => 'Ontvanger instellen';

  @override
  String get learningModeStatusReadyTitle => 'Klaar om aan te leren';

  @override
  String get learningModeStatusListeningTitle => 'Wachten op signaal';

  @override
  String get learningModeStatusCapturedTitle => 'Signaal ontvangen';

  @override
  String get learningModeStatusReadyBody =>
      'Geef de knop een naam, richt de originele afstandsbediening op de ontvanger en begin met luisteren wanneer je er klaar voor bent.';

  @override
  String get learningModeStatusListeningBody =>
      'Richt de originele afstandsbediening op de ontvanger en druk één keer op de knop.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Signaal voor $buttonName ontvangen. Verzend het opnieuw om te controleren of je apparaat reageert en sla het daarna op.';
  }

  @override
  String get learningModeConnectReceiverTitle => 'Sluit een IR-ontvanger aan';

  @override
  String get learningModeConnectReceiverBody =>
      'De leermodus is afhankelijk van externe hardware die IR kan ontvangen. Zodra de ontvanger is gedetecteerd en geautoriseerd, wordt deze pagina een directe luister-, test- en opslagstroom.';

  @override
  String get learningModeListenCardTitle => 'Luister naar één knop';

  @override
  String get learningModeListenCardBody =>
      'Stel desgewenst eerst een label in, begin dan met luisteren en druk op de knop op de originele afstandsbediening.';

  @override
  String get learningModeReadyToListenTitle => 'Klaar voor ontvangst';

  @override
  String get learningModeReadyToListenBody =>
      'Richt de originele afstandsbediening op de ontvanger en start de opname.';

  @override
  String get learningModeListeningNowTitle => 'Wachten op signaal';

  @override
  String get learningModeListeningNowBody =>
      'Druk één keer op de originele afstandsbedieningsknop. Gebruik preview-opname om door de rest van het schavot te bewegen voordat de echte opname-backend wordt aangesloten.';

  @override
  String get learningModePreviewCaptureAction =>
      'Bekijk een voorbeeld van het vastgelegde signaal';

  @override
  String get learningModeCapturedSummary => 'Opgenomen signaal';

  @override
  String get learningModeResultActionsTitle => 'Testen en opslaan';

  @override
  String get learningModeResultActionsBody =>
      'Verzend het signaal opnieuw en controleer of je apparaat reageert voordat je de knop opslaat.';

  @override
  String get learningModeReplayAction => 'Opnieuw verzenden';

  @override
  String get learningModeReplayStubMessage =>
      'Replay is nog niet bedraad. Dit is het UI-scaffold voor de laatste leer-, test- en opslagstroom.';

  @override
  String get learningModeSaveStubMessage =>
      'Opslaan is nog niet bedraad. De volgende stap is het verbinden van dit scherm met Create Button en bestaande afstandsbedieningen.';

  @override
  String get learningModeLearnAnotherAction => 'Nog een knop aanleren';

  @override
  String get learningModeStepReviewTitle => 'Bekijk en bewaar';

  @override
  String get learningModeStepReviewSubtitle =>
      'Bevestig wat er is geleerd en kies vervolgens waar het in uw externe bibliotheek moet komen te staan.';

  @override
  String get learningModeSaveToExistingRemote => 'Bestaande afstandsbediening';

  @override
  String get learningModeCreateNewRemote => 'Nieuwe afstandsbediening';

  @override
  String get learningModeProtocolPreviewTitle => 'Protocolvoorbeeld';

  @override
  String get learningModeProtocolPreviewBody =>
      'Gedecodeerde protocoldetails verschijnen hier zodra de ontvanger een schone druk op de knop vastlegt.';

  @override
  String get learningModeRawPreviewTitle => 'Ruwe gegevens';

  @override
  String get learningModeRawPreviewBody =>
      'Als de decodering onvolledig is, is de onbewerkte timingopname hier nog steeds beschikbaar om te bekijken en op te slaan.';

  @override
  String get learningModeSaveCapture => 'Signaal opslaan';

  @override
  String get learningModeReviewTipTitle =>
      'Waar dit de volgende keer naartoe zal gaan';

  @override
  String get learningModeReviewTipBody =>
      'De volgende implementatiestap zou dit beoordelingspaneel moeten verbinden met Create Button en bestaande afstandsbedieningen, zodat het geleerde signaal rechtstreeks in uw bibliotheek terechtkomt.';

  @override
  String get learningModeFinishPreview => 'Voorbeeld voltooien';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Bediening';

  @override
  String get interactionSubtitle =>
      'Stel het opstartgedrag, de aanraakfeedback en de weergave van afstandsbedieningen in.';

  @override
  String get autoOpenLastRemoteTitle => 'Laatste afstandsbediening openen';

  @override
  String get autoOpenLastRemoteSubtitle =>
      'Open bij het starten de laatst gebruikte afstandsbediening. Is die niet meer beschikbaar, toon dan de lijst.';

  @override
  String get hapticFeedbackTitle => 'Haptische feedback';

  @override
  String get hapticFeedbackSubtitle => 'Trillen bij tikken en acties';

  @override
  String get forceInAppVibrationTitle => 'Trilling in de app forceren';

  @override
  String get forceInAppVibrationSubtitle =>
      'Gebruik de vibrator rechtstreeks, zelfs als systeemaanraakfeedback uit staat';

  @override
  String get forceInAppVibrationWarning =>
      'Geavanceerde optie. Hierdoor kan de app trillen, zelfs wanneer Android-aanraakfeedback globaal is uitgeschakeld.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android-systeemtrilling is uitgeschakeld. Geforceerde trilling in de app kan dit op dit apparaat niet omzeilen.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'Dit apparaat meldt geen trilhardware, dus trilling in de app kan niet werken.';

  @override
  String get intensity => 'Intensiteit';

  @override
  String get intensityLight => 'Licht';

  @override
  String get intensityMedium => 'Middel';

  @override
  String get intensityStrong => 'Sterk';

  @override
  String get remoteButtonMetadataTitle => 'Technische knoplabels tonen';

  @override
  String get remoteButtonMetadataSubtitle =>
      'Toon protocol, code en frequentie op afstandsbedieningsknoppen.';

  @override
  String get remoteButtonMetadataShown =>
      'Technische knoplabels worden getoond.';

  @override
  String get remoteButtonMetadataHidden =>
      'Technische knoplabels zijn verborgen.';

  @override
  String get flipRemoteDefaultTitle =>
      'Afstandsbedieningsweergave standaard omdraaien';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Open schermen van de afstandsbediening 180° gedraaid voor USB-dongles aan de onderkant.';

  @override
  String get remoteViewFlipped =>
      'Weergave van afstandsbediening opent omgedraaid.';

  @override
  String get remoteViewNormal =>
      'Weergave van afstandsbediening opent normaal.';

  @override
  String get backupTitle => 'Back-up';

  @override
  String get backupSubtitle =>
      'Afstandsbedieningen en macro\'s importeren of exporteren';

  @override
  String get importBackup => 'Back-up importeren';

  @override
  String get importBackupSubtitle =>
      'Importeer back-up van afstandsbedieningen of macro\'s of Flipper Zero, LIRC of IRPLUS-bestanden';

  @override
  String get bulkImportFolder => 'Map in bulk importeren';

  @override
  String get bulkImportFolderSubtitle =>
      'Importeer meerdere afstandsbedieningen uit een map';

  @override
  String get exportBackup => 'Back-up exporteren';

  @override
  String get exportBackupSubtitle =>
      'Sla afstandsbedieningen en macro\'s als één JSON-bestand op in Downloads';

  @override
  String get restoreDemoRemotes => 'Demo-afstandsbedieningen herstellen';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Vervang huidige afstandsbedieningen door de ingebouwde demo';

  @override
  String get deleteAllRemotes => 'Alle afstandsbedieningen verwijderen';

  @override
  String get deleteAllRemotesSubtitle =>
      'Verwijder elke afstandsbediening van dit apparaat';

  @override
  String get backupTip =>
      'Tip: exporteer een back-up vóór grote bewerkingen. Import ondersteunt volledige back-ups, oudere JSON-back-ups alleen voor afstandsbedieningen en Flipper Zero .ir-bestanden.';

  @override
  String get aboutTitle => 'Over';

  @override
  String get aboutSubtitle => 'App-info en open-sourcegegevens';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Versie $version';
  }

  @override
  String get sourceCode => 'Broncode';

  @override
  String get viewOnGitHub => 'Bekijk op GitHub';

  @override
  String get repositoryUrlCopied => 'Repository-URL gekopieerd';

  @override
  String get reportIssue => 'Probleem melden';

  @override
  String get reportIssueSubtitle => 'Bugmeldingen en functieverzoeken';

  @override
  String get issuesUrlCopied => 'Issues-URL gekopieerd';

  @override
  String get license => 'Licentie';

  @override
  String get openSourceLicense => 'Open-sourcelicentie';

  @override
  String get licenseUrlCopied => 'Licentie-URL gekopieerd';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Website bezoeken';

  @override
  String get companyUrlCopied => 'Bedrijfs-URL gekopieerd';

  @override
  String get licenses => 'Licenties';

  @override
  String get openSourceLicenses => 'Open-sourcelicenties';

  @override
  String byCreator(Object creator) {
    return 'door $creator';
  }

  @override
  String get deviceControlsTitle => 'Apparaatbediening';

  @override
  String get deviceControlsSubtitle =>
      'Toon favoriete knoppen op de systeempagina voor apparaatbediening';

  @override
  String get manageFavorites => 'Favorieten beheren';

  @override
  String get manageFavoritesSubtitle =>
      'Kies welke knoppen in apparaatbediening verschijnen';

  @override
  String get quickSettingsTitle => 'Snelle instellingen';

  @override
  String get quickSettingsSubtitle =>
      'Tegels toevoegen voor aan/uit- en volumeknoppen';

  @override
  String get configureTiles => 'Tegels configureren';

  @override
  String get configureTilesSubtitle =>
      'Koppel tegels aan knoppen van afstandsbediening';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle => 'Universeel aan/uit-cyclen voor eigen apparaten';

  @override
  String get openTvKill => 'TVKill openen';

  @override
  String get openTvKillSubtitle =>
      'Wissel door aan/uit-codes, alleen voor apparaten die je bezit';

  @override
  String get failedToLoadTransmitterSettings =>
      'Instellingen van de zender laden mislukt.';

  @override
  String get usbStatusReady =>
      'USB-dongle is verbonden en klaar om IR te verzenden.';

  @override
  String get usbStatusPermissionRequired =>
      'USB-dongle gedetecteerd. Vraag USB-toestemming aan en keur de systeemmelding goed.';

  @override
  String get usbStatusPermissionDenied =>
      'USB-toestemming is geweigerd voor de aangesloten dongle. Vraag opnieuw aan en keur de melding goed.';

  @override
  String get usbStatusPermissionGranted =>
      'USB-toestemming is verleend. De dongle moet nog worden geïnitialiseerd voordat hij IR kan verzenden.';

  @override
  String get usbStatusOpenFailed =>
      'USB-toestemming is verleend, maar de dongle kon niet worden geïnitialiseerd. Sluit hem opnieuw aan en probeer het opnieuw.';

  @override
  String get usbStatusNoDevice =>
      'Geen ondersteunde USB-IR-dongle gedetecteerd.';

  @override
  String get usbSelectPermissionRequired =>
      'USB-dongle gedetecteerd maar niet geautoriseerd. Tik op USB-toestemming aanvragen.';

  @override
  String get usbSelectPermissionDenied =>
      'USB-toestemming is geweigerd. Tik op USB-toestemming aanvragen en keur de melding goed.';

  @override
  String get usbSelectPermissionGranted =>
      'USB-toestemming is verleend, maar de dongle is nog niet geïnitialiseerd. Probeer hem opnieuw aan te sluiten.';

  @override
  String get usbSelectOpenFailed =>
      'USB-toestemming is verleend, maar de dongle kon niet worden geïnitialiseerd. Sluit hem opnieuw aan en probeer het opnieuw.';

  @override
  String get usbSelectNoDevice =>
      'Geen ondersteunde USB-IR-dongle gedetecteerd. Sluit hem aan en tik dan op USB-toestemming aanvragen.';

  @override
  String get usbSelectReady => 'USB-dongle is klaar.';

  @override
  String get autoSwitchEnabledMessage =>
      'Automatisch wisselen ingeschakeld gebruikt USB wanneer verbonden, anders Intern.';

  @override
  String get autoSwitchDisabledMessage =>
      'Automatisch wisselen uitgeschakeld zenderkeuze is nu handmatig.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Instelling voor automatisch wisselen bijwerken mislukt.';

  @override
  String get failedToSwitchTransmitter => 'Wisselen van zender mislukt.';

  @override
  String get deviceHasNoInternalIr =>
      'Dit apparaat heeft geen ingebouwde IR-zender.';

  @override
  String get audioModeEnabledMessage =>
      'Audiomodus ingeschakeld. Gebruik maximaal mediavolume en een audio-naar-IR-ledadapter.';

  @override
  String get usbPermissionRequestSent => 'USB-toestemmingsaanvraag verzonden.';

  @override
  String get usbPermissionRequestSentApprove =>
      'USB-toestemmingsaanvraag verzonden. Keur de melding goed om USB te activeren.';

  @override
  String get usbAlreadyReady => 'USB-dongle is al geïnitialiseerd en klaar.';

  @override
  String get failedToRequestUsbPermission =>
      'USB-toestemming aanvragen mislukt.';

  @override
  String get transmitterHelpInternal =>
      'Gebruik de ingebouwde IR-zender van de telefoon om opdrachten te verzenden.';

  @override
  String get transmitterHelpUsb =>
      'Gebruik een USB-IR-dongle om opdrachten te verzenden. Toestemming vereist.';

  @override
  String get transmitterHelpAudio1 =>
      'Gebruik audio-uitvoer mono. Vereist een audio-naar-IR-ledadapter en hoog mediavolume.';

  @override
  String get transmitterHelpAudio2 =>
      'Gebruik audio-uitvoer stereo. Gebruikt twee kanalen voor betere led-aansturing met compatibele adapters.';

  @override
  String get transmitterInternal => 'Interne IR';

  @override
  String get transmitterUsb => 'USB-IR-dongle';

  @override
  String get transmitterAudio1 => 'Audio 1 LED';

  @override
  String get transmitterAudio2 => 'Audio 2 LEDs';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Mogelijkheden van de zender laden mislukt.';

  @override
  String get selectedTransmitter => 'Geselecteerde zender';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Actief: $active';
  }

  @override
  String get refresh => 'Vernieuwen';

  @override
  String get autoSwitchTitle => 'Automatisch wisselen';

  @override
  String get autoSwitchDisabledWhileAudio => 'Uitgeschakeld bij Audiomodus';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Gebruikt USB wanneer verbonden, anders Intern';

  @override
  String get unavailableOnThisDevice => 'Niet beschikbaar op dit apparaat';

  @override
  String get openOnUsbAttachTitle => 'Openen bij USB-aansluiting';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android kan voorstellen de app te openen wanneer een ondersteunde USB-IR-dongle wordt aangesloten.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Zal voorstellen IR Blaster te openen wanneer een ondersteunde USB-dongle wordt aangesloten.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Niet voorstellen te openen bij USB-aansluiting.';

  @override
  String get failedToUpdateSetting => 'Instelling bijwerken mislukt.';

  @override
  String get unnamedButton => 'Naamloze knop';

  @override
  String get iconFallback => 'Pictogram';

  @override
  String get remoteListReorderHint =>
      'Houd een afstandsbediening ingedrukt en sleep deze naar de gewenste plek.';

  @override
  String get deleteRemoteTitle => 'Afstandsbediening verwijderen?';

  @override
  String deleteRemoteMessage(Object name) {
    return '‘$name’ wordt definitief verwijderd. Dit kan niet ongedaan worden gemaakt.';
  }

  @override
  String get delete => 'Verwijderen';

  @override
  String get addToDeviceControlsTitle => 'Aan apparaatbediening toevoegen';

  @override
  String get addToDeviceControlsDescription =>
      'Snelle toegang in de systeem-apparaatbediening.';

  @override
  String get skip => 'Overslaan';

  @override
  String get add => 'Toevoegen';

  @override
  String get addedToDeviceControls => 'Toegevoegd aan apparaatbediening.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return '‘$name’ verwijderd. Dit kan niet ongedaan worden gemaakt.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count knoppen',
      one: '$count knop',
    );
    return '$_temp0 · $layout';
  }

  @override
  String get layoutComfort => 'Breed';

  @override
  String get layoutCompact => 'Compact';

  @override
  String get open => 'Openen';

  @override
  String get useThisRemote => 'Deze afstandsbediening gebruiken';

  @override
  String get edit => 'Bewerken';

  @override
  String get editRemoteSubtitle => 'Hernoemen en knoppen bewerken';

  @override
  String get thisCannotBeUndone => 'Dit kan niet ongedaan worden gemaakt';

  @override
  String get searchRemotes => 'Zoek afstandsbedieningen';

  @override
  String get reorderRemotes => 'Afstandsbedieningen ordenen';

  @override
  String get addRemote => 'Afstandsbediening toevoegen';

  @override
  String get more => 'Meer';

  @override
  String get reorderMode => 'Sorteermodus';

  @override
  String remoteButtonCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count knoppen',
      one: '$count knop',
    );
    return '$_temp0';
  }

  @override
  String get noRemotesYet => 'Nog geen afstandsbedieningen';

  @override
  String get noRemotesDescription =>
      'Maak een afstandsbediening om infraroodsignalen te verzenden.';

  @override
  String get noRemotesNextStep =>
      'Voeg eerst een afstandsbediening toe, daarna de knoppen.';

  @override
  String get actions => 'Acties';

  @override
  String get macrosTitle => 'Macro\'s';

  @override
  String get help => 'Help';

  @override
  String get createMacro => 'Macro maken';

  @override
  String get timedMacrosTitle => 'Macro’s';

  @override
  String get timedMacrosSubtitle =>
      'Voer een reeks IR-opdrachten uit met wachttijden tussen de stappen.';

  @override
  String get timedMacrosNextStep =>
      'Kies een afstandsbediening en voeg opdrachten en wachttijden toe om je eerste macro te maken.';

  @override
  String get macroFeatureToysTitle => 'Voor speelgoed met IR-bediening';

  @override
  String get macroFeatureToysDescription =>
      'Geef het speelgoed tijd om een actie af te maken voordat je de volgende opdracht verstuurt.';

  @override
  String get macroFeatureTimingTitle => 'Instelbare wachttijden';

  @override
  String get macroFeatureTimingDescription =>
      'Stel de wachttijd tussen opdrachten in, zodat je apparaat tijd heeft om te reageren.';

  @override
  String get macroFeatureManualTitle => 'Wacht op bevestiging';

  @override
  String get macroFeatureManualDescription =>
      'Wacht tot je op Doorgaan tikt voordat de volgende stap begint.';

  @override
  String get exampleUseCase => 'Voorbeeld';

  @override
  String get macroExampleText =>
      '1. Verzend de eerste opdracht\n2. Wacht één seconde\n3. Verzend de volgende opdracht';

  @override
  String get createFirstMacro => 'Maak je eerste macro';

  @override
  String get noRemote => 'Geen afstandsbediening';

  @override
  String macroCopyName(String name) {
    return '$name (kopie)';
  }

  @override
  String macroStepCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stappen',
      one: '$count stap',
    );
    return '$_temp0';
  }

  @override
  String get aboutTimedMacros => 'Over macro’s';

  @override
  String get aboutTimedMacrosDescription =>
      'Voer een reeks IR-opdrachten uit met wachttijden tussen de stappen.';

  @override
  String get sendCommand => 'Opdracht verzenden';

  @override
  String get sendCommandDescription =>
      'Verzendt het IR-signaal van een opgeslagen knop op je afstandsbediening.';

  @override
  String get delay => 'Wachttijd';

  @override
  String get delayDescription =>
      'Wacht de ingestelde tijd voordat de volgende stap begint.';

  @override
  String get manualContinue => 'Wacht op bevestiging';

  @override
  String get manualContinueDescription =>
      'Wacht tot je op Doorgaan tikt voordat de volgende stap begint.';

  @override
  String get gotIt => 'Begrepen';

  @override
  String get failedToSaveMacros => 'Macro’s konden niet worden opgeslagen.';

  @override
  String deletedMacroNamed(Object name) {
    return '‘$name’ verwijderd.';
  }

  @override
  String get undo => 'Ongedaan maken';

  @override
  String get failedToRestoreMacro => 'De macro kon niet worden hersteld.';

  @override
  String get deleteMacroTitle => 'Macro verwijderen?';

  @override
  String get deleteMacroMessage =>
      'Tik na het verwijderen op Ongedaan maken in de melding om de macro te herstellen.';

  @override
  String get noRemotesAvailable => 'Geen afstandsbedieningen beschikbaar.';

  @override
  String remoteButtonCountSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count knoppen',
      one: '$count knop',
    );
    return '$_temp0';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Oorspronkelijke stand herstellen';

  @override
  String get remoteOrientationNormalTooltip => 'Afstandsbediening 180° draaien';

  @override
  String get stopLoop => 'Herhaling stoppen';

  @override
  String get reorderButtons => 'Knoppen rangschikken';

  @override
  String get remoteReorderHint =>
      'Houd een knop ingedrukt en sleep deze naar een andere plek.';

  @override
  String get manageRemote => 'Afstandsbediening beheren';

  @override
  String get remoteNoButtons => 'Nog geen knoppen';

  @override
  String get remoteNoButtonsDescription =>
      'Bewerk deze afstandsbediening om knoppen toe te voegen of in te stellen.';

  @override
  String get editRemote => 'Afstandsbediening bewerken';

  @override
  String get editRemoteActionsSubtitle =>
      'Afstandsbediening hernoemen, knoppen rangschikken en bewerken';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Knop ‘$name’ bijgewerkt.';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Toevoegened \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Knop gedupliceerd.';

  @override
  String get loopRunningForButton => 'Lus draait voor deze knop.';

  @override
  String get loopTip => 'Tip gebruik Lus om te herhalen tot je stopt.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Code gekopieerd.';

  @override
  String get copyCode => 'Code kopiëren';

  @override
  String get startLoop => 'Lus starten';

  @override
  String get editButtonSubtitle => 'Label, kleuren of IR-signaal wijzigen';

  @override
  String get newButton => 'Nieuwe knop';

  @override
  String get newButtonSubtitle =>
      'Maak nog een knop voor deze afstandsbediening';

  @override
  String get duplicate => 'Dupliceren';

  @override
  String get duplicateButtonSubtitle => 'Maak een kopie van deze knop';

  @override
  String get removeFromDeviceControls => 'Verwijderen uit apparaatbediening';

  @override
  String get addToDeviceControls => 'Toevoegen aan apparaatbediening';

  @override
  String get deviceControlsButtonSubtitle =>
      'Gebruik deze knop via de apparaatbediening van Android';

  @override
  String get removedFromDeviceControls => 'Verwijderd uit apparaatbediening.';

  @override
  String get pinQuickTile => 'Vastzetten aan favorieten van Snelle tegel';

  @override
  String get unpinQuickTile => 'Losmaken uit favorieten voor snelle tegels';

  @override
  String get quickTileButtonSubtitle =>
      'Favorieten staan vooraan bij het instellen van een tegel voor snelle instellingen';

  @override
  String get removedFromQuickTileFavorites =>
      'Verwijderd uit favorieten van Snelle tegel.';

  @override
  String get pinnedToQuickTileFavorites =>
      'Vastgezet aan favorieten van Snelle tegel.';

  @override
  String get duplicateAndEdit => 'Dupliceren en bewerken';

  @override
  String get duplicateAndEditSubtitle => 'Maak een kopie en bewerk die meteen';

  @override
  String get done => 'Klaar';

  @override
  String get run => 'Uitvoeren';

  @override
  String get untitledRemote => 'Naamloze afstandsbediening';

  @override
  String get createRemoteTitle => 'Afstandsbediening maken';

  @override
  String get editRemoteTitle => 'Afstandsbediening bewerken';

  @override
  String get removeButtonTitle => 'Knop verwijderen?';

  @override
  String get imageButtonRemovedMessage =>
      'Deze knop wordt uit de afstandsbediening verwijderd.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '‘$name’ wordt uit de afstandsbediening verwijderd.';
  }

  @override
  String get remove => 'Verwijderen';

  @override
  String importedButtonCount(int count) {
    return 'Importerened $count knop(s).';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Importerened $count knop(s) from existing remotes.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Label, kleuren of IR-signaal wijzigen';

  @override
  String get createButtonCopySubtitle => 'Maak een kopie van deze knop';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Maak een kopie en bewerk die meteen';

  @override
  String get undoAvailableInNextSnackbar =>
      'Tik na het verwijderen op Ongedaan maken in de melding die verschijnt.';

  @override
  String get buttonRemoved => 'Knop verwijderd.';

  @override
  String get remoteNameCannotBeEmpty =>
      'Voer een naam voor de afstandsbediening in.';

  @override
  String get saveRemote => 'Opslaan remote';

  @override
  String get remoteName => 'Naam afstandsbediening';

  @override
  String get remoteNameHint => 'bijv. tv of airco';

  @override
  String get remoteNameHelper =>
      'Deze naam verschijnt in je lijst met afstandsbedieningen.';

  @override
  String get layoutStyle => 'Indeling';

  @override
  String get layoutWideDescription =>
      'Twee kolommen met knoppen en meer details.';

  @override
  String get layoutCompactDescription =>
      'Vier kolommen met knoppen met pictogrammen of tekst.';

  @override
  String get importFromRemotes => 'Uit afstandsbedieningen importeren';

  @override
  String get importFromDatabase => 'Uit database importeren';

  @override
  String get addButton => 'Knop toevoegen';

  @override
  String get noButtonsYet => 'Nog geen knoppen';

  @override
  String get createRemoteEmptyStateDescription =>
      'Zoek knoppen in de database, importeer ze uit een andere afstandsbediening of maak ze zelf.';

  @override
  String get createButtonTitle => 'Maken Knop';

  @override
  String get editButtonTitle => 'Bewerken Knop';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Mislukt to load protocols: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Mislukt to load database keys: $error';
  }

  @override
  String get presetPower => 'Aan/uit';

  @override
  String get presetVolume => 'Volume';

  @override
  String get presetChannel => 'Kanaal';

  @override
  String get presetNavigation => 'Navigatie';

  @override
  String get all => 'Alles';

  @override
  String get completeRequiredFieldsToSave =>
      'Complete vereist fields to opslaan';

  @override
  String get buttonLabelStepTitle => 'Knoplabel';

  @override
  String get buttonLabelStepSubtitle =>
      'Kies een afbeelding, pictogram of typ een tekstlabel.';

  @override
  String get buttonColorStepTitle => 'Knopkleur';

  @override
  String get buttonColorStepSubtitle =>
      'Kies een achtergrondkleur voor deze knop.';

  @override
  String get selectColor => 'Kies kleur:';

  @override
  String get noImageSelected => 'Geen image geselecteerd';

  @override
  String get gallery => 'Galerij';

  @override
  String get builtIn => 'Ingebouwd';

  @override
  String get removeImage => 'Verwijderen image';

  @override
  String get requiredSelectImageOrSwitch =>
      'Vereist selecteer een afbeelding, kies een pictogram of schakel naar Tekst.';

  @override
  String get iconSelected => 'Pictogram geselecteerd';

  @override
  String get noIconSelected => 'Geen icon geselecteerd';

  @override
  String get chooseIcon => 'Kies pictogram';

  @override
  String get removeIcon => 'Verwijderen icon';

  @override
  String get requiredSelectIconOrSwitch =>
      'Vereist selecteer een pictogram of schakel naar Afbeelding/Tekst.';

  @override
  String get buttonText => 'Knoptekst';

  @override
  String get buttonTextHint => 'bijv. Aan/uit, Volume +, HDMI 1';

  @override
  String get buttonTextHelper => 'Deze tekst verschijnt op de knop.';

  @override
  String get requiredEnterButtonLabel => 'Vereist voer een knoplabel in.';

  @override
  String get defaultColorName => 'Standaard';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Nieuwe afstandsbediening gemaakt met één knop van de laatste treffer.';

  @override
  String get selectRemote => 'Kies een afstandsbediening';

  @override
  String remoteNumber(Object id) {
    return 'Afstandsbediening #$id';
  }

  @override
  String get newRemoteCreated => 'Nieuwe afstandsbediening gemaakt.';

  @override
  String get failedToCreateRemote => 'Afstandsbediening maken mislukt.';

  @override
  String get newRemoteEllipsis => 'Nieuwe afstandsbediening…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Toevoegened to $name.';
  }

  @override
  String get failedToAddToRemote => 'Toevoegen aan afstandsbediening mislukt.';

  @override
  String get newRemoteDefaultName => 'New Afstandsbediening';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Jumped to offset $offset. Pauzed — press Hervatten to continue.';
  }

  @override
  String get sent => 'Verzonden.';

  @override
  String failedToSend(Object error) {
    return 'Verzenden mislukt: $error';
  }

  @override
  String get copiedProtocolCode => 'Gekopieerd protocol:code.';

  @override
  String get savedToResults => 'Opslaand to Results.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Ongeldige code voor protocol: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Huidige kandidaat gekopieerd.';

  @override
  String get jumpToOffset => 'Spring naar offset';

  @override
  String get jumpToBruteCursor => 'Spring naar brute-cursor';

  @override
  String get jump => 'Springen';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Jumped to cursor 0x$cursor. Pauzed — press Hervatten to continue.';
  }

  @override
  String get irSignalTester => 'IR-signaaltester';

  @override
  String get stop => 'Stop';

  @override
  String get selectButton => 'Kies een knop';

  @override
  String get buttonNotFoundInRemotes =>
      'Knop niet gevonden in de opgeslagen afstandsbedieningen.';

  @override
  String sentNamed(Object name) {
    return '‘$name’ verzonden.';
  }

  @override
  String sendFailed(Object error) {
    return 'Verzenden mislukt: $error';
  }

  @override
  String get noFavoritesYet => 'Geen favorieten yet';

  @override
  String get deviceControlsEmptyHint =>
      'Long-press a remote knop and select “Toevoegen to Apparaatbediening”.';

  @override
  String get sendTest => 'Test verzenden';

  @override
  String get testSendCompleted => 'Testverzending voltooid.';

  @override
  String testSendFailed(Object error) {
    return 'Test send mislukt: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Verwijderd \"$name\".';
  }

  @override
  String get brand => 'Merk';

  @override
  String get model => 'Model';

  @override
  String get selectBrand => 'Selecteer brand';

  @override
  String get searchBrand => 'Zoeken brand…';

  @override
  String get selectModel => 'Selecteer model';

  @override
  String get searchModel => 'Zoeken model…';

  @override
  String get unnamedKey => 'Naamloze toets';

  @override
  String get unknown => 'Onbekend';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'Opdrachten zoeken';

  @override
  String get noMatchingCommands => 'Geen opdrachten gevonden';

  @override
  String get quickTileFavoritesTitle => 'Favoriete knoppen';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Knop voor tegel ‘$tileLabel’ wijzigen';
  }

  @override
  String get pickDifferentButton => 'Kies een andere knop';

  @override
  String get browseAllRemotesEllipsis => 'Afstandsbedieningen bekijken';

  @override
  String get invalidMacroFileFormat => 'Ongeldig macrobestandsformaat.';

  @override
  String get failedToParseMacroFile => 'Macrobestand parseren mislukt.';

  @override
  String get deviceCodeLabel => 'Apparaat Code';

  @override
  String get commandLabel => 'Opdracht';

  @override
  String get editButtonCodeTitle => 'Bewerken Code of the knop';

  @override
  String get thisRemoteHasNoButtons =>
      'Deze afstandsbediening heeft geen knoppen.';

  @override
  String get selectCommand => 'Opdracht kiezen';

  @override
  String get databaseModeAutofillHint =>
      'Database mode auto-fills Step 2 for you (brand + model + protocol). After importerening a key, you can refine anything in Manual.';

  @override
  String get test => 'Test';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'All geselecteerd knoppen were duplicates.';

  @override
  String get noButtonsImported => 'Geen knoppen importerened.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Importerened $addedCount knop(s). Overslaanped $skippedCount duplicate(s).';
  }

  @override
  String get importAllMatchingTitle => 'Importeren all matching knoppen?';

  @override
  String get noMatchingKeysFound => 'Geen overeenkomende toetsen gevonden.';

  @override
  String importAllMatchingMessage(int count) {
    return 'This will importeren up to $count matching keys from the current database selection.';
  }

  @override
  String get importAll => 'Importeren all';

  @override
  String get importingButtons => 'Importeren knoppen…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'All matching knoppen were duplicates.';

  @override
  String get quickPresets => 'Snelle presets';

  @override
  String get selectDeviceFirst => 'Selecteer apparaat first';

  @override
  String get searchByLabelOrHex => 'Zoek op label of hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Optioneel verfijn de presettoetsen voor $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Selecteer brand, model, and protocol first.';

  @override
  String get importFromDatabaseTitle => 'Importereneren uit database';

  @override
  String get importFromDatabaseSubtitle =>
      'Zoek je apparaat, kies de knoppen en importeer ze.';

  @override
  String get deviceAndFilters => 'Apparaat & filters';

  @override
  String loadedCount(int count) {
    return '$count geladen';
  }

  @override
  String get hideFilters => 'Filters verbergen';

  @override
  String get showFilters => 'Filters tonen';

  @override
  String get noProtocolFoundForBrandModel =>
      'Geen protocol gevonden voor dit merk en model.';

  @override
  String get protocolAutoDetected => 'Protocol';

  @override
  String get protocolAutoDetectedHelper =>
      'Automatisch uit de database gedetecteerd. Je kunt dit vóór het importereneren wijzigen.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Selecteereer een merk, model en protocol om toetsen te laden.';

  @override
  String get noKeysFound => 'Geen keys found.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Geen toetsen gevonden voor “$query”.';
  }

  @override
  String get skipDuplicates => 'Overslaan duplicates';

  @override
  String get skipDuplicatesSubtitle =>
      'Do not importeren knoppen that already exist in this remote.';

  @override
  String get importSelected => 'Importeren geselecteerd';

  @override
  String get noMacrosToExport => 'Geen macros to exporteren.';

  @override
  String get macrosExportedToDownloads => 'Macro\'s exporterened to Downloads.';

  @override
  String get failedToExportMacros => 'Macro\'s exportereneren mislukt.';

  @override
  String get failedToReadFile => 'Bestand lezen mislukt.';

  @override
  String get importFromExistingRemotesTitle =>
      'Importereneren uit bestaande afstandsbedieningen';

  @override
  String selectedCount(int count) {
    return '$count geselecteerd';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Geen andere afstandsbedieningen met knoppen gevonden.';

  @override
  String get sourceRemote => 'Bron-afstandsbediening';

  @override
  String get searchButtons => 'Zoeken knoppen';

  @override
  String get searchButtonsHint => 'Power, Volume, Mute..';

  @override
  String get selectVisible => 'Selecteer visible';

  @override
  String get clearVisible => 'Zichtbare wissen';

  @override
  String protocolNamed(Object name) {
    return 'Protocol: $name';
  }

  @override
  String get rawSignal => 'Ruw';

  @override
  String get legacyCode => 'Verouderde code';

  @override
  String importCount(int count) {
    return 'Importeren $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Opslagtoestemming geweigerd nodig op sommige oudere Android-apparaten.';

  @override
  String get backupExportedToDownloads => 'Back-up exporterened to Downloads.';

  @override
  String failedToExport(Object error) {
    return 'Mislukt to exporteren: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Importerened $count remotes from legacy JSON back-up. Macro\'s were not changed.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Importeren mislukt back-up \"remotes\" moet een JSON-lijst zijn wanneer aanwezig.';

  @override
  String get importFailedMacrosMustBeList =>
      'Importeren mislukt back-up \"macros\" moet een JSON-lijst zijn wanneer aanwezig.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Importeren mislukt ongeldig back-upformaat verwacht oude List of Map met remotes/macros.';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Importerened $remoteCount remotes from back-up. Macro\'s were not changed.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Importerened $remoteCount remotes and $macroCount macros from back-up.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Importeren mislukt geen geldige knoppen gevonden in .ir-bestand.';

  @override
  String get importedOneRemoteFromFlipper =>
      '1 afstandsbediening geïmporteerd uit Flipper .ir. Macro\'s zijn niet gewijzigd.';

  @override
  String get importFailedInvalidIrplus =>
      'Importeren mislukt ongeldig irplus-bestand geen geldige knoppen gevonden.';

  @override
  String get importedOneRemoteFromIrplus =>
      '1 afstandsbediening geïmporteerd uit irplus. Macro\'s zijn niet gewijzigd.';

  @override
  String get importFailedInvalidLirc =>
      'Importeren mislukt ongeldig LIRC-bestand geen geldige codes of ruwe codes gevonden.';

  @override
  String get importedOneRemoteFromLirc =>
      '1 afstandsbediening geïmporteerd uit LIRC-configuratie. Macro\'s zijn niet gewijzigd.';

  @override
  String get unsupportedFileTypeSelected =>
      'Niet-ondersteund bestandstype geselecteerd.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Importeren mislukt ongeldige of onleesbare bestand.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Bulkimporteren voltooid: no ondersteunde files found in folder.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Bulkimporteren voltooid: no remotes importerened. Overslaanped $skippedCount file(s).';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Bulkimporteren voltooid: importerened $importedCount remote(s) from $supportedCount ondersteunde file(s). Overslaanped $skippedCount file(s).';
  }

  @override
  String get storagePermissionDenied => 'Opslagtoestemming geweigerd.';

  @override
  String get bulkImportFailedReadFolder =>
      'Bulk importeren mislukt: unable to read folder contents.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Bulkimporteren voltooid: no ondersteunde files found ($sourceLabel).';
  }

  @override
  String get clearAction => 'Wissen';

  @override
  String get saveAction => 'Opslaan';

  @override
  String buttonsTitleCount(int count) {
    return 'Knoppen ($count)';
  }

  @override
  String get invalidStepEncountered =>
      'Deze macro bevat een ongeldige stap. Bewerk die stap voordat je het opnieuw probeert.';

  @override
  String failedToSendNamed(Object name) {
    return 'Verzenden mislukt: $name';
  }

  @override
  String get buttonNotFound => 'Knop niet gevonden';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Knop niet gevonden: $name';
  }

  @override
  String get unknownButton => 'Onbekende knop';

  @override
  String durationSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '$minutes min $seconds s';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '$hours u $minutes min';
  }

  @override
  String get orientationFlippedTooltip =>
      'Oriëntatie omgedraaid tik voor normaal';

  @override
  String get orientationNormalTooltip =>
      'Oriëntatie normaal tik om om te draaien';

  @override
  String get noSteps => 'Geen stappen';

  @override
  String stepProgress(int current, int total) {
    return 'Stap $current van $total';
  }

  @override
  String get completed => 'Voltooid';

  @override
  String get paused => 'Gepauzeerd';

  @override
  String get running => 'Wordt uitgevoerd';

  @override
  String get ready => 'Gereed';

  @override
  String stepsProgress(int current, int total) {
    return 'Stappen: $current / $total';
  }

  @override
  String get waiting => 'Wachten';

  @override
  String secondsRemaining(num seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
            locale: localeName, decimalDigits: 1);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Nog $secondsString s';
  }

  @override
  String millisecondsShort(int ms) {
    return '$ms ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Tik op Doorgaan wanneer je klaar bent voor de volgende stap.';

  @override
  String get error => 'Fout';

  @override
  String get macroCompleted => 'Macro voltooid';

  @override
  String finishedIn(Object duration) {
    return 'Voltooid in $duration';
  }

  @override
  String get sequence => 'Stappen';

  @override
  String waitMilliseconds(int ms) {
    return 'Wacht $ms ms';
  }

  @override
  String get runAgain => 'Opnieuw uitvoeren';

  @override
  String get startMacro => 'Macro starten';

  @override
  String get continueAction => 'Doorgaan';

  @override
  String get unnamedRemote => 'Afstandsbediening zonder naam';

  @override
  String get enterMacroName => 'Voer een naam voor de macro in.';

  @override
  String get addAtLeastOneStep => 'Voeg minstens één stap toe.';

  @override
  String get fixInvalidSteps =>
      'Herstel de ongeldige stappen voordat je opslaat.';

  @override
  String get unknownCommand => 'Onbekende opdracht';

  @override
  String get unnamedCommand => 'Naamloze opdracht';

  @override
  String get iconCommand => 'Knop met pictogram';

  @override
  String get selectDelay => 'Wachttijd kiezen';

  @override
  String keepMilliseconds(int ms) {
    return '$ms ms behouden';
  }

  @override
  String get custom => 'Aangepast';

  @override
  String get enterCustomDelayDuration => 'Voer een andere wachttijd in';

  @override
  String millisecondsLong(int ms) {
    String _temp0 = intl.Intl.pluralLogic(
      ms,
      locale: localeName,
      other: '$ms milliseconden',
      one: '$ms milliseconde',
    );
    return '$_temp0';
  }

  @override
  String secondsLong(num seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$secondsString seconden',
      one: '$secondsString seconde',
    );
    return '$_temp0';
  }

  @override
  String get customDelay => 'Eigen wachttijd';

  @override
  String get delayMillisecondsLabel => 'Wachttijd (ms)';

  @override
  String get delayMillisecondsHint => '3000';

  @override
  String get recommendedDelayRange =>
      '1.000 milliseconden = 1 seconde. Geef je apparaat voldoende tijd om te reageren.';

  @override
  String get enterValidPositiveNumber =>
      'Voer een geheel getal groter dan nul in.';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Afstandsbediening';

  @override
  String get macroName => 'Macronaam';

  @override
  String get macroNameHint => 'bijv. Filmavond';

  @override
  String stepsTitleCount(int count) {
    return 'Stappen ($count)';
  }

  @override
  String get noStepsYet => 'Nog geen stappen';

  @override
  String get addCommandsAndDelaysHint =>
      'Voeg opdrachten, wachttijden of pauzes voor bevestiging toe. Ze worden in de getoonde volgorde uitgevoerd.';

  @override
  String get addStep => 'Stap toevoegen';

  @override
  String get reorderStepsHint =>
      'Sleep de handgreep om een stap te verplaatsen. Tik op een stap om deze te bewerken.';

  @override
  String reorderStep(int index) {
    return 'Stap $index verplaatsen';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Houd ingedrukt en sleep om de stap te verplaatsen';

  @override
  String deleteStep(int index) {
    return 'Stap $index verwijderen';
  }

  @override
  String get invalidStepTapToFix =>
      'Ongeldige stap. Tik om deze te herstellen.';

  @override
  String get sendIrCommand => 'IR-opdracht verzenden';

  @override
  String get waitForUserConfirmation =>
      'Pauzeert totdat je de macro laat doorgaan.';

  @override
  String get notImplemented => 'Niet geïmplementeerd';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Breed';

  @override
  String get iconButton => 'Pictogramknop';

  @override
  String get imageButton => 'Afbeeldingsknop';

  @override
  String get noSignalInfo => 'Geen signal info';

  @override
  String get proceed => 'Doorgaan';

  @override
  String get discard => 'Verwerpen';

  @override
  String get continueEditing => 'Verder bewerken';

  @override
  String get unsavedChangesTitle => 'Niet-opgeslagen wijzigingen';

  @override
  String get unsavedMacroChangesMessage =>
      'Wijzigingen aan deze macro verwerpen? Ze worden niet opgeslagen.';

  @override
  String get stopMacroBeforeLeaving =>
      'Stop de macro voordat je dit scherm verlaat.';

  @override
  String get stopTestingBeforeLeaving =>
      'Stop testing before leaving this screen.';

  @override
  String get idle => 'Inactief';

  @override
  String get start => 'Start';

  @override
  String get resume => 'Hervatten';

  @override
  String get pause => 'Pauze';

  @override
  String get stopped => 'Gestopt';

  @override
  String get copy => 'Kopiëren';

  @override
  String get send => 'Verzenden';

  @override
  String get step => 'Stap';

  @override
  String get addToRemote => 'Toevoegen to remote';

  @override
  String get noDescriptionAvailable => 'Geen description available.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Kaseikyo-leverancier moet precies 4 hexcijfers zijn.';

  @override
  String get irFinderDatabaseNotReady => 'Database is nog niet klaar.';

  @override
  String get irFinderSelectBrandFirst =>
      'Selecteereer eerst een merk in Instellen.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute-force is nog niet beschikbaar voor dit protocol.';

  @override
  String get irFinderInvalidPrefix => 'Ongeldig voorvoegsel.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Merk: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Model: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Toets: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Afstandsbediening #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Voer een op nul gebaseerde index in binnen gefilterde en geordende databaseresultaten.';

  @override
  String get irFinderJumpCursorHelper =>
      'Voer een op nul gebaseerde hexcursor in binnen de brute-force-ruimte.';

  @override
  String get irFinderSetupTab => 'Instellen';

  @override
  String get irFinderTestTab => 'Test';

  @override
  String get irFinderResultsTab => 'Resultaten';

  @override
  String get irFinderContinueToTest => 'Doorgaan to Test';

  @override
  String get irFinderKaseikyoVendorTitle => 'Kaseikyo-leverancier';

  @override
  String get irFinderCustomVendorLabel => 'Aangepaste leverancier 4 hex';

  @override
  String get irFinderBrowseDbCandidates => 'Bladeren DB candidates…';

  @override
  String get irFinderEditSetup => 'Bewerken Setup';

  @override
  String get irFinderNoSavedHits =>
      'Geen opslaand hits yet. In the Test page, press \"Opslaan hit\" when the apparaat responds.';

  @override
  String get irFinderBackToTest => 'Terug naar Test';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Grote zoekruimte';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'This brute-force space is very large ($human possibilities). IR Finder will still respect your max attempts and cooldown, but be mindful of spamming IR apparaten.\n\nRecommendation: use Database mode first, and/or enter known prefix bytes to reduce the space.';
  }

  @override
  String get irFinderDatabaseSession => 'Databasesessie';

  @override
  String get irFinderBruteforceSession => 'Brute-force-sessie';

  @override
  String get irFinderResumeLastSession => 'Hervatten last session';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Merk: $brand · Model: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Voorvoegsel: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Voortgang: $progress · Gestart: $when';
  }

  @override
  String get irFinderApplyResume => 'Apply & Hervatten';

  @override
  String get irFinderBruteforceMode => 'Brute-force';

  @override
  String get irFinderDatabaseAssistedMode => 'Database-ondersteund';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Protocol: $name';
  }

  @override
  String get irFinderProtocolLabel => 'IR-protocol';

  @override
  String get irFinderProtocolHelper =>
      'Bediening encoding and therefore the zoeken space.';

  @override
  String get irFinderKnownPrefixLabel =>
      'Bekend voorvoegsel hexbytes optioneel';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Payload: $digits hexcijfer(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Payload: $digits hexcijfer(s) · Voorbeeld: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Payload: $digits hexcijfer(s) · Max voorvoegsel: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Payload: $digits hexcijfer(s) · Voorbeeld: $example · Max voorvoegsel: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Voorbeeld: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Enter any known first bytes to reduce the zoeken space.';

  @override
  String get irFinderDatabaseMode => 'Database';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Genormaliseerd voorvoegsel: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Genormaliseerd voorvoegsel';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Brute-force is nog niet geconfigureerd voor dit protocol.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Alles ($value)';
  }

  @override
  String get irFinderTestControls => 'Testbediening';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Payloadlengte: $digits hexcijfer(s).';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Zoekruimte: $value possibilities (after prefix constraints).';
  }

  @override
  String get irFinderCooldownMs => 'Afkoeling (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Max pogingen per run';

  @override
  String get irFinderTestAllCombinations => 'Test alle combinaties';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Runs until the zoeken space is exhausted. Effective limit: $value';
  }

  @override
  String get irFinderAttempts => 'Pogingen';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Schuifbereik: 1–$max typ elk getal voor grotere waarden';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Max\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Effectieve limiet in deze run: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Tip gebruik eerst Databasemodus brute-force werkt het best met een bekend voorvoegsel bijvoorbeeld de eerste 1–4 bytes.';

  @override
  String get irFinderDatabaseInitFailed => 'Database initialization mislukt.';

  @override
  String get irFinderPreparingDatabase =>
      'Lokale IR-codedatabase wordt voorbereid…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Database-assisted zoeken';

  @override
  String get irFinderBrand => 'Merk';

  @override
  String get irFinderSelectBrand => 'Selecteer brand';

  @override
  String get irFinderModelOptional => 'Model optioneel';

  @override
  String get irFinderSelectBrandFirstShort => 'Selecteer a brand first';

  @override
  String get irFinderSelectModelRecommended =>
      'Selecteereer een model aanbevolen';

  @override
  String get irFinderOnlySelectedProtocol => 'Only geselecteerd protocol';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Filters keys to the geselecteerd protocol. Disable it to browse all protocols.';

  @override
  String get irFinderQuickWinsFirst => 'Snelle treffers eerst';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Geeft prioriteit aan POWER, MUTE, VOL en CH-achtige toetsen vóór diepere toetsen.';

  @override
  String get irFinderMaxKeysPerRun => 'Max toetsen om te testen per run';

  @override
  String get irFinderTesting => 'Testen…';

  @override
  String get irFinderCooldown => 'Afkoeling';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'Modus';

  @override
  String get irFinderRetryLast => 'Laatste opnieuw';

  @override
  String get irFinderTrigger => 'Trigger';

  @override
  String get irFinderJump => 'Springen…';

  @override
  String get irFinderSaveHit => 'Opslaan hit';

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
    return 'Laatst geteste code: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Start testen om de laatst geteste code te zien.';

  @override
  String irFinderFromDb(Object value) {
    return 'Uit DB: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'Uit brute-force gegenereerd door protocolencoder.';

  @override
  String irFinderSendError(Object error) {
    return 'Verzendfout: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Bron: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Results support Test and Copy immediately. Direct add-to-remote integration can be extended further in the bewerkenor flow.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Bladeren DB candidates';

  @override
  String get irFinderFilterByLabelOrHex => 'Filter op label of hex…';

  @override
  String get irFinderJumpHere => 'Hierheen springen';

  @override
  String get irFinderSelectModel => 'Selecteer model';

  @override
  String get irFinderSearchBrands => 'Zoeken brands…';

  @override
  String get irFinderSearchModels => 'Zoeken models…';

  @override
  String get iconPickerTitle => 'Selecteer Pictogram';

  @override
  String get iconPickerSearchHint => 'Zoeken icons..';

  @override
  String get iconPickerNoIconsFound => 'Geen icons found';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count pictogrammen beschikbaar';
  }

  @override
  String get iconPickerCategoryAll => 'Alles';

  @override
  String get iconPickerCategoryMedia => 'Media';

  @override
  String get iconPickerCategoryVolume => 'Volume';

  @override
  String get iconPickerCategoryNavigation => 'Navigatie';

  @override
  String get iconPickerCategoryPower => 'Aan/uit';

  @override
  String get iconPickerCategoryNumbers => 'Cijfers';

  @override
  String get iconPickerCategorySettings => 'Instellingen';

  @override
  String get iconPickerCategoryDisplay => 'Display';

  @override
  String get iconPickerCategoryInput => 'Ingang';

  @override
  String get iconPickerCategoryFavorite => 'Favoriet';

  @override
  String get universalPowerTitle => 'Universele Power';

  @override
  String get universalPowerRunTab => 'Uitvoeren';

  @override
  String get universalPowerUseResponsibly => 'Verantwoord gebruiken';

  @override
  String get universalPowerConsentBody =>
      'Universal Power cycles IR power codes. Use it only on apparaten you own or control. Stop zodra het apparaat reageert.';

  @override
  String get universalPowerConsentCheckbox => 'Ik bezit of beheer het apparaat';

  @override
  String get universalPowerSetupBody =>
      'Cycles power codes for your geselecteerd brand. Stop zodra het apparaat reageert.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Laatst verzonden: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Geen powercodes gevonden. Probeer de zoekopdracht te verbreden.';

  @override
  String get universalPowerUnableToStart => 'Kan niet starten.';

  @override
  String get universalPowerAllBrands => 'Alle merken geen filter';

  @override
  String get universalPowerClearBrandFilter => 'Merkfilter wissen';

  @override
  String get universalPowerBroadenSearch =>
      'Breid de zoekopdracht indien nodig uit';

  @override
  String get universalPowerBroadenSearchHint =>
      'Als geen powerlabels worden gevonden, neem dan andere toetsen op.';

  @override
  String get universalPowerAdditionalPatternsDepth =>
      'Diepte van extra patronen';

  @override
  String get universalPowerDepth1 => 'Alleen prioriteit POWER/OFF';

  @override
  String get universalPowerDepth2 => 'POWER-aliassen opnemen';

  @override
  String get universalPowerDepth3 => 'Secundaire powerlabels opnemen';

  @override
  String get universalPowerDepth4 => 'Alle labels opnemen laagste prioriteit';

  @override
  String get universalPowerLoopUntilStopped => 'Herhalen tot gestopt';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Blijft de wachtrij doorlopen tot je stopt.';

  @override
  String get universalPowerDelayBetweenCodes => 'Vertraging tussen codes';

  @override
  String get universalPowerStart => 'Start Universele Power';

  @override
  String get universalPowerRunStatus => 'Uitvoerstatus';

  @override
  String universalPowerProgress(Object value) {
    return 'Voortgang: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Gepauzeerd omdat de app naar de achtergrond ging.';

  @override
  String get universalPowerSendOneCode => 'Verzend één code';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Stop zodra het apparaat reageert.';

  @override
  String get iconNamePlay => 'Afspelen';

  @override
  String get iconNamePause => 'Pauze';

  @override
  String get iconNameStop => 'Stoppen';

  @override
  String get iconNameFastForward => 'Snel vooruit';

  @override
  String get iconNameRewind => 'Terugspoelen';

  @override
  String get iconNameSkipNext => 'Overslaan Next';

  @override
  String get iconNameSkipPrevious => 'Overslaan Previous';

  @override
  String get iconNameReplay => 'Opnieuw afspelen';

  @override
  String get iconNameForward10S => '10s vooruit';

  @override
  String get iconNameForward30S => '30s vooruit';

  @override
  String get iconNameReplay10S => '10s terug';

  @override
  String get iconNameReplay30S => '30s terug';

  @override
  String get iconNameRecord => 'Opnemen';

  @override
  String get iconNameRecordAlt => 'Alternatieve opname';

  @override
  String get iconNameEject => 'Uitwerpen';

  @override
  String get iconNameShuffle => 'Willekeurig';

  @override
  String get iconNameRepeat => 'Herhalen';

  @override
  String get iconNameRepeatOne => 'Eén herhalen';

  @override
  String get iconNameVolumeUp => 'Volume omhoog';

  @override
  String get iconNameVolumeDown => 'Volume omlaag';

  @override
  String get iconNameVolumeOff => 'Volume uit';

  @override
  String get iconNameMute => 'Dempen';

  @override
  String get iconNameSpeaker => 'Luidspreker';

  @override
  String get iconNameSurroundSound => 'Surroundgeluid';

  @override
  String get iconNameEqualizer => 'Equalizer';

  @override
  String get iconNameAudio => 'Audio';

  @override
  String get iconNameMicrophone => 'Microfoon';

  @override
  String get iconNameMicOff => 'Mic uit';

  @override
  String get iconNameUp => 'Omhoog';

  @override
  String get iconNameDown => 'Omlaag';

  @override
  String get iconNameLeft => 'Links';

  @override
  String get iconNameRight => 'Rechts';

  @override
  String get iconNameArrowUp => 'Pijl omhoog';

  @override
  String get iconNameArrowDown => 'Pijl omlaag';

  @override
  String get iconNameArrowLeft => 'Pijl links';

  @override
  String get iconNameArrowRight => 'Pijl rechts';

  @override
  String get iconNameNavigation => 'Navigatie';

  @override
  String get iconNameChevronLeft => 'Chevron links';

  @override
  String get iconNameChevronRight => 'Chevron rechts';

  @override
  String get iconNameExpandLess => 'Minder uitvouwen';

  @override
  String get iconNameExpandMore => 'Meer uitvouwen';

  @override
  String get iconNameCollapse => 'Inklappen';

  @override
  String get iconNameExpand => 'Uitvouwen';

  @override
  String get iconNameCircleUp => 'Cirkel omhoog';

  @override
  String get iconNameCircleDown => 'Cirkel omlaag';

  @override
  String get iconNameCircleLeft => 'Cirkel links';

  @override
  String get iconNameCircleRight => 'Cirkel rechts';

  @override
  String get iconNameOkSelect => 'OK/Selecteer';

  @override
  String get iconNameConfirm => 'Bevestigen';

  @override
  String get iconNameCancel => 'Annuleren';

  @override
  String get iconNameClose => 'Sluiten';

  @override
  String get iconNameHome => 'Start';

  @override
  String get iconNameReturn => 'Terug';

  @override
  String get iconNameExit => 'Afsluiten';

  @override
  String get iconNameUndo => 'Ongedaan maken';

  @override
  String get iconNameRedo => 'Opnieuw';

  @override
  String get iconNamePower => 'Aan/uit';

  @override
  String get iconNamePowerAlt => 'Power alt';

  @override
  String get iconNamePowerOff => 'Power Off';

  @override
  String get iconNameOn => 'On';

  @override
  String get iconNameOff => 'Off';

  @override
  String get iconNameToggleOn => 'Toggle On';

  @override
  String get iconNameToggleOff => 'Toggle Off';

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
  String get iconNameOne => 'One';

  @override
  String get iconNameTwo => 'Two';

  @override
  String get iconNameThree => 'Three';

  @override
  String get iconNameFour => 'Four';

  @override
  String get iconNameFive => 'Five';

  @override
  String get iconNameSix => 'Six';

  @override
  String get iconNamePlus => 'Plus';

  @override
  String get iconNameMinus => 'Minus';

  @override
  String get iconNameAddCircle => 'Toevoegen Circle';

  @override
  String get iconNameRemoveCircle => 'Verwijderen Circle';

  @override
  String get iconNameSettings => 'Instellingen';

  @override
  String get iconNameMenu => 'Menu';

  @override
  String get iconNameMoreVertical => 'More Vertical';

  @override
  String get iconNameMoreHorizontal => 'More Horizontal';

  @override
  String get iconNameTune => 'Tune';

  @override
  String get iconNameRemoteSettings => 'Afstandsbediening Instellingen';

  @override
  String get iconNameInfo => 'Info';

  @override
  String get iconNameInfoOutline => 'Info Outline';

  @override
  String get iconNameHelp => 'Hulp';

  @override
  String get iconNameHelpOutline => 'Help Outline';

  @override
  String get iconNameList => 'List';

  @override
  String get iconNameViewList => 'View List';

  @override
  String get iconNameViewGrid => 'View Grid';

  @override
  String get iconNameApps => 'Apps';

  @override
  String get iconNameWidgets => 'Widgets';

  @override
  String get iconNameTv => 'TV';

  @override
  String get iconNameMonitor => 'Monitor';

  @override
  String get iconNameDesktop => 'Desktop';

  @override
  String get iconNameBrightnessHigh => 'Brightness High';

  @override
  String get iconNameBrightnessMedium => 'Brightness Middel';

  @override
  String get iconNameBrightnessLow => 'Brightness Low';

  @override
  String get iconNameAutoBrightness => 'Auto Brightness';

  @override
  String get iconNameLightMode => 'Licht Mode';

  @override
  String get iconNameDarkMode => 'Dark Mode';

  @override
  String get iconNameContrast => 'Contrast';

  @override
  String get iconNameHdrOn => 'HDR On';

  @override
  String get iconNameHdrOff => 'HDR Off';

  @override
  String get iconNameAspectRatio => 'Aspect Ratio';

  @override
  String get iconNameCrop => 'Crop';

  @override
  String get iconNameZoomIn => 'Zoom In';

  @override
  String get iconNameZoomOut => 'Zoom Out';

  @override
  String get iconNameFullscreen => 'Fullscreen';

  @override
  String get iconNameExitFullscreen => 'Exit Fullscreen';

  @override
  String get iconNameFitScreen => 'Fit Screen';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'Crop Free';

  @override
  String get iconNameInput => 'Ingang';

  @override
  String get iconNameCable => 'Cable';

  @override
  String get iconNameCast => 'Cast';

  @override
  String get iconNameCastConnected => 'Cast Connected';

  @override
  String get iconNameScreenShare => 'Screen Share';

  @override
  String get iconNameBluetooth => 'Bluetooth';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => 'Router';

  @override
  String get iconNameMemory => 'Memory';

  @override
  String get iconNameGameConsole => 'Game Console';

  @override
  String get iconNameGaming => 'Gaming';

  @override
  String get iconNameMedia => 'Media';

  @override
  String get iconNameMusicQueue => 'Music Queue';

  @override
  String get iconNameVideoLibrary => 'Video Library';

  @override
  String get iconNamePhotoLibrary => 'Photo Library';

  @override
  String get iconNameComponent => 'Component';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => 'Composite';

  @override
  String get iconNameAntenna => 'Antenna';

  @override
  String get iconNameFavorite => 'Favoriet';

  @override
  String get iconNameFavoriteOutline => 'Favoriet Outline';

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
  String get iconNameDone => 'Klaar';

  @override
  String get iconNameDoneAll => 'Klaar All';

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
  String get iconNameLight => 'Licht';

  @override
  String get iconNameLightOutline => 'Licht Outline';

  @override
  String get iconNameWarmLight => 'Warm Licht';

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
  String get iconNameSearch => 'Zoeken';

  @override
  String get iconNameRefresh => 'Vernieuwen';

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
  String get iconNameFolder => 'Folder';

  @override
  String get iconNameDelete => 'Verwijderen';

  @override
  String get iconNameEdit => 'Bewerken';

  @override
  String get iconNameSave => 'Opslaan';

  @override
  String get iconNameShare => 'Share';

  @override
  String get iconNamePrint => 'Print';

  @override
  String get iconNameLanguage => 'Taal';

  @override
  String get iconNameTranslate => 'Translate';

  @override
  String get iconNameMicNone => 'Mic None';

  @override
  String get iconNameSubtitles => 'Subtitles';

  @override
  String get iconNameClosedCaption => 'Sluitend Caption';

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
  String get iconNameVideoSettings => 'Video Instellingen';

  @override
  String get iconNameAudioTrack => 'Audio Track';

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
  String get iconNamePauseFa => 'Pause FA';

  @override
  String get iconNameStopFa => 'Stop FA';

  @override
  String get iconNamePlayFaOutline => 'Play FA Outline';

  @override
  String get iconNamePauseFaOutline => 'Pause FA Outline';

  @override
  String get iconNameStopFaOutline => 'Stop FA Outline';

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
  String get iconNameVolumeHighFa => 'Volume High FA';

  @override
  String get iconNameVolumeLowFa => 'Volume Low FA';

  @override
  String get iconNameVolumeOffFa => 'Volume Off FA';

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
  String get iconNameCloseFa => 'Close FA';

  @override
  String get iconNameCloseCircleFa => 'Close Circle FA';

  @override
  String get iconNameHomeFa => 'Home FA';

  @override
  String get iconNameUndoFa => 'Undo FA';

  @override
  String get iconNameRedoFa => 'Redo FA';

  @override
  String get iconNameRotateFa => 'Rotate FA';

  @override
  String get iconNameSearchFa => 'Search FA';

  @override
  String get iconNameRefreshFa => 'Refresh FA';

  @override
  String get iconNamePowerOffFa => 'Power Off FA';

  @override
  String get iconNamePlugFa => 'Plug FA';

  @override
  String get iconNameToggleOnFa => 'Toggle On FA';

  @override
  String get iconNameToggleOffFa => 'Toggle Off FA';

  @override
  String get iconNameSettingsFa => 'Settings FA';

  @override
  String get iconNameSettingsAltFa => 'Settings Alt FA';

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
  String get iconNameHelpFa => 'Help FA';

  @override
  String get iconNameHelpFaOutline => 'Help FA Outline';

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
  String get iconNameLightFa => 'Light FA';

  @override
  String get iconNameLightFaOutline => 'Light FA Outline';

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
  String get iconNameImagesFa => 'Images FA';

  @override
  String get iconNameImageFa => 'Image FA';

  @override
  String get iconNameVideoFileFa => 'Video File FA';

  @override
  String get iconNameAudioFileFa => 'Audio File FA';

  @override
  String get iconNamePlayOutlineFa => 'Play Outline FA';

  @override
  String get iconNamePlaySimpleFa => 'Play Simple FA';

  @override
  String get iconNamePauseSimpleFa => 'Pause Simple FA';

  @override
  String get iconNameStopSimpleFa => 'Stop Simple FA';

  @override
  String get iconNameRecordFa => 'Record FA';

  @override
  String get iconNameStopCircleFa => 'Stop Circle FA';

  @override
  String get iconNameLoadingFa => 'Loading FA';

  @override
  String get iconNameTextFa => 'Text FA';

  @override
  String get iconNameTextSizeFa => 'Text Size FA';

  @override
  String get iconNameLanguageFa => 'Language FA';

  @override
  String get iconNameGlobeFa => 'Globe FA';

  @override
  String get iconNameSubtitlesAltFa => 'Subtitles Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Subtitles Alt Outline FA';

  @override
  String get iconNameChannelUpFa => 'Channel Up FA';

  @override
  String get iconNameChannelDownFa => 'Channel Down FA';

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
  String get iconNameRedButtonFa => 'Red Button FA';

  @override
  String get iconNameButtonOutlineFa => 'Button Outline FA';

  @override
  String get iconNameSquareButtonFa => 'Square Button FA';

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
  String get iconNameTimerStartFa => 'Timer Start FA';

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
  String get unknownLabel => 'Onbekend';

  @override
  String get selectedFilesLabel => 'geselecteerd file(s)';

  @override
  String get folderNotFoundOrInaccessible =>
      'Map niet gevonden of niet toegankelijk.';

  @override
  String get importedRemoteDefaultName => 'ImporterenedAfstandsbediening';

  @override
  String get demoRemoteName => 'Demo Afstandsbediening';

  @override
  String get protocolFieldsInvalid =>
      'Fill vereist protocol fields and ensure frequency is 15k–60k if set.';

  @override
  String get unknownProtocolSelected => 'Onbekend protocol geselecteerd.';

  @override
  String get continueSectionTitle => 'Continue';

  @override
  String get continueSectionSubtitle => 'Pick up where you left off.';

  @override
  String get continueLastRemoteTitle => 'Laatst gebruikt';

  @override
  String get continueLastMacroTitle => 'Last macro';

  @override
  String get continueLastIrFinderHitTitle => 'Last IR Finder hit';

  @override
  String get continueTargetUnavailable => 'Dit item is niet meer beschikbaar.';

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
  String get pinnedRemoteLabel => 'Vastgezet';

  @override
  String get pinRemote => 'Afstandsbediening vastzetten';

  @override
  String get unpinRemote => 'Afstandsbediening losmaken';

  @override
  String get pinRemoteSubtitle =>
      'Zet deze afstandsbediening bovenaan om hem snel terug te vinden.';

  @override
  String get remoteAddedToPinned => 'Afstandsbediening vastgezet.';

  @override
  String get remoteRemovedFromPinned => 'Afstandsbediening losgemaakt.';

  @override
  String get homeDeviceControlsTitle => 'Snelle bediening';

  @override
  String get homeDeviceControlsSubtitle =>
      'Aan/uit, dempen en volume zonder een afstandsbediening te openen.';

  @override
  String get homeDeviceControlsEmptySubtitle =>
      'Stel aan/uit-, demp- en volumeknoppen in bij Apparaatbediening.';

  @override
  String get showDeviceControlsOnHome =>
      'Snelle bediening op startscherm tonen';

  @override
  String get showDeviceControlsOnHomeSubtitle =>
      'Toon de compacte rij voor Aan/uit, Dempen en Volume op het hoofdscherm.';

  @override
  String get homeDeviceControlsShown => 'Snelle bediening zichtbaar in de app.';

  @override
  String get homeDeviceControlsHidden =>
      'Snelle bediening verborgen in de app.';

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
  String get globalSearchNoResults => 'Geen resultaten gevonden.';

  @override
  String get globalSearchTypeRemote => 'Afstandsbediening';

  @override
  String get globalSearchTypeButton => 'Knop';

  @override
  String get globalSearchTypeMacro => 'Macro';

  @override
  String get learningModeCaptureFailed =>
      'Het signaal kon niet worden ontvangen.';

  @override
  String get learningModeReplaySent => 'Signaal verzonden.';

  @override
  String get learningModeReplayFailed =>
      'Het opgenomen signaal kon niet worden verzonden.';

  @override
  String get learningModeNoRemotesAvailable =>
      'Er zijn nog geen afstandsbedieningen opgeslagen.';

  @override
  String get learningModeChooseRemoteTitle => 'Kies een afstandsbediening';

  @override
  String get learningModeNewRemoteTitle => 'Afstandsbediening maken';

  @override
  String get learningModeSaveSuccess => 'Knop opgeslagen.';

  @override
  String get learningModeSaveFailed => 'De knop kon niet worden opgeslagen.';

  @override
  String get remoteSetupIntro =>
      'Kies een naam en indeling voor je afstandsbediening. Voeg daarna knoppen toe.';

  @override
  String get startWithDefault => 'Standaardnaam';

  @override
  String get browseGithubStore => 'GitHub bekijken';

  @override
  String get addFirstButton => 'Eerste knop toevoegen';

  @override
  String get moreWaysToStart => 'Andere manieren om knoppen toe te voegen';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Instellingen voor de nieuwe afstandsbediening verwerpen? Je wijzigingen worden niet opgeslagen.';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Wijzigingen aan deze afstandsbediening verwerpen? Ze worden niet opgeslagen.';

  @override
  String get firstButtonAdded => 'Eerste knop toegevoegd.';

  @override
  String get iconColorTitle => 'Icoonkleur';

  @override
  String get iconColorHelper =>
      'Kies een symboolkleur die goed zichtbaar blijft op de achtergrond van de knop.';

  @override
  String get colorRed => 'Rood';

  @override
  String get colorPink => 'Roze';

  @override
  String get colorPurple => 'Paars';

  @override
  String get colorDeepPurple => 'Donkerpaars';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorBlue => 'Blauw';

  @override
  String get colorLightBlue => 'Lichtblauw';

  @override
  String get colorCyan => 'Cyaan';

  @override
  String get colorTeal => 'Groenblauw';

  @override
  String get colorGreen => 'Groen';

  @override
  String get colorLightGreen => 'Lichtgroen';

  @override
  String get colorLime => 'Lime';

  @override
  String get colorYellow => 'Geel';

  @override
  String get colorAmber => 'Amber';

  @override
  String get colorOrange => 'Oranje';

  @override
  String get colorDeepOrange => 'Donkeroranje';

  @override
  String get colorBrown => 'Bruin';

  @override
  String get colorGrey => 'Grijs';

  @override
  String get colorBlueGrey => 'Blauwgrijs';

  @override
  String get colorBlack => 'Zwart';

  @override
  String get colorWhite => 'Wit';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Knopkleur $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Knopkleur $colorName, geselecteerd';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Icoonkleur $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Icoonkleur $colorName, geselecteerd';
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

  @override
  String get quickSettingsTilesTitle => 'Tegels voor snelle instellingen';

  @override
  String get quickSettingsPowerTile => 'Aan/uit-tegel';

  @override
  String get quickSettingsMuteTile => 'Dempen-tegel';

  @override
  String get quickSettingsVolumeUpTile => 'Volume omhoog-tegel';

  @override
  String get quickSettingsVolumeDownTile => 'Volume omlaag-tegel';

  @override
  String get quickSettingsNoTilesConfigured => 'Geen tegels ingesteld';

  @override
  String get quickSettingsEmptyHint =>
      'Volgende stap: kies een opdracht voor minstens één tegel en voeg de tegel daarna toe via het bewerkingsmenu van Android Snelle instellingen.';

  @override
  String get quickSettingsSetPowerTile => 'Aan/uit-tegel instellen';

  @override
  String get quickSettingsConfiguredHint =>
      'Kies welke knop elke tegel verstuurt. Voeg tegels toe via het bewerkingsmenu van Android Snelle instellingen.';

  @override
  String get quickSettingsNotSet => 'Niet ingesteld';

  @override
  String quickSettingsTileMappingSummary(String title, String subtitle) {
    return '$title · $subtitle';
  }

  @override
  String get quickSettingsPickButtonTooltip => 'Knop kiezen';

  @override
  String get quickSettingsClearTooltip => 'Wissen';

  @override
  String get homeWidgetUnsupportedLauncher =>
      'Voeg de IR Blaster-widget toe via het widgetmenu van je startscherm.';

  @override
  String get homeWidgetButtonUnsupported =>
      'Deze knop kan niet als widget aan het startscherm worden toegevoegd.';

  @override
  String get homeWidgetRequestSent =>
      'Widget aangevraagd. Bevestig het toevoegen op je startscherm als daarom wordt gevraagd.';

  @override
  String get homeWidgetRequestRejected =>
      'Widget aanvragen mislukt. Probeer de widget via je startscherm toe te voegen.';

  @override
  String homeWidgetSetupFailed(String error) {
    return 'Widget instellen mislukt: $error';
  }

  @override
  String get addHomeWidget => 'Startschermwidget toevoegen';

  @override
  String get addHomeWidgetSubtitle => 'Plaats deze knop op je startscherm.';

  @override
  String buttonInfoType(String type) {
    return 'Type: $type';
  }

  @override
  String get buttonInfoCodeRaw => 'Code: ruw signaal';

  @override
  String buttonInfoCode(String code) {
    return 'Code: $code';
  }

  @override
  String get buttonInfoNoCode => 'GEEN CODE';

  @override
  String buttonInfoFrequency(String frequency) {
    return 'Frequentie: $frequency';
  }

  @override
  String get frequencyHzLabel => 'Frequentie (Hz)';

  @override
  String get carrierFrequencyHelper => 'Draaggolffrequentie, bijv. 38000';

  @override
  String get requiredFrequencyHelper => 'Vereist. Voorbeeld: 38000';

  @override
  String get validFrequencyError => 'Voer een geldige frequentie in (15k-60k).';

  @override
  String get resetToDefaultFrequency => 'Terugzetten naar 38000';

  @override
  String get rawDataLabel => 'Ruwe data';

  @override
  String get rawDataHelper =>
      'Hele getallen gescheiden door spaties, bijv. 9000 4500 560 560 ...';

  @override
  String get rawDataInvalid =>
      'Ruwe data moet bestaan uit hele getallen gescheiden door spaties of nieuwe regels.';

  @override
  String get rawDataSafeguard =>
      'Beveiliging: ongeldige tokens worden geblokkeerd om te voorkomen dat een niet-verzendbaar patroon wordt opgeslagen.';

  @override
  String get protocolLabel => 'Protocol';

  @override
  String get protocolEncodingHelper =>
      'Codering is alleen geïmplementeerd voor protocollen die als geïmplementeerd zijn gemarkeerd.';

  @override
  String get protocolFrequencyHelper =>
      'Optioneel. Indien leeg wordt de standaardfrequentie van het protocol gebruikt wanneer beschikbaar.';

  @override
  String get rawSignalInvalidWithFrequency =>
      'Ruwe data moet bestaan uit hele getallen gescheiden door spaties of nieuwe regels, en de frequentie moet 15k-60k zijn.';

  @override
  String get necTimingsNumeric => 'Alle NEC-timings moeten numeriek zijn.';

  @override
  String get frequencyRangeError => 'De frequentie moet 15k-60k Hz zijn.';

  @override
  String get pasteTooltip => 'Plakken';

  @override
  String get clearTooltip => 'Wissen';

  @override
  String irFinderResumeMask(Object value) {
    return 'Masker: $value';
  }

  @override
  String get irFinderKnownMaskLabel => 'Bekend codemasker (optioneel)';

  @override
  String get irFinderKnownMaskHint => '00FFXXFF, FFXXFF of 0xA1XX';

  @override
  String irFinderKnownMaskHelper(int digits, Object example) {
    return 'Payload van $digits cijfers. Gebruik X voor onbekende cijfers; weggelaten eindcijfers worden X. Voorbeeld: $example';
  }

  @override
  String get irFinderKnownMaskInvalidCharacters =>
      'Gebruik alleen hex-cijfers, X-jokers, spaties, dubbele punten, streepjes of underscores.';

  @override
  String irFinderKnownMaskTooLong(int digits) {
    return 'Het masker is langer dan de payload van $digits cijfers van dit protocol.';
  }

  @override
  String irFinderNormalizedMaskValue(Object value) {
    return 'Genormaliseerd masker: $value';
  }

  @override
  String get irFinderNormalizedMask => 'Genormaliseerd masker';

  @override
  String get irFinderNormalizedMaskAllUnknown => 'Alle cijfers onbekend';

  @override
  String get irFinderSearchOrder => 'Zoekvolgorde';

  @override
  String get irFinderSmartOrder => 'Slim';

  @override
  String get irFinderSequentialOrder => 'Opeenvolgend';

  @override
  String get irFinderSmartOrderHint =>
      'Protocolbewust: test eerst veelvoorkomende lage waarden, spreidt daarna over opdracht- en apparaatvelden en slaat genegeerde bits over.';

  @override
  String get irFinderSequentialOrderHint =>
      'Compatibiliteitsmodus: test jokercijfers in oplopende hexadecimale volgorde.';

  @override
  String irFinderSmartMeaningfulBits(int bits) {
    return 'De slimme modus varieert $bits betekenisvolle bit(s) voor dit masker.';
  }

  @override
  String get irFinderBruteforceMaskTip =>
      'Tip: vervang elk onbekend cijfer door X. Bekende cijfers op elke positie kunnen de zoekruimte sterk verkleinen.';

  @override
  String get automationBroadcastsTitle => 'Automatiseringsbroadcasts toestaan';

  @override
  String get automationBroadcastsSubtitle =>
      'Elke geïnstalleerde app kan IR-opdrachten verzenden via de ingebouwde zender, USB of audio, ook als deze app gesloten is. USB vereist vooraf toestemming. Audio vereist een IR-adapter en een hoger mediavolume.';

  @override
  String get automationSettingsError =>
      'De automatiseringsinstelling kon niet worden geladen of opgeslagen. Probeer het opnieuw.';

  @override
  String get settingsHardwareTitle => 'IR-hardware en leren';

  @override
  String get settingsHardwareSubtitle =>
      'Kies een zender, beheer USB en leer signalen';

  @override
  String get settingsAppearanceSubtitle => 'Thema, kleuren en app-taal';

  @override
  String get settingsInteractionSubtitle =>
      'Opstarten, trillen, afstandsbedieningen en automatisering';

  @override
  String get settingsToolsTitle => 'Hulpmiddelen en snelkoppelingen';

  @override
  String get settingsToolsSubtitle =>
      'Apparaatbediening, snelle instellingen, GitHub Store en universele aan/uit-knop';

  @override
  String get layoutCustom => 'Aangepast';

  @override
  String get layoutCustomDescription =>
      'Kies het aantal kolommen en de knopvorm. Voeg lege plekken toe in de editor.';

  @override
  String get layoutColumns => 'Knoppen per rij';

  @override
  String get layoutShape => 'Knopvorm';

  @override
  String get layoutCircle => 'Cirkel';

  @override
  String get layoutRoundedSquare => 'Afgerond vierkant';

  @override
  String get layoutRectangle => 'Rechthoek';

  @override
  String get layoutReflowHint =>
      'Een ander aantal kolommen deelt het raster opnieuw in. Veeg zijwaarts als het raster breder is dan het scherm.';

  @override
  String get layoutUpdated => 'Indeling bijgewerkt';

  @override
  String get layoutArrange => 'Knoppen rangschikken';

  @override
  String get layoutAddRow => 'Lege rij toevoegen';

  @override
  String get layoutArrangeHint =>
      'Houd een knop ingedrukt en sleep hem, of tik op de knop en daarna op de nieuwe plek. Staat daar al een knop, dan wisselen ze van plaats.';

  @override
  String get layoutEmptyHint =>
      'Tik op een leeg vak om een knop toe te voegen of op een knop om die te bewerken. Houd een knop ingedrukt voor meer opties.';

  @override
  String layoutCell(int row, int column) {
    return 'Rij $row, kolom $column';
  }

  @override
  String get dbBrandSearchHelp =>
      'Begin met het merk, zoals Sony of TCL. Kies daarna een apparaat- of afstandsbedieningsmodel.';

  @override
  String get dbModelSearchHelp =>
      'Zoek het model dat op je apparaat of afstandsbediening staat. Spaties en koppeltekens hoeven niet overeen te komen.';

  @override
  String get irFinderDatabaseSearchHint =>
      'Kies eerst een merk in de databasemodus om bekende codes zonder duplicaten te testen. Slimme brute force geeft voorrang aan bepaalde mogelijkheden, maar kan geen reactie van het apparaat detecteren. Sla een treffer op wanneer je een reactie ziet.';

  @override
  String get irFinderClearSearchToJump =>
      'Wis de zoekopdracht om naar een testpositie te springen.';

  @override
  String get crashReportTitle => 'De vorige keer is een probleem opgetreden';

  @override
  String get crashReportExplanation =>
      'Een lokaal foutrapport bevat technische gegevens over de app, het apparaat en de fout. Er wordt niets automatisch verzonden. Controleer op gevoelige informatie voordat je deelt. Delen bewaart het rapport; Niet verzenden verwijdert het; Niet nu bewaart het voor de volgende start.';

  @override
  String get crashReportDetails => 'Rapport bekijken';

  @override
  String get crashReportShare => 'Rapport delen';

  @override
  String get crashReportEmail => 'Support e-mailen';

  @override
  String get crashReportCopied => 'Rapport gekopieerd.';

  @override
  String get crashReportDontSend => 'Niet verzenden';

  @override
  String get crashReportNotNow => 'Niet nu';

  @override
  String get crashReportActionFailed =>
      'Deze actie kon niet worden voltooid. Het rapport is nog opgeslagen. Probeer het te kopiëren of te delen.';

  @override
  String get shareTitle => 'Delen en ontvangen';

  @override
  String get shareReceive => 'Ontvangen';

  @override
  String get shareScan => 'QR-code scannen';

  @override
  String get shareOpenFile => 'Gedeeld bestand openen';

  @override
  String get shareSelect => 'Kies wat je wilt delen';

  @override
  String get shareSend => 'Delen met een ander apparaat';

  @override
  String get shareQr => 'QR-code tonen';

  @override
  String get shareQrHint =>
      'Open op de andere telefoon IR Blaster > Afstandsbedieningen > Delen en ontvangen > QR-code scannen.';

  @override
  String get shareTooLarge =>
      'Te veel gegevens voor een leesbare QR-code. Deel met een ander apparaat.';

  @override
  String get sharePreview => 'Gedeelde items controleren';

  @override
  String get sharePrivacy =>
      'Geen account of server nodig. Niets wordt automatisch verzonden of uitgezonden. Het ontvangende apparaat heeft een geschikte IR-zender nodig.';

  @override
  String get shareHardwareWarning =>
      'Sommige geleerde signalen vereisen de oorspronkelijke hardware en werken mogelijk niet op een ander apparaat.';

  @override
  String get shareMacroInfo =>
      'Macro’s bevatten de bijbehorende afstandsbedieningen en knoppen. Importeren maakt nieuwe kopieën; niets wordt overschreven of automatisch uitgevoerd.';

  @override
  String get shareAdd => 'Kopieën toevoegen';

  @override
  String get shareAdded => 'Gedeelde items toegevoegd.';

  @override
  String get shareDestination => 'Knop toevoegen aan';

  @override
  String get shareCamera =>
      'Sta cameratoegang toe om QR-codes te scannen of open een gedeeld bestand.';

  @override
  String get shareInvalid =>
      'Deze gedeelde gegevens zijn ongeldig, te groot of gebruiken een niet-ondersteunde versie.';

  @override
  String get sharePrepareFailed =>
      'Delen kon niet worden voorbereid. Controleer ontbrekende afbeeldingen, macroknoppen of een te grote selectie.';

  @override
  String get shareFailed =>
      'Delen of opslaan is niet gelukt. Je bestaande items zijn niet vervangen.';

  @override
  String get updatesTitle => 'App-updates';

  @override
  String get updatesAutomatic => 'Automatisch op updates controleren';

  @override
  String get updatesPrivacyGithub =>
      'Standaard uitgeschakeld. Indien ingeschakeld, maakt de app tijdens gebruik eenmaal per dag verbinding met GitHub. Geen automatische downloads.';

  @override
  String get updatesPrivacyPlay =>
      'Standaard uitgeschakeld. Indien ingeschakeld, maakt de app tijdens gebruik eenmaal per dag verbinding met Google Play. Geen automatische downloads.';

  @override
  String get updatesUnknown => 'Onbekend';

  @override
  String get updatesChooseSource => 'Updatebron kiezen';

  @override
  String get updatesCheck => 'Nu controleren';

  @override
  String get updatesNever => 'Nog niet gecontroleerd';

  @override
  String updatesLastChecked(String date) {
    return 'Laatst gecontroleerd: $date';
  }

  @override
  String updatesAvailable(String version) {
    return 'Nieuwe versie: $version';
  }

  @override
  String get updatesCurrent => 'Geen nieuwere versie gevonden.';

  @override
  String get updatesFailed =>
      'Update mislukt. Controleer je verbinding en probeer opnieuw. Incompatibele APK’s worden geblokkeerd; er worden geen appgegevens verwijderd.';

  @override
  String get updatesFdroidNote =>
      'GitHub kan een versie aankondigen voordat F-Droid deze heeft gebouwd. Werk bij via F-Droid om een compatibele handtekening en je gegevens te behouden.';

  @override
  String get updatesOpenFdroid => 'F-Droid openen';

  @override
  String get updatesOpenPlay => 'Google Play openen';

  @override
  String get updatesDownload => 'Update downloaden';

  @override
  String get updatesInstall => 'Update installeren';

  @override
  String get updatesAllowInstall => 'Installatie toestaan';

  @override
  String get updatesInstallHint =>
      'Android kan toestemming vragen om vanuit deze app te installeren. Ga daarna hier terug en tik op Update installeren. Je afstandsbedieningen en macro’s blijven behouden.';

  @override
  String get updatesReady => 'Update gedownload en klaar voor installatie.';

  @override
  String get updatesNoAsset =>
      'Er is geen geverifieerde APK voor dit apparaat. Bekijk de releaseopmerkingen.';

  @override
  String get updatesReleaseNotes => 'Releaseopmerkingen';

  @override
  String updatesChannel(String source) {
    return 'Updatebron: $source';
  }

  @override
  String updatesDownloadConfirm(String size) {
    return '$size MB downloaden van GitHub? Installatie vereist jouw bevestiging.';
  }

  @override
  String get learningModeIncompleteSignal =>
      'Het signaal lijkt onvolledig. Houd de afstandsbediening dichter bij de ontvanger en probeer het opnieuw.';

  @override
  String get learningModeUseUsb => 'USB-adapter gebruiken';

  @override
  String get learningModeSwitchedUsb => 'USB-adapter geselecteerd.';

  @override
  String learningModeSwitchUsbFailed(String error) {
    return 'Kan niet overschakelen naar de USB-adapter: $error';
  }

  @override
  String get learningModeAudioUnavailableTitle =>
      'Leren via audio niet mogelijk';

  @override
  String get learningModeAudioUnavailableBody =>
      'Audio-IR-accessoires kunnen in deze app opdrachten verzenden, maar geen signalen leren. Gebruik een ontvanger die de leerfunctie ondersteunt.';

  @override
  String learningModeBuiltInReceiver(String brand) {
    return 'Ingebouwde IR-ontvanger van $brand';
  }

  @override
  String get learningModeUsbReceiver => 'USB-ontvanger met leerfunctie';

  @override
  String learningModeDefaultRemoteName(String buttonName) {
    return 'Afstandsbediening $buttonName';
  }

  @override
  String get learningModeSupportedReceivers =>
      'Gebruik een ontvanger die deze app ondersteunt:\n• Een compatibele USB-IR-adapter van Tiqiaa, ZaZa of ElkSmart\n• Een ondersteunde Huawei-/Honor-telefoon met IR-ontvangst\n• Een ondersteunde LG-telefoon met UEI Quickset\n\nNiet alle modellen hebben een leerfunctie.';

  @override
  String learningModeCapturedWith(String device) {
    return 'Opgenomen met $device';
  }

  @override
  String get learningModeLgReplayRestriction =>
      'Dit signaal kan alleen worden verzonden met de LG-telefoon waarmee het is opgenomen.';

  @override
  String learningModeTimingCount(int count) {
    return 'Tijdsintervallen: $count';
  }

  @override
  String get learningModeUnknownCarrier => 'Draaggolffrequentie onbekend';

  @override
  String learningModeByteCount(int count) {
    return 'Bytes: $count';
  }
}
