import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('ar', 'EG'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fil'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('ms'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ru'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'IR Blaster'**
  String get appTitle;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get loading;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// No description provided for @failedToStart.
  ///
  /// In en, this message translates to:
  /// **'Failed to start'**
  String get failedToStart;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @quickTilePower.
  ///
  /// In en, this message translates to:
  /// **'Power'**
  String get quickTilePower;

  /// No description provided for @quickTileMute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get quickTileMute;

  /// No description provided for @quickTileVolumeUp.
  ///
  /// In en, this message translates to:
  /// **'Vol +'**
  String get quickTileVolumeUp;

  /// No description provided for @quickTileVolumeDown.
  ///
  /// In en, this message translates to:
  /// **'Vol -'**
  String get quickTileVolumeDown;

  /// No description provided for @homeUsbPermissionRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'This phone does not include a built-in IR emitter. A USB IR dongle is detected, but permission is not granted yet.\n\nApprove the USB permission prompt to enable sending IR.'**
  String get homeUsbPermissionRequiredMessage;

  /// No description provided for @homeUsbPermissionDeniedMessage.
  ///
  /// In en, this message translates to:
  /// **'This phone does not include a built-in IR emitter. A USB IR dongle is detected, but USB permission was denied.\n\nRequest permission again and approve the prompt to enable sending IR.'**
  String get homeUsbPermissionDeniedMessage;

  /// No description provided for @homeUsbPermissionGrantedMessage.
  ///
  /// In en, this message translates to:
  /// **'This phone does not include a built-in IR emitter. A USB IR dongle is authorized, but it is not initialized yet.'**
  String get homeUsbPermissionGrantedMessage;

  /// No description provided for @homeUsbOpenFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'This phone does not include a built-in IR emitter. A USB IR dongle is detected and authorized, but it could not be initialized.\n\nReconnect the dongle and try again.'**
  String get homeUsbOpenFailedMessage;

  /// No description provided for @homeUsbReadyMessage.
  ///
  /// In en, this message translates to:
  /// **'This phone does not include a built-in IR emitter.'**
  String get homeUsbReadyMessage;

  /// No description provided for @homeUsbNoDeviceMessage.
  ///
  /// In en, this message translates to:
  /// **'This phone does not include a built-in IR emitter, and no supported USB IR dongle is currently connected.\n\nYou can still create, import, and manage remotes - but to transmit IR signals you need one of the options below.'**
  String get homeUsbNoDeviceMessage;

  /// No description provided for @homeUsbOptionPlugIn.
  ///
  /// In en, this message translates to:
  /// **'Plug in a supported USB IR dongle, then approve permission.'**
  String get homeUsbOptionPlugIn;

  /// No description provided for @homeUsbOptionReady.
  ///
  /// In en, this message translates to:
  /// **'Ready to use.'**
  String get homeUsbOptionReady;

  /// No description provided for @homeUsbOptionPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Plugged in. Permission required.'**
  String get homeUsbOptionPermissionRequired;

  /// No description provided for @homeUsbOptionPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied. Request it again.'**
  String get homeUsbOptionPermissionDenied;

  /// No description provided for @homeUsbOptionPermissionGranted.
  ///
  /// In en, this message translates to:
  /// **'Authorized. Initializing dongle.'**
  String get homeUsbOptionPermissionGranted;

  /// No description provided for @homeUsbOptionOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'Authorized, but initialization failed.'**
  String get homeUsbOptionOpenFailed;

  /// No description provided for @homeHardwareBannerNoInternal.
  ///
  /// In en, this message translates to:
  /// **'This phone has no built-in IR. Connect a USB IR dongle or enable Audio mode in Settings.'**
  String get homeHardwareBannerNoInternal;

  /// No description provided for @homeHardwareBannerPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'USB dongle detected. Permission required to send IR.'**
  String get homeHardwareBannerPermissionRequired;

  /// No description provided for @homeHardwareBannerPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'USB permission was denied. Request it again to send IR.'**
  String get homeHardwareBannerPermissionDenied;

  /// No description provided for @homeHardwareBannerPermissionGranted.
  ///
  /// In en, this message translates to:
  /// **'USB dongle authorized. Waiting for initialization.'**
  String get homeHardwareBannerPermissionGranted;

  /// No description provided for @homeHardwareBannerOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'USB dongle authorized, but initialization failed.'**
  String get homeHardwareBannerOpenFailed;

  /// No description provided for @homeHardwareBannerReady.
  ///
  /// In en, this message translates to:
  /// **'USB is ready.'**
  String get homeHardwareBannerReady;

  /// No description provided for @homeHardwareRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'IR hardware required to send commands'**
  String get homeHardwareRequiredTitle;

  /// No description provided for @homeUsbDongleRecommended.
  ///
  /// In en, this message translates to:
  /// **'USB IR dongle (recommended)'**
  String get homeUsbDongleRecommended;

  /// No description provided for @homeAudioAdapterAlternative.
  ///
  /// In en, this message translates to:
  /// **'Audio IR adapter (alternative)'**
  String get homeAudioAdapterAlternative;

  /// No description provided for @homeAudioAdapterDescription.
  ///
  /// In en, this message translates to:
  /// **'Settings → IR Transmitter → Audio (1 LED / 2 LED). Requires an audio-to-IR adapter.'**
  String get homeAudioAdapterDescription;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @homeChooseTransmitter.
  ///
  /// In en, this message translates to:
  /// **'Choose a transmitter'**
  String get homeChooseTransmitter;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @homeUsbPermissionSentApprove.
  ///
  /// In en, this message translates to:
  /// **'USB permission request sent. Approve the prompt to enable USB.'**
  String get homeUsbPermissionSentApprove;

  /// No description provided for @homeUsbDongleNotDetected.
  ///
  /// In en, this message translates to:
  /// **'No supported USB IR dongle detected. Plug it in and try again.'**
  String get homeUsbDongleNotDetected;

  /// No description provided for @homeUsbPermissionRequestFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to request USB permission.'**
  String get homeUsbPermissionRequestFailed;

  /// No description provided for @working.
  ///
  /// In en, this message translates to:
  /// **'Working…'**
  String get working;

  /// No description provided for @requestUsbPermission.
  ///
  /// In en, this message translates to:
  /// **'Request USB permission'**
  String get requestUsbPermission;

  /// No description provided for @homeHardwareTip.
  ///
  /// In en, this message translates to:
  /// **'Tip: You can still build and organize remotes now. Hardware is only required when transmitting.'**
  String get homeHardwareTip;

  /// No description provided for @homeNoIrTransmitterTitle.
  ///
  /// In en, this message translates to:
  /// **'No IR transmitter available'**
  String get homeNoIrTransmitterTitle;

  /// No description provided for @settingsNavLabel.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsNavLabel;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @remotesNavLabel.
  ///
  /// In en, this message translates to:
  /// **'Remotes'**
  String get remotesNavLabel;

  /// No description provided for @macrosNavLabel.
  ///
  /// In en, this message translates to:
  /// **'Macros'**
  String get macrosNavLabel;

  /// No description provided for @signalTesterNavLabel.
  ///
  /// In en, this message translates to:
  /// **'Signal Tester'**
  String get signalTesterNavLabel;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @remoteNoIrEmitterTitle.
  ///
  /// In en, this message translates to:
  /// **'No IR emitter'**
  String get remoteNoIrEmitterTitle;

  /// No description provided for @remoteNoIrEmitterMessage.
  ///
  /// In en, this message translates to:
  /// **'This device does not have an IR emitter'**
  String get remoteNoIrEmitterMessage;

  /// No description provided for @remoteNoIrEmitterNeedsEmitter.
  ///
  /// In en, this message translates to:
  /// **'This app needs an IR emitter to function'**
  String get remoteNoIrEmitterNeedsEmitter;

  /// No description provided for @remoteDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get remoteDismiss;

  /// No description provided for @remoteClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get remoteClose;

  /// No description provided for @remoteFailedToSend.
  ///
  /// In en, this message translates to:
  /// **'Failed to send IR: {error}'**
  String remoteFailedToSend(Object error);

  /// No description provided for @remoteFailedToStartLoop.
  ///
  /// In en, this message translates to:
  /// **'Failed to start loop: {error}'**
  String remoteFailedToStartLoop(Object error);

  /// No description provided for @remoteLoopStoppedFailed.
  ///
  /// In en, this message translates to:
  /// **'Loop stopped (send failed): {error}'**
  String remoteLoopStoppedFailed(Object error);

  /// No description provided for @remoteLoopingHint.
  ///
  /// In en, this message translates to:
  /// **'Looping \"{title}\". Tap Stop in the top bar to stop.'**
  String remoteLoopingHint(Object title);

  /// No description provided for @remoteLoopStopped.
  ///
  /// In en, this message translates to:
  /// **'Loop stopped.'**
  String get remoteLoopStopped;

  /// No description provided for @remoteUpdatedNotFound.
  ///
  /// In en, this message translates to:
  /// **'Remote updated on screen. It was not found in the saved list.'**
  String get remoteUpdatedNotFound;

  /// No description provided for @remoteUpdatedNamed.
  ///
  /// In en, this message translates to:
  /// **'Updated \"{name}\".'**
  String remoteUpdatedNamed(Object name);

  /// No description provided for @remoteDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Delete failed: {error}'**
  String remoteDeleteFailed(Object error);

  /// No description provided for @remoteNotFoundSavedList.
  ///
  /// In en, this message translates to:
  /// **'Remote not found in saved list.'**
  String get remoteNotFoundSavedList;

  /// No description provided for @remoteDeletedNamed.
  ///
  /// In en, this message translates to:
  /// **'Deleted \"{name}\".'**
  String remoteDeletedNamed(Object name);

  /// No description provided for @buttonFallbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Button'**
  String get buttonFallbackTitle;

  /// No description provided for @imageFallbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get imageFallbackTitle;

  /// No description provided for @noBrowserAvailable.
  ///
  /// In en, this message translates to:
  /// **'No browser available'**
  String get noBrowserAvailable;

  /// No description provided for @failedToOpen.
  ///
  /// In en, this message translates to:
  /// **'Failed to open: {error}'**
  String failedToOpen(Object error);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @settingsRestoreDemoTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore demo remotes?'**
  String get settingsRestoreDemoTitle;

  /// No description provided for @settingsRestoreDemoMessage.
  ///
  /// In en, this message translates to:
  /// **'This will replace your current remotes with the built-in demo remotes. A backup is recommended if you want to keep your current list.'**
  String get settingsRestoreDemoMessage;

  /// No description provided for @settingsRestoreDemoConfirm.
  ///
  /// In en, this message translates to:
  /// **'Restore demo'**
  String get settingsRestoreDemoConfirm;

  /// No description provided for @settingsDemoRemotesRestored.
  ///
  /// In en, this message translates to:
  /// **'Demo remotes restored.'**
  String get settingsDemoRemotesRestored;

  /// No description provided for @settingsDeleteAllRemotesTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all remotes?'**
  String get settingsDeleteAllRemotesTitle;

  /// No description provided for @settingsDeleteAllRemotesMessage.
  ///
  /// In en, this message translates to:
  /// **'This removes every remote from this device. This action can’t be undone.'**
  String get settingsDeleteAllRemotesMessage;

  /// No description provided for @settingsDeleteAllConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete all'**
  String get settingsDeleteAllConfirm;

  /// No description provided for @settingsAllRemotesDeleted.
  ///
  /// In en, this message translates to:
  /// **'All remotes deleted.'**
  String get settingsAllRemotesDeleted;

  /// No description provided for @themeAuto.
  ///
  /// In en, this message translates to:
  /// **'Auto Theme'**
  String get themeAuto;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get themeDark;

  /// No description provided for @themeDescAuto.
  ///
  /// In en, this message translates to:
  /// **'Follows your device settings'**
  String get themeDescAuto;

  /// No description provided for @themeDescLight.
  ///
  /// In en, this message translates to:
  /// **'Always bright and clear'**
  String get themeDescLight;

  /// No description provided for @themeDescDark.
  ///
  /// In en, this message translates to:
  /// **'Easy on the eyes'**
  String get themeDescDark;

  /// No description provided for @themeHintAuto.
  ///
  /// In en, this message translates to:
  /// **'Theme automatically switches when you change your device settings between light and dark mode'**
  String get themeHintAuto;

  /// No description provided for @themeHintLight.
  ///
  /// In en, this message translates to:
  /// **'Perfect for daytime use and well-lit environments'**
  String get themeHintLight;

  /// No description provided for @themeHintDark.
  ///
  /// In en, this message translates to:
  /// **'Reduces eye strain in low-light conditions and saves battery on OLED screens'**
  String get themeHintDark;

  /// No description provided for @supportDevelopmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Support Development'**
  String get supportDevelopmentTitle;

  /// No description provided for @supportDevelopmentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep IR Blaster maintained and hardware-compatible'**
  String get supportDevelopmentSubtitle;

  /// No description provided for @supportDevelopmentBody.
  ///
  /// In en, this message translates to:
  /// **'No ads, no tracking, no locked features. Your support funds protocol work, USB dongle support, and better compatibility across devices.'**
  String get supportDevelopmentBody;

  /// No description provided for @donate.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get donate;

  /// No description provided for @starRepo.
  ///
  /// In en, this message translates to:
  /// **'Star Repo'**
  String get starRepo;

  /// No description provided for @repositoryLinkCopied.
  ///
  /// In en, this message translates to:
  /// **'Repository link copied'**
  String get repositoryLinkCopied;

  /// No description provided for @supportPillLocalOnly.
  ///
  /// In en, this message translates to:
  /// **'Local-only'**
  String get supportPillLocalOnly;

  /// No description provided for @supportPillNoTracking.
  ///
  /// In en, this message translates to:
  /// **'No tracking'**
  String get supportPillNoTracking;

  /// No description provided for @supportPillHardwareAware.
  ///
  /// In en, this message translates to:
  /// **'Hardware-aware'**
  String get supportPillHardwareAware;

  /// No description provided for @supportPillOpenSource.
  ///
  /// In en, this message translates to:
  /// **'Open-source'**
  String get supportPillOpenSource;

  /// No description provided for @appearanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearanceTitle;

  /// No description provided for @appearanceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize your visual experience'**
  String get appearanceSubtitle;

  /// No description provided for @localizationTitle.
  ///
  /// In en, this message translates to:
  /// **'Localization'**
  String get localizationTitle;

  /// No description provided for @localizationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'App language and translation behavior'**
  String get localizationSubtitle;

  /// No description provided for @localizationAutoUsing.
  ///
  /// In en, this message translates to:
  /// **'Auto: using {language}'**
  String localizationAutoUsing(Object language);

  /// No description provided for @localizationAutoDescription.
  ///
  /// In en, this message translates to:
  /// **'The app follows your device language when possible.'**
  String get localizationAutoDescription;

  /// No description provided for @localizationManualDescription.
  ///
  /// In en, this message translates to:
  /// **'The app language is manually overridden.'**
  String get localizationManualDescription;

  /// No description provided for @useSystemLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Use system language'**
  String get useSystemLanguageTitle;

  /// No description provided for @useSystemLanguageEnabled.
  ///
  /// In en, this message translates to:
  /// **'Following your device language: {language}'**
  String useSystemLanguageEnabled(Object language);

  /// No description provided for @useSystemLanguageDisabled.
  ///
  /// In en, this message translates to:
  /// **'Use the language selected below instead of the device default.'**
  String get useSystemLanguageDisabled;

  /// No description provided for @chooseAppLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose app language'**
  String get chooseAppLanguage;

  /// No description provided for @languagePickerDisabledHint.
  ///
  /// In en, this message translates to:
  /// **'Turn off system language to choose a language manually.'**
  String get languagePickerDisabledHint;

  /// No description provided for @searchLanguages.
  ///
  /// In en, this message translates to:
  /// **'Search languages'**
  String get searchLanguages;

  /// No description provided for @noLanguagesFound.
  ///
  /// In en, this message translates to:
  /// **'No matching languages'**
  String get noLanguagesFound;

  /// No description provided for @localizationHint.
  ///
  /// In en, this message translates to:
  /// **'When system language is enabled, the app follows your device locale and falls back to English if a translation is unavailable. Turn it off to lock the app to a specific language.'**
  String get localizationHint;

  /// No description provided for @appLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get appLanguageTitle;

  /// No description provided for @appLanguageHint.
  ///
  /// In en, this message translates to:
  /// **'Auto follows your device language. Choose English or French here to override it for the app only.'**
  String get appLanguageHint;

  /// No description provided for @languageAuto.
  ///
  /// In en, this message translates to:
  /// **'Auto (system)'**
  String get languageAuto;

  /// No description provided for @languageAutoDescription.
  ///
  /// In en, this message translates to:
  /// **'Follow your device language automatically'**
  String get languageAutoDescription;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageEnglishDescription.
  ///
  /// In en, this message translates to:
  /// **'Force the app to always use English'**
  String get languageEnglishDescription;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get languageFrench;

  /// No description provided for @languageFrenchDescription.
  ///
  /// In en, this message translates to:
  /// **'Force the app to always use French'**
  String get languageFrenchDescription;

  /// No description provided for @languageAutoShort.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get languageAutoShort;

  /// No description provided for @languageEnglishShort.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglishShort;

  /// No description provided for @languageFrenchShort.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get languageFrenchShort;

  /// No description provided for @useDynamicColors.
  ///
  /// In en, this message translates to:
  /// **'Use dynamic colors'**
  String get useDynamicColors;

  /// No description provided for @themeChoiceAuto.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get themeChoiceAuto;

  /// No description provided for @themeChoiceLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeChoiceLight;

  /// No description provided for @themeChoiceDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeChoiceDark;

  /// No description provided for @irTransmitterTitle.
  ///
  /// In en, this message translates to:
  /// **'IR Transmitter'**
  String get irTransmitterTitle;

  /// No description provided for @irTransmitterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose which hardware sends IR commands'**
  String get irTransmitterSubtitle;

  /// No description provided for @interactionTitle.
  ///
  /// In en, this message translates to:
  /// **'Interaction'**
  String get interactionTitle;

  /// No description provided for @interactionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Touch feedback and remote layout'**
  String get interactionSubtitle;

  /// No description provided for @hapticFeedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Haptic feedback'**
  String get hapticFeedbackTitle;

  /// No description provided for @hapticFeedbackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Vibrate on taps and actions'**
  String get hapticFeedbackSubtitle;

  /// No description provided for @forceInAppVibrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Force in-app vibration'**
  String get forceInAppVibrationTitle;

  /// No description provided for @forceInAppVibrationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use the vibrator directly even if system touch feedback is off'**
  String get forceInAppVibrationSubtitle;

  /// No description provided for @forceInAppVibrationWarning.
  ///
  /// In en, this message translates to:
  /// **'Advanced option. This can make the app vibrate even when Android touch feedback is disabled globally.'**
  String get forceInAppVibrationWarning;

  /// No description provided for @forceInAppVibrationBlockedMasterWarning.
  ///
  /// In en, this message translates to:
  /// **'Android system vibration is disabled. Force in-app vibration cannot override it on this device.'**
  String get forceInAppVibrationBlockedMasterWarning;

  /// No description provided for @forceInAppVibrationNoVibratorWarning.
  ///
  /// In en, this message translates to:
  /// **'This device reports no vibrator hardware, so in-app vibration cannot work.'**
  String get forceInAppVibrationNoVibratorWarning;

  /// No description provided for @intensity.
  ///
  /// In en, this message translates to:
  /// **'Intensity'**
  String get intensity;

  /// No description provided for @intensityLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get intensityLight;

  /// No description provided for @intensityMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get intensityMedium;

  /// No description provided for @intensityStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get intensityStrong;

  /// No description provided for @flipRemoteDefaultTitle.
  ///
  /// In en, this message translates to:
  /// **'Flip Remote View by default'**
  String get flipRemoteDefaultTitle;

  /// No description provided for @flipRemoteDefaultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Open Remote screens rotated 180° (for bottom-mounted USB dongles).'**
  String get flipRemoteDefaultSubtitle;

  /// No description provided for @remoteViewFlipped.
  ///
  /// In en, this message translates to:
  /// **'Remote View will open flipped.'**
  String get remoteViewFlipped;

  /// No description provided for @remoteViewNormal.
  ///
  /// In en, this message translates to:
  /// **'Remote View will open normally.'**
  String get remoteViewNormal;

  /// No description provided for @backupTitle.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backupTitle;

  /// No description provided for @backupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Import/export remotes and macros'**
  String get backupSubtitle;

  /// No description provided for @importBackup.
  ///
  /// In en, this message translates to:
  /// **'Import backup'**
  String get importBackup;

  /// No description provided for @importBackupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Import remotes/macros backup or Flipper Zero, LIRC or IRPLUS files'**
  String get importBackupSubtitle;

  /// No description provided for @bulkImportFolder.
  ///
  /// In en, this message translates to:
  /// **'Bulk import folder'**
  String get bulkImportFolder;

  /// No description provided for @bulkImportFolderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Import multiple remotes from a folder'**
  String get bulkImportFolderSubtitle;

  /// No description provided for @exportBackup.
  ///
  /// In en, this message translates to:
  /// **'Export backup'**
  String get exportBackup;

  /// No description provided for @exportBackupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Save remotes + macros as one JSON file to Downloads'**
  String get exportBackupSubtitle;

  /// No description provided for @restoreDemoRemotes.
  ///
  /// In en, this message translates to:
  /// **'Restore demo remotes'**
  String get restoreDemoRemotes;

  /// No description provided for @restoreDemoRemotesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Replace current remotes with the built-in demo'**
  String get restoreDemoRemotesSubtitle;

  /// No description provided for @deleteAllRemotes.
  ///
  /// In en, this message translates to:
  /// **'Delete all remotes'**
  String get deleteAllRemotes;

  /// No description provided for @deleteAllRemotesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Remove every remote from this device'**
  String get deleteAllRemotesSubtitle;

  /// No description provided for @backupTip.
  ///
  /// In en, this message translates to:
  /// **'Tip: export a backup before large edits. Import supports full backups, legacy remotes-only JSON backups, and Flipper Zero .ir files.'**
  String get backupTip;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// No description provided for @aboutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'App information and open-source details'**
  String get aboutSubtitle;

  /// No description provided for @aboutAppNameWithCreator.
  ///
  /// In en, this message translates to:
  /// **'IR Blaster - {creator}'**
  String aboutAppNameWithCreator(Object creator);

  /// No description provided for @versionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String versionLabel(Object version);

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source Code'**
  String get sourceCode;

  /// No description provided for @viewOnGitHub.
  ///
  /// In en, this message translates to:
  /// **'View on GitHub'**
  String get viewOnGitHub;

  /// No description provided for @repositoryUrlCopied.
  ///
  /// In en, this message translates to:
  /// **'Repository URL copied'**
  String get repositoryUrlCopied;

  /// No description provided for @reportIssue.
  ///
  /// In en, this message translates to:
  /// **'Report Issue'**
  String get reportIssue;

  /// No description provided for @reportIssueSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Bug reports & feature requests'**
  String get reportIssueSubtitle;

  /// No description provided for @issuesUrlCopied.
  ///
  /// In en, this message translates to:
  /// **'Issues URL copied'**
  String get issuesUrlCopied;

  /// No description provided for @license.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// No description provided for @openSourceLicense.
  ///
  /// In en, this message translates to:
  /// **'Open-source license'**
  String get openSourceLicense;

  /// No description provided for @licenseUrlCopied.
  ///
  /// In en, this message translates to:
  /// **'License URL copied'**
  String get licenseUrlCopied;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'KaijinLab Inc.'**
  String get companyName;

  /// No description provided for @visitWebsite.
  ///
  /// In en, this message translates to:
  /// **'Visit our website'**
  String get visitWebsite;

  /// No description provided for @companyUrlCopied.
  ///
  /// In en, this message translates to:
  /// **'Company URL copied'**
  String get companyUrlCopied;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// No description provided for @openSourceLicenses.
  ///
  /// In en, this message translates to:
  /// **'Open source licenses'**
  String get openSourceLicenses;

  /// No description provided for @byCreator.
  ///
  /// In en, this message translates to:
  /// **'by {creator}'**
  String byCreator(Object creator);

  /// No description provided for @deviceControlsTitle.
  ///
  /// In en, this message translates to:
  /// **'Device Controls'**
  String get deviceControlsTitle;

  /// No description provided for @deviceControlsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show favorite buttons in the system controls page'**
  String get deviceControlsSubtitle;

  /// No description provided for @manageFavorites.
  ///
  /// In en, this message translates to:
  /// **'Manage favorites'**
  String get manageFavorites;

  /// No description provided for @manageFavoritesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose which buttons appear in device controls'**
  String get manageFavoritesSubtitle;

  /// No description provided for @quickSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick Settings'**
  String get quickSettingsTitle;

  /// No description provided for @quickSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add tiles for power and volume shortcuts'**
  String get quickSettingsSubtitle;

  /// No description provided for @configureTiles.
  ///
  /// In en, this message translates to:
  /// **'Configure tiles'**
  String get configureTiles;

  /// No description provided for @configureTilesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Map tiles to remote buttons'**
  String get configureTilesSubtitle;

  /// No description provided for @tvKillTitle.
  ///
  /// In en, this message translates to:
  /// **'TVKill'**
  String get tvKillTitle;

  /// No description provided for @tvKillSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Universal power cycling for owned devices'**
  String get tvKillSubtitle;

  /// No description provided for @openTvKill.
  ///
  /// In en, this message translates to:
  /// **'Open TVKill'**
  String get openTvKill;

  /// No description provided for @openTvKillSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Cycle power codes (use only on devices you own)'**
  String get openTvKillSubtitle;

  /// No description provided for @failedToLoadTransmitterSettings.
  ///
  /// In en, this message translates to:
  /// **'Failed to load transmitter settings.'**
  String get failedToLoadTransmitterSettings;

  /// No description provided for @usbStatusReady.
  ///
  /// In en, this message translates to:
  /// **'USB dongle is connected and ready to send IR.'**
  String get usbStatusReady;

  /// No description provided for @usbStatusPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'USB dongle detected. Request USB permission and approve the system prompt.'**
  String get usbStatusPermissionRequired;

  /// No description provided for @usbStatusPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'USB permission was denied for the attached dongle. Request it again and approve the prompt.'**
  String get usbStatusPermissionDenied;

  /// No description provided for @usbStatusPermissionGranted.
  ///
  /// In en, this message translates to:
  /// **'USB permission is granted. The dongle still needs to be initialized before it can send IR.'**
  String get usbStatusPermissionGranted;

  /// No description provided for @usbStatusOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'USB permission is granted, but the dongle could not be initialized. Reconnect it and try again.'**
  String get usbStatusOpenFailed;

  /// No description provided for @usbStatusNoDevice.
  ///
  /// In en, this message translates to:
  /// **'No supported USB IR dongle detected.'**
  String get usbStatusNoDevice;

  /// No description provided for @usbSelectPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'USB dongle detected but not authorized. Tap \"Request USB permission\".'**
  String get usbSelectPermissionRequired;

  /// No description provided for @usbSelectPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'USB permission was denied. Tap \"Request USB permission\" and approve the prompt.'**
  String get usbSelectPermissionDenied;

  /// No description provided for @usbSelectPermissionGranted.
  ///
  /// In en, this message translates to:
  /// **'USB permission is granted, but the dongle is not initialized yet. Try reconnecting it.'**
  String get usbSelectPermissionGranted;

  /// No description provided for @usbSelectOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'USB permission is granted, but the dongle could not be initialized. Reconnect it and try again.'**
  String get usbSelectOpenFailed;

  /// No description provided for @usbSelectNoDevice.
  ///
  /// In en, this message translates to:
  /// **'No supported USB IR dongle detected. Plug it in, then tap \"Request USB permission\".'**
  String get usbSelectNoDevice;

  /// No description provided for @usbSelectReady.
  ///
  /// In en, this message translates to:
  /// **'USB dongle is ready.'**
  String get usbSelectReady;

  /// No description provided for @autoSwitchEnabledMessage.
  ///
  /// In en, this message translates to:
  /// **'Auto-switch enabled: uses USB when connected, otherwise Internal.'**
  String get autoSwitchEnabledMessage;

  /// No description provided for @autoSwitchDisabledMessage.
  ///
  /// In en, this message translates to:
  /// **'Auto-switch disabled: transmitter selection is now manual.'**
  String get autoSwitchDisabledMessage;

  /// No description provided for @failedToUpdateAutoSwitch.
  ///
  /// In en, this message translates to:
  /// **'Failed to update auto-switch setting.'**
  String get failedToUpdateAutoSwitch;

  /// No description provided for @failedToSwitchTransmitter.
  ///
  /// In en, this message translates to:
  /// **'Failed to switch transmitter.'**
  String get failedToSwitchTransmitter;

  /// No description provided for @deviceHasNoInternalIr.
  ///
  /// In en, this message translates to:
  /// **'This device has no built-in IR emitter.'**
  String get deviceHasNoInternalIr;

  /// No description provided for @audioModeEnabledMessage.
  ///
  /// In en, this message translates to:
  /// **'Audio mode enabled. Use max media volume and an audio-to-IR LED adapter.'**
  String get audioModeEnabledMessage;

  /// No description provided for @usbPermissionRequestSent.
  ///
  /// In en, this message translates to:
  /// **'USB permission request sent.'**
  String get usbPermissionRequestSent;

  /// No description provided for @usbPermissionRequestSentApprove.
  ///
  /// In en, this message translates to:
  /// **'USB permission request sent. Approve the prompt to enable USB.'**
  String get usbPermissionRequestSentApprove;

  /// No description provided for @usbAlreadyReady.
  ///
  /// In en, this message translates to:
  /// **'USB dongle is already initialized and ready.'**
  String get usbAlreadyReady;

  /// No description provided for @failedToRequestUsbPermission.
  ///
  /// In en, this message translates to:
  /// **'Failed to request USB permission.'**
  String get failedToRequestUsbPermission;

  /// No description provided for @transmitterHelpInternal.
  ///
  /// In en, this message translates to:
  /// **'Use the phone’s built-in IR emitter to send commands.'**
  String get transmitterHelpInternal;

  /// No description provided for @transmitterHelpUsb.
  ///
  /// In en, this message translates to:
  /// **'Use a USB IR dongle (permission required) to send commands.'**
  String get transmitterHelpUsb;

  /// No description provided for @transmitterHelpAudio1.
  ///
  /// In en, this message translates to:
  /// **'Use audio output (mono). Requires an audio-to-IR LED adapter and high media volume.'**
  String get transmitterHelpAudio1;

  /// No description provided for @transmitterHelpAudio2.
  ///
  /// In en, this message translates to:
  /// **'Use audio output (stereo). Uses two channels for improved LED driving with compatible adapters.'**
  String get transmitterHelpAudio2;

  /// No description provided for @transmitterInternal.
  ///
  /// In en, this message translates to:
  /// **'Internal IR'**
  String get transmitterInternal;

  /// No description provided for @transmitterUsb.
  ///
  /// In en, this message translates to:
  /// **'USB IR Dongle'**
  String get transmitterUsb;

  /// No description provided for @transmitterAudio1.
  ///
  /// In en, this message translates to:
  /// **'Audio (1 LED)'**
  String get transmitterAudio1;

  /// No description provided for @transmitterAudio2.
  ///
  /// In en, this message translates to:
  /// **'Audio (2 LEDs)'**
  String get transmitterAudio2;

  /// No description provided for @failedToLoadTransmitterCapabilities.
  ///
  /// In en, this message translates to:
  /// **'Failed to load transmitter capabilities.'**
  String get failedToLoadTransmitterCapabilities;

  /// No description provided for @selectedTransmitter.
  ///
  /// In en, this message translates to:
  /// **'Selected transmitter'**
  String get selectedTransmitter;

  /// No description provided for @selectedTransmitterValue.
  ///
  /// In en, this message translates to:
  /// **'{effective} • Active: {active}'**
  String selectedTransmitterValue(Object effective, Object active);

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @autoSwitchTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto-switch'**
  String get autoSwitchTitle;

  /// No description provided for @autoSwitchDisabledWhileAudio.
  ///
  /// In en, this message translates to:
  /// **'Disabled while using Audio mode'**
  String get autoSwitchDisabledWhileAudio;

  /// No description provided for @autoSwitchUsesUsbOtherwiseInternal.
  ///
  /// In en, this message translates to:
  /// **'Uses USB when connected, otherwise Internal'**
  String get autoSwitchUsesUsbOtherwiseInternal;

  /// No description provided for @unavailableOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Unavailable on this device'**
  String get unavailableOnThisDevice;

  /// No description provided for @openOnUsbAttachTitle.
  ///
  /// In en, this message translates to:
  /// **'Open on USB attach'**
  String get openOnUsbAttachTitle;

  /// No description provided for @openOnUsbAttachSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Android may suggest opening the app when a supported USB IR dongle is connected.'**
  String get openOnUsbAttachSubtitle;

  /// No description provided for @openOnUsbAttachEnabledMessage.
  ///
  /// In en, this message translates to:
  /// **'Will suggest opening IR Blaster when a supported USB dongle is attached.'**
  String get openOnUsbAttachEnabledMessage;

  /// No description provided for @openOnUsbAttachDisabledMessage.
  ///
  /// In en, this message translates to:
  /// **'Won\'t suggest opening on USB attach.'**
  String get openOnUsbAttachDisabledMessage;

  /// No description provided for @failedToUpdateSetting.
  ///
  /// In en, this message translates to:
  /// **'Failed to update setting.'**
  String get failedToUpdateSetting;

  /// No description provided for @unnamedButton.
  ///
  /// In en, this message translates to:
  /// **'Unnamed button'**
  String get unnamedButton;

  /// No description provided for @iconFallback.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get iconFallback;

  /// No description provided for @remoteListReorderHint.
  ///
  /// In en, this message translates to:
  /// **'Reorder mode: long-press and drag a card to move it.'**
  String get remoteListReorderHint;

  /// No description provided for @deleteRemoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete remote?'**
  String get deleteRemoteTitle;

  /// No description provided for @deleteRemoteMessage.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" will be permanently removed. This action can\'t be undone.'**
  String deleteRemoteMessage(Object name);

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @addToDeviceControlsTitle.
  ///
  /// In en, this message translates to:
  /// **'Add to Device Controls?'**
  String get addToDeviceControlsTitle;

  /// No description provided for @addToDeviceControlsDescription.
  ///
  /// In en, this message translates to:
  /// **'Quick access in the system device controls.'**
  String get addToDeviceControlsDescription;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addedToDeviceControls.
  ///
  /// In en, this message translates to:
  /// **'Added to Device Controls.'**
  String get addedToDeviceControls;

  /// No description provided for @deletedRemoteUndoUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Deleted \"{name}\". This action can\'t be undone.'**
  String deletedRemoteUndoUnavailable(Object name);

  /// No description provided for @remoteLayoutSummary.
  ///
  /// In en, this message translates to:
  /// **'{count} button(s) · {layout}'**
  String remoteLayoutSummary(Object count, Object layout);

  /// No description provided for @layoutComfort.
  ///
  /// In en, this message translates to:
  /// **'Comfort'**
  String get layoutComfort;

  /// No description provided for @layoutCompact.
  ///
  /// In en, this message translates to:
  /// **'Compact'**
  String get layoutCompact;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @useThisRemote.
  ///
  /// In en, this message translates to:
  /// **'Use this remote'**
  String get useThisRemote;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editRemoteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Rename, and edit buttons'**
  String get editRemoteSubtitle;

  /// No description provided for @thisCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This cannot be undone'**
  String get thisCannotBeUndone;

  /// No description provided for @searchRemotes.
  ///
  /// In en, this message translates to:
  /// **'Search Remotes'**
  String get searchRemotes;

  /// No description provided for @reorderRemotes.
  ///
  /// In en, this message translates to:
  /// **'Reorder remotes'**
  String get reorderRemotes;

  /// No description provided for @addRemote.
  ///
  /// In en, this message translates to:
  /// **'Add remote'**
  String get addRemote;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @reorderMode.
  ///
  /// In en, this message translates to:
  /// **'Reorder mode'**
  String get reorderMode;

  /// No description provided for @remoteButtonCountLabel.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} button} other{{count} buttons}}'**
  String remoteButtonCountLabel(int count);

  /// No description provided for @noRemotesYet.
  ///
  /// In en, this message translates to:
  /// **'No remotes yet'**
  String get noRemotesYet;

  /// No description provided for @noRemotesDescription.
  ///
  /// In en, this message translates to:
  /// **'Create a remote to start sending IR codes.'**
  String get noRemotesDescription;

  /// No description provided for @noRemotesNextStep.
  ///
  /// In en, this message translates to:
  /// **'What next: tap Add remote, then add your first buttons.'**
  String get noRemotesNextStep;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @macrosTitle.
  ///
  /// In en, this message translates to:
  /// **'Macros'**
  String get macrosTitle;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @createMacro.
  ///
  /// In en, this message translates to:
  /// **'Create Macro'**
  String get createMacro;

  /// No description provided for @timedMacrosTitle.
  ///
  /// In en, this message translates to:
  /// **'Timed Macros'**
  String get timedMacrosTitle;

  /// No description provided for @timedMacrosSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Automate sequences of IR commands with precise timing'**
  String get timedMacrosSubtitle;

  /// No description provided for @timedMacrosNextStep.
  ///
  /// In en, this message translates to:
  /// **'What next: tap Create Your First Macro, pick a remote, then add commands and delays.'**
  String get timedMacrosNextStep;

  /// No description provided for @macroFeatureToysTitle.
  ///
  /// In en, this message translates to:
  /// **'Perfect for Interactive Toys'**
  String get macroFeatureToysTitle;

  /// No description provided for @macroFeatureToysDescription.
  ///
  /// In en, this message translates to:
  /// **'Control devices like i-cybie robot dogs, i-sobot robots, and other toys that need time between commands to process actions.'**
  String get macroFeatureToysDescription;

  /// No description provided for @macroFeatureTimingTitle.
  ///
  /// In en, this message translates to:
  /// **'Precise Timing Control'**
  String get macroFeatureTimingTitle;

  /// No description provided for @macroFeatureTimingDescription.
  ///
  /// In en, this message translates to:
  /// **'Add delays between commands (250ms to custom durations) so your device has time to respond before the next action.'**
  String get macroFeatureTimingDescription;

  /// No description provided for @macroFeatureManualTitle.
  ///
  /// In en, this message translates to:
  /// **'Manual Continue Steps'**
  String get macroFeatureManualTitle;

  /// No description provided for @macroFeatureManualDescription.
  ///
  /// In en, this message translates to:
  /// **'Pause execution and wait for your confirmation when animation length varies or you need visual feedback.'**
  String get macroFeatureManualDescription;

  /// No description provided for @exampleUseCase.
  ///
  /// In en, this message translates to:
  /// **'Example Use Case'**
  String get exampleUseCase;

  /// No description provided for @macroExampleText.
  ///
  /// In en, this message translates to:
  /// **'i-cybie Advanced Mode:\n1. Send \"Mode\" command\n2. Wait 1000ms (toy processes)\n3. Send \"Action 1\"\n4. Wait 1000ms\n5. Send \"Action 2\"\n…and so on automatically!'**
  String get macroExampleText;

  /// No description provided for @createFirstMacro.
  ///
  /// In en, this message translates to:
  /// **'Create Your First Macro'**
  String get createFirstMacro;

  /// No description provided for @noRemote.
  ///
  /// In en, this message translates to:
  /// **'No remote'**
  String get noRemote;

  /// No description provided for @macroStepCountLabel.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} step} other{{count} steps}}'**
  String macroStepCountLabel(int count);

  /// No description provided for @aboutTimedMacros.
  ///
  /// In en, this message translates to:
  /// **'About Timed Macros'**
  String get aboutTimedMacros;

  /// No description provided for @aboutTimedMacrosDescription.
  ///
  /// In en, this message translates to:
  /// **'Timed Macros let you automate sequences of IR commands with precise delays between each step.'**
  String get aboutTimedMacrosDescription;

  /// No description provided for @sendCommand.
  ///
  /// In en, this message translates to:
  /// **'Send Command'**
  String get sendCommand;

  /// No description provided for @sendCommandDescription.
  ///
  /// In en, this message translates to:
  /// **'Transmits an IR command from your remote.'**
  String get sendCommandDescription;

  /// No description provided for @delay.
  ///
  /// In en, this message translates to:
  /// **'Delay'**
  String get delay;

  /// No description provided for @delayDescription.
  ///
  /// In en, this message translates to:
  /// **'Waits for a specified duration (e.g., 1000ms) before the next step.'**
  String get delayDescription;

  /// No description provided for @manualContinue.
  ///
  /// In en, this message translates to:
  /// **'Manual Continue'**
  String get manualContinue;

  /// No description provided for @manualContinueDescription.
  ///
  /// In en, this message translates to:
  /// **'Pauses execution until you tap Continue (useful for variable-length animations).'**
  String get manualContinueDescription;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// No description provided for @failedToSaveMacros.
  ///
  /// In en, this message translates to:
  /// **'Failed to save macros.'**
  String get failedToSaveMacros;

  /// No description provided for @deletedMacroNamed.
  ///
  /// In en, this message translates to:
  /// **'Deleted \"{name}\".'**
  String deletedMacroNamed(Object name);

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @failedToRestoreMacro.
  ///
  /// In en, this message translates to:
  /// **'Failed to restore macro.'**
  String get failedToRestoreMacro;

  /// No description provided for @deleteMacroTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete macro?'**
  String get deleteMacroTitle;

  /// No description provided for @deleteMacroMessage.
  ///
  /// In en, this message translates to:
  /// **'You can undo this from the next snackbar.'**
  String get deleteMacroMessage;

  /// No description provided for @noRemotesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No remotes available.'**
  String get noRemotesAvailable;

  /// No description provided for @remoteButtonCountSummary.
  ///
  /// In en, this message translates to:
  /// **'{count} button(s)'**
  String remoteButtonCountSummary(Object count);

  /// No description provided for @remoteOrientationFlippedTooltip.
  ///
  /// In en, this message translates to:
  /// **'Orientation: flipped (tap to normal)'**
  String get remoteOrientationFlippedTooltip;

  /// No description provided for @remoteOrientationNormalTooltip.
  ///
  /// In en, this message translates to:
  /// **'Orientation: normal (tap to flip)'**
  String get remoteOrientationNormalTooltip;

  /// No description provided for @stopLoop.
  ///
  /// In en, this message translates to:
  /// **'Stop loop'**
  String get stopLoop;

  /// No description provided for @reorderButtons.
  ///
  /// In en, this message translates to:
  /// **'Reorder buttons'**
  String get reorderButtons;

  /// No description provided for @remoteReorderHint.
  ///
  /// In en, this message translates to:
  /// **'Reorder mode: long-press and drag a button to move it.'**
  String get remoteReorderHint;

  /// No description provided for @manageRemote.
  ///
  /// In en, this message translates to:
  /// **'Manage remote'**
  String get manageRemote;

  /// No description provided for @remoteNoButtons.
  ///
  /// In en, this message translates to:
  /// **'No buttons in this remote'**
  String get remoteNoButtons;

  /// No description provided for @remoteNoButtonsDescription.
  ///
  /// In en, this message translates to:
  /// **'Use \"Edit remote\" to add or configure buttons.'**
  String get remoteNoButtonsDescription;

  /// No description provided for @editRemote.
  ///
  /// In en, this message translates to:
  /// **'Edit remote'**
  String get editRemote;

  /// No description provided for @editRemoteActionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Rename, reorder, and edit buttons'**
  String get editRemoteActionsSubtitle;

  /// No description provided for @remoteUpdatedNamedButton.
  ///
  /// In en, this message translates to:
  /// **'Updated \"{name}\".'**
  String remoteUpdatedNamedButton(Object name);

  /// No description provided for @buttonAddedNamed.
  ///
  /// In en, this message translates to:
  /// **'Added \"{name}\".'**
  String buttonAddedNamed(Object name);

  /// No description provided for @buttonDuplicated.
  ///
  /// In en, this message translates to:
  /// **'Button duplicated.'**
  String get buttonDuplicated;

  /// No description provided for @loopRunningForButton.
  ///
  /// In en, this message translates to:
  /// **'Loop is running for this button.'**
  String get loopRunningForButton;

  /// No description provided for @loopTip.
  ///
  /// In en, this message translates to:
  /// **'Tip: Use Loop to repeat until you stop it.'**
  String get loopTip;

  /// No description provided for @codeCopied.
  ///
  /// In en, this message translates to:
  /// **'Code copied.'**
  String get codeCopied;

  /// No description provided for @copyCode.
  ///
  /// In en, this message translates to:
  /// **'Copy code'**
  String get copyCode;

  /// No description provided for @startLoop.
  ///
  /// In en, this message translates to:
  /// **'Start loop'**
  String get startLoop;

  /// No description provided for @editButtonSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Modify label, code, protocol, frequency'**
  String get editButtonSubtitle;

  /// No description provided for @newButton.
  ///
  /// In en, this message translates to:
  /// **'New button'**
  String get newButton;

  /// No description provided for @newButtonSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a new button after this one'**
  String get newButtonSubtitle;

  /// No description provided for @duplicate.
  ///
  /// In en, this message translates to:
  /// **'Duplicate'**
  String get duplicate;

  /// No description provided for @duplicateButtonSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a copy of this button'**
  String get duplicateButtonSubtitle;

  /// No description provided for @removeFromDeviceControls.
  ///
  /// In en, this message translates to:
  /// **'Remove from Device Controls'**
  String get removeFromDeviceControls;

  /// No description provided for @addToDeviceControls.
  ///
  /// In en, this message translates to:
  /// **'Add to Device Controls'**
  String get addToDeviceControls;

  /// No description provided for @deviceControlsButtonSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shows this button in the system device controls'**
  String get deviceControlsButtonSubtitle;

  /// No description provided for @removedFromDeviceControls.
  ///
  /// In en, this message translates to:
  /// **'Removed from Device Controls.'**
  String get removedFromDeviceControls;

  /// No description provided for @pinQuickTile.
  ///
  /// In en, this message translates to:
  /// **'Pin to Quick Tile favorites'**
  String get pinQuickTile;

  /// No description provided for @unpinQuickTile.
  ///
  /// In en, this message translates to:
  /// **'Unpin from Quick Tile favorites'**
  String get unpinQuickTile;

  /// No description provided for @quickTileButtonSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shows this button at the top of the quick tile chooser'**
  String get quickTileButtonSubtitle;

  /// No description provided for @removedFromQuickTileFavorites.
  ///
  /// In en, this message translates to:
  /// **'Removed from Quick Tile favorites.'**
  String get removedFromQuickTileFavorites;

  /// No description provided for @pinnedToQuickTileFavorites.
  ///
  /// In en, this message translates to:
  /// **'Pinned to Quick Tile favorites.'**
  String get pinnedToQuickTileFavorites;

  /// No description provided for @duplicateAndEdit.
  ///
  /// In en, this message translates to:
  /// **'Duplicate and edit'**
  String get duplicateAndEdit;

  /// No description provided for @duplicateAndEditSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a copy and edit it immediately'**
  String get duplicateAndEditSubtitle;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @run.
  ///
  /// In en, this message translates to:
  /// **'Run'**
  String get run;

  /// No description provided for @untitledRemote.
  ///
  /// In en, this message translates to:
  /// **'Untitled Remote'**
  String get untitledRemote;

  /// No description provided for @createRemoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Create remote'**
  String get createRemoteTitle;

  /// No description provided for @editRemoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit remote'**
  String get editRemoteTitle;

  /// No description provided for @removeButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove button?'**
  String get removeButtonTitle;

  /// No description provided for @imageButtonRemovedMessage.
  ///
  /// In en, this message translates to:
  /// **'This image button will be removed.'**
  String get imageButtonRemovedMessage;

  /// No description provided for @namedButtonRemovedMessage.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" will be removed.'**
  String namedButtonRemovedMessage(Object name);

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @importedButtonCount.
  ///
  /// In en, this message translates to:
  /// **'Imported {count} button(s).'**
  String importedButtonCount(int count);

  /// No description provided for @importedButtonsFromExistingRemotes.
  ///
  /// In en, this message translates to:
  /// **'Imported {count} button(s) from existing remotes.'**
  String importedButtonsFromExistingRemotes(int count);

  /// No description provided for @editButtonSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Change label, signal, and advanced settings'**
  String get editButtonSettingsSubtitle;

  /// No description provided for @createButtonCopySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a copy of this button'**
  String get createButtonCopySubtitle;

  /// No description provided for @duplicateAndEditButtonSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a copy and edit it immediately'**
  String get duplicateAndEditButtonSubtitle;

  /// No description provided for @undoAvailableInNextSnackbar.
  ///
  /// In en, this message translates to:
  /// **'You can undo from the next snackbar'**
  String get undoAvailableInNextSnackbar;

  /// No description provided for @buttonRemoved.
  ///
  /// In en, this message translates to:
  /// **'Button removed.'**
  String get buttonRemoved;

  /// No description provided for @remoteNameCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Remote name can\'t be empty.'**
  String get remoteNameCannotBeEmpty;

  /// No description provided for @saveRemote.
  ///
  /// In en, this message translates to:
  /// **'Save remote'**
  String get saveRemote;

  /// No description provided for @remoteName.
  ///
  /// In en, this message translates to:
  /// **'Remote name'**
  String get remoteName;

  /// No description provided for @remoteNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., TV, Air Conditioner, LED Strip'**
  String get remoteNameHint;

  /// No description provided for @remoteNameHelper.
  ///
  /// In en, this message translates to:
  /// **'This name appears in your Remotes list.'**
  String get remoteNameHelper;

  /// No description provided for @layoutStyle.
  ///
  /// In en, this message translates to:
  /// **'Layout style'**
  String get layoutStyle;

  /// No description provided for @layoutWideDescription.
  ///
  /// In en, this message translates to:
  /// **'Wide: 2-column buttons with extra details (recommended).'**
  String get layoutWideDescription;

  /// No description provided for @layoutCompactDescription.
  ///
  /// In en, this message translates to:
  /// **'Compact: classic 4× grid (icons/text only).'**
  String get layoutCompactDescription;

  /// No description provided for @importFromRemotes.
  ///
  /// In en, this message translates to:
  /// **'Import from remotes'**
  String get importFromRemotes;

  /// No description provided for @importFromDatabase.
  ///
  /// In en, this message translates to:
  /// **'Import from DB'**
  String get importFromDatabase;

  /// No description provided for @addButton.
  ///
  /// In en, this message translates to:
  /// **'Add button'**
  String get addButton;

  /// No description provided for @noButtonsYet.
  ///
  /// In en, this message translates to:
  /// **'No buttons yet'**
  String get noButtonsYet;

  /// No description provided for @createRemoteEmptyStateDescription.
  ///
  /// In en, this message translates to:
  /// **'Add your first button, then long-press it for edit/remove options.'**
  String get createRemoteEmptyStateDescription;

  /// No description provided for @createButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Button'**
  String get createButtonTitle;

  /// No description provided for @editButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Button'**
  String get editButtonTitle;

  /// No description provided for @failedToLoadProtocols.
  ///
  /// In en, this message translates to:
  /// **'Failed to load protocols: {error}'**
  String failedToLoadProtocols(Object error);

  /// No description provided for @failedToLoadDatabaseKeys.
  ///
  /// In en, this message translates to:
  /// **'Failed to load database keys: {error}'**
  String failedToLoadDatabaseKeys(Object error);

  /// No description provided for @presetPower.
  ///
  /// In en, this message translates to:
  /// **'Power'**
  String get presetPower;

  /// No description provided for @presetVolume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get presetVolume;

  /// No description provided for @presetChannel.
  ///
  /// In en, this message translates to:
  /// **'Channel'**
  String get presetChannel;

  /// No description provided for @presetNavigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get presetNavigation;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @completeRequiredFieldsToSave.
  ///
  /// In en, this message translates to:
  /// **'Complete required fields to save'**
  String get completeRequiredFieldsToSave;

  /// No description provided for @buttonLabelStepTitle.
  ///
  /// In en, this message translates to:
  /// **'1) Button label'**
  String get buttonLabelStepTitle;

  /// No description provided for @buttonLabelStepSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose an image, icon, or type a text label.'**
  String get buttonLabelStepSubtitle;

  /// No description provided for @buttonColorStepTitle.
  ///
  /// In en, this message translates to:
  /// **'2) Button color (optional)'**
  String get buttonColorStepTitle;

  /// No description provided for @buttonColorStepSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a background color for this button.'**
  String get buttonColorStepSubtitle;

  /// No description provided for @selectColor.
  ///
  /// In en, this message translates to:
  /// **'Select color:'**
  String get selectColor;

  /// No description provided for @noImageSelected.
  ///
  /// In en, this message translates to:
  /// **'No image selected'**
  String get noImageSelected;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @builtIn.
  ///
  /// In en, this message translates to:
  /// **'Built-in'**
  String get builtIn;

  /// No description provided for @removeImage.
  ///
  /// In en, this message translates to:
  /// **'Remove image'**
  String get removeImage;

  /// No description provided for @requiredSelectImageOrSwitch.
  ///
  /// In en, this message translates to:
  /// **'Required: select an image, choose an icon, or switch to Text.'**
  String get requiredSelectImageOrSwitch;

  /// No description provided for @iconSelected.
  ///
  /// In en, this message translates to:
  /// **'Icon selected'**
  String get iconSelected;

  /// No description provided for @noIconSelected.
  ///
  /// In en, this message translates to:
  /// **'No icon selected'**
  String get noIconSelected;

  /// No description provided for @chooseIcon.
  ///
  /// In en, this message translates to:
  /// **'Choose Icon'**
  String get chooseIcon;

  /// No description provided for @removeIcon.
  ///
  /// In en, this message translates to:
  /// **'Remove icon'**
  String get removeIcon;

  /// No description provided for @requiredSelectIconOrSwitch.
  ///
  /// In en, this message translates to:
  /// **'Required: select an icon or switch to Image/Text.'**
  String get requiredSelectIconOrSwitch;

  /// No description provided for @buttonText.
  ///
  /// In en, this message translates to:
  /// **'Button text'**
  String get buttonText;

  /// No description provided for @buttonTextHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Power, Volume +, HDMI 1'**
  String get buttonTextHint;

  /// No description provided for @buttonTextHelper.
  ///
  /// In en, this message translates to:
  /// **'This text will appear on the button.'**
  String get buttonTextHelper;

  /// No description provided for @requiredEnterButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Required: enter a button label.'**
  String get requiredEnterButtonLabel;

  /// No description provided for @defaultColorName.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultColorName;

  /// No description provided for @newRemoteCreatedFromLastHit.
  ///
  /// In en, this message translates to:
  /// **'New remote created with one button from last hit.'**
  String get newRemoteCreatedFromLastHit;

  /// No description provided for @selectRemote.
  ///
  /// In en, this message translates to:
  /// **'Select remote'**
  String get selectRemote;

  /// No description provided for @remoteNumber.
  ///
  /// In en, this message translates to:
  /// **'Remote #{id}'**
  String remoteNumber(Object id);

  /// No description provided for @newRemoteCreated.
  ///
  /// In en, this message translates to:
  /// **'New remote created.'**
  String get newRemoteCreated;

  /// No description provided for @failedToCreateRemote.
  ///
  /// In en, this message translates to:
  /// **'Failed to create remote.'**
  String get failedToCreateRemote;

  /// No description provided for @newRemoteEllipsis.
  ///
  /// In en, this message translates to:
  /// **'New remote…'**
  String get newRemoteEllipsis;

  /// No description provided for @addedToRemoteNamed.
  ///
  /// In en, this message translates to:
  /// **'Added to {name}.'**
  String addedToRemoteNamed(Object name);

  /// No description provided for @failedToAddToRemote.
  ///
  /// In en, this message translates to:
  /// **'Failed to add to remote.'**
  String get failedToAddToRemote;

  /// No description provided for @newRemoteDefaultName.
  ///
  /// In en, this message translates to:
  /// **'New Remote'**
  String get newRemoteDefaultName;

  /// No description provided for @jumpedToOffsetPaused.
  ///
  /// In en, this message translates to:
  /// **'Jumped to offset {offset}. Paused - press Resume to continue.'**
  String jumpedToOffsetPaused(int offset);

  /// No description provided for @sent.
  ///
  /// In en, this message translates to:
  /// **'Sent.'**
  String get sent;

  /// No description provided for @failedToSend.
  ///
  /// In en, this message translates to:
  /// **'Failed to send: {error}'**
  String failedToSend(Object error);

  /// No description provided for @copiedProtocolCode.
  ///
  /// In en, this message translates to:
  /// **'Copied (protocol:code).'**
  String get copiedProtocolCode;

  /// No description provided for @savedToResults.
  ///
  /// In en, this message translates to:
  /// **'Saved to Results.'**
  String get savedToResults;

  /// No description provided for @invalidCodeForProtocol.
  ///
  /// In en, this message translates to:
  /// **'Invalid code for protocol: {error}'**
  String invalidCodeForProtocol(Object error);

  /// No description provided for @copiedCurrentCandidate.
  ///
  /// In en, this message translates to:
  /// **'Copied current candidate.'**
  String get copiedCurrentCandidate;

  /// No description provided for @jumpToOffset.
  ///
  /// In en, this message translates to:
  /// **'Jump to offset'**
  String get jumpToOffset;

  /// No description provided for @jumpToBruteCursor.
  ///
  /// In en, this message translates to:
  /// **'Jump to brute cursor'**
  String get jumpToBruteCursor;

  /// No description provided for @jump.
  ///
  /// In en, this message translates to:
  /// **'Jump'**
  String get jump;

  /// No description provided for @jumpedToCursorPaused.
  ///
  /// In en, this message translates to:
  /// **'Jumped to cursor 0x{cursor}. Paused - press Resume to continue.'**
  String jumpedToCursorPaused(Object cursor);

  /// No description provided for @irSignalTester.
  ///
  /// In en, this message translates to:
  /// **'IR Signal Tester'**
  String get irSignalTester;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @selectButton.
  ///
  /// In en, this message translates to:
  /// **'Select button'**
  String get selectButton;

  /// No description provided for @buttonNotFoundInRemotes.
  ///
  /// In en, this message translates to:
  /// **'Button not found in remotes.'**
  String get buttonNotFoundInRemotes;

  /// No description provided for @sentNamed.
  ///
  /// In en, this message translates to:
  /// **'Sent \"{name}\".'**
  String sentNamed(Object name);

  /// No description provided for @sendFailed.
  ///
  /// In en, this message translates to:
  /// **'Send failed: {error}'**
  String sendFailed(Object error);

  /// No description provided for @noFavoritesYet.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get noFavoritesYet;

  /// No description provided for @deviceControlsEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Long-press a remote button and select “Add to Device Controls”.'**
  String get deviceControlsEmptyHint;

  /// No description provided for @sendTest.
  ///
  /// In en, this message translates to:
  /// **'Send test'**
  String get sendTest;

  /// No description provided for @testSendCompleted.
  ///
  /// In en, this message translates to:
  /// **'Test send completed.'**
  String get testSendCompleted;

  /// No description provided for @testSendFailed.
  ///
  /// In en, this message translates to:
  /// **'Test send failed: {error}'**
  String testSendFailed(Object error);

  /// No description provided for @removedNamed.
  ///
  /// In en, this message translates to:
  /// **'Removed \"{name}\".'**
  String removedNamed(Object name);

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @model.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// No description provided for @selectBrand.
  ///
  /// In en, this message translates to:
  /// **'Select brand'**
  String get selectBrand;

  /// No description provided for @searchBrand.
  ///
  /// In en, this message translates to:
  /// **'Search brand…'**
  String get searchBrand;

  /// No description provided for @selectModel.
  ///
  /// In en, this message translates to:
  /// **'Select model'**
  String get selectModel;

  /// No description provided for @searchModel.
  ///
  /// In en, this message translates to:
  /// **'Search model…'**
  String get searchModel;

  /// No description provided for @unnamedKey.
  ///
  /// In en, this message translates to:
  /// **'Unnamed key'**
  String get unnamedKey;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @emDash.
  ///
  /// In en, this message translates to:
  /// **'-'**
  String get emDash;

  /// No description provided for @searchCommands.
  ///
  /// In en, this message translates to:
  /// **'Search commands'**
  String get searchCommands;

  /// No description provided for @noMatchingCommands.
  ///
  /// In en, this message translates to:
  /// **'No matching commands'**
  String get noMatchingCommands;

  /// No description provided for @quickTileFavoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick tile favorites'**
  String get quickTileFavoritesTitle;

  /// No description provided for @changeMappingForTile.
  ///
  /// In en, this message translates to:
  /// **'Change mapping for {tileLabel} tile'**
  String changeMappingForTile(Object tileLabel);

  /// No description provided for @pickDifferentButton.
  ///
  /// In en, this message translates to:
  /// **'Pick a different button'**
  String get pickDifferentButton;

  /// No description provided for @browseAllRemotesEllipsis.
  ///
  /// In en, this message translates to:
  /// **'Browse all remotes…'**
  String get browseAllRemotesEllipsis;

  /// No description provided for @invalidMacroFileFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid macro file format.'**
  String get invalidMacroFileFormat;

  /// No description provided for @failedToParseMacroFile.
  ///
  /// In en, this message translates to:
  /// **'Failed to parse macro file.'**
  String get failedToParseMacroFile;

  /// No description provided for @deviceCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Device Code'**
  String get deviceCodeLabel;

  /// No description provided for @commandLabel.
  ///
  /// In en, this message translates to:
  /// **'Command'**
  String get commandLabel;

  /// No description provided for @editButtonCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Code of the button'**
  String get editButtonCodeTitle;

  /// No description provided for @thisRemoteHasNoButtons.
  ///
  /// In en, this message translates to:
  /// **'This remote has no buttons.'**
  String get thisRemoteHasNoButtons;

  /// No description provided for @selectCommand.
  ///
  /// In en, this message translates to:
  /// **'Select Command'**
  String get selectCommand;

  /// No description provided for @databaseModeAutofillHint.
  ///
  /// In en, this message translates to:
  /// **'Database mode auto-fills Step 2 for you (brand + model + protocol). After importing a key, you can refine anything in Manual.'**
  String get databaseModeAutofillHint;

  /// No description provided for @test.
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get test;

  /// No description provided for @allSelectedButtonsWereDuplicates.
  ///
  /// In en, this message translates to:
  /// **'All selected buttons were duplicates.'**
  String get allSelectedButtonsWereDuplicates;

  /// No description provided for @noButtonsImported.
  ///
  /// In en, this message translates to:
  /// **'No buttons imported.'**
  String get noButtonsImported;

  /// No description provided for @importedButtonsSkippedDuplicates.
  ///
  /// In en, this message translates to:
  /// **'Imported {addedCount} button(s). Skipped {skippedCount} duplicate(s).'**
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount);

  /// No description provided for @importAllMatchingTitle.
  ///
  /// In en, this message translates to:
  /// **'Import all matching buttons?'**
  String get importAllMatchingTitle;

  /// No description provided for @noMatchingKeysFound.
  ///
  /// In en, this message translates to:
  /// **'No matching keys found.'**
  String get noMatchingKeysFound;

  /// No description provided for @importAllMatchingMessage.
  ///
  /// In en, this message translates to:
  /// **'This will import up to {count} matching keys from the current database selection.'**
  String importAllMatchingMessage(int count);

  /// No description provided for @importAll.
  ///
  /// In en, this message translates to:
  /// **'Import all'**
  String get importAll;

  /// No description provided for @importingButtons.
  ///
  /// In en, this message translates to:
  /// **'Importing buttons…'**
  String get importingButtons;

  /// No description provided for @allMatchingButtonsWereDuplicates.
  ///
  /// In en, this message translates to:
  /// **'All matching buttons were duplicates.'**
  String get allMatchingButtonsWereDuplicates;

  /// No description provided for @quickPresets.
  ///
  /// In en, this message translates to:
  /// **'Quick presets'**
  String get quickPresets;

  /// No description provided for @selectDeviceFirst.
  ///
  /// In en, this message translates to:
  /// **'Select device first'**
  String get selectDeviceFirst;

  /// No description provided for @searchByLabelOrHex.
  ///
  /// In en, this message translates to:
  /// **'Search by label or hex'**
  String get searchByLabelOrHex;

  /// No description provided for @optionalRefinePresetKeys.
  ///
  /// In en, this message translates to:
  /// **'Optional: refine the {preset} preset keys'**
  String optionalRefinePresetKeys(Object preset);

  /// No description provided for @selectBrandModelProtocolFirst.
  ///
  /// In en, this message translates to:
  /// **'Select brand, model, and protocol first.'**
  String get selectBrandModelProtocolFirst;

  /// No description provided for @importFromDatabaseTitle.
  ///
  /// In en, this message translates to:
  /// **'Import from database'**
  String get importFromDatabaseTitle;

  /// No description provided for @importFromDatabaseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a device, load matching keys, then import selected buttons.'**
  String get importFromDatabaseSubtitle;

  /// No description provided for @deviceAndFilters.
  ///
  /// In en, this message translates to:
  /// **'Device & filters'**
  String get deviceAndFilters;

  /// No description provided for @loadedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} loaded'**
  String loadedCount(int count);

  /// No description provided for @hideFilters.
  ///
  /// In en, this message translates to:
  /// **'Hide filters'**
  String get hideFilters;

  /// No description provided for @showFilters.
  ///
  /// In en, this message translates to:
  /// **'Show filters'**
  String get showFilters;

  /// No description provided for @noProtocolFoundForBrandModel.
  ///
  /// In en, this message translates to:
  /// **'No protocol found for this brand and model.'**
  String get noProtocolFoundForBrandModel;

  /// No description provided for @protocolAutoDetected.
  ///
  /// In en, this message translates to:
  /// **'Protocol'**
  String get protocolAutoDetected;

  /// No description provided for @protocolAutoDetectedHelper.
  ///
  /// In en, this message translates to:
  /// **'Auto-detected from the database. You can change it before importing.'**
  String get protocolAutoDetectedHelper;

  /// No description provided for @selectBrandModelToLoadKeys.
  ///
  /// In en, this message translates to:
  /// **'Select a brand, model, and protocol to load keys.'**
  String get selectBrandModelToLoadKeys;

  /// No description provided for @noKeysFound.
  ///
  /// In en, this message translates to:
  /// **'No keys found.'**
  String get noKeysFound;

  /// No description provided for @noKeysFoundForSearch.
  ///
  /// In en, this message translates to:
  /// **'No keys found for “{query}”.'**
  String noKeysFoundForSearch(Object query);

  /// No description provided for @skipDuplicates.
  ///
  /// In en, this message translates to:
  /// **'Skip duplicates'**
  String get skipDuplicates;

  /// No description provided for @skipDuplicatesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Do not import buttons that already exist in this remote.'**
  String get skipDuplicatesSubtitle;

  /// No description provided for @importSelected.
  ///
  /// In en, this message translates to:
  /// **'Import selected'**
  String get importSelected;

  /// No description provided for @noMacrosToExport.
  ///
  /// In en, this message translates to:
  /// **'No macros to export.'**
  String get noMacrosToExport;

  /// No description provided for @macrosExportedToDownloads.
  ///
  /// In en, this message translates to:
  /// **'Macros exported to Downloads.'**
  String get macrosExportedToDownloads;

  /// No description provided for @failedToExportMacros.
  ///
  /// In en, this message translates to:
  /// **'Failed to export macros.'**
  String get failedToExportMacros;

  /// No description provided for @failedToReadFile.
  ///
  /// In en, this message translates to:
  /// **'Failed to read file.'**
  String get failedToReadFile;

  /// No description provided for @importFromExistingRemotesTitle.
  ///
  /// In en, this message translates to:
  /// **'Import from Existing Remotes'**
  String get importFromExistingRemotesTitle;

  /// No description provided for @selectedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String selectedCount(int count);

  /// No description provided for @noOtherRemotesWithButtons.
  ///
  /// In en, this message translates to:
  /// **'No other remotes with buttons found.'**
  String get noOtherRemotesWithButtons;

  /// No description provided for @sourceRemote.
  ///
  /// In en, this message translates to:
  /// **'Source remote'**
  String get sourceRemote;

  /// No description provided for @searchButtons.
  ///
  /// In en, this message translates to:
  /// **'Search buttons'**
  String get searchButtons;

  /// No description provided for @searchButtonsHint.
  ///
  /// In en, this message translates to:
  /// **'Power, Volume, Mute...'**
  String get searchButtonsHint;

  /// No description provided for @selectVisible.
  ///
  /// In en, this message translates to:
  /// **'Select visible'**
  String get selectVisible;

  /// No description provided for @clearVisible.
  ///
  /// In en, this message translates to:
  /// **'Clear visible'**
  String get clearVisible;

  /// No description provided for @protocolNamed.
  ///
  /// In en, this message translates to:
  /// **'Protocol: {name}'**
  String protocolNamed(Object name);

  /// No description provided for @rawSignal.
  ///
  /// In en, this message translates to:
  /// **'Raw'**
  String get rawSignal;

  /// No description provided for @legacyCode.
  ///
  /// In en, this message translates to:
  /// **'Legacy code'**
  String get legacyCode;

  /// No description provided for @importCount.
  ///
  /// In en, this message translates to:
  /// **'Import {count}'**
  String importCount(int count);

  /// No description provided for @storagePermissionDeniedLegacy.
  ///
  /// In en, this message translates to:
  /// **'Storage permission denied (needed on some older Android devices).'**
  String get storagePermissionDeniedLegacy;

  /// No description provided for @backupExportedToDownloads.
  ///
  /// In en, this message translates to:
  /// **'Backup exported to Downloads.'**
  String get backupExportedToDownloads;

  /// No description provided for @failedToExport.
  ///
  /// In en, this message translates to:
  /// **'Failed to export: {error}'**
  String failedToExport(Object error);

  /// No description provided for @importedLegacyJsonBackup.
  ///
  /// In en, this message translates to:
  /// **'Imported {count} remotes from legacy JSON backup. Macros were not changed.'**
  String importedLegacyJsonBackup(int count);

  /// No description provided for @importFailedRemotesMustBeList.
  ///
  /// In en, this message translates to:
  /// **'Import failed: backup \"remotes\" must be a JSON list when present.'**
  String get importFailedRemotesMustBeList;

  /// No description provided for @importFailedMacrosMustBeList.
  ///
  /// In en, this message translates to:
  /// **'Import failed: backup \"macros\" must be a JSON list when present.'**
  String get importFailedMacrosMustBeList;

  /// No description provided for @importFailedInvalidBackupFormat.
  ///
  /// In en, this message translates to:
  /// **'Import failed: invalid backup format (expected legacy List or Map with remotes/macros).'**
  String get importFailedInvalidBackupFormat;

  /// No description provided for @importedBackupRemotesOnly.
  ///
  /// In en, this message translates to:
  /// **'Imported {remoteCount} remotes from backup. Macros were not changed.'**
  String importedBackupRemotesOnly(int remoteCount);

  /// No description provided for @importedBackupRemotesAndMacros.
  ///
  /// In en, this message translates to:
  /// **'Imported {remoteCount} remotes and {macroCount} macros from backup.'**
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount);

  /// No description provided for @importFailedNoValidButtonsInIr.
  ///
  /// In en, this message translates to:
  /// **'Import failed: no valid buttons found in .ir file.'**
  String get importFailedNoValidButtonsInIr;

  /// No description provided for @importedOneRemoteFromFlipper.
  ///
  /// In en, this message translates to:
  /// **'Imported 1 remote from Flipper .ir. Macros were not changed.'**
  String get importedOneRemoteFromFlipper;

  /// No description provided for @importFailedInvalidIrplus.
  ///
  /// In en, this message translates to:
  /// **'Import failed: invalid irplus file (no valid buttons found).'**
  String get importFailedInvalidIrplus;

  /// No description provided for @importedOneRemoteFromIrplus.
  ///
  /// In en, this message translates to:
  /// **'Imported 1 remote from irplus. Macros were not changed.'**
  String get importedOneRemoteFromIrplus;

  /// No description provided for @importFailedInvalidLirc.
  ///
  /// In en, this message translates to:
  /// **'Import failed: invalid LIRC file (no valid codes/raw codes found).'**
  String get importFailedInvalidLirc;

  /// No description provided for @importedOneRemoteFromLirc.
  ///
  /// In en, this message translates to:
  /// **'Imported 1 remote from LIRC config. Macros were not changed.'**
  String get importedOneRemoteFromLirc;

  /// No description provided for @unsupportedFileTypeSelected.
  ///
  /// In en, this message translates to:
  /// **'Unsupported file type selected.'**
  String get unsupportedFileTypeSelected;

  /// No description provided for @importFailedInvalidUnreadableFile.
  ///
  /// In en, this message translates to:
  /// **'Import failed: invalid or unreadable file.'**
  String get importFailedInvalidUnreadableFile;

  /// No description provided for @bulkImportNoSupportedFilesInFolder.
  ///
  /// In en, this message translates to:
  /// **'Bulk import complete: no supported files found in folder.'**
  String get bulkImportNoSupportedFilesInFolder;

  /// No description provided for @bulkImportNoRemotesImported.
  ///
  /// In en, this message translates to:
  /// **'Bulk import complete: no remotes imported. Skipped {skippedCount} file(s).'**
  String bulkImportNoRemotesImported(int skippedCount);

  /// No description provided for @bulkImportComplete.
  ///
  /// In en, this message translates to:
  /// **'Bulk import complete: imported {importedCount} remote(s) from {supportedCount} supported file(s). Skipped {skippedCount} file(s).'**
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount);

  /// No description provided for @storagePermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Storage permission denied.'**
  String get storagePermissionDenied;

  /// No description provided for @bulkImportFailedReadFolder.
  ///
  /// In en, this message translates to:
  /// **'Bulk import failed: unable to read folder contents.'**
  String get bulkImportFailedReadFolder;

  /// No description provided for @bulkImportNoSupportedFilesSource.
  ///
  /// In en, this message translates to:
  /// **'Bulk import complete: no supported files found ({sourceLabel}).'**
  String bulkImportNoSupportedFilesSource(Object sourceLabel);

  /// No description provided for @clearAction.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearAction;

  /// No description provided for @saveAction.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveAction;

  /// No description provided for @buttonsTitleCount.
  ///
  /// In en, this message translates to:
  /// **'Buttons ({count})'**
  String buttonsTitleCount(int count);

  /// No description provided for @invalidStepEncountered.
  ///
  /// In en, this message translates to:
  /// **'Invalid step encountered'**
  String get invalidStepEncountered;

  /// No description provided for @failedToSendNamed.
  ///
  /// In en, this message translates to:
  /// **'Failed to send: {name}'**
  String failedToSendNamed(Object name);

  /// No description provided for @buttonNotFound.
  ///
  /// In en, this message translates to:
  /// **'Button not found'**
  String get buttonNotFound;

  /// No description provided for @buttonNotFoundNamed.
  ///
  /// In en, this message translates to:
  /// **'Button not found: {name}'**
  String buttonNotFoundNamed(Object name);

  /// No description provided for @unknownButton.
  ///
  /// In en, this message translates to:
  /// **'Unknown Button'**
  String get unknownButton;

  /// No description provided for @durationSecondsShort.
  ///
  /// In en, this message translates to:
  /// **'{seconds}s'**
  String durationSecondsShort(int seconds);

  /// No description provided for @durationMinutesSecondsShort.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m {seconds}s'**
  String durationMinutesSecondsShort(int minutes, int seconds);

  /// No description provided for @durationHoursMinutesShort.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String durationHoursMinutesShort(int hours, int minutes);

  /// No description provided for @orientationFlippedTooltip.
  ///
  /// In en, this message translates to:
  /// **'Orientation: flipped (tap to normal)'**
  String get orientationFlippedTooltip;

  /// No description provided for @orientationNormalTooltip.
  ///
  /// In en, this message translates to:
  /// **'Orientation: normal (tap to flip)'**
  String get orientationNormalTooltip;

  /// No description provided for @noSteps.
  ///
  /// In en, this message translates to:
  /// **'No steps'**
  String get noSteps;

  /// No description provided for @stepProgress.
  ///
  /// In en, this message translates to:
  /// **'Step {current} / {total}'**
  String stepProgress(int current, int total);

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @paused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get paused;

  /// No description provided for @running.
  ///
  /// In en, this message translates to:
  /// **'Running'**
  String get running;

  /// No description provided for @ready.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get ready;

  /// No description provided for @stepsProgress.
  ///
  /// In en, this message translates to:
  /// **'{current} / {total} steps'**
  String stepsProgress(int current, int total);

  /// No description provided for @waiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting'**
  String get waiting;

  /// No description provided for @secondsRemaining.
  ///
  /// In en, this message translates to:
  /// **'{seconds}s remaining'**
  String secondsRemaining(Object seconds);

  /// No description provided for @millisecondsShort.
  ///
  /// In en, this message translates to:
  /// **'{ms}ms'**
  String millisecondsShort(int ms);

  /// No description provided for @tapContinueWhenReady.
  ///
  /// In en, this message translates to:
  /// **'Tap Continue when ready for the next step'**
  String get tapContinueWhenReady;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @macroCompleted.
  ///
  /// In en, this message translates to:
  /// **'Macro Completed'**
  String get macroCompleted;

  /// No description provided for @finishedIn.
  ///
  /// In en, this message translates to:
  /// **'Finished in {duration}'**
  String finishedIn(Object duration);

  /// No description provided for @sequence.
  ///
  /// In en, this message translates to:
  /// **'Sequence'**
  String get sequence;

  /// No description provided for @waitMilliseconds.
  ///
  /// In en, this message translates to:
  /// **'Wait {ms}ms'**
  String waitMilliseconds(int ms);

  /// No description provided for @runAgain.
  ///
  /// In en, this message translates to:
  /// **'Run Again'**
  String get runAgain;

  /// No description provided for @startMacro.
  ///
  /// In en, this message translates to:
  /// **'Start Macro'**
  String get startMacro;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @unnamedRemote.
  ///
  /// In en, this message translates to:
  /// **'Unnamed Remote'**
  String get unnamedRemote;

  /// No description provided for @enterMacroName.
  ///
  /// In en, this message translates to:
  /// **'Enter a macro name'**
  String get enterMacroName;

  /// No description provided for @addAtLeastOneStep.
  ///
  /// In en, this message translates to:
  /// **'Add at least one step'**
  String get addAtLeastOneStep;

  /// No description provided for @fixInvalidSteps.
  ///
  /// In en, this message translates to:
  /// **'Fix invalid steps'**
  String get fixInvalidSteps;

  /// No description provided for @unknownCommand.
  ///
  /// In en, this message translates to:
  /// **'Unknown Command'**
  String get unknownCommand;

  /// No description provided for @unnamedCommand.
  ///
  /// In en, this message translates to:
  /// **'Unnamed Command'**
  String get unnamedCommand;

  /// No description provided for @iconCommand.
  ///
  /// In en, this message translates to:
  /// **'Icon Command'**
  String get iconCommand;

  /// No description provided for @selectDelay.
  ///
  /// In en, this message translates to:
  /// **'Select Delay'**
  String get selectDelay;

  /// No description provided for @keepMilliseconds.
  ///
  /// In en, this message translates to:
  /// **'Keep: {ms}ms'**
  String keepMilliseconds(int ms);

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @enterCustomDelayDuration.
  ///
  /// In en, this message translates to:
  /// **'Enter a custom delay duration'**
  String get enterCustomDelayDuration;

  /// No description provided for @millisecondsLong.
  ///
  /// In en, this message translates to:
  /// **'{ms} milliseconds'**
  String millisecondsLong(int ms);

  /// No description provided for @secondsLong.
  ///
  /// In en, this message translates to:
  /// **'{seconds} second{plural}'**
  String secondsLong(Object seconds, Object plural);

  /// No description provided for @customDelay.
  ///
  /// In en, this message translates to:
  /// **'Custom Delay'**
  String get customDelay;

  /// No description provided for @delayMillisecondsLabel.
  ///
  /// In en, this message translates to:
  /// **'Delay (milliseconds)'**
  String get delayMillisecondsLabel;

  /// No description provided for @delayMillisecondsHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., 3000'**
  String get delayMillisecondsHint;

  /// No description provided for @recommendedDelayRange.
  ///
  /// In en, this message translates to:
  /// **'Recommended: 250-5000ms for most devices'**
  String get recommendedDelayRange;

  /// No description provided for @enterValidPositiveNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid positive number'**
  String get enterValidPositiveNumber;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @remote.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get remote;

  /// No description provided for @macroName.
  ///
  /// In en, this message translates to:
  /// **'Macro Name'**
  String get macroName;

  /// No description provided for @macroNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., i-cybie Advanced Mode'**
  String get macroNameHint;

  /// No description provided for @stepsTitleCount.
  ///
  /// In en, this message translates to:
  /// **'Steps ({count})'**
  String stepsTitleCount(int count);

  /// No description provided for @noStepsYet.
  ///
  /// In en, this message translates to:
  /// **'No steps yet'**
  String get noStepsYet;

  /// No description provided for @addCommandsAndDelaysHint.
  ///
  /// In en, this message translates to:
  /// **'Add commands and delays below to build your sequence'**
  String get addCommandsAndDelaysHint;

  /// No description provided for @addStep.
  ///
  /// In en, this message translates to:
  /// **'Add Step'**
  String get addStep;

  /// No description provided for @reorderStepsHint.
  ///
  /// In en, this message translates to:
  /// **'Tip: Drag the handle to reorder steps. Tap a step to edit it.'**
  String get reorderStepsHint;

  /// No description provided for @reorderStep.
  ///
  /// In en, this message translates to:
  /// **'Reorder step {index}'**
  String reorderStep(int index);

  /// No description provided for @pressAndDragToChangeStepOrder.
  ///
  /// In en, this message translates to:
  /// **'Press and drag to change step order'**
  String get pressAndDragToChangeStepOrder;

  /// No description provided for @deleteStep.
  ///
  /// In en, this message translates to:
  /// **'Delete step {index}'**
  String deleteStep(int index);

  /// No description provided for @invalidStepTapToFix.
  ///
  /// In en, this message translates to:
  /// **'Invalid step - tap to fix'**
  String get invalidStepTapToFix;

  /// No description provided for @sendIrCommand.
  ///
  /// In en, this message translates to:
  /// **'Send IR command'**
  String get sendIrCommand;

  /// No description provided for @waitForUserConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Wait for user confirmation'**
  String get waitForUserConfirmation;

  /// No description provided for @notImplemented.
  ///
  /// In en, this message translates to:
  /// **'Not implemented'**
  String get notImplemented;

  /// No description provided for @frequencyKhz.
  ///
  /// In en, this message translates to:
  /// **'{value} kHz'**
  String frequencyKhz(int value);

  /// No description provided for @necProtocolShort.
  ///
  /// In en, this message translates to:
  /// **'NEC'**
  String get necProtocolShort;

  /// No description provided for @msbShort.
  ///
  /// In en, this message translates to:
  /// **'MSB'**
  String get msbShort;

  /// No description provided for @layoutWide.
  ///
  /// In en, this message translates to:
  /// **'Wide'**
  String get layoutWide;

  /// No description provided for @iconButton.
  ///
  /// In en, this message translates to:
  /// **'Icon button'**
  String get iconButton;

  /// No description provided for @imageButton.
  ///
  /// In en, this message translates to:
  /// **'Image button'**
  String get imageButton;

  /// No description provided for @noSignalInfo.
  ///
  /// In en, this message translates to:
  /// **'No signal info'**
  String get noSignalInfo;

  /// No description provided for @proceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get proceed;

  /// No description provided for @discard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get discard;

  /// No description provided for @idle.
  ///
  /// In en, this message translates to:
  /// **'Idle'**
  String get idle;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @stopped.
  ///
  /// In en, this message translates to:
  /// **'Stopped'**
  String get stopped;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @step.
  ///
  /// In en, this message translates to:
  /// **'Step'**
  String get step;

  /// No description provided for @addToRemote.
  ///
  /// In en, this message translates to:
  /// **'Add to remote'**
  String get addToRemote;

  /// No description provided for @noDescriptionAvailable.
  ///
  /// In en, this message translates to:
  /// **'No description available.'**
  String get noDescriptionAvailable;

  /// No description provided for @notAvailableSymbol.
  ///
  /// In en, this message translates to:
  /// **'-'**
  String get notAvailableSymbol;

  /// No description provided for @irFinderKaseikyoVendorInvalid.
  ///
  /// In en, this message translates to:
  /// **'Kaseikyo vendor must be exactly 4 hex digits.'**
  String get irFinderKaseikyoVendorInvalid;

  /// No description provided for @irFinderDatabaseNotReady.
  ///
  /// In en, this message translates to:
  /// **'Database is not ready yet.'**
  String get irFinderDatabaseNotReady;

  /// No description provided for @irFinderSelectBrandFirst.
  ///
  /// In en, this message translates to:
  /// **'Select a brand first in Setup.'**
  String get irFinderSelectBrandFirst;

  /// No description provided for @irFinderBruteforceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Brute-force is not available for this protocol yet.'**
  String get irFinderBruteforceUnavailable;

  /// No description provided for @irFinderInvalidPrefix.
  ///
  /// In en, this message translates to:
  /// **'Invalid prefix.'**
  String get irFinderInvalidPrefix;

  /// No description provided for @irFinderBrandValue.
  ///
  /// In en, this message translates to:
  /// **'Brand: {value}'**
  String irFinderBrandValue(Object value);

  /// No description provided for @irFinderModelValue.
  ///
  /// In en, this message translates to:
  /// **'Model: {value}'**
  String irFinderModelValue(Object value);

  /// No description provided for @irFinderKeyValue.
  ///
  /// In en, this message translates to:
  /// **'Key: {value}'**
  String irFinderKeyValue(Object value);

  /// No description provided for @irFinderRemoteNumber.
  ///
  /// In en, this message translates to:
  /// **'Remote #{value}'**
  String irFinderRemoteNumber(Object value);

  /// No description provided for @irFinderJumpOffsetHelper.
  ///
  /// In en, this message translates to:
  /// **'Enter a 0-based index within filtered, ordered database results.'**
  String get irFinderJumpOffsetHelper;

  /// No description provided for @irFinderJumpCursorHelper.
  ///
  /// In en, this message translates to:
  /// **'Enter a 0-based hex cursor within the brute-force space.'**
  String get irFinderJumpCursorHelper;

  /// No description provided for @irFinderSetupTab.
  ///
  /// In en, this message translates to:
  /// **'Setup'**
  String get irFinderSetupTab;

  /// No description provided for @irFinderTestTab.
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get irFinderTestTab;

  /// No description provided for @irFinderResultsTab.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get irFinderResultsTab;

  /// No description provided for @irFinderContinueToTest.
  ///
  /// In en, this message translates to:
  /// **'Continue to Test'**
  String get irFinderContinueToTest;

  /// No description provided for @irFinderKaseikyoVendorTitle.
  ///
  /// In en, this message translates to:
  /// **'Kaseikyo Vendor'**
  String get irFinderKaseikyoVendorTitle;

  /// No description provided for @irFinderCustomVendorLabel.
  ///
  /// In en, this message translates to:
  /// **'Custom vendor (4 hex)'**
  String get irFinderCustomVendorLabel;

  /// No description provided for @irFinderBrowseDbCandidates.
  ///
  /// In en, this message translates to:
  /// **'Browse DB candidates…'**
  String get irFinderBrowseDbCandidates;

  /// No description provided for @irFinderEditSetup.
  ///
  /// In en, this message translates to:
  /// **'Edit Setup'**
  String get irFinderEditSetup;

  /// No description provided for @irFinderNoSavedHits.
  ///
  /// In en, this message translates to:
  /// **'No saved hits yet. In the Test page, press \"Save hit\" when the device responds.'**
  String get irFinderNoSavedHits;

  /// No description provided for @irFinderBackToTest.
  ///
  /// In en, this message translates to:
  /// **'Back to Test'**
  String get irFinderBackToTest;

  /// No description provided for @irFinderLargeSearchSpaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Large search space'**
  String get irFinderLargeSearchSpaceTitle;

  /// No description provided for @irFinderLargeSearchSpaceBody.
  ///
  /// In en, this message translates to:
  /// **'This brute-force space is very large ({human} possibilities). IR Finder will still respect your max attempts and cooldown, but be mindful of spamming IR devices.\n\nRecommendation: use Database mode first, and/or enter known prefix bytes to reduce the space.'**
  String irFinderLargeSearchSpaceBody(Object human);

  /// No description provided for @irFinderDatabaseSession.
  ///
  /// In en, this message translates to:
  /// **'Database session'**
  String get irFinderDatabaseSession;

  /// No description provided for @irFinderBruteforceSession.
  ///
  /// In en, this message translates to:
  /// **'Brute-force session'**
  String get irFinderBruteforceSession;

  /// No description provided for @irFinderResumeLastSession.
  ///
  /// In en, this message translates to:
  /// **'Resume last session'**
  String get irFinderResumeLastSession;

  /// No description provided for @irFinderResumeBrandModel.
  ///
  /// In en, this message translates to:
  /// **'Brand: {brand} · Model: {model}'**
  String irFinderResumeBrandModel(Object brand, Object model);

  /// No description provided for @irFinderResumePrefix.
  ///
  /// In en, this message translates to:
  /// **'Prefix: {value}'**
  String irFinderResumePrefix(Object value);

  /// No description provided for @irFinderResumeProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress: {progress} · Started: {when}'**
  String irFinderResumeProgress(Object progress, Object when);

  /// No description provided for @irFinderApplyResume.
  ///
  /// In en, this message translates to:
  /// **'Apply & Resume'**
  String get irFinderApplyResume;

  /// No description provided for @irFinderBruteforceMode.
  ///
  /// In en, this message translates to:
  /// **'Brute-force'**
  String get irFinderBruteforceMode;

  /// No description provided for @irFinderDatabaseAssistedMode.
  ///
  /// In en, this message translates to:
  /// **'Database-assisted'**
  String get irFinderDatabaseAssistedMode;

  /// No description provided for @irFinderProtocolTitle.
  ///
  /// In en, this message translates to:
  /// **'Protocol: {name}'**
  String irFinderProtocolTitle(Object name);

  /// No description provided for @irFinderProtocolLabel.
  ///
  /// In en, this message translates to:
  /// **'IR protocol'**
  String get irFinderProtocolLabel;

  /// No description provided for @irFinderProtocolHelper.
  ///
  /// In en, this message translates to:
  /// **'Controls encoding and therefore the search space.'**
  String get irFinderProtocolHelper;

  /// No description provided for @irFinderKnownPrefixLabel.
  ///
  /// In en, this message translates to:
  /// **'Known prefix (hex bytes, optional)'**
  String get irFinderKnownPrefixLabel;

  /// No description provided for @irFinderKnownPrefixHint.
  ///
  /// In en, this message translates to:
  /// **'A1B2, A1 B2, A1:B2, 0xA1 0xB2'**
  String get irFinderKnownPrefixHint;

  /// No description provided for @irFinderKnownPrefixHelperPayload.
  ///
  /// In en, this message translates to:
  /// **'Payload: {digits} hex digit(s)'**
  String irFinderKnownPrefixHelperPayload(int digits);

  /// No description provided for @irFinderKnownPrefixHelperPayloadExample.
  ///
  /// In en, this message translates to:
  /// **'Payload: {digits} hex digit(s) · Example: {example}'**
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example);

  /// No description provided for @irFinderKnownPrefixHelperPayloadMax.
  ///
  /// In en, this message translates to:
  /// **'Payload: {digits} hex digit(s) · Max prefix: {bytes} byte(s)'**
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes);

  /// No description provided for @irFinderKnownPrefixHelperPayloadExampleMax.
  ///
  /// In en, this message translates to:
  /// **'Payload: {digits} hex digit(s) · Example: {example} · Max prefix: {bytes} byte(s)'**
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes);

  /// No description provided for @irFinderKnownPrefixHelperExample.
  ///
  /// In en, this message translates to:
  /// **'Example: {example}'**
  String irFinderKnownPrefixHelperExample(Object example);

  /// No description provided for @irFinderKnownPrefixHelperFallback.
  ///
  /// In en, this message translates to:
  /// **'Enter any known first bytes to reduce the search space.'**
  String get irFinderKnownPrefixHelperFallback;

  /// No description provided for @irFinderDatabaseMode.
  ///
  /// In en, this message translates to:
  /// **'Database'**
  String get irFinderDatabaseMode;

  /// No description provided for @irFinderNormalizedPrefixValue.
  ///
  /// In en, this message translates to:
  /// **'Normalized prefix: {value}'**
  String irFinderNormalizedPrefixValue(Object value);

  /// No description provided for @irFinderNormalizedPrefix.
  ///
  /// In en, this message translates to:
  /// **'Normalized prefix'**
  String get irFinderNormalizedPrefix;

  /// No description provided for @irFinderBruteforceNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'Brute-force is not configured for this protocol yet.'**
  String get irFinderBruteforceNotConfigured;

  /// No description provided for @irFinderAllLimit.
  ///
  /// In en, this message translates to:
  /// **'All ({value})'**
  String irFinderAllLimit(Object value);

  /// No description provided for @irFinderTestControls.
  ///
  /// In en, this message translates to:
  /// **'Test controls'**
  String get irFinderTestControls;

  /// No description provided for @irFinderPayloadLength.
  ///
  /// In en, this message translates to:
  /// **'Payload length: {digits} hex digit(s).'**
  String irFinderPayloadLength(int digits);

  /// No description provided for @irFinderSearchSpace.
  ///
  /// In en, this message translates to:
  /// **'Search space: {value} possibilities (after prefix constraints).'**
  String irFinderSearchSpace(Object value);

  /// No description provided for @irFinderCooldownMs.
  ///
  /// In en, this message translates to:
  /// **'Cooldown (ms)'**
  String get irFinderCooldownMs;

  /// No description provided for @irFinderMaxAttemptsPerRun.
  ///
  /// In en, this message translates to:
  /// **'Max attempts (per run)'**
  String get irFinderMaxAttemptsPerRun;

  /// No description provided for @irFinderTestAllCombinations.
  ///
  /// In en, this message translates to:
  /// **'Test all combinations'**
  String get irFinderTestAllCombinations;

  /// No description provided for @irFinderTestAllCombinationsHint.
  ///
  /// In en, this message translates to:
  /// **'Runs until the search space is exhausted. Effective limit: {value}'**
  String irFinderTestAllCombinationsHint(Object value);

  /// No description provided for @irFinderAttempts.
  ///
  /// In en, this message translates to:
  /// **'Attempts'**
  String get irFinderAttempts;

  /// No description provided for @irFinderAttemptsSliderRange.
  ///
  /// In en, this message translates to:
  /// **'Slider range: 1–{max} (type any number for larger values)'**
  String irFinderAttemptsSliderRange(int max);

  /// No description provided for @irFinderMaxButton.
  ///
  /// In en, this message translates to:
  /// **'Max\n{value}'**
  String irFinderMaxButton(int value);

  /// No description provided for @irFinderEffectiveLimitThisRun.
  ///
  /// In en, this message translates to:
  /// **'Effective limit this run: {value}'**
  String irFinderEffectiveLimitThisRun(Object value);

  /// No description provided for @irFinderBruteforceTip.
  ///
  /// In en, this message translates to:
  /// **'Tip: Use Database mode first; brute-force is best with a known prefix (for example, the first 1–4 bytes).'**
  String get irFinderBruteforceTip;

  /// No description provided for @irFinderDatabaseInitFailed.
  ///
  /// In en, this message translates to:
  /// **'Database initialization failed.'**
  String get irFinderDatabaseInitFailed;

  /// No description provided for @irFinderPreparingDatabase.
  ///
  /// In en, this message translates to:
  /// **'Preparing local IR code database…'**
  String get irFinderPreparingDatabase;

  /// No description provided for @irFinderDatabaseAssistedSearch.
  ///
  /// In en, this message translates to:
  /// **'Database-assisted search'**
  String get irFinderDatabaseAssistedSearch;

  /// No description provided for @irFinderBrand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get irFinderBrand;

  /// No description provided for @irFinderSelectBrand.
  ///
  /// In en, this message translates to:
  /// **'Select brand'**
  String get irFinderSelectBrand;

  /// No description provided for @irFinderModelOptional.
  ///
  /// In en, this message translates to:
  /// **'Model (optional)'**
  String get irFinderModelOptional;

  /// No description provided for @irFinderSelectBrandFirstShort.
  ///
  /// In en, this message translates to:
  /// **'Select a brand first'**
  String get irFinderSelectBrandFirstShort;

  /// No description provided for @irFinderSelectModelRecommended.
  ///
  /// In en, this message translates to:
  /// **'Select a model (recommended)'**
  String get irFinderSelectModelRecommended;

  /// No description provided for @irFinderOnlySelectedProtocol.
  ///
  /// In en, this message translates to:
  /// **'Only selected protocol'**
  String get irFinderOnlySelectedProtocol;

  /// No description provided for @irFinderOnlySelectedProtocolHint.
  ///
  /// In en, this message translates to:
  /// **'Filters keys to the selected protocol. Disable it to browse all protocols.'**
  String get irFinderOnlySelectedProtocolHint;

  /// No description provided for @irFinderQuickWinsFirst.
  ///
  /// In en, this message translates to:
  /// **'Quick wins first'**
  String get irFinderQuickWinsFirst;

  /// No description provided for @irFinderQuickWinsFirstHint.
  ///
  /// In en, this message translates to:
  /// **'Prioritizes POWER, MUTE, VOL, and CH style keys before deeper keys.'**
  String get irFinderQuickWinsFirstHint;

  /// No description provided for @irFinderMaxKeysPerRun.
  ///
  /// In en, this message translates to:
  /// **'Max keys to test (per run)'**
  String get irFinderMaxKeysPerRun;

  /// No description provided for @irFinderTesting.
  ///
  /// In en, this message translates to:
  /// **'Testing…'**
  String get irFinderTesting;

  /// No description provided for @irFinderCooldown.
  ///
  /// In en, this message translates to:
  /// **'Cooldown'**
  String get irFinderCooldown;

  /// No description provided for @irFinderEta.
  ///
  /// In en, this message translates to:
  /// **'ETA'**
  String get irFinderEta;

  /// No description provided for @irFinderMode.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get irFinderMode;

  /// No description provided for @irFinderRetryLast.
  ///
  /// In en, this message translates to:
  /// **'Retry last'**
  String get irFinderRetryLast;

  /// No description provided for @irFinderTrigger.
  ///
  /// In en, this message translates to:
  /// **'Trigger'**
  String get irFinderTrigger;

  /// No description provided for @irFinderJump.
  ///
  /// In en, this message translates to:
  /// **'Jump…'**
  String get irFinderJump;

  /// No description provided for @irFinderSaveHit.
  ///
  /// In en, this message translates to:
  /// **'Save hit'**
  String get irFinderSaveHit;

  /// No description provided for @irFinderEtaSeconds.
  ///
  /// In en, this message translates to:
  /// **'{seconds}s'**
  String irFinderEtaSeconds(int seconds);

  /// No description provided for @irFinderEtaMinutesSeconds.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m {seconds}s'**
  String irFinderEtaMinutesSeconds(int minutes, int seconds);

  /// No description provided for @irFinderEtaHoursMinutes.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String irFinderEtaHoursMinutes(int hours, int minutes);

  /// No description provided for @irFinderLastAttemptedCode.
  ///
  /// In en, this message translates to:
  /// **'Last attempted code: {value}'**
  String irFinderLastAttemptedCode(Object value);

  /// No description provided for @irFinderStartTestingToSeeLastCode.
  ///
  /// In en, this message translates to:
  /// **'Start testing to see the last attempted code.'**
  String get irFinderStartTestingToSeeLastCode;

  /// No description provided for @irFinderFromDb.
  ///
  /// In en, this message translates to:
  /// **'From DB: {value}'**
  String irFinderFromDb(Object value);

  /// No description provided for @irFinderFromBruteforce.
  ///
  /// In en, this message translates to:
  /// **'From brute-force (generated by protocol encoder).'**
  String get irFinderFromBruteforce;

  /// No description provided for @irFinderSendError.
  ///
  /// In en, this message translates to:
  /// **'Send error: {error}'**
  String irFinderSendError(Object error);

  /// No description provided for @irFinderSourceValue.
  ///
  /// In en, this message translates to:
  /// **'Source: {value}'**
  String irFinderSourceValue(Object value);

  /// No description provided for @irFinderResultsNote.
  ///
  /// In en, this message translates to:
  /// **'Results support Test and Copy immediately. Direct add-to-remote integration can be extended further in the editor flow.'**
  String get irFinderResultsNote;

  /// No description provided for @irFinderBrowseDbCandidatesTitle.
  ///
  /// In en, this message translates to:
  /// **'Browse DB candidates'**
  String get irFinderBrowseDbCandidatesTitle;

  /// No description provided for @irFinderFilterByLabelOrHex.
  ///
  /// In en, this message translates to:
  /// **'Filter by label or hex…'**
  String get irFinderFilterByLabelOrHex;

  /// No description provided for @irFinderJumpHere.
  ///
  /// In en, this message translates to:
  /// **'Jump here'**
  String get irFinderJumpHere;

  /// No description provided for @irFinderSelectModel.
  ///
  /// In en, this message translates to:
  /// **'Select model'**
  String get irFinderSelectModel;

  /// No description provided for @irFinderSearchBrands.
  ///
  /// In en, this message translates to:
  /// **'Search brands…'**
  String get irFinderSearchBrands;

  /// No description provided for @irFinderSearchModels.
  ///
  /// In en, this message translates to:
  /// **'Search models…'**
  String get irFinderSearchModels;

  /// No description provided for @iconPickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Icon'**
  String get iconPickerTitle;

  /// No description provided for @iconPickerSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search icons...'**
  String get iconPickerSearchHint;

  /// No description provided for @iconPickerNoIconsFound.
  ///
  /// In en, this message translates to:
  /// **'No icons found'**
  String get iconPickerNoIconsFound;

  /// No description provided for @iconPickerIconsAvailable.
  ///
  /// In en, this message translates to:
  /// **'{count} icons available'**
  String iconPickerIconsAvailable(int count);

  /// No description provided for @iconPickerCategoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get iconPickerCategoryAll;

  /// No description provided for @iconPickerCategoryMedia.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get iconPickerCategoryMedia;

  /// No description provided for @iconPickerCategoryVolume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get iconPickerCategoryVolume;

  /// No description provided for @iconPickerCategoryNavigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get iconPickerCategoryNavigation;

  /// No description provided for @iconPickerCategoryPower.
  ///
  /// In en, this message translates to:
  /// **'Power'**
  String get iconPickerCategoryPower;

  /// No description provided for @iconPickerCategoryNumbers.
  ///
  /// In en, this message translates to:
  /// **'Numbers'**
  String get iconPickerCategoryNumbers;

  /// No description provided for @iconPickerCategorySettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get iconPickerCategorySettings;

  /// No description provided for @iconPickerCategoryDisplay.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get iconPickerCategoryDisplay;

  /// No description provided for @iconPickerCategoryInput.
  ///
  /// In en, this message translates to:
  /// **'Input'**
  String get iconPickerCategoryInput;

  /// No description provided for @iconPickerCategoryFavorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get iconPickerCategoryFavorite;

  /// No description provided for @universalPowerTitle.
  ///
  /// In en, this message translates to:
  /// **'Universal Power'**
  String get universalPowerTitle;

  /// No description provided for @universalPowerRunTab.
  ///
  /// In en, this message translates to:
  /// **'Run'**
  String get universalPowerRunTab;

  /// No description provided for @universalPowerUseResponsibly.
  ///
  /// In en, this message translates to:
  /// **'Use responsibly'**
  String get universalPowerUseResponsibly;

  /// No description provided for @universalPowerConsentBody.
  ///
  /// In en, this message translates to:
  /// **'Universal Power cycles IR power codes. Use it only on devices you own or control. Stop as soon as the device responds.'**
  String get universalPowerConsentBody;

  /// No description provided for @universalPowerConsentCheckbox.
  ///
  /// In en, this message translates to:
  /// **'I own or control the device'**
  String get universalPowerConsentCheckbox;

  /// No description provided for @universalPowerSetupBody.
  ///
  /// In en, this message translates to:
  /// **'Cycles power codes for your selected brand. Stop as soon as the device responds.'**
  String get universalPowerSetupBody;

  /// No description provided for @universalPowerLastSent.
  ///
  /// In en, this message translates to:
  /// **'Last sent: {value}'**
  String universalPowerLastSent(Object value);

  /// No description provided for @universalPowerNoCodesFound.
  ///
  /// In en, this message translates to:
  /// **'No power codes found. Try broadening the search.'**
  String get universalPowerNoCodesFound;

  /// No description provided for @universalPowerUnableToStart.
  ///
  /// In en, this message translates to:
  /// **'Unable to start.'**
  String get universalPowerUnableToStart;

  /// No description provided for @universalPowerAllBrands.
  ///
  /// In en, this message translates to:
  /// **'All brands (no filter)'**
  String get universalPowerAllBrands;

  /// No description provided for @universalPowerClearBrandFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear brand filter'**
  String get universalPowerClearBrandFilter;

  /// No description provided for @universalPowerBroadenSearch.
  ///
  /// In en, this message translates to:
  /// **'Broaden search if needed'**
  String get universalPowerBroadenSearch;

  /// No description provided for @universalPowerBroadenSearchHint.
  ///
  /// In en, this message translates to:
  /// **'If no power labels are found, include other keys.'**
  String get universalPowerBroadenSearchHint;

  /// No description provided for @universalPowerAdditionalPatternsDepth.
  ///
  /// In en, this message translates to:
  /// **'Additional patterns depth'**
  String get universalPowerAdditionalPatternsDepth;

  /// No description provided for @universalPowerDepth1.
  ///
  /// In en, this message translates to:
  /// **'Priority only: POWER/OFF'**
  String get universalPowerDepth1;

  /// No description provided for @universalPowerDepth2.
  ///
  /// In en, this message translates to:
  /// **'Include POWER aliases'**
  String get universalPowerDepth2;

  /// No description provided for @universalPowerDepth3.
  ///
  /// In en, this message translates to:
  /// **'Include secondary power labels'**
  String get universalPowerDepth3;

  /// No description provided for @universalPowerDepth4.
  ///
  /// In en, this message translates to:
  /// **'Include all labels (lowest priority)'**
  String get universalPowerDepth4;

  /// No description provided for @universalPowerLoopUntilStopped.
  ///
  /// In en, this message translates to:
  /// **'Loop until stopped'**
  String get universalPowerLoopUntilStopped;

  /// No description provided for @universalPowerLoopUntilStoppedHint.
  ///
  /// In en, this message translates to:
  /// **'Keeps cycling the queue until you stop it.'**
  String get universalPowerLoopUntilStoppedHint;

  /// No description provided for @universalPowerDelayBetweenCodes.
  ///
  /// In en, this message translates to:
  /// **'Delay between codes'**
  String get universalPowerDelayBetweenCodes;

  /// No description provided for @universalPowerStart.
  ///
  /// In en, this message translates to:
  /// **'Start Universal Power'**
  String get universalPowerStart;

  /// No description provided for @universalPowerRunStatus.
  ///
  /// In en, this message translates to:
  /// **'Run status'**
  String get universalPowerRunStatus;

  /// No description provided for @universalPowerProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress: {value}'**
  String universalPowerProgress(Object value);

  /// No description provided for @universalPowerPausedInBackground.
  ///
  /// In en, this message translates to:
  /// **'Paused because the app was backgrounded.'**
  String get universalPowerPausedInBackground;

  /// No description provided for @universalPowerSendOneCode.
  ///
  /// In en, this message translates to:
  /// **'Send one code'**
  String get universalPowerSendOneCode;

  /// No description provided for @universalPowerStopWhenDeviceResponds.
  ///
  /// In en, this message translates to:
  /// **'Stop as soon as the device responds.'**
  String get universalPowerStopWhenDeviceResponds;

  /// No description provided for @iconNamePlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get iconNamePlay;

  /// No description provided for @iconNamePause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get iconNamePause;

  /// No description provided for @iconNameStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get iconNameStop;

  /// No description provided for @iconNameFastForward.
  ///
  /// In en, this message translates to:
  /// **'Fast Forward'**
  String get iconNameFastForward;

  /// No description provided for @iconNameRewind.
  ///
  /// In en, this message translates to:
  /// **'Rewind'**
  String get iconNameRewind;

  /// No description provided for @iconNameSkipNext.
  ///
  /// In en, this message translates to:
  /// **'Skip Next'**
  String get iconNameSkipNext;

  /// No description provided for @iconNameSkipPrevious.
  ///
  /// In en, this message translates to:
  /// **'Skip Previous'**
  String get iconNameSkipPrevious;

  /// No description provided for @iconNameReplay.
  ///
  /// In en, this message translates to:
  /// **'Replay'**
  String get iconNameReplay;

  /// No description provided for @iconNameForward10S.
  ///
  /// In en, this message translates to:
  /// **'Forward 10s'**
  String get iconNameForward10S;

  /// No description provided for @iconNameForward30S.
  ///
  /// In en, this message translates to:
  /// **'Forward 30s'**
  String get iconNameForward30S;

  /// No description provided for @iconNameReplay10S.
  ///
  /// In en, this message translates to:
  /// **'Replay 10s'**
  String get iconNameReplay10S;

  /// No description provided for @iconNameReplay30S.
  ///
  /// In en, this message translates to:
  /// **'Replay 30s'**
  String get iconNameReplay30S;

  /// No description provided for @iconNameRecord.
  ///
  /// In en, this message translates to:
  /// **'Record'**
  String get iconNameRecord;

  /// No description provided for @iconNameRecordAlt.
  ///
  /// In en, this message translates to:
  /// **'Record Alt'**
  String get iconNameRecordAlt;

  /// No description provided for @iconNameEject.
  ///
  /// In en, this message translates to:
  /// **'Eject'**
  String get iconNameEject;

  /// No description provided for @iconNameShuffle.
  ///
  /// In en, this message translates to:
  /// **'Shuffle'**
  String get iconNameShuffle;

  /// No description provided for @iconNameRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat'**
  String get iconNameRepeat;

  /// No description provided for @iconNameRepeatOne.
  ///
  /// In en, this message translates to:
  /// **'Repeat One'**
  String get iconNameRepeatOne;

  /// No description provided for @iconNameVolumeUp.
  ///
  /// In en, this message translates to:
  /// **'Volume Up'**
  String get iconNameVolumeUp;

  /// No description provided for @iconNameVolumeDown.
  ///
  /// In en, this message translates to:
  /// **'Volume Down'**
  String get iconNameVolumeDown;

  /// No description provided for @iconNameVolumeOff.
  ///
  /// In en, this message translates to:
  /// **'Volume Off'**
  String get iconNameVolumeOff;

  /// No description provided for @iconNameMute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get iconNameMute;

  /// No description provided for @iconNameSpeaker.
  ///
  /// In en, this message translates to:
  /// **'Speaker'**
  String get iconNameSpeaker;

  /// No description provided for @iconNameSurroundSound.
  ///
  /// In en, this message translates to:
  /// **'Surround Sound'**
  String get iconNameSurroundSound;

  /// No description provided for @iconNameEqualizer.
  ///
  /// In en, this message translates to:
  /// **'Equalizer'**
  String get iconNameEqualizer;

  /// No description provided for @iconNameAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get iconNameAudio;

  /// No description provided for @iconNameMicrophone.
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get iconNameMicrophone;

  /// No description provided for @iconNameMicOff.
  ///
  /// In en, this message translates to:
  /// **'Mic Off'**
  String get iconNameMicOff;

  /// No description provided for @iconNameUp.
  ///
  /// In en, this message translates to:
  /// **'Up'**
  String get iconNameUp;

  /// No description provided for @iconNameDown.
  ///
  /// In en, this message translates to:
  /// **'Down'**
  String get iconNameDown;

  /// No description provided for @iconNameLeft.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get iconNameLeft;

  /// No description provided for @iconNameRight.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get iconNameRight;

  /// No description provided for @iconNameArrowUp.
  ///
  /// In en, this message translates to:
  /// **'Arrow Up'**
  String get iconNameArrowUp;

  /// No description provided for @iconNameArrowDown.
  ///
  /// In en, this message translates to:
  /// **'Arrow Down'**
  String get iconNameArrowDown;

  /// No description provided for @iconNameArrowLeft.
  ///
  /// In en, this message translates to:
  /// **'Arrow Left'**
  String get iconNameArrowLeft;

  /// No description provided for @iconNameArrowRight.
  ///
  /// In en, this message translates to:
  /// **'Arrow Right'**
  String get iconNameArrowRight;

  /// No description provided for @iconNameNavigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get iconNameNavigation;

  /// No description provided for @iconNameChevronLeft.
  ///
  /// In en, this message translates to:
  /// **'Chevron Left'**
  String get iconNameChevronLeft;

  /// No description provided for @iconNameChevronRight.
  ///
  /// In en, this message translates to:
  /// **'Chevron Right'**
  String get iconNameChevronRight;

  /// No description provided for @iconNameExpandLess.
  ///
  /// In en, this message translates to:
  /// **'Expand Less'**
  String get iconNameExpandLess;

  /// No description provided for @iconNameExpandMore.
  ///
  /// In en, this message translates to:
  /// **'Expand More'**
  String get iconNameExpandMore;

  /// No description provided for @iconNameCollapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get iconNameCollapse;

  /// No description provided for @iconNameExpand.
  ///
  /// In en, this message translates to:
  /// **'Expand'**
  String get iconNameExpand;

  /// No description provided for @iconNameCircleUp.
  ///
  /// In en, this message translates to:
  /// **'Circle Up'**
  String get iconNameCircleUp;

  /// No description provided for @iconNameCircleDown.
  ///
  /// In en, this message translates to:
  /// **'Circle Down'**
  String get iconNameCircleDown;

  /// No description provided for @iconNameCircleLeft.
  ///
  /// In en, this message translates to:
  /// **'Circle Left'**
  String get iconNameCircleLeft;

  /// No description provided for @iconNameCircleRight.
  ///
  /// In en, this message translates to:
  /// **'Circle Right'**
  String get iconNameCircleRight;

  /// No description provided for @iconNameOkSelect.
  ///
  /// In en, this message translates to:
  /// **'OK/Select'**
  String get iconNameOkSelect;

  /// No description provided for @iconNameConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get iconNameConfirm;

  /// No description provided for @iconNameCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get iconNameCancel;

  /// No description provided for @iconNameClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get iconNameClose;

  /// No description provided for @iconNameHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get iconNameHome;

  /// No description provided for @iconNameReturn.
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get iconNameReturn;

  /// No description provided for @iconNameExit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get iconNameExit;

  /// No description provided for @iconNameUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get iconNameUndo;

  /// No description provided for @iconNameRedo.
  ///
  /// In en, this message translates to:
  /// **'Redo'**
  String get iconNameRedo;

  /// No description provided for @iconNamePower.
  ///
  /// In en, this message translates to:
  /// **'Power'**
  String get iconNamePower;

  /// No description provided for @iconNamePowerAlt.
  ///
  /// In en, this message translates to:
  /// **'Power Alt'**
  String get iconNamePowerAlt;

  /// No description provided for @iconNamePowerOff.
  ///
  /// In en, this message translates to:
  /// **'Power Off'**
  String get iconNamePowerOff;

  /// No description provided for @iconNameOn.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get iconNameOn;

  /// No description provided for @iconNameOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get iconNameOff;

  /// No description provided for @iconNameToggleOn.
  ///
  /// In en, this message translates to:
  /// **'Toggle On'**
  String get iconNameToggleOn;

  /// No description provided for @iconNameToggleOff.
  ///
  /// In en, this message translates to:
  /// **'Toggle Off'**
  String get iconNameToggleOff;

  /// No description provided for @iconNameRestart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get iconNameRestart;

  /// No description provided for @iconNameNum1.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get iconNameNum1;

  /// No description provided for @iconNameNum2.
  ///
  /// In en, this message translates to:
  /// **'2'**
  String get iconNameNum2;

  /// No description provided for @iconNameNum3.
  ///
  /// In en, this message translates to:
  /// **'3'**
  String get iconNameNum3;

  /// No description provided for @iconNameNum4.
  ///
  /// In en, this message translates to:
  /// **'4'**
  String get iconNameNum4;

  /// No description provided for @iconNameNum5.
  ///
  /// In en, this message translates to:
  /// **'5'**
  String get iconNameNum5;

  /// No description provided for @iconNameNum6.
  ///
  /// In en, this message translates to:
  /// **'6'**
  String get iconNameNum6;

  /// No description provided for @iconNameNum7.
  ///
  /// In en, this message translates to:
  /// **'7'**
  String get iconNameNum7;

  /// No description provided for @iconNameNum8.
  ///
  /// In en, this message translates to:
  /// **'8'**
  String get iconNameNum8;

  /// No description provided for @iconNameNum9.
  ///
  /// In en, this message translates to:
  /// **'9'**
  String get iconNameNum9;

  /// No description provided for @iconNameNum92.
  ///
  /// In en, this message translates to:
  /// **'9+'**
  String get iconNameNum92;

  /// No description provided for @iconNameNum0.
  ///
  /// In en, this message translates to:
  /// **'0'**
  String get iconNameNum0;

  /// No description provided for @iconNameOne.
  ///
  /// In en, this message translates to:
  /// **'One'**
  String get iconNameOne;

  /// No description provided for @iconNameTwo.
  ///
  /// In en, this message translates to:
  /// **'Two'**
  String get iconNameTwo;

  /// No description provided for @iconNameThree.
  ///
  /// In en, this message translates to:
  /// **'Three'**
  String get iconNameThree;

  /// No description provided for @iconNameFour.
  ///
  /// In en, this message translates to:
  /// **'Four'**
  String get iconNameFour;

  /// No description provided for @iconNameFive.
  ///
  /// In en, this message translates to:
  /// **'Five'**
  String get iconNameFive;

  /// No description provided for @iconNameSix.
  ///
  /// In en, this message translates to:
  /// **'Six'**
  String get iconNameSix;

  /// No description provided for @iconNamePlus.
  ///
  /// In en, this message translates to:
  /// **'Plus'**
  String get iconNamePlus;

  /// No description provided for @iconNameMinus.
  ///
  /// In en, this message translates to:
  /// **'Minus'**
  String get iconNameMinus;

  /// No description provided for @iconNameAddCircle.
  ///
  /// In en, this message translates to:
  /// **'Add Circle'**
  String get iconNameAddCircle;

  /// No description provided for @iconNameRemoveCircle.
  ///
  /// In en, this message translates to:
  /// **'Remove Circle'**
  String get iconNameRemoveCircle;

  /// No description provided for @iconNameSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get iconNameSettings;

  /// No description provided for @iconNameMenu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get iconNameMenu;

  /// No description provided for @iconNameMoreVertical.
  ///
  /// In en, this message translates to:
  /// **'More Vertical'**
  String get iconNameMoreVertical;

  /// No description provided for @iconNameMoreHorizontal.
  ///
  /// In en, this message translates to:
  /// **'More Horizontal'**
  String get iconNameMoreHorizontal;

  /// No description provided for @iconNameTune.
  ///
  /// In en, this message translates to:
  /// **'Tune'**
  String get iconNameTune;

  /// No description provided for @iconNameRemoteSettings.
  ///
  /// In en, this message translates to:
  /// **'Remote Settings'**
  String get iconNameRemoteSettings;

  /// No description provided for @iconNameInfo.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get iconNameInfo;

  /// No description provided for @iconNameInfoOutline.
  ///
  /// In en, this message translates to:
  /// **'Info Outline'**
  String get iconNameInfoOutline;

  /// No description provided for @iconNameHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get iconNameHelp;

  /// No description provided for @iconNameHelpOutline.
  ///
  /// In en, this message translates to:
  /// **'Help Outline'**
  String get iconNameHelpOutline;

  /// No description provided for @iconNameList.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get iconNameList;

  /// No description provided for @iconNameViewList.
  ///
  /// In en, this message translates to:
  /// **'View List'**
  String get iconNameViewList;

  /// No description provided for @iconNameViewGrid.
  ///
  /// In en, this message translates to:
  /// **'View Grid'**
  String get iconNameViewGrid;

  /// No description provided for @iconNameApps.
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get iconNameApps;

  /// No description provided for @iconNameWidgets.
  ///
  /// In en, this message translates to:
  /// **'Widgets'**
  String get iconNameWidgets;

  /// No description provided for @iconNameTv.
  ///
  /// In en, this message translates to:
  /// **'TV'**
  String get iconNameTv;

  /// No description provided for @iconNameMonitor.
  ///
  /// In en, this message translates to:
  /// **'Monitor'**
  String get iconNameMonitor;

  /// No description provided for @iconNameDesktop.
  ///
  /// In en, this message translates to:
  /// **'Desktop'**
  String get iconNameDesktop;

  /// No description provided for @iconNameBrightnessHigh.
  ///
  /// In en, this message translates to:
  /// **'Brightness High'**
  String get iconNameBrightnessHigh;

  /// No description provided for @iconNameBrightnessMedium.
  ///
  /// In en, this message translates to:
  /// **'Brightness Medium'**
  String get iconNameBrightnessMedium;

  /// No description provided for @iconNameBrightnessLow.
  ///
  /// In en, this message translates to:
  /// **'Brightness Low'**
  String get iconNameBrightnessLow;

  /// No description provided for @iconNameAutoBrightness.
  ///
  /// In en, this message translates to:
  /// **'Auto Brightness'**
  String get iconNameAutoBrightness;

  /// No description provided for @iconNameLightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get iconNameLightMode;

  /// No description provided for @iconNameDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get iconNameDarkMode;

  /// No description provided for @iconNameContrast.
  ///
  /// In en, this message translates to:
  /// **'Contrast'**
  String get iconNameContrast;

  /// No description provided for @iconNameHdrOn.
  ///
  /// In en, this message translates to:
  /// **'HDR On'**
  String get iconNameHdrOn;

  /// No description provided for @iconNameHdrOff.
  ///
  /// In en, this message translates to:
  /// **'HDR Off'**
  String get iconNameHdrOff;

  /// No description provided for @iconNameAspectRatio.
  ///
  /// In en, this message translates to:
  /// **'Aspect Ratio'**
  String get iconNameAspectRatio;

  /// No description provided for @iconNameCrop.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get iconNameCrop;

  /// No description provided for @iconNameZoomIn.
  ///
  /// In en, this message translates to:
  /// **'Zoom In'**
  String get iconNameZoomIn;

  /// No description provided for @iconNameZoomOut.
  ///
  /// In en, this message translates to:
  /// **'Zoom Out'**
  String get iconNameZoomOut;

  /// No description provided for @iconNameFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Fullscreen'**
  String get iconNameFullscreen;

  /// No description provided for @iconNameExitFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Exit Fullscreen'**
  String get iconNameExitFullscreen;

  /// No description provided for @iconNameFitScreen.
  ///
  /// In en, this message translates to:
  /// **'Fit Screen'**
  String get iconNameFitScreen;

  /// No description provided for @iconNamePip.
  ///
  /// In en, this message translates to:
  /// **'PiP'**
  String get iconNamePip;

  /// No description provided for @iconNameCropFree.
  ///
  /// In en, this message translates to:
  /// **'Crop Free'**
  String get iconNameCropFree;

  /// No description provided for @iconNameInput.
  ///
  /// In en, this message translates to:
  /// **'Input'**
  String get iconNameInput;

  /// No description provided for @iconNameCable.
  ///
  /// In en, this message translates to:
  /// **'Cable'**
  String get iconNameCable;

  /// No description provided for @iconNameCast.
  ///
  /// In en, this message translates to:
  /// **'Cast'**
  String get iconNameCast;

  /// No description provided for @iconNameCastConnected.
  ///
  /// In en, this message translates to:
  /// **'Cast Connected'**
  String get iconNameCastConnected;

  /// No description provided for @iconNameScreenShare.
  ///
  /// In en, this message translates to:
  /// **'Screen Share'**
  String get iconNameScreenShare;

  /// No description provided for @iconNameBluetooth.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth'**
  String get iconNameBluetooth;

  /// No description provided for @iconNameWifi.
  ///
  /// In en, this message translates to:
  /// **'WiFi'**
  String get iconNameWifi;

  /// No description provided for @iconNameRouter.
  ///
  /// In en, this message translates to:
  /// **'Router'**
  String get iconNameRouter;

  /// No description provided for @iconNameMemory.
  ///
  /// In en, this message translates to:
  /// **'Memory'**
  String get iconNameMemory;

  /// No description provided for @iconNameGameConsole.
  ///
  /// In en, this message translates to:
  /// **'Game Console'**
  String get iconNameGameConsole;

  /// No description provided for @iconNameGaming.
  ///
  /// In en, this message translates to:
  /// **'Gaming'**
  String get iconNameGaming;

  /// No description provided for @iconNameMedia.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get iconNameMedia;

  /// No description provided for @iconNameMusicQueue.
  ///
  /// In en, this message translates to:
  /// **'Music Queue'**
  String get iconNameMusicQueue;

  /// No description provided for @iconNameVideoLibrary.
  ///
  /// In en, this message translates to:
  /// **'Video Library'**
  String get iconNameVideoLibrary;

  /// No description provided for @iconNamePhotoLibrary.
  ///
  /// In en, this message translates to:
  /// **'Photo Library'**
  String get iconNamePhotoLibrary;

  /// No description provided for @iconNameComponent.
  ///
  /// In en, this message translates to:
  /// **'Component'**
  String get iconNameComponent;

  /// No description provided for @iconNameHdmi.
  ///
  /// In en, this message translates to:
  /// **'HDMI'**
  String get iconNameHdmi;

  /// No description provided for @iconNameComposite.
  ///
  /// In en, this message translates to:
  /// **'Composite'**
  String get iconNameComposite;

  /// No description provided for @iconNameAntenna.
  ///
  /// In en, this message translates to:
  /// **'Antenna'**
  String get iconNameAntenna;

  /// No description provided for @iconNameFavorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get iconNameFavorite;

  /// No description provided for @iconNameFavoriteOutline.
  ///
  /// In en, this message translates to:
  /// **'Favorite Outline'**
  String get iconNameFavoriteOutline;

  /// No description provided for @iconNameStar.
  ///
  /// In en, this message translates to:
  /// **'Star'**
  String get iconNameStar;

  /// No description provided for @iconNameStarOutline.
  ///
  /// In en, this message translates to:
  /// **'Star Outline'**
  String get iconNameStarOutline;

  /// No description provided for @iconNameBookmark.
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get iconNameBookmark;

  /// No description provided for @iconNameBookmarkOutline.
  ///
  /// In en, this message translates to:
  /// **'Bookmark Outline'**
  String get iconNameBookmarkOutline;

  /// No description provided for @iconNameFlag.
  ///
  /// In en, this message translates to:
  /// **'Flag'**
  String get iconNameFlag;

  /// No description provided for @iconNameCheck.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get iconNameCheck;

  /// No description provided for @iconNameDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get iconNameDone;

  /// No description provided for @iconNameDoneAll.
  ///
  /// In en, this message translates to:
  /// **'Done All'**
  String get iconNameDoneAll;

  /// No description provided for @iconNameSchedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get iconNameSchedule;

  /// No description provided for @iconNameTimer.
  ///
  /// In en, this message translates to:
  /// **'Timer'**
  String get iconNameTimer;

  /// No description provided for @iconNameTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get iconNameTime;

  /// No description provided for @iconNameAlarm.
  ///
  /// In en, this message translates to:
  /// **'Alarm'**
  String get iconNameAlarm;

  /// No description provided for @iconNameNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get iconNameNotifications;

  /// No description provided for @iconNameLock.
  ///
  /// In en, this message translates to:
  /// **'Lock'**
  String get iconNameLock;

  /// No description provided for @iconNameUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get iconNameUnlock;

  /// No description provided for @iconNameLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get iconNameLight;

  /// No description provided for @iconNameLightOutline.
  ///
  /// In en, this message translates to:
  /// **'Light Outline'**
  String get iconNameLightOutline;

  /// No description provided for @iconNameWarmLight.
  ///
  /// In en, this message translates to:
  /// **'Warm Light'**
  String get iconNameWarmLight;

  /// No description provided for @iconNameSunny.
  ///
  /// In en, this message translates to:
  /// **'Sunny'**
  String get iconNameSunny;

  /// No description provided for @iconNameCloudy.
  ///
  /// In en, this message translates to:
  /// **'Cloudy'**
  String get iconNameCloudy;

  /// No description provided for @iconNameNight.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get iconNameNight;

  /// No description provided for @iconNameFlare.
  ///
  /// In en, this message translates to:
  /// **'Flare'**
  String get iconNameFlare;

  /// No description provided for @iconNameGradient.
  ///
  /// In en, this message translates to:
  /// **'Gradient'**
  String get iconNameGradient;

  /// No description provided for @iconNameInvertColors.
  ///
  /// In en, this message translates to:
  /// **'Invert Colors'**
  String get iconNameInvertColors;

  /// No description provided for @iconNamePalette.
  ///
  /// In en, this message translates to:
  /// **'Palette'**
  String get iconNamePalette;

  /// No description provided for @iconNameColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get iconNameColor;

  /// No description provided for @iconNameTonality.
  ///
  /// In en, this message translates to:
  /// **'Tonality'**
  String get iconNameTonality;

  /// No description provided for @iconNameSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get iconNameSearch;

  /// No description provided for @iconNameRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get iconNameRefresh;

  /// No description provided for @iconNameSync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get iconNameSync;

  /// No description provided for @iconNameUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get iconNameUpdate;

  /// No description provided for @iconNameDownload.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get iconNameDownload;

  /// No description provided for @iconNameUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get iconNameUpload;

  /// No description provided for @iconNameCloud.
  ///
  /// In en, this message translates to:
  /// **'Cloud'**
  String get iconNameCloud;

  /// No description provided for @iconNameFolder.
  ///
  /// In en, this message translates to:
  /// **'Folder'**
  String get iconNameFolder;

  /// No description provided for @iconNameDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get iconNameDelete;

  /// No description provided for @iconNameEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get iconNameEdit;

  /// No description provided for @iconNameSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get iconNameSave;

  /// No description provided for @iconNameShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get iconNameShare;

  /// No description provided for @iconNamePrint.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get iconNamePrint;

  /// No description provided for @iconNameLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get iconNameLanguage;

  /// No description provided for @iconNameTranslate.
  ///
  /// In en, this message translates to:
  /// **'Translate'**
  String get iconNameTranslate;

  /// No description provided for @iconNameMicNone.
  ///
  /// In en, this message translates to:
  /// **'Mic None'**
  String get iconNameMicNone;

  /// No description provided for @iconNameSubtitles.
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get iconNameSubtitles;

  /// No description provided for @iconNameClosedCaption.
  ///
  /// In en, this message translates to:
  /// **'Closed Caption'**
  String get iconNameClosedCaption;

  /// No description provided for @iconNameMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get iconNameMusic;

  /// No description provided for @iconNameMovie.
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get iconNameMovie;

  /// No description provided for @iconNameTheater.
  ///
  /// In en, this message translates to:
  /// **'Theater'**
  String get iconNameTheater;

  /// No description provided for @iconNameLiveTv.
  ///
  /// In en, this message translates to:
  /// **'Live TV'**
  String get iconNameLiveTv;

  /// No description provided for @iconNameRadio.
  ///
  /// In en, this message translates to:
  /// **'Radio'**
  String get iconNameRadio;

  /// No description provided for @iconNameCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get iconNameCamera;

  /// No description provided for @iconNameVideoCamera.
  ///
  /// In en, this message translates to:
  /// **'Video Camera'**
  String get iconNameVideoCamera;

  /// No description provided for @iconNamePhotoCamera.
  ///
  /// In en, this message translates to:
  /// **'Photo Camera'**
  String get iconNamePhotoCamera;

  /// No description provided for @iconNameSlowMotion.
  ///
  /// In en, this message translates to:
  /// **'Slow Motion'**
  String get iconNameSlowMotion;

  /// No description provided for @iconNameSpeed.
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get iconNameSpeed;

  /// No description provided for @iconNameVideoSettings.
  ///
  /// In en, this message translates to:
  /// **'Video Settings'**
  String get iconNameVideoSettings;

  /// No description provided for @iconNameAudioTrack.
  ///
  /// In en, this message translates to:
  /// **'Audio Track'**
  String get iconNameAudioTrack;

  /// No description provided for @iconNameGraphicEq.
  ///
  /// In en, this message translates to:
  /// **'Graphic EQ'**
  String get iconNameGraphicEq;

  /// No description provided for @iconNameMusicVideo.
  ///
  /// In en, this message translates to:
  /// **'Music Video'**
  String get iconNameMusicVideo;

  /// No description provided for @iconNamePlaylist.
  ///
  /// In en, this message translates to:
  /// **'Playlist'**
  String get iconNamePlaylist;

  /// No description provided for @iconNameQueue.
  ///
  /// In en, this message translates to:
  /// **'Queue'**
  String get iconNameQueue;

  /// No description provided for @iconNameNum0Fa.
  ///
  /// In en, this message translates to:
  /// **'0 FA'**
  String get iconNameNum0Fa;

  /// No description provided for @iconNameNum1Fa.
  ///
  /// In en, this message translates to:
  /// **'1 FA'**
  String get iconNameNum1Fa;

  /// No description provided for @iconNameNum2Fa.
  ///
  /// In en, this message translates to:
  /// **'2 FA'**
  String get iconNameNum2Fa;

  /// No description provided for @iconNameNum3Fa.
  ///
  /// In en, this message translates to:
  /// **'3 FA'**
  String get iconNameNum3Fa;

  /// No description provided for @iconNameNum4Fa.
  ///
  /// In en, this message translates to:
  /// **'4 FA'**
  String get iconNameNum4Fa;

  /// No description provided for @iconNameNum5Fa.
  ///
  /// In en, this message translates to:
  /// **'5 FA'**
  String get iconNameNum5Fa;

  /// No description provided for @iconNameNum6Fa.
  ///
  /// In en, this message translates to:
  /// **'6 FA'**
  String get iconNameNum6Fa;

  /// No description provided for @iconNameNum7Fa.
  ///
  /// In en, this message translates to:
  /// **'7 FA'**
  String get iconNameNum7Fa;

  /// No description provided for @iconNameNum8Fa.
  ///
  /// In en, this message translates to:
  /// **'8 FA'**
  String get iconNameNum8Fa;

  /// No description provided for @iconNameNum9Fa.
  ///
  /// In en, this message translates to:
  /// **'9 FA'**
  String get iconNameNum9Fa;

  /// No description provided for @iconNameHashFa.
  ///
  /// In en, this message translates to:
  /// **'Hash # FA'**
  String get iconNameHashFa;

  /// No description provided for @iconNamePercentFa.
  ///
  /// In en, this message translates to:
  /// **'Percent % FA'**
  String get iconNamePercentFa;

  /// No description provided for @iconNameDivideFa.
  ///
  /// In en, this message translates to:
  /// **'Divide ÷ FA'**
  String get iconNameDivideFa;

  /// No description provided for @iconNameMultiplyFa.
  ///
  /// In en, this message translates to:
  /// **'Multiply × FA'**
  String get iconNameMultiplyFa;

  /// No description provided for @iconNameEqualsFa.
  ///
  /// In en, this message translates to:
  /// **'Equals = FA'**
  String get iconNameEqualsFa;

  /// No description provided for @iconNameNotEqualFa.
  ///
  /// In en, this message translates to:
  /// **'Not Equal ≠ FA'**
  String get iconNameNotEqualFa;

  /// No description provided for @iconNameGreaterThanFa.
  ///
  /// In en, this message translates to:
  /// **'Greater Than > FA'**
  String get iconNameGreaterThanFa;

  /// No description provided for @iconNameLessThanFa.
  ///
  /// In en, this message translates to:
  /// **'Less Than < FA'**
  String get iconNameLessThanFa;

  /// No description provided for @iconNameAsteriskFa.
  ///
  /// In en, this message translates to:
  /// **'Asterisk * FA'**
  String get iconNameAsteriskFa;

  /// No description provided for @iconNameAFa.
  ///
  /// In en, this message translates to:
  /// **'A FA'**
  String get iconNameAFa;

  /// No description provided for @iconNameBFa.
  ///
  /// In en, this message translates to:
  /// **'B FA'**
  String get iconNameBFa;

  /// No description provided for @iconNameCFa.
  ///
  /// In en, this message translates to:
  /// **'C FA'**
  String get iconNameCFa;

  /// No description provided for @iconNameDFa.
  ///
  /// In en, this message translates to:
  /// **'D FA'**
  String get iconNameDFa;

  /// No description provided for @iconNameEFa.
  ///
  /// In en, this message translates to:
  /// **'E FA'**
  String get iconNameEFa;

  /// No description provided for @iconNameFFa.
  ///
  /// In en, this message translates to:
  /// **'F FA'**
  String get iconNameFFa;

  /// No description provided for @iconNameGFa.
  ///
  /// In en, this message translates to:
  /// **'G FA'**
  String get iconNameGFa;

  /// No description provided for @iconNameHFa.
  ///
  /// In en, this message translates to:
  /// **'H FA'**
  String get iconNameHFa;

  /// No description provided for @iconNameIFa.
  ///
  /// In en, this message translates to:
  /// **'I FA'**
  String get iconNameIFa;

  /// No description provided for @iconNameJFa.
  ///
  /// In en, this message translates to:
  /// **'J FA'**
  String get iconNameJFa;

  /// No description provided for @iconNameKFa.
  ///
  /// In en, this message translates to:
  /// **'K FA'**
  String get iconNameKFa;

  /// No description provided for @iconNameLFa.
  ///
  /// In en, this message translates to:
  /// **'L FA'**
  String get iconNameLFa;

  /// No description provided for @iconNameMFa.
  ///
  /// In en, this message translates to:
  /// **'M FA'**
  String get iconNameMFa;

  /// No description provided for @iconNameNFa.
  ///
  /// In en, this message translates to:
  /// **'N FA'**
  String get iconNameNFa;

  /// No description provided for @iconNameOFa.
  ///
  /// In en, this message translates to:
  /// **'O FA'**
  String get iconNameOFa;

  /// No description provided for @iconNamePFa.
  ///
  /// In en, this message translates to:
  /// **'P FA'**
  String get iconNamePFa;

  /// No description provided for @iconNameQFa.
  ///
  /// In en, this message translates to:
  /// **'Q FA'**
  String get iconNameQFa;

  /// No description provided for @iconNameRFa.
  ///
  /// In en, this message translates to:
  /// **'R FA'**
  String get iconNameRFa;

  /// No description provided for @iconNameSFa.
  ///
  /// In en, this message translates to:
  /// **'S FA'**
  String get iconNameSFa;

  /// No description provided for @iconNameTFa.
  ///
  /// In en, this message translates to:
  /// **'T FA'**
  String get iconNameTFa;

  /// No description provided for @iconNameUFa.
  ///
  /// In en, this message translates to:
  /// **'U FA'**
  String get iconNameUFa;

  /// No description provided for @iconNameVFa.
  ///
  /// In en, this message translates to:
  /// **'V FA'**
  String get iconNameVFa;

  /// No description provided for @iconNameWFa.
  ///
  /// In en, this message translates to:
  /// **'W FA'**
  String get iconNameWFa;

  /// No description provided for @iconNameXFa.
  ///
  /// In en, this message translates to:
  /// **'X FA'**
  String get iconNameXFa;

  /// No description provided for @iconNameYFa.
  ///
  /// In en, this message translates to:
  /// **'Y FA'**
  String get iconNameYFa;

  /// No description provided for @iconNameZFa.
  ///
  /// In en, this message translates to:
  /// **'Z FA'**
  String get iconNameZFa;

  /// No description provided for @iconNamePlayFa.
  ///
  /// In en, this message translates to:
  /// **'Play FA'**
  String get iconNamePlayFa;

  /// No description provided for @iconNamePauseFa.
  ///
  /// In en, this message translates to:
  /// **'Pause FA'**
  String get iconNamePauseFa;

  /// No description provided for @iconNameStopFa.
  ///
  /// In en, this message translates to:
  /// **'Stop FA'**
  String get iconNameStopFa;

  /// No description provided for @iconNamePlayFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Play FA Outline'**
  String get iconNamePlayFaOutline;

  /// No description provided for @iconNamePauseFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Pause FA Outline'**
  String get iconNamePauseFaOutline;

  /// No description provided for @iconNameStopFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Stop FA Outline'**
  String get iconNameStopFaOutline;

  /// No description provided for @iconNameBackwardFa.
  ///
  /// In en, this message translates to:
  /// **'Backward FA'**
  String get iconNameBackwardFa;

  /// No description provided for @iconNameForwardFa.
  ///
  /// In en, this message translates to:
  /// **'Forward FA'**
  String get iconNameForwardFa;

  /// No description provided for @iconNamePreviousFa.
  ///
  /// In en, this message translates to:
  /// **'Previous FA'**
  String get iconNamePreviousFa;

  /// No description provided for @iconNameNextFa.
  ///
  /// In en, this message translates to:
  /// **'Next FA'**
  String get iconNameNextFa;

  /// No description provided for @iconNameRewindFa.
  ///
  /// In en, this message translates to:
  /// **'Rewind FA'**
  String get iconNameRewindFa;

  /// No description provided for @iconNameFastForwardFa.
  ///
  /// In en, this message translates to:
  /// **'Fast Forward FA'**
  String get iconNameFastForwardFa;

  /// No description provided for @iconNameRepeatFa.
  ///
  /// In en, this message translates to:
  /// **'Repeat FA'**
  String get iconNameRepeatFa;

  /// No description provided for @iconNameShuffleFa.
  ///
  /// In en, this message translates to:
  /// **'Shuffle FA'**
  String get iconNameShuffleFa;

  /// No description provided for @iconNameEjectFa.
  ///
  /// In en, this message translates to:
  /// **'Eject FA'**
  String get iconNameEjectFa;

  /// No description provided for @iconNameFilmFa.
  ///
  /// In en, this message translates to:
  /// **'Film FA'**
  String get iconNameFilmFa;

  /// No description provided for @iconNameVideoFa.
  ///
  /// In en, this message translates to:
  /// **'Video FA'**
  String get iconNameVideoFa;

  /// No description provided for @iconNameMusicFa.
  ///
  /// In en, this message translates to:
  /// **'Music FA'**
  String get iconNameMusicFa;

  /// No description provided for @iconNameMicrophoneFa.
  ///
  /// In en, this message translates to:
  /// **'Microphone FA'**
  String get iconNameMicrophoneFa;

  /// No description provided for @iconNameCameraFa.
  ///
  /// In en, this message translates to:
  /// **'Camera FA'**
  String get iconNameCameraFa;

  /// No description provided for @iconNameCameraRetroFa.
  ///
  /// In en, this message translates to:
  /// **'Camera Retro FA'**
  String get iconNameCameraRetroFa;

  /// No description provided for @iconNameVolumeHighFa.
  ///
  /// In en, this message translates to:
  /// **'Volume High FA'**
  String get iconNameVolumeHighFa;

  /// No description provided for @iconNameVolumeLowFa.
  ///
  /// In en, this message translates to:
  /// **'Volume Low FA'**
  String get iconNameVolumeLowFa;

  /// No description provided for @iconNameVolumeOffFa.
  ///
  /// In en, this message translates to:
  /// **'Volume Off FA'**
  String get iconNameVolumeOffFa;

  /// No description provided for @iconNameMuteFa.
  ///
  /// In en, this message translates to:
  /// **'Mute FA'**
  String get iconNameMuteFa;

  /// No description provided for @iconNameMicMuteFa.
  ///
  /// In en, this message translates to:
  /// **'Mic Mute FA'**
  String get iconNameMicMuteFa;

  /// No description provided for @iconNameHeadphonesFa.
  ///
  /// In en, this message translates to:
  /// **'Headphones FA'**
  String get iconNameHeadphonesFa;

  /// No description provided for @iconNameSpeakerFa.
  ///
  /// In en, this message translates to:
  /// **'Speaker FA'**
  String get iconNameSpeakerFa;

  /// No description provided for @iconNameUpFa.
  ///
  /// In en, this message translates to:
  /// **'Up FA'**
  String get iconNameUpFa;

  /// No description provided for @iconNameDownFa.
  ///
  /// In en, this message translates to:
  /// **'Down FA'**
  String get iconNameDownFa;

  /// No description provided for @iconNameLeftFa.
  ///
  /// In en, this message translates to:
  /// **'Left FA'**
  String get iconNameLeftFa;

  /// No description provided for @iconNameRightFa.
  ///
  /// In en, this message translates to:
  /// **'Right FA'**
  String get iconNameRightFa;

  /// No description provided for @iconNameUpFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Up FA Outline'**
  String get iconNameUpFaOutline;

  /// No description provided for @iconNameDownFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Down FA Outline'**
  String get iconNameDownFaOutline;

  /// No description provided for @iconNameLeftFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Left FA Outline'**
  String get iconNameLeftFaOutline;

  /// No description provided for @iconNameRightFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Right FA Outline'**
  String get iconNameRightFaOutline;

  /// No description provided for @iconNameArrowUpFa.
  ///
  /// In en, this message translates to:
  /// **'Arrow Up FA'**
  String get iconNameArrowUpFa;

  /// No description provided for @iconNameArrowDownFa.
  ///
  /// In en, this message translates to:
  /// **'Arrow Down FA'**
  String get iconNameArrowDownFa;

  /// No description provided for @iconNameArrowLeftFa.
  ///
  /// In en, this message translates to:
  /// **'Arrow Left FA'**
  String get iconNameArrowLeftFa;

  /// No description provided for @iconNameArrowRightFa.
  ///
  /// In en, this message translates to:
  /// **'Arrow Right FA'**
  String get iconNameArrowRightFa;

  /// No description provided for @iconNameChevronUpFa.
  ///
  /// In en, this message translates to:
  /// **'Chevron Up FA'**
  String get iconNameChevronUpFa;

  /// No description provided for @iconNameChevronDownFa.
  ///
  /// In en, this message translates to:
  /// **'Chevron Down FA'**
  String get iconNameChevronDownFa;

  /// No description provided for @iconNameChevronLeftFa.
  ///
  /// In en, this message translates to:
  /// **'Chevron Left FA'**
  String get iconNameChevronLeftFa;

  /// No description provided for @iconNameChevronRightFa.
  ///
  /// In en, this message translates to:
  /// **'Chevron Right FA'**
  String get iconNameChevronRightFa;

  /// No description provided for @iconNameOkFa.
  ///
  /// In en, this message translates to:
  /// **'OK FA'**
  String get iconNameOkFa;

  /// No description provided for @iconNameOkFaOutline.
  ///
  /// In en, this message translates to:
  /// **'OK FA Outline'**
  String get iconNameOkFaOutline;

  /// No description provided for @iconNameCheckFa.
  ///
  /// In en, this message translates to:
  /// **'Check FA'**
  String get iconNameCheckFa;

  /// No description provided for @iconNameCloseFa.
  ///
  /// In en, this message translates to:
  /// **'Close FA'**
  String get iconNameCloseFa;

  /// No description provided for @iconNameCloseCircleFa.
  ///
  /// In en, this message translates to:
  /// **'Close Circle FA'**
  String get iconNameCloseCircleFa;

  /// No description provided for @iconNameHomeFa.
  ///
  /// In en, this message translates to:
  /// **'Home FA'**
  String get iconNameHomeFa;

  /// No description provided for @iconNameUndoFa.
  ///
  /// In en, this message translates to:
  /// **'Undo FA'**
  String get iconNameUndoFa;

  /// No description provided for @iconNameRedoFa.
  ///
  /// In en, this message translates to:
  /// **'Redo FA'**
  String get iconNameRedoFa;

  /// No description provided for @iconNameRotateFa.
  ///
  /// In en, this message translates to:
  /// **'Rotate FA'**
  String get iconNameRotateFa;

  /// No description provided for @iconNameSearchFa.
  ///
  /// In en, this message translates to:
  /// **'Search FA'**
  String get iconNameSearchFa;

  /// No description provided for @iconNameRefreshFa.
  ///
  /// In en, this message translates to:
  /// **'Refresh FA'**
  String get iconNameRefreshFa;

  /// No description provided for @iconNamePowerOffFa.
  ///
  /// In en, this message translates to:
  /// **'Power Off FA'**
  String get iconNamePowerOffFa;

  /// No description provided for @iconNamePlugFa.
  ///
  /// In en, this message translates to:
  /// **'Plug FA'**
  String get iconNamePlugFa;

  /// No description provided for @iconNameToggleOnFa.
  ///
  /// In en, this message translates to:
  /// **'Toggle On FA'**
  String get iconNameToggleOnFa;

  /// No description provided for @iconNameToggleOffFa.
  ///
  /// In en, this message translates to:
  /// **'Toggle Off FA'**
  String get iconNameToggleOffFa;

  /// No description provided for @iconNameSettingsFa.
  ///
  /// In en, this message translates to:
  /// **'Settings FA'**
  String get iconNameSettingsFa;

  /// No description provided for @iconNameSettingsAltFa.
  ///
  /// In en, this message translates to:
  /// **'Settings Alt FA'**
  String get iconNameSettingsAltFa;

  /// No description provided for @iconNameMenuFa.
  ///
  /// In en, this message translates to:
  /// **'Menu FA'**
  String get iconNameMenuFa;

  /// No description provided for @iconNameMoreFa.
  ///
  /// In en, this message translates to:
  /// **'More FA'**
  String get iconNameMoreFa;

  /// No description provided for @iconNameMoreVerticalFa.
  ///
  /// In en, this message translates to:
  /// **'More Vertical FA'**
  String get iconNameMoreVerticalFa;

  /// No description provided for @iconNameInfoFa.
  ///
  /// In en, this message translates to:
  /// **'Info FA'**
  String get iconNameInfoFa;

  /// No description provided for @iconNameInfoFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Info FA Outline'**
  String get iconNameInfoFaOutline;

  /// No description provided for @iconNameHelpFa.
  ///
  /// In en, this message translates to:
  /// **'Help FA'**
  String get iconNameHelpFa;

  /// No description provided for @iconNameHelpFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Help FA Outline'**
  String get iconNameHelpFaOutline;

  /// No description provided for @iconNameListFa.
  ///
  /// In en, this message translates to:
  /// **'List FA'**
  String get iconNameListFa;

  /// No description provided for @iconNameGridFa.
  ///
  /// In en, this message translates to:
  /// **'Grid FA'**
  String get iconNameGridFa;

  /// No description provided for @iconNameSlidersFa.
  ///
  /// In en, this message translates to:
  /// **'Sliders FA'**
  String get iconNameSlidersFa;

  /// No description provided for @iconNameTvFa.
  ///
  /// In en, this message translates to:
  /// **'TV FA'**
  String get iconNameTvFa;

  /// No description provided for @iconNameMonitorFa.
  ///
  /// In en, this message translates to:
  /// **'Monitor FA'**
  String get iconNameMonitorFa;

  /// No description provided for @iconNameDesktopFa.
  ///
  /// In en, this message translates to:
  /// **'Desktop FA'**
  String get iconNameDesktopFa;

  /// No description provided for @iconNameBrightnessFa.
  ///
  /// In en, this message translates to:
  /// **'Brightness FA'**
  String get iconNameBrightnessFa;

  /// No description provided for @iconNameNightModeFa.
  ///
  /// In en, this message translates to:
  /// **'Night Mode FA'**
  String get iconNameNightModeFa;

  /// No description provided for @iconNameLightFa.
  ///
  /// In en, this message translates to:
  /// **'Light FA'**
  String get iconNameLightFa;

  /// No description provided for @iconNameLightFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Light FA Outline'**
  String get iconNameLightFaOutline;

  /// No description provided for @iconNameFlashFa.
  ///
  /// In en, this message translates to:
  /// **'Flash FA'**
  String get iconNameFlashFa;

  /// No description provided for @iconNameFullscreenFa.
  ///
  /// In en, this message translates to:
  /// **'Fullscreen FA'**
  String get iconNameFullscreenFa;

  /// No description provided for @iconNameExitFullscreenFa.
  ///
  /// In en, this message translates to:
  /// **'Exit Fullscreen FA'**
  String get iconNameExitFullscreenFa;

  /// No description provided for @iconNameZoomInFa.
  ///
  /// In en, this message translates to:
  /// **'Zoom In FA'**
  String get iconNameZoomInFa;

  /// No description provided for @iconNameZoomOutFa.
  ///
  /// In en, this message translates to:
  /// **'Zoom Out FA'**
  String get iconNameZoomOutFa;

  /// No description provided for @iconNameSubtitlesFa.
  ///
  /// In en, this message translates to:
  /// **'Subtitles FA'**
  String get iconNameSubtitlesFa;

  /// No description provided for @iconNamePictureInPictureFa.
  ///
  /// In en, this message translates to:
  /// **'Picture in Picture FA'**
  String get iconNamePictureInPictureFa;

  /// No description provided for @iconNameColorFa.
  ///
  /// In en, this message translates to:
  /// **'Color FA'**
  String get iconNameColorFa;

  /// No description provided for @iconNamePaintFa.
  ///
  /// In en, this message translates to:
  /// **'Paint FA'**
  String get iconNamePaintFa;

  /// No description provided for @iconNameInputFa.
  ///
  /// In en, this message translates to:
  /// **'Input FA'**
  String get iconNameInputFa;

  /// No description provided for @iconNameWifiFa.
  ///
  /// In en, this message translates to:
  /// **'WiFi FA'**
  String get iconNameWifiFa;

  /// No description provided for @iconNameBluetoothFa.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth FA'**
  String get iconNameBluetoothFa;

  /// No description provided for @iconNameUsbFa.
  ///
  /// In en, this message translates to:
  /// **'USB FA'**
  String get iconNameUsbFa;

  /// No description provided for @iconNameEthernetFa.
  ///
  /// In en, this message translates to:
  /// **'Ethernet FA'**
  String get iconNameEthernetFa;

  /// No description provided for @iconNameGamepadFa.
  ///
  /// In en, this message translates to:
  /// **'Gamepad FA'**
  String get iconNameGamepadFa;

  /// No description provided for @iconNameBroadcastFa.
  ///
  /// In en, this message translates to:
  /// **'Broadcast FA'**
  String get iconNameBroadcastFa;

  /// No description provided for @iconNameSatelliteFa.
  ///
  /// In en, this message translates to:
  /// **'Satellite FA'**
  String get iconNameSatelliteFa;

  /// No description provided for @iconNameAntennaFa.
  ///
  /// In en, this message translates to:
  /// **'Antenna FA'**
  String get iconNameAntennaFa;

  /// No description provided for @iconNameNetworkFa.
  ///
  /// In en, this message translates to:
  /// **'Network FA'**
  String get iconNameNetworkFa;

  /// No description provided for @iconNameCloudFa.
  ///
  /// In en, this message translates to:
  /// **'Cloud FA'**
  String get iconNameCloudFa;

  /// No description provided for @iconNameStarFa.
  ///
  /// In en, this message translates to:
  /// **'Star FA'**
  String get iconNameStarFa;

  /// No description provided for @iconNameStarFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Star FA Outline'**
  String get iconNameStarFaOutline;

  /// No description provided for @iconNameHeartFa.
  ///
  /// In en, this message translates to:
  /// **'Heart FA'**
  String get iconNameHeartFa;

  /// No description provided for @iconNameHeartFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Heart FA Outline'**
  String get iconNameHeartFaOutline;

  /// No description provided for @iconNameBookmarkFa.
  ///
  /// In en, this message translates to:
  /// **'Bookmark FA'**
  String get iconNameBookmarkFa;

  /// No description provided for @iconNameBookmarkFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Bookmark FA Outline'**
  String get iconNameBookmarkFaOutline;

  /// No description provided for @iconNameFlagFa.
  ///
  /// In en, this message translates to:
  /// **'Flag FA'**
  String get iconNameFlagFa;

  /// No description provided for @iconNameClockFa.
  ///
  /// In en, this message translates to:
  /// **'Clock FA'**
  String get iconNameClockFa;

  /// No description provided for @iconNameClockFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Clock FA Outline'**
  String get iconNameClockFaOutline;

  /// No description provided for @iconNameBellFa.
  ///
  /// In en, this message translates to:
  /// **'Bell FA'**
  String get iconNameBellFa;

  /// No description provided for @iconNameBellFaOutline.
  ///
  /// In en, this message translates to:
  /// **'Bell FA Outline'**
  String get iconNameBellFaOutline;

  /// No description provided for @iconNameTimerFa.
  ///
  /// In en, this message translates to:
  /// **'Timer FA'**
  String get iconNameTimerFa;

  /// No description provided for @iconNameLockFa.
  ///
  /// In en, this message translates to:
  /// **'Lock FA'**
  String get iconNameLockFa;

  /// No description provided for @iconNameUnlockFa.
  ///
  /// In en, this message translates to:
  /// **'Unlock FA'**
  String get iconNameUnlockFa;

  /// No description provided for @iconNameGalleryFa.
  ///
  /// In en, this message translates to:
  /// **'Gallery FA'**
  String get iconNameGalleryFa;

  /// No description provided for @iconNameImagesFa.
  ///
  /// In en, this message translates to:
  /// **'Images FA'**
  String get iconNameImagesFa;

  /// No description provided for @iconNameImageFa.
  ///
  /// In en, this message translates to:
  /// **'Image FA'**
  String get iconNameImageFa;

  /// No description provided for @iconNameVideoFileFa.
  ///
  /// In en, this message translates to:
  /// **'Video File FA'**
  String get iconNameVideoFileFa;

  /// No description provided for @iconNameAudioFileFa.
  ///
  /// In en, this message translates to:
  /// **'Audio File FA'**
  String get iconNameAudioFileFa;

  /// No description provided for @iconNamePlayOutlineFa.
  ///
  /// In en, this message translates to:
  /// **'Play Outline FA'**
  String get iconNamePlayOutlineFa;

  /// No description provided for @iconNamePlaySimpleFa.
  ///
  /// In en, this message translates to:
  /// **'Play Simple FA'**
  String get iconNamePlaySimpleFa;

  /// No description provided for @iconNamePauseSimpleFa.
  ///
  /// In en, this message translates to:
  /// **'Pause Simple FA'**
  String get iconNamePauseSimpleFa;

  /// No description provided for @iconNameStopSimpleFa.
  ///
  /// In en, this message translates to:
  /// **'Stop Simple FA'**
  String get iconNameStopSimpleFa;

  /// No description provided for @iconNameRecordFa.
  ///
  /// In en, this message translates to:
  /// **'Record FA'**
  String get iconNameRecordFa;

  /// No description provided for @iconNameStopCircleFa.
  ///
  /// In en, this message translates to:
  /// **'Stop Circle FA'**
  String get iconNameStopCircleFa;

  /// No description provided for @iconNameLoadingFa.
  ///
  /// In en, this message translates to:
  /// **'Loading FA'**
  String get iconNameLoadingFa;

  /// No description provided for @iconNameTextFa.
  ///
  /// In en, this message translates to:
  /// **'Text FA'**
  String get iconNameTextFa;

  /// No description provided for @iconNameTextSizeFa.
  ///
  /// In en, this message translates to:
  /// **'Text Size FA'**
  String get iconNameTextSizeFa;

  /// No description provided for @iconNameLanguageFa.
  ///
  /// In en, this message translates to:
  /// **'Language FA'**
  String get iconNameLanguageFa;

  /// No description provided for @iconNameGlobeFa.
  ///
  /// In en, this message translates to:
  /// **'Globe FA'**
  String get iconNameGlobeFa;

  /// No description provided for @iconNameSubtitlesAltFa.
  ///
  /// In en, this message translates to:
  /// **'Subtitles Alt FA'**
  String get iconNameSubtitlesAltFa;

  /// No description provided for @iconNameSubtitlesAltOutlineFa.
  ///
  /// In en, this message translates to:
  /// **'Subtitles Alt Outline FA'**
  String get iconNameSubtitlesAltOutlineFa;

  /// No description provided for @iconNameChannelUpFa.
  ///
  /// In en, this message translates to:
  /// **'Channel Up FA'**
  String get iconNameChannelUpFa;

  /// No description provided for @iconNameChannelDownFa.
  ///
  /// In en, this message translates to:
  /// **'Channel Down FA'**
  String get iconNameChannelDownFa;

  /// No description provided for @iconNamePageUpFa.
  ///
  /// In en, this message translates to:
  /// **'Page Up FA'**
  String get iconNamePageUpFa;

  /// No description provided for @iconNamePageDownFa.
  ///
  /// In en, this message translates to:
  /// **'Page Down FA'**
  String get iconNamePageDownFa;

  /// No description provided for @iconNameGuideFa.
  ///
  /// In en, this message translates to:
  /// **'Guide FA'**
  String get iconNameGuideFa;

  /// No description provided for @iconNameGridViewFa.
  ///
  /// In en, this message translates to:
  /// **'Grid View FA'**
  String get iconNameGridViewFa;

  /// No description provided for @iconNameGridAltFa.
  ///
  /// In en, this message translates to:
  /// **'Grid Alt FA'**
  String get iconNameGridAltFa;

  /// No description provided for @iconNameScheduleFa.
  ///
  /// In en, this message translates to:
  /// **'Schedule FA'**
  String get iconNameScheduleFa;

  /// No description provided for @iconNameCalendarFa.
  ///
  /// In en, this message translates to:
  /// **'Calendar FA'**
  String get iconNameCalendarFa;

  /// No description provided for @iconNameRedButtonFa.
  ///
  /// In en, this message translates to:
  /// **'Red Button FA'**
  String get iconNameRedButtonFa;

  /// No description provided for @iconNameButtonOutlineFa.
  ///
  /// In en, this message translates to:
  /// **'Button Outline FA'**
  String get iconNameButtonOutlineFa;

  /// No description provided for @iconNameSquareButtonFa.
  ///
  /// In en, this message translates to:
  /// **'Square Button FA'**
  String get iconNameSquareButtonFa;

  /// No description provided for @iconNameSquareOutlineFa.
  ///
  /// In en, this message translates to:
  /// **'Square Outline FA'**
  String get iconNameSquareOutlineFa;

  /// No description provided for @iconNameDotCircleFa.
  ///
  /// In en, this message translates to:
  /// **'Dot Circle FA'**
  String get iconNameDotCircleFa;

  /// No description provided for @iconNameToolsFa.
  ///
  /// In en, this message translates to:
  /// **'Tools FA'**
  String get iconNameToolsFa;

  /// No description provided for @iconNameScrewdriverFa.
  ///
  /// In en, this message translates to:
  /// **'Screwdriver FA'**
  String get iconNameScrewdriverFa;

  /// No description provided for @iconNameHammerFa.
  ///
  /// In en, this message translates to:
  /// **'Hammer FA'**
  String get iconNameHammerFa;

  /// No description provided for @iconNameToolboxFa.
  ///
  /// In en, this message translates to:
  /// **'Toolbox FA'**
  String get iconNameToolboxFa;

  /// No description provided for @iconNameCogFa.
  ///
  /// In en, this message translates to:
  /// **'Cog FA'**
  String get iconNameCogFa;

  /// No description provided for @iconNameAdjustFa.
  ///
  /// In en, this message translates to:
  /// **'Adjust FA'**
  String get iconNameAdjustFa;

  /// No description provided for @iconNameFilterFa.
  ///
  /// In en, this message translates to:
  /// **'Filter FA'**
  String get iconNameFilterFa;

  /// No description provided for @iconNameSortDownFa.
  ///
  /// In en, this message translates to:
  /// **'Sort Down FA'**
  String get iconNameSortDownFa;

  /// No description provided for @iconNameSortUpFa.
  ///
  /// In en, this message translates to:
  /// **'Sort Up FA'**
  String get iconNameSortUpFa;

  /// No description provided for @iconNameSleepFa.
  ///
  /// In en, this message translates to:
  /// **'Sleep FA'**
  String get iconNameSleepFa;

  /// No description provided for @iconNameTimerStartFa.
  ///
  /// In en, this message translates to:
  /// **'Timer Start FA'**
  String get iconNameTimerStartFa;

  /// No description provided for @iconNameTimerHalfFa.
  ///
  /// In en, this message translates to:
  /// **'Timer Half FA'**
  String get iconNameTimerHalfFa;

  /// No description provided for @iconNameTimerEndFa.
  ///
  /// In en, this message translates to:
  /// **'Timer End FA'**
  String get iconNameTimerEndFa;

  /// No description provided for @iconNameStopwatchFa.
  ///
  /// In en, this message translates to:
  /// **'Stopwatch FA'**
  String get iconNameStopwatchFa;

  /// No description provided for @iconNameAlarmFa.
  ///
  /// In en, this message translates to:
  /// **'Alarm FA'**
  String get iconNameAlarmFa;

  /// No description provided for @iconNameCropAltFa.
  ///
  /// In en, this message translates to:
  /// **'Crop Alt FA'**
  String get iconNameCropAltFa;

  /// No description provided for @iconNameCropFa.
  ///
  /// In en, this message translates to:
  /// **'Crop FA'**
  String get iconNameCropFa;

  /// No description provided for @iconNameSquareFullFa.
  ///
  /// In en, this message translates to:
  /// **'Square Full FA'**
  String get iconNameSquareFullFa;

  /// No description provided for @iconNameFullscreenAltFa.
  ///
  /// In en, this message translates to:
  /// **'Fullscreen Alt FA'**
  String get iconNameFullscreenAltFa;

  /// No description provided for @iconNameZoomPlusFa.
  ///
  /// In en, this message translates to:
  /// **'Zoom Plus FA'**
  String get iconNameZoomPlusFa;

  /// No description provided for @iconNameZoomMinusFa.
  ///
  /// In en, this message translates to:
  /// **'Zoom Minus FA'**
  String get iconNameZoomMinusFa;

  /// No description provided for @iconNameMusicNoteFa.
  ///
  /// In en, this message translates to:
  /// **'Music Note FA'**
  String get iconNameMusicNoteFa;

  /// No description provided for @iconNameCdFa.
  ///
  /// In en, this message translates to:
  /// **'CD FA'**
  String get iconNameCdFa;

  /// No description provided for @iconNameVinylFa.
  ///
  /// In en, this message translates to:
  /// **'Vinyl FA'**
  String get iconNameVinylFa;

  /// No description provided for @iconNameRssFa.
  ///
  /// In en, this message translates to:
  /// **'RSS FA'**
  String get iconNameRssFa;

  /// No description provided for @iconNameMagicFa.
  ///
  /// In en, this message translates to:
  /// **'Magic FA'**
  String get iconNameMagicFa;

  /// No description provided for @iconNameFingerprintFa.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint FA'**
  String get iconNameFingerprintFa;

  /// No description provided for @iconNameUserFa.
  ///
  /// In en, this message translates to:
  /// **'User FA'**
  String get iconNameUserFa;

  /// No description provided for @iconNameUsersFa.
  ///
  /// In en, this message translates to:
  /// **'Users FA'**
  String get iconNameUsersFa;

  /// No description provided for @iconNameChildModeFa.
  ///
  /// In en, this message translates to:
  /// **'Child Mode FA'**
  String get iconNameChildModeFa;

  /// No description provided for @iconNameCastFa.
  ///
  /// In en, this message translates to:
  /// **'Cast FA'**
  String get iconNameCastFa;

  /// No description provided for @iconNameStreamFa.
  ///
  /// In en, this message translates to:
  /// **'Stream FA'**
  String get iconNameStreamFa;

  /// No description provided for @iconNameSignalFa.
  ///
  /// In en, this message translates to:
  /// **'Signal FA'**
  String get iconNameSignalFa;

  /// No description provided for @iconNameFeedFa.
  ///
  /// In en, this message translates to:
  /// **'Feed FA'**
  String get iconNameFeedFa;

  /// No description provided for @iconNameCircleArrowUpFa.
  ///
  /// In en, this message translates to:
  /// **'Circle Arrow Up FA'**
  String get iconNameCircleArrowUpFa;

  /// No description provided for @iconNameCircleArrowDownFa.
  ///
  /// In en, this message translates to:
  /// **'Circle Arrow Down FA'**
  String get iconNameCircleArrowDownFa;

  /// No description provided for @iconNameCircleArrowLeftFa.
  ///
  /// In en, this message translates to:
  /// **'Circle Arrow Left FA'**
  String get iconNameCircleArrowLeftFa;

  /// No description provided for @iconNameCircleArrowRightFa.
  ///
  /// In en, this message translates to:
  /// **'Circle Arrow Right FA'**
  String get iconNameCircleArrowRightFa;

  /// No description provided for @iconNameLongArrowUpFa.
  ///
  /// In en, this message translates to:
  /// **'Long Arrow Up FA'**
  String get iconNameLongArrowUpFa;

  /// No description provided for @iconNameLongArrowDownFa.
  ///
  /// In en, this message translates to:
  /// **'Long Arrow Down FA'**
  String get iconNameLongArrowDownFa;

  /// No description provided for @iconNameLongArrowLeftFa.
  ///
  /// In en, this message translates to:
  /// **'Long Arrow Left FA'**
  String get iconNameLongArrowLeftFa;

  /// No description provided for @iconNameLongArrowRightFa.
  ///
  /// In en, this message translates to:
  /// **'Long Arrow Right FA'**
  String get iconNameLongArrowRightFa;

  /// No description provided for @iconNamePlusFa.
  ///
  /// In en, this message translates to:
  /// **'Plus FA'**
  String get iconNamePlusFa;

  /// No description provided for @iconNameMinusFa.
  ///
  /// In en, this message translates to:
  /// **'Minus FA'**
  String get iconNameMinusFa;

  /// No description provided for @iconNamePlusCircleFa.
  ///
  /// In en, this message translates to:
  /// **'Plus Circle FA'**
  String get iconNamePlusCircleFa;

  /// No description provided for @iconNameMinusCircleFa.
  ///
  /// In en, this message translates to:
  /// **'Minus Circle FA'**
  String get iconNameMinusCircleFa;

  /// No description provided for @iconNamePlusSquareFa.
  ///
  /// In en, this message translates to:
  /// **'Plus Square FA'**
  String get iconNamePlusSquareFa;

  /// No description provided for @iconNameMinusSquareFa.
  ///
  /// In en, this message translates to:
  /// **'Minus Square FA'**
  String get iconNameMinusSquareFa;

  /// No description provided for @iconNameTimesFa.
  ///
  /// In en, this message translates to:
  /// **'Times FA'**
  String get iconNameTimesFa;

  /// No description provided for @iconNameTimesCircleFa.
  ///
  /// In en, this message translates to:
  /// **'Times Circle FA'**
  String get iconNameTimesCircleFa;

  /// No description provided for @iconNameBatteryFullFa.
  ///
  /// In en, this message translates to:
  /// **'Battery Full FA'**
  String get iconNameBatteryFullFa;

  /// No description provided for @iconNameBattery34Fa.
  ///
  /// In en, this message translates to:
  /// **'Battery 3/4 FA'**
  String get iconNameBattery34Fa;

  /// No description provided for @iconNameBatteryHalfFa.
  ///
  /// In en, this message translates to:
  /// **'Battery Half FA'**
  String get iconNameBatteryHalfFa;

  /// No description provided for @iconNameBattery14Fa.
  ///
  /// In en, this message translates to:
  /// **'Battery 1/4 FA'**
  String get iconNameBattery14Fa;

  /// No description provided for @iconNameBatteryEmptyFa.
  ///
  /// In en, this message translates to:
  /// **'Battery Empty FA'**
  String get iconNameBatteryEmptyFa;

  /// No description provided for @iconNameChargingFa.
  ///
  /// In en, this message translates to:
  /// **'Charging FA'**
  String get iconNameChargingFa;

  /// No description provided for @iconNameCloudSunFa.
  ///
  /// In en, this message translates to:
  /// **'Cloud Sun FA'**
  String get iconNameCloudSunFa;

  /// No description provided for @iconNameCloudMoonFa.
  ///
  /// In en, this message translates to:
  /// **'Cloud Moon FA'**
  String get iconNameCloudMoonFa;

  /// No description provided for @iconNameRainFa.
  ///
  /// In en, this message translates to:
  /// **'Rain FA'**
  String get iconNameRainFa;

  /// No description provided for @iconNameSnowflakeFa.
  ///
  /// In en, this message translates to:
  /// **'Snowflake FA'**
  String get iconNameSnowflakeFa;

  /// No description provided for @iconNameFireFa.
  ///
  /// In en, this message translates to:
  /// **'Fire FA'**
  String get iconNameFireFa;

  /// No description provided for @iconNameTemperatureFa.
  ///
  /// In en, this message translates to:
  /// **'Temperature FA'**
  String get iconNameTemperatureFa;

  /// No description provided for @iconNameBoxFa.
  ///
  /// In en, this message translates to:
  /// **'Box FA'**
  String get iconNameBoxFa;

  /// No description provided for @iconNameGiftFa.
  ///
  /// In en, this message translates to:
  /// **'Gift FA'**
  String get iconNameGiftFa;

  /// No description provided for @iconNameTrophyFa.
  ///
  /// In en, this message translates to:
  /// **'Trophy FA'**
  String get iconNameTrophyFa;

  /// No description provided for @iconNameCrownFa.
  ///
  /// In en, this message translates to:
  /// **'Crown FA'**
  String get iconNameCrownFa;

  /// No description provided for @iconNameGemFa.
  ///
  /// In en, this message translates to:
  /// **'Gem FA'**
  String get iconNameGemFa;

  /// No description provided for @unknownLabel.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknownLabel;

  /// No description provided for @selectedFilesLabel.
  ///
  /// In en, this message translates to:
  /// **'selected file(s)'**
  String get selectedFilesLabel;

  /// No description provided for @folderNotFoundOrInaccessible.
  ///
  /// In en, this message translates to:
  /// **'Folder not found or inaccessible.'**
  String get folderNotFoundOrInaccessible;

  /// No description provided for @importedRemoteDefaultName.
  ///
  /// In en, this message translates to:
  /// **'ImportedRemote'**
  String get importedRemoteDefaultName;

  /// No description provided for @demoRemoteName.
  ///
  /// In en, this message translates to:
  /// **'Demo Remote'**
  String get demoRemoteName;

  /// No description provided for @protocolFieldsInvalid.
  ///
  /// In en, this message translates to:
  /// **'Fill required protocol fields and ensure frequency is 15k–60k if set.'**
  String get protocolFieldsInvalid;

  /// No description provided for @unknownProtocolSelected.
  ///
  /// In en, this message translates to:
  /// **'Unknown protocol selected.'**
  String get unknownProtocolSelected;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'de',
        'en',
        'es',
        'fil',
        'fr',
        'hi',
        'id',
        'it',
        'ja',
        'ko',
        'ms',
        'nl',
        'pl',
        'pt',
        'ru',
        'th',
        'tr',
        'uk',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'ar':
      {
        switch (locale.countryCode) {
          case 'EG':
            return AppLocalizationsArEg();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
