// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Caricamento…';

  @override
  String get unknownError => 'Errore sconosciuto';

  @override
  String get failedToStart => 'Avvio non riuscito';

  @override
  String get retry => 'Riprova';

  @override
  String get quickTilePower => 'Accensione';

  @override
  String get quickTileMute => 'Muto';

  @override
  String get quickTileVolumeUp => 'Vol +';

  @override
  String get quickTileVolumeDown => 'Vol -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Questo telefono non ha un emettitore IR integrato. È stato rilevato un dongle IR USB, ma il permesso non è ancora concesso.\n\nApprova il prompt del permesso USB per attivare l\'invio IR.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'Questo telefono non ha un emettitore IR integrato. È stato rilevato un dongle IR USB, ma il permesso USB è stato negato.\n\nRichiedi di nuovo il permesso e approva il prompt per attivare l\'invio IR.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'Questo telefono non ha un emettitore IR integrato. Il dongle IR USB è autorizzato, ma non è ancora inizializzato.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Questo telefono non ha un emettitore IR integrato. Il dongle IR USB è rilevato e autorizzato, ma non ha potuto inizializzarsi.\n\nRicollega il dongle e riprova.';

  @override
  String get homeUsbReadyMessage =>
      'Questo telefono non ha un emettitore IR integrato.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Questo telefono non ha un emettitore IR integrato e al momento non è collegato alcun dongle IR USB supportato.\n\nPuoi ancora creare, importare e gestire telecomandi, ma per trasmettere segnali IR ti serve una delle opzioni sotto.';

  @override
  String get homeUsbOptionPlugIn =>
      'Collega un dongle IR USB supportato, poi approva il permesso.';

  @override
  String get homeUsbOptionReady => 'Pronto all\'uso.';

  @override
  String get homeUsbOptionPermissionRequired =>
      'Collegato. Permesso richiesto.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Permesso negato. Richiedilo di nuovo.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Autorizzato. Inizializzazione dongle.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Autorizzato, ma inizializzazione fallita.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Questo telefono non ha IR integrato. Collega un dongle IR USB o attiva la modalità Audio in Impostazioni.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Dongle USB rilevato. Permesso richiesto per inviare IR.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Permesso USB negato. Richiedilo di nuovo per inviare IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Dongle USB autorizzato. In attesa di inizializzazione.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Dongle USB autorizzato, ma inizializzazione fallita.';

  @override
  String get homeHardwareBannerReady => 'USB pronto.';

  @override
  String get homeHardwareRequiredTitle =>
      'Hardware IR richiesto per inviare comandi';

  @override
  String get homeUsbDongleRecommended => 'Dongle IR USB consigliato';

  @override
  String get homeAudioAdapterAlternative => 'Adattatore IR audio alternativo';

  @override
  String get homeAudioAdapterDescription =>
      'Impostazioni → Trasmettitore IR → Audio (1 LED / 2 LED). Richiede un adattatore audio-IR.';

  @override
  String get close => 'Chiudi';

  @override
  String get homeChooseTransmitter => 'Scegli un trasmettitore';

  @override
  String get openSettings => 'Apri Impostazioni';

  @override
  String get homeUsbPermissionSentApprove =>
      'Richiesta permesso USB inviata. Approva il prompt per attivare USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'Nessun dongle IR USB supportato rilevato. Collegalo e riprova.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Richiesta permesso USB fallita.';

  @override
  String get working => 'In corso…';

  @override
  String get requestUsbPermission => 'Richiedi permesso USB';

  @override
  String get homeHardwareTip =>
      'Suggerimento. Puoi ancora creare e organizzare telecomandi ora. L\'hardware serve solo in trasmissione.';

  @override
  String get homeNoIrTransmitterTitle => 'Nessun trasmettitore IR disponibile';

  @override
  String get settingsNavLabel => 'Impostazioni';

  @override
  String get dismiss => 'Ignora';

  @override
  String get remotesNavLabel => 'Telecomandi';

  @override
  String get macrosNavLabel => 'Macro';

  @override
  String get signalTesterNavLabel => 'Tester segnale';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get remoteNoIrEmitterTitle => 'Nessun emettitore IR';

  @override
  String get remoteNoIrEmitterMessage =>
      'Questo dispositivo non ha un emettitore IR';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Questa app richiede un emettitore IR';

  @override
  String get remoteDismiss => 'Ignora';

  @override
  String get remoteClose => 'Chiudi';

  @override
  String remoteFailedToSend(Object error) {
    return 'Invio IR fallito: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Avvio loop fallito: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Loop fermato, invio fallito: $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Loop di \"$title\". Tocca Stop nella barra in alto per fermarlo.';
  }

  @override
  String get remoteLoopStopped => 'Loop fermato.';

  @override
  String get remoteUpdatedNotFound =>
      'Telecomando aggiornato sullo schermo. Non è stato trovato nell\'elenco salvato.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Aggiornato \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Eliminazione fallita: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'Telecomando non trovato nell\'elenco salvato.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Eliminato \"$name\".';
  }

  @override
  String get buttonFallbackTitle => 'Pulsante';

  @override
  String get imageFallbackTitle => 'Immagine';

  @override
  String get noBrowserAvailable => 'Nessun browser disponibile';

  @override
  String failedToOpen(Object error) {
    return 'Apertura fallita: $error';
  }

  @override
  String get cancel => 'Annulla';

  @override
  String get settingsRestoreDemoTitle => 'Ripristinare i telecomandi demo?';

  @override
  String get settingsRestoreDemoMessage =>
      'Questo sostituirà i telecomandi attuali con quelli demo integrati. È consigliato un backup se vuoi mantenere l\'elenco attuale.';

  @override
  String get settingsRestoreDemoConfirm => 'Ripristina demo';

  @override
  String get settingsDemoRemotesRestored => 'Telecomandi demo ripristinati.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Eliminare tutti i telecomandi?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Rimuove tutti i telecomandi da questo dispositivo. Questa azione non può essere annullata.';

  @override
  String get settingsDeleteAllConfirm => 'Elimina tutto';

  @override
  String get settingsAllRemotesDeleted => 'Tutti i telecomandi eliminati.';

  @override
  String get themeAuto => 'Tema auto';

  @override
  String get themeLight => 'Tema chiaro';

  @override
  String get themeDark => 'Tema scuro';

  @override
  String get themeDescAuto => 'Segue le impostazioni del dispositivo';

  @override
  String get themeDescLight => 'Sempre chiaro e limpido';

  @override
  String get themeDescDark => 'Più riposante per gli occhi';

  @override
  String get themeHintAuto =>
      'Il tema cambia automaticamente quando il dispositivo passa tra modalità chiara e scura';

  @override
  String get themeHintLight =>
      'Perfetto per uso diurno e ambienti ben illuminati';

  @override
  String get themeHintDark =>
      'Riduce l\'affaticamento visivo con poca luce e risparmia batteria sugli schermi OLED';

  @override
  String get supportDevelopmentTitle => 'Supporta lo sviluppo';

  @override
  String get supportDevelopmentSubtitle =>
      'Aiuta a mantenere IR Blaster compatibile e aggiornato';

  @override
  String get supportDevelopmentBody =>
      'Niente pubblicità, niente tracciamento, nessuna funzione bloccata. Il tuo supporto finanzia il lavoro sui protocolli, il supporto ai dongle USB e una migliore compatibilità tra dispositivi.';

  @override
  String get donate => 'Dona';

  @override
  String get starRepo => 'Metti stella al repo';

  @override
  String get repositoryLinkCopied => 'Link del repository copiato';

  @override
  String get supportPillLocalOnly => 'Solo locale';

  @override
  String get supportPillNoTracking => 'Nessun tracciamento';

  @override
  String get supportPillHardwareAware => 'Consapevole hardware';

  @override
  String get supportPillOpenSource => 'Open source';

  @override
  String get appearanceTitle => 'Aspetto';

  @override
  String get appearanceSubtitle => 'Personalizza l\'esperienza visiva';

  @override
  String get localizationTitle => 'Localizzazione';

  @override
  String get localizationSubtitle => 'Lingua app e comportamento traduzioni';

  @override
  String localizationAutoUsing(Object language) {
    return 'Auto. usa $language';
  }

  @override
  String get localizationAutoDescription =>
      'L\'app segue la lingua del dispositivo quando possibile.';

  @override
  String get localizationManualDescription =>
      'La lingua dell\'app è impostata manualmente.';

  @override
  String get useSystemLanguageTitle => 'Usa lingua di sistema';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Segue la lingua del dispositivo: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Usa la lingua scelta sotto invece di quella predefinita del dispositivo.';

  @override
  String get chooseAppLanguage => 'Scegli lingua app';

  @override
  String get languagePickerDisabledHint =>
      'Disattiva la lingua di sistema per scegliere manualmente una lingua.';

  @override
  String get searchLanguages => 'Cerca lingue';

  @override
  String get noLanguagesFound => 'Nessuna lingua corrispondente';

  @override
  String get localizationHint =>
      'Quando la lingua di sistema è attiva, l\'app segue la lingua del dispositivo e usa l\'inglese se una traduzione non è disponibile. Disattivala per bloccare l\'app su una lingua specifica.';

  @override
  String get appLanguageTitle => 'Lingua app';

  @override
  String get appLanguageHint =>
      'Auto segue la lingua del dispositivo. Scegli qui Inglese o Francese per sovrascriverla solo nell\'app.';

  @override
  String get languageAuto => 'Auto sistema';

  @override
  String get languageAutoDescription =>
      'Segui automaticamente la lingua del dispositivo';

  @override
  String get languageEnglish => 'Inglese';

  @override
  String get languageEnglishDescription => 'Forza sempre l\'uso dell\'inglese';

  @override
  String get languageFrench => 'Francese';

  @override
  String get languageFrenchDescription => 'Forza sempre l\'uso del francese';

  @override
  String get languageAutoShort => 'Auto';

  @override
  String get languageEnglishShort => 'Inglese';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'Usa colori dinamici';

  @override
  String get themeChoiceAuto => 'Auto';

  @override
  String get themeChoiceLight => 'Chiaro';

  @override
  String get themeChoiceDark => 'Scuro';

  @override
  String get irTransmitterTitle => 'Trasmettitore IR';

  @override
  String get irTransmitterSubtitle =>
      'Scegli l\'hardware che invia i comandi IR';

  @override
  String get interactionTitle => 'Interazione';

  @override
  String get interactionSubtitle => 'Feedback tocco e layout telecomando';

  @override
  String get hapticFeedbackTitle => 'Feedback aptico';

  @override
  String get hapticFeedbackSubtitle => 'Vibra su tocchi e azioni';

  @override
  String get intensity => 'Intensità';

  @override
  String get intensityLight => 'Leggera';

  @override
  String get intensityMedium => 'Media';

  @override
  String get intensityStrong => 'Forte';

  @override
  String get flipRemoteDefaultTitle => 'Capovolgi Telecomando per default';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Apri le schermate Telecomando ruotate di 180° per i dongle USB montati in basso.';

  @override
  String get remoteViewFlipped => 'La vista Telecomando si aprirà capovolta.';

  @override
  String get remoteViewNormal => 'La vista Telecomando si aprirà normale.';

  @override
  String get backupTitle => 'Backup';

  @override
  String get backupSubtitle => 'Importa esporta telecomandi e macro';

  @override
  String get importBackup => 'Importa backup';

  @override
  String get importBackupSubtitle =>
      'Importa backup di telecomandi macro o file Flipper Zero, LIRC o IRPLUS';

  @override
  String get bulkImportFolder => 'Importa cartella in blocco';

  @override
  String get bulkImportFolderSubtitle =>
      'Importa più telecomandi da una cartella';

  @override
  String get exportBackup => 'Esporta backup';

  @override
  String get exportBackupSubtitle =>
      'Salva telecomandi e macro come un unico file JSON in Download';

  @override
  String get restoreDemoRemotes => 'Ripristina telecomandi demo';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Sostituisci i telecomandi attuali con quelli demo integrati';

  @override
  String get deleteAllRemotes => 'Elimina tutti i telecomandi';

  @override
  String get deleteAllRemotesSubtitle =>
      'Rimuovi tutti i telecomandi da questo dispositivo';

  @override
  String get backupTip =>
      'Suggerimento. Esporta un backup prima di grandi modifiche. L\'import supporta backup completi, vecchi backup JSON solo telecomandi e file .ir di Flipper Zero.';

  @override
  String get aboutTitle => 'Informazioni';

  @override
  String get aboutSubtitle => 'Info app e dettagli open source';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Versione $version';
  }

  @override
  String get sourceCode => 'Codice sorgente';

  @override
  String get viewOnGitHub => 'Vedi su GitHub';

  @override
  String get repositoryUrlCopied => 'URL repository copiato';

  @override
  String get reportIssue => 'Segnala problema';

  @override
  String get reportIssueSubtitle => 'Segnalazioni bug e richieste funzioni';

  @override
  String get issuesUrlCopied => 'URL issue copiato';

  @override
  String get license => 'Licenza';

  @override
  String get openSourceLicense => 'Licenza open source';

  @override
  String get licenseUrlCopied => 'URL licenza copiato';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Visita il nostro sito';

  @override
  String get companyUrlCopied => 'URL azienda copiato';

  @override
  String get licenses => 'Licenze';

  @override
  String get openSourceLicenses => 'Licenze open source';

  @override
  String byCreator(Object creator) {
    return 'di $creator';
  }

  @override
  String get deviceControlsTitle => 'Controlli dispositivo';

  @override
  String get deviceControlsSubtitle =>
      'Mostra i pulsanti preferiti nella pagina dei controlli dispositivo di sistema';

  @override
  String get manageFavorites => 'Gestisci preferiti';

  @override
  String get manageFavoritesSubtitle =>
      'Scegli quali pulsanti appaiono nei controlli dispositivo';

  @override
  String get quickSettingsTitle => 'Impostazioni rapide';

  @override
  String get quickSettingsSubtitle =>
      'Aggiungi riquadri per scorciatoie accensione e volume';

  @override
  String get configureTiles => 'Configura riquadri';

  @override
  String get configureTilesSubtitle =>
      'Mappa i riquadri ai pulsanti del telecomando';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Ciclo universale di accensione per dispositivi posseduti';

  @override
  String get openTvKill => 'Apri TVKill';

  @override
  String get openTvKillSubtitle =>
      'Scorri i codici di accensione solo sui dispositivi che possiedi';

  @override
  String get failedToLoadTransmitterSettings =>
      'Caricamento impostazioni trasmettitore fallito.';

  @override
  String get usbStatusReady =>
      'Il dongle USB è collegato e pronto a inviare IR.';

  @override
  String get usbStatusPermissionRequired =>
      'Dongle USB rilevato. Richiedi il permesso USB e approva il prompt di sistema.';

  @override
  String get usbStatusPermissionDenied =>
      'Il permesso USB è stato negato per il dongle collegato. Richiedilo di nuovo e approva il prompt.';

  @override
  String get usbStatusPermissionGranted =>
      'Il permesso USB è concesso. Il dongle deve ancora inizializzarsi prima di poter inviare IR.';

  @override
  String get usbStatusOpenFailed =>
      'Il permesso USB è concesso, ma il dongle non ha potuto inizializzarsi. Ricollegalo e riprova.';

  @override
  String get usbStatusNoDevice => 'Nessun dongle IR USB supportato rilevato.';

  @override
  String get usbSelectPermissionRequired =>
      'Dongle USB rilevato ma non autorizzato. Tocca \"Richiedi permesso USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'Il permesso USB è stato negato. Tocca \"Richiedi permesso USB\" e approva il prompt.';

  @override
  String get usbSelectPermissionGranted =>
      'Il permesso USB è concesso, ma il dongle non è ancora inizializzato. Prova a ricollegarlo.';

  @override
  String get usbSelectOpenFailed =>
      'Il permesso USB è concesso, ma il dongle non ha potuto inizializzarsi. Ricollegalo e riprova.';

  @override
  String get usbSelectNoDevice =>
      'Nessun dongle IR USB supportato rilevato. Collegalo, poi tocca \"Richiedi permesso USB\".';

  @override
  String get usbSelectReady => 'Dongle USB pronto.';

  @override
  String get autoSwitchEnabledMessage =>
      'Cambio automatico attivo. Usa USB quando collegato, altrimenti Interno.';

  @override
  String get autoSwitchDisabledMessage =>
      'Cambio automatico disattivato. La scelta del trasmettitore ora è manuale.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Aggiornamento cambio automatico fallito.';

  @override
  String get failedToSwitchTransmitter => 'Cambio trasmettitore fallito.';

  @override
  String get deviceHasNoInternalIr =>
      'Questo dispositivo non ha un emettitore IR integrato.';

  @override
  String get audioModeEnabledMessage =>
      'Modalità Audio attiva. Usa volume media massimo e un adattatore LED audio-IR.';

  @override
  String get usbPermissionRequestSent => 'Richiesta permesso USB inviata.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Richiesta permesso USB inviata. Approva il prompt per attivare USB.';

  @override
  String get usbAlreadyReady => 'Il dongle USB è già inizializzato e pronto.';

  @override
  String get failedToRequestUsbPermission => 'Richiesta permesso USB fallita.';

  @override
  String get transmitterHelpInternal =>
      'Usa l\'emettitore IR integrato del telefono per inviare comandi.';

  @override
  String get transmitterHelpUsb =>
      'Usa un dongle IR USB, permesso richiesto, per inviare comandi.';

  @override
  String get transmitterHelpAudio1 =>
      'Usa uscita audio in mono. Richiede un adattatore LED audio-IR e volume media alto.';

  @override
  String get transmitterHelpAudio2 =>
      'Usa uscita audio in stereo. Usa due canali per pilotaggio LED migliore con adattatori compatibili.';

  @override
  String get transmitterInternal => 'IR interno';

  @override
  String get transmitterUsb => 'Dongle IR USB';

  @override
  String get transmitterAudio1 => 'Audio 1 LED';

  @override
  String get transmitterAudio2 => 'Audio 2 LED';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Caricamento capacità trasmettitore fallito.';

  @override
  String get selectedTransmitter => 'Trasmettitore selezionato';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Attivo: $active';
  }

  @override
  String get refresh => 'Aggiorna';

  @override
  String get autoSwitchTitle => 'Cambio automatico';

  @override
  String get autoSwitchDisabledWhileAudio => 'Disattivato in modalità Audio';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Usa USB quando collegato, altrimenti Interno';

  @override
  String get unavailableOnThisDevice => 'Non disponibile su questo dispositivo';

  @override
  String get openOnUsbAttachTitle => 'Apri al collegamento USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android può suggerire di aprire l\'app quando viene collegato un dongle IR USB supportato.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Suggerirà l\'apertura di IR Blaster quando viene collegato un dongle USB supportato.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Non suggerirà l\'apertura al collegamento USB.';

  @override
  String get failedToUpdateSetting => 'Aggiornamento impostazione fallito.';

  @override
  String get unnamedButton => 'Pulsante senza nome';

  @override
  String get iconFallback => 'Icona';

  @override
  String get remoteListReorderHint =>
      'Modalità riordino. Tieni premuto e trascina una scheda per spostarla.';

  @override
  String get deleteRemoteTitle => 'Eliminare telecomando?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" sarà rimosso in modo permanente. Questa azione non può essere annullata.';
  }

  @override
  String get delete => 'Elimina';

  @override
  String get addToDeviceControlsTitle => 'Aggiungere ai controlli dispositivo?';

  @override
  String get addToDeviceControlsDescription =>
      'Accesso rapido nei controlli dispositivo di sistema.';

  @override
  String get skip => 'Salta';

  @override
  String get add => 'Aggiungi';

  @override
  String get addedToDeviceControls => 'Aggiunto ai controlli dispositivo.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Eliminato \"$name\". Questa azione non può essere annullata.';
  }

  @override
  String remoteLayoutSummary(Object count, Object layout) {
    return '$count pulsante/i · $layout';
  }

  @override
  String get layoutComfort => 'Comfort';

  @override
  String get layoutCompact => 'Compatto';

  @override
  String get open => 'Apri';

  @override
  String get useThisRemote => 'Usa questo telecomando';

  @override
  String get edit => 'Modifica';

  @override
  String get editRemoteSubtitle => 'Rinomina e modifica pulsanti';

  @override
  String get thisCannotBeUndone => 'Questo non può essere annullato';

  @override
  String get searchRemotes => 'Cerca telecomandi';

  @override
  String get reorderRemotes => 'Riordina telecomandi';

  @override
  String get addRemote => 'Aggiungi telecomando';

  @override
  String get more => 'Altro';

  @override
  String get reorderMode => 'Modalità riordino';

  @override
  String remoteButtonCount(Object count, Object plural) {
    return '$count pulsante$plural';
  }

  @override
  String get noRemotesYet => 'Nessun telecomando ancora';

  @override
  String get noRemotesDescription =>
      'Crea un telecomando per iniziare a inviare codici IR.';

  @override
  String get noRemotesNextStep =>
      'Prossimo passo. Tocca Aggiungi telecomando, poi aggiungi i primi pulsanti.';

  @override
  String get actions => 'Azioni';

  @override
  String get macrosTitle => 'Macro';

  @override
  String get help => 'Aiuto';

  @override
  String get createMacro => 'Crea macro';

  @override
  String get timedMacrosTitle => 'Macro temporizzate';

  @override
  String get timedMacrosSubtitle =>
      'Automatizza sequenze di comandi IR con tempi precisi';

  @override
  String get timedMacrosNextStep =>
      'Prossimo passo. Tocca Crea la tua prima macro, scegli un telecomando, poi aggiungi comandi e ritardi.';

  @override
  String get macroFeatureToysTitle => 'Perfette per giocattoli interattivi';

  @override
  String get macroFeatureToysDescription =>
      'Controlla dispositivi come cani robot i-cybie, robot i-sobot e altri giocattoli che richiedono tempo tra i comandi per elaborare le azioni.';

  @override
  String get macroFeatureTimingTitle => 'Controllo tempi preciso';

  @override
  String get macroFeatureTimingDescription =>
      'Aggiungi ritardi tra i comandi, da 250 ms a durate personalizzate, così il dispositivo ha tempo di rispondere prima dell\'azione successiva.';

  @override
  String get macroFeatureManualTitle => 'Passi con continua manuale';

  @override
  String get macroFeatureManualDescription =>
      'Metti in pausa l\'esecuzione e attendi la tua conferma quando la durata dell\'animazione varia o serve un feedback visivo.';

  @override
  String get exampleUseCase => 'Esempio d\'uso';

  @override
  String get macroExampleText =>
      'Modalità avanzata i-cybie:\n1. Invia il comando \"Modalità\"\n2. Attendi 1000 ms il giocattolo elabora\n3. Invia \"Azione 1\"\n4. Attendi 1000 ms\n5. Invia \"Azione 2\"\n…e così via automaticamente!';

  @override
  String get createFirstMacro => 'Crea la tua prima macro';

  @override
  String get noRemote => 'Nessun telecomando';

  @override
  String macroStepCount(Object count, Object plural) {
    return '$count passaggio$plural';
  }

  @override
  String get aboutTimedMacros => 'Informazioni sulle macro temporizzate';

  @override
  String get aboutTimedMacrosDescription =>
      'Le macro temporizzate ti permettono di automatizzare sequenze di comandi IR con ritardi precisi tra ogni passaggio.';

  @override
  String get sendCommand => 'Invia comando';

  @override
  String get sendCommandDescription =>
      'Trasmette un comando IR dal tuo telecomando.';

  @override
  String get delay => 'Ritardo';

  @override
  String get delayDescription =>
      'Attende una durata specificata, per esempio 1000 ms, prima del passaggio successivo.';

  @override
  String get manualContinue => 'Continua manualmente';

  @override
  String get manualContinueDescription =>
      'Mette in pausa l\'esecuzione finché non tocchi Continua, utile per animazioni di durata variabile.';

  @override
  String get gotIt => 'Capito';

  @override
  String get failedToSaveMacros => 'Salvataggio macro fallito.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Eliminato \"$name\".';
  }

  @override
  String get undo => 'Annulla';

  @override
  String get failedToRestoreMacro => 'Ripristino macro fallito.';

  @override
  String get deleteMacroTitle => 'Eliminare macro?';

  @override
  String get deleteMacroMessage => 'Puoi annullarlo dal prossimo snackbar.';

  @override
  String get noRemotesAvailable => 'Nessun telecomando disponibile.';

  @override
  String remoteButtonCountSummary(Object count) {
    return '$count pulsante/i';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Orientamento. capovolto tocca per normale';

  @override
  String get remoteOrientationNormalTooltip =>
      'Orientamento. normale tocca per capovolgere';

  @override
  String get stopLoop => 'Ferma loop';

  @override
  String get reorderButtons => 'Riordina pulsanti';

  @override
  String get remoteReorderHint =>
      'Modalità riordino. Tieni premuto e trascina un pulsante per spostarlo.';

  @override
  String get manageRemote => 'Gestisci telecomando';

  @override
  String get remoteNoButtons => 'Nessun pulsante in questo telecomando';

  @override
  String get remoteNoButtonsDescription =>
      'Usa \"Modifica telecomando\" per aggiungere o configurare i pulsanti.';

  @override
  String get editRemote => 'Modifica telecomando';

  @override
  String get editRemoteActionsSubtitle =>
      'Rinomina, riordina e modifica pulsanti';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Aggiornato \"$name\".';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Aggiunto \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Pulsante duplicato.';

  @override
  String get loopRunningForButton => 'Il loop è attivo per questo pulsante.';

  @override
  String get loopTip =>
      'Suggerimento. Usa Loop per ripetere finché non lo fermi.';

  @override
  String get codeCopied => 'Codice copiato.';

  @override
  String get copyCode => 'Copia codice';

  @override
  String get startLoop => 'Avvia loop';

  @override
  String get editButtonSubtitle =>
      'Modifica etichetta, codice, protocollo, frequenza';

  @override
  String get newButton => 'Nuovo pulsante';

  @override
  String get newButtonSubtitle => 'Crea un nuovo pulsante dopo questo';

  @override
  String get duplicate => 'Duplica';

  @override
  String get duplicateButtonSubtitle => 'Crea una copia di questo pulsante';

  @override
  String get removeFromDeviceControls => 'Rimuovi dai controlli dispositivo';

  @override
  String get addToDeviceControls => 'Aggiungi ai controlli dispositivo';

  @override
  String get deviceControlsButtonSubtitle =>
      'Mostra questo pulsante nei controlli dispositivo di sistema';

  @override
  String get removedFromDeviceControls => 'Rimosso dai controlli dispositivo.';

  @override
  String get pinQuickTile => 'Fissa ai preferiti Riquadro rapido';

  @override
  String get unpinQuickTile => 'Rimuovi dai preferiti Riquadro rapido';

  @override
  String get quickTileButtonSubtitle =>
      'Mostra questo pulsante in alto nella scelta dei riquadri rapidi';

  @override
  String get removedFromQuickTileFavorites =>
      'Rimosso dai preferiti Riquadro rapido.';

  @override
  String get pinnedToQuickTileFavorites =>
      'Fissato ai preferiti Riquadro rapido.';

  @override
  String get duplicateAndEdit => 'Duplica e modifica';

  @override
  String get duplicateAndEditSubtitle => 'Crea una copia e modificala subito';

  @override
  String get done => 'Fatto';

  @override
  String get run => 'Esegui';

  @override
  String get untitledRemote => 'Telecomando senza titolo';

  @override
  String get createRemoteTitle => 'Crea telecomando';

  @override
  String get editRemoteTitle => 'Modifica telecomando';

  @override
  String get removeButtonTitle => 'Rimuovere pulsante?';

  @override
  String get imageButtonRemovedMessage =>
      'Questo pulsante immagine sarà rimosso.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" sarà rimosso.';
  }

  @override
  String get remove => 'Rimuovi';

  @override
  String importedButtonCount(int count) {
    return 'Importati $count pulsanti.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Importati $count pulsanti dai telecomandi esistenti.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Cambia etichetta, segnale e impostazioni avanzate';

  @override
  String get createButtonCopySubtitle => 'Crea una copia di questo pulsante';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Crea una copia e modificala subito';

  @override
  String get undoAvailableInNextSnackbar =>
      'Puoi annullare dal prossimo snackbar';

  @override
  String get buttonRemoved => 'Pulsante rimosso.';

  @override
  String get remoteNameCannotBeEmpty =>
      'Il nome telecomando non può essere vuoto.';

  @override
  String get saveRemote => 'Salva telecomando';

  @override
  String get remoteName => 'Nome telecomando';

  @override
  String get remoteNameHint => 'es. TV, Climatizzatore, Striscia LED';

  @override
  String get remoteNameHelper => 'Questo nome appare nell\'elenco Telecomandi.';

  @override
  String get layoutStyle => 'Stile layout';

  @override
  String get layoutWideDescription =>
      'Ampio. Pulsanti a 2 colonne con dettagli extra consigliato.';

  @override
  String get layoutCompactDescription =>
      'Compatto. Griglia classica 4× solo icone e testo.';

  @override
  String get importFromRemotes => 'Importa dai telecomandi';

  @override
  String get importFromDatabase => 'Importa dal DB';

  @override
  String get addButton => 'Aggiungi pulsante';

  @override
  String get noButtonsYet => 'Nessun pulsante ancora';

  @override
  String get createRemoteEmptyStateDescription =>
      'Aggiungi il primo pulsante, poi tienilo premuto per opzioni modifica o rimozione.';

  @override
  String get createButtonTitle => 'Crea pulsante';

  @override
  String get editButtonTitle => 'Modifica pulsante';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Caricamento protocolli fallito: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Caricamento tasti database fallito: $error';
  }

  @override
  String get presetPower => 'Accensione';

  @override
  String get presetVolume => 'Volume';

  @override
  String get presetChannel => 'Canale';

  @override
  String get presetNavigation => 'Navigazione';

  @override
  String get all => 'Tutti';

  @override
  String get completeRequiredFieldsToSave =>
      'Completa i campi richiesti per salvare';

  @override
  String get buttonLabelStepTitle => '1 Pulsante etichetta';

  @override
  String get buttonLabelStepSubtitle =>
      'Scegli un\'immagine, un\'icona o digita un\'etichetta testuale.';

  @override
  String get buttonColorStepTitle => '2 Colore pulsante opzionale';

  @override
  String get buttonColorStepSubtitle =>
      'Scegli un colore di sfondo per questo pulsante.';

  @override
  String get selectColor => 'Seleziona colore';

  @override
  String get noImageSelected => 'Nessuna immagine selezionata';

  @override
  String get gallery => 'Galleria';

  @override
  String get builtIn => 'Integrato';

  @override
  String get removeImage => 'Rimuovi immagine';

  @override
  String get requiredSelectImageOrSwitch =>
      'Obbligatorio. Seleziona un\'immagine, scegli un\'icona o passa a Testo.';

  @override
  String get iconSelected => 'Icona selezionata';

  @override
  String get noIconSelected => 'Nessuna icona selezionata';

  @override
  String get chooseIcon => 'Scegli icona';

  @override
  String get removeIcon => 'Rimuovi icona';

  @override
  String get requiredSelectIconOrSwitch =>
      'Obbligatorio. Seleziona un\'icona o passa a Immagine Testo.';

  @override
  String get buttonText => 'Testo pulsante';

  @override
  String get buttonTextHint => 'es. Accensione, Volume +, HDMI 1';

  @override
  String get buttonTextHelper => 'Questo testo apparirà sul pulsante.';

  @override
  String get requiredEnterButtonLabel =>
      'Obbligatorio. inserisci un\'etichetta pulsante.';

  @override
  String get defaultColorName => 'Predefinito';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Nuovo telecomando creato con un pulsante dall\'ultimo hit.';

  @override
  String get selectRemote => 'Seleziona telecomando';

  @override
  String remoteNumber(Object id) {
    return 'Telecomando #$id';
  }

  @override
  String get newRemoteCreated => 'Nuovo telecomando creato.';

  @override
  String get failedToCreateRemote => 'Creazione telecomando fallita.';

  @override
  String get newRemoteEllipsis => 'Nuovo telecomando…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Aggiunto a $name.';
  }

  @override
  String get failedToAddToRemote => 'Aggiunta al telecomando fallita.';

  @override
  String get newRemoteDefaultName => 'New Telecomando';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Saltato all\'offset $offset. In pausa. Premi Riprendi per continuare.';
  }

  @override
  String get sent => 'Inviato.';

  @override
  String failedToSend(Object error) {
    return 'Invio fallito: $error';
  }

  @override
  String get copiedProtocolCode => 'Copiato protocollo codice.';

  @override
  String get savedToResults => 'Salvato nei risultati.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Codice non valido per il protocollo: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Copiato candidato attuale.';

  @override
  String get jumpToOffset => 'Salta a offset';

  @override
  String get jumpToBruteCursor => 'Salta a cursore brute';

  @override
  String get jump => 'Salta';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Saltato al cursore 0x$cursor. In pausa. Premi Riprendi per continuare.';
  }

  @override
  String get irSignalTester => 'Tester segnale IR';

  @override
  String get stop => 'Stop';

  @override
  String get selectButton => 'Seleziona pulsante';

  @override
  String get buttonNotFoundInRemotes => 'Pulsante non trovato nei telecomandi.';

  @override
  String sentNamed(Object name) {
    return 'Inviato \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'Invio fallito: $error';
  }

  @override
  String get noFavoritesYet => 'Nessun preferito ancora';

  @override
  String get deviceControlsEmptyHint =>
      'Tieni premuto un pulsante del telecomando e seleziona “Aggiungi ai controlli dispositivo”.';

  @override
  String get sendTest => 'Invia test';

  @override
  String get testSendCompleted => 'Invio test completato.';

  @override
  String testSendFailed(Object error) {
    return 'Invio test fallito: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Rimosso \"$name\".';
  }

  @override
  String get brand => 'Marca';

  @override
  String get model => 'Modello';

  @override
  String get selectBrand => 'Seleziona marca';

  @override
  String get searchBrand => 'Cerca marca…';

  @override
  String get selectModel => 'Seleziona modello';

  @override
  String get searchModel => 'Cerca modello…';

  @override
  String get unnamedKey => 'Tasto senza nome';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get emDash => '-';

  @override
  String get searchCommands => 'Cerca comandi';

  @override
  String get noMatchingCommands => 'Nessun comando corrispondente';

  @override
  String get quickTileFavoritesTitle => 'Preferiti riquadro rapido';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Cambia mappatura riquadro $tileLabel';
  }

  @override
  String get pickDifferentButton => 'Scegli un pulsante diverso';

  @override
  String get browseAllRemotesEllipsis => 'Sfoglia tutti i telecomandi…';

  @override
  String get invalidMacroFileFormat => 'Formato file macro non valido.';

  @override
  String get failedToParseMacroFile => 'Analisi file macro fallita.';

  @override
  String get deviceCodeLabel => 'Codice dispositivo';

  @override
  String get commandLabel => 'Comando';

  @override
  String get editButtonCodeTitle => 'Modifica codice del pulsante';

  @override
  String get thisRemoteHasNoButtons => 'Questo telecomando non ha pulsanti.';

  @override
  String get selectCommand => 'Seleziona comando';

  @override
  String get databaseModeAutofillHint =>
      'La modalità database compila automaticamente per te il Passo 2, marca, modello e protocollo. Dopo aver importato un tasto puoi rifinire tutto in Manuale.';

  @override
  String get test => 'Test';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Tutti i pulsanti selezionati erano duplicati.';

  @override
  String get noButtonsImported => 'Nessun pulsante importato.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Importati $addedCount pulsanti. Saltati $skippedCount duplicati.';
  }

  @override
  String get importAllMatchingTitle =>
      'Importare tutti i pulsanti corrispondenti?';

  @override
  String get noMatchingKeysFound => 'Nessun tasto corrispondente trovato.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Questo importerà fino a $count tasti corrispondenti dalla selezione attuale del database.';
  }

  @override
  String get importAll => 'Importa tutto';

  @override
  String get importingButtons => 'Importazione pulsanti…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Tutti i pulsanti corrispondenti erano duplicati.';

  @override
  String get quickPresets => 'Preset rapidi';

  @override
  String get selectDeviceFirst => 'Seleziona prima il dispositivo';

  @override
  String get searchByLabelOrHex => 'Cerca per etichetta o esadecimale';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Opzionale. rifinisci i tasti preset $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Seleziona prima marca modello protocollo.';

  @override
  String get importFromDatabaseTitle => 'Importa dal database';

  @override
  String get importFromDatabaseSubtitle =>
      'Scegli un dispositivo, carica i tasti corrispondenti, poi importa i pulsanti selezionati.';

  @override
  String get deviceAndFilters => 'Dispositivo e filtri';

  @override
  String loadedCount(int count) {
    return '$count caricati';
  }

  @override
  String get hideFilters => 'Nascondi filtri';

  @override
  String get showFilters => 'Mostra filtri';

  @override
  String get noProtocolFoundForBrandModel =>
      'Nessun protocollo trovato per questa marca e questo modello.';

  @override
  String get protocolAutoDetected => 'Protocollo';

  @override
  String get protocolAutoDetectedHelper =>
      'Rilevato automaticamente dal database. Puoi cambiarlo prima dell\'importazione.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Seleziona marca, modello e protocollo per caricare i tasti.';

  @override
  String get noKeysFound => 'Nessun tasto trovato.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Nessun tasto trovato per “$query”.';
  }

  @override
  String get skipDuplicates => 'Salta duplicati';

  @override
  String get skipDuplicatesSubtitle =>
      'Non importare pulsanti che esistono già in questo telecomando.';

  @override
  String get importSelected => 'Importa selezionati';

  @override
  String get noMacrosToExport => 'Nessuna macro da esportare.';

  @override
  String get macrosExportedToDownloads => 'Macro esportate in Download.';

  @override
  String get failedToExportMacros => 'Esportazione macro fallita.';

  @override
  String get failedToReadFile => 'Lettura file fallita.';

  @override
  String get importFromExistingRemotesTitle =>
      'Importa da telecomandi esistenti';

  @override
  String selectedCount(int count) {
    return '$count selezionati';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Nessun altro telecomando con pulsanti trovato.';

  @override
  String get sourceRemote => 'Telecomando sorgente';

  @override
  String get searchButtons => 'Cerca pulsanti';

  @override
  String get searchButtonsHint => 'Accensione, Volume, Muto...';

  @override
  String get selectVisible => 'Seleziona visibili';

  @override
  String get clearVisible => 'Pulisci visibili';

  @override
  String protocolNamed(Object name) {
    return 'Protocollo: $name';
  }

  @override
  String get rawSignal => 'Raw';

  @override
  String get legacyCode => 'Codice legacy';

  @override
  String importCount(int count) {
    return 'Importa $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Permesso archiviazione negato, necessario su alcuni vecchi dispositivi Android.';

  @override
  String get backupExportedToDownloads => 'Backup esportato in Download.';

  @override
  String failedToExport(Object error) {
    return 'Esportazione fallita: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Importati $count telecomandi dal backup JSON legacy. Le macro non sono state modificate.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Importazione fallita. il backup \"remotes\" deve essere una lista JSON se presente.';

  @override
  String get importFailedMacrosMustBeList =>
      'Importazione fallita. il backup \"macros\" deve essere una lista JSON se presente.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Importazione fallita. formato backup non valido, attesa lista legacy o mappa con remotes macros.';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Importati $remoteCount telecomandi dal backup. Le macro non sono state modificate.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Importati $remoteCount telecomandi e $macroCount macro dal backup.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Importazione fallita. nessun pulsante valido trovato nel file .ir.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Importato 1 telecomando da Flipper .ir. Le macro non sono state modificate.';

  @override
  String get importFailedInvalidIrplus =>
      'Importazione fallita. file irplus non valido, nessun pulsante valido trovato.';

  @override
  String get importedOneRemoteFromIrplus =>
      'Importato 1 telecomando da irplus. Le macro non sono state modificate.';

  @override
  String get importFailedInvalidLirc =>
      'Importazione fallita. file LIRC non valido, nessun codice valido o raw trovato.';

  @override
  String get importedOneRemoteFromLirc =>
      'Importato 1 telecomando dalla configurazione LIRC. Le macro non sono state modificate.';

  @override
  String get unsupportedFileTypeSelected =>
      'Unsupported file type selezionati.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Importazione fallita. file non valido o illeggibile.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Importazione massiva completata. nessun file supportato trovato nella cartella.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Importazione massiva completata. nessun telecomando importato. Saltati $skippedCount file.';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Importazione massiva completata. importati $importedCount telecomandi da $supportedCount file supportati. Saltati $skippedCount file.';
  }

  @override
  String get storagePermissionDenied => 'Permesso archiviazione negato.';

  @override
  String get bulkImportFailedReadFolder =>
      'Importazione massiva fallita. impossibile leggere il contenuto della cartella.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Importazione massiva completata. nessun file supportato trovato $sourceLabel.';
  }

  @override
  String get clearAction => 'Pulisci';

  @override
  String get saveAction => 'Salva';

  @override
  String buttonsTitleCount(int count) {
    return 'Pulsanti ($count)';
  }

  @override
  String get invalidStepEncountered => 'Passaggio non valido rilevato';

  @override
  String failedToSendNamed(Object name) {
    return 'Invio fallito: $name';
  }

  @override
  String get buttonNotFound => 'Pulsante non trovato';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Pulsante non trovato: $name';
  }

  @override
  String get unknownButton => 'Pulsante sconosciuto';

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
      'Orientamento. capovolto tocca per normale';

  @override
  String get orientationNormalTooltip =>
      'Orientamento. normale tocca per capovolgere';

  @override
  String get noSteps => 'Nessun passaggio';

  @override
  String stepProgress(int current, int total) {
    return 'Passo $current / $total';
  }

  @override
  String get completed => 'Completato';

  @override
  String get paused => 'In pausa';

  @override
  String get running => 'In esecuzione';

  @override
  String get ready => 'Pronto';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total passi';
  }

  @override
  String get waiting => 'In attesa';

  @override
  String secondsRemaining(Object seconds) {
    return '${seconds}s rimanenti';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Tocca Continua quando sei pronto per il passaggio successivo';

  @override
  String get error => 'Errore';

  @override
  String get macroCompleted => 'Macro completata';

  @override
  String finishedIn(Object duration) {
    return 'Terminato in $duration';
  }

  @override
  String get sequence => 'Sequenza';

  @override
  String waitMilliseconds(int ms) {
    return 'Attendi ${ms}ms';
  }

  @override
  String get runAgain => 'Esegui di nuovo';

  @override
  String get startMacro => 'Avvia macro';

  @override
  String get continueAction => 'Continua';

  @override
  String get unnamedRemote => 'Telecomando senza nome';

  @override
  String get enterMacroName => 'Inserisci nome macro';

  @override
  String get addAtLeastOneStep => 'Aggiungi almeno un passaggio';

  @override
  String get fixInvalidSteps => 'Correggi i passaggi non validi';

  @override
  String get unknownCommand => 'Comando sconosciuto';

  @override
  String get unnamedCommand => 'Comando senza nome';

  @override
  String get iconCommand => 'Comando icona';

  @override
  String get selectDelay => 'Seleziona ritardo';

  @override
  String keepMilliseconds(int ms) {
    return 'Mantieni: ${ms}ms';
  }

  @override
  String get custom => 'Personalizzato';

  @override
  String get enterCustomDelayDuration =>
      'Inserisci durata ritardo personalizzata';

  @override
  String millisecondsLong(int ms) {
    return '$ms millisecondi';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds secondo$plural';
  }

  @override
  String get customDelay => 'Ritardo personalizzato';

  @override
  String get delayMillisecondsLabel => 'Ritardo millisecondi';

  @override
  String get delayMillisecondsHint => 'es. 3000';

  @override
  String get recommendedDelayRange =>
      'Consigliato. 250 5000 ms per la maggior parte dei dispositivi';

  @override
  String get enterValidPositiveNumber => 'Inserisci un numero positivo valido';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Telecomando';

  @override
  String get macroName => 'Nome macro';

  @override
  String get macroNameHint => 'es. Modalità avanzata i-cybie';

  @override
  String stepsTitleCount(int count) {
    return 'Passi ($count)';
  }

  @override
  String get noStepsYet => 'Nessun passaggio ancora';

  @override
  String get addCommandsAndDelaysHint =>
      'Aggiungi sotto comandi e ritardi per costruire la sequenza';

  @override
  String get addStep => 'Aggiungi passaggio';

  @override
  String get reorderStepsHint =>
      'Suggerimento. Trascina la maniglia per riordinare i passaggi. Tocca un passaggio per modificarlo.';

  @override
  String reorderStep(int index) {
    return 'Riordina passo $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Premi e trascina per cambiare l\'ordine';

  @override
  String deleteStep(int index) {
    return 'Elimina passo $index';
  }

  @override
  String get invalidStepTapToFix => 'Passaggio non valido tocca per correggere';

  @override
  String get sendIrCommand => 'Invia comando IR';

  @override
  String get waitForUserConfirmation => 'Attendi conferma utente';

  @override
  String get notImplemented => 'Non implementato';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Ampio';

  @override
  String get iconButton => 'Pulsante icona';

  @override
  String get imageButton => 'Pulsante immagine';

  @override
  String get noSignalInfo => 'Nessuna info segnale';

  @override
  String get proceed => 'Procedi';

  @override
  String get discard => 'Scarta';

  @override
  String get idle => 'Inattivo';

  @override
  String get start => 'Avvia';

  @override
  String get resume => 'Riprendi';

  @override
  String get pause => 'Pausa';

  @override
  String get stopped => 'Fermo';

  @override
  String get copy => 'Copia';

  @override
  String get send => 'Invia';

  @override
  String get step => 'Passo';

  @override
  String get addToRemote => 'Aggiungi al telecomando';

  @override
  String get noDescriptionAvailable => 'Nessun description disponibili.';

  @override
  String get notAvailableSymbol => '-';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Il vendor Kaseikyo deve essere esattamente di 4 cifre esadecimali.';

  @override
  String get irFinderDatabaseNotReady => 'Il database non è ancora pronto.';

  @override
  String get irFinderSelectBrandFirst => 'Seleziona prima una marca in Setup.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Il brute-force non è ancora disponibile per questo protocollo.';

  @override
  String get irFinderInvalidPrefix => 'Prefisso non valido.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Marca: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Modello: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Tasto: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Telecomando #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Inserisci un indice base 0 nei risultati filtrati e ordinati del database.';

  @override
  String get irFinderJumpCursorHelper =>
      'Inserisci un cursore esadecimale base 0 nello spazio brute-force.';

  @override
  String get irFinderSetupTab => 'Setup';

  @override
  String get irFinderTestTab => 'Test';

  @override
  String get irFinderResultsTab => 'Risultati';

  @override
  String get irFinderContinueToTest => 'Continua al test';

  @override
  String get irFinderKaseikyoVendorTitle => 'Vendor Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'Vendor personalizzato 4 hex';

  @override
  String get irFinderBrowseDbCandidates => 'Sfoglia candidati DB…';

  @override
  String get irFinderEditSetup => 'Modifica setup';

  @override
  String get irFinderNoSavedHits =>
      'Nessun hit salvato. Nella pagina Test premi \"Salva hit\" quando il dispositivo risponde.';

  @override
  String get irFinderBackToTest => 'Torna al test';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Spazio di ricerca grande';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Questo spazio brute-force è molto grande, $human possibilità. IR Finder rispetterà comunque il massimo dei tentativi e il cooldown, ma evita di bombardare i dispositivi IR.\n\nConsiglio. usa prima la modalità Database e o inserisci byte di prefisso noti per ridurre lo spazio.';
  }

  @override
  String get irFinderDatabaseSession => 'Sessione database';

  @override
  String get irFinderBruteforceSession => 'Sessione brute-force';

  @override
  String get irFinderResumeLastSession => 'Riprendi ultima sessione';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Marca: $brand · Modello: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Prefisso: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Avanzamento: $progress · Avviato: $when';
  }

  @override
  String get irFinderApplyResume => 'Applica e riprendi';

  @override
  String get irFinderBruteforceMode => 'Brute-force';

  @override
  String get irFinderDatabaseAssistedMode => 'Assistita da database';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Protocollo: $name';
  }

  @override
  String get irFinderProtocolLabel => 'Protocollo IR';

  @override
  String get irFinderProtocolHelper =>
      'Controlla la codifica e quindi lo spazio di ricerca.';

  @override
  String get irFinderKnownPrefixLabel => 'Prefisso noto byte hex opzionale';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Payload: $digits cifre esadecimali';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Payload. $digits cifre esadecimali · Esempio. $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Payload. $digits cifre esadecimali · Prefisso max. $bytes byte';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Payload. $digits cifre esadecimali · Esempio. $example · Prefisso max. $bytes byte';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Esempio: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Inserisci eventuali primi byte noti per ridurre lo spazio di ricerca.';

  @override
  String get irFinderDatabaseMode => 'Database';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Prefisso normalizzato: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Prefisso normalizzato';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Il brute-force non è ancora configurato per questo protocollo.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Tutti ($value)';
  }

  @override
  String get irFinderTestControls => 'Controlli test';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Lunghezza payload: $digits cifre esadecimali.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Spazio di ricerca. $value possibilità dopo i vincoli del prefisso.';
  }

  @override
  String get irFinderCooldownMs => 'Cooldown ms';

  @override
  String get irFinderMaxAttemptsPerRun => 'Tentativi max per esecuzione';

  @override
  String get irFinderTestAllCombinations => 'Prova tutte le combinazioni';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Esegue finché lo spazio di ricerca non è esaurito. Limite effettivo. $value';
  }

  @override
  String get irFinderAttempts => 'Tentativi';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Intervallo slider. 1–$max digita qualsiasi numero per valori maggiori';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Max\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Limite effettivo in questa esecuzione: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Suggerimento. Usa prima la modalità Database. Il brute-force funziona meglio con un prefisso noto, per esempio i primi 1–4 byte.';

  @override
  String get irFinderDatabaseInitFailed => 'Inizializzazione database fallita.';

  @override
  String get irFinderPreparingDatabase => 'Preparazione database IR locale…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Ricerca assistita da database';

  @override
  String get irFinderBrand => 'Marca';

  @override
  String get irFinderSelectBrand => 'Seleziona marca';

  @override
  String get irFinderModelOptional => 'Modello opzionale';

  @override
  String get irFinderSelectBrandFirstShort => 'Seleziona prima una marca';

  @override
  String get irFinderSelectModelRecommended =>
      'Seleziona un modello consigliato';

  @override
  String get irFinderOnlySelectedProtocol => 'Solo protocollo selezionato';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Filtra i tasti al protocollo selezionato. Disattivalo per sfogliare tutti i protocolli.';

  @override
  String get irFinderQuickWinsFirst => 'Vittorie rapide prima';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Dà priorità ai tasti POWER, MUTE, VOL e CH prima dei tasti più profondi.';

  @override
  String get irFinderMaxKeysPerRun => 'Tasti max da testare per esecuzione';

  @override
  String get irFinderTesting => 'Test in corso…';

  @override
  String get irFinderCooldown => 'Cooldown';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'Modalità';

  @override
  String get irFinderRetryLast => 'Riprova ultimo';

  @override
  String get irFinderTrigger => 'Attiva';

  @override
  String get irFinderJump => 'Salta…';

  @override
  String get irFinderSaveHit => 'Salva hit';

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
    return 'Ultimo codice provato: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Avvia il test per vedere l\'ultimo codice provato.';

  @override
  String irFinderFromDb(Object value) {
    return 'Da DB: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'Da brute-force, generato dall\'encoder del protocollo.';

  @override
  String irFinderSendError(Object error) {
    return 'Errore invio: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Origine: $value';
  }

  @override
  String get irFinderResultsNote =>
      'I risultati supportano subito Test e Copia. L\'integrazione diretta aggiungi al telecomando può essere estesa ulteriormente nel flusso editor.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Sfoglia candidati DB';

  @override
  String get irFinderFilterByLabelOrHex => 'Filtra per etichetta o hex…';

  @override
  String get irFinderJumpHere => 'Salta qui';

  @override
  String get irFinderSelectModel => 'Seleziona modello';

  @override
  String get irFinderSearchBrands => 'Cerca marche…';

  @override
  String get irFinderSearchModels => 'Cerca modelli…';

  @override
  String get iconPickerTitle => 'Seleziona icona';

  @override
  String get iconPickerSearchHint => 'Cerca icone...';

  @override
  String get iconPickerNoIconsFound => 'Nessuna icona trovata';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count icone disponibili';
  }

  @override
  String get iconPickerCategoryAll => 'Tutti';

  @override
  String get iconPickerCategoryMedia => 'Media';

  @override
  String get iconPickerCategoryVolume => 'Volume';

  @override
  String get iconPickerCategoryNavigation => 'Navigazione';

  @override
  String get iconPickerCategoryPower => 'Accensione';

  @override
  String get iconPickerCategoryNumbers => 'Numeri';

  @override
  String get iconPickerCategorySettings => 'Impostazioni';

  @override
  String get iconPickerCategoryDisplay => 'Schermo';

  @override
  String get iconPickerCategoryInput => 'Ingresso';

  @override
  String get iconPickerCategoryFavorite => 'Preferiti';

  @override
  String get universalPowerTitle => 'Accensione universale';

  @override
  String get universalPowerRunTab => 'Esegui';

  @override
  String get universalPowerUseResponsibly => 'Usa con responsabilità';

  @override
  String get universalPowerConsentBody =>
      'Accensione universale scorre i codici IR di accensione. Usala solo su dispositivi che possiedi o controlli. Fermati appena il dispositivo risponde.';

  @override
  String get universalPowerConsentCheckbox =>
      'Possiedo o controllo il dispositivo';

  @override
  String get universalPowerSetupBody =>
      'Scorre i codici di accensione per la marca selezionata. Fermati appena il dispositivo risponde.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Ultimo inviato: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Nessun codice di accensione trovato. Prova ad ampliare la ricerca.';

  @override
  String get universalPowerUnableToStart => 'Impossibile avviare.';

  @override
  String get universalPowerAllBrands => 'Tutte le marche nessun filtro';

  @override
  String get universalPowerClearBrandFilter => 'Azzera filtro marca';

  @override
  String get universalPowerBroadenSearch => 'Allarga ricerca se serve';

  @override
  String get universalPowerBroadenSearchHint =>
      'Se non vengono trovate etichette di accensione, includi altri tasti.';

  @override
  String get universalPowerAdditionalPatternsDepth =>
      'Profondità pattern aggiuntivi';

  @override
  String get universalPowerDepth1 => 'Solo priorità. POWER OFF';

  @override
  String get universalPowerDepth2 => 'Includi alias POWER';

  @override
  String get universalPowerDepth3 => 'Includi etichette accensione secondarie';

  @override
  String get universalPowerDepth4 =>
      'Includi tutte le etichette priorità minima';

  @override
  String get universalPowerLoopUntilStopped => 'Ripeti fino a stop';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Continua a ciclare la coda finché non lo fermi.';

  @override
  String get universalPowerDelayBetweenCodes => 'Ritardo tra codici';

  @override
  String get universalPowerStart => 'Avvia Accensione universale';

  @override
  String get universalPowerRunStatus => 'Stato esecuzione';

  @override
  String universalPowerProgress(Object value) {
    return 'Avanzamento: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'In pausa perché l\'app è andata in background.';

  @override
  String get universalPowerSendOneCode => 'Invia un codice';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Fermati appena il dispositivo risponde.';

  @override
  String get iconNamePlay => 'Riproduci';

  @override
  String get iconNamePause => 'Pausa';

  @override
  String get iconNameStop => 'Stop';

  @override
  String get iconNameFastForward => 'Avanti veloce';

  @override
  String get iconNameRewind => 'Riavvolgi';

  @override
  String get iconNameSkipNext => 'Salta avanti';

  @override
  String get iconNameSkipPrevious => 'Salta indietro';

  @override
  String get iconNameReplay => 'Replay';

  @override
  String get iconNameForward10S => 'Avanti 10s';

  @override
  String get iconNameForward30S => 'Avanti 30s';

  @override
  String get iconNameReplay10S => 'Replay 10s';

  @override
  String get iconNameReplay30S => 'Replay 30s';

  @override
  String get iconNameRecord => 'Registra';

  @override
  String get iconNameRecordAlt => 'Registra Alt';

  @override
  String get iconNameEject => 'Espelli';

  @override
  String get iconNameShuffle => 'Casuale';

  @override
  String get iconNameRepeat => 'Ripeti';

  @override
  String get iconNameRepeatOne => 'Ripeti uno';

  @override
  String get iconNameVolumeUp => 'Volume su';

  @override
  String get iconNameVolumeDown => 'Volume giù';

  @override
  String get iconNameVolumeOff => 'Volume off';

  @override
  String get iconNameMute => 'Muto';

  @override
  String get iconNameSpeaker => 'Altoparlante';

  @override
  String get iconNameSurroundSound => 'Surround';

  @override
  String get iconNameEqualizer => 'Equalizzatore';

  @override
  String get iconNameAudio => 'Audio';

  @override
  String get iconNameMicrophone => 'Microfono';

  @override
  String get iconNameMicOff => 'Mic Off';

  @override
  String get iconNameUp => 'Su';

  @override
  String get iconNameDown => 'Giù';

  @override
  String get iconNameLeft => 'Sinistra';

  @override
  String get iconNameRight => 'Destra';

  @override
  String get iconNameArrowUp => 'Freccia su';

  @override
  String get iconNameArrowDown => 'Freccia giù';

  @override
  String get iconNameArrowLeft => 'Freccia sinistra';

  @override
  String get iconNameArrowRight => 'Freccia destra';

  @override
  String get iconNameNavigation => 'Navigazione';

  @override
  String get iconNameChevronLeft => 'Chevron sinistra';

  @override
  String get iconNameChevronRight => 'Chevron destra';

  @override
  String get iconNameExpandLess => 'Espandi meno';

  @override
  String get iconNameExpandMore => 'Espandi di più';

  @override
  String get iconNameCollapse => 'Comprimi';

  @override
  String get iconNameExpand => 'Espandi';

  @override
  String get iconNameCircleUp => 'Cerchio su';

  @override
  String get iconNameCircleDown => 'Cerchio giù';

  @override
  String get iconNameCircleLeft => 'Cerchio sinistra';

  @override
  String get iconNameCircleRight => 'Cerchio destra';

  @override
  String get iconNameOkSelect => 'OK Seleziona';

  @override
  String get iconNameConfirm => 'Conferma';

  @override
  String get iconNameCancel => 'Annulla';

  @override
  String get iconNameClose => 'Chiudi';

  @override
  String get iconNameHome => 'Home';

  @override
  String get iconNameReturn => 'Indietro';

  @override
  String get iconNameExit => 'Esci';

  @override
  String get iconNameUndo => 'Annulla';

  @override
  String get iconNameRedo => 'Ripeti';

  @override
  String get iconNamePower => 'Accensione';

  @override
  String get iconNamePowerAlt => 'Accensione Alt';

  @override
  String get iconNamePowerOff => 'Spegni';

  @override
  String get iconNameOn => 'On';

  @override
  String get iconNameOff => 'Off';

  @override
  String get iconNameToggleOn => 'Interruttore on';

  @override
  String get iconNameToggleOff => 'Interruttore off';

  @override
  String get iconNameRestart => 'Riavvia';

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
  String get iconNameOne => 'Uno';

  @override
  String get iconNameTwo => 'Due';

  @override
  String get iconNameThree => 'Tre';

  @override
  String get iconNameFour => 'Quattro';

  @override
  String get iconNameFive => 'Cinque';

  @override
  String get iconNameSix => 'Sei';

  @override
  String get iconNamePlus => 'Più';

  @override
  String get iconNameMinus => 'Meno';

  @override
  String get iconNameAddCircle => 'Aggiungi cerchio';

  @override
  String get iconNameRemoveCircle => 'Rimuovi cerchio';

  @override
  String get iconNameSettings => 'Impostazioni';

  @override
  String get iconNameMenu => 'Menu';

  @override
  String get iconNameMoreVertical => 'Altro verticale';

  @override
  String get iconNameMoreHorizontal => 'Altro orizzontale';

  @override
  String get iconNameTune => 'Sintonizza';

  @override
  String get iconNameRemoteSettings => 'Impostazioni telecomando';

  @override
  String get iconNameInfo => 'Info';

  @override
  String get iconNameInfoOutline => 'Info contorno';

  @override
  String get iconNameHelp => 'Aiuto';

  @override
  String get iconNameHelpOutline => 'Aiuto contorno';

  @override
  String get iconNameList => 'Elenco';

  @override
  String get iconNameViewList => 'Vista elenco';

  @override
  String get iconNameViewGrid => 'Vista griglia';

  @override
  String get iconNameApps => 'App';

  @override
  String get iconNameWidgets => 'Widget';

  @override
  String get iconNameTv => 'TV';

  @override
  String get iconNameMonitor => 'Monitor';

  @override
  String get iconNameDesktop => 'Desktop';

  @override
  String get iconNameBrightnessHigh => 'Luminosità alta';

  @override
  String get iconNameBrightnessMedium => 'Luminosità media';

  @override
  String get iconNameBrightnessLow => 'Luminosità bassa';

  @override
  String get iconNameAutoBrightness => 'Luminosità auto';

  @override
  String get iconNameLightMode => 'Modalità chiara';

  @override
  String get iconNameDarkMode => 'Modalità scura';

  @override
  String get iconNameContrast => 'Contrasto';

  @override
  String get iconNameHdrOn => 'HDR on';

  @override
  String get iconNameHdrOff => 'HDR off';

  @override
  String get iconNameAspectRatio => 'Rapporto aspetto';

  @override
  String get iconNameCrop => 'Ritaglia';

  @override
  String get iconNameZoomIn => 'Zoom avanti';

  @override
  String get iconNameZoomOut => 'Zoom indietro';

  @override
  String get iconNameFullscreen => 'Schermo intero';

  @override
  String get iconNameExitFullscreen => 'Esci schermo intero';

  @override
  String get iconNameFitScreen => 'Adatta schermo';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'Ritaglia Free';

  @override
  String get iconNameInput => 'Ingresso';

  @override
  String get iconNameCable => 'Cavo';

  @override
  String get iconNameCast => 'Cast';

  @override
  String get iconNameCastConnected => 'Cast connesso';

  @override
  String get iconNameScreenShare => 'Condivisione schermo';

  @override
  String get iconNameBluetooth => 'Bluetooth';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => 'Router';

  @override
  String get iconNameMemory => 'Memoria';

  @override
  String get iconNameGameConsole => 'Console giochi';

  @override
  String get iconNameGaming => 'Gaming';

  @override
  String get iconNameMedia => 'Media';

  @override
  String get iconNameMusicQueue => 'Coda musica';

  @override
  String get iconNameVideoLibrary => 'Libreria video';

  @override
  String get iconNamePhotoLibrary => 'Libreria foto';

  @override
  String get iconNameComponent => 'Componente';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => 'Composito';

  @override
  String get iconNameAntenna => 'Antenna';

  @override
  String get iconNameFavorite => 'Preferito';

  @override
  String get iconNameFavoriteOutline => 'Preferito contorno';

  @override
  String get iconNameStar => 'Stella';

  @override
  String get iconNameStarOutline => 'Stella contorno';

  @override
  String get iconNameBookmark => 'Segnalibro';

  @override
  String get iconNameBookmarkOutline => 'Segnalibro contorno';

  @override
  String get iconNameFlag => 'Bandiera';

  @override
  String get iconNameCheck => 'Controllo';

  @override
  String get iconNameDone => 'Fatto';

  @override
  String get iconNameDoneAll => 'Fatto tutto';

  @override
  String get iconNameSchedule => 'Programma';

  @override
  String get iconNameTimer => 'Timer';

  @override
  String get iconNameTime => 'Ora';

  @override
  String get iconNameAlarm => 'Allarme';

  @override
  String get iconNameNotifications => 'Notifiche';

  @override
  String get iconNameLock => 'Blocca';

  @override
  String get iconNameUnlock => 'Sblocca';

  @override
  String get iconNameLight => 'Luce';

  @override
  String get iconNameLightOutline => 'Luce contorno';

  @override
  String get iconNameWarmLight => 'Luce calda';

  @override
  String get iconNameSunny => 'Sole';

  @override
  String get iconNameCloudy => 'Nuvoloso';

  @override
  String get iconNameNight => 'Notte';

  @override
  String get iconNameFlare => 'Bagliore';

  @override
  String get iconNameGradient => 'Gradiente';

  @override
  String get iconNameInvertColors => 'Inverti colori';

  @override
  String get iconNamePalette => 'Tavolozza';

  @override
  String get iconNameColor => 'Colore';

  @override
  String get iconNameTonality => 'Tonalità';

  @override
  String get iconNameSearch => 'Cerca';

  @override
  String get iconNameRefresh => 'Aggiorna';

  @override
  String get iconNameSync => 'Sincronizza';

  @override
  String get iconNameUpdate => 'Aggiorna';

  @override
  String get iconNameDownload => 'Scarica';

  @override
  String get iconNameUpload => 'Carica';

  @override
  String get iconNameCloud => 'Nuvola';

  @override
  String get iconNameFolder => 'Cartella';

  @override
  String get iconNameDelete => 'Elimina';

  @override
  String get iconNameEdit => 'Modifica';

  @override
  String get iconNameSave => 'Salva';

  @override
  String get iconNameShare => 'Condividi';

  @override
  String get iconNamePrint => 'Stampa';

  @override
  String get iconNameLanguage => 'Lingua';

  @override
  String get iconNameTranslate => 'Traduci';

  @override
  String get iconNameMicNone => 'Mic assente';

  @override
  String get iconNameSubtitles => 'Sottotitoli';

  @override
  String get iconNameClosedCaption => 'Sottotitoli chiusi';

  @override
  String get iconNameMusic => 'Musica';

  @override
  String get iconNameMovie => 'Film';

  @override
  String get iconNameTheater => 'Teatro';

  @override
  String get iconNameLiveTv => 'TV live';

  @override
  String get iconNameRadio => 'Radio';

  @override
  String get iconNameCamera => 'Camera';

  @override
  String get iconNameVideoCamera => 'Videocamera';

  @override
  String get iconNamePhotoCamera => 'Fotocamera';

  @override
  String get iconNameSlowMotion => 'Slow motion';

  @override
  String get iconNameSpeed => 'Velocità';

  @override
  String get iconNameVideoSettings => 'Impostazioni video';

  @override
  String get iconNameAudioTrack => 'Traccia audio';

  @override
  String get iconNameGraphicEq => 'EQ grafico';

  @override
  String get iconNameMusicVideo => 'Video musicale';

  @override
  String get iconNamePlaylist => 'Playlist';

  @override
  String get iconNameQueue => 'Coda';

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
  String get iconNameHashFa => 'Cancelletto # FA';

  @override
  String get iconNamePercentFa => 'Percento % FA';

  @override
  String get iconNameDivideFa => 'Dividi ÷ FA';

  @override
  String get iconNameMultiplyFa => 'Moltiplica × FA';

  @override
  String get iconNameEqualsFa => 'Uguale = FA';

  @override
  String get iconNameNotEqualFa => 'Diverso ≠ FA';

  @override
  String get iconNameGreaterThanFa => 'Maggiore di > FA';

  @override
  String get iconNameLessThanFa => 'Minore di < FA';

  @override
  String get iconNameAsteriskFa => 'Asterisco * FA';

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
  String get iconNamePlayFa => 'Riproduci FA';

  @override
  String get iconNamePauseFa => 'Pausa FA';

  @override
  String get iconNameStopFa => 'Stop FA';

  @override
  String get iconNamePlayFaOutline => 'Riproduci contorno FA';

  @override
  String get iconNamePauseFaOutline => 'Pausa contorno FA';

  @override
  String get iconNameStopFaOutline => 'Stop contorno FA';

  @override
  String get iconNameBackwardFa => 'Indietro FA';

  @override
  String get iconNameForwardFa => 'Avanti FA';

  @override
  String get iconNamePreviousFa => 'Precedente FA';

  @override
  String get iconNameNextFa => 'Successivo FA';

  @override
  String get iconNameRewindFa => 'Riavvolgi FA';

  @override
  String get iconNameFastForwardFa => 'Avanti veloce FA';

  @override
  String get iconNameRepeatFa => 'Ripeti FA';

  @override
  String get iconNameShuffleFa => 'Casuale FA';

  @override
  String get iconNameEjectFa => 'Espelli FA';

  @override
  String get iconNameFilmFa => 'Film FA';

  @override
  String get iconNameVideoFa => 'Video FA';

  @override
  String get iconNameMusicFa => 'Musica FA';

  @override
  String get iconNameMicrophoneFa => 'Microfono FA';

  @override
  String get iconNameCameraFa => 'Camera FA';

  @override
  String get iconNameCameraRetroFa => 'Camera retrò FA';

  @override
  String get iconNameVolumeHighFa => 'Volume alto FA';

  @override
  String get iconNameVolumeLowFa => 'Volume basso FA';

  @override
  String get iconNameVolumeOffFa => 'Volume off FA';

  @override
  String get iconNameMuteFa => 'Muto FA';

  @override
  String get iconNameMicMuteFa => 'Mic muto FA';

  @override
  String get iconNameHeadphonesFa => 'Cuffie FA';

  @override
  String get iconNameSpeakerFa => 'Altoparlante FA';

  @override
  String get iconNameUpFa => 'Su FA';

  @override
  String get iconNameDownFa => 'Giù FA';

  @override
  String get iconNameLeftFa => 'Sinistra FA';

  @override
  String get iconNameRightFa => 'Destra FA';

  @override
  String get iconNameUpFaOutline => 'Su contorno FA';

  @override
  String get iconNameDownFaOutline => 'Giù contorno FA';

  @override
  String get iconNameLeftFaOutline => 'Sinistra contorno FA';

  @override
  String get iconNameRightFaOutline => 'Destra contorno FA';

  @override
  String get iconNameArrowUpFa => 'Freccia su FA';

  @override
  String get iconNameArrowDownFa => 'Freccia giù FA';

  @override
  String get iconNameArrowLeftFa => 'Freccia sinistra FA';

  @override
  String get iconNameArrowRightFa => 'Freccia destra FA';

  @override
  String get iconNameChevronUpFa => 'Chevron su FA';

  @override
  String get iconNameChevronDownFa => 'Chevron giù FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron sinistra FA';

  @override
  String get iconNameChevronRightFa => 'Chevron destra FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK contorno FA';

  @override
  String get iconNameCheckFa => 'Controllo FA';

  @override
  String get iconNameCloseFa => 'Chiudi FA';

  @override
  String get iconNameCloseCircleFa => 'Chiudi cerchio FA';

  @override
  String get iconNameHomeFa => 'Home FA';

  @override
  String get iconNameUndoFa => 'Annulla FA';

  @override
  String get iconNameRedoFa => 'Ripeti FA';

  @override
  String get iconNameRotateFa => 'Ruota FA';

  @override
  String get iconNameSearchFa => 'Cerca FA';

  @override
  String get iconNameRefreshFa => 'Aggiorna FA';

  @override
  String get iconNamePowerOffFa => 'Spegni FA';

  @override
  String get iconNamePlugFa => 'Spina FA';

  @override
  String get iconNameToggleOnFa => 'Interruttore on FA';

  @override
  String get iconNameToggleOffFa => 'Interruttore off FA';

  @override
  String get iconNameSettingsFa => 'Impostazioni FA';

  @override
  String get iconNameSettingsAltFa => 'Impostazioni Alt FA';

  @override
  String get iconNameMenuFa => 'Menu FA';

  @override
  String get iconNameMoreFa => 'Altro FA';

  @override
  String get iconNameMoreVerticalFa => 'Altro verticale FA';

  @override
  String get iconNameInfoFa => 'Info FA';

  @override
  String get iconNameInfoFaOutline => 'Info contorno FA';

  @override
  String get iconNameHelpFa => 'Aiuto FA';

  @override
  String get iconNameHelpFaOutline => 'Aiuto contorno FA';

  @override
  String get iconNameListFa => 'Elenco FA';

  @override
  String get iconNameGridFa => 'Griglia FA';

  @override
  String get iconNameSlidersFa => 'Slider FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'Monitor FA';

  @override
  String get iconNameDesktopFa => 'Desktop FA';

  @override
  String get iconNameBrightnessFa => 'Luminosità FA';

  @override
  String get iconNameNightModeFa => 'Modalità notte FA';

  @override
  String get iconNameLightFa => 'Luce FA';

  @override
  String get iconNameLightFaOutline => 'Luce contorno FA';

  @override
  String get iconNameFlashFa => 'Flash FA';

  @override
  String get iconNameFullscreenFa => 'Schermo intero FA';

  @override
  String get iconNameExitFullscreenFa => 'Esci schermo intero FA';

  @override
  String get iconNameZoomInFa => 'Zoom avanti FA';

  @override
  String get iconNameZoomOutFa => 'Zoom indietro FA';

  @override
  String get iconNameSubtitlesFa => 'Sottotitoli FA';

  @override
  String get iconNamePictureInPictureFa => 'Picture in picture FA';

  @override
  String get iconNameColorFa => 'Colore FA';

  @override
  String get iconNamePaintFa => 'Pittura FA';

  @override
  String get iconNameInputFa => 'Ingresso FA';

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
  String get iconNameNetworkFa => 'Rete FA';

  @override
  String get iconNameCloudFa => 'Nuvola FA';

  @override
  String get iconNameStarFa => 'Stella FA';

  @override
  String get iconNameStarFaOutline => 'Stella contorno FA';

  @override
  String get iconNameHeartFa => 'Cuore FA';

  @override
  String get iconNameHeartFaOutline => 'Cuore contorno FA';

  @override
  String get iconNameBookmarkFa => 'Segnalibro FA';

  @override
  String get iconNameBookmarkFaOutline => 'Segnalibro contorno FA';

  @override
  String get iconNameFlagFa => 'Bandiera FA';

  @override
  String get iconNameClockFa => 'Orologio FA';

  @override
  String get iconNameClockFaOutline => 'Orologio contorno FA';

  @override
  String get iconNameBellFa => 'Campana FA';

  @override
  String get iconNameBellFaOutline => 'Campana contorno FA';

  @override
  String get iconNameTimerFa => 'Timer FA';

  @override
  String get iconNameLockFa => 'Blocca FA';

  @override
  String get iconNameUnlockFa => 'Sblocca FA';

  @override
  String get iconNameGalleryFa => 'Galleria FA';

  @override
  String get iconNameImagesFa => 'Immagini FA';

  @override
  String get iconNameImageFa => 'Immagine FA';

  @override
  String get iconNameVideoFileFa => 'File video FA';

  @override
  String get iconNameAudioFileFa => 'File audio FA';

  @override
  String get iconNamePlayOutlineFa => 'Riproduci contorno FA';

  @override
  String get iconNamePlaySimpleFa => 'Riproduci semplice FA';

  @override
  String get iconNamePauseSimpleFa => 'Pausa semplice FA';

  @override
  String get iconNameStopSimpleFa => 'Stop semplice FA';

  @override
  String get iconNameRecordFa => 'Registra FA';

  @override
  String get iconNameStopCircleFa => 'Stop cerchio FA';

  @override
  String get iconNameLoadingFa => 'Caricamento FA';

  @override
  String get iconNameTextFa => 'Testo FA';

  @override
  String get iconNameTextSizeFa => 'Testo Size FA';

  @override
  String get iconNameLanguageFa => 'Lingua FA';

  @override
  String get iconNameGlobeFa => 'Globo FA';

  @override
  String get iconNameSubtitlesAltFa => 'Sottotitoli Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Sottotitoli Alt contorno FA';

  @override
  String get iconNameChannelUpFa => 'Channel Su FA';

  @override
  String get iconNameChannelDownFa => 'Channel Giù FA';

  @override
  String get iconNamePageUpFa => 'Pagina Su FA';

  @override
  String get iconNamePageDownFa => 'Pagina Giù FA';

  @override
  String get iconNameGuideFa => 'Guida FA';

  @override
  String get iconNameGridViewFa => 'Vista griglia FA';

  @override
  String get iconNameGridAltFa => 'Griglia Alt FA';

  @override
  String get iconNameScheduleFa => 'Programma FA';

  @override
  String get iconNameCalendarFa => 'Calendario FA';

  @override
  String get iconNameRedButtonFa => 'Pulsante rosso FA';

  @override
  String get iconNameButtonOutlineFa => 'Pulsante contorno FA';

  @override
  String get iconNameSquareButtonFa => 'Pulsante quadrato FA';

  @override
  String get iconNameSquareOutlineFa => 'Quadrato contorno FA';

  @override
  String get iconNameDotCircleFa => 'Cerchio con punto FA';

  @override
  String get iconNameToolsFa => 'Strumenti FA';

  @override
  String get iconNameScrewdriverFa => 'Cacciavite FA';

  @override
  String get iconNameHammerFa => 'Martello FA';

  @override
  String get iconNameToolboxFa => 'Cassetta attrezzi FA';

  @override
  String get iconNameCogFa => 'Ingranaggio FA';

  @override
  String get iconNameAdjustFa => 'Regola FA';

  @override
  String get iconNameFilterFa => 'Filtro FA';

  @override
  String get iconNameSortDownFa => 'Sort Giù FA';

  @override
  String get iconNameSortUpFa => 'Sort Su FA';

  @override
  String get iconNameSleepFa => 'Sleep FA';

  @override
  String get iconNameTimerStartFa => 'Timer avvio FA';

  @override
  String get iconNameTimerHalfFa => 'Timer metà FA';

  @override
  String get iconNameTimerEndFa => 'Timer fine FA';

  @override
  String get iconNameStopwatchFa => 'Cronometro FA';

  @override
  String get iconNameAlarmFa => 'Allarme FA';

  @override
  String get iconNameCropAltFa => 'Ritaglia Alt FA';

  @override
  String get iconNameCropFa => 'Ritaglia FA';

  @override
  String get iconNameSquareFullFa => 'Quadrato pieno FA';

  @override
  String get iconNameFullscreenAltFa => 'Schermo intero Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Zoom più FA';

  @override
  String get iconNameZoomMinusFa => 'Zoom meno FA';

  @override
  String get iconNameMusicNoteFa => 'Nota musicale FA';

  @override
  String get iconNameCdFa => 'CD FA';

  @override
  String get iconNameVinylFa => 'Vinile FA';

  @override
  String get iconNameRssFa => 'RSS FA';

  @override
  String get iconNameMagicFa => 'Magia FA';

  @override
  String get iconNameFingerprintFa => 'Impronta FA';

  @override
  String get iconNameUserFa => 'Utente FA';

  @override
  String get iconNameUsersFa => 'Utenti FA';

  @override
  String get iconNameChildModeFa => 'Modalità bambini FA';

  @override
  String get iconNameCastFa => 'Cast FA';

  @override
  String get iconNameStreamFa => 'Stream FA';

  @override
  String get iconNameSignalFa => 'Segnale FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => 'Freccia cerchio su FA';

  @override
  String get iconNameCircleArrowDownFa => 'Freccia cerchio giù FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Freccia cerchio sinistra FA';

  @override
  String get iconNameCircleArrowRightFa => 'Freccia cerchio destra FA';

  @override
  String get iconNameLongArrowUpFa => 'Freccia lunga su FA';

  @override
  String get iconNameLongArrowDownFa => 'Freccia lunga giù FA';

  @override
  String get iconNameLongArrowLeftFa => 'Freccia lunga sinistra FA';

  @override
  String get iconNameLongArrowRightFa => 'Freccia lunga destra FA';

  @override
  String get iconNamePlusFa => 'Più FA';

  @override
  String get iconNameMinusFa => 'Meno FA';

  @override
  String get iconNamePlusCircleFa => 'Più cerchio FA';

  @override
  String get iconNameMinusCircleFa => 'Meno cerchio FA';

  @override
  String get iconNamePlusSquareFa => 'Più quadrato FA';

  @override
  String get iconNameMinusSquareFa => 'Meno quadrato FA';

  @override
  String get iconNameTimesFa => 'X FA';

  @override
  String get iconNameTimesCircleFa => 'X cerchio FA';

  @override
  String get iconNameBatteryFullFa => 'Batteria piena FA';

  @override
  String get iconNameBattery34Fa => 'Batteria 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'Batteria metà FA';

  @override
  String get iconNameBattery14Fa => 'Batteria 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'Batteria scarica FA';

  @override
  String get iconNameChargingFa => 'In carica FA';

  @override
  String get iconNameCloudSunFa => 'Sole nuvola FA';

  @override
  String get iconNameCloudMoonFa => 'Luna nuvola FA';

  @override
  String get iconNameRainFa => 'Pioggia FA';

  @override
  String get iconNameSnowflakeFa => 'Fiocco di neve FA';

  @override
  String get iconNameFireFa => 'Fuoco FA';

  @override
  String get iconNameTemperatureFa => 'Temperatura FA';

  @override
  String get iconNameBoxFa => 'Scatola FA';

  @override
  String get iconNameGiftFa => 'Regalo FA';

  @override
  String get iconNameTrophyFa => 'Trofeo FA';

  @override
  String get iconNameCrownFa => 'Corona FA';

  @override
  String get iconNameGemFa => 'Gemma FA';

  @override
  String get unknownLabel => 'Sconosciuto';

  @override
  String get selectedFilesLabel => 'selezionati file(s)';

  @override
  String get folderNotFoundOrInaccessible =>
      'Cartella non trovata o inaccessibile.';

  @override
  String get importedRemoteDefaultName => 'TelecomandoImportato';

  @override
  String get demoRemoteName => 'Telecomando demo';

  @override
  String get protocolFieldsInvalid =>
      'Compila i campi protocollo richiesti e assicurati che la frequenza sia 15k–60k se impostata.';

  @override
  String get unknownProtocolSelected => 'Sconosciuto protocol selezionati.';
}
