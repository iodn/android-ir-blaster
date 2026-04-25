// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Chargement…';

  @override
  String get unknownError => 'Erreur inconnue';

  @override
  String get failedToStart => 'Échec du démarrage';

  @override
  String get retry => 'Réessayer';

  @override
  String get quickTilePower => 'Power';

  @override
  String get quickTileMute => 'Muet';

  @override
  String get quickTileVolumeUp => 'Vol +';

  @override
  String get quickTileVolumeDown => 'Vol -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Ce téléphone n\'a pas d\'émetteur infrarouge intégré. Un dongle IR USB est détecté, mais l\'autorisation n\'est pas encore accordée.\n\nValidez la demande USB pour activer l\'envoi IR.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'Ce téléphone n\'a pas d\'émetteur infrarouge intégré. Un dongle IR USB est détecté, mais l\'autorisation USB a été refusée.\n\nRedemandez l\'autorisation et validez l\'invite pour activer l\'envoi IR.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'Ce téléphone n\'a pas d\'émetteur infrarouge intégré. Un dongle IR USB est autorisé, mais pas encore initialisé.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Ce téléphone n\'a pas d\'émetteur infrarouge intégré. Un dongle IR USB est détecté et autorisé, mais il n\'a pas pu être initialisé.\n\nRebranchez le dongle et réessayez.';

  @override
  String get homeUsbReadyMessage =>
      'Ce téléphone n\'a pas d\'émetteur infrarouge intégré.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Ce téléphone n\'a pas d\'émetteur infrarouge intégré et aucun dongle IR USB compatible n\'est connecté.\n\nVous pouvez quand même créer, importer et gérer des télécommandes - mais pour émettre des signaux IR il faut une des options ci-dessous.';

  @override
  String get homeUsbOptionPlugIn =>
      'Branchez un dongle IR USB compatible, puis validez l\'autorisation.';

  @override
  String get homeUsbOptionReady => 'Prêt à l\'emploi.';

  @override
  String get homeUsbOptionPermissionRequired =>
      'Branché. Autorisation requise.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Autorisation refusée. Redemandez-la.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Autorisé. Initialisation du dongle.';

  @override
  String get homeUsbOptionOpenFailed => 'Autorisé, mais init. échouée.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Ce téléphone n\'a pas d\'IR intégré. Branchez un dongle IR USB ou activez le mode Audio dans Réglages.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Dongle USB détecté. Autorisation requise pour envoyer l\'IR.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'L\'autorisation USB a été refusée. Redemandez-la pour envoyer l\'IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Dongle USB autorisé. Attente de l\'initialisation.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Dongle USB autorisé, mais init. échouée.';

  @override
  String get homeHardwareBannerReady => 'USB prêt.';

  @override
  String get homeHardwareRequiredTitle => 'Matériel IR requis pour envoyer';

  @override
  String get homeUsbDongleRecommended => 'Dongle IR USB (recommandé)';

  @override
  String get homeAudioAdapterAlternative => 'Adaptateur IR audio (altern.)';

  @override
  String get homeAudioAdapterDescription =>
      'Réglages → Émetteur IR → Audio (1 LED / 2 LED). Nécessite un adaptateur audio vers IR.';

  @override
  String get close => 'Fermer';

  @override
  String get homeChooseTransmitter => 'Choisir un émetteur';

  @override
  String get openSettings => 'Ouvrir Réglages';

  @override
  String get homeUsbPermissionSentApprove =>
      'Demande d\'autorisation USB envoyée. Validez l\'invite pour activer l\'USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'Aucun dongle IR USB compatible détecté. Branchez-le puis réessayez.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Échec de la demande d\'autorisation USB.';

  @override
  String get working => 'En cours…';

  @override
  String get requestUsbPermission => 'Demander l\'autorisation USB';

  @override
  String get homeHardwareTip =>
      'Astuce : vous pouvez déjà créer et organiser vos télécommandes. Le matériel n\'est requis qu\'à l\'envoi.';

  @override
  String get homeNoIrTransmitterTitle => 'Aucun émetteur IR dispo';

  @override
  String get homeHardwareRequiredBody =>
      'IR Blaster permet de créer et de gérer des télécommandes sur n\'importe quel téléphone. Pour envoyer réellement des commandes infrarouges, votre appareil a besoin de l\'une des options matérielles ci-dessous.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Vous pouvez déjà créer, importer et organiser des télécommandes dès maintenant.';

  @override
  String get homeWaysToUseIrBlaster => 'Façons d\'utiliser IR Blaster';

  @override
  String get homeBuiltInIrOptionTitle => 'Téléphone avec IR intégré';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Fonctionne sur les téléphones compatibles dotés d\'un émetteur IR intégré. Ce téléphone n\'en possède pas.';

  @override
  String get homeBuiltInIrUnavailable => 'Non disponible sur ce téléphone';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'Adaptateur audio 3,5 mm';

  @override
  String get homeContinueWithoutHardware => 'Continuer sans matériel';

  @override
  String get homeHowItWorks => 'Comment ça marche';

  @override
  String get settingsNavLabel => 'Réglages';

  @override
  String get dismiss => 'Ignorer';

  @override
  String get remotesNavLabel => 'Télécommandes';

  @override
  String get macrosNavLabel => 'Macros';

  @override
  String get signalTesterNavLabel => 'Signal Testeur';

  @override
  String get settingsTitle => 'Réglages';

  @override
  String get remoteNoIrEmitterTitle => 'Aucun émetteur IR';

  @override
  String get remoteNoIrEmitterMessage => 'Cet appareil n\'a pas d\'émetteur IR';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Cette appli a besoin d\'un émetteur IR';

  @override
  String get remoteDismiss => 'Ignorer';

  @override
  String get remoteClose => 'Fermer';

  @override
  String remoteFailedToSend(Object error) {
    return 'Échec de l\'envoi IR : $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Échec du démarrage boucle : $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Boucle arrêtée (échec envoi) : $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Boucle sur \"$title\". Touchez Arrêter en haut pour stopper.';
  }

  @override
  String get remoteLoopStopped => 'Boucle arrêtée.';

  @override
  String get remoteUpdatedNotFound =>
      'Télécommande mise à jour à l\'écran. Introuvable dans la liste enregistrée.';

  @override
  String remoteUpdatedNamed(Object name) {
    return '\"$name\" mis à jour.';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Suppression échouée : $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'Télécommande introuvable dans la liste.';

  @override
  String remoteDeletedNamed(Object name) {
    return '\"$name\" supprimé.';
  }

  @override
  String get buttonFallbackTitle => 'Bouton';

  @override
  String get imageFallbackTitle => 'Image';

  @override
  String get noBrowserAvailable => 'Aucun navigateur dispo';

  @override
  String failedToOpen(Object error) {
    return 'Échec de l\'ouverture : $error';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get settingsRestoreDemoTitle => 'Restaurer les démos ?';

  @override
  String get settingsRestoreDemoMessage =>
      'Cela remplacera vos télécommandes par les démos intégrées. Une sauvegarde est conseillée si vous voulez garder la liste actuelle.';

  @override
  String get settingsRestoreDemoConfirm => 'Restaurer la démo';

  @override
  String get settingsDemoRemotesRestored => 'Télécommandes démo restaurées.';

  @override
  String get settingsDeleteAllRemotesTitle =>
      'Supprimer toutes les télécommandes ?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Cela supprime toutes les télécommandes de cet appareil. Cette action est irréversible.';

  @override
  String get settingsDeleteAllConfirm => 'Tout supprimer';

  @override
  String get settingsAllRemotesDeleted =>
      'Toutes les télécommandes ont été supprimées.';

  @override
  String get themeAuto => 'Thème auto';

  @override
  String get themeLight => 'Thème clair';

  @override
  String get themeDark => 'Thème sombre';

  @override
  String get themeDescAuto => 'Suit les réglages de l\'appareil';

  @override
  String get themeDescLight => 'Toujours clair et net';

  @override
  String get themeDescDark => 'Reposant pour les yeux';

  @override
  String get themeHintAuto =>
      'Le thème change automatiquement quand vous passez du mode clair au mode sombre sur l\'appareil';

  @override
  String get themeHintLight => 'Parfait de jour et en lieux bien éclairés';

  @override
  String get themeHintDark =>
      'Réduit la fatigue visuelle en faible lumière et économise la batterie sur écran OLED';

  @override
  String get supportDevelopmentTitle => 'Soutenir le développement';

  @override
  String get supportDevelopmentSubtitle =>
      'Aidez IR Blaster à rester maintenu et compatible';

  @override
  String get supportDevelopmentBody =>
      'Sans pub, sans suivi, sans fonctions bloquées. Votre soutien finance le travail protocole, le support des dongles USB et une meilleure compatibilité entre appareils.';

  @override
  String get donate => 'Faire un don';

  @override
  String get starRepo => 'Mettre une étoile';

  @override
  String get repositoryLinkCopied => 'Lien du dépôt copié';

  @override
  String get supportPillLocalOnly => 'Local uniquement';

  @override
  String get supportPillNoTracking => 'Sans suivi';

  @override
  String get supportPillHardwareAware => 'Matériel pris en compte';

  @override
  String get supportPillOpenSource => 'Open source';

  @override
  String get appearanceTitle => 'Apparence';

  @override
  String get appearanceSubtitle => 'Personnalisez votre affichage';

  @override
  String get localizationTitle => 'Localisation';

  @override
  String get localizationSubtitle => 'Langue de l\'appli et traduction';

  @override
  String localizationAutoUsing(Object language) {
    return 'Auto : $language';
  }

  @override
  String get localizationAutoDescription =>
      'L\'appli suit la langue de l\'appareil si possible.';

  @override
  String get localizationManualDescription =>
      'La langue de l\'appli est forcée manuellement.';

  @override
  String get useSystemLanguageTitle => 'Utiliser la langue système';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Suit la langue de l\'appareil : $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Utilise la langue choisie ci-dessous au lieu de celle de l\'appareil.';

  @override
  String get chooseAppLanguage => 'Choisir la langue de l\'appli';

  @override
  String get languagePickerDisabledHint =>
      'Désactivez la langue système pour choisir une langue manuellement.';

  @override
  String get searchLanguages => 'Rechercher des langues';

  @override
  String get noLanguagesFound => 'Aucune langue trouvée';

  @override
  String get localizationHint =>
      'Quand la langue système est activée, l\'appli suit la langue de l\'appareil et revient à l\'anglais si une traduction manque. Désactivez-la pour verrouiller une langue précise.';

  @override
  String get appLanguageTitle => 'Langue de l\'appli';

  @override
  String get appLanguageHint =>
      'Auto suit la langue de l\'appareil. Choisissez ici anglais ou français pour l\'appli seule.';

  @override
  String get languageAuto => 'Auto (système)';

  @override
  String get languageAutoDescription =>
      'Suit automatiquement la langue de l\'appareil';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get languageEnglishDescription =>
      'Force l\'appli à toujours utiliser l\'anglais';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageFrenchDescription =>
      'Force l\'appli à toujours utiliser le français';

  @override
  String get languageAutoShort => 'Auto';

  @override
  String get languageEnglishShort => 'English';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'Utiliser les couleurs dynamiques';

  @override
  String get themeChoiceAuto => 'Auto';

  @override
  String get themeChoiceLight => 'Clair';

  @override
  String get themeChoiceDark => 'Sombre';

  @override
  String get irTransmitterTitle => 'Émetteur IR';

  @override
  String get irTransmitterSubtitle =>
      'Choisissez le matériel qui envoie les commandes IR';

  @override
  String get learningModeEntryTitle => 'Mode d\'apprentissage';

  @override
  String get learningModeEntrySubtitle =>
      'Capturez un bouton depuis une télécommande physique étape par étape';

  @override
  String get learningModeTitle => 'Mode d\'apprentissage';

  @override
  String get learningModeHeroTitle =>
      'Apprendre proprement un bouton de télécommande';

  @override
  String get learningModeHeroSubtitle =>
      'Configurez votre récepteur, préparez la télécommande d\'origine, capturez une commande, puis examinez-la avant de l\'enregistrer dans une télécommande.';

  @override
  String get learningModeReadyBadge => 'Récepteur prêt';

  @override
  String get learningModeNeedsPermissionBadge => 'Autorisation USB requise';

  @override
  String get learningModeSetupBadge => 'Configuration du récepteur nécessaire';

  @override
  String get learningModeNoReceiverBadge => 'Pas de récepteur d\'apprentissage';

  @override
  String get learningModeCheckingBadge => 'Vérification du matériel';

  @override
  String get learningModeFourStepFlow => 'Flux guidé en 4 étapes';

  @override
  String get learningModeSaveAnywhereBadge => 'Vérifier avant d\'enregistrer';

  @override
  String get learningModeGuideTitle =>
      'Ramassez là où la capture devrait avoir lieu';

  @override
  String get learningModeStepHardwareShort => 'Matériel';

  @override
  String get learningModeStepPrepareShort => 'Préparer';

  @override
  String get learningModeStepCaptureShort => 'Capturer';

  @override
  String get learningModeStepReviewShort => 'Revoir';

  @override
  String get learningModeStepHardwareTitle =>
      'Vérifiez le matériel du récepteur';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Assurez-vous qu\'un récepteur d\'apprentissage compatible est connecté et autorisé avant de commencer.';

  @override
  String get learningModeCurrentSenderLabel => 'Transmetteur de courant';

  @override
  String get learningModeReceiverStatusLabel => 'Statut d\'apprentissage';

  @override
  String get learningModeCheckingHardwareBody =>
      'Vérification de l\'état de l\'émetteur et du récepteur USB disponibles.';

  @override
  String get learningModeHardwareReadyBody =>
      'Un dongle USB IR est connecté et initialisé. C\'est le bon endroit pour démarrer le flux d\'apprentissage une fois le câblage de capture connecté.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Un dongle USB est présent, mais l\'autorisation Android le bloque toujours. Accordez l\'autorisation USB dans la section émetteur avant d\'apprendre.';

  @override
  String get learningModeHardwareSetupBody =>
      'Un dongle est partiellement détecté, mais il doit encore être configuré ou reconnecté avant que l\'apprentissage puisse commencer de manière fiable.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Aucun matériel de récepteur compatible n’est actuellement disponible. Le mode d\'apprentissage est destiné aux dongles externes pris en charge avec capacité de réception.';

  @override
  String get learningModeRefreshHardware => 'Actualiser l\'état du matériel';

  @override
  String get learningModeHardwareTipTitle => 'Meilleur placement';

  @override
  String get learningModeHardwareTipBody =>
      'Le mode d\'apprentissage se trouve sous l\'émetteur IR car il dépend de la disponibilité du matériel et est moins souvent utilisé que l\'envoi de télécommandes.';

  @override
  String get learningModeStepPrepareTitle =>
      'Préparez la télécommande d\'origine';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Décidez de ce que vous apprenez, puis gardez la télécommande d\'origine stable et proche du récepteur.';

  @override
  String get learningModeButtonNameLabel => 'Nom du bouton';

  @override
  String get learningModeButtonNameHint =>
      'Par exemple : HDMI 1, Alimentation, Menu';

  @override
  String get learningModeSinglePress => 'Une seule pression';

  @override
  String get learningModeHoldButton => 'Bouton Maintenir';

  @override
  String get learningModePreparationChecklistTitle => 'Avant de capturer';

  @override
  String get learningModePreparationItemDistance =>
      'Gardez la télécommande d\'origine à environ 2 à 5 cm du récepteur.';

  @override
  String get learningModePreparationItemOneButton =>
      'Apprenez un bouton à la fois et utilisez d’abord une pression courte et nette.';

  @override
  String get learningModePreparationItemStill =>
      'Gardez les deux appareils stables pour éviter les captures bruyantes ou partielles.';

  @override
  String get learningModeStepCaptureTitle => 'Capturez le signal';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Écoutez une seule commande, puis verrouillez le résultat avant de le consulter.';

  @override
  String get learningModeCaptureReadyTitle => 'Prêt à écouter';

  @override
  String get learningModeCaptureReadyBody =>
      'L\'état de votre matériel semble bon. Le backend de capture se connectera ensuite à cette étape.';

  @override
  String get learningModeCaptureBlockedTitle =>
      'Le matériel n\'est pas encore prêt';

  @override
  String get learningModeCaptureBlockedBody =>
      'Vous pouvez toujours consulter le flux maintenant, mais la capture doit attendre que le récepteur soit prêt.';

  @override
  String get learningModeStartListening => 'Commencez à écouter';

  @override
  String get learningModeCaptureStubTitle =>
      'Le backend de capture vient ensuite';

  @override
  String get learningModeCaptureStubBody =>
      'Cet écran est d\'abord entièrement échafaudé afin que le flux de capture final puisse se connecter aux états matériels réels au lieu d\'être boulonné ultérieurement.';

  @override
  String get learningModeCaptureStubMessage =>
      'La capture d\'apprentissage n\'est pas encore câblée. Cet écran échafaude d’abord le flux complet.';

  @override
  String get learningModeUnnamedCapture => 'Capture sans nom';

  @override
  String get learningModeStatusCheckingTitle => 'Vérification du récepteur';

  @override
  String get learningModeStatusNoReceiverTitle =>
      'Le récepteur n\'est pas prêt';

  @override
  String get learningModeStatusPermissionTitle => 'Autorisation USB requise';

  @override
  String get learningModeStatusSetupTitle => 'Le récepteur doit être configuré';

  @override
  String get learningModeStatusReadyTitle => 'Prêt à apprendre';

  @override
  String get learningModeStatusListeningTitle => 'À l\'écoute d\'un signal';

  @override
  String get learningModeStatusCapturedTitle => 'Signal capturé';

  @override
  String get learningModeStatusReadyBody =>
      'Nommez le bouton, pointez la télécommande d\'origine vers le récepteur et commencez à écouter lorsque vous êtes prêt.';

  @override
  String get learningModeStatusListeningBody =>
      'Appuyez maintenant sur le bouton de la télécommande d\'origine. Une fois la capture câblée, cet état se verrouillera sur le prochain signal propre.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Un aperçu du signal appris est prêt pour $buttonName. Rejouez-le, confirmez qu\'il fonctionne, puis enregistrez-le dans votre bibliothèque.';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'Connectez un dongle d\'apprentissage compatible';

  @override
  String get learningModeConnectReceiverBody =>
      'Le mode d\'apprentissage dépend du matériel externe pouvant recevoir des infrarouges. Une fois le récepteur détecté et autorisé, cette page devient un flux direct d\'écoute, de test et de sauvegarde.';

  @override
  String get learningModeListenCardTitle => 'Écoutez un bouton';

  @override
  String get learningModeListenCardBody =>
      'Définissez d\'abord une étiquette si vous le souhaitez, puis commencez à écouter et appuyez sur le bouton de la télécommande d\'origine.';

  @override
  String get learningModeReadyToListenTitle => 'Prêt à écouter';

  @override
  String get learningModeReadyToListenBody =>
      'C\'est la principale surface de capture. Commencez à écouter uniquement lorsque la télécommande d\'origine est orientée et stable.';

  @override
  String get learningModeListeningNowTitle => 'En écoute maintenant';

  @override
  String get learningModeListeningNowBody =>
      'Appuyez une fois sur le bouton de la télécommande d\'origine. Utilisez la capture d\'aperçu pour vous déplacer dans le reste de l\'échafaudage avant que le véritable backend de capture ne soit câblé.';

  @override
  String get learningModePreviewCaptureAction => 'Aperçu du signal capturé';

  @override
  String get learningModeCapturedSummary => 'Aperçu du signal appris';

  @override
  String get learningModeResultActionsTitle => 'Testez et enregistrez';

  @override
  String get learningModeResultActionsBody =>
      'Rejouez le signal appris, vérifiez que l\'appareil cible répond, puis enregistrez-le en tant que bouton réutilisable.';

  @override
  String get learningModeReplayAction => 'Rejouer';

  @override
  String get learningModeReplayStubMessage =>
      'Le replay n\'est pas encore câblé. Il s\'agit de l\'échafaudage de l\'interface utilisateur pour le flux final d\'apprentissage, de test et de sauvegarde.';

  @override
  String get learningModeSaveStubMessage =>
      'La sauvegarde n\'est pas encore câblée. L\'étape suivante consiste à connecter cet écran au bouton Créer et aux télécommandes existantes.';

  @override
  String get learningModeLearnAnotherAction => 'Apprendre un autre bouton';

  @override
  String get learningModeStepReviewTitle => 'Vérifier et enregistrer';

  @override
  String get learningModeStepReviewSubtitle =>
      'Confirmez ce qui a été appris, puis choisissez où il doit se trouver dans votre bibliothèque distante.';

  @override
  String get learningModeSaveToExistingRemote => 'Télécommande existante';

  @override
  String get learningModeCreateNewRemote => 'Nouvelle télécommande';

  @override
  String get learningModeProtocolPreviewTitle => 'Aperçu du protocole';

  @override
  String get learningModeProtocolPreviewBody =>
      'Les détails du protocole décodés apparaîtront ici une fois que le récepteur aura capturé une pression nette sur un bouton.';

  @override
  String get learningModeRawPreviewTitle => 'Repli brut';

  @override
  String get learningModeRawPreviewBody =>
      'Si le décodage est incomplet, la capture temporelle brute sera toujours disponible ici pour examen et sauvegarde.';

  @override
  String get learningModeSaveCapture => 'Enregistrer la capture';

  @override
  String get learningModeReviewTipTitle => 'Où cela ira ensuite';

  @override
  String get learningModeReviewTipBody =>
      'La prochaine étape de mise en œuvre devrait connecter ce panneau de révision au bouton Créer et aux télécommandes existantes afin que le signal appris tombe directement dans votre bibliothèque.';

  @override
  String get learningModeFinishPreview => 'Terminer l\'aperçu';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interaction';

  @override
  String get interactionSubtitle => 'Retour tactile et disposition';

  @override
  String get hapticFeedbackTitle => 'Retour haptique';

  @override
  String get hapticFeedbackSubtitle => 'Vibrer aux touches et actions';

  @override
  String get forceInAppVibrationTitle => 'Forcer la vibration dans l’appli';

  @override
  String get forceInAppVibrationSubtitle =>
      'Utiliser directement le vibreur même si le retour tactile système est désactivé';

  @override
  String get forceInAppVibrationWarning =>
      'Option avancée. L’application peut vibrer même si le retour tactile Android est désactivé globalement.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'Intensité';

  @override
  String get intensityLight => 'Léger';

  @override
  String get intensityMedium => 'Moyen';

  @override
  String get intensityStrong => 'Fort';

  @override
  String get flipRemoteDefaultTitle => 'Vue télécommande inversée par défaut';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Ouvre les écrans Télécommande avec rotation 180° (pour dongles USB montés en bas).';

  @override
  String get remoteViewFlipped => 'La vue télécommande sera inversée.';

  @override
  String get remoteViewNormal => 'La vue télécommande sera normale.';

  @override
  String get backupTitle => 'Sauvegarde';

  @override
  String get backupSubtitle => 'Importer/exporter télécommandes et macros';

  @override
  String get importBackup => 'Importer sauvegarde';

  @override
  String get importBackupSubtitle =>
      'Importer une sauvegarde tél./macros ou des fichiers Flipper Zero, LIRC ou IRPLUS';

  @override
  String get bulkImportFolder => 'Import dossier';

  @override
  String get bulkImportFolderSubtitle =>
      'Importer plusieurs télécommandes depuis un dossier';

  @override
  String get exportBackup => 'Exporter sauvegarde';

  @override
  String get exportBackupSubtitle =>
      'Enregistrer télécommandes + macros en un fichier JSON dans Téléchargements';

  @override
  String get restoreDemoRemotes => 'Restaurer les démos';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Remplacer les télécommandes actuelles par la démo intégrée';

  @override
  String get deleteAllRemotes => 'Supprimer toutes les télés';

  @override
  String get deleteAllRemotesSubtitle =>
      'Retirer toutes les télécommandes de cet appareil';

  @override
  String get backupTip =>
      'Astuce : exportez une sauvegarde avant de gros changements. L\'import prend en charge les sauvegardes complètes, les anciennes sauvegardes JSON de télécommandes seules et les fichiers .ir Flipper Zero.';

  @override
  String get aboutTitle => 'À propos';

  @override
  String get aboutSubtitle => 'Infos de l\'appli et détails open source';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Version $version';
  }

  @override
  String get sourceCode => 'Code source';

  @override
  String get viewOnGitHub => 'Voir sur GitHub';

  @override
  String get repositoryUrlCopied => 'URL du dépôt copiée';

  @override
  String get reportIssue => 'Signaler un bug';

  @override
  String get reportIssueSubtitle => 'Rapports de bug et demandes de fonctions';

  @override
  String get issuesUrlCopied => 'URL des tickets copiée';

  @override
  String get license => 'Licence';

  @override
  String get openSourceLicense => 'Licence open source';

  @override
  String get licenseUrlCopied => 'URL de la licence copiée';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Visiter notre site';

  @override
  String get companyUrlCopied => 'URL de l\'entreprise copiée';

  @override
  String get licenses => 'Licences';

  @override
  String get openSourceLicenses => 'Licences open source';

  @override
  String byCreator(Object creator) {
    return 'par $creator';
  }

  @override
  String get deviceControlsTitle => 'Contrôles appareil';

  @override
  String get deviceControlsSubtitle =>
      'Afficher les boutons favoris dans les contrôles système';

  @override
  String get manageFavorites => 'Gérer les favoris';

  @override
  String get manageFavoritesSubtitle =>
      'Choisir quels boutons apparaissent dans les contrôles';

  @override
  String get quickSettingsTitle => 'Réglages rapides';

  @override
  String get quickSettingsSubtitle =>
      'Ajouter des tuiles pour les raccourcis alimentation et volume';

  @override
  String get configureTiles => 'Configurer les tuiles';

  @override
  String get configureTilesSubtitle => 'Associer les tuiles aux boutons';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Cycle d\'alimentation universel pour appareils possédés';

  @override
  String get openTvKill => 'Ouvrir TVKill';

  @override
  String get openTvKillSubtitle =>
      'Faire défiler les codes power (uniquement sur vos appareils)';

  @override
  String get failedToLoadTransmitterSettings =>
      'Échec du chargement des réglages d\'émetteur.';

  @override
  String get usbStatusReady =>
      'Le dongle IR USB est connecté et prêt à envoyer l\'IR.';

  @override
  String get usbStatusPermissionRequired =>
      'Dongle IR USB détecté. Demandez l\'autorisation USB et validez l\'invite système.';

  @override
  String get usbStatusPermissionDenied =>
      'L\'autorisation USB du dongle branché a été refusée. Redemandez-la et validez l\'invite.';

  @override
  String get usbStatusPermissionGranted =>
      'L\'autorisation USB est accordée. Le dongle doit encore être initialisé avant d\'envoyer l\'IR.';

  @override
  String get usbStatusOpenFailed =>
      'L\'autorisation USB est accordée, mais le dongle n\'a pas pu être initialisé. Rebranchez-le et réessayez.';

  @override
  String get usbStatusNoDevice => 'Aucun dongle IR USB compatible détecté.';

  @override
  String get usbSelectPermissionRequired =>
      'Dongle IR USB détecté mais non autorisé. Touchez \"Demander l\'autorisation USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'Autorisation USB refusée. Touchez \"Demander l\'autorisation USB\" et validez l\'invite.';

  @override
  String get usbSelectPermissionGranted =>
      'L\'autorisation USB est accordée, mais le dongle n\'est pas encore initialisé. Essayez de le rebrancher.';

  @override
  String get usbSelectOpenFailed =>
      'L\'autorisation USB est accordée, mais le dongle n\'a pas pu être initialisé. Rebranchez-le et réessayez.';

  @override
  String get usbSelectNoDevice =>
      'Aucun dongle IR USB compatible détecté. Branchez-le puis touchez \"Demander l\'autorisation USB\".';

  @override
  String get usbSelectReady => 'Le dongle IR USB est prêt.';

  @override
  String get autoSwitchEnabledMessage =>
      'Bascule auto activée : utilise USB si connecté, sinon Interne.';

  @override
  String get autoSwitchDisabledMessage =>
      'Bascule auto désactivée : le choix de l\'émetteur est maintenant manuel.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Échec de la mise à jour de la bascule auto.';

  @override
  String get failedToSwitchTransmitter => 'Échec du changement d\'émetteur.';

  @override
  String get deviceHasNoInternalIr =>
      'Cet appareil n\'a pas d\'émetteur IR intégré.';

  @override
  String get audioModeEnabledMessage =>
      'Mode audio activé. Utilisez le volume média max et un adaptateur LED audio vers IR.';

  @override
  String get usbPermissionRequestSent => 'Demande d\'autorisation USB envoyée.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Demande d\'autorisation USB envoyée. Validez l\'invite pour activer l\'USB.';

  @override
  String get usbAlreadyReady => 'Le dongle IR USB est déjà initialisé et prêt.';

  @override
  String get failedToRequestUsbPermission =>
      'Échec de la demande d\'autorisation USB.';

  @override
  String get transmitterHelpInternal =>
      'Utiliser l\'émetteur IR intégré du téléphone pour envoyer les commandes.';

  @override
  String get transmitterHelpUsb =>
      'Utiliser un dongle IR USB (autorisation requise) pour envoyer les commandes.';

  @override
  String get transmitterHelpAudio1 =>
      'Utiliser la sortie audio (mono). Nécessite un adaptateur LED audio vers IR et un volume média élevé.';

  @override
  String get transmitterHelpAudio2 =>
      'Utiliser la sortie audio (stéréo). Utilise deux canaux pour mieux piloter les LED avec des adaptateurs compatibles.';

  @override
  String get transmitterInternal => 'IR interne';

  @override
  String get transmitterUsb => 'Dongle IR USB';

  @override
  String get transmitterAudio1 => 'Audio (1 LED)';

  @override
  String get transmitterAudio2 => 'Audio (2 LED)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Échec du chargement des capacités de l\'émetteur.';

  @override
  String get selectedTransmitter => 'Émetteur sélectionné';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Actif : $active';
  }

  @override
  String get refresh => 'Actualiser';

  @override
  String get autoSwitchTitle => 'Bascule auto';

  @override
  String get autoSwitchDisabledWhileAudio => 'Désactivé en mode audio';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Utilise USB si connecté, sinon Interne';

  @override
  String get unavailableOnThisDevice => 'Indisponible sur cet appareil';

  @override
  String get openOnUsbAttachTitle => 'Ouvrir à la connexion USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android peut proposer d\'ouvrir l\'appli quand un dongle IR USB compatible est connecté.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Proposera d\'ouvrir IR Blaster quand un dongle USB compatible est branché.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Ne proposera pas l\'ouverture à la connexion USB.';

  @override
  String get failedToUpdateSetting => 'Échec de la mise à jour du réglage.';

  @override
  String get unnamedButton => 'Bouton sans nom';

  @override
  String get iconFallback => 'Icône';

  @override
  String get remoteListReorderHint =>
      'Mode réorganisation : appui long puis glisser une carte pour la déplacer.';

  @override
  String get deleteRemoteTitle => 'Supprimer la télécommande ?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" sera supprimé définitivement. Cette action est irréversible.';
  }

  @override
  String get delete => 'Supprimer';

  @override
  String get addToDeviceControlsTitle => 'Ajouter aux contrôles appareil ?';

  @override
  String get addToDeviceControlsDescription =>
      'Accès rapide dans les contrôles appareil du système.';

  @override
  String get skip => 'Passer';

  @override
  String get add => 'Ajouter';

  @override
  String get addedToDeviceControls => 'Ajouté aux contrôles appareil.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return '\"$name\" supprimé. Cette action est irréversible.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count bouton(s) · $layout';
  }

  @override
  String get layoutComfort => 'Confort';

  @override
  String get layoutCompact => 'Compact';

  @override
  String get open => 'Ouvrir';

  @override
  String get useThisRemote => 'Utiliser cette télécommande';

  @override
  String get edit => 'Modifier';

  @override
  String get editRemoteSubtitle => 'Renommer et modifier les boutons';

  @override
  String get thisCannotBeUndone => 'Cette action est irréversible';

  @override
  String get searchRemotes => 'Rechercher des télés';

  @override
  String get reorderRemotes => 'Réorganiser les télés';

  @override
  String get addRemote => 'Ajouter une télécommande';

  @override
  String get more => 'Plus';

  @override
  String get reorderMode => 'Mode réorganisation';

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
  String get noRemotesYet => 'Aucune télécommande';

  @override
  String get noRemotesDescription =>
      'Créez une télécommande pour commencer à envoyer des codes IR.';

  @override
  String get noRemotesNextStep =>
      'Et ensuite : touchez Ajouter une télécommande, puis ajoutez vos premiers boutons.';

  @override
  String get actions => 'Actions';

  @override
  String get macrosTitle => 'Macros';

  @override
  String get help => 'Aide';

  @override
  String get createMacro => 'Créer une macro';

  @override
  String get timedMacrosTitle => 'Macros temporisées';

  @override
  String get timedMacrosSubtitle =>
      'Automatisez des séquences de commandes IR avec un timing précis';

  @override
  String get timedMacrosNextStep =>
      'Et ensuite : touchez Créer votre première macro, choisissez une télécommande, puis ajoutez commandes et délais.';

  @override
  String get macroFeatureToysTitle => 'Parfait pour les jouets interactifs';

  @override
  String get macroFeatureToysDescription =>
      'Contrôlez des appareils comme les chiens robots i-cybie, les robots i-sobot et d\'autres jouets qui ont besoin de temps entre les commandes.';

  @override
  String get macroFeatureTimingTitle => 'Contrôle précis du timing';

  @override
  String get macroFeatureTimingDescription =>
      'Ajoutez des délais entre les commandes (250 ms à durée libre) pour laisser le temps à l\'appareil de réagir avant l\'action suivante.';

  @override
  String get macroFeatureManualTitle => 'Étapes avec reprise manuelle';

  @override
  String get macroFeatureManualDescription =>
      'Met l\'exécution en pause et attend votre confirmation quand l\'animation varie ou qu\'un retour visuel est utile.';

  @override
  String get exampleUseCase => 'Exemple d\'usage';

  @override
  String get macroExampleText =>
      'Mode avancé i-cybie :\n1. Envoyer la commande \"Mode\"\n2. Attendre 1000 ms (traitement)\n3. Envoyer \"Action 1\"\n4. Attendre 1000 ms\n5. Envoyer \"Action 2\"\n…et ainsi de suite automatiquement !';

  @override
  String get createFirstMacro => 'Créer votre première macro';

  @override
  String get noRemote => 'Aucune télécommande';

  @override
  String macroStepCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count steps',
      one: '$count step',
    );
    return '$_temp0';
  }

  @override
  String get aboutTimedMacros => 'À propos des macros temporisées';

  @override
  String get aboutTimedMacrosDescription =>
      'Les macros temporisées vous permettent d\'automatiser des séquences de commandes IR avec des délais précis entre chaque étape.';

  @override
  String get sendCommand => 'Envoyer commande';

  @override
  String get sendCommandDescription =>
      'Transmet une commande IR depuis votre télécommande.';

  @override
  String get delay => 'Délai';

  @override
  String get delayDescription =>
      'Attend une durée donnée (ex. 1000 ms) avant l\'étape suivante.';

  @override
  String get manualContinue => 'Continuer manuellement';

  @override
  String get manualContinueDescription =>
      'Met l\'exécution en pause jusqu\'à ce que vous touchiez Continuer (utile pour les animations à durée variable).';

  @override
  String get gotIt => 'J\'ai compris';

  @override
  String get failedToSaveMacros => 'Échec de l\'enregistrement des macros.';

  @override
  String deletedMacroNamed(Object name) {
    return '\"$name\" supprimé.';
  }

  @override
  String get undo => 'Annuler';

  @override
  String get failedToRestoreMacro => 'Échec de la restauration de la macro.';

  @override
  String get deleteMacroTitle => 'Supprimer la macro ?';

  @override
  String get deleteMacroMessage =>
      'Vous pourrez annuler via la prochaine snackbar.';

  @override
  String get noRemotesAvailable => 'Aucune télécommande disponible.';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count bouton(s)';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Orientation : inversée (toucher pour normal)';

  @override
  String get remoteOrientationNormalTooltip =>
      'Orientation : normale (toucher pour inverser)';

  @override
  String get stopLoop => 'Arrêter la boucle';

  @override
  String get reorderButtons => 'Réorganiser les boutons';

  @override
  String get remoteReorderHint =>
      'Mode réorganisation : appui long puis glisser un bouton pour le déplacer.';

  @override
  String get manageRemote => 'Gérer la télécommande';

  @override
  String get remoteNoButtons => 'Aucun bouton dans cette télécommande';

  @override
  String get remoteNoButtonsDescription =>
      'Utilisez \"Modifier la télécommande\" pour ajouter ou configurer des boutons.';

  @override
  String get editRemote => 'Modifier la télécommande';

  @override
  String get editRemoteActionsSubtitle =>
      'Renommer, réorganiser et modifier les boutons';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return '\"$name\" mis à jour.';
  }

  @override
  String buttonAddedNamed(Object name) {
    return '\"$name\" ajouté.';
  }

  @override
  String get buttonDuplicated => 'Bouton dupliqué.';

  @override
  String get loopRunningForButton => 'Une boucle est en cours pour ce bouton.';

  @override
  String get loopTip =>
      'Astuce : utilisez Boucle pour répéter jusqu\'à l\'arrêt.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Code copié.';

  @override
  String get copyCode => 'Copier le code';

  @override
  String get startLoop => 'Démarrer la boucle';

  @override
  String get editButtonSubtitle =>
      'Modifier le libellé, le code, le protocole, la fréquence';

  @override
  String get newButton => 'Nouveau bouton';

  @override
  String get newButtonSubtitle => 'Créer un nouveau bouton après celui-ci';

  @override
  String get duplicate => 'Dupliquer';

  @override
  String get duplicateButtonSubtitle => 'Créer une copie de ce bouton';

  @override
  String get removeFromDeviceControls => 'Retirer des contrôles appareil';

  @override
  String get addToDeviceControls => 'Ajouter aux contrôles appareil';

  @override
  String get deviceControlsButtonSubtitle =>
      'Affiche ce bouton dans les contrôles appareil du système';

  @override
  String get removedFromDeviceControls => 'Retiré des contrôles appareil.';

  @override
  String get pinQuickTile => 'Épingler aux favoris de tuiles';

  @override
  String get unpinQuickTile => 'Retirer des favoris de tuiles';

  @override
  String get quickTileButtonSubtitle =>
      'Affiche ce bouton en haut du choix des tuiles rapides';

  @override
  String get removedFromQuickTileFavorites => 'Retiré des favoris de tuiles.';

  @override
  String get pinnedToQuickTileFavorites => 'Épinglé aux favoris de tuiles.';

  @override
  String get duplicateAndEdit => 'Dupliquer et modifier';

  @override
  String get duplicateAndEditSubtitle =>
      'Créer une copie et la modifier tout de suite';

  @override
  String get done => 'Terminé';

  @override
  String get run => 'Lancer';

  @override
  String get untitledRemote => 'Télécommande sans titre';

  @override
  String get createRemoteTitle => 'Créer une télécommande';

  @override
  String get editRemoteTitle => 'Modifier la télécommande';

  @override
  String get removeButtonTitle => 'Retirer le bouton ?';

  @override
  String get imageButtonRemovedMessage => 'Ce bouton image sera retiré.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" sera retiré.';
  }

  @override
  String get remove => 'Retirer';

  @override
  String importedButtonCount(int count) {
    return '$count bouton(s) importé(s).';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return '$count bouton(s) importé(s) depuis les télécommandes existantes.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Changer le libellé, le signal et les réglages avancés';

  @override
  String get createButtonCopySubtitle => 'Créer une copie de ce bouton';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Créer une copie et la modifier tout de suite';

  @override
  String get undoAvailableInNextSnackbar =>
      'Vous pourrez annuler via la prochaine snackbar';

  @override
  String get buttonRemoved => 'Bouton retiré.';

  @override
  String get remoteNameCannotBeEmpty =>
      'Le nom de la télécommande ne peut pas être vide.';

  @override
  String get saveRemote => 'Enregistrer la télécommande';

  @override
  String get remoteName => 'Nom de la télécommande';

  @override
  String get remoteNameHint => 'ex. TV, Clim, Ruban LED';

  @override
  String get remoteNameHelper =>
      'Ce nom apparaît dans votre liste de télécommandes.';

  @override
  String get layoutStyle => 'Style de disposition';

  @override
  String get layoutWideDescription =>
      'Large : boutons sur 2 colonnes avec plus de détails (recommandé).';

  @override
  String get layoutCompactDescription =>
      'Compact : grille 4× classique (icônes/texte seuls).';

  @override
  String get importFromRemotes => 'Importer depuis télés';

  @override
  String get importFromDatabase => 'Importer depuis la BD';

  @override
  String get addButton => 'Ajouter un bouton';

  @override
  String get noButtonsYet => 'Aucun bouton';

  @override
  String get createRemoteEmptyStateDescription =>
      'Ajoutez votre premier bouton, puis faites un appui long dessus pour voir modifier/retirer.';

  @override
  String get createButtonTitle => 'Créer un bouton';

  @override
  String get editButtonTitle => 'Modifier le bouton';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Échec du chargement des protocoles : $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Échec du chargement des clés BD : $error';
  }

  @override
  String get presetPower => 'Power';

  @override
  String get presetVolume => 'Volume';

  @override
  String get presetChannel => 'Canal';

  @override
  String get presetNavigation => 'Navigation';

  @override
  String get all => 'Tout';

  @override
  String get completeRequiredFieldsToSave =>
      'Remplissez les champs requis pour enregistrer';

  @override
  String get buttonLabelStepTitle => 'Libellé du bouton';

  @override
  String get buttonLabelStepSubtitle =>
      'Choisissez une image, une icône ou saisissez un texte.';

  @override
  String get buttonColorStepTitle => 'Couleur du bouton';

  @override
  String get buttonColorStepSubtitle =>
      'Choisissez une couleur de fond pour ce bouton.';

  @override
  String get selectColor => 'Choisir la couleur :';

  @override
  String get noImageSelected => 'Aucune image choisie';

  @override
  String get gallery => 'Galerie';

  @override
  String get builtIn => 'Intégré';

  @override
  String get removeImage => 'Retirer l\'image';

  @override
  String get requiredSelectImageOrSwitch =>
      'Obligatoire : choisissez une image, une icône, ou passez en Texte.';

  @override
  String get iconSelected => 'Icône choisie';

  @override
  String get noIconSelected => 'Aucune icône choisie';

  @override
  String get chooseIcon => 'Choisir une icône';

  @override
  String get removeIcon => 'Retirer l\'icône';

  @override
  String get requiredSelectIconOrSwitch =>
      'Obligatoire : choisissez une icône ou passez en Image/Texte.';

  @override
  String get buttonText => 'Texte du bouton';

  @override
  String get buttonTextHint => 'ex. Power, Volume +, HDMI 1';

  @override
  String get buttonTextHelper => 'Ce texte apparaîtra sur le bouton.';

  @override
  String get requiredEnterButtonLabel =>
      'Obligatoire : saisissez un libellé de bouton.';

  @override
  String get defaultColorName => 'Par défaut';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Nouvelle télécommande créée avec un bouton du dernier hit.';

  @override
  String get selectRemote => 'Choisir une télécommande';

  @override
  String remoteNumber(Object id) {
    return 'Télécommande #$id';
  }

  @override
  String get newRemoteCreated => 'Nouvelle télécommande créée.';

  @override
  String get failedToCreateRemote => 'Échec de la création de la télécommande.';

  @override
  String get newRemoteEllipsis => 'Nouvelle télécommande…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Ajouté à $name.';
  }

  @override
  String get failedToAddToRemote => 'Échec de l\'ajout à la télécommande.';

  @override
  String get newRemoteDefaultName => 'Nouvelle télécommande';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Sauté à l\'offset $offset. En pause - appuyez sur Reprendre pour continuer.';
  }

  @override
  String get sent => 'Envoyé.';

  @override
  String failedToSend(Object error) {
    return 'Échec de l\'envoi : $error';
  }

  @override
  String get copiedProtocolCode => 'Copié (protocole:code).';

  @override
  String get savedToResults => 'Enregistré dans Résultats.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Code invalide pour le protocole : $error';
  }

  @override
  String get copiedCurrentCandidate => 'Candidat courant copié.';

  @override
  String get jumpToOffset => 'Aller à l\'offset';

  @override
  String get jumpToBruteCursor => 'Aller au curseur brute';

  @override
  String get jump => 'Aller';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Sauté au curseur 0x$cursor. En pause - appuyez sur Reprendre pour continuer.';
  }

  @override
  String get irSignalTester => 'Testeur de signal IR';

  @override
  String get stop => 'Arrêter';

  @override
  String get selectButton => 'Choisir un bouton';

  @override
  String get buttonNotFoundInRemotes =>
      'Bouton introuvable dans les télécommandes.';

  @override
  String sentNamed(Object name) {
    return '\"$name\" envoyé.';
  }

  @override
  String sendFailed(Object error) {
    return 'Échec de l\'envoi : $error';
  }

  @override
  String get noFavoritesYet => 'Aucun favori';

  @override
  String get deviceControlsEmptyHint =>
      'Faites un appui long sur un bouton puis choisissez “Ajouter aux contrôles appareil”.';

  @override
  String get sendTest => 'Envoyer test';

  @override
  String get testSendCompleted => 'Envoi test terminé.';

  @override
  String testSendFailed(Object error) {
    return 'Échec de l\'envoi test : $error';
  }

  @override
  String removedNamed(Object name) {
    return '\"$name\" retiré.';
  }

  @override
  String get brand => 'Marque';

  @override
  String get model => 'Modèle';

  @override
  String get selectBrand => 'Choisir la marque';

  @override
  String get searchBrand => 'Rechercher une marque…';

  @override
  String get selectModel => 'Choisir le modèle';

  @override
  String get searchModel => 'Rechercher un modèle…';

  @override
  String get unnamedKey => 'Touche sans nom';

  @override
  String get unknown => 'Inconnu';

  @override
  String get emDash => '-';

  @override
  String get searchCommands => 'Rechercher des commandes';

  @override
  String get noMatchingCommands => 'Aucune commande correspondante';

  @override
  String get quickTileFavoritesTitle => 'Favoris de tuiles rapides';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Changer le mapping de la tuile $tileLabel';
  }

  @override
  String get pickDifferentButton => 'Choisir un autre bouton';

  @override
  String get browseAllRemotesEllipsis => 'Parcourir toutes les télécommandes…';

  @override
  String get invalidMacroFileFormat => 'Format de fichier macro invalide.';

  @override
  String get failedToParseMacroFile => 'Échec de l\'analyse du fichier macro.';

  @override
  String get deviceCodeLabel => 'Code appareil';

  @override
  String get commandLabel => 'Commande';

  @override
  String get editButtonCodeTitle => 'Modifier le code du bouton';

  @override
  String get thisRemoteHasNoButtons => 'Cette télécommande n\'a aucun bouton.';

  @override
  String get selectCommand => 'Choisir la commande';

  @override
  String get databaseModeAutofillHint =>
      'Le mode base auto-remplit l\'étape 2 (marque + modèle + protocole). Après import d\'une touche, vous pouvez tout affiner en Manuel.';

  @override
  String get test => 'Tester';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Tous les boutons choisis étaient des doublons.';

  @override
  String get noButtonsImported => 'Aucun bouton importé.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return '$addedCount bouton(s) importé(s). $skippedCount doublon(s) ignoré(s).';
  }

  @override
  String get importAllMatchingTitle =>
      'Importer tous les boutons correspondants ?';

  @override
  String get noMatchingKeysFound => 'Aucune touche correspondante trouvée.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Cela importera jusqu\'à $count touches correspondantes selon la sélection actuelle de la base.';
  }

  @override
  String get importAll => 'Tout importer';

  @override
  String get importingButtons => 'Import des boutons…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Tous les boutons correspondants étaient des doublons.';

  @override
  String get quickPresets => 'Préréglages rapides';

  @override
  String get selectDeviceFirst => 'Choisissez d\'abord l\'appareil';

  @override
  String get searchByLabelOrHex => 'Rechercher par libellé ou hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Optionnel : affiner les touches du préréglage $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Choisissez d\'abord la marque, le modèle et le protocole.';

  @override
  String get importFromDatabaseTitle => 'Importer depuis la base';

  @override
  String get importFromDatabaseSubtitle =>
      'Choisissez un appareil, chargez les touches correspondantes, puis importez les boutons choisis.';

  @override
  String get deviceAndFilters => 'Appareil et filtres';

  @override
  String loadedCount(int count) {
    return '$count chargé(s)';
  }

  @override
  String get hideFilters => 'Masquer les filtres';

  @override
  String get showFilters => 'Afficher les filtres';

  @override
  String get noProtocolFoundForBrandModel =>
      'Aucun protocole trouvé pour cette marque et ce modèle.';

  @override
  String get protocolAutoDetected => 'Protocole';

  @override
  String get protocolAutoDetectedHelper =>
      'Détecté automatiquement depuis la base. Vous pouvez le changer avant import.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Choisissez une marque, un modèle et un protocole pour charger les touches.';

  @override
  String get noKeysFound => 'Aucune touche trouvée.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Aucune touche trouvée pour “$query”.';
  }

  @override
  String get skipDuplicates => 'Ignorer doublons';

  @override
  String get skipDuplicatesSubtitle =>
      'N\'importe pas les boutons qui existent déjà dans cette télécommande.';

  @override
  String get importSelected => 'Importer la sélection';

  @override
  String get noMacrosToExport => 'Aucune macro à exporter.';

  @override
  String get macrosExportedToDownloads =>
      'Macros exportées dans Téléchargements.';

  @override
  String get failedToExportMacros => 'Échec de l\'export des macros.';

  @override
  String get failedToReadFile => 'Échec de la lecture du fichier.';

  @override
  String get importFromExistingRemotesTitle =>
      'Importer depuis des télés existantes';

  @override
  String selectedCount(int count) {
    return '$count sélectionné(s)';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Aucune autre télécommande avec boutons trouvée.';

  @override
  String get sourceRemote => 'Télécommande source';

  @override
  String get searchButtons => 'Rechercher des boutons';

  @override
  String get searchButtonsHint => 'Power, Volume, Muet...';

  @override
  String get selectVisible => 'Sélectionner visibles';

  @override
  String get clearVisible => 'Effacer visibles';

  @override
  String protocolNamed(Object name) {
    return 'Protocole : $name';
  }

  @override
  String get rawSignal => 'Brut';

  @override
  String get legacyCode => 'Code legacy';

  @override
  String importCount(int count) {
    return 'Importer $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Autorisation de stockage refusée (nécessaire sur certains anciens appareils Android).';

  @override
  String get backupExportedToDownloads =>
      'Sauvegarde exportée dans Téléchargements.';

  @override
  String failedToExport(Object error) {
    return 'Échec de l\'export : $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return '$count télécommande(s) importée(s) depuis une sauvegarde JSON legacy. Les macros n\'ont pas été modifiées.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Import échoué : le champ \"remotes\" doit être une liste JSON quand présent.';

  @override
  String get importFailedMacrosMustBeList =>
      'Import échoué : le champ \"macros\" doit être une liste JSON quand présent.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Import échoué : format de sauvegarde invalide (liste legacy ou map avec remotes/macros attendue).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return '$remoteCount télécommande(s) importée(s) depuis la sauvegarde. Les macros n\'ont pas été modifiées.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return '$remoteCount télécommande(s) et $macroCount macro(s) importée(s) depuis la sauvegarde.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Import échoué : aucun bouton valide trouvé dans le fichier .ir.';

  @override
  String get importedOneRemoteFromFlipper =>
      '1 télécommande importée depuis Flipper .ir. Les macros n\'ont pas été modifiées.';

  @override
  String get importFailedInvalidIrplus =>
      'Import échoué : fichier irplus invalide (aucun bouton valide trouvé).';

  @override
  String get importedOneRemoteFromIrplus =>
      '1 télécommande importée depuis irplus. Les macros n\'ont pas été modifiées.';

  @override
  String get importFailedInvalidLirc =>
      'Import échoué : fichier LIRC invalide (aucun code ou code brut valide trouvé).';

  @override
  String get importedOneRemoteFromLirc =>
      '1 télécommande importée depuis une config LIRC. Les macros n\'ont pas été modifiées.';

  @override
  String get unsupportedFileTypeSelected =>
      'Type de fichier non pris en charge.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Import échoué : fichier invalide ou illisible.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Import groupé terminé : aucun fichier pris en charge dans le dossier.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Import groupé terminé : aucune télécommande importée. $skippedCount fichier(s) ignoré(s).';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Import groupé terminé : $importedCount télécommande(s) importée(s) depuis $supportedCount fichier(s) pris en charge. $skippedCount fichier(s) ignoré(s).';
  }

  @override
  String get storagePermissionDenied => 'Autorisation de stockage refusée.';

  @override
  String get bulkImportFailedReadFolder =>
      'Import groupé échoué : impossible de lire le contenu du dossier.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Import groupé terminé : aucun fichier pris en charge ($sourceLabel).';
  }

  @override
  String get clearAction => 'Effacer';

  @override
  String get saveAction => 'Enregistrer';

  @override
  String buttonsTitleCount(int count) {
    return 'Boutons ($count)';
  }

  @override
  String get invalidStepEncountered => 'Étape invalide détectée';

  @override
  String failedToSendNamed(Object name) {
    return 'Échec de l’envoi : $name';
  }

  @override
  String get buttonNotFound => 'Bouton introuvable';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Bouton introuvable : $name';
  }

  @override
  String get unknownButton => 'Bouton inconnu';

  @override
  String durationSecondsShort(int seconds) {
    return '${seconds}s';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '${minutes}min ${seconds}s';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '${hours}h ${minutes}min';
  }

  @override
  String get orientationFlippedTooltip =>
      'Orientation : inversée (appuyer pour normal)';

  @override
  String get orientationNormalTooltip =>
      'Orientation : normale (appuyer pour inverser)';

  @override
  String get noSteps => 'Aucune étape';

  @override
  String stepProgress(int current, int total) {
    return 'Étape $current / $total';
  }

  @override
  String get completed => 'Terminé';

  @override
  String get paused => 'En pause';

  @override
  String get running => 'En cours';

  @override
  String get ready => 'Prêt';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total étapes';
  }

  @override
  String get waiting => 'Attente';

  @override
  String secondsRemaining(Object seconds) {
    return '${seconds}s restantes';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Appuyez sur Continuer quand vous êtes prêt pour l’étape suivante';

  @override
  String get error => 'Erreur';

  @override
  String get macroCompleted => 'Macro terminée';

  @override
  String finishedIn(Object duration) {
    return 'Terminé en $duration';
  }

  @override
  String get sequence => 'Séquence';

  @override
  String waitMilliseconds(int ms) {
    return 'Attendre ${ms}ms';
  }

  @override
  String get runAgain => 'Relancer';

  @override
  String get startMacro => 'Démarrer la macro';

  @override
  String get continueAction => 'Continuer';

  @override
  String get unnamedRemote => 'Télécommande sans nom';

  @override
  String get enterMacroName => 'Entrez un nom de macro';

  @override
  String get addAtLeastOneStep => 'Ajoutez au moins une étape';

  @override
  String get fixInvalidSteps => 'Corrigez les étapes invalides';

  @override
  String get unknownCommand => 'Commande inconnue';

  @override
  String get unnamedCommand => 'Commande sans nom';

  @override
  String get iconCommand => 'Icône commande';

  @override
  String get selectDelay => 'Choisir un délai';

  @override
  String keepMilliseconds(int ms) {
    return 'Conserver : ${ms}ms';
  }

  @override
  String get custom => 'Personnalisé';

  @override
  String get enterCustomDelayDuration =>
      'Entrer une durée de délai personnalisée';

  @override
  String millisecondsLong(int ms) {
    return '$ms millisecondes';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds seconde$plural';
  }

  @override
  String get customDelay => 'Délai personnalisé';

  @override
  String get delayMillisecondsLabel => 'Délai (millisecondes)';

  @override
  String get delayMillisecondsHint => 'ex. 3000';

  @override
  String get recommendedDelayRange =>
      'Recommandé : 250 à 5000 ms pour la plupart des appareils';

  @override
  String get enterValidPositiveNumber =>
      'Veuillez entrer un nombre positif valide';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Télécommande';

  @override
  String get macroName => 'Nom de la macro';

  @override
  String get macroNameHint => 'ex. mode avancé i-cybie';

  @override
  String stepsTitleCount(int count) {
    return 'Étapes ($count)';
  }

  @override
  String get noStepsYet => 'Aucune étape pour le moment';

  @override
  String get addCommandsAndDelaysHint =>
      'Ajoutez des commandes et des délais ci-dessous pour construire votre séquence';

  @override
  String get addStep => 'Ajouter une étape';

  @override
  String get reorderStepsHint =>
      'Astuce : faites glisser la poignée pour réorganiser les étapes. Appuyez sur une étape pour la modifier.';

  @override
  String reorderStep(int index) {
    return 'Réorganiser l’étape $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Maintenez et faites glisser pour changer l’ordre des étapes';

  @override
  String deleteStep(int index) {
    return 'Supprimer l’étape $index';
  }

  @override
  String get invalidStepTapToFix => 'Étape invalide - appuyez pour corriger';

  @override
  String get sendIrCommand => 'Envoyer une commande IR';

  @override
  String get waitForUserConfirmation =>
      'Attendre la confirmation de l’utilisateur';

  @override
  String get notImplemented => 'Non implémenté';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Large';

  @override
  String get iconButton => 'Bouton icône';

  @override
  String get imageButton => 'Bouton image';

  @override
  String get noSignalInfo => 'Aucune info de signal';

  @override
  String get proceed => 'Continuer';

  @override
  String get discard => 'Ignorer';

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
  String get idle => 'Inactif';

  @override
  String get start => 'Démarrer';

  @override
  String get resume => 'Reprendre';

  @override
  String get pause => 'Pause';

  @override
  String get stopped => 'Arrêté';

  @override
  String get copy => 'Copier';

  @override
  String get send => 'Envoyer';

  @override
  String get step => 'Étape';

  @override
  String get addToRemote => 'Ajouter à la télécommande';

  @override
  String get noDescriptionAvailable => 'Aucune description disponible.';

  @override
  String get notAvailableSymbol => '-';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Le fournisseur Kaseikyo doit contenir exactement 4 chiffres hexadécimaux.';

  @override
  String get irFinderDatabaseNotReady =>
      'La base de données n’est pas encore prête.';

  @override
  String get irFinderSelectBrandFirst =>
      'Sélectionnez d’abord une marque dans la configuration.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Le brute-force n’est pas encore disponible pour ce protocole.';

  @override
  String get irFinderInvalidPrefix => 'Préfixe invalide.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Marque : $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Modèle : $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Touche : $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Télécommande #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Entrez un index de base 0 dans les résultats de base de données filtrés et ordonnés.';

  @override
  String get irFinderJumpCursorHelper =>
      'Entrez un curseur hexadécimal de base 0 dans l’espace de brute-force.';

  @override
  String get irFinderSetupTab => 'Config.';

  @override
  String get irFinderTestTab => 'Test';

  @override
  String get irFinderResultsTab => 'Résultats';

  @override
  String get irFinderContinueToTest => 'Continuer vers le test';

  @override
  String get irFinderKaseikyoVendorTitle => 'Fournisseur Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'Fournisseur personnalisé (4 hex)';

  @override
  String get irFinderBrowseDbCandidates => 'Parcourir les candidats BD…';

  @override
  String get irFinderEditSetup => 'Modifier la config.';

  @override
  String get irFinderNoSavedHits =>
      'Aucun résultat enregistré pour le moment. Dans l’onglet Test, appuyez sur « Enregistrer le résultat » quand l’appareil répond.';

  @override
  String get irFinderBackToTest => 'Retour au test';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Grand espace de recherche';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Cet espace de brute-force est très grand ($human possibilités). IR Finder respectera toujours votre limite maximale d’essais et le délai, mais évitez de spammer les appareils IR.\n\nRecommandation : utilisez d’abord le mode Base de données et/ou saisissez des octets de préfixe connus pour réduire l’espace.';
  }

  @override
  String get irFinderDatabaseSession => 'Session base de données';

  @override
  String get irFinderBruteforceSession => 'Session brute-force';

  @override
  String get irFinderResumeLastSession => 'Reprendre la dernière session';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Marque : $brand · Modèle : $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Préfixe : $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Progression : $progress · Démarré : $when';
  }

  @override
  String get irFinderApplyResume => 'Appliquer et reprendre';

  @override
  String get irFinderBruteforceMode => 'Brute-force';

  @override
  String get irFinderDatabaseAssistedMode => 'Assisté par base de données';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Protocole : $name';
  }

  @override
  String get irFinderProtocolLabel => 'Protocole IR';

  @override
  String get irFinderProtocolHelper =>
      'Contrôle l’encodage et donc l’espace de recherche.';

  @override
  String get irFinderKnownPrefixLabel =>
      'Préfixe connu (octets hex, optionnel)';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Charge utile : $digits chiffre(s) hexadécimal(aux)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Charge utile : $digits chiffre(s) hexadécimal(aux) · Exemple : $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Charge utile : $digits chiffre(s) hexadécimal(aux) · Préfixe max : $bytes octet(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Charge utile : $digits chiffre(s) hexadécimal(aux) · Exemple : $example · Préfixe max : $bytes octet(s)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Exemple : $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Saisissez des premiers octets connus pour réduire l’espace de recherche.';

  @override
  String get irFinderDatabaseMode => 'Base de données';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Préfixe normalisé : $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Préfixe normalisé';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Le brute-force n’est pas encore configuré pour ce protocole.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Tout ($value)';
  }

  @override
  String get irFinderTestControls => 'Contrôles de test';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Longueur utile : $digits chiffre(s) hexadécimal(aux).';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Espace de recherche : $value possibilités (après contraintes de préfixe).';
  }

  @override
  String get irFinderCooldownMs => 'Délai (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Nombre max d’essais (par exécution)';

  @override
  String get irFinderTestAllCombinations => 'Tester toutes les combinaisons';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'S’exécute jusqu’à épuisement de l’espace de recherche. Limite effective : $value';
  }

  @override
  String get irFinderAttempts => 'Essais';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Plage du curseur : 1–$max (saisissez n’importe quel nombre pour des valeurs plus grandes)';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Max\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Limite effective pour cette exécution : $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Astuce : utilisez d’abord le mode Base de données ; le brute-force est plus efficace avec un préfixe connu (par exemple les 1 à 4 premiers octets).';

  @override
  String get irFinderDatabaseInitFailed =>
      'L’initialisation de la base de données a échoué.';

  @override
  String get irFinderPreparingDatabase =>
      'Préparation de la base locale de codes IR…';

  @override
  String get irFinderDatabaseAssistedSearch =>
      'Recherche assistée par base de données';

  @override
  String get irFinderBrand => 'Marque';

  @override
  String get irFinderSelectBrand => 'Sélectionner une marque';

  @override
  String get irFinderModelOptional => 'Modèle (optionnel)';

  @override
  String get irFinderSelectBrandFirstShort => 'Sélectionnez d’abord une marque';

  @override
  String get irFinderSelectModelRecommended =>
      'Sélectionnez un modèle (recommandé)';

  @override
  String get irFinderOnlySelectedProtocol =>
      'Seulement le protocole sélectionné';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Filtre les touches selon le protocole sélectionné. Désactivez cette option pour parcourir tous les protocoles.';

  @override
  String get irFinderQuickWinsFirst => 'Succès rapides d’abord';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Priorise les touches de type POWER, MUTE, VOL et CH avant les touches plus profondes.';

  @override
  String get irFinderMaxKeysPerRun =>
      'Nombre max de touches à tester (par exécution)';

  @override
  String get irFinderTesting => 'Test en cours…';

  @override
  String get irFinderCooldown => 'Délai';

  @override
  String get irFinderEta => 'Temps restant';

  @override
  String get irFinderMode => 'Mode';

  @override
  String get irFinderRetryLast => 'Réessayer le dernier';

  @override
  String get irFinderTrigger => 'Déclencher';

  @override
  String get irFinderJump => 'Aller…';

  @override
  String get irFinderSaveHit => 'Enregistrer le résultat';

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
    return 'Dernier code essayé : $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Commencez un test pour voir le dernier code essayé.';

  @override
  String irFinderFromDb(Object value) {
    return 'Depuis la BD : $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'Depuis le brute-force (généré par l’encodeur de protocole).';

  @override
  String irFinderSendError(Object error) {
    return 'Erreur d’envoi : $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Source : $value';
  }

  @override
  String get irFinderResultsNote =>
      'Les résultats prennent en charge Test et Copier immédiatement. L’intégration directe d’ajout à une télécommande peut être étendue davantage dans le flux d’édition.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Parcourir les candidats BD';

  @override
  String get irFinderFilterByLabelOrHex => 'Filtrer par libellé ou hex…';

  @override
  String get irFinderJumpHere => 'Aller ici';

  @override
  String get irFinderSelectModel => 'Sélectionner un modèle';

  @override
  String get irFinderSearchBrands => 'Rechercher des marques…';

  @override
  String get irFinderSearchModels => 'Rechercher des modèles…';

  @override
  String get iconPickerTitle => 'Sélectionner une icône';

  @override
  String get iconPickerSearchHint => 'Rechercher des icônes...';

  @override
  String get iconPickerNoIconsFound => 'Aucune icône trouvée';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count icônes disponibles';
  }

  @override
  String get iconPickerCategoryAll => 'Toutes';

  @override
  String get iconPickerCategoryMedia => 'Média';

  @override
  String get iconPickerCategoryVolume => 'Volume';

  @override
  String get iconPickerCategoryNavigation => 'Navigation';

  @override
  String get iconPickerCategoryPower => 'Alimentation';

  @override
  String get iconPickerCategoryNumbers => 'Nombres';

  @override
  String get iconPickerCategorySettings => 'Réglages';

  @override
  String get iconPickerCategoryDisplay => 'Affichage';

  @override
  String get iconPickerCategoryInput => 'Entrée';

  @override
  String get iconPickerCategoryFavorite => 'Favori';

  @override
  String get universalPowerTitle => 'Alimentation universelle';

  @override
  String get universalPowerRunTab => 'Exécution';

  @override
  String get universalPowerUseResponsibly => 'Utilisez avec précaution';

  @override
  String get universalPowerConsentBody =>
      'L’alimentation universelle fait défiler des codes IR d’alimentation. Utilisez-la uniquement sur des appareils que vous possédez ou contrôlez. Arrêtez dès que l’appareil répond.';

  @override
  String get universalPowerConsentCheckbox =>
      'Je possède ou contrôle l’appareil';

  @override
  String get universalPowerSetupBody =>
      'Fait défiler les codes d’alimentation pour la marque sélectionnée. Arrêtez dès que l’appareil répond.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Dernier envoi : $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Aucun code d’alimentation trouvé. Essayez d’élargir la recherche.';

  @override
  String get universalPowerUnableToStart => 'Impossible de démarrer.';

  @override
  String get universalPowerAllBrands => 'Toutes les marques (aucun filtre)';

  @override
  String get universalPowerClearBrandFilter => 'Effacer le filtre de marque';

  @override
  String get universalPowerBroadenSearch =>
      'Élargir la recherche si nécessaire';

  @override
  String get universalPowerBroadenSearchHint =>
      'Si aucun libellé d’alimentation n’est trouvé, inclure d’autres touches.';

  @override
  String get universalPowerAdditionalPatternsDepth =>
      'Profondeur des motifs supplémentaires';

  @override
  String get universalPowerDepth1 => 'Priorité uniquement : POWER/OFF';

  @override
  String get universalPowerDepth2 => 'Inclure les alias POWER';

  @override
  String get universalPowerDepth3 =>
      'Inclure les libellés d’alimentation secondaires';

  @override
  String get universalPowerDepth4 =>
      'Inclure tous les libellés (priorité la plus basse)';

  @override
  String get universalPowerLoopUntilStopped => 'Boucler jusqu’à l’arrêt';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Continue à parcourir la file jusqu’à ce que vous arrêtiez.';

  @override
  String get universalPowerDelayBetweenCodes => 'Délai entre les codes';

  @override
  String get universalPowerStart => 'Démarrer l’alimentation universelle';

  @override
  String get universalPowerRunStatus => 'État d’exécution';

  @override
  String universalPowerProgress(Object value) {
    return 'Progression : $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Mis en pause parce que l’application a été mise en arrière-plan.';

  @override
  String get universalPowerSendOneCode => 'Envoyer un code';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Arrêtez dès que l’appareil répond.';

  @override
  String get iconNamePlay => 'Play';

  @override
  String get iconNamePause => 'Pause';

  @override
  String get iconNameStop => 'Stop';

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
  String get iconNameVolumeUp => 'Volume Up';

  @override
  String get iconNameVolumeDown => 'Volume Down';

  @override
  String get iconNameVolumeOff => 'Volume Off';

  @override
  String get iconNameMute => 'Mute';

  @override
  String get iconNameSpeaker => 'Speaker';

  @override
  String get iconNameSurroundSound => 'Surround Sound';

  @override
  String get iconNameEqualizer => 'Equalizer';

  @override
  String get iconNameAudio => 'Audio';

  @override
  String get iconNameMicrophone => 'Microphone';

  @override
  String get iconNameMicOff => 'Mic Off';

  @override
  String get iconNameUp => 'Up';

  @override
  String get iconNameDown => 'Down';

  @override
  String get iconNameLeft => 'Left';

  @override
  String get iconNameRight => 'Right';

  @override
  String get iconNameArrowUp => 'Arrow Up';

  @override
  String get iconNameArrowDown => 'Arrow Down';

  @override
  String get iconNameArrowLeft => 'Arrow Left';

  @override
  String get iconNameArrowRight => 'Arrow Right';

  @override
  String get iconNameNavigation => 'Navigation';

  @override
  String get iconNameChevronLeft => 'Chevron Left';

  @override
  String get iconNameChevronRight => 'Chevron Right';

  @override
  String get iconNameExpandLess => 'Expand Less';

  @override
  String get iconNameExpandMore => 'Expand More';

  @override
  String get iconNameCollapse => 'Collapse';

  @override
  String get iconNameExpand => 'Expand';

  @override
  String get iconNameCircleUp => 'Circle Up';

  @override
  String get iconNameCircleDown => 'Circle Down';

  @override
  String get iconNameCircleLeft => 'Circle Left';

  @override
  String get iconNameCircleRight => 'Circle Right';

  @override
  String get iconNameOkSelect => 'OK/Select';

  @override
  String get iconNameConfirm => 'Confirm';

  @override
  String get iconNameCancel => 'Cancel';

  @override
  String get iconNameClose => 'Close';

  @override
  String get iconNameHome => 'Home';

  @override
  String get iconNameReturn => 'Return';

  @override
  String get iconNameExit => 'Exit';

  @override
  String get iconNameUndo => 'Undo';

  @override
  String get iconNameRedo => 'Redo';

  @override
  String get iconNamePower => 'Power';

  @override
  String get iconNamePowerAlt => 'Power Alt';

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
  String get iconNameAddCircle => 'Add Circle';

  @override
  String get iconNameRemoveCircle => 'Remove Circle';

  @override
  String get iconNameSettings => 'Settings';

  @override
  String get iconNameMenu => 'Menu';

  @override
  String get iconNameMoreVertical => 'More Vertical';

  @override
  String get iconNameMoreHorizontal => 'More Horizontal';

  @override
  String get iconNameTune => 'Tune';

  @override
  String get iconNameRemoteSettings => 'Remote Settings';

  @override
  String get iconNameInfo => 'Info';

  @override
  String get iconNameInfoOutline => 'Info Outline';

  @override
  String get iconNameHelp => 'Help';

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
  String get iconNameBrightnessMedium => 'Brightness Medium';

  @override
  String get iconNameBrightnessLow => 'Brightness Low';

  @override
  String get iconNameAutoBrightness => 'Auto Brightness';

  @override
  String get iconNameLightMode => 'Light Mode';

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
  String get iconNameInput => 'Input';

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
  String get iconNameFavorite => 'Favorite';

  @override
  String get iconNameFavoriteOutline => 'Favorite Outline';

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
  String get iconNameDone => 'Done';

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
  String get iconNameLight => 'Light';

  @override
  String get iconNameLightOutline => 'Light Outline';

  @override
  String get iconNameWarmLight => 'Warm Light';

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
  String get iconNameSearch => 'Search';

  @override
  String get iconNameRefresh => 'Refresh';

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
  String get iconNameDelete => 'Delete';

  @override
  String get iconNameEdit => 'Edit';

  @override
  String get iconNameSave => 'Save';

  @override
  String get iconNameShare => 'Share';

  @override
  String get iconNamePrint => 'Print';

  @override
  String get iconNameLanguage => 'Language';

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
  String get iconNameVideoSettings => 'Video Settings';

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
  String get unknownLabel => 'Inconnu';

  @override
  String get selectedFilesLabel => 'fichier(s) sélectionné(s)';

  @override
  String get folderNotFoundOrInaccessible =>
      'Dossier introuvable ou inaccessible.';

  @override
  String get importedRemoteDefaultName => 'TélécommandeImportée';

  @override
  String get demoRemoteName => 'Télécommande de démonstration';

  @override
  String get protocolFieldsInvalid =>
      'Remplissez les champs requis du protocole et vérifiez que la fréquence est comprise entre 15 kHz et 60 kHz si elle est définie.';

  @override
  String get unknownProtocolSelected => 'Protocole sélectionné inconnu.';

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
      'La capture d’apprentissage a échoué.';

  @override
  String get learningModeReplaySent => 'Signal appris rejoué.';

  @override
  String get learningModeReplayFailed =>
      'Le signal appris n\'a pas pu être rejoué.';

  @override
  String get learningModeNoRemotesAvailable =>
      'Il n\'y a pas encore de télécommandes enregistrées.';

  @override
  String get learningModeChooseRemoteTitle => 'Choisissez une télécommande';

  @override
  String get learningModeNewRemoteTitle => 'Créer une nouvelle télécommande';

  @override
  String get learningModeSaveSuccess => 'Bouton appris enregistré.';

  @override
  String get learningModeSaveFailed =>
      'Le bouton appris n\'a pas pu être enregistré.';

  @override
  String get remoteSetupIntro =>
      'Choisissez d\'abord un nom et une disposition. Vous pourrez ajouter des boutons ensuite.';

  @override
  String get startWithDefault => 'Commencer avec les valeurs par défaut';

  @override
  String get browseGithubStore => 'Parcourir le store GitHub';

  @override
  String get addFirstButton => 'Ajouter le premier bouton';

  @override
  String get moreWaysToStart => 'Plus de façons de commencer';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Abandonner cette nouvelle configuration de télécommande et quitter cet écran ?';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Abandonner les modifications de la télécommande et quitter cet écran ?';

  @override
  String get firstButtonAdded => 'Premier bouton ajouté.';

  @override
  String get iconColorTitle => 'Couleur de l’icône';

  @override
  String get iconColorHelper =>
      'Choisissez une couleur de symbole qui reste visible sur le fond du bouton.';

  @override
  String get colorRed => 'Rouge';

  @override
  String get colorPink => 'Rose';

  @override
  String get colorPurple => 'Violet';

  @override
  String get colorDeepPurple => 'Violet foncé';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorBlue => 'Bleu';

  @override
  String get colorLightBlue => 'Bleu clair';

  @override
  String get colorCyan => 'Cyan';

  @override
  String get colorTeal => 'Bleu canard';

  @override
  String get colorGreen => 'Vert';

  @override
  String get colorLightGreen => 'Vert clair';

  @override
  String get colorLime => 'Citron vert';

  @override
  String get colorYellow => 'Jaune';

  @override
  String get colorAmber => 'Ambre';

  @override
  String get colorOrange => 'Orange';

  @override
  String get colorDeepOrange => 'Orange foncé';

  @override
  String get colorBrown => 'Marron';

  @override
  String get colorGrey => 'Gris';

  @override
  String get colorBlueGrey => 'Gris bleu';

  @override
  String get colorBlack => 'Noir';

  @override
  String get colorWhite => 'Blanc';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Couleur du bouton $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Couleur du bouton $colorName, sélectionnée';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Couleur de l’icône $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Couleur de l’icône $colorName, sélectionnée';
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
