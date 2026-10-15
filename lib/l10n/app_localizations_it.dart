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
      'Adattatore IR USB rilevato. Consenti l’accesso USB per inviare comandi.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'L’accesso USB è stato negato. Richiedi di nuovo il permesso e consenti l’accesso per inviare comandi.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'L’accesso USB è consentito, ma l’adattatore non è ancora pronto.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Impossibile collegarsi all’adattatore USB nonostante il permesso. Scollegalo, ricollegalo e riprova.';

  @override
  String get homeUsbReadyMessage => 'Adattatore IR USB pronto.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Questo telefono non ha un trasmettitore IR integrato e non è collegato alcun adattatore IR USB compatibile.';

  @override
  String get homeUsbOptionPlugIn =>
      'Collega un adattatore IR USB compatibile e consenti l’accesso.';

  @override
  String get homeUsbOptionReady => 'Pronto per inviare.';

  @override
  String get homeUsbOptionPermissionRequired =>
      'Collegato. Consenti l’accesso USB.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Accesso negato. Richiedi di nuovo il permesso.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Accesso consentito. In attesa dell’adattatore.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Connessione non riuscita. Ricollega l’adattatore.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Nessun trasmettitore IR integrato. Usa un adattatore IR USB compatibile o un accessorio da audio a IR.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Collegato. Consenti l’accesso USB.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Accesso negato. Richiedi di nuovo il permesso.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Accesso consentito. In attesa dell’adattatore.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Connessione non riuscita. Ricollega l’adattatore.';

  @override
  String get homeHardwareBannerReady => 'Pronto per inviare.';

  @override
  String get homeHardwareRequiredTitle => 'Serve un trasmettitore IR';

  @override
  String get homeUsbDongleRecommended => 'Adattatore IR USB (consigliato)';

  @override
  String get homeAudioAdapterAlternative => 'Adattatore IR audio';

  @override
  String get homeAudioAdapterDescription =>
      'Serve un adattatore da audio a IR. Nelle impostazioni, scegli Audio (1 o 2 LED) e alza il volume multimediale.';

  @override
  String get close => 'Chiudi';

  @override
  String get homeChooseTransmitter => 'Scegli trasmettitore';

  @override
  String get openSettings => 'Apri Impostazioni';

  @override
  String get homeUsbPermissionSentApprove =>
      'Permesso richiesto. Consenti l’accesso USB nella finestra di Android.';

  @override
  String get homeUsbDongleNotDetected =>
      'Nessun adattatore IR USB compatibile trovato. Collegalo e riprova.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Impossibile richiedere l’accesso USB. Riprova.';

  @override
  String get working => 'In corso…';

  @override
  String get requestUsbPermission => 'Richiedi accesso USB';

  @override
  String get homeHardwareTip =>
      'Puoi già preparare i tuoi telecomandi. Il trasmettitore IR serve solo per inviare comandi.';

  @override
  String get homeNoIrTransmitterTitle => 'Nessun trasmettitore IR disponibile';

  @override
  String get homeHardwareRequiredBody =>
      'Puoi creare e organizzare telecomandi anche senza un trasmettitore IR. Per controllare un dispositivo, usa una delle soluzioni qui sotto.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Puoi comunque creare, importare e organizzare telecomandi.';

  @override
  String get homeWaysToUseIrBlaster => 'Opzioni hardware';

  @override
  String get homeBuiltInIrOptionTitle => 'Trasmettitore IR integrato';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Alcuni telefoni hanno un trasmettitore IR integrato. Questo telefono non ne ha uno.';

  @override
  String get homeBuiltInIrUnavailable => 'Non integrato in questo telefono';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'Adattatore da audio a IR';

  @override
  String get homeContinueWithoutHardware => 'Continua senza inviare';

  @override
  String get homeHowItWorks => 'Come funziona';

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
  String get learningModeEntryTitle => 'Apprendimento IR';

  @override
  String get learningModeEntrySubtitle =>
      'Copia il segnale IR di un tasto del telecomando.';

  @override
  String get learningModeTitle => 'Apprendimento IR';

  @override
  String get learningModeHeroTitle =>
      'Impara un pulsante del telecomando in modo pulito';

  @override
  String get learningModeHeroSubtitle =>
      'Configura il tuo ricevitore, prepara il telecomando originale, acquisisci un comando, quindi rivedilo prima di salvarlo in un telecomando.';

  @override
  String get learningModeReadyBadge => 'Ricevitore pronto';

  @override
  String get learningModeNeedsPermissionBadge =>
      'È necessaria l\'autorizzazione USB';

  @override
  String get learningModeSetupBadge =>
      'È necessaria la configurazione del ricevitore';

  @override
  String get learningModeNoReceiverBadge =>
      'Nessun ricevitore di apprendimento';

  @override
  String get learningModeCheckingBadge => 'Controllo dell\'hardware';

  @override
  String get learningModeFourStepFlow => 'Flusso guidato in 4 fasi';

  @override
  String get learningModeSaveAnywhereBadge => 'Rivedi prima di salvare';

  @override
  String get learningModeGuideTitle =>
      'Riprendi dove dovrebbe avvenire la cattura';

  @override
  String get learningModeStepHardwareShort => 'Hardware';

  @override
  String get learningModeStepPrepareShort => 'Preparare';

  @override
  String get learningModeStepCaptureShort => 'Catturare';

  @override
  String get learningModeStepReviewShort => 'Revisione';

  @override
  String get learningModeStepHardwareTitle =>
      'Controllare l\'hardware del ricevitore';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Assicurarsi che un ricevitore didattico compatibile sia collegato e autorizzato prima di iniziare.';

  @override
  String get learningModeCurrentSenderLabel => 'Trasmettitore attuale';

  @override
  String get learningModeReceiverStatusLabel => 'Stato di apprendimento';

  @override
  String get learningModeCheckingHardwareBody =>
      'Verifica del trasmettitore e del ricevitore IR.';

  @override
  String get learningModeHardwareReadyBody =>
      'Un dongle IR USB è collegato e inizializzato. Questo è il posto giusto per iniziare il flusso di apprendimento una volta collegato il cablaggio di acquisizione.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Consenti l\'accesso all\'adattatore USB, poi avvia l\'apprendimento.';

  @override
  String get learningModeHardwareSetupBody =>
      'Il ricevitore non è pronto. Controlla la configurazione o ricollegalo, poi riprova.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Collega un ricevitore IR compatibile per apprendere i segnali.';

  @override
  String get learningModeRefreshHardware => 'Verifica ricevitore';

  @override
  String get learningModeHardwareTipTitle => 'Miglior posizionamento';

  @override
  String get learningModeHardwareTipBody =>
      'La modalità di apprendimento si trova nel trasmettitore IR perché dipende dalla disponibilità dell\'hardware e viene utilizzata meno spesso rispetto all\'invio di telecomandi.';

  @override
  String get learningModeStepPrepareTitle =>
      'Preparare il telecomando originale';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Decidi cosa stai imparando, quindi mantieni il telecomando originale fermo e vicino al ricevitore.';

  @override
  String get learningModeButtonNameLabel => 'Nome del tasto';

  @override
  String get learningModeButtonNameHint =>
      'Ad esempio: Accensione, HDMI 1, Menu';

  @override
  String get learningModeSinglePress => 'Pressione singola';

  @override
  String get learningModeHoldButton => 'Tieni premuto il pulsante';

  @override
  String get learningModePreparationChecklistTitle => 'Prima di catturare';

  @override
  String get learningModePreparationItemDistance =>
      'Tenere il telecomando originale a circa 2-5 cm dal ricevitore.';

  @override
  String get learningModePreparationItemOneButton =>
      'Impara a usare un pulsante alla volta e usa prima una pressione breve e pulita.';

  @override
  String get learningModePreparationItemStill =>
      'Mantieni entrambi i dispositivi fermi per evitare acquisizioni rumorose o parziali.';

  @override
  String get learningModeStepCaptureTitle => 'Cattura il segnale';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Ascolta un singolo comando, quindi blocca il risultato prima di esaminarlo.';

  @override
  String get learningModeCaptureReadyTitle => 'Pronto per ascoltare';

  @override
  String get learningModeCaptureReadyBody =>
      'Lo stato dell\'hardware sembra buono. Il backend di acquisizione si collegherà a questo passaggio successivo.';

  @override
  String get learningModeCaptureBlockedTitle =>
      'L\'hardware non è ancora pronto';

  @override
  String get learningModeCaptureBlockedBody =>
      'Puoi ancora rivedere il flusso adesso, ma l\'acquisizione dovrebbe attendere finché il ricevitore non sarà pronto.';

  @override
  String get learningModeStartListening => 'Ricevi segnale';

  @override
  String get learningModeCaptureStubTitle =>
      'Il backend di acquisizione viene dopo';

  @override
  String get learningModeCaptureStubBody =>
      'Questa schermata è inizialmente completamente strutturata in modo che il flusso di acquisizione finale possa collegarsi agli stati hardware reali invece di essere imbullonato in un secondo momento.';

  @override
  String get learningModeCaptureStubMessage =>
      'L\'acquisizione dell\'apprendimento non è ancora cablata. Questa schermata supporta innanzitutto l\'intero flusso.';

  @override
  String get learningModeUnnamedCapture => 'Segnale senza nome';

  @override
  String get learningModeStatusCheckingTitle => 'Verifica del ricevitore';

  @override
  String get learningModeStatusNoReceiverTitle => 'Ricevitore non pronto';

  @override
  String get learningModeStatusPermissionTitle =>
      'Autorizzazione USB richiesta';

  @override
  String get learningModeStatusSetupTitle => 'Configura il ricevitore';

  @override
  String get learningModeStatusReadyTitle => 'Pronto ad apprendere';

  @override
  String get learningModeStatusListeningTitle => 'In attesa del segnale';

  @override
  String get learningModeStatusCapturedTitle => 'Segnale acquisito';

  @override
  String get learningModeStatusReadyBody =>
      'Assegna un nome al pulsante, punta il telecomando originale verso il ricevitore e inizia ad ascoltare quando sei pronto.';

  @override
  String get learningModeStatusListeningBody =>
      'Punta il telecomando originale verso il ricevitore e premi il tasto una volta.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Segnale acquisito per $buttonName. Invialo di nuovo per verificare che il dispositivo risponda, poi salvalo.';
  }

  @override
  String get learningModeConnectReceiverTitle => 'Collega un ricevitore IR';

  @override
  String get learningModeConnectReceiverBody =>
      'La modalità di apprendimento dipende dall\'hardware esterno in grado di ricevere IR. Una volta rilevato e autorizzato il ricevitore, questa pagina diventa un flusso diretto di ascolto, test e salvataggio.';

  @override
  String get learningModeListenCardTitle => 'Ascolta un pulsante';

  @override
  String get learningModeListenCardBody =>
      'Se lo desideri, imposta prima un\'etichetta, quindi inizia ad ascoltare e premi il pulsante sul telecomando originale.';

  @override
  String get learningModeReadyToListenTitle => 'Pronto a ricevere';

  @override
  String get learningModeReadyToListenBody =>
      'Punta il telecomando originale verso il ricevitore, poi avvia l\'acquisizione.';

  @override
  String get learningModeListeningNowTitle => 'In attesa del segnale';

  @override
  String get learningModeListeningNowBody =>
      'Premere una volta il pulsante del telecomando originale. Utilizza l\'acquisizione di anteprima per spostarti nel resto dello scaffold prima che venga cablato il backend di acquisizione reale.';

  @override
  String get learningModePreviewCaptureAction =>
      'Anteprima del segnale catturato';

  @override
  String get learningModeCapturedSummary => 'Segnale acquisito';

  @override
  String get learningModeResultActionsTitle => 'Prova e salva';

  @override
  String get learningModeResultActionsBody =>
      'Invia di nuovo il segnale e verifica che il dispositivo risponda prima di salvare il tasto.';

  @override
  String get learningModeReplayAction => 'Invia di nuovo';

  @override
  String get learningModeReplayStubMessage =>
      'La riproduzione non è ancora stata cablata. Questa è l\'impalcatura dell\'interfaccia utente per il flusso finale di apprendimento, test e salvataggio.';

  @override
  String get learningModeSaveStubMessage =>
      'Il salvataggio non è stato ancora cablato. Il passaggio successivo è connettere questa schermata al pulsante Crea e ai telecomandi esistenti.';

  @override
  String get learningModeLearnAnotherAction => 'Apprendi un altro tasto';

  @override
  String get learningModeStepReviewTitle => 'Rivedi e salva';

  @override
  String get learningModeStepReviewSubtitle =>
      'Conferma ciò che hai appreso, quindi scegli dove dovrebbe risiedere nella tua libreria remota.';

  @override
  String get learningModeSaveToExistingRemote => 'Telecomando esistente';

  @override
  String get learningModeCreateNewRemote => 'Nuovo telecomando';

  @override
  String get learningModeProtocolPreviewTitle => 'Anteprima protocollo';

  @override
  String get learningModeProtocolPreviewBody =>
      'I dettagli del protocollo decodificato verranno visualizzati qui una volta che il ricevitore acquisisce la pressione di un pulsante pulito.';

  @override
  String get learningModeRawPreviewTitle => 'Dati grezzi';

  @override
  String get learningModeRawPreviewBody =>
      'Se la decodifica è incompleta, l\'acquisizione del timing grezzo sarà comunque disponibile qui per la revisione e il salvataggio.';

  @override
  String get learningModeSaveCapture => 'Salva segnale';

  @override
  String get learningModeReviewTipTitle => 'Dove andrà a finire?';

  @override
  String get learningModeReviewTipBody =>
      'Il passaggio successivo dell\'implementazione dovrebbe connettere questo pannello di revisione al pulsante Crea e ai telecomandi esistenti in modo che il segnale appreso arrivi direttamente nella tua libreria.';

  @override
  String get learningModeFinishPreview => 'Termina l\'anteprima';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interazione';

  @override
  String get interactionSubtitle => 'Feedback tocco e layout telecomando';

  @override
  String get autoOpenLastRemoteTitle => 'Apri l’ultimo telecomando all’avvio';

  @override
  String get autoOpenLastRemoteSubtitle =>
      'Apre il telecomando usato più di recente all’avvio dell’app. Se non è disponibile, viene mostrato l’elenco dei telecomandi.';

  @override
  String get hapticFeedbackTitle => 'Feedback aptico';

  @override
  String get hapticFeedbackSubtitle => 'Vibra su tocchi e azioni';

  @override
  String get forceInAppVibrationTitle => 'Forza la vibrazione nell\'app';

  @override
  String get forceInAppVibrationSubtitle =>
      'Usa direttamente il vibratore anche se il feedback tattile di sistema è disattivato';

  @override
  String get forceInAppVibrationWarning =>
      'Opzione avanzata. L\'app può vibrare anche quando il feedback tattile di Android è disattivato globalmente.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'La vibrazione di sistema Android è disattivata. La vibrazione forzata nell’app non può aggirarla su questo dispositivo.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'Questo dispositivo non segnala hardware di vibrazione, quindi la vibrazione nell’app non può funzionare.';

  @override
  String get intensity => 'Intensità';

  @override
  String get intensityLight => 'Leggera';

  @override
  String get intensityMedium => 'Media';

  @override
  String get intensityStrong => 'Forte';

  @override
  String get remoteButtonMetadataTitle => 'Mostra etichette tecniche pulsanti';

  @override
  String get remoteButtonMetadataSubtitle =>
      'Mostra protocollo, codice e frequenza sui pulsanti del telecomando.';

  @override
  String get remoteButtonMetadataShown =>
      'Etichette tecniche pulsanti visibili.';

  @override
  String get remoteButtonMetadataHidden =>
      'Etichette tecniche pulsanti nascoste.';

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
  String remoteLayoutSummary(int count, Object layout) {
    return '$count pulsante/i · $layout';
  }

  @override
  String get layoutComfort => 'Ampia';

  @override
  String get layoutCompact => 'Compatta';

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
  String remoteButtonCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count buttons',
      one: '$count button',
    );
    return '$_temp0';
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
  String get timedMacrosTitle => 'Macro';

  @override
  String get timedMacrosSubtitle =>
      'Esegui una sequenza di comandi IR con attese tra i passaggi.';

  @override
  String get timedMacrosNextStep =>
      'Scegli un telecomando, poi aggiungi comandi e attese per creare la tua prima macro.';

  @override
  String get macroFeatureToysTitle => 'Per giocattoli con comando IR';

  @override
  String get macroFeatureToysDescription =>
      'Lascia al giocattolo il tempo di completare un’azione prima di inviare il comando successivo.';

  @override
  String get macroFeatureTimingTitle => 'Attese regolabili';

  @override
  String get macroFeatureTimingDescription =>
      'Imposta l’attesa tra i comandi per dare al dispositivo il tempo di rispondere.';

  @override
  String get macroFeatureManualTitle => 'Attendi conferma';

  @override
  String get macroFeatureManualDescription =>
      'Attende che tocchi Continua prima di passare al passaggio successivo.';

  @override
  String get exampleUseCase => 'Esempio';

  @override
  String get macroExampleText =>
      '1. Invia il primo comando\n2. Attendi un secondo\n3. Invia il comando successivo';

  @override
  String get createFirstMacro => 'Crea la tua prima macro';

  @override
  String get noRemote => 'Nessun telecomando';

  @override
  String macroCopyName(String name) {
    return '$name (copia)';
  }

  @override
  String macroStepCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count passaggi',
      one: '$count passaggio',
    );
    return '$_temp0';
  }

  @override
  String get aboutTimedMacros => 'Informazioni sulle macro';

  @override
  String get aboutTimedMacrosDescription =>
      'Esegui una sequenza di comandi IR con attese tra i passaggi.';

  @override
  String get sendCommand => 'Invia comando';

  @override
  String get sendCommandDescription =>
      'Invia il segnale IR di un pulsante salvato nel telecomando.';

  @override
  String get delay => 'Attesa';

  @override
  String get delayDescription =>
      'Attende il tempo impostato prima di passare al passaggio successivo.';

  @override
  String get manualContinue => 'Attendi conferma';

  @override
  String get manualContinueDescription =>
      'Attende che tocchi Continua prima di passare al passaggio successivo.';

  @override
  String get gotIt => 'Capito';

  @override
  String get failedToSaveMacros => 'Impossibile salvare le macro.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Macro «$name» eliminata.';
  }

  @override
  String get undo => 'Annulla';

  @override
  String get failedToRestoreMacro => 'Impossibile ripristinare la macro.';

  @override
  String get deleteMacroTitle => 'Eliminare la macro?';

  @override
  String get deleteMacroMessage =>
      'Dopo l’eliminazione, tocca Annulla nel messaggio che compare per ripristinare la macro.';

  @override
  String get noRemotesAvailable => 'Nessun telecomando disponibile.';

  @override
  String remoteButtonCountSummary(int count) {
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
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Codice copiato.';

  @override
  String get copyCode => 'Copia codice';

  @override
  String get startLoop => 'Avvia loop';

  @override
  String get editButtonSubtitle => 'Cambia etichetta, colori o segnale IR';

  @override
  String get newButton => 'Nuovo pulsante';

  @override
  String get newButtonSubtitle =>
      'Crea un altro pulsante per questo telecomando';

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
      'Usa questo pulsante dai controlli dei dispositivi Android';

  @override
  String get removedFromDeviceControls => 'Rimosso dai controlli dispositivo.';

  @override
  String get pinQuickTile => 'Fissa ai preferiti Riquadro rapido';

  @override
  String get unpinQuickTile => 'Rimuovi dai preferiti Riquadro rapido';

  @override
  String get quickTileButtonSubtitle =>
      'I preferiti compaiono per primi quando configuri un riquadro delle impostazioni rapide';

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
  String get untitledRemote => 'Telecomando senza nome';

  @override
  String get createRemoteTitle => 'Crea telecomando';

  @override
  String get editRemoteTitle => 'Modifica telecomando';

  @override
  String get removeButtonTitle => 'Rimuovere il pulsante?';

  @override
  String get imageButtonRemovedMessage =>
      'Questo pulsante verrà rimosso dal telecomando.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '«$name» verrà rimosso dal telecomando.';
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
      'Cambia etichetta, colori o segnale IR';

  @override
  String get createButtonCopySubtitle => 'Crea una copia di questo pulsante';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Crea una copia e modificala subito';

  @override
  String get undoAvailableInNextSnackbar =>
      'Dopo aver rimosso il pulsante, tocca Annulla nel messaggio che compare.';

  @override
  String get buttonRemoved => 'Pulsante rimosso.';

  @override
  String get remoteNameCannotBeEmpty => 'Inserisci un nome per il telecomando.';

  @override
  String get saveRemote => 'Salva telecomando';

  @override
  String get remoteName => 'Nome del telecomando';

  @override
  String get remoteNameHint => 'es. TV o climatizzatore';

  @override
  String get remoteNameHelper =>
      'Questo nome comparirà nell’elenco dei telecomandi.';

  @override
  String get layoutStyle => 'Disposizione';

  @override
  String get layoutWideDescription =>
      'Due colonne di pulsanti con più dettagli.';

  @override
  String get layoutCompactDescription =>
      'Quattro colonne di pulsanti con icone o testo.';

  @override
  String get importFromRemotes => 'Importa dai telecomandi';

  @override
  String get importFromDatabase => 'Importa dal database';

  @override
  String get addButton => 'Aggiungi pulsante';

  @override
  String get noButtonsYet => 'Nessun pulsante';

  @override
  String get createRemoteEmptyStateDescription =>
      'Trova i pulsanti nel database, importali da un altro telecomando o creane di nuovi.';

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
  String get buttonLabelStepTitle => 'Etichetta pulsante';

  @override
  String get buttonLabelStepSubtitle =>
      'Scegli un\'immagine, un\'icona o digita un\'etichetta testuale.';

  @override
  String get buttonColorStepTitle => 'Colore del pulsante';

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
  String get noMatchingCommands => 'Nessun comando trovato';

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
  String get selectCommand => 'Scegli un comando';

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
      'Cerca il dispositivo, scegli i pulsanti e importali.';

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
  String get invalidStepEncountered =>
      'Questa macro contiene un passaggio non valido. Modificalo prima di riprovare.';

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
    return 'Passaggi: $current / $total';
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
      'Tocca Continua quando sei pronto per il passaggio successivo.';

  @override
  String get error => 'Errore';

  @override
  String get macroCompleted => 'Macro completata';

  @override
  String finishedIn(Object duration) {
    return 'Completata in $duration';
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
  String get enterMacroName => 'Inserisci un nome per la macro.';

  @override
  String get addAtLeastOneStep => 'Aggiungi almeno un passaggio.';

  @override
  String get fixInvalidSteps =>
      'Correggi i passaggi non validi prima di salvare.';

  @override
  String get unknownCommand => 'Comando sconosciuto';

  @override
  String get unnamedCommand => 'Comando senza nome';

  @override
  String get iconCommand => 'Comando icona';

  @override
  String get selectDelay => 'Scegli il tempo di attesa';

  @override
  String keepMilliseconds(int ms) {
    return 'Mantieni $ms ms';
  }

  @override
  String get custom => 'Personalizzato';

  @override
  String get enterCustomDelayDuration => 'Inserisci un altro tempo di attesa';

  @override
  String millisecondsLong(int ms) {
    String _temp0 = intl.Intl.pluralLogic(
      ms,
      locale: localeName,
      other: '$ms millisecondi',
      one: '$ms millisecondo',
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
      other: '$secondsString secondi',
      one: '$secondsString secondo',
    );
    return '$_temp0';
  }

  @override
  String get customDelay => 'Attesa personalizzata';

  @override
  String get delayMillisecondsLabel => 'Attesa (ms)';

  @override
  String get delayMillisecondsHint => '3000';

  @override
  String get recommendedDelayRange =>
      '1.000 millisecondi = 1 secondo. Lascia al dispositivo il tempo di rispondere.';

  @override
  String get enterValidPositiveNumber =>
      'Inserisci un numero intero maggiore di zero.';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Telecomando';

  @override
  String get macroName => 'Nome della macro';

  @override
  String get macroNameHint => 'es. Serata cinema';

  @override
  String stepsTitleCount(int count) {
    return 'Passaggi ($count)';
  }

  @override
  String get noStepsYet => 'Nessun passaggio ancora';

  @override
  String get addCommandsAndDelaysHint =>
      'Aggiungi comandi, attese o pause per la conferma. I passaggi vengono eseguiti nell’ordine mostrato.';

  @override
  String get addStep => 'Aggiungi passaggio';

  @override
  String get reorderStepsHint =>
      'Trascina la maniglia per spostare un passaggio. Tocca un passaggio per modificarlo.';

  @override
  String reorderStep(int index) {
    return 'Sposta il passaggio $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Tieni premuto e trascina per spostare il passaggio';

  @override
  String deleteStep(int index) {
    return 'Elimina il passaggio $index';
  }

  @override
  String get invalidStepTapToFix => 'Passaggio non valido tocca per correggere';

  @override
  String get sendIrCommand => 'Invia comando IR';

  @override
  String get waitForUserConfirmation =>
      'Mette in pausa la macro finché non scegli di continuare.';

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
  String get layoutWide => 'Ampia';

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
  String get continueEditing => 'Continua a modificare';

  @override
  String get unsavedChangesTitle => 'Modifiche non salvate';

  @override
  String get unsavedMacroChangesMessage =>
      'Scartare le modifiche a questa macro? Non verranno salvate.';

  @override
  String get stopMacroBeforeLeaving =>
      'Interrompi la macro prima di uscire da questa schermata.';

  @override
  String get stopTestingBeforeLeaving =>
      'Stop testing before leaving this screen.';

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
  String get homeDeviceControlsTitle => 'Controlli rapidi';

  @override
  String get homeDeviceControlsSubtitle =>
      'Accensione, muto e volume senza aprire un telecomando.';

  @override
  String get homeDeviceControlsEmptySubtitle =>
      'Configura i pulsanti accensione, muto e volume nei controlli dispositivo.';

  @override
  String get showDeviceControlsOnHome => 'Mostra i controlli rapidi nella home';

  @override
  String get showDeviceControlsOnHomeSubtitle =>
      'Mostra la riga compatta Accensione, Muto e Volume nella schermata principale.';

  @override
  String get homeDeviceControlsShown => 'Controlli rapidi visibili nell’app.';

  @override
  String get homeDeviceControlsHidden => 'Controlli rapidi nascosti nell’app.';

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
  String get learningModeCaptureFailed => 'Impossibile acquisire il segnale.';

  @override
  String get learningModeReplaySent => 'Segnale inviato.';

  @override
  String get learningModeReplayFailed =>
      'Impossibile inviare il segnale acquisito.';

  @override
  String get learningModeNoRemotesAvailable =>
      'Non ci sono ancora telecomandi salvati.';

  @override
  String get learningModeChooseRemoteTitle => 'Scegli un telecomando';

  @override
  String get learningModeNewRemoteTitle => 'Crea telecomando';

  @override
  String get learningModeSaveSuccess => 'Tasto salvato.';

  @override
  String get learningModeSaveFailed => 'Impossibile salvare il tasto.';

  @override
  String get remoteSetupIntro =>
      'Scegli un nome e una disposizione. Aggiungi i pulsanti nel passaggio successivo.';

  @override
  String get startWithDefault => 'Nome predefinito';

  @override
  String get browseGithubStore => 'Esplora GitHub';

  @override
  String get addFirstButton => 'Aggiungi il primo pulsante';

  @override
  String get moreWaysToStart => 'Altri modi per aggiungere pulsanti';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Annullare la configurazione del nuovo telecomando? Le modifiche non verranno salvate.';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Scartare le modifiche a questo telecomando? Non verranno salvate.';

  @override
  String get firstButtonAdded => 'Primo pulsante aggiunto.';

  @override
  String get iconColorTitle => 'Colore icona';

  @override
  String get iconColorHelper =>
      'Scegli un colore per il simbolo che resti visibile sullo sfondo del pulsante.';

  @override
  String get colorRed => 'Rosso';

  @override
  String get colorPink => 'Rosa';

  @override
  String get colorPurple => 'Viola';

  @override
  String get colorDeepPurple => 'Viola scuro';

  @override
  String get colorIndigo => 'Indaco';

  @override
  String get colorBlue => 'Blu';

  @override
  String get colorLightBlue => 'Azzurro';

  @override
  String get colorCyan => 'Ciano';

  @override
  String get colorTeal => 'Verde acqua';

  @override
  String get colorGreen => 'Verde';

  @override
  String get colorLightGreen => 'Verde chiaro';

  @override
  String get colorLime => 'Lime';

  @override
  String get colorYellow => 'Giallo';

  @override
  String get colorAmber => 'Ambra';

  @override
  String get colorOrange => 'Arancione';

  @override
  String get colorDeepOrange => 'Arancione scuro';

  @override
  String get colorBrown => 'Marrone';

  @override
  String get colorGrey => 'Grigio';

  @override
  String get colorBlueGrey => 'Grigio blu';

  @override
  String get colorBlack => 'Nero';

  @override
  String get colorWhite => 'Bianco';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Colore del pulsante $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Colore del pulsante $colorName, selezionato';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Colore icona $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Colore icona $colorName, selezionato';
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
  String get quickSettingsTilesTitle => 'Riquadri Impostazioni rapide';

  @override
  String get quickSettingsPowerTile => 'Riquadro accensione';

  @override
  String get quickSettingsMuteTile => 'Riquadro muto';

  @override
  String get quickSettingsVolumeUpTile => 'Riquadro volume +';

  @override
  String get quickSettingsVolumeDownTile => 'Riquadro volume -';

  @override
  String get quickSettingsNoTilesConfigured => 'Nessun riquadro configurato';

  @override
  String get quickSettingsEmptyHint =>
      'Passaggio successivo: scegli un comando per almeno un riquadro, poi aggiungi il riquadro dal menu di modifica delle Impostazioni rapide di Android.';

  @override
  String get quickSettingsSetPowerTile => 'Imposta riquadro accensione';

  @override
  String get quickSettingsConfiguredHint =>
      'Scegli quale pulsante invia ogni riquadro. Aggiungi i riquadri dal menu di modifica delle Impostazioni rapide di Android.';

  @override
  String get quickSettingsNotSet => 'Non impostato';

  @override
  String quickSettingsTileMappingSummary(String title, String subtitle) {
    return '$title · $subtitle';
  }

  @override
  String get quickSettingsPickButtonTooltip => 'Scegli pulsante';

  @override
  String get quickSettingsClearTooltip => 'Cancella';

  @override
  String get homeWidgetUnsupportedLauncher =>
      'Aggiungi il widget IR Blaster dal menu dei widget della schermata iniziale.';

  @override
  String get homeWidgetButtonUnsupported =>
      'Questo pulsante non può essere aggiunto come widget alla schermata iniziale.';

  @override
  String get homeWidgetRequestSent =>
      'Aggiunta del widget richiesta. Conferma nella schermata iniziale, se richiesto.';

  @override
  String get homeWidgetRequestRejected =>
      'Impossibile richiedere il widget. Prova ad aggiungerlo dalla schermata iniziale.';

  @override
  String homeWidgetSetupFailed(String error) {
    return 'Impossibile configurare il widget: $error';
  }

  @override
  String get addHomeWidget => 'Aggiungi widget alla home';

  @override
  String get addHomeWidgetSubtitle =>
      'Posiziona questo pulsante sulla schermata iniziale.';

  @override
  String buttonInfoType(String type) {
    return 'Tipo: $type';
  }

  @override
  String get buttonInfoCodeRaw => 'Codice: segnale grezzo';

  @override
  String buttonInfoCode(String code) {
    return 'Codice: $code';
  }

  @override
  String get buttonInfoNoCode => 'NESSUN CODICE';

  @override
  String buttonInfoFrequency(String frequency) {
    return 'Frequenza: $frequency';
  }

  @override
  String get frequencyHzLabel => 'Frequenza (Hz)';

  @override
  String get carrierFrequencyHelper => 'Frequenza portante, es. 38000';

  @override
  String get requiredFrequencyHelper => 'Obbligatorio. Esempio: 38000';

  @override
  String get validFrequencyError => 'Inserisci una frequenza valida (15k-60k).';

  @override
  String get resetToDefaultFrequency => 'Ripristina a 38000';

  @override
  String get rawDataLabel => 'Dati grezzi';

  @override
  String get rawDataHelper =>
      'Interi separati da spazi, es. 9000 4500 560 560 ...';

  @override
  String get rawDataInvalid =>
      'I dati grezzi devono essere interi separati da spazi o nuove righe.';

  @override
  String get rawDataSafeguard =>
      'Protezione: i token non validi vengono bloccati per evitare di salvare un pattern non inviabile.';

  @override
  String get protocolLabel => 'Protocollo';

  @override
  String get protocolEncodingHelper =>
      'La codifica è implementata solo per i protocolli contrassegnati come implementati.';

  @override
  String get protocolFrequencyHelper =>
      'Opzionale. Se vuoto, viene usata la frequenza predefinita del protocollo quando disponibile.';

  @override
  String get rawSignalInvalidWithFrequency =>
      'I dati grezzi devono essere interi separati da spazi o nuove righe e la frequenza deve essere 15k-60k.';

  @override
  String get necTimingsNumeric => 'Tutti i timing NEC devono essere numerici.';

  @override
  String get frequencyRangeError => 'La frequenza deve essere 15k-60k Hz.';

  @override
  String get pasteTooltip => 'Incolla';

  @override
  String get clearTooltip => 'Cancella';

  @override
  String irFinderResumeMask(Object value) {
    return 'Maschera: $value';
  }

  @override
  String get irFinderKnownMaskLabel => 'Maschera codice nota (facoltativa)';

  @override
  String get irFinderKnownMaskHint => '00FFXXFF, FFXXFF o 0xA1XX';

  @override
  String irFinderKnownMaskHelper(int digits, Object example) {
    return 'Payload di $digits cifre. Usa X per le cifre sconosciute; le cifre finali omesse diventano X. Esempio: $example';
  }

  @override
  String get irFinderKnownMaskInvalidCharacters =>
      'Usa solo cifre esadecimali, caratteri jolly X, spazi, due punti, trattini o trattini bassi.';

  @override
  String irFinderKnownMaskTooLong(int digits) {
    return 'La maschera supera il payload di $digits cifre di questo protocollo.';
  }

  @override
  String irFinderNormalizedMaskValue(Object value) {
    return 'Maschera normalizzata: $value';
  }

  @override
  String get irFinderNormalizedMask => 'Maschera normalizzata';

  @override
  String get irFinderNormalizedMaskAllUnknown =>
      'Tutte le cifre sono sconosciute';

  @override
  String get irFinderSearchOrder => 'Ordine di ricerca';

  @override
  String get irFinderSmartOrder => 'Intelligente';

  @override
  String get irFinderSequentialOrder => 'Sequenziale';

  @override
  String get irFinderSmartOrderHint =>
      'In base al protocollo: prova prima i valori bassi comuni, poi distribuisce i campi comando e dispositivo ignorando i bit non usati.';

  @override
  String get irFinderSequentialOrderHint =>
      'Modalità compatibile: prova le cifre jolly in ordine esadecimale crescente.';

  @override
  String irFinderSmartMeaningfulBits(int bits) {
    return 'La modalità intelligente varia $bits bit significativi per questa maschera.';
  }

  @override
  String get irFinderBruteforceMaskTip =>
      'Suggerimento: sostituisci ogni cifra sconosciuta con X. Fissare cifre note in qualsiasi posizione riduce molto la ricerca.';

  @override
  String get automationBroadcastsTitle => 'Consenti broadcast di automazione';

  @override
  String get automationBroadcastsSubtitle =>
      'Qualsiasi app installata può inviare comandi IR tramite il trasmettitore integrato, USB o audio, anche quando questa app è chiusa. USB richiede un’autorizzazione preventiva. L’audio richiede un adattatore IR e il volume multimediale alzato.';

  @override
  String get automationSettingsError =>
      'Impossibile caricare o salvare l’impostazione di automazione. Riprova.';

  @override
  String get settingsHardwareTitle => 'Hardware IR e apprendimento';

  @override
  String get settingsHardwareSubtitle =>
      'Scegli un emettitore, gestisci USB e apprendi segnali';

  @override
  String get settingsAppearanceSubtitle => 'Tema, colori e lingua dell’app';

  @override
  String get settingsInteractionSubtitle =>
      'Avvio, vibrazione, visualizzazione del telecomando e automazione';

  @override
  String get settingsToolsTitle => 'Strumenti e scorciatoie';

  @override
  String get settingsToolsSubtitle =>
      'Controlli dei dispositivi, impostazioni rapide, GitHub Store e accensione universale';

  @override
  String get layoutCustom => 'Personalizzata';

  @override
  String get layoutCustomDescription =>
      'Scegli il numero di colonne e la forma dei pulsanti. Aggiungi spazi vuoti nell’editor.';

  @override
  String get layoutColumns => 'Pulsanti per riga';

  @override
  String get layoutShape => 'Forma dei pulsanti';

  @override
  String get layoutCircle => 'Cerchio';

  @override
  String get layoutRoundedSquare => 'Quadrato arrotondato';

  @override
  String get layoutRectangle => 'Rettangolo';

  @override
  String get layoutReflowHint =>
      'Cambiare il numero di colonne riorganizza la griglia. Scorri lateralmente se la griglia è più larga dello schermo.';

  @override
  String get layoutUpdated => 'Disposizione aggiornata';

  @override
  String get layoutArrange => 'Disponi i pulsanti';

  @override
  String get layoutAddRow => 'Aggiungi riga vuota';

  @override
  String get layoutArrangeHint =>
      'Tieni premuto un pulsante e trascinalo, oppure toccalo e poi tocca la nuova posizione. Se c’è già un pulsante, si scambiano di posto.';

  @override
  String get layoutEmptyHint =>
      'Tocca uno spazio vuoto per aggiungere un pulsante o un pulsante per modificarlo. Tienilo premuto per altre opzioni.';

  @override
  String layoutCell(int row, int column) {
    return 'Riga $row, colonna $column';
  }

  @override
  String get dbBrandSearchHelp =>
      'Inizia dalla marca, ad esempio Sony o TCL. Poi scegli un modello di dispositivo o telecomando.';

  @override
  String get dbModelSearchHelp =>
      'Cerca il modello indicato sul dispositivo o sul telecomando. Spazi e trattini non devono necessariamente corrispondere.';

  @override
  String get irFinderDatabaseSearchHint =>
      'Inizia da una marca in modalità Database per provare codici noti senza duplicati. La ricerca intelligente a forza bruta dà priorità ad alcune ipotesi, ma non rileva la risposta del dispositivo. Salva un risultato quando il dispositivo risponde.';

  @override
  String get irFinderClearSearchToJump =>
      'Cancella la ricerca per passare a una posizione del test.';

  @override
  String get crashReportTitle => 'Si è verificato un problema in precedenza';

  @override
  String get crashReportExplanation =>
      'Un rapporto locale contiene dettagli tecnici su app, dispositivo ed errore. Nulla viene inviato automaticamente. Controlla le informazioni sensibili prima di condividerlo. La condivisione conserva il rapporto; Non inviare lo elimina; Non ora lo conserva per il prossimo avvio.';

  @override
  String get crashReportDetails => 'Esamina rapporto';

  @override
  String get crashReportShare => 'Condividi rapporto';

  @override
  String get crashReportEmail => 'Contatta via email';

  @override
  String get crashReportCopied => 'Rapporto copiato.';

  @override
  String get crashReportDontSend => 'Non inviare';

  @override
  String get crashReportNotNow => 'Non ora';

  @override
  String get crashReportActionFailed =>
      'Impossibile completare questa azione. Il rapporto è ancora salvato. Prova a copiarlo o condividerlo.';

  @override
  String get shareTitle => 'Condividi e ricevi';

  @override
  String get shareReceive => 'Ricevi';

  @override
  String get shareScan => 'Scansiona codice QR';

  @override
  String get shareOpenFile => 'Apri file condiviso';

  @override
  String get shareSelect => 'Scegli cosa condividere';

  @override
  String get shareSend => 'Condividi con un altro dispositivo';

  @override
  String get shareQr => 'Mostra codice QR';

  @override
  String get shareQrHint =>
      'Sull’altro telefono, apri IR Blaster > Telecomandi > Condividi e ricevi > Scansiona codice QR.';

  @override
  String get shareTooLarge =>
      'Troppi dati per un QR leggibile. Usa la condivisione con un altro dispositivo.';

  @override
  String get sharePreview => 'Controlla elementi condivisi';

  @override
  String get sharePrivacy =>
      'Non servono account né server. Nulla viene inviato o trasmesso automaticamente. Il dispositivo ricevente deve avere un emettitore IR compatibile.';

  @override
  String get shareHardwareWarning =>
      'Alcuni segnali appresi richiedono l’hardware originale e potrebbero non funzionare su altri dispositivi.';

  @override
  String get shareMacroInfo =>
      'Le macro includono telecomandi e pulsanti associati. L’importazione crea nuove copie; nulla viene sovrascritto o eseguito automaticamente.';

  @override
  String get shareAdd => 'Aggiungi copie';

  @override
  String get shareAdded => 'Elementi condivisi aggiunti.';

  @override
  String get shareDestination => 'Aggiungi pulsante a';

  @override
  String get shareCamera =>
      'Consenti l’accesso alla fotocamera per scansionare i QR oppure apri un file condiviso.';

  @override
  String get shareInvalid =>
      'Questi dati non sono validi, sono troppo grandi o usano una versione non supportata.';

  @override
  String get sharePrepareFailed =>
      'Impossibile preparare la condivisione. Controlla immagini o pulsanti macro mancanti e le dimensioni della selezione.';

  @override
  String get shareFailed =>
      'Impossibile completare la condivisione o il salvataggio. Gli elementi esistenti non sono stati sostituiti.';

  @override
  String get updatesTitle => 'Aggiornamenti dell’app';

  @override
  String get updatesAutomatic => 'Controlla automaticamente gli aggiornamenti';

  @override
  String get updatesPrivacyGithub =>
      'Disattivato per impostazione predefinita. Se attivato, contatta GitHub una volta al giorno durante l’uso dell’app. Nessun download automatico.';

  @override
  String get updatesPrivacyPlay =>
      'Disattivato per impostazione predefinita. Se attivato, contatta Google Play una volta al giorno durante l’uso dell’app. Nessun download automatico.';

  @override
  String get updatesUnknown => 'Sconosciuta';

  @override
  String get updatesChooseSource => 'Scegli la fonte degli aggiornamenti';

  @override
  String get updatesCheck => 'Controlla ora';

  @override
  String get updatesNever => 'Non ancora controllato';

  @override
  String updatesLastChecked(String date) {
    return 'Ultimo controllo: $date';
  }

  @override
  String updatesAvailable(String version) {
    return 'Nuova versione: $version';
  }

  @override
  String get updatesCurrent => 'Nessuna versione più recente trovata.';

  @override
  String get updatesFailed =>
      'Aggiornamento non riuscito. Controlla la connessione e riprova. Gli APK incompatibili vengono bloccati; nessun dato dell’app viene eliminato.';

  @override
  String get updatesFdroidNote =>
      'GitHub può annunciare una versione prima che F-Droid la compili. Aggiorna tramite F-Droid per mantenere una firma compatibile e i tuoi dati.';

  @override
  String get updatesOpenFdroid => 'Apri F-Droid';

  @override
  String get updatesOpenPlay => 'Apri Google Play';

  @override
  String get updatesDownload => 'Scarica aggiornamento';

  @override
  String get updatesInstall => 'Installa aggiornamento';

  @override
  String get updatesAllowInstall => 'Consenti installazione';

  @override
  String get updatesInstallHint =>
      'Android potrebbe chiedere il permesso di installare da questa app. Torna qui e tocca Installa aggiornamento. Telecomandi e macro vengono conservati.';

  @override
  String get updatesReady =>
      'Aggiornamento scaricato e pronto per l’installazione.';

  @override
  String get updatesNoAsset =>
      'Nessun APK verificato disponibile per questo dispositivo. Consulta le note di versione.';

  @override
  String get updatesReleaseNotes => 'Note di versione';

  @override
  String updatesChannel(String source) {
    return 'Fonte degli aggiornamenti: $source';
  }

  @override
  String updatesDownloadConfirm(String size) {
    return 'Scaricare $size MB da GitHub? L’installazione richiede la tua conferma.';
  }

  @override
  String get learningModeIncompleteSignal =>
      'Il segnale sembra incompleto. Avvicina il telecomando e riprova.';

  @override
  String get learningModeUseUsb => 'Usa adattatore USB';

  @override
  String get learningModeSwitchedUsb => 'Adattatore USB selezionato.';

  @override
  String learningModeSwitchUsbFailed(String error) {
    return 'Impossibile selezionare l’adattatore USB: $error';
  }

  @override
  String get learningModeAudioUnavailableTitle =>
      'Apprendimento audio non disponibile';

  @override
  String get learningModeAudioUnavailableBody =>
      'Gli accessori IR audio possono inviare comandi, ma non apprendere segnali in questa app. Usa un ricevitore compatibile con l’apprendimento.';

  @override
  String learningModeBuiltInReceiver(String brand) {
    return 'Ricevitore IR integrato $brand';
  }

  @override
  String get learningModeUsbReceiver => 'Ricevitore USB per apprendimento';

  @override
  String learningModeDefaultRemoteName(String buttonName) {
    return 'Telecomando $buttonName';
  }

  @override
  String get learningModeSupportedReceivers =>
      'Usa un ricevitore supportato dall’app:\n• Un adattatore IR USB compatibile Tiqiaa, ZaZa o ElkSmart\n• Un telefono Huawei / Honor supportato con ricezione IR\n• Un telefono LG supportato con UEI Quickset\n\nNon tutti i modelli supportano l’apprendimento.';

  @override
  String learningModeCapturedWith(String device) {
    return 'Segnale acquisito con $device';
  }

  @override
  String get learningModeLgReplayRestriction =>
      'Per inviare questo segnale serve lo stesso telefono LG usato per acquisirlo.';

  @override
  String learningModeTimingCount(int count) {
    return 'Intervalli registrati: $count';
  }

  @override
  String get learningModeUnknownCarrier => 'Frequenza portante sconosciuta';

  @override
  String learningModeByteCount(int count) {
    return 'Byte: $count';
  }
}
