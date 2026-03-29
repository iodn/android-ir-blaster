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
      'This phone does not include a built-in IR emitter. A USB IR dongle is detected, but permission is not granted yet.\n\nApprove the USB permission prompt to enable sending IR.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'This phone does not include a built-in IR emitter. A USB IR dongle is detected, but USB permission was denied.\n\nRequest permission again and approve the prompt to enable sending IR.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'This phone does not include a built-in IR emitter. A USB IR dongle is authorized, but it is not initialized yet.';

  @override
  String get homeUsbOpenFailedMessage =>
      'This phone does not include a built-in IR emitter. A USB IR dongle is detected and authorized, but it could not be initialized.\n\nReconnect the dongle and try again.';

  @override
  String get homeUsbReadyMessage =>
      'This phone does not include a built-in IR emitter.';

  @override
  String get homeUsbNoDeviceMessage =>
      'This phone does not include a built-in IR emitter, and no supported USB IR dongle is currently connected.\n\nYou can still create, import, and manage remotes - but to transmit IR signals you need one of the options below.';

  @override
  String get homeUsbOptionPlugIn =>
      'Plug in a supported USB IR dongle, then approve permission.';

  @override
  String get homeUsbOptionReady => 'Ready to use.';

  @override
  String get homeUsbOptionPermissionRequired =>
      'Plugged in. Permission required.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Permission denied. Request it again.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Authorized. Initializing dongle.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Authorized, but initialization failed.';

  @override
  String get homeHardwareBannerNoInternal =>
      'This phone has no built-in IR. Connect a USB IR dongle or enable Audio mode in Settings.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'USB dongle detected. Permission required to send IR.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'USB permission was denied. Request it again to send IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'USB dongle authorized. Waiting for initialization.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'USB dongle authorized, but initialization failed.';

  @override
  String get homeHardwareBannerReady => 'USB is ready.';

  @override
  String get homeHardwareRequiredTitle =>
      'IR hardware required to send commands';

  @override
  String get homeUsbDongleRecommended => 'USB IR dongle (recommended)';

  @override
  String get homeAudioAdapterAlternative => 'Audio IR adapter (alternative)';

  @override
  String get homeAudioAdapterDescription =>
      'Settings → IR Transmitter → Audio (1 LED / 2 LED). Requires an audio-to-IR adapter.';

  @override
  String get close => 'Close';

  @override
  String get homeChooseTransmitter => 'Choose a transmitter';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get homeUsbPermissionSentApprove =>
      'USB permission request sent. Approve the prompt to enable USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'No supported USB IR dongle detected. Plug it in and try again.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Failed to request USB permission.';

  @override
  String get working => 'Working…';

  @override
  String get requestUsbPermission => 'Request USB permission';

  @override
  String get homeHardwareTip =>
      'Tip: You can still build and organize remotes now. Hardware is only required when transmitting.';

  @override
  String get homeNoIrTransmitterTitle => 'No IR transmitter available';

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
  String get remoteNoIrEmitterTitle => 'No IR emitter';

  @override
  String get remoteNoIrEmitterMessage =>
      'This device does not have an IR emitter';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'This app needs an IR emitter to function';

  @override
  String get remoteDismiss => 'Dismiss';

  @override
  String get remoteClose => 'Close';

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
    return 'Delete failed: $error';
  }

  @override
  String get remoteNotFoundSavedList => 'Remote not found in saved list.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Deleted \"$name\".';
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
  String get interactionTitle => 'Interaction';

  @override
  String get interactionSubtitle => 'Touch feedback and remote layout';

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
      'Reorder mode: long-press and drag a card to move it.';

  @override
  String get deleteRemoteTitle => 'Delete remote?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" will be permanently removed. This action can\'t be undone.';
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
    return 'Deleted \"$name\". This action can\'t be undone.';
  }

  @override
  String remoteLayoutSummary(Object count, Object layout) {
    return '$count button(s) · $layout';
  }

  @override
  String get layoutComfort => 'Comfort';

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
  String remoteButtonCount(Object count, Object plural) {
    return '$count button$plural';
  }

  @override
  String get noRemotesYet => 'No remotes yet';

  @override
  String get noRemotesDescription =>
      'Create a remote to start sending IR codes.';

  @override
  String get noRemotesNextStep =>
      'What next: tap Add remote, then add your first buttons.';

  @override
  String get actions => 'Actions';

  @override
  String get macrosTitle => 'Macros';

  @override
  String get help => 'Help';

  @override
  String get createMacro => 'Create Macro';

  @override
  String get timedMacrosTitle => 'Timed Macros';

  @override
  String get timedMacrosSubtitle =>
      'Automate sequences of IR commands with precise timing';

  @override
  String get timedMacrosNextStep =>
      'What next: tap Create Your First Macro, pick a remote, then add commands and delays.';

  @override
  String get macroFeatureToysTitle => 'Perfect for Interactive Toys';

  @override
  String get macroFeatureToysDescription =>
      'Control devices like i-cybie robot dogs, i-sobot robots, and other toys that need time between commands to process actions.';

  @override
  String get macroFeatureTimingTitle => 'Precise Timing Control';

  @override
  String get macroFeatureTimingDescription =>
      'Add delays between commands (250ms to custom durations) so your device has time to respond before the next action.';

  @override
  String get macroFeatureManualTitle => 'Manual Continue Steps';

  @override
  String get macroFeatureManualDescription =>
      'Pause execution and wait for your confirmation when animation length varies or you need visual feedback.';

  @override
  String get exampleUseCase => 'Example Use Case';

  @override
  String get macroExampleText =>
      'i-cybie Advanced Mode:\n1. Send \"Mode\" command\n2. Wait 1000ms (toy processes)\n3. Send \"Action 1\"\n4. Wait 1000ms\n5. Send \"Action 2\"\n…and so on automatically!';

  @override
  String get createFirstMacro => 'Create Your First Macro';

  @override
  String get noRemote => 'No remote';

  @override
  String macroStepCount(Object count, Object plural) {
    return '$count step$plural';
  }

  @override
  String get aboutTimedMacros => 'About Timed Macros';

  @override
  String get aboutTimedMacrosDescription =>
      'Timed Macros let you automate sequences of IR commands with precise delays between each step.';

  @override
  String get sendCommand => 'Send Command';

  @override
  String get sendCommandDescription =>
      'Transmits an IR command from your remote.';

  @override
  String get delay => 'Delay';

  @override
  String get delayDescription =>
      'Waits for a specified duration (e.g., 1000ms) before the next step.';

  @override
  String get manualContinue => 'Manual Continue';

  @override
  String get manualContinueDescription =>
      'Pauses execution until you tap Continue (useful for variable-length animations).';

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
  String get deleteMacroMessage => 'You can undo this from the next snackbar.';

  @override
  String get noRemotesAvailable => 'No remotes available.';

  @override
  String remoteButtonCountSummary(Object count) {
    return '$count button(s)';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Orientation: flipped (tap to normal)';

  @override
  String get remoteOrientationNormalTooltip =>
      'Orientation: normal (tap to flip)';

  @override
  String get stopLoop => 'Stop loop';

  @override
  String get reorderButtons => 'Reorder buttons';

  @override
  String get remoteReorderHint =>
      'Reorder mode: long-press and drag a button to move it.';

  @override
  String get manageRemote => 'Manage remote';

  @override
  String get remoteNoButtons => 'No buttons in this remote';

  @override
  String get remoteNoButtonsDescription =>
      'Use \"Edit remote\" to add or configure buttons.';

  @override
  String get editRemote => 'Edit remote';

  @override
  String get editRemoteActionsSubtitle => 'Rename, reorder, and edit buttons';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Updated \"$name\".';
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
  String get codeCopied => 'Code copied.';

  @override
  String get copyCode => 'Copy code';

  @override
  String get startLoop => 'Start loop';

  @override
  String get editButtonSubtitle => 'Modify label, code, protocol, frequency';

  @override
  String get newButton => 'New button';

  @override
  String get newButtonSubtitle => 'Create a new button after this one';

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
      'Shows this button in the system device controls';

  @override
  String get removedFromDeviceControls => 'Removed from Device Controls.';

  @override
  String get pinQuickTile => 'Pin to Quick Tile favorites';

  @override
  String get unpinQuickTile => 'Unpin from Quick Tile favorites';

  @override
  String get quickTileButtonSubtitle =>
      'Shows this button at the top of the quick tile chooser';

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
  String get untitledRemote => 'Untitled Remote';

  @override
  String get createRemoteTitle => 'Create remote';

  @override
  String get editRemoteTitle => 'Edit remote';

  @override
  String get removeButtonTitle => 'Remove button?';

  @override
  String get imageButtonRemovedMessage => 'This image button will be removed.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" will be removed.';
  }

  @override
  String get remove => 'Remove';

  @override
  String importedButtonCount(int count) {
    return 'Imported $count button(s).';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Imported $count button(s) from existing remotes.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Change label, signal, and advanced settings';

  @override
  String get createButtonCopySubtitle => 'Create a copy of this button';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Create a copy and edit it immediately';

  @override
  String get undoAvailableInNextSnackbar =>
      'You can undo from the next snackbar';

  @override
  String get buttonRemoved => 'Button removed.';

  @override
  String get remoteNameCannotBeEmpty => 'Remote name can\'t be empty.';

  @override
  String get saveRemote => 'Save remote';

  @override
  String get remoteName => 'Remote name';

  @override
  String get remoteNameHint => 'e.g., TV, Air Conditioner, LED Strip';

  @override
  String get remoteNameHelper => 'This name appears in your Remotes list.';

  @override
  String get layoutStyle => 'Layout style';

  @override
  String get layoutWideDescription =>
      'Wide: 2-column buttons with extra details (recommended).';

  @override
  String get layoutCompactDescription =>
      'Compact: classic 4× grid (icons/text only).';

  @override
  String get importFromRemotes => 'Import from remotes';

  @override
  String get importFromDatabase => 'Import from DB';

  @override
  String get addButton => 'Add button';

  @override
  String get noButtonsYet => 'No buttons yet';

  @override
  String get createRemoteEmptyStateDescription =>
      'Add your first button, then long-press it for edit/remove options.';

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
  String get buttonLabelStepTitle => '1) Button label';

  @override
  String get buttonLabelStepSubtitle =>
      'Choose an image, icon, or type a text label.';

  @override
  String get buttonColorStepTitle => '2) Button color (optional)';

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
  String get buttonNotFoundInRemotes => 'Button not found in remotes.';

  @override
  String sentNamed(Object name) {
    return 'Sent \"$name\".';
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
  String get quickTileFavoritesTitle => 'Quick tile favorites';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Change mapping for $tileLabel tile';
  }

  @override
  String get pickDifferentButton => 'Pick a different button';

  @override
  String get browseAllRemotesEllipsis => 'Browse all remotes…';

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
      'Choose a device, load matching keys, then import selected buttons.';

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
    return 'Imported $count remotes from legacy JSON backup. Macros were not changed.';
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
    return 'Imported $remoteCount remotes from backup. Macros were not changed.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Imported $remoteCount remotes and $macroCount macros from backup.';
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
  String get invalidStepEncountered => 'Invalid step encountered';

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
  String get unknownButton => 'Unknown Button';

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
    return '$current / $total steps';
  }

  @override
  String get waiting => 'Waiting';

  @override
  String secondsRemaining(Object seconds) {
    return '${seconds}s remaining';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Tap Continue when ready for the next step';

  @override
  String get error => 'Error';

  @override
  String get macroCompleted => 'Macro Completed';

  @override
  String finishedIn(Object duration) {
    return 'Finished in $duration';
  }

  @override
  String get sequence => 'Sequence';

  @override
  String waitMilliseconds(int ms) {
    return 'Wait ${ms}ms';
  }

  @override
  String get runAgain => 'Run Again';

  @override
  String get startMacro => 'Start Macro';

  @override
  String get continueAction => 'Continue';

  @override
  String get unnamedRemote => 'Unnamed Remote';

  @override
  String get enterMacroName => 'Enter a macro name';

  @override
  String get addAtLeastOneStep => 'Add at least one step';

  @override
  String get fixInvalidSteps => 'Fix invalid steps';

  @override
  String get unknownCommand => 'Unknown Command';

  @override
  String get unnamedCommand => 'Unnamed Command';

  @override
  String get iconCommand => 'Icon Command';

  @override
  String get selectDelay => 'Select Delay';

  @override
  String keepMilliseconds(int ms) {
    return 'Keep: ${ms}ms';
  }

  @override
  String get custom => 'Custom';

  @override
  String get enterCustomDelayDuration => 'Enter a custom delay duration';

  @override
  String millisecondsLong(int ms) {
    return '$ms milliseconds';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds second$plural';
  }

  @override
  String get customDelay => 'Custom Delay';

  @override
  String get delayMillisecondsLabel => 'Delay (milliseconds)';

  @override
  String get delayMillisecondsHint => 'e.g., 3000';

  @override
  String get recommendedDelayRange =>
      'Recommended: 250-5000ms for most devices';

  @override
  String get enterValidPositiveNumber => 'Please enter a valid positive number';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Remote';

  @override
  String get macroName => 'Macro Name';

  @override
  String get macroNameHint => 'e.g., i-cybie Advanced Mode';

  @override
  String stepsTitleCount(int count) {
    return 'Steps ($count)';
  }

  @override
  String get noStepsYet => 'No steps yet';

  @override
  String get addCommandsAndDelaysHint =>
      'Add commands and delays below to build your sequence';

  @override
  String get addStep => 'Add Step';

  @override
  String get reorderStepsHint =>
      'Tip: Drag the handle to reorder steps. Tap a step to edit it.';

  @override
  String reorderStep(int index) {
    return 'Reorder step $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Press and drag to change step order';

  @override
  String deleteStep(int index) {
    return 'Delete step $index';
  }

  @override
  String get invalidStepTapToFix => 'Invalid step - tap to fix';

  @override
  String get sendIrCommand => 'Send IR command';

  @override
  String get waitForUserConfirmation => 'Wait for user confirmation';

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
}
