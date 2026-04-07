// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'लोड हो रहा है…';

  @override
  String get unknownError => 'अज्ञात त्रुटि';

  @override
  String get failedToStart => 'प्रारंभ नहीं हुआ';

  @override
  String get retry => 'Retry';

  @override
  String get quickTilePower => 'पावर';

  @override
  String get quickTileMute => 'म्यूट';

  @override
  String get quickTileVolumeUp => 'Vol +';

  @override
  String get quickTileVolumeDown => 'Vol -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'इस फ़ोन में अंतर्निर्मित IR emitter नहीं है। USB IR डोंगल मिला है, लेकिन अभी अनुमति नहीं मिली है।\n\nIR भेजना सक्षम करने के लिए USB अनुमति प्रॉम्प्ट स्वीकार करें।';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'इस फ़ोन में अंतर्निर्मित IR emitter नहीं है। USB IR डोंगल मिला, लेकिन USB अनुमति अस्वीकृत हुई।\n\nफिर से अनुमति मांगें और IR भेजना सक्षम करने के लिए प्रॉम्प्ट स्वीकार करें।';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'इस फ़ोन में अंतर्निर्मित IR emitter नहीं है। USB IR डोंगल अधिकृत है, लेकिन अभी शुरू नहीं हुआ है।';

  @override
  String get homeUsbOpenFailedMessage =>
      'इस फ़ोन में अंतर्निर्मित IR emitter नहीं है। USB IR डोंगल मिला और अधिकृत है, लेकिन इसे शुरू नहीं किया जा सका।\n\nडोंगल फिर से जोड़ें और दोबारा प्रयास करें।';

  @override
  String get homeUsbReadyMessage =>
      'इस फ़ोन में अंतर्निर्मित IR emitter नहीं है।';

  @override
  String get homeUsbNoDeviceMessage =>
      'इस फ़ोन में अंतर्निर्मित IR emitter नहीं है, और अभी कोई समर्थित USB IR डोंगल जुड़ा नहीं है।\n\nYou सकता है अभी भी बनाएं, आयात, और प्रबंधित करें रिमोट — लेकिन तक transmit IR सिग्नल you ज़रूरत एक का the options नीचे.';

  @override
  String get homeUsbOptionPlugIn =>
      'Plug में a समर्थित USB IR डोंगल, फिर स्वीकार करें अनुमति.';

  @override
  String get homeUsbOptionReady => 'उपयोग के लिए तैयार।';

  @override
  String get homeUsbOptionPermissionRequired => 'Plugged में. अनुमति आवश्यक.';

  @override
  String get homeUsbOptionPermissionDenied => 'अनुमति अस्वीकृत. अनुरोध it फिर.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'अधिकृत. आरंभ किया जा रहा है डोंगल.';

  @override
  String get homeUsbOptionOpenFailed => 'अधिकृत है, लेकिन आरंभ नहीं हो सका।';

  @override
  String get homeHardwareBannerNoInternal =>
      'यह फ़ोन has नहीं अंतर्निर्मित IR. Connect a USB IR डोंगल या सक्षम करें ऑडियो मोड में सेटिंग्स.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'USB डोंगल मिला. अनुमति आवश्यक तक भेजें IR.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'USB अनुमति अस्वीकृत हुई. अनुरोध it फिर तक भेजें IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'USB डोंगल अधिकृत है। आरंभ की प्रतीक्षा में।';

  @override
  String get homeHardwareBannerOpenFailed =>
      'USB डोंगल अधिकृत, लेकिन आरंभ विफल.';

  @override
  String get homeHardwareBannerReady => 'USB तैयार है।';

  @override
  String get homeHardwareRequiredTitle =>
      'कमांड भेजने के लिए IR हार्डवेयर आवश्यक';

  @override
  String get homeUsbDongleRecommended => 'USB IR डोंगल (अनुशंसित)';

  @override
  String get homeAudioAdapterAlternative => 'ऑडियो IR एडेप्टर (विकल्प)';

  @override
  String get homeAudioAdapterDescription =>
      'सेटिंग्स → IR प्रेषक → ऑडियो (1 LED / 2 LED). आवश्यक है an audio-to-IR adapter.';

  @override
  String get close => 'बंद करें';

  @override
  String get homeChooseTransmitter => 'चुनें a प्रेषक';

  @override
  String get openSettings => 'खोलें सेटिंग्स';

  @override
  String get homeUsbPermissionSentApprove =>
      'USB अनुमति अनुरोध भेजा गया। USB सक्षम करने के लिए प्रॉम्प्ट स्वीकार करें।';

  @override
  String get homeUsbDongleNotDetected =>
      'नहीं समर्थित USB IR डोंगल मिला. Plug it में और दोबारा प्रयास करें.';

  @override
  String get homeUsbPermissionRequestFailed => 'USB अनुमति का अनुरोध विफल रहा।';

  @override
  String get working => 'Working…';

  @override
  String get requestUsbPermission => 'अनुरोध USB अनुमति';

  @override
  String get homeHardwareTip =>
      'सुझाव: आप अभी भी रिमोट बना और व्यवस्थित कर सकते हैं। हार्डवेयर केवल IR भेजते समय आवश्यक है।';

  @override
  String get homeNoIrTransmitterTitle => 'नहीं IR प्रेषक उपलब्ध';

  @override
  String get settingsNavLabel => 'सेटिंग्स';

  @override
  String get dismiss => 'हटाएं';

  @override
  String get remotesNavLabel => 'रिमोट';

  @override
  String get macrosNavLabel => 'मैक्रो';

  @override
  String get signalTesterNavLabel => 'सिग्नल टेस्टर';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get remoteNoIrEmitterTitle => 'कोई IR emitter नहीं';

  @override
  String get remoteNoIrEmitterMessage => 'इस डिवाइस में IR emitter नहीं है';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'इस ऐप को काम करने के लिए IR emitter चाहिए';

  @override
  String get remoteDismiss => 'हटाएं';

  @override
  String get remoteClose => 'बंद करें';

  @override
  String remoteFailedToSend(Object error) {
    return 'भेजें IR: $error विफल';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'प्रारंभ लूप: $error विफल';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'लूप रुका हुआ (भेजें विफल): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Looping \"$title\". टैप करें रोकें में the शीर्ष bar तक रोकें.';
  }

  @override
  String get remoteLoopStopped => 'लूप रुक गया।';

  @override
  String get remoteUpdatedNotFound =>
      'रिमोट अपडेट किया गया पर स्क्रीन. It था नहीं मिला में the सहेजा गया सूची.';

  @override
  String remoteUpdatedNamed(Object name) {
    return '\"$name\" अपडेट किया गया।';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'हटाएं विफल: $error';
  }

  @override
  String get remoteNotFoundSavedList => 'रिमोट नहीं मिला में सहेजा गया सूची.';

  @override
  String remoteDeletedNamed(Object name) {
    return '\"$name\" हटाया गया।';
  }

  @override
  String get buttonFallbackTitle => 'बटन';

  @override
  String get imageFallbackTitle => 'छवि';

  @override
  String get noBrowserAvailable => 'कोई ब्राउज़र उपलब्ध नहीं';

  @override
  String failedToOpen(Object error) {
    return 'खोलें: $error विफल';
  }

  @override
  String get cancel => 'रद्द करें';

  @override
  String get settingsRestoreDemoTitle => 'पुनर्स्थापित करें demo रिमोट?';

  @override
  String get settingsRestoreDemoMessage =>
      'यह आपके वर्तमान रिमोट को अंतर्निर्मित डेमो रिमोट से बदल देगा। यदि आप अपनी मौजूदा सूची रखना चाहते हैं तो बैकअप लेना बेहतर है।';

  @override
  String get settingsRestoreDemoConfirm => 'पुनर्स्थापित करें demo';

  @override
  String get settingsDemoRemotesRestored => 'डेमो रिमोट पुनर्स्थापित किए गए।';

  @override
  String get settingsDeleteAllRemotesTitle => 'हटाएं सभी रिमोट?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'यह इस डिवाइस से हर रिमोट हटा देगा। इस क्रिया को पूर्ववत नहीं किया जा सकता।';

  @override
  String get settingsDeleteAllConfirm => 'हटाएं सभी';

  @override
  String get settingsAllRemotesDeleted => 'सभी रिमोट हटाया गया.';

  @override
  String get themeAuto => 'स्वतः थीम';

  @override
  String get themeLight => 'हल्का थीम';

  @override
  String get themeDark => 'गहरा थीम';

  @override
  String get themeDescAuto => 'पालन करता है आपकी डिवाइस सेटिंग्स';

  @override
  String get themeDescLight => 'हमेशा उज्ज्वल और स्पष्ट';

  @override
  String get themeDescDark => 'आंखों के लिए आरामदायक';

  @override
  String get themeHintAuto =>
      'जब आप अपने डिवाइस सेटिंग्स में हल्का और गहरा मोड बदलते हैं, थीम अपने आप बदल जाती है';

  @override
  String get themeHintLight =>
      'के लिए उपयुक्त दिन उपयोग करें और अच्छी रोशनी वाले परिवेश';

  @override
  String get themeHintDark =>
      'कम करता है आंख तनाव में low-light स्थितियां और बचाता है बैटरी पर OLED स्क्रीन';

  @override
  String get supportDevelopmentTitle => 'विकास का समर्थन करें';

  @override
  String get supportDevelopmentSubtitle =>
      'IR Blaster को बनाए रखें और हार्डवेयर-संगत बनाए रखें';

  @override
  String get supportDevelopmentBody =>
      'कोई विज्ञापन नहीं, कोई ट्रैकिंग नहीं, कोई बंद फीचर नहीं। आपका समर्थन प्रोटोकॉल कार्य, USB डोंगल समर्थन और उपकरणों में बेहतर संगतता को वित्त देता है।';

  @override
  String get donate => 'Donate';

  @override
  String get starRepo => 'रिपॉजिटरी को स्टार करें';

  @override
  String get repositoryLinkCopied => 'रिपॉजिटरी लिंक कॉपी किया गया';

  @override
  String get supportPillLocalOnly => 'केवल स्थानीय';

  @override
  String get supportPillNoTracking => 'कोई ट्रैकिंग नहीं';

  @override
  String get supportPillHardwareAware => 'हार्डवेयर-सचेत';

  @override
  String get supportPillOpenSource => 'ओपन-सोर्स';

  @override
  String get appearanceTitle => 'दिखावट';

  @override
  String get appearanceSubtitle => 'अपने दृश्य अनुभव को अनुकूलित करें';

  @override
  String get localizationTitle => 'स्थानीयकरण';

  @override
  String get localizationSubtitle => 'ऐप भाषा और अनुवाद व्यवहार';

  @override
  String localizationAutoUsing(Object language) {
    return 'स्वतः: उपयोग कर रहा है $language';
  }

  @override
  String get localizationAutoDescription =>
      'The ऐप पालन करता है आपकी डिवाइस भाषा जब संभव.';

  @override
  String get localizationManualDescription =>
      'The ऐप भाषा है मैन्युअल रूप से बदली गई.';

  @override
  String get useSystemLanguageTitle => 'उपयोग करें सिस्टम भाषा';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'आपकी डिवाइस भाषा का पालन कर रहा है: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'उपयोग करें the भाषा चयनित नीचे instead का the डिवाइस डिफ़ॉल्ट.';

  @override
  String get chooseAppLanguage => 'चुनें ऐप भाषा';

  @override
  String get languagePickerDisabledHint =>
      'Turn off सिस्टम भाषा तक चुनें a भाषा मैन्युअल रूप से.';

  @override
  String get searchLanguages => 'भाषाएं खोजें';

  @override
  String get noLanguagesFound => 'कोई मेल खाती भाषा नहीं';

  @override
  String get localizationHint =>
      'जब सिस्टम भाषा सक्षम होती है, ऐप आपके डिवाइस की locale का पालन करता है और अनुवाद उपलब्ध न होने पर अंग्रेज़ी पर लौटता है। किसी विशेष भाषा पर ऐप को स्थिर करने के लिए इसे बंद करें।';

  @override
  String get appLanguageTitle => 'ऐप भाषा';

  @override
  String get appLanguageHint =>
      'स्वतः आपके डिवाइस की भाषा का पालन करता है। केवल इस ऐप के लिए इसे बदलने हेतु यहां अंग्रेज़ी या फ़्रेंच चुनें।';

  @override
  String get languageAuto => 'स्वतः (सिस्टम)';

  @override
  String get languageAutoDescription => 'पालन करें आपकी डिवाइस भाषा स्वतः';

  @override
  String get languageEnglish => 'अंग्रेज़ी';

  @override
  String get languageEnglishDescription =>
      'ऐप को हमेशा अंग्रेज़ी उपयोग करने पर मजबूर करें';

  @override
  String get languageFrench => 'फ़्रेंच';

  @override
  String get languageFrenchDescription =>
      'ऐप को हमेशा फ़्रेंच उपयोग करने पर मजबूर करें';

  @override
  String get languageAutoShort => 'स्वतः';

  @override
  String get languageEnglishShort => 'English';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'डायनेमिक रंग उपयोग करें';

  @override
  String get themeChoiceAuto => 'स्वतः';

  @override
  String get themeChoiceLight => 'हल्का';

  @override
  String get themeChoiceDark => 'गहरा';

  @override
  String get irTransmitterTitle => 'IR प्रेषक';

  @override
  String get irTransmitterSubtitle =>
      'चुनें कौन सा हार्डवेयर भेजता है IR कमांड';

  @override
  String get learningModeEntryTitle => 'सीखने का तरीका';

  @override
  String get learningModeEntrySubtitle =>
      'भौतिक रिमोट से चरण दर चरण एक बटन कैप्चर करें';

  @override
  String get learningModeTitle => 'सीखने का तरीका';

  @override
  String get learningModeHeroTitle => 'रिमोट बटन को साफ-साफ सीखें';

  @override
  String get learningModeHeroSubtitle =>
      'अपना रिसीवर सेट करें, मूल रिमोट तैयार करें, एक कमांड कैप्चर करें, फिर रिमोट में सेव करने से पहले उसकी समीक्षा करें।';

  @override
  String get learningModeReadyBadge => 'रिसीवर तैयार';

  @override
  String get learningModeNeedsPermissionBadge => 'USB अनुमति की आवश्यकता है';

  @override
  String get learningModeSetupBadge => 'रिसीवर सेटअप की आवश्यकता है';

  @override
  String get learningModeNoReceiverBadge => 'कोई सीखने वाला रिसीवर नहीं';

  @override
  String get learningModeCheckingBadge => 'हार्डवेयर की जाँच हो रही है';

  @override
  String get learningModeFourStepFlow => '4-चरणीय निर्देशित प्रवाह';

  @override
  String get learningModeSaveAnywhereBadge => 'सहेजने से पहले समीक्षा करें';

  @override
  String get learningModeGuideTitle => 'जहां कब्जा होना चाहिए वहां उठाओ';

  @override
  String get learningModeStepHardwareShort => 'हार्डवेयर';

  @override
  String get learningModeStepPrepareShort => 'तैयार करना';

  @override
  String get learningModeStepCaptureShort => 'कब्जा';

  @override
  String get learningModeStepReviewShort => 'समीक्षा';

  @override
  String get learningModeStepHardwareTitle => 'रिसीवर हार्डवेयर की जाँच करें';

  @override
  String get learningModeStepHardwareSubtitle =>
      'सुनिश्चित करें कि प्रारंभ करने से पहले एक संगत शिक्षण रिसीवर संलग्न और अधिकृत है।';

  @override
  String get learningModeCurrentSenderLabel => 'वर्तमान ट्रांसमीटर';

  @override
  String get learningModeReceiverStatusLabel => 'सीखने की स्थिति';

  @override
  String get learningModeCheckingHardwareBody =>
      'उपलब्ध ट्रांसमीटर और यूएसबी रिसीवर स्थिति की जाँच करना।';

  @override
  String get learningModeHardwareReadyBody =>
      'एक USB IR डोंगल संलग्न और प्रारंभ किया गया है। कैप्चर वायरिंग कनेक्ट होने के बाद सीखने का प्रवाह शुरू करने के लिए यह सही जगह है।';

  @override
  String get learningModeHardwarePermissionBody =>
      'एक यूएसबी डोंगल मौजूद है, लेकिन एंड्रॉइड अनुमति अभी भी इसे रोक रही है। सीखने से पहले ट्रांसमीटर अनुभाग में USB की अनुमति दें।';

  @override
  String get learningModeHardwareSetupBody =>
      'डोंगल का आंशिक रूप से पता चला है, लेकिन सीखने को विश्वसनीय रूप से शुरू करने से पहले इसे अभी भी सेटअप या पुन: कनेक्ट करने की आवश्यकता है।';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'वर्तमान में कोई संगत रिसीवर हार्डवेयर उपलब्ध नहीं है। लर्निंग मोड प्राप्त क्षमता वाले समर्थित बाहरी डोंगल के लिए अभिप्रेत है।';

  @override
  String get learningModeRefreshHardware => 'हार्डवेयर स्थिति ताज़ा करें';

  @override
  String get learningModeHardwareTipTitle => 'सर्वोत्तम प्लेसमेंट';

  @override
  String get learningModeHardwareTipBody =>
      'लर्निंग मोड आईआर ट्रांसमीटर के अंतर्गत रहता है क्योंकि यह हार्डवेयर उपलब्धता पर निर्भर करता है और रिमोट भेजने की तुलना में कम बार उपयोग किया जाता है।';

  @override
  String get learningModeStepPrepareTitle => 'मूल रिमोट तैयार करें';

  @override
  String get learningModeStepPrepareSubtitle =>
      'तय करें कि आप क्या सीख रहे हैं, फिर मूल रिमोट को स्थिर रखें और रिसीवर के पास रखें।';

  @override
  String get learningModeButtonNameLabel => 'बटन का नाम';

  @override
  String get learningModeButtonNameHint =>
      'उदाहरण के लिए: एचडीएमआई 1, पावर, मेनू';

  @override
  String get learningModeSinglePress => 'सिंगल प्रेस';

  @override
  String get learningModeHoldButton => 'बटन दबाकर रखें';

  @override
  String get learningModePreparationChecklistTitle =>
      'इससे पहले कि आप कब्जा कर लें';

  @override
  String get learningModePreparationItemDistance =>
      'मूल रिमोट को रिसीवर से लगभग 2 से 5 सेमी दूर रखें।';

  @override
  String get learningModePreparationItemOneButton =>
      'एक समय में एक बटन सीखें और पहले एक संक्षिप्त, साफ़ प्रेस का उपयोग करें।';

  @override
  String get learningModePreparationItemStill =>
      'शोर या आंशिक कैप्चर से बचने के लिए दोनों डिवाइस को स्थिर रखें।';

  @override
  String get learningModeStepCaptureTitle => 'सिग्नल कैप्चर करें';

  @override
  String get learningModeStepCaptureSubtitle =>
      'किसी एक आदेश को सुनें, फिर उसकी समीक्षा करने से पहले परिणाम को लॉक कर दें।';

  @override
  String get learningModeCaptureReadyTitle => 'सुनने के लिए तैयार';

  @override
  String get learningModeCaptureReadyBody =>
      'आपकी हार्डवेयर स्थिति अच्छी दिख रही है. कैप्चर बैकएंड अगले चरण में प्लग हो जाएगा।';

  @override
  String get learningModeCaptureBlockedTitle => 'हार्डवेयर अभी तैयार नहीं है';

  @override
  String get learningModeCaptureBlockedBody =>
      'आप अभी भी प्रवाह की समीक्षा कर सकते हैं, लेकिन रिसीवर के तैयार होने तक कैप्चर का इंतजार करना चाहिए।';

  @override
  String get learningModeStartListening => 'सुनना शुरू करें';

  @override
  String get learningModeCaptureStubTitle => 'कैप्चर बैकएंड अगला आता है';

  @override
  String get learningModeCaptureStubBody =>
      'यह स्क्रीन पहले पूरी तरह से तैयार की जाती है ताकि अंतिम कैप्चर प्रवाह को बाद में बोल्ट किए जाने के बजाय वास्तविक हार्डवेयर स्थितियों में प्लग किया जा सके।';

  @override
  String get learningModeCaptureStubMessage =>
      'लर्निंग कैप्चर अभी तक वायर्ड नहीं है। यह स्क्रीन पहले पूर्ण प्रवाह को व्यवस्थित करती है।';

  @override
  String get learningModeUnnamedCapture => 'अनाम कब्जा';

  @override
  String get learningModeStatusCheckingTitle => 'रिसीवर की जाँच हो रही है';

  @override
  String get learningModeStatusNoReceiverTitle => 'रिसीवर तैयार नहीं है';

  @override
  String get learningModeStatusPermissionTitle => 'USB अनुमति आवश्यक है';

  @override
  String get learningModeStatusSetupTitle => 'रिसीवर को सेटअप की आवश्यकता है';

  @override
  String get learningModeStatusReadyTitle => 'सीखने के लिए तैयार';

  @override
  String get learningModeStatusListeningTitle => 'किसी संकेत को सुनना';

  @override
  String get learningModeStatusCapturedTitle => 'सिग्नल पकड़ लिया गया';

  @override
  String get learningModeStatusReadyBody =>
      'बटन को नाम दें, मूल रिमोट को रिसीवर की ओर इंगित करें, और जब आप तैयार हों तो सुनना शुरू करें।';

  @override
  String get learningModeStatusListeningBody =>
      'अब मूल रिमोट बटन दबाएँ। एक बार कैप्चर वायर्ड हो जाने पर, यह स्थिति अगले क्लीन सिग्नल पर लॉक हो जाएगी।';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return '$buttonName के लिए एक सीखा हुआ सिग्नल पूर्वावलोकन तैयार है। इसे दोबारा चलाएं, पुष्टि करें कि यह काम करता है, फिर इसे अपनी लाइब्रेरी में सहेजें।';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'एक संगत शिक्षण डोंगल कनेक्ट करें';

  @override
  String get learningModeConnectReceiverBody =>
      'लर्निंग मोड बाहरी हार्डवेयर पर निर्भर करता है जो आईआर प्राप्त कर सकता है। एक बार जब रिसीवर का पता लगा लिया जाता है और उसे अधिकृत कर लिया जाता है, तो यह पेज सीधे सुनने, परीक्षण करने और सहेजने का प्रवाह बन जाता है।';

  @override
  String get learningModeListenCardTitle => 'एक बटन के लिए सुनो';

  @override
  String get learningModeListenCardBody =>
      'यदि आप चाहें तो पहले एक लेबल सेट करें, फिर सुनना शुरू करें और मूल रिमोट पर बटन दबाएँ।';

  @override
  String get learningModeReadyToListenTitle => 'सुनने के लिए तैयार';

  @override
  String get learningModeReadyToListenBody =>
      'यह मुख्य कैप्चर सतह है. केवल तभी सुनना शुरू करें जब मूल रिमोट लक्षित और स्थिर हो।';

  @override
  String get learningModeListeningNowTitle => 'अब सुन रहा हूँ';

  @override
  String get learningModeListeningNowBody =>
      'मूल रिमोट बटन को एक बार दबाएं। वास्तविक कैप्चर बैकएंड को वायर्ड करने से पहले शेष मचान के माध्यम से जाने के लिए पूर्वावलोकन कैप्चर का उपयोग करें।';

  @override
  String get learningModePreviewCaptureAction =>
      'कैप्चर किए गए सिग्नल का पूर्वावलोकन करें';

  @override
  String get learningModeCapturedSummary => 'सिग्नल पूर्वावलोकन सीखा';

  @override
  String get learningModeResultActionsTitle => 'परीक्षण करें और सहेजें';

  @override
  String get learningModeResultActionsBody =>
      'सीखे गए सिग्नल को दोबारा चलाएं, सत्यापित करें कि लक्ष्य डिवाइस प्रतिक्रिया दे रहा है, फिर इसे पुन: प्रयोज्य बटन के रूप में सहेजें।';

  @override
  String get learningModeReplayAction => 'REPLAY';

  @override
  String get learningModeReplayStubMessage =>
      'रीप्ले अभी तक वायर्ड नहीं है. यह अंतिम सीखने, परीक्षण करने और सहेजने के प्रवाह के लिए यूआई मचान है।';

  @override
  String get learningModeSaveStubMessage =>
      'सेव अभी तक वायर्ड नहीं है. अगला चरण इस स्क्रीन को क्रिएट बटन और मौजूदा रिमोट से कनेक्ट करना है।';

  @override
  String get learningModeLearnAnotherAction => 'एक और बटन जानें';

  @override
  String get learningModeStepReviewTitle => 'समीक्षा करें और सहेजें';

  @override
  String get learningModeStepReviewSubtitle =>
      'जो सीखा गया उसकी पुष्टि करें, फिर चुनें कि उसे आपकी दूरस्थ लाइब्रेरी में कहाँ रहना चाहिए।';

  @override
  String get learningModeSaveToExistingRemote => 'मौजूदा रिमोट';

  @override
  String get learningModeCreateNewRemote => 'नया रिमोट';

  @override
  String get learningModeProtocolPreviewTitle => 'प्रोटोकॉल पूर्वावलोकन';

  @override
  String get learningModeProtocolPreviewBody =>
      'एक बार रिसीवर द्वारा क्लीन बटन दबाए जाने पर डिकोड किए गए प्रोटोकॉल विवरण यहां दिखाई देंगे।';

  @override
  String get learningModeRawPreviewTitle => 'कच्चा फ़ॉलबैक';

  @override
  String get learningModeRawPreviewBody =>
      'यदि डिकोडिंग अधूरी है, तो रॉ टाइमिंग कैप्चर अभी भी समीक्षा और बचत के लिए यहां उपलब्ध रहेगा।';

  @override
  String get learningModeSaveCapture => 'कैप्चर सहेजें';

  @override
  String get learningModeReviewTipTitle => 'यह आगे कहां जाएगा';

  @override
  String get learningModeReviewTipBody =>
      'कार्यान्वयन के अगले चरण में इस समीक्षा पैनल को क्रिएट बटन और मौजूदा रिमोट से जोड़ा जाना चाहिए ताकि सीखा हुआ सिग्नल सीधे आपकी लाइब्रेरी में चला जाए।';

  @override
  String get learningModeFinishPreview => 'पूर्वावलोकन समाप्त करें';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'इंटरैक्शन';

  @override
  String get interactionSubtitle => 'स्पर्श प्रतिक्रिया और रिमोट लेआउट';

  @override
  String get hapticFeedbackTitle => 'हैप्टिक फीडबैक';

  @override
  String get hapticFeedbackSubtitle => 'टैप और क्रियाओं पर कंपन करें';

  @override
  String get forceInAppVibrationTitle => 'ऐप के भीतर कंपन को बाध्य करें';

  @override
  String get forceInAppVibrationSubtitle =>
      'सिस्टम टच फ़ीडबैक बंद होने पर भी सीधे वाइब्रेटर का उपयोग करें';

  @override
  String get forceInAppVibrationWarning =>
      'उन्नत विकल्प। इससे ऐप तब भी कंपन कर सकता है जब Android का टच फ़ीडबैक वैश्विक रूप से बंद हो।';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'तीव्रता';

  @override
  String get intensityLight => 'हल्का';

  @override
  String get intensityMedium => 'Medium';

  @override
  String get intensityStrong => 'Strong';

  @override
  String get flipRemoteDefaultTitle => 'Flip रिमोट दृश्य द्वारा डिफ़ॉल्ट';

  @override
  String get flipRemoteDefaultSubtitle =>
      'रिमोट स्क्रीन 180° घुमाकर खोलें (नीचे लगे USB डोंगल के लिए)।';

  @override
  String get remoteViewFlipped => 'रिमोट दृश्य होगा खोलें उल्टा.';

  @override
  String get remoteViewNormal => 'रिमोट दृश्य सामान्य रूप से खुलेगा।';

  @override
  String get backupTitle => 'बैकअप';

  @override
  String get backupSubtitle => 'आयात/निर्यात रिमोट और मैक्रो';

  @override
  String get importBackup => 'आयात करें बैकअप';

  @override
  String get importBackupSubtitle =>
      'आयात करें रिमोट/मैक्रो बैकअप या Flipper Zero, LIRC या IRPLUS फ़ाइलें';

  @override
  String get bulkImportFolder => 'Bulk आयात फ़ोल्डर';

  @override
  String get bulkImportFolderSubtitle =>
      'आयात करें multiple रिमोट से a फ़ोल्डर';

  @override
  String get exportBackup => 'निर्यात करें बैकअप';

  @override
  String get exportBackupSubtitle =>
      'सहेजें रिमोट + मैक्रो as एक JSON फ़ाइल तक Downloads';

  @override
  String get restoreDemoRemotes => 'पुनर्स्थापित करें demo रिमोट';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Replace वर्तमान रिमोट के साथ the अंतर्निर्मित demo';

  @override
  String get deleteAllRemotes => 'हटाएं सभी रिमोट';

  @override
  String get deleteAllRemotesSubtitle => 'every रिमोट से यह डिवाइस हटाएं';

  @override
  String get backupTip =>
      'सुझाव: निर्यात a बैकअप पहले बड़े संपादन. आयात करें समर्थन करता है पूर्ण बैकअप, legacy remotes-only JSON बैकअप, और Flipper Zero.IR फ़ाइलें.';

  @override
  String get aboutTitle => 'परिचय';

  @override
  String get aboutSubtitle => 'ऐप जानकारी और ओपन-सोर्स विवरण';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'संस्करण $version';
  }

  @override
  String get sourceCode => 'स्रोत कोड';

  @override
  String get viewOnGitHub => 'GitHub पर देखें';

  @override
  String get repositoryUrlCopied => 'रिपॉजिटरी URL कॉपी किया गया';

  @override
  String get reportIssue => 'समस्या रिपोर्ट करें';

  @override
  String get reportIssueSubtitle => 'बग रिपोर्ट और फीचर अनुरोध';

  @override
  String get issuesUrlCopied => 'Issues URL कॉपी किया गया';

  @override
  String get license => 'लाइसेंस';

  @override
  String get openSourceLicense => 'ओपन-सोर्स लाइसेंस';

  @override
  String get licenseUrlCopied => 'लाइसेंस URL कॉपी किया गया';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'हमारी वेबसाइट देखें';

  @override
  String get companyUrlCopied => 'Company URL कॉपी किया गया';

  @override
  String get licenses => 'Licenses';

  @override
  String get openSourceLicenses => 'ओपन-सोर्स लाइसेंस';

  @override
  String byCreator(Object creator) {
    return 'द्वारा $creator';
  }

  @override
  String get deviceControlsTitle => 'डिवाइस नियंत्रण';

  @override
  String get deviceControlsSubtitle =>
      'सिस्टम नियंत्रण पेज में पसंदीदा बटन दिखाएं';

  @override
  String get manageFavorites => 'प्रबंधित करें पसंदीदा';

  @override
  String get manageFavoritesSubtitle =>
      'चुनें कि डिवाइस नियंत्रण में कौन से बटन दिखें';

  @override
  String get quickSettingsTitle => 'त्वरित सेटिंग्स';

  @override
  String get quickSettingsSubtitle =>
      'जोड़ें टाइलें के लिए पावर और आवाज़ shortcuts';

  @override
  String get configureTiles => 'कॉन्फ़िगर करें टाइलें';

  @override
  String get configureTilesSubtitle => 'Map टाइलें तक रिमोट बटन';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'स्वामित्व वाले उपकरणों के लिए यूनिवर्सल पावर चक्रण';

  @override
  String get openTvKill => 'TVKill खोलें';

  @override
  String get openTvKillSubtitle =>
      'Cycle पावर कोड (उपयोग करें केवल पर डिवाइस you own)';

  @override
  String get failedToLoadTransmitterSettings =>
      'लोड करें प्रेषक सेटिंग्स. विफल';

  @override
  String get usbStatusReady => 'USB डोंगल है जुड़ा और तैयार तक भेजें IR.';

  @override
  String get usbStatusPermissionRequired =>
      'USB डोंगल मिला. अनुरोध USB अनुमति और स्वीकार करें the सिस्टम प्रॉम्प्ट.';

  @override
  String get usbStatusPermissionDenied =>
      'जुड़े हुए डोंगल के लिए USB अनुमति अस्वीकृत हुई। इसे फिर से मांगें और प्रॉम्प्ट स्वीकार करें।';

  @override
  String get usbStatusPermissionGranted =>
      'USB अनुमति मिल गई है। IR भेजने से पहले डोंगल को अभी शुरू करना बाकी है।';

  @override
  String get usbStatusOpenFailed =>
      'USB अनुमति मिल गई है, लेकिन डोंगल शुरू नहीं हो सका। इसे फिर से जोड़ें और दोबारा कोशिश करें।';

  @override
  String get usbStatusNoDevice => 'नहीं समर्थित USB IR डोंगल मिला.';

  @override
  String get usbSelectPermissionRequired =>
      'USB डोंगल मिला लेकिन नहीं अधिकृत. टैप करें \"अनुरोध USB अनुमति\".';

  @override
  String get usbSelectPermissionDenied =>
      'USB अनुमति अस्वीकृत हुई. टैप करें \"अनुरोध USB अनुमति\" और स्वीकार करें the प्रॉम्प्ट.';

  @override
  String get usbSelectPermissionGranted =>
      'USB अनुमति मिल गई है, लेकिन the डोंगल है नहीं आरंभित yet. कोशिश reconnecting it.';

  @override
  String get usbSelectOpenFailed =>
      'USB अनुमति मिल गई है, लेकिन डोंगल शुरू नहीं हो सका। इसे फिर से जोड़ें और दोबारा कोशिश करें।';

  @override
  String get usbSelectNoDevice =>
      'नहीं समर्थित USB IR डोंगल मिला. Plug it में, फिर टैप \"अनुरोध USB अनुमति\".';

  @override
  String get usbSelectReady => 'USB डोंगल तैयार है।';

  @override
  String get autoSwitchEnabledMessage =>
      'स्वतः-स्विच सक्षम: uses USB जब जुड़ा, अन्यथा आंतरिक.';

  @override
  String get autoSwitchDisabledMessage =>
      'स्वतः-स्विच अक्षम: प्रेषक चयन अब मैनुअल है।';

  @override
  String get failedToUpdateAutoSwitch => 'स्वतः-स्विच सेटिंग अपडेट विफल।';

  @override
  String get failedToSwitchTransmitter => 'switch प्रेषक. विफल';

  @override
  String get deviceHasNoInternalIr =>
      'यह डिवाइस has नहीं अंतर्निर्मित IR emitter.';

  @override
  String get audioModeEnabledMessage =>
      'ऑडियो मोड सक्षम है। अधिकतम मीडिया आवाज़ और एक audio-to-IR LED adapter उपयोग करें।';

  @override
  String get usbPermissionRequestSent => 'USB अनुमति अनुरोध भेजा गया.';

  @override
  String get usbPermissionRequestSentApprove =>
      'USB अनुमति अनुरोध भेजा गया। USB सक्षम करने के लिए प्रॉम्प्ट स्वीकार करें।';

  @override
  String get usbAlreadyReady => 'USB डोंगल है already आरंभित और तैयार.';

  @override
  String get failedToRequestUsbPermission => 'USB अनुमति का अनुरोध विफल रहा।';

  @override
  String get transmitterHelpInternal =>
      'उपयोग करें the फ़ोन’s अंतर्निर्मित IR emitter तक भेजें कमांड.';

  @override
  String get transmitterHelpUsb =>
      'उपयोग करें a USB IR डोंगल (अनुमति आवश्यक) तक भेजें कमांड.';

  @override
  String get transmitterHelpAudio1 =>
      'उपयोग करें ऑडियो आउटपुट (मोनो). आवश्यक है an audio-to-IR LED adapter और high media आवाज़.';

  @override
  String get transmitterHelpAudio2 =>
      'ऑडियो आउटपुट (स्टीरियो) उपयोग करें। संगत एडेप्टर के साथ बेहतर LED ड्राइविंग हेतु दो चैनल उपयोग करता है।';

  @override
  String get transmitterInternal => 'आंतरिक IR';

  @override
  String get transmitterUsb => 'USB IR डोंगल';

  @override
  String get transmitterAudio1 => 'ऑडियो (1 LED)';

  @override
  String get transmitterAudio2 => 'ऑडियो (2 LEDs)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'लोड करें प्रेषक क्षमताएं. विफल';

  @override
  String get selectedTransmitter => 'चयनित प्रेषक';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • सक्रिय: $active';
  }

  @override
  String get refresh => 'रीफ्रेश';

  @override
  String get autoSwitchTitle => 'स्वतः-स्विच';

  @override
  String get autoSwitchDisabledWhileAudio =>
      'अक्षम while उपयोग कर रहा है ऑडियो मोड';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'जुड़ा होने पर USB, अन्यथा Internal उपयोग करता है';

  @override
  String get unavailableOnThisDevice => 'अनुपलब्ध पर यह डिवाइस';

  @override
  String get openOnUsbAttachTitle => 'USB जुड़ने पर खोलें';

  @override
  String get openOnUsbAttachSubtitle =>
      'जब समर्थित USB IR डोंगल जुड़ता है, Android ऐप खोलने का सुझाव दे सकता है।';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'खोलने का सुझाव देगा IR Blaster जब a समर्थित USB डोंगल है जुड़ा हुआ.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'खोलने का सुझाव नहीं देगा पर USB जोड़ना.';

  @override
  String get failedToUpdateSetting => 'सेटिंग अपडेट विफल।';

  @override
  String get unnamedButton => 'बिना नाम का बटन';

  @override
  String get iconFallback => 'आइकन';

  @override
  String get remoteListReorderHint =>
      'पुन:क्रमित करें मोड: लंबा दबाएं और खींचें a कार्ड तक स्थानांतरित करें it.';

  @override
  String get deleteRemoteTitle => 'हटाएं रिमोट?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" होगा हो स्थायी रूप से हटाया गया. यह action सकता है\'t हो undone.';
  }

  @override
  String get delete => 'हटाएं';

  @override
  String get addToDeviceControlsTitle => 'जोड़ें तक डिवाइस नियंत्रण?';

  @override
  String get addToDeviceControlsDescription =>
      'त्वरित access में the सिस्टम डिवाइस नियंत्रण.';

  @override
  String get skip => 'छोड़ें';

  @override
  String get add => 'जोड़ें';

  @override
  String get addedToDeviceControls => 'जोड़ा गया तक डिवाइस नियंत्रण.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'हटाया गया \"$name\". यह action सकता है\'t हो undone.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count बटन · $layout';
  }

  @override
  String get layoutComfort => 'Comfort';

  @override
  String get layoutCompact => 'कॉम्पैक्ट';

  @override
  String get open => 'खोलें';

  @override
  String get useThisRemote => 'उपयोग करें यह रिमोट';

  @override
  String get edit => 'संपादित करें';

  @override
  String get editRemoteSubtitle => 'Rename, और संपादित करें बटन';

  @override
  String get thisCannotBeUndone => 'इसे पूर्ववत नहीं किया जा सकता';

  @override
  String get searchRemotes => 'खोजें रिमोट';

  @override
  String get reorderRemotes => 'पुन:क्रमित करें रिमोट';

  @override
  String get addRemote => 'जोड़ें रिमोट';

  @override
  String get more => 'More';

  @override
  String get reorderMode => 'पुन:क्रमित करें मोड';

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
  String get noRemotesYet => 'नहीं रिमोट yet';

  @override
  String get noRemotesDescription => 'बनाएं a रिमोट तक प्रारंभ sending IR कोड.';

  @override
  String get noRemotesNextStep =>
      'What अगला: टैप जोड़ें रिमोट, फिर जोड़ें आपकी पहले बटन.';

  @override
  String get actions => 'क्रियाएं';

  @override
  String get macrosTitle => 'मैक्रो';

  @override
  String get help => 'मदद';

  @override
  String get createMacro => 'बनाएं मैक्रो';

  @override
  String get timedMacrosTitle => 'समयबद्ध मैक्रो';

  @override
  String get timedMacrosSubtitle =>
      'स्वचालित करें क्रम का IR कमांड के साथ सटीक समय-नियंत्रण';

  @override
  String get timedMacrosNextStep =>
      'What अगला: टैप बनाएं आपकी पहले मैक्रो, pick a रिमोट, फिर जोड़ें कमांड और विलंब.';

  @override
  String get macroFeatureToysTitle => 'के लिए उपयुक्त Interactive खिलौने';

  @override
  String get macroFeatureToysDescription =>
      'i-cybie robot dogs, i-sobot robots और अन्य खिलौना उपकरण नियंत्रित करें जिन्हें कमांडों के बीच क्रिया संसाधित करने के लिए समय चाहिए।';

  @override
  String get macroFeatureTimingTitle => 'सटीक समय-नियंत्रण नियंत्रित करें';

  @override
  String get macroFeatureTimingDescription =>
      'कमांडों के बीच विलंब जोड़ें (250ms से कस्टम durations तक) ताकि अगली क्रिया से पहले आपका उपकरण प्रतिक्रिया दे सके।';

  @override
  String get macroFeatureManualTitle => 'मैनुअल जारी रखें चरण';

  @override
  String get macroFeatureManualDescription =>
      'जब animation की लंबाई बदलती हो या आपको दृश्य प्रतिक्रिया चाहिए, निष्पादन रोकें और आपकी पुष्टि की प्रतीक्षा करें।';

  @override
  String get exampleUseCase => 'उदाहरण उपयोग करें Case';

  @override
  String get macroExampleText =>
      'i-cybie उन्नत मोड:\n1. \"मोड\" कमांड भेजें\n2. 1000ms प्रतीक्षा करें (खिलौना प्रक्रिया करता है)\n3. \"Action 1\" भेजें\n4. 1000ms प्रतीक्षा करें\n5. \"Action 2\" भेजें\n…और इसी तरह स्वतः!';

  @override
  String get createFirstMacro => 'बनाएं आपकी पहले मैक्रो';

  @override
  String get noRemote => 'नहीं रिमोट';

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
  String get aboutTimedMacros => 'परिचय समयबद्ध मैक्रो';

  @override
  String get aboutTimedMacrosDescription =>
      'समयबद्ध मैक्रो आपको हर चरण के बीच सटीक विलंब के साथ IR कमांड क्रम स्वचालित करने देते हैं।';

  @override
  String get sendCommand => 'भेजें कमांड';

  @override
  String get sendCommandDescription => 'भेजता है an IR कमांड से आपकी रिमोट.';

  @override
  String get delay => 'विलंब';

  @override
  String get delayDescription =>
      'Waits के लिए a निर्दिष्ट अवधि (e.g., 1000ms) पहले the अगला चरण.';

  @override
  String get manualContinue => 'मैनुअल जारी रखें';

  @override
  String get manualContinueDescription =>
      'Pauses execution जब तक you टैप जारी रखें (उपयोगी के लिए परिवर्तनीय-लंबाई एनिमेशन).';

  @override
  String get gotIt => 'Got it';

  @override
  String get failedToSaveMacros => 'सहेजें मैक्रो. विफल';

  @override
  String deletedMacroNamed(Object name) {
    return '\"$name\" हटाया गया।';
  }

  @override
  String get undo => 'पूर्ववत करें';

  @override
  String get failedToRestoreMacro => 'पुनर्स्थापित करें मैक्रो. विफल';

  @override
  String get deleteMacroTitle => 'हटाएं मैक्रो?';

  @override
  String get deleteMacroMessage =>
      'You सकता है पूर्ववत करें यह से the अगला snackbar.';

  @override
  String get noRemotesAvailable => 'नहीं रिमोट उपलब्ध.';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count बटन';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'ओरिएंटेशन: उल्टा (सामान्य हेतु टैप करें)';

  @override
  String get remoteOrientationNormalTooltip =>
      'ओरिएंटेशन: सामान्य (उलटने हेतु टैप करें)';

  @override
  String get stopLoop => 'रोकें लूप';

  @override
  String get reorderButtons => 'पुन:क्रमित करें बटन';

  @override
  String get remoteReorderHint =>
      'पुन:क्रमित करें मोड: लंबा दबाएं और खींचें a बटन तक स्थानांतरित करें it.';

  @override
  String get manageRemote => 'प्रबंधित करें रिमोट';

  @override
  String get remoteNoButtons => 'नहीं बटन में यह रिमोट';

  @override
  String get remoteNoButtonsDescription =>
      'उपयोग करें \"संपादित करें रिमोट\" तक जोड़ें या कॉन्फ़िगर करें बटन.';

  @override
  String get editRemote => 'रिमोट संपादित करें';

  @override
  String get editRemoteActionsSubtitle =>
      'Rename, पुन:क्रमित करें, और संपादित करें बटन';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return '\"$name\" अपडेट किया गया।';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'जोड़ा गया \"$name\".';
  }

  @override
  String get buttonDuplicated => 'बटन डुप्लिकेट किया गया।';

  @override
  String get loopRunningForButton => 'लूप है running के लिए यह बटन.';

  @override
  String get loopTip => 'सुझाव: उपयोग करें लूप तक repeat जब तक you रोकें it.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'कोड कॉपी किया गया.';

  @override
  String get copyCode => 'कोड कॉपी करें';

  @override
  String get startLoop => 'प्रारंभ लूप';

  @override
  String get editButtonSubtitle => 'बदलें लेबल, कोड, प्रोटोकॉल, फ़्रीक्वेंसी';

  @override
  String get newButton => 'नया बटन';

  @override
  String get newButtonSubtitle => 'बनाएं a नया बटन बाद यह एक';

  @override
  String get duplicate => 'डुप्लिकेट';

  @override
  String get duplicateButtonSubtitle => 'इस बटन की कॉपी बनाएं';

  @override
  String get removeFromDeviceControls => 'से डिवाइस नियंत्रण हटाएं';

  @override
  String get addToDeviceControls => 'जोड़ें तक डिवाइस नियंत्रण';

  @override
  String get deviceControlsButtonSubtitle =>
      'दिखाता है यह बटन में the सिस्टम डिवाइस नियंत्रण';

  @override
  String get removedFromDeviceControls => 'हटाया गया से डिवाइस नियंत्रण.';

  @override
  String get pinQuickTile => 'Pin तक त्वरित Tile पसंदीदा';

  @override
  String get unpinQuickTile => 'Unpin से त्वरित Tile पसंदीदा';

  @override
  String get quickTileButtonSubtitle =>
      'दिखाता है यह बटन at the शीर्ष का the त्वरित tile चयनकर्ता';

  @override
  String get removedFromQuickTileFavorites =>
      'हटाया गया से त्वरित Tile पसंदीदा.';

  @override
  String get pinnedToQuickTileFavorites => 'Pinned तक त्वरित Tile पसंदीदा.';

  @override
  String get duplicateAndEdit => 'डुप्लिकेट और संपादित करें';

  @override
  String get duplicateAndEditSubtitle => 'कॉपी बनाएं और तुरंत संपादित करें';

  @override
  String get done => 'पूर्ण';

  @override
  String get run => 'चलाएं';

  @override
  String get untitledRemote => 'बिना शीर्षक का रिमोट';

  @override
  String get createRemoteTitle => 'बनाएं रिमोट';

  @override
  String get editRemoteTitle => 'रिमोट संपादित करें';

  @override
  String get removeButtonTitle => 'बटन? हटाएं';

  @override
  String get imageButtonRemovedMessage => 'यह छवि बटन होगा हो हटाया गया.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" होगा हो हटाया गया.';
  }

  @override
  String get remove => 'हटाएं';

  @override
  String importedButtonCount(int count) {
    return '$count बटन आयात किए गए।';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Imported $count बटन(s) से मौजूदा रिमोट.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'बदलें लेबल, सिग्नल, और advanced सेटिंग्स';

  @override
  String get createButtonCopySubtitle => 'इस बटन की कॉपी बनाएं';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'कॉपी बनाएं और तुरंत संपादित करें';

  @override
  String get undoAvailableInNextSnackbar =>
      'You सकता है पूर्ववत करें से the अगला snackbar';

  @override
  String get buttonRemoved => 'बटन हटाया गया.';

  @override
  String get remoteNameCannotBeEmpty => 'रिमोट नाम सकता है\'t हो empty.';

  @override
  String get saveRemote => 'सहेजें रिमोट';

  @override
  String get remoteName => 'रिमोट नाम';

  @override
  String get remoteNameHint => 'उदा. TV, Air Conditioner, LED Strip';

  @override
  String get remoteNameHelper => 'यह नाम appears में आपकी रिमोट सूची.';

  @override
  String get layoutStyle => 'लेआउट शैली';

  @override
  String get layoutWideDescription =>
      'चौड़ी: 2-स्तंभ बटन के साथ अतिरिक्त विवरण (अनुशंसित).';

  @override
  String get layoutCompactDescription =>
      'कॉम्पैक्ट: क्लासिक 4× ग्रिड (icons/पाठ केवल).';

  @override
  String get importFromRemotes => 'आयात करें से रिमोट';

  @override
  String get importFromDatabase => 'आयात करें से DB';

  @override
  String get addButton => 'जोड़ें बटन';

  @override
  String get noButtonsYet => 'नहीं बटन yet';

  @override
  String get createRemoteEmptyStateDescription =>
      'जोड़ें आपकी पहले बटन, फिर लंबा दबाएं it के लिए संपादित करें/हटाएं options.';

  @override
  String get createButtonTitle => 'बनाएं बटन';

  @override
  String get editButtonTitle => 'संपादित करें बटन';

  @override
  String failedToLoadProtocols(Object error) {
    return 'प्रोटोकॉल लोड विफल: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'लोड करें डेटाबेस keys: $error विफल';
  }

  @override
  String get presetPower => 'पावर';

  @override
  String get presetVolume => 'आवाज़';

  @override
  String get presetChannel => 'Channel';

  @override
  String get presetNavigation => 'नेविगेशन';

  @override
  String get all => 'सभी';

  @override
  String get completeRequiredFieldsToSave => 'पूर्ण आवश्यक fields तक सहेजें';

  @override
  String get buttonLabelStepTitle => '1) बटन लेबल';

  @override
  String get buttonLabelStepSubtitle =>
      'चुनें an छवि, आइकन, या type a पाठ लेबल.';

  @override
  String get buttonColorStepTitle => '2) बटन color (वैकल्पिक)';

  @override
  String get buttonColorStepSubtitle => 'इस बटन के लिए पृष्ठभूमि रंग चुनें।';

  @override
  String get selectColor => 'रंग चुनें:';

  @override
  String get noImageSelected => 'नहीं छवि चयनित';

  @override
  String get gallery => 'Gallery';

  @override
  String get builtIn => 'अंतर्निर्मित';

  @override
  String get removeImage => 'छवि हटाएं';

  @override
  String get requiredSelectImageOrSwitch =>
      'आवश्यक: चुनें an छवि, चुनें an आइकन, या switch तक पाठ.';

  @override
  String get iconSelected => 'आइकन चयनित';

  @override
  String get noIconSelected => 'नहीं आइकन चयनित';

  @override
  String get chooseIcon => 'चुनें आइकन';

  @override
  String get removeIcon => 'आइकन हटाएं';

  @override
  String get requiredSelectIconOrSwitch =>
      'आवश्यक: चुनें an आइकन या switch तक छवि/पाठ.';

  @override
  String get buttonText => 'बटन पाठ';

  @override
  String get buttonTextHint => 'e.g., पावर, आवाज़ +, HDMI 1';

  @override
  String get buttonTextHelper => 'यह पाठ होगा दिखें पर the बटन.';

  @override
  String get requiredEnterButtonLabel => 'आवश्यक: दर्ज करें a बटन लेबल.';

  @override
  String get defaultColorName => 'डिफ़ॉल्ट';

  @override
  String get newRemoteCreatedFromLastHit =>
      'नया रिमोट बनाया गया के साथ एक बटन से अंतिम hit.';

  @override
  String get selectRemote => 'चुनें रिमोट';

  @override
  String remoteNumber(Object id) {
    return 'रिमोट #$id';
  }

  @override
  String get newRemoteCreated => 'नया रिमोट बनाया गया।';

  @override
  String get failedToCreateRemote => 'बनाएं रिमोट. विफल';

  @override
  String get newRemoteEllipsis => 'नया रिमोट…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'जोड़ा गया तक $name.';
  }

  @override
  String get failedToAddToRemote => 'जोड़ें तक रिमोट. विफल';

  @override
  String get newRemoteDefaultName => 'नया रिमोट';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Jumped तक ऑफसेट $offset. Paused — दबाएं फिर शुरू करें तक जारी रखें.';
  }

  @override
  String get sent => 'भेजा गया.';

  @override
  String failedToSend(Object error) {
    return 'भेजें: $error विफल';
  }

  @override
  String get copiedProtocolCode => 'कॉपी किया गया (प्रोटोकॉल:कोड).';

  @override
  String get savedToResults => 'सहेजा गया तक परिणाम.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'अमान्य कोड के लिए प्रोटोकॉल: $error';
  }

  @override
  String get copiedCurrentCandidate => 'कॉपी किया गया वर्तमान candidate.';

  @override
  String get jumpToOffset => 'पर जाएं ऑफसेट';

  @override
  String get jumpToBruteCursor => 'brute cursor पर जाएं';

  @override
  String get jump => 'जाएं';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'cursor 0x$cursor पर गए। रोका गया — जारी रखने के लिए फिर शुरू करें दबाएं।';
  }

  @override
  String get irSignalTester => 'IR सिग्नल टेस्टर';

  @override
  String get stop => 'रोकें';

  @override
  String get selectButton => 'चुनें बटन';

  @override
  String get buttonNotFoundInRemotes => 'बटन नहीं मिला में रिमोट.';

  @override
  String sentNamed(Object name) {
    return 'भेजा गया \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'भेजें विफल: $error';
  }

  @override
  String get noFavoritesYet => 'नहीं पसंदीदा yet';

  @override
  String get deviceControlsEmptyHint =>
      'लंबा दबाएं a रिमोट बटन और चुनें “जोड़ें तक डिवाइस नियंत्रण”.';

  @override
  String get sendTest => 'भेजें जांचें';

  @override
  String get testSendCompleted => 'जांचें भेजें पूर्ण.';

  @override
  String testSendFailed(Object error) {
    return 'जांचें भेजें विफल: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'हटाया गया \"$name\".';
  }

  @override
  String get brand => 'ब्रांड';

  @override
  String get model => 'मॉडल';

  @override
  String get selectBrand => 'ब्रांड चुनें';

  @override
  String get searchBrand => 'खोजें ब्रांड…';

  @override
  String get selectModel => 'मॉडल चुनें';

  @override
  String get searchModel => 'खोजें मॉडल…';

  @override
  String get unnamedKey => 'बिना नाम की कुंजी';

  @override
  String get unknown => 'अज्ञात';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'खोजें कमांड';

  @override
  String get noMatchingCommands => 'नहीं मेल खाती कमांड';

  @override
  String get quickTileFavoritesTitle => 'त्वरित tile पसंदीदा';

  @override
  String changeMappingForTile(Object tileLabel) {
    return '$tileLabel टाइल के लिए मैपिंग बदलें';
  }

  @override
  String get pickDifferentButton => 'कोई दूसरा बटन चुनें';

  @override
  String get browseAllRemotesEllipsis => 'ब्राउज़ करें सभी रिमोट…';

  @override
  String get invalidMacroFileFormat => 'अमान्य मैक्रो फ़ाइल format.';

  @override
  String get failedToParseMacroFile => 'parse मैक्रो फ़ाइल. विफल';

  @override
  String get deviceCodeLabel => 'डिवाइस कोड';

  @override
  String get commandLabel => 'कमांड';

  @override
  String get editButtonCodeTitle => 'संपादित करें कोड का the बटन';

  @override
  String get thisRemoteHasNoButtons => 'यह रिमोट has नहीं बटन.';

  @override
  String get selectCommand => 'चुनें कमांड';

  @override
  String get databaseModeAutofillHint =>
      'डेटाबेस मोड auto-fills चरण 2 के लिए you (ब्रांड + मॉडल + प्रोटोकॉल). बाद आयात करते समय a key, you सकता है परिष्कृत करें anything में मैनुअल.';

  @override
  String get test => 'जांचें';

  @override
  String get allSelectedButtonsWereDuplicates => 'सभी चयनित बटन थे डुप्लिकेट.';

  @override
  String get noButtonsImported => 'कोई बटन आयात नहीं हुआ।';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return '$addedCount बटन आयात किए गए। $skippedCount डुप्लिकेट छोड़े गए।';
  }

  @override
  String get importAllMatchingTitle => 'आयात करें सभी मेल खाती बटन?';

  @override
  String get noMatchingKeysFound => 'नहीं मेल खाती keys मिला.';

  @override
  String importAllMatchingMessage(int count) {
    return 'यह होगा आयात ऊपर तक $count मेल खाती keys से the वर्तमान डेटाबेस selection.';
  }

  @override
  String get importAll => 'आयात करें सभी';

  @override
  String get importingButtons => 'बटन आयात हो रहे हैं…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'सभी मेल खाती बटन थे डुप्लिकेट.';

  @override
  String get quickPresets => 'त्वरित प्रीसेट';

  @override
  String get selectDeviceFirst => 'चुनें डिवाइस पहले';

  @override
  String get searchByLabelOrHex => 'खोजें द्वारा लेबल या हेक्स';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'वैकल्पिक: $preset प्रीसेट कुंजियों को परिष्कृत करें';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'चुनें ब्रांड, मॉडल, और प्रोटोकॉल पहले.';

  @override
  String get importFromDatabaseTitle => 'आयात करें से डेटाबेस';

  @override
  String get importFromDatabaseSubtitle =>
      'चुनें a डिवाइस, लोड करें मेल खाती keys, फिर आयात चयनित बटन.';

  @override
  String get deviceAndFilters => 'डिवाइस & फ़िल्टर';

  @override
  String loadedCount(int count) {
    return '$count लोड किया गया';
  }

  @override
  String get hideFilters => 'छिपाएं फ़िल्टर';

  @override
  String get showFilters => 'दिखाएं फ़िल्टर';

  @override
  String get noProtocolFoundForBrandModel =>
      'नहीं प्रोटोकॉल मिला के लिए यह ब्रांड और मॉडल.';

  @override
  String get protocolAutoDetected => 'प्रोटोकॉल';

  @override
  String get protocolAutoDetectedHelper =>
      'डेटाबेस से स्वतः पहचाना गया। आयात करने से पहले आप इसे बदल सकते हैं।';

  @override
  String get selectBrandModelToLoadKeys =>
      'चुनें a ब्रांड, मॉडल, और प्रोटोकॉल तक लोड करें keys.';

  @override
  String get noKeysFound => 'नहीं keys मिला.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'नहीं keys मिला के लिए “$query”.';
  }

  @override
  String get skipDuplicates => 'छोड़ें डुप्लिकेट';

  @override
  String get skipDuplicatesSubtitle =>
      'Do नहीं आयात बटन वह already exist में यह रिमोट.';

  @override
  String get importSelected => 'आयात करें चयनित';

  @override
  String get noMacrosToExport => 'नहीं मैक्रो तक निर्यात.';

  @override
  String get macrosExportedToDownloads =>
      'मैक्रो Downloads में निर्यात किए गए।';

  @override
  String get failedToExportMacros => 'निर्यात मैक्रो. विफल';

  @override
  String get failedToReadFile => 'read फ़ाइल. विफल';

  @override
  String get importFromExistingRemotesTitle => 'आयात करें से मौजूदा रिमोट';

  @override
  String selectedCount(int count) {
    return '$count चयनित';
  }

  @override
  String get noOtherRemotesWithButtons => 'नहीं अन्य रिमोट के साथ बटन मिला.';

  @override
  String get sourceRemote => 'स्रोत रिमोट';

  @override
  String get searchButtons => 'खोजें बटन';

  @override
  String get searchButtonsHint => 'पावर, आवाज़, म्यूट...';

  @override
  String get selectVisible => 'दृश्यमान चुनें';

  @override
  String get clearVisible => 'दृश्यमान साफ करें';

  @override
  String protocolNamed(Object name) {
    return 'प्रोटोकॉल: $name';
  }

  @override
  String get rawSignal => 'रॉ';

  @override
  String get legacyCode => 'पुराना कोड';

  @override
  String importCount(int count) {
    return 'आयात करें $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Storage अनुमति अस्वीकृत (कुछ पुराने Android डिवाइस पर आवश्यक)।';

  @override
  String get backupExportedToDownloads =>
      'बैकअप Downloads में निर्यात किया गया।';

  @override
  String failedToExport(Object error) {
    return 'निर्यात: $error विफल';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Imported $count रिमोट से legacy JSON बैकअप. मैक्रो थे नहीं बदला गया.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'आयात करें विफल: बैकअप \"रिमोट\" must हो a JSON सूची जब present.';

  @override
  String get importFailedMacrosMustBeList =>
      'आयात करें विफल: बैकअप \"मैक्रो\" must हो a JSON सूची जब present.';

  @override
  String get importFailedInvalidBackupFormat =>
      'आयात करें विफल: अमान्य बैकअप format (expected legacy सूची या Map के साथ रिमोट/मैक्रो).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Imported $remoteCount रिमोट से बैकअप. मैक्रो थे नहीं बदला गया.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return '$remoteCount रिमोट और $macroCount मैक्रो बैकअप से आयात किए गए।';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'आयात करें विफल: नहीं valid बटन मिला में.IR फ़ाइल.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Imported 1 रिमोट से Flipper.IR. मैक्रो थे नहीं बदला गया.';

  @override
  String get importFailedInvalidIrplus =>
      'आयात करें विफल: अमान्य irplus फ़ाइल (नहीं valid बटन मिला).';

  @override
  String get importedOneRemoteFromIrplus =>
      'Imported 1 रिमोट से irplus. मैक्रो थे नहीं बदला गया.';

  @override
  String get importFailedInvalidLirc =>
      'आयात करें विफल: अमान्य LIRC फ़ाइल (नहीं valid कोड/रॉ कोड मिला).';

  @override
  String get importedOneRemoteFromLirc =>
      'Imported 1 रिमोट से LIRC config. मैक्रो थे नहीं बदला गया.';

  @override
  String get unsupportedFileTypeSelected => 'असमर्थित फ़ाइल प्रकार चुना गया।';

  @override
  String get importFailedInvalidUnreadableFile =>
      'आयात करें विफल: अमान्य या unreadable फ़ाइल.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Bulk आयात पूर्ण: नहीं समर्थित फ़ाइलें मिला में फ़ोल्डर.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Bulk आयात पूर्ण: नहीं रिमोट आयात किए गए. छोड़ा गया $skippedCount फ़ाइल(s).';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Bulk आयात पूर्ण: $supportedCount समर्थित फ़ाइलों से $importedCount रिमोट आयात किए गए। $skippedCount फ़ाइलें छोड़ी गईं।';
  }

  @override
  String get storagePermissionDenied => 'Storage अनुमति अस्वीकृत.';

  @override
  String get bulkImportFailedReadFolder =>
      'Bulk आयात विफल: फ़ोल्डर सामग्री पढ़ी नहीं जा सकी।';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Bulk आयात पूर्ण: नहीं समर्थित फ़ाइलें मिला ($sourceLabel).';
  }

  @override
  String get clearAction => 'स्पष्ट';

  @override
  String get saveAction => 'सहेजें';

  @override
  String buttonsTitleCount(int count) {
    return 'बटन ($count)';
  }

  @override
  String get invalidStepEncountered => 'अमान्य चरण मिला';

  @override
  String failedToSendNamed(Object name) {
    return 'भेजें: $name विफल';
  }

  @override
  String get buttonNotFound => 'बटन नहीं मिला';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'बटन नहीं मिला: $name';
  }

  @override
  String get unknownButton => 'अज्ञात बटन';

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
      'ओरिएंटेशन: उल्टा (सामान्य हेतु टैप करें)';

  @override
  String get orientationNormalTooltip =>
      'ओरिएंटेशन: सामान्य (उलटने हेतु टैप करें)';

  @override
  String get noSteps => 'कोई चरण नहीं';

  @override
  String stepProgress(int current, int total) {
    return 'चरण $current / $total';
  }

  @override
  String get completed => 'पूर्ण';

  @override
  String get paused => 'Paused';

  @override
  String get running => 'Running';

  @override
  String get ready => 'तैयार';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total चरण';
  }

  @override
  String get waiting => 'Waiting';

  @override
  String secondsRemaining(Object seconds) {
    return '${seconds}s शेष';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'टैप करें जारी रखें जब तैयार के लिए the अगला चरण';

  @override
  String get error => 'त्रुटि';

  @override
  String get macroCompleted => 'मैक्रो पूर्ण';

  @override
  String finishedIn(Object duration) {
    return 'में समाप्त $duration';
  }

  @override
  String get sequence => 'Sequence';

  @override
  String waitMilliseconds(int ms) {
    return 'प्रतीक्षा करें ${ms}ms';
  }

  @override
  String get runAgain => 'चलाएं फिर';

  @override
  String get startMacro => 'प्रारंभ मैक्रो';

  @override
  String get continueAction => 'जारी रखें';

  @override
  String get unnamedRemote => 'बिना नाम का रिमोट';

  @override
  String get enterMacroName => 'दर्ज करें a मैक्रो नाम';

  @override
  String get addAtLeastOneStep => 'जोड़ें at least एक चरण';

  @override
  String get fixInvalidSteps => 'Fix अमान्य चरण';

  @override
  String get unknownCommand => 'अज्ञात कमांड';

  @override
  String get unnamedCommand => 'बिना नाम की कमांड';

  @override
  String get iconCommand => 'आइकन कमांड';

  @override
  String get selectDelay => 'चुनें विलंब';

  @override
  String keepMilliseconds(int ms) {
    return 'रखें: ${ms}ms';
  }

  @override
  String get custom => 'कस्टम';

  @override
  String get enterCustomDelayDuration => 'दर्ज करें a कस्टम विलंब अवधि';

  @override
  String millisecondsLong(int ms) {
    return '$ms मिलीसेकंड';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds सेकंड$plural';
  }

  @override
  String get customDelay => 'कस्टम विलंब';

  @override
  String get delayMillisecondsLabel => 'विलंब (मिलीसेकंड)';

  @override
  String get delayMillisecondsHint => 'e.g., 3000';

  @override
  String get recommendedDelayRange => 'अनुशंसित: 250-5000ms के लिए most डिवाइस';

  @override
  String get enterValidPositiveNumber =>
      'Please दर्ज करें a valid धनात्मक संख्या';

  @override
  String get ok => 'ठीक है';

  @override
  String get remote => 'रिमोट';

  @override
  String get macroName => 'मैक्रो नाम';

  @override
  String get macroNameHint => 'e.g., i-cybie Advanced मोड';

  @override
  String stepsTitleCount(int count) {
    return 'चरण ($count)';
  }

  @override
  String get noStepsYet => 'अभी कोई चरण नहीं';

  @override
  String get addCommandsAndDelaysHint =>
      'जोड़ें कमांड और विलंब नीचे तक build आपकी sequence';

  @override
  String get addStep => 'जोड़ें चरण';

  @override
  String get reorderStepsHint =>
      'सुझाव: खींचें the handle तक पुन:क्रमित करें चरण. टैप करें a चरण तक संपादित करें it.';

  @override
  String reorderStep(int index) {
    return 'पुन:क्रमित करें चरण $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'दबाएं और खींचें तक बदलें चरण क्रम';

  @override
  String deleteStep(int index) {
    return 'हटाएं चरण $index';
  }

  @override
  String get invalidStepTapToFix => 'अमान्य चरण — टैप करें fix';

  @override
  String get sendIrCommand => 'IR कमांड भेजें';

  @override
  String get waitForUserConfirmation => 'उपयोगकर्ता पुष्टि की प्रतीक्षा करें';

  @override
  String get notImplemented => 'अभी लागू नहीं';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'चौड़ी';

  @override
  String get iconButton => 'आइकन बटन';

  @override
  String get imageButton => 'छवि बटन';

  @override
  String get noSignalInfo => 'नहीं सिग्नल info';

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
      'Discard your macro changes and leave this screen?';

  @override
  String get stopMacroBeforeLeaving =>
      'Stop the macro before leaving this screen.';

  @override
  String get stopTestingBeforeLeaving =>
      'Stop testing before leaving this screen.';

  @override
  String get idle => 'Idle';

  @override
  String get start => 'प्रारंभ';

  @override
  String get resume => 'फिर शुरू करें';

  @override
  String get pause => 'रोकें';

  @override
  String get stopped => 'Stopped';

  @override
  String get copy => 'कॉपी करें';

  @override
  String get send => 'भेजें';

  @override
  String get step => 'चरण';

  @override
  String get addToRemote => 'जोड़ें तक रिमोट';

  @override
  String get noDescriptionAvailable => 'कोई विवरण उपलब्ध नहीं।';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Kaseikyo vendor ठीक-ठीक 4 हेक्स digits का होना चाहिए।';

  @override
  String get irFinderDatabaseNotReady => 'डेटाबेस है नहीं तैयार yet.';

  @override
  String get irFinderSelectBrandFirst => 'चुनें a ब्रांड पहले में Setup.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute-force है उपलब्ध नहीं है के लिए यह प्रोटोकॉल yet.';

  @override
  String get irFinderInvalidPrefix => 'अमान्य प्रीफ़िक्स।';

  @override
  String irFinderBrandValue(Object value) {
    return 'ब्रांड: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'मॉडल: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Key: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'रिमोट #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'फ़िल्टर किए गए, क्रमित डेटाबेस परिणामों के भीतर 0-आधारित index दर्ज करें।';

  @override
  String get irFinderJumpCursorHelper =>
      'brute-force क्षेत्र के भीतर 0-आधारित हेक्स cursor दर्ज करें।';

  @override
  String get irFinderSetupTab => 'Setup';

  @override
  String get irFinderTestTab => 'जांचें';

  @override
  String get irFinderResultsTab => 'परिणाम';

  @override
  String get irFinderContinueToTest => 'जारी रखें तक जांचें';

  @override
  String get irFinderKaseikyoVendorTitle => 'Kaseikyo Vendor';

  @override
  String get irFinderCustomVendorLabel => 'कस्टम vendor (4 हेक्स)';

  @override
  String get irFinderBrowseDbCandidates => 'DB candidates ब्राउज़ करें…';

  @override
  String get irFinderEditSetup => 'संपादित करें Setup';

  @override
  String get irFinderNoSavedHits =>
      'नहीं सहेजा गया hits yet. में the जांचें page, दबाएं \"सहेजें hit\" जब the डिवाइस प्रतिक्रिया देता है.';

  @override
  String get irFinderBackToTest => 'वापस तक जांचें';

  @override
  String get irFinderLargeSearchSpaceTitle => 'बड़ा खोज क्षेत्र';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'यह brute-force क्षेत्र बहुत बड़ा है ($human संभावनाएं)। IR Finder फिर भी आपकी max attempts और cooldown का मान रखेगा, लेकिन IR डिवाइस पर बार-बार भेजने से सावधान रहें。\n\nसिफारिश: पहले डेटाबेस मोड उपयोग करें, और/या ज्ञात prefix bytes दर्ज करें ताकि क्षेत्र कम हो।';
  }

  @override
  String get irFinderDatabaseSession => 'डेटाबेस सत्र';

  @override
  String get irFinderBruteforceSession => 'Brute-force सत्र';

  @override
  String get irFinderResumeLastSession => 'फिर शुरू करें अंतिम सत्र';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'ब्रांड: $brand · मॉडल: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Prefix: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'प्रगति: $progress · शुरू: $when';
  }

  @override
  String get irFinderApplyResume => 'लागू करें & फिर शुरू करें';

  @override
  String get irFinderBruteforceMode => 'Brute-force';

  @override
  String get irFinderDatabaseAssistedMode => 'Database-assisted';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'प्रोटोकॉल: $name';
  }

  @override
  String get irFinderProtocolLabel => 'IR प्रोटोकॉल';

  @override
  String get irFinderProtocolHelper =>
      'यह encoding को नियंत्रित करता है और इसलिए खोज क्षेत्र को भी।';

  @override
  String get irFinderKnownPrefixLabel =>
      'Kअबn प्रीफ़िक्स (हेक्स bytes, वैकल्पिक)';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Payload: $digits हेक्स digit(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Payload: $digits हेक्स digit(s) · उदाहरण: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Payload: $digits हेक्स digit(s) · Max प्रीफ़िक्स: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Payload: $digits हेक्स digit(s) · उदाहरण: $example · Max प्रीफ़िक्स: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'उदाहरण: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'खोज क्षेत्र कम करने के लिए कोई भी ज्ञात शुरुआती bytes दर्ज करें।';

  @override
  String get irFinderDatabaseMode => 'डेटाबेस';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Normalized प्रीफ़िक्स: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Normalized प्रीफ़िक्स';

  @override
  String get irFinderBruteforceNotConfigured =>
      'यह प्रोटोकॉल के लिए brute-force अभी कॉन्फ़िगर नहीं है।';

  @override
  String irFinderAllLimit(Object value) {
    return 'सभी ($value)';
  }

  @override
  String get irFinderTestControls => 'जांचें नियंत्रण';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Payload लंबाई: $digits हेक्स digit(s).';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'खोज क्षेत्र: $value संभावनाएं (prefix सीमाओं के बाद)।';
  }

  @override
  String get irFinderCooldownMs => 'Cooldown (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Max प्रयास (per चलाएं)';

  @override
  String get irFinderTestAllCombinations => 'जांचें सभी combinations';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'जब तक खोज क्षेत्र समाप्त न हो जाए तब तक चलता है। प्रभावी सीमा: $value';
  }

  @override
  String get irFinderAttempts => 'Attempts';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Slider सीमा: 1–$max (बड़े मानों के लिए कोई भी संख्या दर्ज करें)';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Max\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'इस रन की प्रभावी सीमा: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'सुझाव: उपयोग करें डेटाबेस मोड पहले; brute-force है best के साथ a ज्ञात प्रीफ़िक्स (के लिए उदाहरण, the पहले 1–4 bytes).';

  @override
  String get irFinderDatabaseInitFailed => 'डेटाबेस आरंभ विफल.';

  @override
  String get irFinderPreparingDatabase => 'Preparing स्थानीय IR कोड डेटाबेस…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Database-assisted खोजें';

  @override
  String get irFinderBrand => 'ब्रांड';

  @override
  String get irFinderSelectBrand => 'ब्रांड चुनें';

  @override
  String get irFinderModelOptional => 'मॉडल (वैकल्पिक)';

  @override
  String get irFinderSelectBrandFirstShort => 'चुनें a ब्रांड पहले';

  @override
  String get irFinderSelectModelRecommended => 'चुनें a मॉडल (अनुशंसित)';

  @override
  String get irFinderOnlySelectedProtocol => 'केवल चयनित प्रोटोकॉल';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'फ़िल्टर keys तक the चयनित प्रोटोकॉल. अक्षम करें it तक browse सभी protocols.';

  @override
  String get irFinderQuickWinsFirst => 'त्वरित wins पहले';

  @override
  String get irFinderQuickWinsFirstHint =>
      'गहरी कुंजियों से पहले power, mute, VOL और CH शैली कुंजियों को प्राथमिकता देता है।';

  @override
  String get irFinderMaxKeysPerRun => 'Max keys तक जांचें (per चलाएं)';

  @override
  String get irFinderTesting => 'Testing…';

  @override
  String get irFinderCooldown => 'Cooldown';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'मोड';

  @override
  String get irFinderRetryLast => 'Retry अंतिम';

  @override
  String get irFinderTrigger => 'Trigger';

  @override
  String get irFinderJump => 'जाएं…';

  @override
  String get irFinderSaveHit => 'सहेजें hit';

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
    return 'अंतिम प्रयास किया गया कोड: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'अंतिम प्रयास किया गया कोड देखने के लिए जांच शुरू करें।';

  @override
  String irFinderFromDb(Object value) {
    return 'से DB: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'से brute-force (generated द्वारा प्रोटोकॉल encoder).';

  @override
  String irFinderSendError(Object error) {
    return 'भेजें त्रुटि: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'स्रोत: $value';
  }

  @override
  String get irFinderResultsNote =>
      'परिणाम तुरंत जांच और कॉपी का समर्थन करते हैं। Direct add-to-remote integration को editor flow में आगे बढ़ाया जा सकता है।';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'DB candidates ब्राउज़ करें';

  @override
  String get irFinderFilterByLabelOrHex => 'Filter द्वारा लेबल या हेक्स…';

  @override
  String get irFinderJumpHere => 'जाएं यहां';

  @override
  String get irFinderSelectModel => 'मॉडल चुनें';

  @override
  String get irFinderSearchBrands => 'खोजें brands…';

  @override
  String get irFinderSearchModels => 'खोजें models…';

  @override
  String get iconPickerTitle => 'चुनें आइकन';

  @override
  String get iconPickerSearchHint => 'खोजें icons...';

  @override
  String get iconPickerNoIconsFound => 'नहीं icons मिला';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count icons उपलब्ध';
  }

  @override
  String get iconPickerCategoryAll => 'सभी';

  @override
  String get iconPickerCategoryMedia => 'Media';

  @override
  String get iconPickerCategoryVolume => 'आवाज़';

  @override
  String get iconPickerCategoryNavigation => 'नेविगेशन';

  @override
  String get iconPickerCategoryPower => 'पावर';

  @override
  String get iconPickerCategoryNumbers => 'Numbers';

  @override
  String get iconPickerCategorySettings => 'सेटिंग्स';

  @override
  String get iconPickerCategoryDisplay => 'Display';

  @override
  String get iconPickerCategoryInput => 'इनपुट';

  @override
  String get iconPickerCategoryFavorite => 'पसंदीदा';

  @override
  String get universalPowerTitle => 'यूनिवर्सल पावर';

  @override
  String get universalPowerRunTab => 'चलाएं';

  @override
  String get universalPowerUseResponsibly => 'जिम्मेदारी से उपयोग करें';

  @override
  String get universalPowerConsentBody =>
      'यूनिवर्सल पावर IR पावर कोड को चक्रित करता है। इसे केवल उन्हीं उपकरणों पर उपयोग करें जिनके आप मालिक हैं या जिन्हें नियंत्रित करते हैं। जैसे ही उपकरण प्रतिक्रिया दे, रोक दें।';

  @override
  String get universalPowerConsentCheckbox =>
      'मैं इस डिवाइस का मालिक हूँ या इसे नियंत्रित करता हूँ';

  @override
  String get universalPowerSetupBody =>
      'Cycles पावर कोड के लिए आपकी चयनित ब्रांड. रोकें जैसे ही the डिवाइस प्रतिक्रिया देता है.';

  @override
  String universalPowerLastSent(Object value) {
    return 'अंतिम भेजा गया: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'नहीं पावर कोड मिला. कोशिश broadening the खोजें.';

  @override
  String get universalPowerUnableToStart => 'Unable तक प्रारंभ.';

  @override
  String get universalPowerAllBrands => 'सभी ब्रांड (कोई फ़िल्टर नहीं)';

  @override
  String get universalPowerClearBrandFilter => 'स्पष्ट ब्रांड filter';

  @override
  String get universalPowerBroadenSearch => 'ज़रूरत हो तो खोज बढ़ाएं';

  @override
  String get universalPowerBroadenSearchHint =>
      'यदि कोई power label नहीं मिले, तो अन्य keys शामिल करें।';

  @override
  String get universalPowerAdditionalPatternsDepth =>
      'Additional patterns depth';

  @override
  String get universalPowerDepth1 => 'केवल प्राथमिकता: पावर/OFF';

  @override
  String get universalPowerDepth2 => 'पावर उपनाम शामिल करें';

  @override
  String get universalPowerDepth3 => 'द्वितीयक पावर labels शामिल करें';

  @override
  String get universalPowerDepth4 =>
      'सभी labels शामिल करें (सबसे कम प्राथमिकता)';

  @override
  String get universalPowerLoopUntilStopped => 'रोकने तक लूप करें';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'जब तक आप इसे रोकें नहीं, queue को चक्रित करता रहता है।';

  @override
  String get universalPowerDelayBetweenCodes => 'कोडों के बीच विलंब';

  @override
  String get universalPowerStart => 'प्रारंभ यूनिवर्सल पावर';

  @override
  String get universalPowerRunStatus => 'चलाएं status';

  @override
  String universalPowerProgress(Object value) {
    return 'Progress: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'ऐप पृष्ठभूमि में जाने के कारण रोका गया।';

  @override
  String get universalPowerSendOneCode => 'भेजें एक कोड';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'जैसे ही डिवाइस प्रतिक्रिया दे, रोक दें।';

  @override
  String get iconNamePlay => 'Play';

  @override
  String get iconNamePause => 'रोकें';

  @override
  String get iconNameStop => 'रोकें';

  @override
  String get iconNameFastForward => 'तेज़ आगे';

  @override
  String get iconNameRewind => 'Rewind';

  @override
  String get iconNameSkipNext => 'छोड़ें अगला';

  @override
  String get iconNameSkipPrevious => 'छोड़ें पिछला';

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
  String get iconNameRepeatOne => 'Repeat एक';

  @override
  String get iconNameVolumeUp => 'आवाज़ ऊपर';

  @override
  String get iconNameVolumeDown => 'आवाज़ नीचे';

  @override
  String get iconNameVolumeOff => 'आवाज़ Off';

  @override
  String get iconNameMute => 'म्यूट';

  @override
  String get iconNameSpeaker => 'Speaker';

  @override
  String get iconNameSurroundSound => 'सराउंड साउंड';

  @override
  String get iconNameEqualizer => 'Equalizer';

  @override
  String get iconNameAudio => 'ऑडियो';

  @override
  String get iconNameMicrophone => 'Microphone';

  @override
  String get iconNameMicOff => 'Mic Off';

  @override
  String get iconNameUp => 'ऊपर';

  @override
  String get iconNameDown => 'नीचे';

  @override
  String get iconNameLeft => 'बायां';

  @override
  String get iconNameRight => 'दायां';

  @override
  String get iconNameArrowUp => 'तीर ऊपर';

  @override
  String get iconNameArrowDown => 'तीर नीचे';

  @override
  String get iconNameArrowLeft => 'तीर बायां';

  @override
  String get iconNameArrowRight => 'तीर दायां';

  @override
  String get iconNameNavigation => 'नेविगेशन';

  @override
  String get iconNameChevronLeft => 'शेवरॉन बायां';

  @override
  String get iconNameChevronRight => 'शेवरॉन दायां';

  @override
  String get iconNameExpandLess => 'कम फैलाएं';

  @override
  String get iconNameExpandMore => 'अधिक फैलाएं';

  @override
  String get iconNameCollapse => 'Collapse';

  @override
  String get iconNameExpand => 'Expand';

  @override
  String get iconNameCircleUp => 'वृत्त ऊपर';

  @override
  String get iconNameCircleDown => 'वृत्त नीचे';

  @override
  String get iconNameCircleLeft => 'वृत्त बायां';

  @override
  String get iconNameCircleRight => 'वृत्त दायां';

  @override
  String get iconNameOkSelect => 'OK/चुनें';

  @override
  String get iconNameConfirm => 'Confirm';

  @override
  String get iconNameCancel => 'रद्द करें';

  @override
  String get iconNameClose => 'बंद करें';

  @override
  String get iconNameHome => 'मुखपृष्ठ';

  @override
  String get iconNameReturn => 'Return';

  @override
  String get iconNameExit => 'Exit';

  @override
  String get iconNameUndo => 'पूर्ववत करें';

  @override
  String get iconNameRedo => 'Redo';

  @override
  String get iconNamePower => 'पावर';

  @override
  String get iconNamePowerAlt => 'पावर Alt';

  @override
  String get iconNamePowerOff => 'पावर Off';

  @override
  String get iconNameOn => 'पर';

  @override
  String get iconNameOff => 'Off';

  @override
  String get iconNameToggleOn => 'Toggle पर';

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
  String get iconNameOne => 'एक';

  @override
  String get iconNameTwo => 'दो';

  @override
  String get iconNameThree => 'तीन';

  @override
  String get iconNameFour => 'चार';

  @override
  String get iconNameFive => 'Five';

  @override
  String get iconNameSix => 'Six';

  @override
  String get iconNamePlus => 'Plus';

  @override
  String get iconNameMinus => 'Minus';

  @override
  String get iconNameAddCircle => 'जोड़ें वृत्त';

  @override
  String get iconNameRemoveCircle => 'वृत्त हटाएं';

  @override
  String get iconNameSettings => 'सेटिंग्स';

  @override
  String get iconNameMenu => 'Menu';

  @override
  String get iconNameMoreVertical => 'और लंबवत';

  @override
  String get iconNameMoreHorizontal => 'और क्षैतिज';

  @override
  String get iconNameTune => 'Tune';

  @override
  String get iconNameRemoteSettings => 'रिमोट सेटिंग्स';

  @override
  String get iconNameInfo => 'Info';

  @override
  String get iconNameInfoOutline => 'जानकारी आउटलाइन';

  @override
  String get iconNameHelp => 'मदद';

  @override
  String get iconNameHelpOutline => 'मदद Outline';

  @override
  String get iconNameList => 'सूची';

  @override
  String get iconNameViewList => 'दृश्य सूची';

  @override
  String get iconNameViewGrid => 'दृश्य ग्रिड';

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
  String get iconNameBrightnessHigh => 'चमक High';

  @override
  String get iconNameBrightnessMedium => 'चमक Medium';

  @override
  String get iconNameBrightnessLow => 'चमक Low';

  @override
  String get iconNameAutoBrightness => 'स्वतः चमक';

  @override
  String get iconNameLightMode => 'हल्का मोड';

  @override
  String get iconNameDarkMode => 'गहरा मोड';

  @override
  String get iconNameContrast => 'Contrast';

  @override
  String get iconNameHdrOn => 'HDR पर';

  @override
  String get iconNameHdrOff => 'HDR Off';

  @override
  String get iconNameAspectRatio => 'आस्पेक्ट अनुपात';

  @override
  String get iconNameCrop => 'Crop';

  @override
  String get iconNameZoomIn => 'Zoom में';

  @override
  String get iconNameZoomOut => 'Zoom Out';

  @override
  String get iconNameFullscreen => 'पूर्ण स्क्रीन';

  @override
  String get iconNameExitFullscreen => 'Exit पूर्ण स्क्रीन';

  @override
  String get iconNameFitScreen => 'Fit स्क्रीन';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'Crop Free';

  @override
  String get iconNameInput => 'इनपुट';

  @override
  String get iconNameCable => 'Cable';

  @override
  String get iconNameCast => 'Cast';

  @override
  String get iconNameCastConnected => 'Cast जुड़ा';

  @override
  String get iconNameScreenShare => 'स्क्रीन Share';

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
  String get iconNameVideoLibrary => 'वीडियो Library';

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
  String get iconNameFavorite => 'पसंदीदा';

  @override
  String get iconNameFavoriteOutline => 'पसंदीदा Outline';

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
  String get iconNameDone => 'पूर्ण';

  @override
  String get iconNameDoneAll => 'पूर्ण सभी';

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
  String get iconNameLight => 'हल्का';

  @override
  String get iconNameLightOutline => 'हल्का Outline';

  @override
  String get iconNameWarmLight => 'Warm हल्का';

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
  String get iconNameInvertColors => 'Invert रंग';

  @override
  String get iconNamePalette => 'Palette';

  @override
  String get iconNameColor => 'Color';

  @override
  String get iconNameTonality => 'Tonality';

  @override
  String get iconNameSearch => 'खोजें';

  @override
  String get iconNameRefresh => 'रीफ्रेश';

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
  String get iconNameFolder => 'फ़ोल्डर';

  @override
  String get iconNameDelete => 'हटाएं';

  @override
  String get iconNameEdit => 'संपादित करें';

  @override
  String get iconNameSave => 'सहेजें';

  @override
  String get iconNameShare => 'Share';

  @override
  String get iconNamePrint => 'Print';

  @override
  String get iconNameLanguage => 'भाषा';

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
  String get iconNameVideoCamera => 'वीडियो Camera';

  @override
  String get iconNamePhotoCamera => 'Photo Camera';

  @override
  String get iconNameSlowMotion => 'Slow Motion';

  @override
  String get iconNameSpeed => 'Speed';

  @override
  String get iconNameVideoSettings => 'वीडियो सेटिंग्स';

  @override
  String get iconNameAudioTrack => 'ऑडियो Track';

  @override
  String get iconNameGraphicEq => 'Graphic EQ';

  @override
  String get iconNameMusicVideo => 'Music वीडियो';

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
  String get iconNameNotEqualFa => 'नहीं Equal ≠ FA';

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
  String get iconNamePauseFa => 'रोकें FA';

  @override
  String get iconNameStopFa => 'रोकें FA';

  @override
  String get iconNamePlayFaOutline => 'Play FA Outline';

  @override
  String get iconNamePauseFaOutline => 'रोकें FA Outline';

  @override
  String get iconNameStopFaOutline => 'रोकें FA Outline';

  @override
  String get iconNameBackwardFa => 'Backward FA';

  @override
  String get iconNameForwardFa => 'Forward FA';

  @override
  String get iconNamePreviousFa => 'पिछला FA';

  @override
  String get iconNameNextFa => 'अगला FA';

  @override
  String get iconNameRewindFa => 'Rewind FA';

  @override
  String get iconNameFastForwardFa => 'तेज़ आगे FA';

  @override
  String get iconNameRepeatFa => 'Repeat FA';

  @override
  String get iconNameShuffleFa => 'Shuffle FA';

  @override
  String get iconNameEjectFa => 'Eject FA';

  @override
  String get iconNameFilmFa => 'Film FA';

  @override
  String get iconNameVideoFa => 'वीडियो FA';

  @override
  String get iconNameMusicFa => 'Music FA';

  @override
  String get iconNameMicrophoneFa => 'Microphone FA';

  @override
  String get iconNameCameraFa => 'Camera FA';

  @override
  String get iconNameCameraRetroFa => 'Camera Retro FA';

  @override
  String get iconNameVolumeHighFa => 'आवाज़ High FA';

  @override
  String get iconNameVolumeLowFa => 'आवाज़ Low FA';

  @override
  String get iconNameVolumeOffFa => 'आवाज़ Off FA';

  @override
  String get iconNameMuteFa => 'म्यूट FA';

  @override
  String get iconNameMicMuteFa => 'Mic म्यूट FA';

  @override
  String get iconNameHeadphonesFa => 'Headphones FA';

  @override
  String get iconNameSpeakerFa => 'Speaker FA';

  @override
  String get iconNameUpFa => 'ऊपर FA';

  @override
  String get iconNameDownFa => 'नीचे FA';

  @override
  String get iconNameLeftFa => 'बायां FA';

  @override
  String get iconNameRightFa => 'दायां FA';

  @override
  String get iconNameUpFaOutline => 'ऊपर FA Outline';

  @override
  String get iconNameDownFaOutline => 'नीचे FA Outline';

  @override
  String get iconNameLeftFaOutline => 'बायां FA Outline';

  @override
  String get iconNameRightFaOutline => 'दायां FA Outline';

  @override
  String get iconNameArrowUpFa => 'तीर ऊपर FA';

  @override
  String get iconNameArrowDownFa => 'तीर नीचे FA';

  @override
  String get iconNameArrowLeftFa => 'तीर बायां FA';

  @override
  String get iconNameArrowRightFa => 'तीर दायां FA';

  @override
  String get iconNameChevronUpFa => 'शेवरॉन ऊपर FA';

  @override
  String get iconNameChevronDownFa => 'शेवरॉन नीचे FA';

  @override
  String get iconNameChevronLeftFa => 'शेवरॉन बायां FA';

  @override
  String get iconNameChevronRightFa => 'शेवरॉन दायां FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Outline';

  @override
  String get iconNameCheckFa => 'Check FA';

  @override
  String get iconNameCloseFa => 'बंद करें FA';

  @override
  String get iconNameCloseCircleFa => 'बंद करें वृत्त FA';

  @override
  String get iconNameHomeFa => 'मुखपृष्ठ FA';

  @override
  String get iconNameUndoFa => 'पूर्ववत करें FA';

  @override
  String get iconNameRedoFa => 'Redo FA';

  @override
  String get iconNameRotateFa => 'Rotate FA';

  @override
  String get iconNameSearchFa => 'खोजें FA';

  @override
  String get iconNameRefreshFa => 'रीफ्रेश FA';

  @override
  String get iconNamePowerOffFa => 'पावर Off FA';

  @override
  String get iconNamePlugFa => 'Plug FA';

  @override
  String get iconNameToggleOnFa => 'Toggle पर FA';

  @override
  String get iconNameToggleOffFa => 'Toggle Off FA';

  @override
  String get iconNameSettingsFa => 'सेटिंग्स FA';

  @override
  String get iconNameSettingsAltFa => 'सेटिंग्स Alt FA';

  @override
  String get iconNameMenuFa => 'Menu FA';

  @override
  String get iconNameMoreFa => 'More FA';

  @override
  String get iconNameMoreVerticalFa => 'और लंबवत FA';

  @override
  String get iconNameInfoFa => 'Info FA';

  @override
  String get iconNameInfoFaOutline => 'Info FA Outline';

  @override
  String get iconNameHelpFa => 'मदद FA';

  @override
  String get iconNameHelpFaOutline => 'मदद FA Outline';

  @override
  String get iconNameListFa => 'सूची FA';

  @override
  String get iconNameGridFa => 'ग्रिड FA';

  @override
  String get iconNameSlidersFa => 'Sliders FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'Monitor FA';

  @override
  String get iconNameDesktopFa => 'Desktop FA';

  @override
  String get iconNameBrightnessFa => 'चमक FA';

  @override
  String get iconNameNightModeFa => 'Night मोड FA';

  @override
  String get iconNameLightFa => 'हल्का FA';

  @override
  String get iconNameLightFaOutline => 'हल्का FA Outline';

  @override
  String get iconNameFlashFa => 'Flash FA';

  @override
  String get iconNameFullscreenFa => 'पूर्ण स्क्रीन FA';

  @override
  String get iconNameExitFullscreenFa => 'Exit पूर्ण स्क्रीन FA';

  @override
  String get iconNameZoomInFa => 'Zoom में FA';

  @override
  String get iconNameZoomOutFa => 'Zoom Out FA';

  @override
  String get iconNameSubtitlesFa => 'Subtitles FA';

  @override
  String get iconNamePictureInPictureFa => 'Picture में Picture FA';

  @override
  String get iconNameColorFa => 'Color FA';

  @override
  String get iconNamePaintFa => 'Paint FA';

  @override
  String get iconNameInputFa => 'इनपुट FA';

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
  String get iconNameImageFa => 'छवि FA';

  @override
  String get iconNameVideoFileFa => 'वीडियो फ़ाइल FA';

  @override
  String get iconNameAudioFileFa => 'ऑडियो फ़ाइल FA';

  @override
  String get iconNamePlayOutlineFa => 'Play Outline FA';

  @override
  String get iconNamePlaySimpleFa => 'Play Simple FA';

  @override
  String get iconNamePauseSimpleFa => 'रोकें Simple FA';

  @override
  String get iconNameStopSimpleFa => 'रोकें Simple FA';

  @override
  String get iconNameRecordFa => 'Record FA';

  @override
  String get iconNameStopCircleFa => 'रोकें वृत्त FA';

  @override
  String get iconNameLoadingFa => 'लोड हो रहा है FA';

  @override
  String get iconNameTextFa => 'पाठ FA';

  @override
  String get iconNameTextSizeFa => 'पाठ Size FA';

  @override
  String get iconNameLanguageFa => 'भाषा FA';

  @override
  String get iconNameGlobeFa => 'Globe FA';

  @override
  String get iconNameSubtitlesAltFa => 'Subtitles Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Subtitles Alt Outline FA';

  @override
  String get iconNameChannelUpFa => 'Channel ऊपर FA';

  @override
  String get iconNameChannelDownFa => 'Channel नीचे FA';

  @override
  String get iconNamePageUpFa => 'Page ऊपर FA';

  @override
  String get iconNamePageDownFa => 'Page नीचे FA';

  @override
  String get iconNameGuideFa => 'Guide FA';

  @override
  String get iconNameGridViewFa => 'ग्रिड दृश्य FA';

  @override
  String get iconNameGridAltFa => 'ग्रिड Alt FA';

  @override
  String get iconNameScheduleFa => 'Schedule FA';

  @override
  String get iconNameCalendarFa => 'Calendar FA';

  @override
  String get iconNameRedButtonFa => 'Red बटन FA';

  @override
  String get iconNameButtonOutlineFa => 'बटन Outline FA';

  @override
  String get iconNameSquareButtonFa => 'Square बटन FA';

  @override
  String get iconNameSquareOutlineFa => 'Square Outline FA';

  @override
  String get iconNameDotCircleFa => 'Dot वृत्त FA';

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
  String get iconNameSortDownFa => 'Sort नीचे FA';

  @override
  String get iconNameSortUpFa => 'Sort ऊपर FA';

  @override
  String get iconNameSleepFa => 'Sleep FA';

  @override
  String get iconNameTimerStartFa => 'Timer प्रारंभ FA';

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
  String get iconNameSquareFullFa => 'Square पूर्ण FA';

  @override
  String get iconNameFullscreenAltFa => 'पूर्ण स्क्रीन Alt FA';

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
  String get iconNameUserFa => 'उपयोगकर्ता FA';

  @override
  String get iconNameUsersFa => 'Users FA';

  @override
  String get iconNameChildModeFa => 'Child मोड FA';

  @override
  String get iconNameCastFa => 'Cast FA';

  @override
  String get iconNameStreamFa => 'Stream FA';

  @override
  String get iconNameSignalFa => 'सिग्नल FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => 'वृत्त तीर ऊपर FA';

  @override
  String get iconNameCircleArrowDownFa => 'वृत्त तीर नीचे FA';

  @override
  String get iconNameCircleArrowLeftFa => 'वृत्त तीर बायां FA';

  @override
  String get iconNameCircleArrowRightFa => 'वृत्त तीर दायां FA';

  @override
  String get iconNameLongArrowUpFa => 'Long तीर ऊपर FA';

  @override
  String get iconNameLongArrowDownFa => 'Long तीर नीचे FA';

  @override
  String get iconNameLongArrowLeftFa => 'Long तीर बायां FA';

  @override
  String get iconNameLongArrowRightFa => 'Long तीर दायां FA';

  @override
  String get iconNamePlusFa => 'Plus FA';

  @override
  String get iconNameMinusFa => 'Minus FA';

  @override
  String get iconNamePlusCircleFa => 'Plus वृत्त FA';

  @override
  String get iconNameMinusCircleFa => 'Minus वृत्त FA';

  @override
  String get iconNamePlusSquareFa => 'Plus Square FA';

  @override
  String get iconNameMinusSquareFa => 'Minus Square FA';

  @override
  String get iconNameTimesFa => 'Times FA';

  @override
  String get iconNameTimesCircleFa => 'Times वृत्त FA';

  @override
  String get iconNameBatteryFullFa => 'बैटरी पूर्ण FA';

  @override
  String get iconNameBattery34Fa => 'बैटरी 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'बैटरी Half FA';

  @override
  String get iconNameBattery14Fa => 'बैटरी 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'बैटरी Empty FA';

  @override
  String get iconNameChargingFa => 'Charging FA';

  @override
  String get iconNameCloudSunFa => 'Cloud Sun FA';

  @override
  String get iconNameCloudMoonFa => 'Cloud Moon FA';

  @override
  String get iconNameRainFa => 'Rain FA';

  @override
  String get iconNameSnowflakeFa => 'Sअबflake FA';

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
  String get unknownLabel => 'अज्ञात';

  @override
  String get selectedFilesLabel => 'चयनित फ़ाइल(s)';

  @override
  String get folderNotFoundOrInaccessible =>
      'फ़ोल्डर नहीं मिला या inaccessible.';

  @override
  String get importedRemoteDefaultName => 'ImportedRemote';

  @override
  String get demoRemoteName => 'Demo रिमोट';

  @override
  String get protocolFieldsInvalid =>
      'Fill आवश्यक प्रोटोकॉल fields और ensure फ़्रीक्वेंसी है 15k–60k यदि set.';

  @override
  String get unknownProtocolSelected => 'अज्ञात प्रोटोकॉल चयनित.';

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
  String get learningModeCaptureFailed => 'सीखना कैप्चर विफल रहा.';

  @override
  String get learningModeReplaySent => 'सीखा हुआ सिग्नल दोबारा चलाया गया।';

  @override
  String get learningModeReplayFailed =>
      'सीखे गए सिग्नल को दोबारा नहीं चलाया जा सका.';

  @override
  String get learningModeNoRemotesAvailable =>
      'अभी तक कोई रिमोट सहेजा नहीं गया है.';

  @override
  String get learningModeChooseRemoteTitle => 'एक रिमोट चुनें';

  @override
  String get learningModeNewRemoteTitle => 'एक नया रिमोट बनाएं';

  @override
  String get learningModeSaveSuccess => 'सीखा हुआ बटन सहेजा गया।';

  @override
  String get learningModeSaveFailed => 'सीखा गया बटन सहेजा नहीं जा सका.';
}
