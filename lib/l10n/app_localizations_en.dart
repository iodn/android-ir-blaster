// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Loading…';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get failedToStart => 'Failed to start';

  @override
  String get retry => 'Retry';

  @override
  String get quickTilePower => 'Power';

  @override
  String get quickTileMute => 'Mute';

  @override
  String get quickTileVolumeUp => 'Vol +';

  @override
  String get quickTileVolumeDown => 'Vol -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'USB IR adapter detected. Allow USB access to send commands.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'USB access was denied. Request permission again and allow access to send commands.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'USB access is allowed, but the adapter is not ready yet.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Could not connect to the USB adapter despite having permission. Unplug it, reconnect it, and try again.';

  @override
  String get homeUsbReadyMessage => 'USB IR adapter ready.';

  @override
  String get homeUsbNoDeviceMessage =>
      'This phone has no built-in IR transmitter, and no supported USB IR adapter is connected.';

  @override
  String get homeUsbOptionPlugIn =>
      'Connect a supported USB IR adapter and allow access.';

  @override
  String get homeUsbOptionReady => 'Ready to send.';

  @override
  String get homeUsbOptionPermissionRequired => 'Connected. Allow USB access.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Access denied. Request permission again.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Access allowed. Waiting for the adapter.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Connection failed. Reconnect the adapter.';

  @override
  String get homeHardwareBannerNoInternal =>
      'No built-in IR transmitter. Use a compatible USB IR adapter or an audio-to-IR accessory.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Connected. Allow USB access.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Access denied. Request permission again.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Access allowed. Waiting for the adapter.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Connection failed. Reconnect the adapter.';

  @override
  String get homeHardwareBannerReady => 'Ready to send.';

  @override
  String get homeHardwareRequiredTitle => 'IR hardware needed';

  @override
  String get homeUsbDongleRecommended => 'USB IR adapter (recommended)';

  @override
  String get homeAudioAdapterAlternative => 'Audio IR adapter';

  @override
  String get homeAudioAdapterDescription =>
      'Needs an audio-to-IR adapter. In Settings, choose Audio (1 LED or 2 LEDs) and raise media volume.';

  @override
  String get close => 'Close';

  @override
  String get homeChooseTransmitter => 'Choose transmitter';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get homeUsbPermissionSentApprove =>
      'Permission requested. Allow USB access in the Android prompt.';

  @override
  String get homeUsbDongleNotDetected =>
      'No supported USB IR adapter found. Connect it and try again.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Could not request USB access. Please try again.';

  @override
  String get working => 'Working…';

  @override
  String get requestUsbPermission => 'Request USB access';

  @override
  String get homeHardwareTip =>
      'You can set up your remotes now. IR hardware is only needed to send commands.';

  @override
  String get homeNoIrTransmitterTitle => 'No IR transmitter available';

  @override
  String get homeHardwareRequiredBody =>
      'You can create and organize remotes without an IR transmitter. To control a device, use one of the options below.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'You can still create, import, and organize remotes.';

  @override
  String get homeWaysToUseIrBlaster => 'Hardware options';

  @override
  String get homeBuiltInIrOptionTitle => 'Built-in IR transmitter';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Some phones have an IR transmitter built in. This phone does not.';

  @override
  String get homeBuiltInIrUnavailable => 'Not built into this phone';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'Audio-to-IR adapter';

  @override
  String get homeContinueWithoutHardware => 'Continue without sending';

  @override
  String get homeHowItWorks => 'How it works';

  @override
  String get settingsNavLabel => 'Settings';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get remotesNavLabel => 'Remotes';

  @override
  String get macrosNavLabel => 'Macros';

  @override
  String get signalTesterNavLabel => 'Signal Tester';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get remoteNoIrEmitterTitle => 'IR emitter unavailable';

  @override
  String get remoteNoIrEmitterMessage => 'No usable IR emitter was detected.';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'To send signals, use built-in IR or a compatible external emitter.';

  @override
  String get remoteDismiss => 'Keep browsing';

  @override
  String get remoteClose => 'Close app';

  @override
  String remoteFailedToSend(Object error) {
    return 'Failed to send IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Failed to start loop: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Loop stopped (send failed): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Looping \"$title\". Tap Stop in the top bar to stop.';
  }

  @override
  String get remoteLoopStopped => 'Loop stopped.';

  @override
  String get remoteUpdatedNotFound =>
      'Remote updated on screen. It was not found in the saved list.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Updated \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Could not delete the remote: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'This remote was not found in your saved remotes.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Deleted “$name”.';
  }

  @override
  String get buttonFallbackTitle => 'Button';

  @override
  String get imageFallbackTitle => 'Image';

  @override
  String get noBrowserAvailable => 'No browser available';

  @override
  String failedToOpen(Object error) {
    return 'Failed to open: $error';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get settingsRestoreDemoTitle => 'Restore demo remotes?';

  @override
  String get settingsRestoreDemoMessage =>
      'This will replace your current remotes with the built-in demo remotes. A backup is recommended if you want to keep your current list.';

  @override
  String get settingsRestoreDemoConfirm => 'Restore demo';

  @override
  String get settingsDemoRemotesRestored => 'Demo remotes restored.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Delete all remotes?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'This removes every remote from this device. This action can’t be undone.';

  @override
  String get settingsDeleteAllConfirm => 'Delete all';

  @override
  String get settingsAllRemotesDeleted => 'All remotes deleted.';

  @override
  String get themeAuto => 'Auto Theme';

  @override
  String get themeLight => 'Light Theme';

  @override
  String get themeDark => 'Dark Theme';

  @override
  String get themeDescAuto => 'Follows your device settings';

  @override
  String get themeDescLight => 'Always bright and clear';

  @override
  String get themeDescDark => 'Easy on the eyes';

  @override
  String get themeHintAuto =>
      'Theme automatically switches when you change your device settings between light and dark mode';

  @override
  String get themeHintLight =>
      'Perfect for daytime use and well-lit environments';

  @override
  String get themeHintDark =>
      'Reduces eye strain in low-light conditions and saves battery on OLED screens';

  @override
  String get supportDevelopmentTitle => 'Support Development';

  @override
  String get supportDevelopmentSubtitle =>
      'Keep IR Blaster maintained and hardware-compatible';

  @override
  String get supportDevelopmentBody =>
      'No ads, no tracking, no locked features. Your support funds protocol work, USB dongle support, and better compatibility across devices.';

  @override
  String get donate => 'Donate';

  @override
  String get starRepo => 'Star Repo';

  @override
  String get repositoryLinkCopied => 'Repository link copied';

  @override
  String get supportPillLocalOnly => 'Local-only';

  @override
  String get supportPillNoTracking => 'No tracking';

  @override
  String get supportPillHardwareAware => 'Hardware-aware';

  @override
  String get supportPillOpenSource => 'Open-source';

  @override
  String get appearanceTitle => 'Appearance';

  @override
  String get appearanceSubtitle => 'Customize your visual experience';

  @override
  String get localizationTitle => 'Localization';

  @override
  String get localizationSubtitle => 'App language and translation behavior';

  @override
  String localizationAutoUsing(Object language) {
    return 'Auto: using $language';
  }

  @override
  String get localizationAutoDescription =>
      'The app follows your device language when possible.';

  @override
  String get localizationManualDescription =>
      'The app language is manually overridden.';

  @override
  String get useSystemLanguageTitle => 'Use system language';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Following your device language: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Use the language selected below instead of the device default.';

  @override
  String get chooseAppLanguage => 'Choose app language';

  @override
  String get languagePickerDisabledHint =>
      'Turn off system language to choose a language manually.';

  @override
  String get searchLanguages => 'Search languages';

  @override
  String get noLanguagesFound => 'No matching languages';

  @override
  String get localizationHint =>
      'When system language is enabled, the app follows your device locale and falls back to English if a translation is unavailable. Turn it off to lock the app to a specific language.';

  @override
  String get appLanguageTitle => 'App language';

  @override
  String get appLanguageHint =>
      'Auto follows your device language. Choose English or French here to override it for the app only.';

  @override
  String get languageAuto => 'Auto (system)';

  @override
  String get languageAutoDescription =>
      'Follow your device language automatically';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageEnglishDescription =>
      'Force the app to always use English';

  @override
  String get languageFrench => 'French';

  @override
  String get languageFrenchDescription => 'Force the app to always use French';

  @override
  String get languageAutoShort => 'Auto';

  @override
  String get languageEnglishShort => 'English';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'Use dynamic colors';

  @override
  String get themeChoiceAuto => 'Auto';

  @override
  String get themeChoiceLight => 'Light';

  @override
  String get themeChoiceDark => 'Dark';

  @override
  String get irTransmitterTitle => 'IR Transmitter';

  @override
  String get irTransmitterSubtitle => 'Choose which hardware sends IR commands';

  @override
  String get learningModeEntryTitle => 'Learning Mode';

  @override
  String get learningModeEntrySubtitle =>
      'Copy a button\'s IR signal from your remote.';

  @override
  String get learningModeTitle => 'Learning Mode';

  @override
  String get learningModeHeroTitle => 'Learn a remote button cleanly';

  @override
  String get learningModeHeroSubtitle =>
      'Set up your receiver, prepare the original remote, capture one command, then review it before saving it into a remote.';

  @override
  String get learningModeReadyBadge => 'Receiver ready';

  @override
  String get learningModeNeedsPermissionBadge => 'USB permission needed';

  @override
  String get learningModeSetupBadge => 'Receiver setup needed';

  @override
  String get learningModeNoReceiverBadge => 'No learning receiver';

  @override
  String get learningModeCheckingBadge => 'Checking hardware';

  @override
  String get learningModeFourStepFlow => '4-step guided flow';

  @override
  String get learningModeSaveAnywhereBadge => 'Review before save';

  @override
  String get learningModeGuideTitle => 'Pick up where capture should happen';

  @override
  String get learningModeStepHardwareShort => 'Hardware';

  @override
  String get learningModeStepPrepareShort => 'Prepare';

  @override
  String get learningModeStepCaptureShort => 'Capture';

  @override
  String get learningModeStepReviewShort => 'Review';

  @override
  String get learningModeStepHardwareTitle => 'Check receiver hardware';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Make sure a compatible learning receiver is attached and authorized before starting.';

  @override
  String get learningModeCurrentSenderLabel => 'Current transmitter';

  @override
  String get learningModeReceiverStatusLabel => 'Learning status';

  @override
  String get learningModeCheckingHardwareBody =>
      'Checking the transmitter and IR receiver.';

  @override
  String get learningModeHardwareReadyBody =>
      'A USB IR dongle is attached and initialized. This is the right place to start the learning flow once capture wiring is connected.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Allow access to the USB dongle, then start learning.';

  @override
  String get learningModeHardwareSetupBody =>
      'The receiver is not ready. Check its setup or reconnect it, then try again.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Connect a compatible IR receiver to learn signals.';

  @override
  String get learningModeRefreshHardware => 'Check receiver';

  @override
  String get learningModeHardwareTipTitle => 'Best placement';

  @override
  String get learningModeHardwareTipBody =>
      'Learning Mode lives under IR Transmitter because it depends on hardware availability and is used less often than sending remotes.';

  @override
  String get learningModeStepPrepareTitle => 'Prepare the original remote';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Decide what you are learning, then keep the original remote steady and close to the receiver.';

  @override
  String get learningModeButtonNameLabel => 'Button name';

  @override
  String get learningModeButtonNameHint => 'For example: Power, HDMI 1, Menu';

  @override
  String get learningModeSinglePress => 'Single press';

  @override
  String get learningModeHoldButton => 'Hold button';

  @override
  String get learningModePreparationChecklistTitle => 'Before you capture';

  @override
  String get learningModePreparationItemDistance =>
      'Keep the original remote roughly 2 to 5 cm from the receiver.';

  @override
  String get learningModePreparationItemOneButton =>
      'Learn one button at a time and use a short, clean press first.';

  @override
  String get learningModePreparationItemStill =>
      'Keep both devices steady to avoid noisy or partial captures.';

  @override
  String get learningModeStepCaptureTitle => 'Capture the signal';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Listen for a single command, then lock the result before reviewing it.';

  @override
  String get learningModeCaptureReadyTitle => 'Ready to listen';

  @override
  String get learningModeCaptureReadyBody =>
      'Your hardware state looks good. The capture backend will plug into this step next.';

  @override
  String get learningModeCaptureBlockedTitle => 'Hardware not ready yet';

  @override
  String get learningModeCaptureBlockedBody =>
      'You can still review the flow now, but capture should wait until the receiver is ready.';

  @override
  String get learningModeStartListening => 'Start listening';

  @override
  String get learningModeCaptureStubTitle => 'Capture backend comes next';

  @override
  String get learningModeCaptureStubBody =>
      'This screen is fully scaffolded first so the final capture flow can plug into real hardware states instead of being bolted on later.';

  @override
  String get learningModeCaptureStubMessage =>
      'Learning capture is not wired yet. This screen scaffolds the full flow first.';

  @override
  String get learningModeUnnamedCapture => 'Unnamed capture';

  @override
  String get learningModeStatusCheckingTitle => 'Checking receiver';

  @override
  String get learningModeStatusNoReceiverTitle => 'Receiver not ready';

  @override
  String get learningModeStatusPermissionTitle => 'USB permission required';

  @override
  String get learningModeStatusSetupTitle => 'Receiver needs setup';

  @override
  String get learningModeStatusReadyTitle => 'Ready to learn';

  @override
  String get learningModeStatusListeningTitle => 'Listening for a signal';

  @override
  String get learningModeStatusCapturedTitle => 'Signal captured';

  @override
  String get learningModeStatusReadyBody =>
      'Name the button, point the original remote at the receiver, and start listening when you are ready.';

  @override
  String get learningModeStatusListeningBody =>
      'Point the original remote at the receiver and press the button once.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Signal captured for $buttonName. Replay it to check that your device responds, then save it.';
  }

  @override
  String get learningModeConnectReceiverTitle => 'Connect an IR receiver';

  @override
  String get learningModeConnectReceiverBody =>
      'Learning mode depends on external hardware that can receive IR. Once the receiver is detected and authorized, this page becomes a direct listen, test, and save flow.';

  @override
  String get learningModeListenCardTitle => 'Listen for one button';

  @override
  String get learningModeListenCardBody =>
      'Set a label first if you want, then start listening and press the button on the original remote.';

  @override
  String get learningModeReadyToListenTitle => 'Ready to listen';

  @override
  String get learningModeReadyToListenBody =>
      'Point the original remote at the receiver, then start listening.';

  @override
  String get learningModeListeningNowTitle => 'Listening now';

  @override
  String get learningModeListeningNowBody =>
      'Press the original remote button once. Use preview capture to move through the rest of the scaffold before the real capture backend is wired.';

  @override
  String get learningModePreviewCaptureAction => 'Preview captured signal';

  @override
  String get learningModeCapturedSummary => 'Captured signal';

  @override
  String get learningModeResultActionsTitle => 'Test and save';

  @override
  String get learningModeResultActionsBody =>
      'Replay the signal and check that your device responds before saving the button.';

  @override
  String get learningModeReplayAction => 'Replay';

  @override
  String get learningModeReplayStubMessage =>
      'Replay is not wired yet. This is the UI scaffold for the final learn, test, and save flow.';

  @override
  String get learningModeSaveStubMessage =>
      'Save is not wired yet. The next step is connecting this screen to Create Button and existing remotes.';

  @override
  String get learningModeLearnAnotherAction => 'Learn another button';

  @override
  String get learningModeStepReviewTitle => 'Review and save';

  @override
  String get learningModeStepReviewSubtitle =>
      'Confirm what was learned, then choose where it should live in your remote library.';

  @override
  String get learningModeSaveToExistingRemote => 'Existing remote';

  @override
  String get learningModeCreateNewRemote => 'New remote';

  @override
  String get learningModeProtocolPreviewTitle => 'Protocol preview';

  @override
  String get learningModeProtocolPreviewBody =>
      'Decoded protocol details will appear here once the receiver captures a clean button press.';

  @override
  String get learningModeRawPreviewTitle => 'Raw data';

  @override
  String get learningModeRawPreviewBody =>
      'If decoding is incomplete, the raw timing capture will still be available here for review and saving.';

  @override
  String get learningModeSaveCapture => 'Save capture';

  @override
  String get learningModeReviewTipTitle => 'Where this will go next';

  @override
  String get learningModeReviewTipBody =>
      'The next implementation step should connect this review panel to Create Button and existing remotes so the learned signal drops directly into your library.';

  @override
  String get learningModeFinishPreview => 'Finish preview';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interaction';

  @override
  String get interactionSubtitle => 'Touch feedback and remote layout';

  @override
  String get autoOpenLastRemoteTitle => 'Open last remote at startup';

  @override
  String get autoOpenLastRemoteSubtitle =>
      'Open the most recently used remote when the app starts. The remote list is shown if it is unavailable.';

  @override
  String get hapticFeedbackTitle => 'Haptic feedback';

  @override
  String get hapticFeedbackSubtitle => 'Vibrate on taps and actions';

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
  String get intensity => 'Intensity';

  @override
  String get intensityLight => 'Light';

  @override
  String get intensityMedium => 'Medium';

  @override
  String get intensityStrong => 'Strong';

  @override
  String get remoteButtonMetadataTitle => 'Show button technical labels';

  @override
  String get remoteButtonMetadataSubtitle =>
      'Display protocol, code, and frequency chips on remote buttons.';

  @override
  String get remoteButtonMetadataShown => 'Button technical labels shown.';

  @override
  String get remoteButtonMetadataHidden => 'Button technical labels hidden.';

  @override
  String get flipRemoteDefaultTitle => 'Flip Remote View by default';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Open Remote screens rotated 180° (for bottom-mounted USB dongles).';

  @override
  String get remoteViewFlipped => 'Remote View will open flipped.';

  @override
  String get remoteViewNormal => 'Remote View will open normally.';

  @override
  String get backupTitle => 'Backup';

  @override
  String get backupSubtitle => 'Import/export remotes and macros';

  @override
  String get importBackup => 'Import backup';

  @override
  String get importBackupSubtitle =>
      'Import remotes/macros backup or Flipper Zero, LIRC or IRPLUS files';

  @override
  String get bulkImportFolder => 'Bulk import folder';

  @override
  String get bulkImportFolderSubtitle =>
      'Import multiple remotes from a folder';

  @override
  String get exportBackup => 'Export backup';

  @override
  String get exportBackupSubtitle =>
      'Save remotes + macros as one JSON file to Downloads';

  @override
  String get restoreDemoRemotes => 'Restore demo remotes';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Replace current remotes with the built-in demo';

  @override
  String get deleteAllRemotes => 'Delete all remotes';

  @override
  String get deleteAllRemotesSubtitle => 'Remove every remote from this device';

  @override
  String get backupTip =>
      'Tip: export a backup before large edits. Import supports full backups, legacy remotes-only JSON backups, and Flipper Zero .ir files.';

  @override
  String get aboutTitle => 'About';

  @override
  String get aboutSubtitle => 'App information and open-source details';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Version $version';
  }

  @override
  String get sourceCode => 'Source Code';

  @override
  String get viewOnGitHub => 'View on GitHub';

  @override
  String get repositoryUrlCopied => 'Repository URL copied';

  @override
  String get reportIssue => 'Report Issue';

  @override
  String get reportIssueSubtitle => 'Bug reports & feature requests';

  @override
  String get issuesUrlCopied => 'Issues URL copied';

  @override
  String get license => 'License';

  @override
  String get openSourceLicense => 'Open-source license';

  @override
  String get licenseUrlCopied => 'License URL copied';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Visit our website';

  @override
  String get companyUrlCopied => 'Company URL copied';

  @override
  String get licenses => 'Licenses';

  @override
  String get openSourceLicenses => 'Open source licenses';

  @override
  String byCreator(Object creator) {
    return 'by $creator';
  }

  @override
  String get deviceControlsTitle => 'Device Controls';

  @override
  String get deviceControlsSubtitle =>
      'Show favorite buttons in the system controls page';

  @override
  String get manageFavorites => 'Manage favorites';

  @override
  String get manageFavoritesSubtitle =>
      'Choose which buttons appear in device controls';

  @override
  String get quickSettingsTitle => 'Quick Settings';

  @override
  String get quickSettingsSubtitle =>
      'Add tiles for power and volume shortcuts';

  @override
  String get configureTiles => 'Configure tiles';

  @override
  String get configureTilesSubtitle => 'Map tiles to remote buttons';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle => 'Universal power cycling for owned devices';

  @override
  String get openTvKill => 'Open TVKill';

  @override
  String get openTvKillSubtitle =>
      'Cycle power codes (use only on devices you own)';

  @override
  String get failedToLoadTransmitterSettings =>
      'Failed to load transmitter settings.';

  @override
  String get usbStatusReady => 'USB dongle is connected and ready to send IR.';

  @override
  String get usbStatusPermissionRequired =>
      'USB dongle detected. Request USB permission and approve the system prompt.';

  @override
  String get usbStatusPermissionDenied =>
      'USB permission was denied for the attached dongle. Request it again and approve the prompt.';

  @override
  String get usbStatusPermissionGranted =>
      'USB permission is granted. The dongle still needs to be initialized before it can send IR.';

  @override
  String get usbStatusOpenFailed =>
      'USB permission is granted, but the dongle could not be initialized. Reconnect it and try again.';

  @override
  String get usbStatusNoDevice => 'No supported USB IR dongle detected.';

  @override
  String get usbSelectPermissionRequired =>
      'USB dongle detected but not authorized. Tap \"Request USB permission\".';

  @override
  String get usbSelectPermissionDenied =>
      'USB permission was denied. Tap \"Request USB permission\" and approve the prompt.';

  @override
  String get usbSelectPermissionGranted =>
      'USB permission is granted, but the dongle is not initialized yet. Try reconnecting it.';

  @override
  String get usbSelectOpenFailed =>
      'USB permission is granted, but the dongle could not be initialized. Reconnect it and try again.';

  @override
  String get usbSelectNoDevice =>
      'No supported USB IR dongle detected. Plug it in, then tap \"Request USB permission\".';

  @override
  String get usbSelectReady => 'USB dongle is ready.';

  @override
  String get autoSwitchEnabledMessage =>
      'Auto-switch enabled: uses USB when connected, otherwise Internal.';

  @override
  String get autoSwitchDisabledMessage =>
      'Auto-switch disabled: transmitter selection is now manual.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Failed to update auto-switch setting.';

  @override
  String get failedToSwitchTransmitter => 'Failed to switch transmitter.';

  @override
  String get deviceHasNoInternalIr => 'This device has no built-in IR emitter.';

  @override
  String get audioModeEnabledMessage =>
      'Audio mode enabled. Use max media volume and an audio-to-IR LED adapter.';

  @override
  String get usbPermissionRequestSent => 'USB permission request sent.';

  @override
  String get usbPermissionRequestSentApprove =>
      'USB permission request sent. Approve the prompt to enable USB.';

  @override
  String get usbAlreadyReady => 'USB dongle is already initialized and ready.';

  @override
  String get failedToRequestUsbPermission =>
      'Failed to request USB permission.';

  @override
  String get transmitterHelpInternal =>
      'Use the phone’s built-in IR emitter to send commands.';

  @override
  String get transmitterHelpUsb =>
      'Use a USB IR dongle (permission required) to send commands.';

  @override
  String get transmitterHelpAudio1 =>
      'Use audio output (mono). Requires an audio-to-IR LED adapter and high media volume.';

  @override
  String get transmitterHelpAudio2 =>
      'Use audio output (stereo). Uses two channels for improved LED driving with compatible adapters.';

  @override
  String get transmitterInternal => 'Internal IR';

  @override
  String get transmitterUsb => 'USB IR Dongle';

  @override
  String get transmitterAudio1 => 'Audio (1 LED)';

  @override
  String get transmitterAudio2 => 'Audio (2 LEDs)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Failed to load transmitter capabilities.';

  @override
  String get selectedTransmitter => 'Selected transmitter';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Active: $active';
  }

  @override
  String get refresh => 'Refresh';

  @override
  String get autoSwitchTitle => 'Auto-switch';

  @override
  String get autoSwitchDisabledWhileAudio => 'Disabled while using Audio mode';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Uses USB when connected, otherwise Internal';

  @override
  String get unavailableOnThisDevice => 'Unavailable on this device';

  @override
  String get openOnUsbAttachTitle => 'Open on USB attach';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android may suggest opening the app when a supported USB IR dongle is connected.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Will suggest opening IR Blaster when a supported USB dongle is attached.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Won\'t suggest opening on USB attach.';

  @override
  String get failedToUpdateSetting => 'Failed to update setting.';

  @override
  String get unnamedButton => 'Unnamed button';

  @override
  String get iconFallback => 'Icon';

  @override
  String get remoteListReorderHint =>
      'Touch and hold a remote, then drag it to a new position.';

  @override
  String get deleteRemoteTitle => 'Delete remote?';

  @override
  String deleteRemoteMessage(Object name) {
    return '“$name” will be permanently deleted. This cannot be undone.';
  }

  @override
  String get delete => 'Delete';

  @override
  String get addToDeviceControlsTitle => 'Add to Device Controls?';

  @override
  String get addToDeviceControlsDescription =>
      'Quick access in the system device controls.';

  @override
  String get skip => 'Skip';

  @override
  String get add => 'Add';

  @override
  String get addedToDeviceControls => 'Added to Device Controls.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Deleted “$name”. This cannot be undone.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count buttons',
      one: '$count button',
    );
    return '$_temp0 · $layout';
  }

  @override
  String get layoutComfort => 'Wide';

  @override
  String get layoutCompact => 'Compact';

  @override
  String get open => 'Open';

  @override
  String get useThisRemote => 'Use this remote';

  @override
  String get edit => 'Edit';

  @override
  String get editRemoteSubtitle => 'Rename, and edit buttons';

  @override
  String get thisCannotBeUndone => 'This cannot be undone';

  @override
  String get searchRemotes => 'Search Remotes';

  @override
  String get reorderRemotes => 'Reorder remotes';

  @override
  String get addRemote => 'Add remote';

  @override
  String get more => 'More';

  @override
  String get reorderMode => 'Reorder mode';

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
  String get noRemotesYet => 'No remotes yet';

  @override
  String get noRemotesDescription =>
      'Create a remote to send infrared signals.';

  @override
  String get noRemotesNextStep => 'Add a remote, then add its buttons.';

  @override
  String get actions => 'Actions';

  @override
  String get macrosTitle => 'Macros';

  @override
  String get help => 'Help';

  @override
  String get createMacro => 'Create macro';

  @override
  String get timedMacrosTitle => 'Macros';

  @override
  String get timedMacrosSubtitle =>
      'Run a sequence of IR commands with waits between steps.';

  @override
  String get timedMacrosNextStep =>
      'Choose a remote, then add commands and waits to create your first macro.';

  @override
  String get macroFeatureToysTitle => 'For IR-controlled toys';

  @override
  String get macroFeatureToysDescription =>
      'Give a toy time to finish an action before sending the next command.';

  @override
  String get macroFeatureTimingTitle => 'Adjustable waits';

  @override
  String get macroFeatureTimingDescription =>
      'Set the wait between commands to give your device time to respond.';

  @override
  String get macroFeatureManualTitle => 'Wait for confirmation';

  @override
  String get macroFeatureManualDescription =>
      'Waits until you tap Continue before moving to the next step.';

  @override
  String get exampleUseCase => 'Example';

  @override
  String get macroExampleText =>
      '1. Send the first command\n2. Wait 1 second\n3. Send the next command';

  @override
  String get createFirstMacro => 'Create your first macro';

  @override
  String get noRemote => 'No remote';

  @override
  String macroCopyName(String name) {
    return '$name (Copy)';
  }

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
  String get aboutTimedMacros => 'About macros';

  @override
  String get aboutTimedMacrosDescription =>
      'Run a sequence of IR commands with waits between steps.';

  @override
  String get sendCommand => 'Send command';

  @override
  String get sendCommandDescription =>
      'Sends the IR signal of a button saved in your remote.';

  @override
  String get delay => 'Delay';

  @override
  String get delayDescription =>
      'Waits for the time you set before moving to the next step.';

  @override
  String get manualContinue => 'Wait for confirmation';

  @override
  String get manualContinueDescription =>
      'Waits until you tap Continue before moving to the next step.';

  @override
  String get gotIt => 'Got it';

  @override
  String get failedToSaveMacros => 'Failed to save macros.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Deleted \"$name\".';
  }

  @override
  String get undo => 'Undo';

  @override
  String get failedToRestoreMacro => 'Failed to restore macro.';

  @override
  String get deleteMacroTitle => 'Delete macro?';

  @override
  String get deleteMacroMessage =>
      'After deletion, tap Undo in the message that appears to restore the macro.';

  @override
  String get noRemotesAvailable => 'No remotes available.';

  @override
  String remoteButtonCountSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count buttons',
      one: '$count button',
    );
    return '$_temp0';
  }

  @override
  String get remoteOrientationFlippedTooltip => 'Restore original orientation';

  @override
  String get remoteOrientationNormalTooltip => 'Rotate remote 180°';

  @override
  String get stopLoop => 'Stop loop';

  @override
  String get reorderButtons => 'Reorder buttons';

  @override
  String get remoteReorderHint =>
      'Touch and hold a button, then drag it to a new position.';

  @override
  String get manageRemote => 'Manage remote';

  @override
  String get remoteNoButtons => 'No buttons yet';

  @override
  String get remoteNoButtonsDescription =>
      'Edit this remote to add or configure buttons.';

  @override
  String get editRemote => 'Edit remote';

  @override
  String get editRemoteActionsSubtitle =>
      'Rename the remote, arrange and edit buttons';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Updated button “$name”.';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Added \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Button duplicated.';

  @override
  String get loopRunningForButton => 'Loop is running for this button.';

  @override
  String get loopTip => 'Tip: Use Loop to repeat until you stop it.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Code copied.';

  @override
  String get copyCode => 'Copy code';

  @override
  String get startLoop => 'Start loop';

  @override
  String get editButtonSubtitle => 'Change the label, colors, or IR signal';

  @override
  String get newButton => 'New button';

  @override
  String get newButtonSubtitle => 'Create another button for this remote';

  @override
  String get duplicate => 'Duplicate';

  @override
  String get duplicateButtonSubtitle => 'Create a copy of this button';

  @override
  String get removeFromDeviceControls => 'Remove from Device Controls';

  @override
  String get addToDeviceControls => 'Add to Device Controls';

  @override
  String get deviceControlsButtonSubtitle =>
      'Use this button from Android’s device controls';

  @override
  String get removedFromDeviceControls => 'Removed from Device Controls.';

  @override
  String get pinQuickTile => 'Pin to Quick Tile favorites';

  @override
  String get unpinQuickTile => 'Unpin from Quick Tile favorites';

  @override
  String get quickTileButtonSubtitle =>
      'Favorites appear first when setting up a Quick Settings tile';

  @override
  String get removedFromQuickTileFavorites =>
      'Removed from Quick Tile favorites.';

  @override
  String get pinnedToQuickTileFavorites => 'Pinned to Quick Tile favorites.';

  @override
  String get duplicateAndEdit => 'Duplicate and edit';

  @override
  String get duplicateAndEditSubtitle =>
      'Create a copy and edit it immediately';

  @override
  String get done => 'Done';

  @override
  String get run => 'Run';

  @override
  String get untitledRemote => 'Unnamed remote';

  @override
  String get createRemoteTitle => 'Create remote';

  @override
  String get editRemoteTitle => 'Edit remote';

  @override
  String get removeButtonTitle => 'Remove button?';

  @override
  String get imageButtonRemovedMessage =>
      'This button will be removed from the remote.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" will be removed from the remote.';
  }

  @override
  String get remove => 'Remove';

  @override
  String importedButtonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Imported $count buttons.',
      one: 'Imported $count button.',
    );
    return '$_temp0';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Imported $count buttons from existing remotes.',
      one: 'Imported $count button from existing remotes.',
    );
    return '$_temp0';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Change the label, colors, or IR signal';

  @override
  String get createButtonCopySubtitle => 'Create a copy of this button';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Create a copy and edit it immediately';

  @override
  String get undoAvailableInNextSnackbar =>
      'After removal, tap Undo in the message that appears.';

  @override
  String get buttonRemoved => 'Button removed.';

  @override
  String get remoteNameCannotBeEmpty => 'Enter a name for the remote.';

  @override
  String get saveRemote => 'Save remote';

  @override
  String get remoteName => 'Remote name';

  @override
  String get remoteNameHint => 'e.g. TV or air conditioner';

  @override
  String get remoteNameHelper => 'This name appears in your remote list.';

  @override
  String get layoutStyle => 'Layout';

  @override
  String get layoutWideDescription =>
      'Two columns of buttons with more details.';

  @override
  String get layoutCompactDescription =>
      'Four columns of buttons showing icons or text.';

  @override
  String get importFromRemotes => 'Import from remotes';

  @override
  String get importFromDatabase => 'Import from database';

  @override
  String get addButton => 'Add button';

  @override
  String get noButtonsYet => 'No buttons yet';

  @override
  String get createRemoteEmptyStateDescription =>
      'Find buttons in the database, import them from another remote, or create your own.';

  @override
  String get createButtonTitle => 'Create Button';

  @override
  String get editButtonTitle => 'Edit Button';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Failed to load protocols: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Failed to load database keys: $error';
  }

  @override
  String get presetPower => 'Power';

  @override
  String get presetVolume => 'Volume';

  @override
  String get presetChannel => 'Channel';

  @override
  String get presetNavigation => 'Navigation';

  @override
  String get all => 'All';

  @override
  String get completeRequiredFieldsToSave => 'Complete required fields to save';

  @override
  String get buttonLabelStepTitle => 'Button label';

  @override
  String get buttonLabelStepSubtitle =>
      'Choose an image, icon, or type a text label.';

  @override
  String get buttonColorStepTitle => 'Button color';

  @override
  String get buttonColorStepSubtitle =>
      'Choose a background color for this button.';

  @override
  String get selectColor => 'Select color:';

  @override
  String get noImageSelected => 'No image selected';

  @override
  String get gallery => 'Gallery';

  @override
  String get builtIn => 'Built-in';

  @override
  String get removeImage => 'Remove image';

  @override
  String get requiredSelectImageOrSwitch =>
      'Required: select an image, choose an icon, or switch to Text.';

  @override
  String get iconSelected => 'Icon selected';

  @override
  String get noIconSelected => 'No icon selected';

  @override
  String get chooseIcon => 'Choose Icon';

  @override
  String get removeIcon => 'Remove icon';

  @override
  String get requiredSelectIconOrSwitch =>
      'Required: select an icon or switch to Image/Text.';

  @override
  String get buttonText => 'Button text';

  @override
  String get buttonTextHint => 'e.g., Power, Volume +, HDMI 1';

  @override
  String get buttonTextHelper => 'This text will appear on the button.';

  @override
  String get requiredEnterButtonLabel => 'Required: enter a button label.';

  @override
  String get defaultColorName => 'Default';

  @override
  String get newRemoteCreatedFromLastHit =>
      'New remote created with one button from last hit.';

  @override
  String get selectRemote => 'Select remote';

  @override
  String remoteNumber(Object id) {
    return 'Remote #$id';
  }

  @override
  String get newRemoteCreated => 'New remote created.';

  @override
  String get failedToCreateRemote => 'Failed to create remote.';

  @override
  String get newRemoteEllipsis => 'New remote…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Added to $name.';
  }

  @override
  String get failedToAddToRemote => 'Failed to add to remote.';

  @override
  String get newRemoteDefaultName => 'New Remote';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Jumped to offset $offset. Paused - press Resume to continue.';
  }

  @override
  String get sent => 'Sent.';

  @override
  String failedToSend(Object error) {
    return 'Failed to send: $error';
  }

  @override
  String get copiedProtocolCode => 'Copied (protocol:code).';

  @override
  String get savedToResults => 'Saved to Results.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Invalid code for protocol: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Copied current candidate.';

  @override
  String get jumpToOffset => 'Jump to offset';

  @override
  String get jumpToBruteCursor => 'Jump to brute cursor';

  @override
  String get jump => 'Jump';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Jumped to cursor 0x$cursor. Paused - press Resume to continue.';
  }

  @override
  String get irSignalTester => 'IR Signal Tester';

  @override
  String get stop => 'Stop';

  @override
  String get selectButton => 'Select button';

  @override
  String get buttonNotFoundInRemotes => 'Button not found in saved remotes.';

  @override
  String sentNamed(Object name) {
    return 'Sent “$name”.';
  }

  @override
  String sendFailed(Object error) {
    return 'Send failed: $error';
  }

  @override
  String get noFavoritesYet => 'No favorites yet';

  @override
  String get deviceControlsEmptyHint =>
      'Long-press a remote button and select “Add to Device Controls”.';

  @override
  String get sendTest => 'Send test';

  @override
  String get testSendCompleted => 'Test send completed.';

  @override
  String testSendFailed(Object error) {
    return 'Test send failed: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Removed \"$name\".';
  }

  @override
  String get brand => 'Brand';

  @override
  String get model => 'Model';

  @override
  String get selectBrand => 'Select brand';

  @override
  String get searchBrand => 'Search brand…';

  @override
  String get selectModel => 'Select model';

  @override
  String get searchModel => 'Search model…';

  @override
  String get unnamedKey => 'Unnamed key';

  @override
  String get unknown => 'Unknown';

  @override
  String get emDash => '-';

  @override
  String get searchCommands => 'Search commands';

  @override
  String get noMatchingCommands => 'No matching commands';

  @override
  String get quickTileFavoritesTitle => 'Favorite buttons';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Change button for “$tileLabel” tile';
  }

  @override
  String get pickDifferentButton => 'Choose another button';

  @override
  String get browseAllRemotesEllipsis => 'Browse remotes';

  @override
  String get invalidMacroFileFormat => 'Invalid macro file format.';

  @override
  String get failedToParseMacroFile => 'Failed to parse macro file.';

  @override
  String get deviceCodeLabel => 'Device Code';

  @override
  String get commandLabel => 'Command';

  @override
  String get editButtonCodeTitle => 'Edit Code of the button';

  @override
  String get thisRemoteHasNoButtons => 'This remote has no buttons.';

  @override
  String get selectCommand => 'Select Command';

  @override
  String get databaseModeAutofillHint =>
      'Database mode auto-fills Step 2 for you (brand + model + protocol). After importing a key, you can refine anything in Manual.';

  @override
  String get test => 'Test';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'All selected buttons were duplicates.';

  @override
  String get noButtonsImported => 'No buttons imported.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Imported $addedCount button(s). Skipped $skippedCount duplicate(s).';
  }

  @override
  String get importAllMatchingTitle => 'Import all matching buttons?';

  @override
  String get noMatchingKeysFound => 'No matching keys found.';

  @override
  String importAllMatchingMessage(int count) {
    return 'This will import up to $count matching keys from the current database selection.';
  }

  @override
  String get importAll => 'Import all';

  @override
  String get importingButtons => 'Importing buttons…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'All matching buttons were duplicates.';

  @override
  String get quickPresets => 'Quick presets';

  @override
  String get selectDeviceFirst => 'Select device first';

  @override
  String get searchByLabelOrHex => 'Search by label or hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Optional: refine the $preset preset keys';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Select brand, model, and protocol first.';

  @override
  String get importFromDatabaseTitle => 'Import from database';

  @override
  String get importFromDatabaseSubtitle =>
      'Find your device, choose its buttons, then import them.';

  @override
  String get deviceAndFilters => 'Device & filters';

  @override
  String loadedCount(int count) {
    return '$count loaded';
  }

  @override
  String get hideFilters => 'Hide filters';

  @override
  String get showFilters => 'Show filters';

  @override
  String get noProtocolFoundForBrandModel =>
      'No protocol found for this brand and model.';

  @override
  String get protocolAutoDetected => 'Protocol';

  @override
  String get protocolAutoDetectedHelper =>
      'Auto-detected from the database. You can change it before importing.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Select a brand, model, and protocol to load keys.';

  @override
  String get noKeysFound => 'No keys found.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'No keys found for “$query”.';
  }

  @override
  String get skipDuplicates => 'Skip duplicates';

  @override
  String get skipDuplicatesSubtitle =>
      'Do not import buttons that already exist in this remote.';

  @override
  String get importSelected => 'Import selected';

  @override
  String get noMacrosToExport => 'No macros to export.';

  @override
  String get macrosExportedToDownloads => 'Macros exported to Downloads.';

  @override
  String get failedToExportMacros => 'Failed to export macros.';

  @override
  String get failedToReadFile => 'Failed to read file.';

  @override
  String get importFromExistingRemotesTitle => 'Import from Existing Remotes';

  @override
  String selectedCount(int count) {
    return '$count selected';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'No other remotes with buttons found.';

  @override
  String get sourceRemote => 'Source remote';

  @override
  String get searchButtons => 'Search buttons';

  @override
  String get searchButtonsHint => 'Power, Volume, Mute...';

  @override
  String get selectVisible => 'Select visible';

  @override
  String get clearVisible => 'Clear visible';

  @override
  String protocolNamed(Object name) {
    return 'Protocol: $name';
  }

  @override
  String get rawSignal => 'Raw';

  @override
  String get legacyCode => 'Legacy code';

  @override
  String importCount(int count) {
    return 'Import $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Storage permission denied (needed on some older Android devices).';

  @override
  String get backupExportedToDownloads => 'Backup exported to Downloads.';

  @override
  String failedToExport(Object error) {
    return 'Failed to export: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Imported $count remotes from legacy JSON backup. Macros were not changed.',
      one:
          'Imported $count remote from legacy JSON backup. Macros were not changed.',
    );
    return '$_temp0';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Import failed: backup \"remotes\" must be a JSON list when present.';

  @override
  String get importFailedMacrosMustBeList =>
      'Import failed: backup \"macros\" must be a JSON list when present.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Import failed: invalid backup format (expected legacy List or Map with remotes/macros).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    String _temp0 = intl.Intl.pluralLogic(
      remoteCount,
      locale: localeName,
      other:
          'Imported $remoteCount remotes from backup. Macros were not changed.',
      one: 'Imported $remoteCount remote from backup. Macros were not changed.',
    );
    return '$_temp0';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    String _temp0 = intl.Intl.pluralLogic(
      remoteCount,
      locale: localeName,
      other: '$remoteCount remotes',
      one: '$remoteCount remote',
    );
    String _temp1 = intl.Intl.pluralLogic(
      macroCount,
      locale: localeName,
      other: '$macroCount macros',
      one: '$macroCount macro',
    );
    return '$_temp0 and $_temp1 imported from backup.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Import failed: no valid buttons found in .ir file.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Imported 1 remote from Flipper .ir. Macros were not changed.';

  @override
  String get importFailedInvalidIrplus =>
      'Import failed: invalid irplus file (no valid buttons found).';

  @override
  String get importedOneRemoteFromIrplus =>
      'Imported 1 remote from irplus. Macros were not changed.';

  @override
  String get importFailedInvalidLirc =>
      'Import failed: invalid LIRC file (no valid codes/raw codes found).';

  @override
  String get importedOneRemoteFromLirc =>
      'Imported 1 remote from LIRC config. Macros were not changed.';

  @override
  String get unsupportedFileTypeSelected => 'Unsupported file type selected.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Import failed: invalid or unreadable file.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Bulk import complete: no supported files found in folder.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Bulk import complete: no remotes imported. Skipped $skippedCount file(s).';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Bulk import complete: imported $importedCount remote(s) from $supportedCount supported file(s). Skipped $skippedCount file(s).';
  }

  @override
  String get storagePermissionDenied => 'Storage permission denied.';

  @override
  String get bulkImportFailedReadFolder =>
      'Bulk import failed: unable to read folder contents.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Bulk import complete: no supported files found ($sourceLabel).';
  }

  @override
  String get clearAction => 'Clear';

  @override
  String get saveAction => 'Save';

  @override
  String buttonsTitleCount(int count) {
    return 'Buttons ($count)';
  }

  @override
  String get invalidStepEncountered =>
      'This macro contains an invalid step. Edit it before trying again.';

  @override
  String failedToSendNamed(Object name) {
    return 'Failed to send: $name';
  }

  @override
  String get buttonNotFound => 'Button not found';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Button not found: $name';
  }

  @override
  String get unknownButton => 'Unknown button';

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
    return '$hours h $minutes min';
  }

  @override
  String get orientationFlippedTooltip =>
      'Orientation: flipped (tap to normal)';

  @override
  String get orientationNormalTooltip => 'Orientation: normal (tap to flip)';

  @override
  String get noSteps => 'No steps';

  @override
  String stepProgress(int current, int total) {
    return 'Step $current / $total';
  }

  @override
  String get completed => 'Completed';

  @override
  String get paused => 'Paused';

  @override
  String get running => 'Running';

  @override
  String get ready => 'Ready';

  @override
  String stepsProgress(int current, int total) {
    return 'Steps: $current / $total';
  }

  @override
  String get waiting => 'Waiting';

  @override
  String secondsRemaining(num seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
            locale: localeName, decimalDigits: 1);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString s remaining';
  }

  @override
  String millisecondsShort(int ms) {
    return '$ms ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Tap Continue when you’re ready for the next step.';

  @override
  String get error => 'Error';

  @override
  String get macroCompleted => 'Macro Completed';

  @override
  String finishedIn(Object duration) {
    return 'Finished in $duration';
  }

  @override
  String get sequence => 'Steps';

  @override
  String waitMilliseconds(int ms) {
    return 'Wait $ms ms';
  }

  @override
  String get runAgain => 'Run Again';

  @override
  String get startMacro => 'Start Macro';

  @override
  String get continueAction => 'Continue';

  @override
  String get unnamedRemote => 'Unnamed remote';

  @override
  String get enterMacroName => 'Enter a name for the macro.';

  @override
  String get addAtLeastOneStep => 'Add at least one step.';

  @override
  String get fixInvalidSteps => 'Fix the invalid steps before saving.';

  @override
  String get unknownCommand => 'Unknown command';

  @override
  String get unnamedCommand => 'Unnamed command';

  @override
  String get iconCommand => 'Icon button';

  @override
  String get selectDelay => 'Choose wait time';

  @override
  String keepMilliseconds(int ms) {
    return 'Keep $ms ms';
  }

  @override
  String get custom => 'Custom';

  @override
  String get enterCustomDelayDuration => 'Enter a different wait time';

  @override
  String millisecondsLong(int ms) {
    String _temp0 = intl.Intl.pluralLogic(
      ms,
      locale: localeName,
      other: '$ms milliseconds',
      one: '$ms millisecond',
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
      other: '$secondsString seconds',
      one: '$secondsString second',
    );
    return '$_temp0';
  }

  @override
  String get customDelay => 'Custom wait';

  @override
  String get delayMillisecondsLabel => 'Wait (ms)';

  @override
  String get delayMillisecondsHint => '3000';

  @override
  String get recommendedDelayRange =>
      '1,000 milliseconds = 1 second. Choose a wait that gives your device time to respond.';

  @override
  String get enterValidPositiveNumber =>
      'Enter a whole number greater than zero.';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Remote';

  @override
  String get macroName => 'Macro name';

  @override
  String get macroNameHint => 'e.g. Movie night';

  @override
  String stepsTitleCount(int count) {
    return 'Steps ($count)';
  }

  @override
  String get noStepsYet => 'No steps yet';

  @override
  String get addCommandsAndDelaysHint =>
      'Add commands, delays, or pauses for confirmation. They run in the order shown.';

  @override
  String get addStep => 'Add step';

  @override
  String get reorderStepsHint =>
      'Drag the handle to reorder steps. Tap a step to edit it.';

  @override
  String reorderStep(int index) {
    return 'Reorder step $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Press and drag to change the step order';

  @override
  String deleteStep(int index) {
    return 'Delete step $index';
  }

  @override
  String get invalidStepTapToFix => 'Invalid step - tap to fix';

  @override
  String get sendIrCommand => 'Send IR command';

  @override
  String get waitForUserConfirmation => 'Pauses until you continue the macro.';

  @override
  String get notImplemented => 'Not implemented';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Wide';

  @override
  String get iconButton => 'Icon button';

  @override
  String get imageButton => 'Image button';

  @override
  String get noSignalInfo => 'No signal info';

  @override
  String get proceed => 'Proceed';

  @override
  String get discard => 'Discard';

  @override
  String get continueEditing => 'Continue editing';

  @override
  String get unsavedChangesTitle => 'Unsaved changes';

  @override
  String get unsavedMacroChangesMessage =>
      'Discard your changes to this macro? They will not be saved.';

  @override
  String get stopMacroBeforeLeaving =>
      'Stop the macro before leaving this screen.';

  @override
  String get stopTestingBeforeLeaving =>
      'Stop testing before leaving this screen.';

  @override
  String get idle => 'Idle';

  @override
  String get start => 'Start';

  @override
  String get resume => 'Resume';

  @override
  String get pause => 'Pause';

  @override
  String get stopped => 'Stopped';

  @override
  String get copy => 'Copy';

  @override
  String get send => 'Send';

  @override
  String get step => 'Step';

  @override
  String get addToRemote => 'Add to remote';

  @override
  String get noDescriptionAvailable => 'No description available.';

  @override
  String get notAvailableSymbol => '-';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Kaseikyo vendor must be exactly 4 hex digits.';

  @override
  String get irFinderDatabaseNotReady => 'Database is not ready yet.';

  @override
  String get irFinderSelectBrandFirst => 'Select a brand first in Setup.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute-force is not available for this protocol yet.';

  @override
  String get irFinderInvalidPrefix => 'Invalid prefix.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Brand: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Model: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Key: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Remote #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Enter a 0-based index within filtered, ordered database results.';

  @override
  String get irFinderJumpCursorHelper =>
      'Enter a 0-based hex cursor within the brute-force space.';

  @override
  String get irFinderSetupTab => 'Setup';

  @override
  String get irFinderTestTab => 'Test';

  @override
  String get irFinderResultsTab => 'Results';

  @override
  String get irFinderContinueToTest => 'Continue to Test';

  @override
  String get irFinderKaseikyoVendorTitle => 'Kaseikyo Vendor';

  @override
  String get irFinderCustomVendorLabel => 'Custom vendor (4 hex)';

  @override
  String get irFinderBrowseDbCandidates => 'Browse DB candidates…';

  @override
  String get irFinderEditSetup => 'Edit Setup';

  @override
  String get irFinderNoSavedHits =>
      'No saved hits yet. In the Test page, press \"Save hit\" when the device responds.';

  @override
  String get irFinderBackToTest => 'Back to Test';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Large search space';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'This brute-force space is very large ($human possibilities). IR Finder will still respect your max attempts and cooldown, but be mindful of spamming IR devices.\n\nRecommendation: use Database mode first, and/or enter known prefix bytes to reduce the space.';
  }

  @override
  String get irFinderDatabaseSession => 'Database session';

  @override
  String get irFinderBruteforceSession => 'Brute-force session';

  @override
  String get irFinderResumeLastSession => 'Resume last session';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Brand: $brand · Model: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Prefix: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Progress: $progress · Started: $when';
  }

  @override
  String get irFinderApplyResume => 'Apply & Resume';

  @override
  String get irFinderBruteforceMode => 'Brute-force';

  @override
  String get irFinderDatabaseAssistedMode => 'Database-assisted';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Protocol: $name';
  }

  @override
  String get irFinderProtocolLabel => 'IR protocol';

  @override
  String get irFinderProtocolHelper =>
      'Controls encoding and therefore the search space.';

  @override
  String get irFinderKnownPrefixLabel => 'Known prefix (hex bytes, optional)';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Payload: $digits hex digit(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Payload: $digits hex digit(s) · Example: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Payload: $digits hex digit(s) · Max prefix: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Payload: $digits hex digit(s) · Example: $example · Max prefix: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Example: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Enter any known first bytes to reduce the search space.';

  @override
  String get irFinderDatabaseMode => 'Database';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Normalized prefix: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Normalized prefix';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Brute-force is not configured for this protocol yet.';

  @override
  String irFinderAllLimit(Object value) {
    return 'All ($value)';
  }

  @override
  String get irFinderTestControls => 'Test controls';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Payload length: $digits hex digit(s).';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Search space: $value possibilities (after prefix constraints).';
  }

  @override
  String get irFinderCooldownMs => 'Cooldown (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Max attempts (per run)';

  @override
  String get irFinderTestAllCombinations => 'Test all combinations';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Runs until the search space is exhausted. Effective limit: $value';
  }

  @override
  String get irFinderAttempts => 'Attempts';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Slider range: 1–$max (type any number for larger values)';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Max\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Effective limit this run: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Tip: Use Database mode first; brute-force is best with a known prefix (for example, the first 1–4 bytes).';

  @override
  String get irFinderDatabaseInitFailed => 'Database initialization failed.';

  @override
  String get irFinderPreparingDatabase => 'Preparing local IR code database…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Database-assisted search';

  @override
  String get irFinderBrand => 'Brand';

  @override
  String get irFinderSelectBrand => 'Select brand';

  @override
  String get irFinderModelOptional => 'Model (optional)';

  @override
  String get irFinderSelectBrandFirstShort => 'Select a brand first';

  @override
  String get irFinderSelectModelRecommended => 'Select a model (recommended)';

  @override
  String get irFinderOnlySelectedProtocol => 'Only selected protocol';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Filters keys to the selected protocol. Disable it to browse all protocols.';

  @override
  String get irFinderQuickWinsFirst => 'Quick wins first';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Prioritizes POWER, MUTE, VOL, and CH style keys before deeper keys.';

  @override
  String get irFinderMaxKeysPerRun => 'Max keys to test (per run)';

  @override
  String get irFinderTesting => 'Testing…';

  @override
  String get irFinderCooldown => 'Cooldown';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'Mode';

  @override
  String get irFinderRetryLast => 'Retry last';

  @override
  String get irFinderTrigger => 'Trigger';

  @override
  String get irFinderJump => 'Jump…';

  @override
  String get irFinderSaveHit => 'Save hit';

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
    return 'Last attempted code: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Start testing to see the last attempted code.';

  @override
  String irFinderFromDb(Object value) {
    return 'From DB: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'From brute-force (generated by protocol encoder).';

  @override
  String irFinderSendError(Object error) {
    return 'Send error: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Source: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Results support Test and Copy immediately. Direct add-to-remote integration can be extended further in the editor flow.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Browse DB candidates';

  @override
  String get irFinderFilterByLabelOrHex => 'Filter by label or hex…';

  @override
  String get irFinderJumpHere => 'Jump here';

  @override
  String get irFinderSelectModel => 'Select model';

  @override
  String get irFinderSearchBrands => 'Search brands…';

  @override
  String get irFinderSearchModels => 'Search models…';

  @override
  String get iconPickerTitle => 'Select Icon';

  @override
  String get iconPickerSearchHint => 'Search icons...';

  @override
  String get iconPickerNoIconsFound => 'No icons found';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count icons available';
  }

  @override
  String get iconPickerCategoryAll => 'All';

  @override
  String get iconPickerCategoryMedia => 'Media';

  @override
  String get iconPickerCategoryVolume => 'Volume';

  @override
  String get iconPickerCategoryNavigation => 'Navigation';

  @override
  String get iconPickerCategoryPower => 'Power';

  @override
  String get iconPickerCategoryNumbers => 'Numbers';

  @override
  String get iconPickerCategorySettings => 'Settings';

  @override
  String get iconPickerCategoryDisplay => 'Display';

  @override
  String get iconPickerCategoryInput => 'Input';

  @override
  String get iconPickerCategoryFavorite => 'Favorite';

  @override
  String get universalPowerTitle => 'Universal Power';

  @override
  String get universalPowerRunTab => 'Run';

  @override
  String get universalPowerUseResponsibly => 'Use responsibly';

  @override
  String get universalPowerConsentBody =>
      'Universal Power cycles IR power codes. Use it only on devices you own or control. Stop as soon as the device responds.';

  @override
  String get universalPowerConsentCheckbox => 'I own or control the device';

  @override
  String get universalPowerSetupBody =>
      'Cycles power codes for your selected brand. Stop as soon as the device responds.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Last sent: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'No power codes found. Try broadening the search.';

  @override
  String get universalPowerUnableToStart => 'Unable to start.';

  @override
  String get universalPowerAllBrands => 'All brands (no filter)';

  @override
  String get universalPowerClearBrandFilter => 'Clear brand filter';

  @override
  String get universalPowerBroadenSearch => 'Broaden search if needed';

  @override
  String get universalPowerBroadenSearchHint =>
      'If no power labels are found, include other keys.';

  @override
  String get universalPowerAdditionalPatternsDepth =>
      'Additional patterns depth';

  @override
  String get universalPowerDepth1 => 'Priority only: POWER/OFF';

  @override
  String get universalPowerDepth2 => 'Include POWER aliases';

  @override
  String get universalPowerDepth3 => 'Include secondary power labels';

  @override
  String get universalPowerDepth4 => 'Include all labels (lowest priority)';

  @override
  String get universalPowerLoopUntilStopped => 'Loop until stopped';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Keeps cycling the queue until you stop it.';

  @override
  String get universalPowerDelayBetweenCodes => 'Delay between codes';

  @override
  String get universalPowerStart => 'Start Universal Power';

  @override
  String get universalPowerRunStatus => 'Run status';

  @override
  String universalPowerProgress(Object value) {
    return 'Progress: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Paused because the app was backgrounded.';

  @override
  String get universalPowerSendOneCode => 'Send one code';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Stop as soon as the device responds.';

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
  String get unknownLabel => 'Unknown';

  @override
  String get selectedFilesLabel => 'selected file(s)';

  @override
  String get folderNotFoundOrInaccessible =>
      'Folder not found or inaccessible.';

  @override
  String get importedRemoteDefaultName => 'ImportedRemote';

  @override
  String get demoRemoteName => 'Demo Remote';

  @override
  String get protocolFieldsInvalid =>
      'Fill required protocol fields and ensure frequency is 15k–60k if set.';

  @override
  String get unknownProtocolSelected => 'Unknown protocol selected.';

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
      'Keep this remote at the top for quick access.';

  @override
  String get remoteAddedToPinned => 'Remote pinned.';

  @override
  String get remoteRemovedFromPinned => 'Remote unpinned.';

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
  String get homeDeviceControlsShown => 'Quick controls shown in the app.';

  @override
  String get homeDeviceControlsHidden => 'Quick controls hidden in the app.';

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
  String get learningModeCaptureFailed => 'Could not capture a signal.';

  @override
  String get learningModeReplaySent => 'Signal sent.';

  @override
  String get learningModeReplayFailed => 'Could not send the captured signal.';

  @override
  String get learningModeNoRemotesAvailable => 'No saved remotes yet.';

  @override
  String get learningModeChooseRemoteTitle => 'Choose a remote';

  @override
  String get learningModeNewRemoteTitle => 'Create a remote';

  @override
  String get learningModeSaveSuccess => 'Button saved.';

  @override
  String get learningModeSaveFailed => 'Could not save the button.';

  @override
  String get remoteSetupIntro =>
      'Name your remote and choose a layout. Add buttons next.';

  @override
  String get startWithDefault => 'Use default name';

  @override
  String get browseGithubStore => 'Browse GitHub';

  @override
  String get addFirstButton => 'Add first button';

  @override
  String get moreWaysToStart => 'Other ways to add buttons';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Discard this new remote setup? Your changes will not be saved.';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Discard your changes to this remote? They will not be saved.';

  @override
  String get firstButtonAdded => 'First button added.';

  @override
  String get iconColorTitle => 'Icon color';

  @override
  String get iconColorHelper =>
      'Choose a symbol color that stays visible on the button background.';

  @override
  String get colorRed => 'Red';

  @override
  String get colorPink => 'Pink';

  @override
  String get colorPurple => 'Purple';

  @override
  String get colorDeepPurple => 'Deep Purple';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorBlue => 'Blue';

  @override
  String get colorLightBlue => 'Light Blue';

  @override
  String get colorCyan => 'Cyan';

  @override
  String get colorTeal => 'Teal';

  @override
  String get colorGreen => 'Green';

  @override
  String get colorLightGreen => 'Light Green';

  @override
  String get colorLime => 'Lime';

  @override
  String get colorYellow => 'Yellow';

  @override
  String get colorAmber => 'Amber';

  @override
  String get colorOrange => 'Orange';

  @override
  String get colorDeepOrange => 'Deep Orange';

  @override
  String get colorBrown => 'Brown';

  @override
  String get colorGrey => 'Grey';

  @override
  String get colorBlueGrey => 'Blue Grey';

  @override
  String get colorBlack => 'Black';

  @override
  String get colorWhite => 'White';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Button color $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Button color $colorName, selected';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Icon color $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Icon color $colorName, selected';
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
  String get quickSettingsTilesTitle => 'Quick Settings tiles';

  @override
  String get quickSettingsPowerTile => 'Power tile';

  @override
  String get quickSettingsMuteTile => 'Mute tile';

  @override
  String get quickSettingsVolumeUpTile => 'Volume Up tile';

  @override
  String get quickSettingsVolumeDownTile => 'Volume Down tile';

  @override
  String get quickSettingsNoTilesConfigured => 'No tiles configured';

  @override
  String get quickSettingsEmptyHint =>
      'What next: pick a command for at least one tile, then add the tile from Android Quick Settings edit menu.';

  @override
  String get quickSettingsSetPowerTile => 'Set Power tile';

  @override
  String get quickSettingsConfiguredHint =>
      'Choose which button each tile sends. Add tiles from Android Quick Settings edit menu.';

  @override
  String get quickSettingsNotSet => 'Not set';

  @override
  String quickSettingsTileMappingSummary(String title, String subtitle) {
    return '$title · $subtitle';
  }

  @override
  String get quickSettingsPickButtonTooltip => 'Pick button';

  @override
  String get quickSettingsClearTooltip => 'Clear';

  @override
  String get homeWidgetUnsupportedLauncher =>
      'Add the IR Blaster widget from your home screen\'s widget menu instead.';

  @override
  String get homeWidgetButtonUnsupported =>
      'This button cannot be added as a home screen widget.';

  @override
  String get homeWidgetRequestSent =>
      'Widget requested. Confirm on your home screen if prompted.';

  @override
  String get homeWidgetRequestRejected =>
      'Could not request a widget. Try adding it from your home screen.';

  @override
  String homeWidgetSetupFailed(String error) {
    return 'Could not set up the widget: $error';
  }

  @override
  String get addHomeWidget => 'Add home widget';

  @override
  String get addHomeWidgetSubtitle => 'Place this button on your home screen.';

  @override
  String buttonInfoType(String type) {
    return 'Type: $type';
  }

  @override
  String get buttonInfoCodeRaw => 'Code: Raw signal';

  @override
  String buttonInfoCode(String code) {
    return 'Code: $code';
  }

  @override
  String get buttonInfoNoCode => 'NO CODE';

  @override
  String buttonInfoFrequency(String frequency) {
    return 'Frequency: $frequency';
  }

  @override
  String get frequencyHzLabel => 'Frequency (Hz)';

  @override
  String get carrierFrequencyHelper => 'Carrier frequency, e.g. 38000';

  @override
  String get requiredFrequencyHelper => 'Required. Example: 38000';

  @override
  String get validFrequencyError => 'Enter a valid frequency (15k-60k).';

  @override
  String get resetToDefaultFrequency => 'Reset to 38000';

  @override
  String get rawDataLabel => 'Raw data';

  @override
  String get rawDataHelper =>
      'Space-separated integers, e.g. 9000 4500 560 560 ...';

  @override
  String get rawDataInvalid =>
      'Raw data must be integers separated by spaces or new lines.';

  @override
  String get rawDataSafeguard =>
      'Safeguard: invalid tokens are blocked to prevent saving a non-sendable pattern.';

  @override
  String get protocolLabel => 'Protocol';

  @override
  String get protocolEncodingHelper =>
      'Encoding is implemented only for protocols marked as implemented.';

  @override
  String get protocolFrequencyHelper =>
      'Optional. If empty, protocol default is used where available.';

  @override
  String get rawSignalInvalidWithFrequency =>
      'Raw data must be integers separated by spaces or new lines, and frequency must be 15k-60k.';

  @override
  String get necTimingsNumeric => 'All NEC timings must be numeric.';

  @override
  String get frequencyRangeError => 'Frequency must be 15k-60k Hz.';

  @override
  String get pasteTooltip => 'Paste';

  @override
  String get clearTooltip => 'Clear';

  @override
  String irFinderResumeMask(Object value) {
    return 'Mask: $value';
  }

  @override
  String get irFinderKnownMaskLabel => 'Known code mask (optional)';

  @override
  String get irFinderKnownMaskHint => '00FFXXFF, FFXXFF, or 0xA1XX';

  @override
  String irFinderKnownMaskHelper(int digits, Object example) {
    return '$digits-digit payload. Use X for unknown digits; omitted trailing digits become X. Example: $example';
  }

  @override
  String get irFinderKnownMaskInvalidCharacters =>
      'Use only hex digits, X wildcards, spaces, colons, dashes, or underscores.';

  @override
  String irFinderKnownMaskTooLong(int digits) {
    return 'The mask is longer than this protocol\'s $digits-digit payload.';
  }

  @override
  String irFinderNormalizedMaskValue(Object value) {
    return 'Normalized mask: $value';
  }

  @override
  String get irFinderNormalizedMask => 'Normalized mask';

  @override
  String get irFinderNormalizedMaskAllUnknown => 'All digits unknown';

  @override
  String get irFinderSearchOrder => 'Search order';

  @override
  String get irFinderSmartOrder => 'Smart';

  @override
  String get irFinderSequentialOrder => 'Sequential';

  @override
  String get irFinderSmartOrderHint =>
      'Protocol-aware: tests common low values first, then spreads across command and device fields while skipping bits the encoder ignores.';

  @override
  String get irFinderSequentialOrderHint =>
      'Compatibility mode: tests wildcard digits in ascending hexadecimal order.';

  @override
  String irFinderSmartMeaningfulBits(int bits) {
    return 'Smart mode varies $bits meaningful bit(s) for this mask.';
  }

  @override
  String get irFinderBruteforceMaskTip =>
      'Tip: replace every unknown digit with X. Fixing known digits anywhere in the code can reduce the search dramatically.';

  @override
  String get automationBroadcastsTitle => 'Allow automation broadcasts';

  @override
  String get automationBroadcastsSubtitle =>
      'Any installed app can send IR commands through built-in IR, USB, or audio, even while this app is closed. USB requires prior permission. Audio requires an IR adapter and media volume turned up.';

  @override
  String get automationSettingsError =>
      'Could not load or save the automation setting. Please try again.';

  @override
  String get settingsHardwareTitle => 'IR hardware & learning';

  @override
  String get settingsHardwareSubtitle =>
      'Choose an emitter, manage USB and learn signals';

  @override
  String get settingsAppearanceSubtitle => 'Theme, colors and app language';

  @override
  String get settingsInteractionSubtitle =>
      'Startup, vibration, remote display and automation';

  @override
  String get settingsToolsTitle => 'Tools & shortcuts';

  @override
  String get settingsToolsSubtitle =>
      'Device controls, Quick Settings, GitHub Store and universal power';

  @override
  String get layoutCustom => 'Custom';

  @override
  String get layoutCustomDescription =>
      'Choose columns and button shape. Add gaps in the editor.';

  @override
  String get layoutColumns => 'Buttons per row';

  @override
  String get layoutShape => 'Button shape';

  @override
  String get layoutCircle => 'Circle';

  @override
  String get layoutRoundedSquare => 'Rounded square';

  @override
  String get layoutRectangle => 'Rectangle';

  @override
  String get layoutReflowHint =>
      'Changing the column count rearranges the grid. Swipe sideways if the grid is wider than the screen.';

  @override
  String get layoutUpdated => 'Layout updated';

  @override
  String get layoutArrange => 'Arrange buttons';

  @override
  String get layoutAddRow => 'Add empty row';

  @override
  String get layoutArrangeHint =>
      'Hold and drag a button, or tap it then tap its new position. Buttons swap if that position is occupied.';

  @override
  String get layoutEmptyHint =>
      'Tap an empty space to add a button, or tap a button to edit it. Hold a button for more options.';

  @override
  String layoutCell(int row, int column) {
    return 'Row $row, column $column';
  }

  @override
  String get dbBrandSearchHelp =>
      'Start with the brand, such as Sony or TCL. Then choose a device or remote model.';

  @override
  String get dbModelSearchHelp =>
      'Search the model printed on your device or remote. Spaces and hyphens do not need to match.';

  @override
  String get irFinderDatabaseSearchHint =>
      'Start with a brand in Database mode to test known codes without duplicates. Smart brute force prioritizes guesses; it cannot detect a device response. Save a hit when you see a response.';

  @override
  String get irFinderClearSearchToJump =>
      'Clear the search to jump to a scan position.';

  @override
  String get crashReportTitle => 'A problem occurred last time';

  @override
  String get crashReportExplanation =>
      'A local error report contains technical details about the app, device and error. Nothing is sent automatically. Review it for sensitive information before sharing. Sharing keeps the report; Don’t send deletes it; Not now keeps it for next launch.';

  @override
  String get crashReportDetails => 'Review report';

  @override
  String get crashReportShare => 'Share report';

  @override
  String get crashReportEmail => 'Email support';

  @override
  String get crashReportCopied => 'Report copied.';

  @override
  String get crashReportDontSend => 'Don’t send';

  @override
  String get crashReportNotNow => 'Not now';

  @override
  String get crashReportActionFailed =>
      'Could not complete this action. The report is still saved. Try copying or sharing it instead.';

  @override
  String get shareTitle => 'Share and receive';

  @override
  String get shareReceive => 'Receive';

  @override
  String get shareScan => 'Scan QR code';

  @override
  String get shareOpenFile => 'Open shared file';

  @override
  String get shareSelect => 'Choose what to share';

  @override
  String get shareSend => 'Share with another device';

  @override
  String get shareQr => 'Show QR code';

  @override
  String get shareQrHint =>
      'On the other phone, open IR Blaster > Remotes > Share and receive > Scan QR code.';

  @override
  String get shareTooLarge =>
      'Too much data for a readable QR code. Use device sharing instead.';

  @override
  String get sharePreview => 'Review shared items';

  @override
  String get sharePrivacy =>
      'No account or server is needed. Nothing is sent or transmitted automatically. The receiving device still needs a compatible IR emitter.';

  @override
  String get shareHardwareWarning =>
      'Some learned signals require the original hardware and may not work on another device.';

  @override
  String get shareMacroInfo =>
      'Macros include their associated remotes and buttons. Imports create new copies; nothing is overwritten or run automatically.';

  @override
  String get shareAdd => 'Add copies';

  @override
  String get shareAdded => 'Shared items added.';

  @override
  String get shareDestination => 'Add button to';

  @override
  String get shareCamera =>
      'Allow camera access to scan QR codes, or open a shared file instead.';

  @override
  String get shareInvalid =>
      'This share is invalid, too large, or uses an unsupported version.';

  @override
  String get sharePrepareFailed =>
      'Could not prepare this share. Check for missing images, missing macro buttons, or a collection that is too large.';

  @override
  String get shareFailed =>
      'Could not complete sharing or saving. Your existing items have not been replaced.';

  @override
  String get updatesTitle => 'App updates';

  @override
  String get updatesAutomatic => 'Automatic update checks';

  @override
  String get updatesPrivacyGithub =>
      'Off by default. When enabled, contacts GitHub once a day while you use the app. No automatic downloads.';

  @override
  String get updatesPrivacyPlay =>
      'Off by default. When enabled, contacts Google Play once a day while you use the app. No automatic downloads.';

  @override
  String get updatesUnknown => 'Unknown';

  @override
  String get updatesChooseSource => 'Choose update source';

  @override
  String get updatesCheck => 'Check now';

  @override
  String get updatesNever => 'Not checked yet';

  @override
  String updatesLastChecked(String date) {
    return 'Last checked: $date';
  }

  @override
  String updatesAvailable(String version) {
    return 'New release: $version';
  }

  @override
  String get updatesCurrent => 'No newer release found.';

  @override
  String get updatesFailed =>
      'Update failed. Check your connection and retry. Incompatible APKs are blocked; no app data is deleted.';

  @override
  String get updatesFdroidNote =>
      'GitHub may announce a release before F-Droid has rebuilt it. Update through F-Droid to keep the matching signature and your data.';

  @override
  String get updatesOpenFdroid => 'Open F-Droid';

  @override
  String get updatesOpenPlay => 'Open Google Play';

  @override
  String get updatesDownload => 'Download update';

  @override
  String get updatesInstall => 'Install update';

  @override
  String get updatesAllowInstall => 'Allow installation';

  @override
  String get updatesInstallHint =>
      'Android may ask you to allow installation from this app. Return here, then tap Install update. Your remotes and macros are kept.';

  @override
  String get updatesReady => 'Update downloaded and ready to install.';

  @override
  String get updatesNoAsset =>
      'No verified APK is available for this device. See the release notes.';

  @override
  String get updatesReleaseNotes => 'Release notes';

  @override
  String updatesChannel(String source) {
    return 'Update source: $source';
  }

  @override
  String updatesDownloadConfirm(String size) {
    return 'Download $size MB from GitHub? Installation requires your confirmation.';
  }

  @override
  String get learningModeIncompleteSignal =>
      'The signal looks incomplete. Move the remote closer and try again.';

  @override
  String get learningModeUseUsb => 'Use USB dongle';

  @override
  String get learningModeSwitchedUsb => 'Switched to USB dongle.';

  @override
  String learningModeSwitchUsbFailed(String error) {
    return 'Could not switch to USB dongle: $error';
  }

  @override
  String get learningModeAudioUnavailableTitle => 'Audio learning unavailable';

  @override
  String get learningModeAudioUnavailableBody =>
      'Audio IR accessories can send commands, but cannot learn signals in this app. Use a supported learning receiver.';

  @override
  String learningModeBuiltInReceiver(String brand) {
    return '$brand built-in IR receiver';
  }

  @override
  String get learningModeUsbReceiver => 'USB learning receiver';

  @override
  String learningModeDefaultRemoteName(String buttonName) {
    return '$buttonName remote';
  }

  @override
  String get learningModeSupportedReceivers =>
      'Use a receiver supported by this app:\n• A compatible Tiqiaa, ZaZa, or ElkSmart USB IR dongle\n• A supported Huawei / Honor phone with IR reception\n• A supported LG phone with UEI Quickset\n\nNot all models support learning.';

  @override
  String learningModeCapturedWith(String device) {
    return 'Captured with $device';
  }

  @override
  String get learningModeLgReplayRestriction =>
      'Replay requires the same LG phone used to capture this signal.';

  @override
  String learningModeTimingCount(int count) {
    return 'Timing entries: $count';
  }

  @override
  String get learningModeUnknownCarrier => 'Carrier frequency unknown';

  @override
  String learningModeByteCount(int count) {
    return 'Bytes: $count';
  }
}
