// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Wird geladen…';

  @override
  String get unknownError => 'Unbekannter Fehler';

  @override
  String get failedToStart => 'Start fehlgeschlagen';

  @override
  String get retry => 'Erneut';

  @override
  String get quickTilePower => 'Ein/Aus';

  @override
  String get quickTileMute => 'Stumm';

  @override
  String get quickTileVolumeUp => 'Laut +';

  @override
  String get quickTileVolumeDown => 'Laut -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Dieses Telefon hat keinen integrierten IR-Sender. Ein USB-IR-Dongle wurde erkannt, aber die Berechtigung fehlt noch.\n\nBestätige die USB-Abfrage, um IR senden zu können.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'Dieses Telefon hat keinen integrierten IR-Sender. Ein USB-IR-Dongle wurde erkannt, aber die USB-Berechtigung wurde verweigert.\n\nFordere die Berechtigung erneut an und bestätige die Abfrage, um IR senden zu können.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'Dieses Telefon hat keinen integrierten IR-Sender. Ein USB-IR-Dongle ist autorisiert, aber noch nicht initialisiert.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Dieses Telefon hat keinen integrierten IR-Sender. Ein USB-IR-Dongle wurde erkannt und autorisiert, konnte aber nicht initialisiert werden.\n\nStecke den Dongle neu an und versuche es erneut.';

  @override
  String get homeUsbReadyMessage =>
      'Dieses Telefon hat keinen integrierten IR-Sender.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Dieses Telefon hat keinen integrierten IR-Sender, und aktuell ist kein unterstützter USB-IR-Dongle verbunden.\n\nDu kannst trotzdem Fernbedienungen erstellen, importieren und verwalten, aber zum Senden von IR-Signalen brauchst du eine der Optionen unten.';

  @override
  String get homeUsbOptionPlugIn =>
      'Unterstützten USB-IR-Dongle anstecken und Berechtigung bestätigen.';

  @override
  String get homeUsbOptionReady => 'Einsatzbereit.';

  @override
  String get homeUsbOptionPermissionRequired =>
      'Angesteckt. Berechtigung nötig.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Berechtigung verweigert. Erneut anfordern.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Autorisiert. Dongle wird initialisiert.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Autorisiert, aber Initialisierung fehlgeschlagen.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Dieses Telefon hat kein integriertes IR. Verbinde einen USB-IR-Dongle oder aktiviere Audio in den Einstellungen.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'USB-Dongle erkannt. Zum Senden von IR ist eine Berechtigung nötig.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'USB-Berechtigung wurde verweigert. Fordere sie erneut an, um IR zu senden.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'USB-Dongle autorisiert. Warte auf Initialisierung.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'USB-Dongle autorisiert, aber Initialisierung fehlgeschlagen.';

  @override
  String get homeHardwareBannerReady => 'USB ist bereit.';

  @override
  String get homeHardwareRequiredTitle => 'IR-Hardware zum Senden nötig';

  @override
  String get homeUsbDongleRecommended => 'USB-IR-Dongle empfohlen';

  @override
  String get homeAudioAdapterAlternative => 'Audio-IR-Adapter alternativ';

  @override
  String get homeAudioAdapterDescription =>
      'Einstellungen → IR-Sender → Audio 1 LED oder 2 LEDs. Benötigt einen Audio-zu-IR-Adapter.';

  @override
  String get close => 'Schließen';

  @override
  String get homeChooseTransmitter => 'Sender wählen';

  @override
  String get openSettings => 'Einstellungen öffnen';

  @override
  String get homeUsbPermissionSentApprove =>
      'USB-Berechtigungsanfrage gesendet. Bestätige die Abfrage, um USB zu aktivieren.';

  @override
  String get homeUsbDongleNotDetected =>
      'Kein unterstützter USB-IR-Dongle erkannt. Stecke ihn an und versuche es erneut.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'USB-Berechtigung konnte nicht angefordert werden.';

  @override
  String get working => 'Wird ausgeführt…';

  @override
  String get requestUsbPermission => 'USB-Berechtigung anfordern';

  @override
  String get homeHardwareTip =>
      'Tipp: Du kannst Fernbedienungen schon jetzt erstellen und sortieren. Hardware ist nur zum Senden nötig.';

  @override
  String get homeNoIrTransmitterTitle => 'Kein IR-Sender verfügbar';

  @override
  String get settingsNavLabel => 'Einstellungen';

  @override
  String get dismiss => 'Schließen';

  @override
  String get remotesNavLabel => 'Remotes';

  @override
  String get macrosNavLabel => 'Makros';

  @override
  String get signalTesterNavLabel => 'Signaltester';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get remoteNoIrEmitterTitle => 'Kein IR-Sender';

  @override
  String get remoteNoIrEmitterMessage => 'Dieses Gerät hat keinen IR-Sender';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Diese App benötigt einen IR-Sender';

  @override
  String get remoteDismiss => 'Schließen';

  @override
  String get remoteClose => 'Schließen';

  @override
  String remoteFailedToSend(Object error) {
    return 'IR senden fehlgeschlagen: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Schleife konnte nicht gestartet werden: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Schleife gestoppt Senden fehlgeschlagen: $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return '$title läuft in Schleife. Tippe oben auf Stopp zum Beenden.';
  }

  @override
  String get remoteLoopStopped => 'Schleife gestoppt.';

  @override
  String get remoteUpdatedNotFound =>
      'Fernbedienung auf dem Bildschirm aktualisiert. In der gespeicherten Liste nicht gefunden.';

  @override
  String remoteUpdatedNamed(Object name) {
    return '$name aktualisiert.';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Löschen fehlgeschlagen: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'Fernbedienung in der gespeicherten Liste nicht gefunden.';

  @override
  String remoteDeletedNamed(Object name) {
    return '$name gelöscht.';
  }

  @override
  String get buttonFallbackTitle => 'Taste';

  @override
  String get imageFallbackTitle => 'Bild';

  @override
  String get noBrowserAvailable => 'Kein Browser verfügbar';

  @override
  String failedToOpen(Object error) {
    return 'Öffnen fehlgeschlagen: $error';
  }

  @override
  String get cancel => 'Abbrechen';

  @override
  String get settingsRestoreDemoTitle =>
      'Demo-Fernbedienungen wiederherstellen';

  @override
  String get settingsRestoreDemoMessage =>
      'Dadurch werden deine aktuellen Fernbedienungen durch die integrierten Demo-Fernbedienungen ersetzt. Eine Sicherung wird empfohlen, wenn du deine aktuelle Liste behalten willst.';

  @override
  String get settingsRestoreDemoConfirm => 'Demo wiederherstellen';

  @override
  String get settingsDemoRemotesRestored =>
      'Demo-Fernbedienungen wiederhergestellt.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Alle Fernbedienungen löschen';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Dadurch werden alle Fernbedienungen von diesem Gerät entfernt. Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get settingsDeleteAllConfirm => 'Alle löschen';

  @override
  String get settingsAllRemotesDeleted => 'Alle Fernbedienungen gelöscht.';

  @override
  String get themeAuto => 'Automatisches Design';

  @override
  String get themeLight => 'Helles Design';

  @override
  String get themeDark => 'Dunkles Design';

  @override
  String get themeDescAuto => 'Folgt den Geräteeinstellungen';

  @override
  String get themeDescLight => 'Immer hell und klar';

  @override
  String get themeDescDark => 'Angenehm für die Augen';

  @override
  String get themeHintAuto =>
      'Das Design wechselt automatisch, wenn du auf dem Gerät zwischen Hell und Dunkel wechselst';

  @override
  String get themeHintLight => 'Perfekt für den Tag und helle Umgebungen';

  @override
  String get themeHintDark =>
      'Verringert Augenbelastung bei wenig Licht und spart Akku auf OLED-Bildschirmen';

  @override
  String get supportDevelopmentTitle => 'Entwicklung unterstützen';

  @override
  String get supportDevelopmentSubtitle =>
      'Hilf dabei, IR Blaster gepflegt und hardwarekompatibel zu halten';

  @override
  String get supportDevelopmentBody =>
      'Keine Werbung, kein Tracking, keine gesperrten Funktionen. Deine Unterstützung finanziert Protokollarbeit, USB-Dongle-Support und bessere Kompatibilität auf Geräten.';

  @override
  String get donate => 'Spenden';

  @override
  String get starRepo => 'Repo markieren';

  @override
  String get repositoryLinkCopied => 'Repository-Link kopiert';

  @override
  String get supportPillLocalOnly => 'Nur lokal';

  @override
  String get supportPillNoTracking => 'Kein Tracking';

  @override
  String get supportPillHardwareAware => 'Hardwarebewusst';

  @override
  String get supportPillOpenSource => 'Open Source';

  @override
  String get appearanceTitle => 'Darstellung';

  @override
  String get appearanceSubtitle => 'Passe das Aussehen an';

  @override
  String get localizationTitle => 'Lokalisierung';

  @override
  String get localizationSubtitle => 'App-Sprache und Übersetzungsverhalten';

  @override
  String localizationAutoUsing(Object language) {
    return 'Auto: verwendet $language';
  }

  @override
  String get localizationAutoDescription =>
      'Die App folgt nach Möglichkeit der Gerätesprache.';

  @override
  String get localizationManualDescription =>
      'Die App-Sprache ist manuell festgelegt.';

  @override
  String get useSystemLanguageTitle => 'Systemsprache verwenden';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Folgt deiner Gerätesprache: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Verwende statt der Gerätevorgabe die unten gewählte Sprache.';

  @override
  String get chooseAppLanguage => 'App-Sprache wählen';

  @override
  String get languagePickerDisabledHint =>
      'Deaktiviere die Systemsprache, um manuell eine Sprache zu wählen.';

  @override
  String get searchLanguages => 'Sprachen suchen';

  @override
  String get noLanguagesFound => 'Keine passenden Sprachen';

  @override
  String get localizationHint =>
      'Wenn die Systemsprache aktiviert ist, folgt die App deinem Gerätegebietsschema und fällt auf Englisch zurück, wenn keine Übersetzung verfügbar ist. Deaktiviere dies, um die App auf eine feste Sprache zu setzen.';

  @override
  String get appLanguageTitle => 'App-Sprache';

  @override
  String get appLanguageHint =>
      'Automatisch folgt deiner Gerätesprache. Wähle hier Englisch oder Französisch, um nur die App zu überschreiben.';

  @override
  String get languageAuto => 'Auto System';

  @override
  String get languageAutoDescription => 'Automatisch der Gerätesprache folgen';

  @override
  String get languageEnglish => 'Englisch';

  @override
  String get languageEnglishDescription => 'App immer auf Englisch verwenden';

  @override
  String get languageFrench => 'Französisch';

  @override
  String get languageFrenchDescription => 'App immer auf Französisch verwenden';

  @override
  String get languageAutoShort => 'Auto';

  @override
  String get languageEnglishShort => 'Englisch';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'Dynamische Farben verwenden';

  @override
  String get themeChoiceAuto => 'Auto';

  @override
  String get themeChoiceLight => 'Hell';

  @override
  String get themeChoiceDark => 'Dunkel';

  @override
  String get irTransmitterTitle => 'IR-Sender';

  @override
  String get irTransmitterSubtitle =>
      'Wähle, welche Hardware IR-Befehle sendet';

  @override
  String get interactionTitle => 'Interaktion';

  @override
  String get interactionSubtitle =>
      'Berührungsfeedback und Fernbedienungslayout';

  @override
  String get hapticFeedbackTitle => 'Haptisches Feedback';

  @override
  String get hapticFeedbackSubtitle => 'Bei Tippen und Aktionen vibrieren';

  @override
  String get forceInAppVibrationTitle => 'Vibration in der App erzwingen';

  @override
  String get forceInAppVibrationSubtitle =>
      'Den Vibrator direkt verwenden, auch wenn das System-Tastfeedback deaktiviert ist';

  @override
  String get forceInAppVibrationWarning =>
      'Erweiterte Option. Die App kann dadurch vibrieren, auch wenn das Android-Tastfeedback global deaktiviert ist.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'Intensität';

  @override
  String get intensityLight => 'Leicht';

  @override
  String get intensityMedium => 'Mittel';

  @override
  String get intensityStrong => 'Stark';

  @override
  String get flipRemoteDefaultTitle =>
      'Fernbedienungsansicht standardmäßig drehen';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Fernbedienungsbildschirme um 180° gedreht öffnen für unten montierte USB-Dongles.';

  @override
  String get remoteViewFlipped =>
      'Fernbedienungsansicht wird gedreht geöffnet.';

  @override
  String get remoteViewNormal => 'Fernbedienungsansicht wird normal geöffnet.';

  @override
  String get backupTitle => 'Sicherung';

  @override
  String get backupSubtitle =>
      'Fernbedienungen und Makros importieren oder exportieren';

  @override
  String get importBackup => 'Sicherung importieren';

  @override
  String get importBackupSubtitle =>
      'Sicherung von Fernbedienungen oder Makros sowie Flipper Zero, LIRC oder IRPLUS importieren';

  @override
  String get bulkImportFolder => 'Ordner gesammelt importieren';

  @override
  String get bulkImportFolderSubtitle =>
      'Mehrere Fernbedienungen aus einem Ordner importieren';

  @override
  String get exportBackup => 'Sicherung exportieren';

  @override
  String get exportBackupSubtitle =>
      'Fernbedienungen und Makros als eine JSON-Datei in Downloads speichern';

  @override
  String get restoreDemoRemotes => 'Demo-Fernbedienungen wiederherstellen';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Aktuelle Fernbedienungen durch die integrierte Demo ersetzen';

  @override
  String get deleteAllRemotes => 'Alle Fernbedienungen löschen';

  @override
  String get deleteAllRemotesSubtitle =>
      'Alle Fernbedienungen von diesem Gerät entfernen';

  @override
  String get backupTip =>
      'Tipp: Exportiere vor größeren Änderungen eine Sicherung. Der Import unterstützt vollständige Backups, ältere JSON-Backups nur für Fernbedienungen und Flipper Zero .ir-Dateien.';

  @override
  String get aboutTitle => 'Über';

  @override
  String get aboutSubtitle => 'App-Informationen und Open-Source-Details';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Version $version';
  }

  @override
  String get sourceCode => 'Quellcode';

  @override
  String get viewOnGitHub => 'Auf GitHub ansehen';

  @override
  String get repositoryUrlCopied => 'Repository-URL kopiert';

  @override
  String get reportIssue => 'Problem melden';

  @override
  String get reportIssueSubtitle => 'Fehlerberichte und Funktionswünsche';

  @override
  String get issuesUrlCopied => 'Issues-URL kopiert';

  @override
  String get license => 'Lizenz';

  @override
  String get openSourceLicense => 'Open-Source-Lizenz';

  @override
  String get licenseUrlCopied => 'Lizenz-URL kopiert';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Website besuchen';

  @override
  String get companyUrlCopied => 'Firmen-URL kopiert';

  @override
  String get licenses => 'Lizenzen';

  @override
  String get openSourceLicenses => 'Open-Source-Lizenzen';

  @override
  String byCreator(Object creator) {
    return 'von $creator';
  }

  @override
  String get deviceControlsTitle => 'Gerätesteuerung';

  @override
  String get deviceControlsSubtitle =>
      'Favorisierte Tasten auf der Systemseite Gerätesteuerung anzeigen';

  @override
  String get manageFavorites => 'Favoriten verwalten';

  @override
  String get manageFavoritesSubtitle =>
      'Wähle, welche Tasten in der Gerätesteuerung erscheinen';

  @override
  String get quickSettingsTitle => 'Schnelleinstellungen';

  @override
  String get quickSettingsSubtitle =>
      'Kacheln für Power- und Lautstärke-Kurzbefehle hinzufügen';

  @override
  String get configureTiles => 'Kacheln konfigurieren';

  @override
  String get configureTilesSubtitle => 'Kacheln Fernbedienungstasten zuordnen';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle => 'Universelles Power-Zyklus für eigene Geräte';

  @override
  String get openTvKill => 'TVKill öffnen';

  @override
  String get openTvKillSubtitle =>
      'Power-Codes durchlaufen nur für Geräte, die dir gehören';

  @override
  String get failedToLoadTransmitterSettings =>
      'Sendereinstellungen konnten nicht geladen werden.';

  @override
  String get usbStatusReady =>
      'USB-Dongle ist verbunden und bereit, IR zu senden.';

  @override
  String get usbStatusPermissionRequired =>
      'USB-Dongle erkannt. Fordere USB-Berechtigung an und bestätige die Systemabfrage.';

  @override
  String get usbStatusPermissionDenied =>
      'USB-Berechtigung wurde für den verbundenen Dongle verweigert. Fordere sie erneut an und bestätige die Abfrage.';

  @override
  String get usbStatusPermissionGranted =>
      'USB-Berechtigung ist erteilt. Der Dongle muss noch initialisiert werden, bevor er IR senden kann.';

  @override
  String get usbStatusOpenFailed =>
      'USB-Berechtigung ist erteilt, aber der Dongle konnte nicht initialisiert werden. Stecke ihn neu an und versuche es erneut.';

  @override
  String get usbStatusNoDevice => 'Kein unterstützter USB-IR-Dongle erkannt.';

  @override
  String get usbSelectPermissionRequired =>
      'USB-Dongle erkannt, aber nicht autorisiert. Tippe auf USB-Berechtigung anfordern.';

  @override
  String get usbSelectPermissionDenied =>
      'USB-Berechtigung wurde verweigert. Tippe auf USB-Berechtigung anfordern und bestätige die Abfrage.';

  @override
  String get usbSelectPermissionGranted =>
      'USB-Berechtigung ist erteilt, aber der Dongle ist noch nicht initialisiert. Versuche, ihn neu anzustecken.';

  @override
  String get usbSelectOpenFailed =>
      'USB-Berechtigung ist erteilt, aber der Dongle konnte nicht initialisiert werden. Stecke ihn neu an und versuche es erneut.';

  @override
  String get usbSelectNoDevice =>
      'Kein unterstützter USB-IR-Dongle erkannt. Stecke ihn an und tippe dann auf USB-Berechtigung anfordern.';

  @override
  String get usbSelectReady => 'USB-Dongle ist bereit.';

  @override
  String get autoSwitchEnabledMessage =>
      'Automatischer Wechsel aktiviert: verwendet USB wenn verbunden, sonst Intern.';

  @override
  String get autoSwitchDisabledMessage =>
      'Automatischer Wechsel deaktiviert: Die Senderwahl ist jetzt manuell.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Einstellung für automatischen Wechsel konnte nicht aktualisiert werden.';

  @override
  String get failedToSwitchTransmitter => 'Senderwechsel fehlgeschlagen.';

  @override
  String get deviceHasNoInternalIr =>
      'Dieses Gerät hat keinen integrierten IR-Sender.';

  @override
  String get audioModeEnabledMessage =>
      'Audiomodus aktiviert. Verwende maximale Medienlautstärke und einen Audio-zu-IR-LED-Adapter.';

  @override
  String get usbPermissionRequestSent => 'USB-Berechtigungsanfrage gesendet.';

  @override
  String get usbPermissionRequestSentApprove =>
      'USB-Berechtigungsanfrage gesendet. Bestätige die Abfrage, um USB zu aktivieren.';

  @override
  String get usbAlreadyReady =>
      'USB-Dongle ist bereits initialisiert und einsatzbereit.';

  @override
  String get failedToRequestUsbPermission =>
      'USB-Berechtigung konnte nicht angefordert werden.';

  @override
  String get transmitterHelpInternal =>
      'Verwendet den integrierten IR-Sender des Telefons zum Senden von Befehlen.';

  @override
  String get transmitterHelpUsb =>
      'Verwendet einen USB-IR-Dongle zum Senden von Befehlen. Berechtigung erforderlich.';

  @override
  String get transmitterHelpAudio1 =>
      'Verwendet Audioausgabe mono. Benötigt einen Audio-zu-IR-LED-Adapter und hohe Medienlautstärke.';

  @override
  String get transmitterHelpAudio2 =>
      'Verwendet Audioausgabe stereo. Nutzt zwei Kanäle für bessere LED-Ansteuerung mit kompatiblen Adaptern.';

  @override
  String get transmitterInternal => 'Internes IR';

  @override
  String get transmitterUsb => 'USB-IR-Dongle';

  @override
  String get transmitterAudio1 => 'Audio 1 LED';

  @override
  String get transmitterAudio2 => 'Audio 2 LEDs';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Senderfähigkeiten konnten nicht geladen werden.';

  @override
  String get selectedTransmitter => 'Gewählter Sender';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Aktiv: $active';
  }

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get autoSwitchTitle => 'Automatischer Wechsel';

  @override
  String get autoSwitchDisabledWhileAudio => 'Im Audiomodus deaktiviert';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Verwendet USB wenn verbunden, sonst Intern';

  @override
  String get unavailableOnThisDevice => 'Auf diesem Gerät nicht verfügbar';

  @override
  String get openOnUsbAttachTitle => 'Beim USB-Anschluss öffnen';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android kann vorschlagen, die App zu öffnen, wenn ein unterstützter USB-IR-Dongle verbunden wird.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'IR Blaster wird beim Anschluss eines unterstützten USB-Dongles zum Öffnen vorgeschlagen.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Beim USB-Anschluss nicht zum Öffnen vorschlagen.';

  @override
  String get failedToUpdateSetting =>
      'Einstellung konnte nicht aktualisiert werden.';

  @override
  String get unnamedButton => 'Unbenannte Taste';

  @override
  String get iconFallback => 'Symbol';

  @override
  String get remoteListReorderHint =>
      'Sortiermodus: Karte lange drücken und ziehen, um sie zu verschieben.';

  @override
  String get deleteRemoteTitle => 'Fernbedienung löschen';

  @override
  String deleteRemoteMessage(Object name) {
    return '$name wird dauerhaft entfernt. Diese Aktion kann nicht rückgängig gemacht werden.';
  }

  @override
  String get delete => 'Löschen';

  @override
  String get addToDeviceControlsTitle => 'Zur Gerätesteuerung hinzufügen';

  @override
  String get addToDeviceControlsDescription =>
      'Schneller Zugriff in der System-Gerätesteuerung.';

  @override
  String get skip => 'Überspringen';

  @override
  String get add => 'Hinzufügen';

  @override
  String get addedToDeviceControls => 'Zur Gerätesteuerung hinzugefügt.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return '$name gelöscht. Diese Aktion kann nicht rückgängig gemacht werden.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count Taste(n) · $layout';
  }

  @override
  String get layoutComfort => 'Komfort';

  @override
  String get layoutCompact => 'Kompakt';

  @override
  String get open => 'Öffnen';

  @override
  String get useThisRemote => 'Diese Fernbedienung verwenden';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get editRemoteSubtitle => 'Umbenennen und Tasten bearbeiten';

  @override
  String get thisCannotBeUndone => 'Dies kann nicht rückgängig gemacht werden';

  @override
  String get searchRemotes => 'Fernbedienungen suchen';

  @override
  String get reorderRemotes => 'Fernbedienungen sortieren';

  @override
  String get addRemote => 'Fernbedienung hinzufügen';

  @override
  String get more => 'Mehr';

  @override
  String get reorderMode => 'Sortiermodus';

  @override
  String remoteButtonCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tasten',
      one: '$count Taste',
    );
    return '$_temp0';
  }

  @override
  String get noRemotesYet => 'Noch keine Fernbedienungen';

  @override
  String get noRemotesDescription =>
      'Erstelle eine Fernbedienung, um IR-Codes zu senden.';

  @override
  String get noRemotesNextStep =>
      'Als Nächstes: Tippe auf Fernbedienung hinzufügen und lege deine ersten Tasten an.';

  @override
  String get actions => 'Aktionen';

  @override
  String get macrosTitle => 'Makros';

  @override
  String get help => 'Hilfe';

  @override
  String get createMacro => 'Makro erstellen';

  @override
  String get timedMacrosTitle => 'Zeitgesteuerte Makros';

  @override
  String get timedMacrosSubtitle =>
      'Automatisiere IR-Befehlsfolgen mit präzisem Timing';

  @override
  String get timedMacrosNextStep =>
      'Als Nächstes: Tippe auf Dein erstes Makro erstellen, wähle eine Fernbedienung und füge dann Befehle und Pausen hinzu.';

  @override
  String get macroFeatureToysTitle => 'Perfekt für interaktive Spielzeuge';

  @override
  String get macroFeatureToysDescription =>
      'Steuere Geräte wie i-cybie Roboterhunde, i-sobot Roboter und andere Spielzeuge, die zwischen Befehlen Zeit zur Verarbeitung brauchen.';

  @override
  String get macroFeatureTimingTitle => 'Präzise Zeitsteuerung';

  @override
  String get macroFeatureTimingDescription =>
      'Füge zwischen Befehlen Pausen hinzu von 250 ms bis zu eigenen Werten, damit dein Gerät vor der nächsten Aktion reagieren kann.';

  @override
  String get macroFeatureManualTitle => 'Manuelle Fortsetzungsschritte';

  @override
  String get macroFeatureManualDescription =>
      'Pausiert die Ausführung und wartet auf deine Bestätigung, wenn die Animationslänge variiert oder du visuelles Feedback brauchst.';

  @override
  String get exampleUseCase => 'Beispiel';

  @override
  String get macroExampleText =>
      'i-cybie erweiterter Modus\n1. Befehl Modus senden\n2. 1000 ms warten Gerät verarbeitet\n3. Aktion 1 senden\n4. 1000 ms warten\n5. Aktion 2 senden\n… und so weiter automatisch';

  @override
  String get createFirstMacro => 'Dein erstes Makro erstellen';

  @override
  String get noRemote => 'Keine Fernbedienung';

  @override
  String macroStepCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Schritte',
      one: '$count Schritt',
    );
    return '$_temp0';
  }

  @override
  String get aboutTimedMacros => 'Über zeitgesteuerte Makros';

  @override
  String get aboutTimedMacrosDescription =>
      'Zeitgesteuerte Makros automatisieren Folgen von IR-Befehlen mit genauen Verzögerungen zwischen den Schritten.';

  @override
  String get sendCommand => 'Befehl senden';

  @override
  String get sendCommandDescription =>
      'Sendet einen IR-Befehl von deiner Fernbedienung.';

  @override
  String get delay => 'Verzögerung';

  @override
  String get delayDescription =>
      'Wartet eine festgelegte Dauer etwa 1000 ms vor dem nächsten Schritt.';

  @override
  String get manualContinue => 'Manuell fortsetzen';

  @override
  String get manualContinueDescription =>
      'Pausiert bis du auf Weiter tippst nützlich bei variabler Animationslänge.';

  @override
  String get gotIt => 'Verstanden';

  @override
  String get failedToSaveMacros => 'Makros konnten nicht gespeichert werden.';

  @override
  String deletedMacroNamed(Object name) {
    return '$name gelöscht.';
  }

  @override
  String get undo => 'Rückgängig';

  @override
  String get failedToRestoreMacro =>
      'Makro konnte nicht wiederhergestellt werden.';

  @override
  String get deleteMacroTitle => 'Makro löschen';

  @override
  String get deleteMacroMessage =>
      'Du kannst dies über die nächste Snackbar rückgängig machen.';

  @override
  String get noRemotesAvailable => 'Keine Fernbedienungen verfügbar.';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count Taste(n)';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Ausrichtung: gedreht tippen für normal';

  @override
  String get remoteOrientationNormalTooltip =>
      'Ausrichtung: normal tippen für drehen';

  @override
  String get stopLoop => 'Schleife stoppen';

  @override
  String get reorderButtons => 'Tasten sortieren';

  @override
  String get remoteReorderHint =>
      'Sortiermodus: Taste lange drücken und ziehen, um sie zu verschieben.';

  @override
  String get manageRemote => 'Fernbedienung verwalten';

  @override
  String get remoteNoButtons => 'Keine Tasten in dieser Fernbedienung';

  @override
  String get remoteNoButtonsDescription =>
      'Verwende Fernbedienung bearbeiten, um Tasten hinzuzufügen oder zu konfigurieren.';

  @override
  String get editRemote => 'Fernbedienung bearbeiten';

  @override
  String get editRemoteActionsSubtitle =>
      'Umbenennen, sortieren und Tasten bearbeiten';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return '$name aktualisiert.';
  }

  @override
  String buttonAddedNamed(Object name) {
    return '$name hinzugefügt.';
  }

  @override
  String get buttonDuplicated => 'Taste dupliziert.';

  @override
  String get loopRunningForButton => 'Für diese Taste läuft eine Schleife.';

  @override
  String get loopTip =>
      'Tipp: Verwende Schleife, um zu wiederholen bis du stoppst.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Code kopiert.';

  @override
  String get copyCode => 'Code kopieren';

  @override
  String get startLoop => 'Schleife starten';

  @override
  String get editButtonSubtitle =>
      'Beschriftung, Code, Protokoll und Frequenz ändern';

  @override
  String get newButton => 'Neue Taste';

  @override
  String get newButtonSubtitle => 'Eine neue Taste nach dieser erstellen';

  @override
  String get duplicate => 'Duplizieren';

  @override
  String get duplicateButtonSubtitle => 'Eine Kopie dieser Taste erstellen';

  @override
  String get removeFromDeviceControls => 'Aus Gerätesteuerung entfernen';

  @override
  String get addToDeviceControls => 'Zur Gerätesteuerung hinzufügen';

  @override
  String get deviceControlsButtonSubtitle =>
      'Zeigt diese Taste in der System-Gerätesteuerung';

  @override
  String get removedFromDeviceControls => 'Aus Gerätesteuerung entfernt.';

  @override
  String get pinQuickTile => 'An Schnellkachel-Favoriten anheften';

  @override
  String get unpinQuickTile => 'Von Schnellkachel-Favoriten lösen';

  @override
  String get quickTileButtonSubtitle =>
      'Zeigt diese Taste oben in der Schnellkachel-Auswahl';

  @override
  String get removedFromQuickTileFavorites =>
      'Aus Schnellkachel-Favoriten entfernt.';

  @override
  String get pinnedToQuickTileFavorites =>
      'An Schnellkachel-Favoriten angeheftet.';

  @override
  String get duplicateAndEdit => 'Duplizieren und bearbeiten';

  @override
  String get duplicateAndEditSubtitle =>
      'Eine Kopie erstellen und sofort bearbeiten';

  @override
  String get done => 'Fertig';

  @override
  String get run => 'Starten';

  @override
  String get untitledRemote => 'Unbenannte Fernbedienung';

  @override
  String get createRemoteTitle => 'Fernbedienung erstellen';

  @override
  String get editRemoteTitle => 'Fernbedienung bearbeiten';

  @override
  String get removeButtonTitle => 'Taste entfernen';

  @override
  String get imageButtonRemovedMessage => 'Diese Bildtaste wird entfernt.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '$name wird entfernt.';
  }

  @override
  String get remove => 'Entfernen';

  @override
  String importedButtonCount(int count) {
    return '$count Taste(n) importiert.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return '$count Taste(n) aus vorhandenen Fernbedienungen importiert.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Beschriftung, Signal und erweiterte Einstellungen ändern';

  @override
  String get createButtonCopySubtitle => 'Eine Kopie dieser Taste erstellen';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Eine Kopie erstellen und sofort bearbeiten';

  @override
  String get undoAvailableInNextSnackbar =>
      'Du kannst dies über die nächste Snackbar rückgängig machen';

  @override
  String get buttonRemoved => 'Taste entfernt.';

  @override
  String get remoteNameCannotBeEmpty =>
      'Name der Fernbedienung darf nicht leer sein.';

  @override
  String get saveRemote => 'Fernbedienung speichern';

  @override
  String get remoteName => 'Name der Fernbedienung';

  @override
  String get remoteNameHint => 'z. B. TV, Klimaanlage, LED-Streifen';

  @override
  String get remoteNameHelper =>
      'Dieser Name erscheint in deiner Fernbedienungsliste.';

  @override
  String get layoutStyle => 'Layoutstil';

  @override
  String get layoutWideDescription =>
      'Breit: 2-Spalten-Tasten mit mehr Details empfohlen.';

  @override
  String get layoutCompactDescription =>
      'Kompakt: klassisches 4× Raster nur Symbole oder Text.';

  @override
  String get importFromRemotes => 'Aus Fernbedienungen importieren';

  @override
  String get importFromDatabase => 'Aus Datenbank importieren';

  @override
  String get addButton => 'Taste hinzufügen';

  @override
  String get noButtonsYet => 'Noch keine Tasten';

  @override
  String get createRemoteEmptyStateDescription =>
      'Füge deine erste Taste hinzu und halte sie dann für Bearbeiten oder Entfernen gedrückt.';

  @override
  String get createButtonTitle => 'Taste erstellen';

  @override
  String get editButtonTitle => 'Taste bearbeiten';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Protokolle konnten nicht geladen werden: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Datenbankschlüssel konnten nicht geladen werden: $error';
  }

  @override
  String get presetPower => 'Ein/Aus';

  @override
  String get presetVolume => 'Lautstärke';

  @override
  String get presetChannel => 'Kanal';

  @override
  String get presetNavigation => 'Navigation';

  @override
  String get all => 'Alle';

  @override
  String get completeRequiredFieldsToSave =>
      'Pflichtfelder zum Speichern ausfüllen';

  @override
  String get buttonLabelStepTitle => '1 Taste beschriften';

  @override
  String get buttonLabelStepSubtitle =>
      'Wähle ein Bild, Symbol oder gib einen Text ein.';

  @override
  String get buttonColorStepTitle => '2 Tastenfarbe optional';

  @override
  String get buttonColorStepSubtitle =>
      'Wähle eine Hintergrundfarbe für diese Taste.';

  @override
  String get selectColor => 'Farbe wählen';

  @override
  String get noImageSelected => 'Kein Bild gewählt';

  @override
  String get gallery => 'Galerie';

  @override
  String get builtIn => 'Integriert';

  @override
  String get removeImage => 'Bild entfernen';

  @override
  String get requiredSelectImageOrSwitch =>
      'Pflicht: Bild wählen, Symbol wählen oder zu Text wechseln.';

  @override
  String get iconSelected => 'Symbol ausgewählt';

  @override
  String get noIconSelected => 'Kein Symbol gewählt';

  @override
  String get chooseIcon => 'Symbol wählen';

  @override
  String get removeIcon => 'Symbol entfernen';

  @override
  String get requiredSelectIconOrSwitch =>
      'Pflicht: Symbol wählen oder zu Bild oder Text wechseln.';

  @override
  String get buttonText => 'Tastentext';

  @override
  String get buttonTextHint => 'z. B. Ein/Aus, Lautstärke +, HDMI 1';

  @override
  String get buttonTextHelper => 'Dieser Text erscheint auf der Taste.';

  @override
  String get requiredEnterButtonLabel =>
      'Pflicht: Beschriftung der Taste eingeben.';

  @override
  String get defaultColorName => 'Standard';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Neue Fernbedienung mit einer Taste aus dem letzten Treffer erstellt.';

  @override
  String get selectRemote => 'Fernbedienung wählen';

  @override
  String remoteNumber(Object id) {
    return 'Fernbedienung #$id';
  }

  @override
  String get newRemoteCreated => 'Neue Fernbedienung erstellt.';

  @override
  String get failedToCreateRemote =>
      'Fernbedienung konnte nicht erstellt werden.';

  @override
  String get newRemoteEllipsis => 'Neue Fernbedienung…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Zu $name hinzugefügt.';
  }

  @override
  String get failedToAddToRemote =>
      'Hinzufügen zur Fernbedienung fehlgeschlagen.';

  @override
  String get newRemoteDefaultName => 'Neue Fernbedienung';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Zu Offset $offset gesprungen. Pausiert tippe auf Fortsetzen.';
  }

  @override
  String get sent => 'Gesendet.';

  @override
  String failedToSend(Object error) {
    return 'Senden fehlgeschlagen: $error';
  }

  @override
  String get copiedProtocolCode => 'Kopiert Protokoll:Code.';

  @override
  String get savedToResults => 'Zu Ergebnissen gespeichert.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Ungültiger Code für Protokoll: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Aktuellen Kandidaten kopiert.';

  @override
  String get jumpToOffset => 'Zu Offset springen';

  @override
  String get jumpToBruteCursor => 'Zum Brute-Cursor springen';

  @override
  String get jump => 'Springen';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Zu Cursor 0x$cursor gesprungen. Pausiert tippe auf Fortsetzen.';
  }

  @override
  String get irSignalTester => 'IR-Signaltester';

  @override
  String get stop => 'Stopp';

  @override
  String get selectButton => 'Taste wählen';

  @override
  String get buttonNotFoundInRemotes =>
      'Taste in den Fernbedienungen nicht gefunden.';

  @override
  String sentNamed(Object name) {
    return '$name gesendet.';
  }

  @override
  String sendFailed(Object error) {
    return 'Senden fehlgeschlagen: $error';
  }

  @override
  String get noFavoritesYet => 'Noch keine Favoriten';

  @override
  String get deviceControlsEmptyHint =>
      'Halte eine Fernbedienungstaste gedrückt und wähle Zu Gerätesteuerung hinzufügen.';

  @override
  String get sendTest => 'Test senden';

  @override
  String get testSendCompleted => 'Testsendung abgeschlossen.';

  @override
  String testSendFailed(Object error) {
    return 'Testsendung fehlgeschlagen: $error';
  }

  @override
  String removedNamed(Object name) {
    return '$name entfernt.';
  }

  @override
  String get brand => 'Marke';

  @override
  String get model => 'Modell';

  @override
  String get selectBrand => 'Marke wählen';

  @override
  String get searchBrand => 'Marke suchen…';

  @override
  String get selectModel => 'Modell wählen';

  @override
  String get searchModel => 'Modell suchen…';

  @override
  String get unnamedKey => 'Unbenannter Schlüssel';

  @override
  String get unknown => 'Unbekannt';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'Befehle suchen';

  @override
  String get noMatchingCommands => 'Keine passenden Befehle';

  @override
  String get quickTileFavoritesTitle => 'Schnellkachel-Favoriten';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Zuordnung für Kachel $tileLabel ändern';
  }

  @override
  String get pickDifferentButton => 'Andere Taste wählen';

  @override
  String get browseAllRemotesEllipsis => 'Alle Fernbedienungen durchsuchen…';

  @override
  String get invalidMacroFileFormat => 'Ungültiges Makro-Dateiformat.';

  @override
  String get failedToParseMacroFile =>
      'Makro-Datei konnte nicht gelesen werden.';

  @override
  String get deviceCodeLabel => 'Gerätecode';

  @override
  String get commandLabel => 'Befehl';

  @override
  String get editButtonCodeTitle => 'Code der Taste bearbeiten';

  @override
  String get thisRemoteHasNoButtons => 'Diese Fernbedienung hat keine Tasten.';

  @override
  String get selectCommand => 'Befehl wählen';

  @override
  String get databaseModeAutofillHint =>
      'Der Datenbankmodus füllt Schritt 2 automatisch für dich aus Marke, Modell und Protokoll. Nach dem Import einer Taste kannst du alles in Manuell verfeinern.';

  @override
  String get test => 'Test';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Alle gewählten Tasten waren Duplikate.';

  @override
  String get noButtonsImported => 'Keine Tasten importiert.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return '$addedCount Taste(n) importiert. $skippedCount Duplikat(e) übersprungen.';
  }

  @override
  String get importAllMatchingTitle => 'Alle passenden Tasten importieren';

  @override
  String get noMatchingKeysFound => 'Keine passenden Schlüssel gefunden.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Dadurch werden bis zu $count passende Schlüssel aus der aktuellen Datenbankauswahl importiert.';
  }

  @override
  String get importAll => 'Alle importieren';

  @override
  String get importingButtons => 'Tasten werden importiert…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Alle passenden Tasten waren Duplikate.';

  @override
  String get quickPresets => 'Schnellvorgaben';

  @override
  String get selectDeviceFirst => 'Zuerst Gerät wählen';

  @override
  String get searchByLabelOrHex => 'Nach Bezeichnung oder Hex suchen';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Optional: die Vorgabetasten für $preset verfeinern';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Wähle zuerst Marke, Modell und Protokoll.';

  @override
  String get importFromDatabaseTitle => 'Aus Datenbank importieren';

  @override
  String get importFromDatabaseSubtitle =>
      'Wähle ein Gerät, lade passende Schlüssel und importiere dann die ausgewählten Tasten.';

  @override
  String get deviceAndFilters => 'Gerät und Filter';

  @override
  String loadedCount(int count) {
    return '$count geladen';
  }

  @override
  String get hideFilters => 'Filter ausblenden';

  @override
  String get showFilters => 'Filter anzeigen';

  @override
  String get noProtocolFoundForBrandModel =>
      'Kein Protokoll für diese Marke und dieses Modell gefunden.';

  @override
  String get protocolAutoDetected => 'Protokoll';

  @override
  String get protocolAutoDetectedHelper =>
      'Automatisch aus der Datenbank erkannt. Du kannst es vor dem Import ändern.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Wähle Marke, Modell und Protokoll, um Schlüssel zu laden.';

  @override
  String get noKeysFound => 'Keine Schlüssel gefunden.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Keine Schlüssel für $query gefunden.';
  }

  @override
  String get skipDuplicates => 'Duplikate überspringen';

  @override
  String get skipDuplicatesSubtitle =>
      'Tasten nicht importieren, die bereits in dieser Fernbedienung existieren.';

  @override
  String get importSelected => 'Auswahl importieren';

  @override
  String get noMacrosToExport => 'Keine Makros zum Exportieren.';

  @override
  String get macrosExportedToDownloads => 'Makros in Downloads exportiert.';

  @override
  String get failedToExportMacros => 'Makros konnten nicht exportiert werden.';

  @override
  String get failedToReadFile => 'Datei konnte nicht gelesen werden.';

  @override
  String get importFromExistingRemotesTitle =>
      'Aus vorhandenen Fernbedienungen importieren';

  @override
  String selectedCount(int count) {
    return '$count gewählt';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Keine anderen Fernbedienungen mit Tasten gefunden.';

  @override
  String get sourceRemote => 'Quell-Fernbedienung';

  @override
  String get searchButtons => 'Tasten suchen';

  @override
  String get searchButtonsHint => 'Ein/Aus, Lautstärke, Stumm…';

  @override
  String get selectVisible => 'Sichtbare wählen';

  @override
  String get clearVisible => 'Sichtbare leeren';

  @override
  String protocolNamed(Object name) {
    return 'Protokoll: $name';
  }

  @override
  String get rawSignal => 'Rohsignal';

  @override
  String get legacyCode => 'Alter Code';

  @override
  String importCount(int count) {
    return '$count importieren';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Speicherberechtigung verweigert benötigt auf einigen älteren Android-Geräten.';

  @override
  String get backupExportedToDownloads => 'Sicherung in Downloads exportiert.';

  @override
  String failedToExport(Object error) {
    return 'Export fehlgeschlagen: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return '$count Fernbedienungen aus altem JSON-Backup importiert. Makros wurden nicht geändert.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Import fehlgeschlagen: remotes im Backup muss eine JSON-Liste sein, wenn vorhanden.';

  @override
  String get importFailedMacrosMustBeList =>
      'Import fehlgeschlagen: macros im Backup muss eine JSON-Liste sein, wenn vorhanden.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Import fehlgeschlagen: ungültiges Backup-Format erwartet alte Liste oder Map mit remotes oder macros.';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return '$remoteCount Fernbedienungen aus Sicherung importiert. Makros wurden nicht geändert.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return '$remoteCount Fernbedienungen und $macroCount Makros aus Sicherung importiert.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Import fehlgeschlagen: keine gültigen Tasten in .ir-Datei gefunden.';

  @override
  String get importedOneRemoteFromFlipper =>
      '1 Fernbedienung aus Flipper .ir importiert. Makros wurden nicht geändert.';

  @override
  String get importFailedInvalidIrplus =>
      'Import fehlgeschlagen: ungültige irplus-Datei keine gültigen Tasten gefunden.';

  @override
  String get importedOneRemoteFromIrplus =>
      '1 Fernbedienung aus irplus importiert. Makros wurden nicht geändert.';

  @override
  String get importFailedInvalidLirc =>
      'Import fehlgeschlagen: ungültige LIRC-Datei keine gültigen Codes oder Rohcodes gefunden.';

  @override
  String get importedOneRemoteFromLirc =>
      '1 Fernbedienung aus LIRC-Konfiguration importiert. Makros wurden nicht geändert.';

  @override
  String get unsupportedFileTypeSelected =>
      'Nicht unterstützter Dateityp gewählt.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Import fehlgeschlagen: ungültige oder unlesbare Datei.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Sammelimport abgeschlossen: keine unterstützten Dateien im Ordner gefunden.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Sammelimport abgeschlossen: keine Fernbedienungen importiert. $skippedCount Datei(en) übersprungen.';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Sammelimport abgeschlossen: $importedCount Fernbedienung(en) aus $supportedCount unterstützten Datei(en) importiert. $skippedCount Datei(en) übersprungen.';
  }

  @override
  String get storagePermissionDenied => 'Speicherberechtigung verweigert.';

  @override
  String get bulkImportFailedReadFolder =>
      'Sammelimport fehlgeschlagen: Ordnerinhalt konnte nicht gelesen werden.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Sammelimport abgeschlossen: keine unterstützten Dateien gefunden $sourceLabel.';
  }

  @override
  String get clearAction => 'Leeren';

  @override
  String get saveAction => 'Speichern';

  @override
  String buttonsTitleCount(int count) {
    return 'Tasten $count';
  }

  @override
  String get invalidStepEncountered => 'Ungültiger Schritt gefunden';

  @override
  String failedToSendNamed(Object name) {
    return 'Senden fehlgeschlagen: $name';
  }

  @override
  String get buttonNotFound => 'Taste nicht gefunden';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Taste nicht gefunden: $name';
  }

  @override
  String get unknownButton => 'Unbekannte Taste';

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
      'Ausrichtung: gedreht tippen für normal';

  @override
  String get orientationNormalTooltip =>
      'Ausrichtung: normal tippen für drehen';

  @override
  String get noSteps => 'Keine Schritte';

  @override
  String stepProgress(int current, int total) {
    return 'Schritt $current / $total';
  }

  @override
  String get completed => 'Abgeschlossen';

  @override
  String get paused => 'Pausiert';

  @override
  String get running => 'Läuft';

  @override
  String get ready => 'Bereit';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total Schritte';
  }

  @override
  String get waiting => 'Warten';

  @override
  String secondsRemaining(Object seconds) {
    return '${seconds}s verbleibend';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Tippe auf Weiter, wenn du für den nächsten Schritt bereit bist';

  @override
  String get error => 'Fehler';

  @override
  String get macroCompleted => 'Makro abgeschlossen';

  @override
  String finishedIn(Object duration) {
    return 'Fertig in $duration';
  }

  @override
  String get sequence => 'Sequenz';

  @override
  String waitMilliseconds(int ms) {
    return 'Warte ${ms}ms';
  }

  @override
  String get runAgain => 'Erneut starten';

  @override
  String get startMacro => 'Makro starten';

  @override
  String get continueAction => 'Weiter';

  @override
  String get unnamedRemote => 'Unbenannte Fernbedienung';

  @override
  String get enterMacroName => 'Makronamen eingeben';

  @override
  String get addAtLeastOneStep => 'Mindestens einen Schritt hinzufügen';

  @override
  String get fixInvalidSteps => 'Ungültige Schritte korrigieren';

  @override
  String get unknownCommand => 'Unbekannter Befehl';

  @override
  String get unnamedCommand => 'Unbenannter Befehl';

  @override
  String get iconCommand => 'Symbolbefehl';

  @override
  String get selectDelay => 'Verzögerung wählen';

  @override
  String keepMilliseconds(int ms) {
    return 'Beibehalten: ${ms}ms';
  }

  @override
  String get custom => 'Benutzerdefiniert';

  @override
  String get enterCustomDelayDuration => 'Eigene Verzögerung eingeben';

  @override
  String millisecondsLong(int ms) {
    return '$ms Millisekunden';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds Sekunde$plural';
  }

  @override
  String get customDelay => 'Eigene Verzögerung';

  @override
  String get delayMillisecondsLabel => 'Verzögerung Millisekunden';

  @override
  String get delayMillisecondsHint => 'z. B. 3000';

  @override
  String get recommendedDelayRange =>
      'Empfohlen: 250 bis 5000 ms für die meisten Geräte';

  @override
  String get enterValidPositiveNumber =>
      'Bitte eine gültige positive Zahl eingeben';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Fernbedienung';

  @override
  String get macroName => 'Makroname';

  @override
  String get macroNameHint => 'z. B. i-cybie erweiterter Modus';

  @override
  String stepsTitleCount(int count) {
    return 'Schritte $count';
  }

  @override
  String get noStepsYet => 'Noch keine Schritte';

  @override
  String get addCommandsAndDelaysHint =>
      'Füge unten Befehle und Verzögerungen hinzu, um deine Sequenz zu bauen';

  @override
  String get addStep => 'Schritt hinzufügen';

  @override
  String get reorderStepsHint =>
      'Tipp: Ziehe den Griff, um Schritte neu anzuordnen. Tippe auf einen Schritt, um ihn zu bearbeiten.';

  @override
  String reorderStep(int index) {
    return 'Schritt $index neu anordnen';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Drücken und ziehen, um die Reihenfolge zu ändern';

  @override
  String deleteStep(int index) {
    return 'Schritt $index löschen';
  }

  @override
  String get invalidStepTapToFix => 'Ungültiger Schritt tippe zum Korrigieren';

  @override
  String get sendIrCommand => 'IR-Befehl senden';

  @override
  String get waitForUserConfirmation => 'Auf Bestätigung des Nutzers warten';

  @override
  String get notImplemented => 'Nicht implementiert';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Breit';

  @override
  String get iconButton => 'Symboltaste';

  @override
  String get imageButton => 'Bildtaste';

  @override
  String get noSignalInfo => 'Keine Signalinformation';

  @override
  String get proceed => 'Fortfahren';

  @override
  String get discard => 'Verwerfen';

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
  String get idle => 'Leerlauf';

  @override
  String get start => 'Start';

  @override
  String get resume => 'Fortsetzen';

  @override
  String get pause => 'Pause';

  @override
  String get stopped => 'Gestoppt';

  @override
  String get copy => 'Kopieren';

  @override
  String get send => 'Senden';

  @override
  String get step => 'Schritt';

  @override
  String get addToRemote => 'Zur Fernbedienung hinzufügen';

  @override
  String get noDescriptionAvailable => 'Keine Beschreibung verfügbar.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Kaseikyo-Anbieter muss genau 4 Hex-Ziffern haben.';

  @override
  String get irFinderDatabaseNotReady => 'Datenbank ist noch nicht bereit.';

  @override
  String get irFinderSelectBrandFirst => 'Wähle zuerst eine Marke in Setup.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute Force ist für dieses Protokoll noch nicht verfügbar.';

  @override
  String get irFinderInvalidPrefix => 'Ungültiges Präfix.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Marke: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Modell: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Taste: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Fernbedienung #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Gib einen nullbasierten Index innerhalb der gefilterten sortierten Datenbankergebnisse ein.';

  @override
  String get irFinderJumpCursorHelper =>
      'Gib einen nullbasierten Hex-Cursor im Brute-Force-Raum ein.';

  @override
  String get irFinderSetupTab => 'Setup';

  @override
  String get irFinderTestTab => 'Test';

  @override
  String get irFinderResultsTab => 'Ergebnisse';

  @override
  String get irFinderContinueToTest => 'Weiter zum Test';

  @override
  String get irFinderKaseikyoVendorTitle => 'Kaseikyo-Anbieter';

  @override
  String get irFinderCustomVendorLabel => 'Benutzerdefinierter Anbieter 4 Hex';

  @override
  String get irFinderBrowseDbCandidates => 'DB-Kandidaten durchsuchen…';

  @override
  String get irFinderEditSetup => 'Setup bearbeiten';

  @override
  String get irFinderNoSavedHits =>
      'Noch keine gespeicherten Treffer. Drücke auf der Test-Seite Treffer speichern, wenn das Gerät reagiert.';

  @override
  String get irFinderBackToTest => 'Zurück zum Test';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Großer Suchraum';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Dieser Brute-Force-Raum ist sehr groß $human Möglichkeiten. IR Finder beachtet weiterhin deine maximale Versuche und die Abkühlzeit, aber vermeide es, IR-Geräte zu spammen.\n\nEmpfehlung: Nutze zuerst den Datenbankmodus und gib wenn möglich bekannte Präfix-Bytes ein, um den Raum zu verkleinern.';
  }

  @override
  String get irFinderDatabaseSession => 'Datenbanksitzung';

  @override
  String get irFinderBruteforceSession => 'Brute-Force-Sitzung';

  @override
  String get irFinderResumeLastSession => 'Letzte Sitzung fortsetzen';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Marke: $brand · Modell: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Präfix: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Fortschritt: $progress · Gestartet: $when';
  }

  @override
  String get irFinderApplyResume => 'Anwenden und fortsetzen';

  @override
  String get irFinderBruteforceMode => 'Brute Force';

  @override
  String get irFinderDatabaseAssistedMode => 'Datenbankgestützt';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Protokoll: $name';
  }

  @override
  String get irFinderProtocolLabel => 'IR-Protokoll';

  @override
  String get irFinderProtocolHelper =>
      'Steuert die Kodierung und damit den Suchraum.';

  @override
  String get irFinderKnownPrefixLabel => 'Bekanntes Präfix Hex-Bytes optional';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Nutzlast: $digits Hex-Ziffer(n)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Nutzlast: $digits Hex-Ziffer(n) · Beispiel: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Nutzlast: $digits Hex-Ziffer(n) · Max. Präfix: $bytes Byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Nutzlast: $digits Hex-Ziffer(n) · Beispiel: $example · Max. Präfix: $bytes Byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Beispiel: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Gib bekannte erste Bytes ein, um den Suchraum zu verkleinern.';

  @override
  String get irFinderDatabaseMode => 'Datenbank';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Normalisiertes Präfix: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Normalisiertes Präfix';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Brute Force ist für dieses Protokoll noch nicht konfiguriert.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Alle $value';
  }

  @override
  String get irFinderTestControls => 'Teststeuerung';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Nutzlastlänge: $digits Hex-Ziffer(n).';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Suchraum: $value Möglichkeiten nach Präfix-Einschränkungen.';
  }

  @override
  String get irFinderCooldownMs => 'Abkühlzeit ms';

  @override
  String get irFinderMaxAttemptsPerRun => 'Max. Versuche pro Lauf';

  @override
  String get irFinderTestAllCombinations => 'Alle Kombinationen testen';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Läuft bis der Suchraum erschöpft ist. Effektives Limit: $value';
  }

  @override
  String get irFinderAttempts => 'Versuche';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Schiebebereich: 1 bis $max für größere Werte Zahl eingeben';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Max\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Effektives Limit in diesem Lauf: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Tipp: Nutze zuerst den Datenbankmodus. Brute Force ist am besten mit bekanntem Präfix etwa den ersten 1 bis 4 Bytes.';

  @override
  String get irFinderDatabaseInitFailed =>
      'Datenbankinitialisierung fehlgeschlagen.';

  @override
  String get irFinderPreparingDatabase =>
      'Lokale IR-Code-Datenbank wird vorbereitet…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Datenbankgestützte Suche';

  @override
  String get irFinderBrand => 'Marke';

  @override
  String get irFinderSelectBrand => 'Marke wählen';

  @override
  String get irFinderModelOptional => 'Modell optional';

  @override
  String get irFinderSelectBrandFirstShort => 'Zuerst Marke wählen';

  @override
  String get irFinderSelectModelRecommended => 'Modell wählen empfohlen';

  @override
  String get irFinderOnlySelectedProtocol => 'Nur gewähltes Protokoll';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Filtert Schlüssel auf das gewählte Protokoll. Deaktiviere dies, um alle Protokolle zu durchsuchen.';

  @override
  String get irFinderQuickWinsFirst => 'Schnelle Treffer zuerst';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Priorisiert POWER, MUTE, VOL und CH ähnliche Tasten vor tieferen Schlüsseln.';

  @override
  String get irFinderMaxKeysPerRun => 'Max. Tasten pro Lauf';

  @override
  String get irFinderTesting => 'Wird getestet…';

  @override
  String get irFinderCooldown => 'Abkühlzeit';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'Modus';

  @override
  String get irFinderRetryLast => 'Letzten erneut testen';

  @override
  String get irFinderTrigger => 'Auslösen';

  @override
  String get irFinderJump => 'Springen…';

  @override
  String get irFinderSaveHit => 'Treffer speichern';

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
    return 'Zuletzt getesteter Code: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Starte den Test, um den zuletzt getesteten Code zu sehen.';

  @override
  String irFinderFromDb(Object value) {
    return 'Aus DB: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'Aus Brute Force vom Protokollencoder erzeugt.';

  @override
  String irFinderSendError(Object error) {
    return 'Sendefehler: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Quelle: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Ergebnisse unterstützen sofort Testen und Kopieren. Direktes Hinzufügen zur Fernbedienung kann im Editor-Flow weiter ausgebaut werden.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'DB-Kandidaten durchsuchen';

  @override
  String get irFinderFilterByLabelOrHex => 'Nach Bezeichnung oder Hex filtern…';

  @override
  String get irFinderJumpHere => 'Hierher springen';

  @override
  String get irFinderSelectModel => 'Modell wählen';

  @override
  String get irFinderSearchBrands => 'Marken suchen…';

  @override
  String get irFinderSearchModels => 'Modelle suchen…';

  @override
  String get iconPickerTitle => 'Symbol wählen';

  @override
  String get iconPickerSearchHint => 'Suchen icons...';

  @override
  String get iconPickerNoIconsFound => 'Keine Symbole gefunden';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count Symbole verfügbar';
  }

  @override
  String get iconPickerCategoryAll => 'Alle';

  @override
  String get iconPickerCategoryMedia => 'Medien';

  @override
  String get iconPickerCategoryVolume => 'Lautstärke';

  @override
  String get iconPickerCategoryNavigation => 'Navigation';

  @override
  String get iconPickerCategoryPower => 'Ein/Aus';

  @override
  String get iconPickerCategoryNumbers => 'Zahlen';

  @override
  String get iconPickerCategorySettings => 'Einstellungen';

  @override
  String get iconPickerCategoryDisplay => 'Anzeige';

  @override
  String get iconPickerCategoryInput => 'Eingang';

  @override
  String get iconPickerCategoryFavorite => 'Favorit';

  @override
  String get universalPowerTitle => 'Universal Power';

  @override
  String get universalPowerRunTab => 'Lauf';

  @override
  String get universalPowerUseResponsibly => 'Verantwortungsvoll verwenden';

  @override
  String get universalPowerConsentBody =>
      'Universal Power durchläuft IR-Power-Codes. Verwende es nur bei Geräten, die du besitzt oder kontrollierst. Stoppe sofort, sobald das Gerät reagiert.';

  @override
  String get universalPowerConsentCheckbox =>
      'Ich besitze oder kontrolliere das Gerät';

  @override
  String get universalPowerSetupBody =>
      'Durchläuft Power-Codes für deine gewählte Marke. Stoppe sofort, sobald das Gerät reagiert.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Zuletzt gesendet: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Keine Power-Codes gefunden. Erweitere die Suche.';

  @override
  String get universalPowerUnableToStart => 'Start nicht möglich.';

  @override
  String get universalPowerAllBrands => 'Alle Marken kein Filter';

  @override
  String get universalPowerClearBrandFilter => 'Markenfilter löschen';

  @override
  String get universalPowerBroadenSearch => 'Suche bei Bedarf erweitern';

  @override
  String get universalPowerBroadenSearchHint =>
      'Wenn keine Power-Bezeichnungen gefunden werden, auch andere Tasten einbeziehen.';

  @override
  String get universalPowerAdditionalPatternsDepth =>
      'Tiefe zusätzlicher Muster';

  @override
  String get universalPowerDepth1 => 'Nur Priorität POWER oder OFF';

  @override
  String get universalPowerDepth2 => 'POWER-Aliase einbeziehen';

  @override
  String get universalPowerDepth3 =>
      'Sekundäre Power-Bezeichnungen einbeziehen';

  @override
  String get universalPowerDepth4 =>
      'Alle Bezeichnungen einbeziehen niedrigste Priorität';

  @override
  String get universalPowerLoopUntilStopped => 'Bis zum Stopp wiederholen';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Durchläuft die Warteschlange weiter, bis du stoppst.';

  @override
  String get universalPowerDelayBetweenCodes => 'Verzögerung zwischen Codes';

  @override
  String get universalPowerStart => 'Universal Power starten';

  @override
  String get universalPowerRunStatus => 'Laufstatus';

  @override
  String universalPowerProgress(Object value) {
    return 'Fortschritt: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Pausiert, weil die App im Hintergrund war.';

  @override
  String get universalPowerSendOneCode => 'Einen Code senden';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Stoppen, sobald das Gerät reagiert.';

  @override
  String get iconNamePlay => 'Wiedergabe';

  @override
  String get iconNamePause => 'Pause';

  @override
  String get iconNameStop => 'Stopp';

  @override
  String get iconNameFastForward => 'Vorspulen';

  @override
  String get iconNameRewind => 'Zurückspulen';

  @override
  String get iconNameSkipNext => 'Nächster Titel';

  @override
  String get iconNameSkipPrevious => 'Vorheriger Titel';

  @override
  String get iconNameReplay => 'Wiederholen';

  @override
  String get iconNameForward10S => 'Vorwärts 10s';

  @override
  String get iconNameForward30S => 'Vorwärts 30s';

  @override
  String get iconNameReplay10S => 'Wiederholen 10s';

  @override
  String get iconNameReplay30S => 'Wiederholen 30s';

  @override
  String get iconNameRecord => 'Aufnehmen';

  @override
  String get iconNameRecordAlt => 'Aufnehmen Alt';

  @override
  String get iconNameEject => 'Auswerfen';

  @override
  String get iconNameShuffle => 'Zufall';

  @override
  String get iconNameRepeat => 'Wiederholen';

  @override
  String get iconNameRepeatOne => 'Einmal wiederholen';

  @override
  String get iconNameVolumeUp => 'Lauter';

  @override
  String get iconNameVolumeDown => 'Leiser';

  @override
  String get iconNameVolumeOff => 'Ton aus';

  @override
  String get iconNameMute => 'Stumm';

  @override
  String get iconNameSpeaker => 'Lautsprecher';

  @override
  String get iconNameSurroundSound => 'Surround';

  @override
  String get iconNameEqualizer => 'Equalizer';

  @override
  String get iconNameAudio => 'Audio';

  @override
  String get iconNameMicrophone => 'Mikrofon';

  @override
  String get iconNameMicOff => 'Mikro aus';

  @override
  String get iconNameUp => 'Hoch';

  @override
  String get iconNameDown => 'Runter';

  @override
  String get iconNameLeft => 'Links';

  @override
  String get iconNameRight => 'Rechts';

  @override
  String get iconNameArrowUp => 'Pfeil hoch';

  @override
  String get iconNameArrowDown => 'Pfeil runter';

  @override
  String get iconNameArrowLeft => 'Pfeil links';

  @override
  String get iconNameArrowRight => 'Pfeil rechts';

  @override
  String get iconNameNavigation => 'Navigation';

  @override
  String get iconNameChevronLeft => 'Chevron links';

  @override
  String get iconNameChevronRight => 'Chevron rechts';

  @override
  String get iconNameExpandLess => 'Weniger ausklappen';

  @override
  String get iconNameExpandMore => 'Mehr ausklappen';

  @override
  String get iconNameCollapse => 'Einklappen';

  @override
  String get iconNameExpand => 'Ausklappen';

  @override
  String get iconNameCircleUp => 'Kreis hoch';

  @override
  String get iconNameCircleDown => 'Kreis runter';

  @override
  String get iconNameCircleLeft => 'Kreis links';

  @override
  String get iconNameCircleRight => 'Kreis rechts';

  @override
  String get iconNameOkSelect => 'OK/Auswahl';

  @override
  String get iconNameConfirm => 'Bestätigen';

  @override
  String get iconNameCancel => 'Abbrechen';

  @override
  String get iconNameClose => 'Schließen';

  @override
  String get iconNameHome => 'Start';

  @override
  String get iconNameReturn => 'Zurück';

  @override
  String get iconNameExit => 'Beenden';

  @override
  String get iconNameUndo => 'Rückgängig';

  @override
  String get iconNameRedo => 'Wiederholen';

  @override
  String get iconNamePower => 'Ein/Aus';

  @override
  String get iconNamePowerAlt => 'Ein/Aus alt';

  @override
  String get iconNamePowerOff => 'Ausschalten';

  @override
  String get iconNameOn => 'Ein';

  @override
  String get iconNameOff => 'Aus';

  @override
  String get iconNameToggleOn => 'Schalter ein';

  @override
  String get iconNameToggleOff => 'Schalter aus';

  @override
  String get iconNameRestart => 'Neustart';

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
  String get iconNameOne => 'Eins';

  @override
  String get iconNameTwo => 'Zwei';

  @override
  String get iconNameThree => 'Drei';

  @override
  String get iconNameFour => 'Vier';

  @override
  String get iconNameFive => 'Fünf';

  @override
  String get iconNameSix => 'Sechs';

  @override
  String get iconNamePlus => 'Plus';

  @override
  String get iconNameMinus => 'Minus';

  @override
  String get iconNameAddCircle => 'Kreis hinzufügen';

  @override
  String get iconNameRemoveCircle => 'Kreis entfernen';

  @override
  String get iconNameSettings => 'Einstellungen';

  @override
  String get iconNameMenu => 'Menü';

  @override
  String get iconNameMoreVertical => 'Mehr vertikal';

  @override
  String get iconNameMoreHorizontal => 'Mehr horizontal';

  @override
  String get iconNameTune => 'Anpassen';

  @override
  String get iconNameRemoteSettings => 'Fernbed.-Einstellungen';

  @override
  String get iconNameInfo => 'Info';

  @override
  String get iconNameInfoOutline => 'Info Kontur';

  @override
  String get iconNameHelp => 'Hilfe';

  @override
  String get iconNameHelpOutline => 'Hilfe Kontur';

  @override
  String get iconNameList => 'Liste';

  @override
  String get iconNameViewList => 'Listenansicht';

  @override
  String get iconNameViewGrid => 'Rasteransicht';

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
  String get iconNameBrightnessHigh => 'Helligkeit hoch';

  @override
  String get iconNameBrightnessMedium => 'Helligkeit mittel';

  @override
  String get iconNameBrightnessLow => 'Helligkeit niedrig';

  @override
  String get iconNameAutoBrightness => 'Auto-Helligkeit';

  @override
  String get iconNameLightMode => 'Heller Modus';

  @override
  String get iconNameDarkMode => 'Dunkler Modus';

  @override
  String get iconNameContrast => 'Kontrast';

  @override
  String get iconNameHdrOn => 'HDR ein';

  @override
  String get iconNameHdrOff => 'HDR aus';

  @override
  String get iconNameAspectRatio => 'Seitenverhältnis';

  @override
  String get iconNameCrop => 'Zuschneiden';

  @override
  String get iconNameZoomIn => 'Vergrößern';

  @override
  String get iconNameZoomOut => 'Verkleinern';

  @override
  String get iconNameFullscreen => 'Vollbild';

  @override
  String get iconNameExitFullscreen => 'Vollbild beenden';

  @override
  String get iconNameFitScreen => 'An Bildschirm';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'Frei zuschneiden';

  @override
  String get iconNameInput => 'Eingang';

  @override
  String get iconNameCable => 'Kabel';

  @override
  String get iconNameCast => 'Cast';

  @override
  String get iconNameCastConnected => 'Cast verbunden';

  @override
  String get iconNameScreenShare => 'Bildschirm teilen';

  @override
  String get iconNameBluetooth => 'Bluetooth';

  @override
  String get iconNameWifi => 'WLAN';

  @override
  String get iconNameRouter => 'Router';

  @override
  String get iconNameMemory => 'Speicher';

  @override
  String get iconNameGameConsole => 'Spielkonsole';

  @override
  String get iconNameGaming => 'Gaming';

  @override
  String get iconNameMedia => 'Medien';

  @override
  String get iconNameMusicQueue => 'Musikwarteschlange';

  @override
  String get iconNameVideoLibrary => 'Videobibliothek';

  @override
  String get iconNamePhotoLibrary => 'Fotobibliothek';

  @override
  String get iconNameComponent => 'Komponente';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => 'Composite';

  @override
  String get iconNameAntenna => 'Antenne';

  @override
  String get iconNameFavorite => 'Favorit';

  @override
  String get iconNameFavoriteOutline => 'Favorit Kontur';

  @override
  String get iconNameStar => 'Stern';

  @override
  String get iconNameStarOutline => 'Stern Kontur';

  @override
  String get iconNameBookmark => 'Lesezeichen';

  @override
  String get iconNameBookmarkOutline => 'Lesezeichen Kontur';

  @override
  String get iconNameFlag => 'Flagge';

  @override
  String get iconNameCheck => 'Häkchen';

  @override
  String get iconNameDone => 'Fertig';

  @override
  String get iconNameDoneAll => 'Alle fertig';

  @override
  String get iconNameSchedule => 'Zeitplan';

  @override
  String get iconNameTimer => 'Timer';

  @override
  String get iconNameTime => 'Zeit';

  @override
  String get iconNameAlarm => 'Alarm';

  @override
  String get iconNameNotifications => 'Benachrichtigungen';

  @override
  String get iconNameLock => 'Sperren';

  @override
  String get iconNameUnlock => 'Entsperren';

  @override
  String get iconNameLight => 'Licht';

  @override
  String get iconNameLightOutline => 'Licht Outline';

  @override
  String get iconNameWarmLight => 'Warmlicht';

  @override
  String get iconNameSunny => 'Sonnig';

  @override
  String get iconNameCloudy => 'Bewölkt';

  @override
  String get iconNameNight => 'Nacht';

  @override
  String get iconNameFlare => 'Leuchten';

  @override
  String get iconNameGradient => 'Verlauf';

  @override
  String get iconNameInvertColors => 'Farben invertieren';

  @override
  String get iconNamePalette => 'Palette';

  @override
  String get iconNameColor => 'Farbe';

  @override
  String get iconNameTonality => 'Tonwert';

  @override
  String get iconNameSearch => 'Suchen';

  @override
  String get iconNameRefresh => 'Aktualisieren';

  @override
  String get iconNameSync => 'Sync';

  @override
  String get iconNameUpdate => 'Aktualisieren';

  @override
  String get iconNameDownload => 'Download';

  @override
  String get iconNameUpload => 'Upload';

  @override
  String get iconNameCloud => 'Cloud';

  @override
  String get iconNameFolder => 'Ordner';

  @override
  String get iconNameDelete => 'Löschen';

  @override
  String get iconNameEdit => 'Bearbeiten';

  @override
  String get iconNameSave => 'Speichern';

  @override
  String get iconNameShare => 'Teilen';

  @override
  String get iconNamePrint => 'Drucken';

  @override
  String get iconNameLanguage => 'Sprache';

  @override
  String get iconNameTranslate => 'Übersetzen';

  @override
  String get iconNameMicNone => 'Kein Mikro';

  @override
  String get iconNameSubtitles => 'Untertitel';

  @override
  String get iconNameClosedCaption => 'Untertitel CC';

  @override
  String get iconNameMusic => 'Musik';

  @override
  String get iconNameMovie => 'Film';

  @override
  String get iconNameTheater => 'Theater';

  @override
  String get iconNameLiveTv => 'Live-TV';

  @override
  String get iconNameRadio => 'Radio';

  @override
  String get iconNameCamera => 'Kamera';

  @override
  String get iconNameVideoCamera => 'Videokamera';

  @override
  String get iconNamePhotoCamera => 'Fotokamera';

  @override
  String get iconNameSlowMotion => 'Zeitlupe';

  @override
  String get iconNameSpeed => 'Geschwindigkeit';

  @override
  String get iconNameVideoSettings => 'Videoeinstellungen';

  @override
  String get iconNameAudioTrack => 'Audiospur';

  @override
  String get iconNameGraphicEq => 'Grafik-EQ';

  @override
  String get iconNameMusicVideo => 'Musikvideo';

  @override
  String get iconNamePlaylist => 'Playlist';

  @override
  String get iconNameQueue => 'Warteschlange';

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
  String get iconNameHashFa => 'Raute # FA';

  @override
  String get iconNamePercentFa => 'Prozent % FA';

  @override
  String get iconNameDivideFa => 'Teilen ÷ FA';

  @override
  String get iconNameMultiplyFa => 'Multiplizieren × FA';

  @override
  String get iconNameEqualsFa => 'Gleich = FA';

  @override
  String get iconNameNotEqualFa => 'Ungleich ≠ FA';

  @override
  String get iconNameGreaterThanFa => 'Größer als > FA';

  @override
  String get iconNameLessThanFa => 'Kleiner als < FA';

  @override
  String get iconNameAsteriskFa => 'Sternchen * FA';

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
  String get iconNamePlayFa => 'Wiedergabe FA';

  @override
  String get iconNamePauseFa => 'Pause FA';

  @override
  String get iconNameStopFa => 'Stopp FA';

  @override
  String get iconNamePlayFaOutline => 'Wiedergabe FA Kontur';

  @override
  String get iconNamePauseFaOutline => 'Pause FA Kontur';

  @override
  String get iconNameStopFaOutline => 'Stopp FA Kontur';

  @override
  String get iconNameBackwardFa => 'Rückwärts FA';

  @override
  String get iconNameForwardFa => 'Vorwärts FA';

  @override
  String get iconNamePreviousFa => 'Vorherig FA';

  @override
  String get iconNameNextFa => 'Nächste FA';

  @override
  String get iconNameRewindFa => 'Zurückspulen FA';

  @override
  String get iconNameFastForwardFa => 'Vorspulen FA';

  @override
  String get iconNameRepeatFa => 'Wiederholen FA';

  @override
  String get iconNameShuffleFa => 'Zufall FA';

  @override
  String get iconNameEjectFa => 'Auswerfen FA';

  @override
  String get iconNameFilmFa => 'Film FA';

  @override
  String get iconNameVideoFa => 'Video FA';

  @override
  String get iconNameMusicFa => 'Musik FA';

  @override
  String get iconNameMicrophoneFa => 'Mikrofon FA';

  @override
  String get iconNameCameraFa => 'Kamera FA';

  @override
  String get iconNameCameraRetroFa => 'Retro-Kamera FA';

  @override
  String get iconNameVolumeHighFa => 'Lautstärke hoch FA';

  @override
  String get iconNameVolumeLowFa => 'Lautstärke niedrig FA';

  @override
  String get iconNameVolumeOffFa => 'Ton aus FA';

  @override
  String get iconNameMuteFa => 'Stumm FA';

  @override
  String get iconNameMicMuteFa => 'Mikro stumm FA';

  @override
  String get iconNameHeadphonesFa => 'Kopfhörer FA';

  @override
  String get iconNameSpeakerFa => 'Lautsprecher FA';

  @override
  String get iconNameUpFa => 'Hoch FA';

  @override
  String get iconNameDownFa => 'Runter FA';

  @override
  String get iconNameLeftFa => 'Links FA';

  @override
  String get iconNameRightFa => 'Rechts FA';

  @override
  String get iconNameUpFaOutline => 'Hoch FA Kontur';

  @override
  String get iconNameDownFaOutline => 'Runter FA Kontur';

  @override
  String get iconNameLeftFaOutline => 'Links FA Kontur';

  @override
  String get iconNameRightFaOutline => 'Rechts FA Kontur';

  @override
  String get iconNameArrowUpFa => 'Pfeil hoch FA';

  @override
  String get iconNameArrowDownFa => 'Pfeil runter FA';

  @override
  String get iconNameArrowLeftFa => 'Pfeil links FA';

  @override
  String get iconNameArrowRightFa => 'Pfeil rechts FA';

  @override
  String get iconNameChevronUpFa => 'Chevron hoch FA';

  @override
  String get iconNameChevronDownFa => 'Chevron runter FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron links FA';

  @override
  String get iconNameChevronRightFa => 'Chevron rechts FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Kontur';

  @override
  String get iconNameCheckFa => 'Häkchen FA';

  @override
  String get iconNameCloseFa => 'Schließen FA';

  @override
  String get iconNameCloseCircleFa => 'Schließen Circle FA';

  @override
  String get iconNameHomeFa => 'Start FA';

  @override
  String get iconNameUndoFa => 'Rückgängig FA';

  @override
  String get iconNameRedoFa => 'Wiederholen FA';

  @override
  String get iconNameRotateFa => 'Drehen FA';

  @override
  String get iconNameSearchFa => 'Suchen FA';

  @override
  String get iconNameRefreshFa => 'Aktualisieren FA';

  @override
  String get iconNamePowerOffFa => 'Ausschalten FA';

  @override
  String get iconNamePlugFa => 'Stecker FA';

  @override
  String get iconNameToggleOnFa => 'Schalter ein FA';

  @override
  String get iconNameToggleOffFa => 'Schalter aus FA';

  @override
  String get iconNameSettingsFa => 'Einstellungen FA';

  @override
  String get iconNameSettingsAltFa => 'Einstellungen alt FA';

  @override
  String get iconNameMenuFa => 'Menü FA';

  @override
  String get iconNameMoreFa => 'More FA';

  @override
  String get iconNameMoreVerticalFa => 'Mehr vertikal FA';

  @override
  String get iconNameInfoFa => 'Info FA';

  @override
  String get iconNameInfoFaOutline => 'Info FA Kontur';

  @override
  String get iconNameHelpFa => 'Hilfe FA';

  @override
  String get iconNameHelpFaOutline => 'Hilfe FA Kontur';

  @override
  String get iconNameListFa => 'Liste FA';

  @override
  String get iconNameGridFa => 'Raster FA';

  @override
  String get iconNameSlidersFa => 'Regler FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'Monitor FA';

  @override
  String get iconNameDesktopFa => 'Desktop FA';

  @override
  String get iconNameBrightnessFa => 'Helligkeit FA';

  @override
  String get iconNameNightModeFa => 'Nachtmodus FA';

  @override
  String get iconNameLightFa => 'Licht FA';

  @override
  String get iconNameLightFaOutline => 'Licht FA Kontur';

  @override
  String get iconNameFlashFa => 'Blitz FA';

  @override
  String get iconNameFullscreenFa => 'Vollbild FA';

  @override
  String get iconNameExitFullscreenFa => 'Vollbild beenden FA';

  @override
  String get iconNameZoomInFa => 'Vergrößern FA';

  @override
  String get iconNameZoomOutFa => 'Verkleinern FA';

  @override
  String get iconNameSubtitlesFa => 'Untertitel FA';

  @override
  String get iconNamePictureInPictureFa => 'Bild in Bild FA';

  @override
  String get iconNameColorFa => 'Farbe FA';

  @override
  String get iconNamePaintFa => 'Paint FA';

  @override
  String get iconNameInputFa => 'Eingang FA';

  @override
  String get iconNameWifiFa => 'WLAN FA';

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
  String get iconNameSatelliteFa => 'Satellit FA';

  @override
  String get iconNameAntennaFa => 'Antenne FA';

  @override
  String get iconNameNetworkFa => 'Netzwerk FA';

  @override
  String get iconNameCloudFa => 'Cloud FA';

  @override
  String get iconNameStarFa => 'Stern FA';

  @override
  String get iconNameStarFaOutline => 'Stern FA Kontur';

  @override
  String get iconNameHeartFa => 'Herz FA';

  @override
  String get iconNameHeartFaOutline => 'Herz FA Kontur';

  @override
  String get iconNameBookmarkFa => 'Lesezeichen FA';

  @override
  String get iconNameBookmarkFaOutline => 'Lesezeichen FA Kontur';

  @override
  String get iconNameFlagFa => 'Flagge FA';

  @override
  String get iconNameClockFa => 'Uhr FA';

  @override
  String get iconNameClockFaOutline => 'Uhr FA Kontur';

  @override
  String get iconNameBellFa => 'Glocke FA';

  @override
  String get iconNameBellFaOutline => 'Glocke FA Kontur';

  @override
  String get iconNameTimerFa => 'Timer FA';

  @override
  String get iconNameLockFa => 'Sperren FA';

  @override
  String get iconNameUnlockFa => 'Entsperren FA';

  @override
  String get iconNameGalleryFa => 'Galerie FA';

  @override
  String get iconNameImagesFa => 'Bilder FA';

  @override
  String get iconNameImageFa => 'Bild FA';

  @override
  String get iconNameVideoFileFa => 'Videodatei FA';

  @override
  String get iconNameAudioFileFa => 'Audiodatei FA';

  @override
  String get iconNamePlayOutlineFa => 'Wiedergabe Kontur FA';

  @override
  String get iconNamePlaySimpleFa => 'Wiedergabe Simple FA';

  @override
  String get iconNamePauseSimpleFa => 'Pause Simple FA';

  @override
  String get iconNameStopSimpleFa => 'Stopp Simple FA';

  @override
  String get iconNameRecordFa => 'Aufnehmen FA';

  @override
  String get iconNameStopCircleFa => 'Stopp Circle FA';

  @override
  String get iconNameLoadingFa => 'Lädt FA';

  @override
  String get iconNameTextFa => 'Text FA';

  @override
  String get iconNameTextSizeFa => 'Textgröße FA';

  @override
  String get iconNameLanguageFa => 'Sprache FA';

  @override
  String get iconNameGlobeFa => 'Globus FA';

  @override
  String get iconNameSubtitlesAltFa => 'Untertitel alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Untertitel alt Kontur FA';

  @override
  String get iconNameChannelUpFa => 'Kanal hoch FA';

  @override
  String get iconNameChannelDownFa => 'Kanal runter FA';

  @override
  String get iconNamePageUpFa => 'Seite hoch FA';

  @override
  String get iconNamePageDownFa => 'Seite runter FA';

  @override
  String get iconNameGuideFa => 'Guide FA';

  @override
  String get iconNameGridViewFa => 'Rasteransicht FA';

  @override
  String get iconNameGridAltFa => 'Raster Alt FA';

  @override
  String get iconNameScheduleFa => 'Zeitplan FA';

  @override
  String get iconNameCalendarFa => 'Kalender FA';

  @override
  String get iconNameRedButtonFa => 'Rote Taste FA';

  @override
  String get iconNameButtonOutlineFa => 'Tastenkontur FA';

  @override
  String get iconNameSquareButtonFa => 'Quadrattaste FA';

  @override
  String get iconNameSquareOutlineFa => 'Square Kontur FA';

  @override
  String get iconNameDotCircleFa => 'Punktkreis FA';

  @override
  String get iconNameToolsFa => 'Werkzeuge FA';

  @override
  String get iconNameScrewdriverFa => 'Schraubendreher FA';

  @override
  String get iconNameHammerFa => 'Hammer FA';

  @override
  String get iconNameToolboxFa => 'Werkzeugkasten FA';

  @override
  String get iconNameCogFa => 'Zahnrad FA';

  @override
  String get iconNameAdjustFa => 'Anpassen FA';

  @override
  String get iconNameFilterFa => 'Filter FA';

  @override
  String get iconNameSortDownFa => 'Absteigend FA';

  @override
  String get iconNameSortUpFa => 'Aufsteigend FA';

  @override
  String get iconNameSleepFa => 'Schlaf FA';

  @override
  String get iconNameTimerStartFa => 'Timer Start FA';

  @override
  String get iconNameTimerHalfFa => 'Timer Halb FA';

  @override
  String get iconNameTimerEndFa => 'Timer Ende FA';

  @override
  String get iconNameStopwatchFa => 'Stoppuhr FA';

  @override
  String get iconNameAlarmFa => 'Alarm FA';

  @override
  String get iconNameCropAltFa => 'Zuschneiden Alt FA';

  @override
  String get iconNameCropFa => 'Zuschneiden FA';

  @override
  String get iconNameSquareFullFa => 'Square Full FA';

  @override
  String get iconNameFullscreenAltFa => 'Vollbild alt FA';

  @override
  String get iconNameZoomPlusFa => 'Plus-Zoom FA';

  @override
  String get iconNameZoomMinusFa => 'Minus-Zoom FA';

  @override
  String get iconNameMusicNoteFa => 'Musiknote FA';

  @override
  String get iconNameCdFa => 'CD FA';

  @override
  String get iconNameVinylFa => 'Vinyl FA';

  @override
  String get iconNameRssFa => 'RSS FA';

  @override
  String get iconNameMagicFa => 'Magie FA';

  @override
  String get iconNameFingerprintFa => 'Fingerabdruck FA';

  @override
  String get iconNameUserFa => 'Nutzer FA';

  @override
  String get iconNameUsersFa => 'Nutzer FA';

  @override
  String get iconNameChildModeFa => 'Kindermodus FA';

  @override
  String get iconNameCastFa => 'Cast FA';

  @override
  String get iconNameStreamFa => 'Stream FA';

  @override
  String get iconNameSignalFa => 'Signal FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => 'Kreispfeil hoch FA';

  @override
  String get iconNameCircleArrowDownFa => 'Kreispfeil runter FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Kreispfeil links FA';

  @override
  String get iconNameCircleArrowRightFa => 'Kreispfeil rechts FA';

  @override
  String get iconNameLongArrowUpFa => 'Langer Pfeil hoch FA';

  @override
  String get iconNameLongArrowDownFa => 'Langer Pfeil runter FA';

  @override
  String get iconNameLongArrowLeftFa => 'Langer Pfeil links FA';

  @override
  String get iconNameLongArrowRightFa => 'Langer Pfeil rechts FA';

  @override
  String get iconNamePlusFa => 'Plus FA';

  @override
  String get iconNameMinusFa => 'Minus FA';

  @override
  String get iconNamePlusCircleFa => 'Plus-Kreis FA';

  @override
  String get iconNameMinusCircleFa => 'Minus-Kreis FA';

  @override
  String get iconNamePlusSquareFa => 'Plus-Quadrat FA';

  @override
  String get iconNameMinusSquareFa => 'Minus-Quadrat FA';

  @override
  String get iconNameTimesFa => 'Mal FA';

  @override
  String get iconNameTimesCircleFa => 'Mal-Kreis FA';

  @override
  String get iconNameBatteryFullFa => 'Akku voll FA';

  @override
  String get iconNameBattery34Fa => 'Akku 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'Akku halb FA';

  @override
  String get iconNameBattery14Fa => 'Akku 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'Akku leer FA';

  @override
  String get iconNameChargingFa => 'Laden FA';

  @override
  String get iconNameCloudSunFa => 'Wolke Sonne FA';

  @override
  String get iconNameCloudMoonFa => 'Wolke Mond FA';

  @override
  String get iconNameRainFa => 'Regen FA';

  @override
  String get iconNameSnowflakeFa => 'Schneeflocke FA';

  @override
  String get iconNameFireFa => 'Feuer FA';

  @override
  String get iconNameTemperatureFa => 'Temperatur FA';

  @override
  String get iconNameBoxFa => 'Box FA';

  @override
  String get iconNameGiftFa => 'Geschenk FA';

  @override
  String get iconNameTrophyFa => 'Pokal FA';

  @override
  String get iconNameCrownFa => 'Krone FA';

  @override
  String get iconNameGemFa => 'Edelstein FA';

  @override
  String get unknownLabel => 'Unbekannt';

  @override
  String get selectedFilesLabel => 'gewählte Datei(en)';

  @override
  String get folderNotFoundOrInaccessible =>
      'Ordner nicht gefunden oder nicht zugänglich.';

  @override
  String get importedRemoteDefaultName => 'ImportierteFernbedienung';

  @override
  String get demoRemoteName => 'Demo-Fernbedienung';

  @override
  String get protocolFieldsInvalid =>
      'Fülle die Pflichtfelder des Protokolls aus und stelle sicher, dass die Frequenz falls gesetzt 15k bis 60k ist.';

  @override
  String get unknownProtocolSelected => 'Unbekanntes Protokoll gewählt.';

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
}
