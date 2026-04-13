// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Naglo-load…';

  @override
  String get unknownError => 'Hindi kilalang error';

  @override
  String get failedToStart => 'Hindi nagsimula';

  @override
  String get retry => 'Subukan muli';

  @override
  String get quickTilePower => 'Power';

  @override
  String get quickTileMute => 'Mute';

  @override
  String get quickTileVolumeUp => 'Lakasan';

  @override
  String get quickTileVolumeDown => 'Hinaan';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Walang built-in IR emitter ang teleponong ito. May natukoy na USB IR dongle, pero wala pang pahintulot.\n\nPayagan ang USB prompt para makapagpadala ng IR.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'Walang built-in IR emitter ang teleponong ito. May natukoy na USB IR dongle, pero tinanggihan ang pahintulot sa USB.\n\nHumiling muli ng pahintulot at payagan ang prompt para makapagpadala ng IR.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'Walang built-in IR emitter ang teleponong ito. Pinayagan ang USB IR dongle, pero hindi pa ito na-init.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Walang built-in IR emitter ang teleponong ito. May natukoy at pinayagang USB IR dongle, pero hindi ito ma-init.\n\nIkabit muli ang dongle at subukan ulit.';

  @override
  String get homeUsbReadyMessage =>
      'Walang built-in IR emitter ang teleponong ito.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Walang built-in IR emitter ang teleponong ito, at walang suportadong USB IR dongle na nakakabit ngayon.\n\nMaaari ka pa ring gumawa, mag-import, at mamahala ng mga remote — pero para magpadala ng IR signal kailangan mo ang isa sa mga opsyon sa ibaba.';

  @override
  String get homeUsbOptionPlugIn =>
      'Isaksak ang suportadong USB IR dongle, saka payagan ito.';

  @override
  String get homeUsbOptionReady => 'Handa nang gamitin.';

  @override
  String get homeUsbOptionPermissionRequired =>
      'Nakakabit na. Kailangan ng pahintulot.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Tinanggihan ang pahintulot. Humiling muli.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Awtorisado. Ino-initialize ang dongle.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Awtorisado, pero nabigo ang pag-initialize.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Walang built-in IR ang teleponong ito. Ikabit ang USB IR dongle o i-on ang Audio mode sa Mga Setting.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'May natukoy na USB dongle. Kailangan ng pahintulot para makapagpadala ng IR.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Tinanggihan ang pahintulot sa USB. Humiling muli para makapagpadala ng IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Awtorisado ang USB dongle. Naghihintay ng pag-initialize.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Awtorisado ang USB dongle, pero nabigo ang pag-initialize.';

  @override
  String get homeHardwareBannerReady => 'Handa na ang USB.';

  @override
  String get homeHardwareRequiredTitle =>
      'Kailangan ang IR hardware para makapagpadala ng mga command';

  @override
  String get homeUsbDongleRecommended => 'USB IR dongle (inirerekomenda)';

  @override
  String get homeAudioAdapterAlternative => 'Audio IR adapter (alternatibo)';

  @override
  String get homeAudioAdapterDescription =>
      'Mga Setting → IR Transmitter → Audio 1 LED / 2 LED. Kailangan ng audio-to-IR adapter.';

  @override
  String get close => 'Isara';

  @override
  String get homeChooseTransmitter => 'Pumili ng transmitter';

  @override
  String get openSettings => 'Buksan ang Settings';

  @override
  String get homeUsbPermissionSentApprove =>
      'Naipadala na ang hiling para sa pahintulot sa USB. Payagan ang prompt para ma-enable ang USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'Walang natukoy na suportadong USB IR dongle. Isaksak ito at subukan muli.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Nabigong humiling ng pahintulot sa USB.';

  @override
  String get working => 'Gumagana…';

  @override
  String get requestUsbPermission => 'Humiling ng pahintulot sa USB';

  @override
  String get homeHardwareTip =>
      'Tip. Maaari ka nang gumawa at mag-ayos ng mga remote ngayon. Kailangan lang ang hardware kapag magpapadala na.';

  @override
  String get homeNoIrTransmitterTitle => 'Walang available na IR transmitter';

  @override
  String get homeHardwareRequiredBody =>
      'Kayang gumawa at mamahala ng IR Blaster ng mga remote sa anumang telepono. Pero para aktuwal na makapagpadala ng infrared command, kailangan ng iyong device ang isa sa mga hardware option sa ibaba.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Maaari ka pa ring gumawa, mag-import, at mag-ayos ng mga remote ngayon din.';

  @override
  String get homeWaysToUseIrBlaster => 'Mga paraan para gamitin ang IR Blaster';

  @override
  String get homeBuiltInIrOptionTitle => 'Teleponong may built-in IR';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Gumagana sa mga suportadong teleponong may built-in IR blaster. Wala nito ang teleponong ito.';

  @override
  String get homeBuiltInIrUnavailable => 'Hindi available sa teleponong ito';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => '3.5 mm na audio adapter';

  @override
  String get homeContinueWithoutHardware => 'Magpatuloy nang walang hardware';

  @override
  String get homeHowItWorks => 'Paano ito gumagana';

  @override
  String get settingsNavLabel => 'Mga Setting';

  @override
  String get dismiss => 'Isara';

  @override
  String get remotesNavLabel => 'Mga Remote';

  @override
  String get macrosNavLabel => 'Mga Macro';

  @override
  String get signalTesterNavLabel => 'Signal Tester';

  @override
  String get settingsTitle => 'Mga Setting';

  @override
  String get remoteNoIrEmitterTitle => 'Walang IR emitter';

  @override
  String get remoteNoIrEmitterMessage =>
      'Ang device does not have an IR emitter';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Ang app needs an IR emitter to function';

  @override
  String get remoteDismiss => 'Isara';

  @override
  String get remoteClose => 'Isara';

  @override
  String remoteFailedToSend(Object error) {
    return 'Nabigong magpadala ng IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Nabigong simulan ang loop: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Nahinto ang loop, nabigong magpadala: $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Paulit-ulit ang \"$title\". Tapikin ang Ihinto sa itaas para huminto.';
  }

  @override
  String get remoteLoopStopped => 'Loop stopped.';

  @override
  String get remoteUpdatedNotFound =>
      'Remote updated on screen. It was not found in the saved list.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Na-update ang \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Nabigo ang pagbura: $error';
  }

  @override
  String get remoteNotFoundSavedList => 'Remote not found in saved list.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Nabura ang \"$name\".';
  }

  @override
  String get buttonFallbackTitle => 'Button';

  @override
  String get imageFallbackTitle => 'Image';

  @override
  String get noBrowserAvailable => 'Walang browser available';

  @override
  String failedToOpen(Object error) {
    return 'Nabigong buksan: $error';
  }

  @override
  String get cancel => 'Kanselahin';

  @override
  String get settingsRestoreDemoTitle => 'Restore demo mga remote?';

  @override
  String get settingsRestoreDemoMessage =>
      'Papaltan nito ang kasalukuyan mong mga remote ng built-in demo remotes. Inirerekomenda ang backup kung gusto mong panatilihin ang kasalukuyan mong listahan.';

  @override
  String get settingsRestoreDemoConfirm => 'Restore demo';

  @override
  String get settingsDemoRemotesRestored => 'Demo mga remote restored.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Delete all mga remote?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Aalisin nito ang lahat ng remote sa device na ito. Hindi na ito mababawi.';

  @override
  String get settingsDeleteAllConfirm => 'Delete all';

  @override
  String get settingsAllRemotesDeleted => 'All mga remote deleted.';

  @override
  String get themeAuto => 'Auto Theme';

  @override
  String get themeLight => 'Maliwanag na Tema';

  @override
  String get themeDark => 'Madilim na Tema';

  @override
  String get themeDescAuto => 'Sinusundan ang setting ng device mo';

  @override
  String get themeDescLight => 'Always bright at clear';

  @override
  String get themeDescDark => 'Easy on the eyes';

  @override
  String get themeHintAuto =>
      'Awtomatikong nagpapalit ang tema kapag binago mo ang setting ng device sa maliwanag o madilim na mode';

  @override
  String get themeHintLight =>
      'Perfect para sa daytime use at well-lit environments';

  @override
  String get themeHintDark =>
      'Reduces eye strain in low-maliwanag conditions at saves battery on OLED screens';

  @override
  String get supportDevelopmentTitle => 'Support Development';

  @override
  String get supportDevelopmentSubtitle =>
      'Keep IR Blaster maintained at hardware-compatible';

  @override
  String get supportDevelopmentBody =>
      'Walang ads, walang tracking, walang naka-lock na feature. Ang suporta mo ang tumutustos sa protocol work, USB dongle support, at mas maayos na compatibility sa mga device.';

  @override
  String get donate => 'Donate';

  @override
  String get starRepo => 'Star Repo';

  @override
  String get repositoryLinkCopied => 'Repository link copied';

  @override
  String get supportPillLocalOnly => 'Local-only';

  @override
  String get supportPillNoTracking => 'Walang tracking';

  @override
  String get supportPillHardwareAware => 'Hardware-aware';

  @override
  String get supportPillOpenSource => 'Open-source';

  @override
  String get appearanceTitle => 'Appearance';

  @override
  String get appearanceSubtitle => 'Customize iyong visual experience';

  @override
  String get localizationTitle => 'Localization';

  @override
  String get localizationSubtitle => 'App wika at translation behavior';

  @override
  String localizationAutoUsing(Object language) {
    return 'Auto: gamit ang $language';
  }

  @override
  String get localizationAutoDescription =>
      'The app follows iyong device wika when possible.';

  @override
  String get localizationManualDescription =>
      'The app wika is manually overridden.';

  @override
  String get useSystemLanguageTitle => 'Use system wika';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Sinusundan ang wika ng device mo: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Gamitin ang wikang pinili sa ibaba sa halip na default ng device.';

  @override
  String get chooseAppLanguage => 'Piliin ang app wika';

  @override
  String get languagePickerDisabledHint =>
      'Turn off system wika to piliin a wika manually.';

  @override
  String get searchLanguages => 'Search languages';

  @override
  String get noLanguagesFound => 'Walang matching languages';

  @override
  String get localizationHint =>
      'Kapag naka-on ang wika ng system, susundan ng app ang locale ng device mo at babalik sa English kung walang salin. I-off ito para itakda ang app sa isang tiyak na wika.';

  @override
  String get appLanguageTitle => 'App wika';

  @override
  String get appLanguageHint =>
      'Auto nitong sinusundan ang wika ng device mo. Piliin dito ang English o French para sa app lang.';

  @override
  String get languageAuto => 'Auto (system)';

  @override
  String get languageAutoDescription =>
      'Follow iyong device wika automatically';

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
  String get themeChoiceLight => 'Maliwanag';

  @override
  String get themeChoiceDark => 'Madilim';

  @override
  String get irTransmitterTitle => 'IR Transmitter';

  @override
  String get irTransmitterSubtitle =>
      'Piliin ang which hardware sends IR commands';

  @override
  String get learningModeEntryTitle => 'Mode ng Pag-aaral';

  @override
  String get learningModeEntrySubtitle =>
      'Kumuha ng button mula sa isang pisikal na remote na hakbang-hakbang';

  @override
  String get learningModeTitle => 'Mode ng Pag-aaral';

  @override
  String get learningModeHeroTitle => 'Malinis na matuto ng remote na button';

  @override
  String get learningModeHeroSubtitle =>
      'I-set up ang iyong receiver, ihanda ang orihinal na remote, kumuha ng isang command, pagkatapos ay suriin ito bago i-save ito sa isang remote.';

  @override
  String get learningModeReadyBadge => 'Handa na ang receiver';

  @override
  String get learningModeNeedsPermissionBadge =>
      'Kailangan ng pahintulot sa USB';

  @override
  String get learningModeSetupBadge => 'Kailangan ang setup ng receiver';

  @override
  String get learningModeNoReceiverBadge => 'Walang learning receiver';

  @override
  String get learningModeCheckingBadge => 'Sinusuri ang hardware';

  @override
  String get learningModeFourStepFlow => '4-step guided flow';

  @override
  String get learningModeSaveAnywhereBadge => 'Suriin bago i-save';

  @override
  String get learningModeGuideTitle =>
      'Kunin kung saan dapat mangyari ang pagkuha';

  @override
  String get learningModeStepHardwareShort => 'Hardware';

  @override
  String get learningModeStepPrepareShort => 'Maghanda';

  @override
  String get learningModeStepCaptureShort => 'Kunin';

  @override
  String get learningModeStepReviewShort => 'Balik-aral';

  @override
  String get learningModeStepHardwareTitle => 'Suriin ang hardware ng receiver';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Siguraduhin na ang isang katugmang learning receiver ay nakakabit at pinahintulutan bago magsimula.';

  @override
  String get learningModeCurrentSenderLabel => 'Kasalukuyang transmitter';

  @override
  String get learningModeReceiverStatusLabel => 'Katayuan ng pagkatuto';

  @override
  String get learningModeCheckingHardwareBody =>
      'Sinusuri ang available na transmiter at USB receiver state.';

  @override
  String get learningModeHardwareReadyBody =>
      'Ang isang USB IR dongle ay nakakabit at pinasimulan. Ito ang tamang lugar para simulan ang daloy ng pag-aaral kapag nakakonekta na ang mga wiring sa pag-capture.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Mayroong USB dongle, ngunit hinaharangan pa rin ito ng pahintulot ng Android. Magbigay ng pahintulot sa USB sa seksyon ng transmitter bago matuto.';

  @override
  String get learningModeHardwareSetupBody =>
      'Bahagyang natukoy ang isang dongle, ngunit kailangan pa rin nitong i-setup o muling kumonekta bago makapagsimula nang mapagkakatiwalaan ang pag-aaral.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Walang katugmang hardware ng receiver ang kasalukuyang magagamit. Ang mode ng pag-aaral ay inilaan para sa mga sinusuportahang panlabas na dongle na may kakayahang tumanggap.';

  @override
  String get learningModeRefreshHardware => 'I-refresh ang status ng hardware';

  @override
  String get learningModeHardwareTipTitle => 'Pinakamahusay na pagkakalagay';

  @override
  String get learningModeHardwareTipBody =>
      'Nabubuhay ang Learning Mode sa ilalim ng IR Transmitter dahil nakadepende ito sa availability ng hardware at mas madalas itong ginagamit kaysa sa pagpapadala ng mga remote.';

  @override
  String get learningModeStepPrepareTitle => 'Ihanda ang orihinal na remote';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Magpasya kung ano ang iyong natututuhan, pagkatapos ay panatilihing matatag ang orihinal na remote at malapit sa receiver.';

  @override
  String get learningModeButtonNameLabel => 'Pangalan ng button';

  @override
  String get learningModeButtonNameHint => 'Halimbawa: HDMI 1, Power, Menu';

  @override
  String get learningModeSinglePress => 'Single press';

  @override
  String get learningModeHoldButton => 'Pindutin ang pindutan';

  @override
  String get learningModePreparationChecklistTitle => 'Bago mo makuha';

  @override
  String get learningModePreparationItemDistance =>
      'Panatilihin ang orihinal na remote na humigit-kumulang 2 hanggang 5 cm mula sa receiver.';

  @override
  String get learningModePreparationItemOneButton =>
      'Matuto nang paisa-isang button at gumamit muna ng maikli at malinis na pagpindot.';

  @override
  String get learningModePreparationItemStill =>
      'Panatilihing steady ang parehong device para maiwasan ang maingay o bahagyang pagkuha.';

  @override
  String get learningModeStepCaptureTitle => 'Kunin ang signal';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Makinig para sa isang utos, pagkatapos ay i-lock ang resulta bago ito suriin.';

  @override
  String get learningModeCaptureReadyTitle => 'Handa nang makinig';

  @override
  String get learningModeCaptureReadyBody =>
      'Mukhang maganda ang estado ng iyong hardware. Ang capture backend ay isaksak sa susunod na hakbang na ito.';

  @override
  String get learningModeCaptureBlockedTitle => 'Hindi pa handa ang hardware';

  @override
  String get learningModeCaptureBlockedBody =>
      'Maaari mo pa ring suriin ang daloy ngayon, ngunit ang pagkuha ay dapat maghintay hanggang ang receiver ay handa na.';

  @override
  String get learningModeStartListening => 'Simulan ang pakikinig';

  @override
  String get learningModeCaptureStubTitle => 'Susunod ang pagkuha ng backend';

  @override
  String get learningModeCaptureStubBody =>
      'Ang screen na ito ay ganap na naka-scaffold muna upang ang huling daloy ng pagkuha ay maaaring isaksak sa mga tunay na estado ng hardware sa halip na i-bolted sa ibang pagkakataon.';

  @override
  String get learningModeCaptureStubMessage =>
      'Hindi pa naka-wire ang learning capture. Ang screen na ito ay scaffolds muna ang buong daloy.';

  @override
  String get learningModeUnnamedCapture => 'Hindi pinangalanang pagkuha';

  @override
  String get learningModeStatusCheckingTitle => 'Sinusuri ang receiver';

  @override
  String get learningModeStatusNoReceiverTitle => 'Hindi handa ang receiver';

  @override
  String get learningModeStatusPermissionTitle =>
      'Kinakailangan ang pahintulot sa USB';

  @override
  String get learningModeStatusSetupTitle => 'Kailangang i-setup ang receiver';

  @override
  String get learningModeStatusReadyTitle => 'Handa nang matuto';

  @override
  String get learningModeStatusListeningTitle => 'Nakikinig ng signal';

  @override
  String get learningModeStatusCapturedTitle => 'Nakuha ang signal';

  @override
  String get learningModeStatusReadyBody =>
      'Pangalanan ang button, ituro ang orihinal na remote sa receiver, at simulan ang pakikinig kapag handa ka na.';

  @override
  String get learningModeStatusListeningBody =>
      'Pindutin ang orihinal na remote button ngayon. Kapag na-wire na ang pag-capture, magla-lock ang estado na ito sa susunod na malinis na signal.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Ang isang natutunang preview ng signal ay handa na para sa $buttonName. I-replay ito, kumpirmahin na gumagana ito, pagkatapos ay i-save ito sa iyong library.';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'Ikonekta ang isang katugmang dongle sa pag-aaral';

  @override
  String get learningModeConnectReceiverBody =>
      'Ang mode ng pag-aaral ay nakasalalay sa panlabas na hardware na maaaring makatanggap ng IR. Kapag ang receiver ay nakita at pinahintulutan, ang page na ito ay nagiging direktang pakikinig, pagsubok, at pag-save ng daloy.';

  @override
  String get learningModeListenCardTitle => 'Makinig para sa isang pindutan';

  @override
  String get learningModeListenCardBody =>
      'Magtakda muna ng label kung gusto mo, pagkatapos ay simulan ang pakikinig at pindutin ang button sa orihinal na remote.';

  @override
  String get learningModeReadyToListenTitle => 'Handa nang makinig';

  @override
  String get learningModeReadyToListenBody =>
      'Ito ang pangunahing ibabaw ng pagkuha. Magsimulang makinig lamang kapag ang orihinal na remote ay nakatutok at steady.';

  @override
  String get learningModeListeningNowTitle => 'Nakikinig ngayon';

  @override
  String get learningModeListeningNowBody =>
      'Pindutin ang orihinal na remote button nang isang beses. Gumamit ng preview capture upang lumipat sa natitirang bahagi ng scaffold bago ma-wire ang real capture backend.';

  @override
  String get learningModePreviewCaptureAction =>
      'I-preview ang nakuhang signal';

  @override
  String get learningModeCapturedSummary => 'Natutunan ang preview ng signal';

  @override
  String get learningModeResultActionsTitle => 'Subukan at i-save';

  @override
  String get learningModeResultActionsBody =>
      'I-replay ang natutunang signal, i-verify na tumutugon ang target na device, pagkatapos ay i-save ito bilang isang reusable na button.';

  @override
  String get learningModeReplayAction => 'I-replay';

  @override
  String get learningModeReplayStubMessage =>
      'Hindi pa naka-wire ang replay. Ito ang UI scaffold para sa huling pag-aaral, pagsubok, at pag-save ng daloy.';

  @override
  String get learningModeSaveStubMessage =>
      'Ang pag-save ay hindi pa naka-wire. Ang susunod na hakbang ay pagkonekta sa screen na ito sa Create Button at mga umiiral nang remote.';

  @override
  String get learningModeLearnAnotherAction => 'Matuto ng isa pang button';

  @override
  String get learningModeStepReviewTitle => 'Suriin at i-save';

  @override
  String get learningModeStepReviewSubtitle =>
      'Kumpirmahin kung ano ang natutunan, pagkatapos ay piliin kung saan ito dapat tumira sa iyong malayong library.';

  @override
  String get learningModeSaveToExistingRemote => 'Umiiral na remote';

  @override
  String get learningModeCreateNewRemote => 'Bagong remote';

  @override
  String get learningModeProtocolPreviewTitle => 'Preview ng protocol';

  @override
  String get learningModeProtocolPreviewBody =>
      'Lalabas dito ang mga detalye ng decoded protocol sa sandaling makuha ng receiver ang isang malinis na pagpindot sa pindutan.';

  @override
  String get learningModeRawPreviewTitle => 'Raw fallback';

  @override
  String get learningModeRawPreviewBody =>
      'Kung hindi kumpleto ang pag-decode, magiging available pa rin dito ang raw timing capture para sa pagsusuri at pag-save.';

  @override
  String get learningModeSaveCapture => 'I-save ang pagkuha';

  @override
  String get learningModeReviewTipTitle => 'Kung saan ito mapupunta';

  @override
  String get learningModeReviewTipBody =>
      'Dapat ikonekta ng susunod na hakbang sa pagpapatupad ang review panel na ito sa Create Button at mga kasalukuyang remote para direktang bumaba ang natutunang signal sa iyong library.';

  @override
  String get learningModeFinishPreview => 'Tapusin ang preview';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interaction';

  @override
  String get interactionSubtitle => 'Touch feedback at remote layout';

  @override
  String get hapticFeedbackTitle => 'Haptic feedback';

  @override
  String get hapticFeedbackSubtitle => 'Vibrate on taps at actions';

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
  String get intensityLight => 'Maliwanag';

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
  String get backupSubtitle => 'Import o export ng mga remote at macro';

  @override
  String get importBackup => 'Import backup';

  @override
  String get importBackupSubtitle =>
      'Mag-import ng backup ng remotes o macros, o Flipper Zero, LIRC, o IRPLUS files';

  @override
  String get bulkImportFolder => 'Bulk import folder';

  @override
  String get bulkImportFolderSubtitle =>
      'Import multiple mga remote from a folder';

  @override
  String get exportBackup => 'Export backup';

  @override
  String get exportBackupSubtitle =>
      'I-save ang mga remote at macro bilang iisang JSON file sa Downloads';

  @override
  String get restoreDemoRemotes => 'Restore demo mga remote';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Replace kasalukuyang mga remote with the built-in demo';

  @override
  String get deleteAllRemotes => 'Delete all mga remote';

  @override
  String get deleteAllRemotesSubtitle =>
      'Alisin ang lahat ng remote sa device na ito';

  @override
  String get backupTip =>
      'Tip. Mag-export ng backup bago ang malalaking edit. Sinusuportahan ng import ang full backup, legacy mga remote lamang JSON backup, at Flipper Zero .ir files.';

  @override
  String get aboutTitle => 'Tungkol';

  @override
  String get aboutSubtitle => 'App information at open-source details';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Bersyon $version';
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
    return 'ni $creator';
  }

  @override
  String get deviceControlsTitle => 'Device Controls';

  @override
  String get deviceControlsSubtitle =>
      'Show favorite mga button in the system controls page';

  @override
  String get manageFavorites => 'Manage favorites';

  @override
  String get manageFavoritesSubtitle =>
      'Piliin kung aling mga button ang lalabas sa device controls';

  @override
  String get quickSettingsTitle => 'Quick Settings';

  @override
  String get quickSettingsSubtitle =>
      'Add tiles para sa power at volume shortcuts';

  @override
  String get configureTiles => 'Configure tiles';

  @override
  String get configureTilesSubtitle =>
      'Itugma ang mga tile sa mga button ng remote';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Universal power cycling para sa owned mga device';

  @override
  String get openTvKill => 'Open TVKill';

  @override
  String get openTvKillSubtitle =>
      'Paikutin ang mga power code, gamitin lamang sa mga device na sa iyo';

  @override
  String get failedToLoadTransmitterSettings =>
      'Nabigo to load transmitter settings.';

  @override
  String get usbStatusReady => 'USB dongle is connected at ready to send IR.';

  @override
  String get usbStatusPermissionRequired =>
      'May natukoy na USB dongle. Humiling ng pahintulot sa USB at payagan ang system prompt.';

  @override
  String get usbStatusPermissionDenied =>
      'Tinanggihan ang pahintulot sa USB para sa nakakabit na dongle. Humiling muli at payagan ang prompt.';

  @override
  String get usbStatusPermissionGranted =>
      'Pinayagan ang pahintulot sa USB. Kailangan pa ring ma-init ang dongle bago ito makapagpadala ng IR.';

  @override
  String get usbStatusOpenFailed =>
      'Pinayagan ang pahintulot sa USB, pero hindi ma-init ang dongle. Ikabit muli ito at subukan ulit.';

  @override
  String get usbStatusNoDevice => 'Walang supported USB IR dongle detected.';

  @override
  String get usbSelectPermissionRequired =>
      'May natukoy na USB dongle pero hindi pa pinapayagan. Tapikin ang \"Humiling ng pahintulot sa USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'Tinanggihan ang pahintulot sa USB. Tapikin ang \"Humiling ng pahintulot sa USB\" at payagan ang prompt.';

  @override
  String get usbSelectPermissionGranted =>
      'Pinayagan ang pahintulot sa USB, pero hindi pa na-init ang dongle. Subukang ikabit muli ito.';

  @override
  String get usbSelectOpenFailed =>
      'Pinayagan ang pahintulot sa USB, pero hindi ma-init ang dongle. Ikabit muli ito at subukan ulit.';

  @override
  String get usbSelectNoDevice =>
      'Walang natukoy na suportadong USB IR dongle. Isaksak ito, saka tapikin ang \"Humiling ng pahintulot sa USB\".';

  @override
  String get usbSelectReady => 'USB dongle is ready.';

  @override
  String get autoSwitchEnabledMessage =>
      'Auto-switch naka-on: uses USB when connected, otherwise Internal.';

  @override
  String get autoSwitchDisabledMessage =>
      'Auto-switch naka-off: transmitter selection is now manual.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Nabigo to update auto-switch setting.';

  @override
  String get failedToSwitchTransmitter => 'Nabigo to switch transmitter.';

  @override
  String get deviceHasNoInternalIr => 'Ang device has no built-in IR emitter.';

  @override
  String get audioModeEnabledMessage =>
      'Naka-on ang Audio mode. Gamitin ang max media volume at audio to IR LED adapter.';

  @override
  String get usbPermissionRequestSent =>
      'Naipadala na ang hiling para sa pahintulot sa USB.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Naipadala na ang hiling para sa pahintulot sa USB. Payagan ang prompt para ma-enable ang USB.';

  @override
  String get usbAlreadyReady => 'USB dongle is already initialized at ready.';

  @override
  String get failedToRequestUsbPermission => 'Nabigo to hiling USB pahintulot.';

  @override
  String get transmitterHelpInternal =>
      'Use the telepono’s built-in IR emitter to send commands.';

  @override
  String get transmitterHelpUsb =>
      'Use a USB IR dongle (pahintulot kailangan) to send commands.';

  @override
  String get transmitterHelpAudio1 =>
      'Gamitin ang audio output mono. Kailangan ng audio to IR LED adapter at mataas na media volume.';

  @override
  String get transmitterHelpAudio2 =>
      'Gamitin ang audio output stereo. Gumagamit ng dalawang channel para sa mas maayos na LED driving sa compatible na adapter.';

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
      'Nabigo to load transmitter capabilities.';

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
  String get autoSwitchDisabledWhileAudio =>
      'Naka-off habang gamit ang Audio mode';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Uses USB when connected, otherwise Internal';

  @override
  String get unavailableOnThisDevice => 'Hindi available sa device na ito';

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
  String get failedToUpdateSetting => 'Nabigo to update setting.';

  @override
  String get unnamedButton => 'Button na walang pangalan';

  @override
  String get iconFallback => 'Icon';

  @override
  String get remoteListReorderHint =>
      'Reorder mode: long-press at drag a card to move it.';

  @override
  String get deleteRemoteTitle => 'Delete remote?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" will be permanently removed. Ang action hindi na mababawi.';
  }

  @override
  String get delete => 'Burahin';

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
    return 'Deleted \"$name\". Ang action hindi na mababawi.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count button(s) · $layout';
  }

  @override
  String get layoutComfort => 'Comfort';

  @override
  String get layoutCompact => 'Compact';

  @override
  String get open => 'Open';

  @override
  String get useThisRemote => 'Gamitin ang remote na ito';

  @override
  String get edit => 'I-edit';

  @override
  String get editRemoteSubtitle =>
      'Palitan ang pangalan at i-edit ang mga button';

  @override
  String get thisCannotBeUndone => 'Ang cannot be undone';

  @override
  String get searchRemotes => 'Search Remotes';

  @override
  String get reorderRemotes => 'Reorder mga remote';

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
  String get noRemotesYet => 'Walang mga remote yet';

  @override
  String get noRemotesDescription =>
      'Create a remote to start sending IR codes.';

  @override
  String get noRemotesNextStep =>
      'Susunod: tapikin ang Add remote, saka idagdag ang una mong mga button.';

  @override
  String get actions => 'Actions';

  @override
  String get macrosTitle => 'Mga Macro';

  @override
  String get help => 'Help';

  @override
  String get createMacro => 'Create Macro';

  @override
  String get timedMacrosTitle => 'Timed Macros';

  @override
  String get timedMacrosSubtitle =>
      'Automate sequences ng IR commands with precise timing';

  @override
  String get timedMacrosNextStep =>
      'Susunod. Tapikin ang Gumawa ng Unang Macro, pumili ng remote, saka magdagdag ng mga command at delay.';

  @override
  String get macroFeatureToysTitle => 'Perfect para sa Interactive Toys';

  @override
  String get macroFeatureToysDescription =>
      'Kontrolin ang mga device tulad ng i-cybie robot dogs, i-sobot robots, at iba pang laruan na kailangan ng pagitan sa bawat command para maproseso ang kilos.';

  @override
  String get macroFeatureTimingTitle => 'Precise Timing Control';

  @override
  String get macroFeatureTimingDescription =>
      'Magdagdag ng delay sa pagitan ng mga command mula 250ms hanggang custom na haba para may oras ang device na tumugon bago ang susunod na kilos.';

  @override
  String get macroFeatureManualTitle => 'Manual Continue Steps';

  @override
  String get macroFeatureManualDescription =>
      'I-pause ang pagpapatakbo at hintayin ang kumpirmasyon mo kapag pabago-bago ang haba ng animation o kailangan mo ng visual feedback.';

  @override
  String get exampleUseCase => 'Example Use Case';

  @override
  String get macroExampleText =>
      'i-cybie Advanced Mode:\n1. Ipadala ang utos na \"Mode\"\n2. Maghintay ng 1000ms, pinoproseso ng laruan\n3. Ipadala ang \"Action 1\"\n4. Maghintay ng 1000ms\n5. Ipadala ang \"Action 2\"\n…at tuloy-tuloy nang awtomatiko!';

  @override
  String get createFirstMacro => 'Create Ang iyong First Macro';

  @override
  String get noRemote => 'Walang remote';

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
  String get aboutTimedMacros => 'About Timed Macros';

  @override
  String get aboutTimedMacrosDescription =>
      'Hinahayaan ka ng Timed Macros na i-automate ang sunod-sunod na IR command na may eksaktong delay sa bawat hakbang.';

  @override
  String get sendCommand => 'Send Command';

  @override
  String get sendCommandDescription =>
      'Transmits an IR command from iyong remote.';

  @override
  String get delay => 'Delay';

  @override
  String get delayDescription =>
      'Waits para sa a specified duration (e.g., 1000ms) before the next hakbang.';

  @override
  String get manualContinue => 'Manual Continue';

  @override
  String get manualContinueDescription =>
      'Pauses execution until you tapikin Continue (useful para sa variable-length animations).';

  @override
  String get gotIt => 'Got it';

  @override
  String get failedToSaveMacros => 'Nabigong i-save ang mga macro.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Nabura ang \"$name\".';
  }

  @override
  String get undo => 'Undo';

  @override
  String get failedToRestoreMacro => 'Nabigo to restore macro.';

  @override
  String get deleteMacroTitle => 'Delete macro?';

  @override
  String get deleteMacroMessage => 'You can undo this from the next snackbar.';

  @override
  String get noRemotesAvailable => 'Walang mga remote available.';

  @override
  String remoteButtonCountSummary(int count) {
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
  String get reorderButtons => 'Reorder mga button';

  @override
  String get remoteReorderHint =>
      'Reorder mode: pindutin nang matagal at i-drag ang button para ilipat ito.';

  @override
  String get manageRemote => 'Manage remote';

  @override
  String get remoteNoButtons => 'Walang button sa remote na ito';

  @override
  String get remoteNoButtonsDescription =>
      'Gamitin ang \"I-edit remote\" para magdagdag o mag-ayos ng mga button.';

  @override
  String get editRemote => 'I-edit remote';

  @override
  String get editRemoteActionsSubtitle =>
      'Palitan ang pangalan, ayusin muli, at i-edit ang mga button';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Na-update ang \"$name\".';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Added \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Button duplicated.';

  @override
  String get loopRunningForButton =>
      'Tumatakbo ang loop para sa button na ito.';

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
  String get editButtonSubtitle => 'Modify label, code, protocol, frequency';

  @override
  String get newButton => 'New button';

  @override
  String get newButtonSubtitle => 'Gumawa ng bagong button pagkatapos nito';

  @override
  String get duplicate => 'Duplicate';

  @override
  String get duplicateButtonSubtitle => 'Gumawa ng kopya ng button na ito';

  @override
  String get removeFromDeviceControls => 'Remove from Device Controls';

  @override
  String get addToDeviceControls => 'Add to Device Controls';

  @override
  String get deviceControlsButtonSubtitle =>
      'Ipinapakita ang button na ito sa system device controls';

  @override
  String get removedFromDeviceControls => 'Removed from Device Controls.';

  @override
  String get pinQuickTile => 'Pin to Quick Tile favorites';

  @override
  String get unpinQuickTile => 'Unpin from Quick Tile favorites';

  @override
  String get quickTileButtonSubtitle =>
      'Ipinapakita ang button na ito sa itaas ng quick tile chooser';

  @override
  String get removedFromQuickTileFavorites =>
      'Removed from Quick Tile favorites.';

  @override
  String get pinnedToQuickTileFavorites => 'Pinned to Quick Tile favorites.';

  @override
  String get duplicateAndEdit => 'Duplicate at edit';

  @override
  String get duplicateAndEditSubtitle => 'Create a copy at edit it immediately';

  @override
  String get done => 'Tapos';

  @override
  String get run => 'Run';

  @override
  String get untitledRemote => 'Remote na walang pamagat';

  @override
  String get createRemoteTitle => 'Create remote';

  @override
  String get editRemoteTitle => 'I-edit remote';

  @override
  String get removeButtonTitle => 'Remove button?';

  @override
  String get imageButtonRemovedMessage => 'Ang image button will be removed.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" will be removed.';
  }

  @override
  String get remove => 'Remove';

  @override
  String importedButtonCount(int count) {
    return 'Na-import ang $count button.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Na-import ang $count button mula sa kasalukuyang mga remote.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Change label, signal, at advanced settings';

  @override
  String get createButtonCopySubtitle => 'Gumawa ng kopya ng button na ito';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Create a copy at edit it immediately';

  @override
  String get undoAvailableInNextSnackbar =>
      'You can undo from the next snackbar';

  @override
  String get buttonRemoved => 'Button removed.';

  @override
  String get remoteNameCannotBeEmpty => 'Remote pangalan can\'t be empty.';

  @override
  String get saveRemote => 'I-save ang remote';

  @override
  String get remoteName => 'Remote pangalan';

  @override
  String get remoteNameHint => 'e.g., TV, Air Conditioner, LED Strip';

  @override
  String get remoteNameHelper => 'Ang pangalan appears in iyong Remotes list.';

  @override
  String get layoutStyle => 'Layout style';

  @override
  String get layoutWideDescription =>
      'Wide: 2-column mga button with extra details (recommended).';

  @override
  String get layoutCompactDescription =>
      'Compact: classic 4× grid (icons/text only).';

  @override
  String get importFromRemotes => 'Import from mga remote';

  @override
  String get importFromDatabase => 'Import from DB';

  @override
  String get addButton => 'Add button';

  @override
  String get noButtonsYet => 'Walang mga button yet';

  @override
  String get createRemoteEmptyStateDescription =>
      'Idagdag ang una mong button, saka pindutin ito nang matagal para sa edit o remove na opsyon.';

  @override
  String get createButtonTitle => 'Create Button';

  @override
  String get editButtonTitle => 'I-edit ang Button';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Nabigong i-load ang mga protocol: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Nabigong i-load ang mga database key: $error';
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
  String get completeRequiredFieldsToSave =>
      'Complete kailangan fields to save';

  @override
  String get buttonLabelStepTitle => 'Button label';

  @override
  String get buttonLabelStepSubtitle =>
      'Piliin ang an image, icon, o type a text label.';

  @override
  String get buttonColorStepTitle => 'Button color';

  @override
  String get buttonColorStepSubtitle =>
      'Pumili ng background color para sa button na ito.';

  @override
  String get selectColor => 'Pumili ng kulay:';

  @override
  String get noImageSelected => 'Walang image selected';

  @override
  String get gallery => 'Gallery';

  @override
  String get builtIn => 'Built-in';

  @override
  String get removeImage => 'Remove image';

  @override
  String get requiredSelectImageOrSwitch =>
      'Required: select an image, piliin an icon, o switch to Text.';

  @override
  String get iconSelected => 'Icon selected';

  @override
  String get noIconSelected => 'Walang icon selected';

  @override
  String get chooseIcon => 'Piliin ang Icon';

  @override
  String get removeIcon => 'Remove icon';

  @override
  String get requiredSelectIconOrSwitch =>
      'Required: select an icon o switch to Image/Text.';

  @override
  String get buttonText => 'Button text';

  @override
  String get buttonTextHint => 'e.g., Power, Volume +, HDMI 1';

  @override
  String get buttonTextHelper => 'Ang text will appear on the button.';

  @override
  String get requiredEnterButtonLabel =>
      'Kailangan: maglagay ng label ng button.';

  @override
  String get defaultColorName => 'Default';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Nakagawa ng bagong remote na may isang button mula sa huling hit.';

  @override
  String get selectRemote => 'Select remote';

  @override
  String remoteNumber(Object id) {
    return 'Remote #$id';
  }

  @override
  String get newRemoteCreated => 'New remote created.';

  @override
  String get failedToCreateRemote => 'Nabigo to create remote.';

  @override
  String get newRemoteEllipsis => 'New remote…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Added to $name.';
  }

  @override
  String get failedToAddToRemote => 'Nabigo to add to remote.';

  @override
  String get newRemoteDefaultName => 'New Remote';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Jumped to offset $offset. Paused — press Resume to continue.';
  }

  @override
  String get sent => 'Sent.';

  @override
  String failedToSend(Object error) {
    return 'Nabigong magpadala: $error';
  }

  @override
  String get copiedProtocolCode => 'Copied (protocol:code).';

  @override
  String get savedToResults => 'Saved to Results.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Invalid code para sa protocol: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Copied kasalukuyang candidate.';

  @override
  String get jumpToOffset => 'Jump to offset';

  @override
  String get jumpToBruteCursor => 'Jump to brute cursor';

  @override
  String get jump => 'Jump';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Jumped to cursor 0x$cursor. Paused — press Resume to continue.';
  }

  @override
  String get irSignalTester => 'IR Signal Tester';

  @override
  String get stop => 'Ihinto';

  @override
  String get selectButton => 'Select button';

  @override
  String get buttonNotFoundInRemotes =>
      'Hindi nahanap ang button sa mga remote.';

  @override
  String sentNamed(Object name) {
    return 'Sent \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'Nabigo ang pagpapadala: $error';
  }

  @override
  String get noFavoritesYet => 'Walang favorites yet';

  @override
  String get deviceControlsEmptyHint =>
      'Pindutin nang matagal ang button ng remote at piliin ang “Add to Device Controls”.';

  @override
  String get sendTest => 'Send test';

  @override
  String get testSendCompleted => 'Test send completed.';

  @override
  String testSendFailed(Object error) {
    return 'Nabigo ang test send: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Removed \"$name\".';
  }

  @override
  String get brand => 'Brand';

  @override
  String get model => 'Modelo';

  @override
  String get selectBrand => 'Select brand';

  @override
  String get searchBrand => 'Search brand…';

  @override
  String get selectModel => 'Select modelo';

  @override
  String get searchModel => 'Search modelo…';

  @override
  String get unnamedKey => 'Unnamed key';

  @override
  String get unknown => 'Hindi kilala';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'Search commands';

  @override
  String get noMatchingCommands => 'Walang matching commands';

  @override
  String get quickTileFavoritesTitle => 'Quick tile favorites';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Change mapping para sa $tileLabel tile';
  }

  @override
  String get pickDifferentButton => 'Pick a different button';

  @override
  String get browseAllRemotesEllipsis => 'Browse all mga remote…';

  @override
  String get invalidMacroFileFormat => 'Invalid macro file format.';

  @override
  String get failedToParseMacroFile => 'Nabigo to parse macro file.';

  @override
  String get deviceCodeLabel => 'Device Code';

  @override
  String get commandLabel => 'Command';

  @override
  String get editButtonCodeTitle => 'I-edit ang Code ng button';

  @override
  String get thisRemoteHasNoButtons => 'Ang remote has no mga button.';

  @override
  String get selectCommand => 'Select Command';

  @override
  String get databaseModeAutofillHint =>
      'Awtomatikong pinupunan ng Database mode ang Hakbang 2 para sa iyo, brand, modelo, at protocol. Pagkatapos mag-import ng key, maaari mong ayusin pa ang lahat sa Manual.';

  @override
  String get test => 'Subukan';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'All napiling mga button were duplicates.';

  @override
  String get noButtonsImported => 'Walang mga button imported.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Imported $addedCount button(s). Skipped $skippedCount duplicate(s).';
  }

  @override
  String get importAllMatchingTitle => 'Import all matching mga button?';

  @override
  String get noMatchingKeysFound => 'Walang matching keys found.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Ang will import up to $count matching keys from the kasalukuyang database selection.';
  }

  @override
  String get importAll => 'Import all';

  @override
  String get importingButtons => 'Importing mga button…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'All matching mga button were duplicates.';

  @override
  String get quickPresets => 'Quick presets';

  @override
  String get selectDeviceFirst => 'Select device first';

  @override
  String get searchByLabelOrHex => 'Search by label o hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Optional: refine the $preset preset keys';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Select brand, modelo, at protocol first.';

  @override
  String get importFromDatabaseTitle => 'Import from database';

  @override
  String get importFromDatabaseSubtitle =>
      'Pumili ng device, i-load ang magkakatugmang keys, saka i-import ang mga napiling button.';

  @override
  String get deviceAndFilters => 'Device & filters';

  @override
  String loadedCount(int count) {
    return '$count na-load';
  }

  @override
  String get hideFilters => 'Hide filters';

  @override
  String get showFilters => 'Show filters';

  @override
  String get noProtocolFoundForBrandModel =>
      'Walang protocol found para sa this brand at modelo.';

  @override
  String get protocolAutoDetected => 'Protocol';

  @override
  String get protocolAutoDetectedHelper =>
      'Auto-detected from the database. You can change it before importing.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Select a brand, modelo, at protocol to load keys.';

  @override
  String get noKeysFound => 'Walang keys found.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Walang keys found para sa “$query”.';
  }

  @override
  String get skipDuplicates => 'Skip duplicates';

  @override
  String get skipDuplicatesSubtitle =>
      'Huwag i-import ang mga button na nasa remote na ito.';

  @override
  String get importSelected => 'Import selected';

  @override
  String get noMacrosToExport => 'Walang mga macro to export.';

  @override
  String get macrosExportedToDownloads => 'Macros exported to Downloads.';

  @override
  String get failedToExportMacros => 'Nabigo to export mga macro.';

  @override
  String get failedToReadFile => 'Nabigo to read file.';

  @override
  String get importFromExistingRemotesTitle => 'Import from Existing Remotes';

  @override
  String selectedCount(int count) {
    return '$count selected';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Walang ibang remote na may button ang nahanap.';

  @override
  String get sourceRemote => 'Source remote';

  @override
  String get searchButtons => 'Search mga button';

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
      'Storage pahintulot tinanggihan (needed on some older Android mga device).';

  @override
  String get backupExportedToDownloads => 'Backup exported to Downloads.';

  @override
  String failedToExport(Object error) {
    return 'Nabigong i-export: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Na-import ang $count remote mula sa legacy JSON backup. Hindi binago ang mga macro.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Import nabigo: backup \"mga remote\" must be a JSON list when present.';

  @override
  String get importFailedMacrosMustBeList =>
      'Import nabigo: backup \"mga macro\" must be a JSON list when present.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Nabigo ang import. Hindi wastong backup format. Inaasahan ang legacy List o Map na may remotes o macros.';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Na-import ang $remoteCount remote mula sa backup. Hindi binago ang mga macro.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Na-import ang $remoteCount remote at $macroCount macro mula sa backup.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Import nabigo: no valid mga button found in .ir file.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Imported 1 remote from Flipper .ir. Macros were not changed.';

  @override
  String get importFailedInvalidIrplus =>
      'Import nabigo: hindi wasto irplus file (no valid mga button found).';

  @override
  String get importedOneRemoteFromIrplus =>
      'Imported 1 remote from irplus. Macros were not changed.';

  @override
  String get importFailedInvalidLirc =>
      'Import nabigo: hindi wasto LIRC file (no valid codes/raw codes found).';

  @override
  String get importedOneRemoteFromLirc =>
      'Imported 1 remote from LIRC config. Macros were not changed.';

  @override
  String get unsupportedFileTypeSelected => 'Unsupported file type selected.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Import nabigo: hindi wasto o unreadable file.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Bulk import complete: no supported files found in folder.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Tapos ang maramihang import. Walang na-import na remote. Nilaktawan ang $skippedCount file.';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Tapos ang maramihang import. Na-import ang $importedCount remote mula sa $supportedCount suportadong file. Nilaktawan ang $skippedCount file.';
  }

  @override
  String get storagePermissionDenied => 'Storage pahintulot tinanggihan.';

  @override
  String get bulkImportFailedReadFolder =>
      'Bulk import nabigo: unable to read folder contents.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Tapos ang maramihang import. Walang suportadong file na nahanap, $sourceLabel.';
  }

  @override
  String get clearAction => 'Clear';

  @override
  String get saveAction => 'I-save';

  @override
  String buttonsTitleCount(int count) {
    return 'Buttons ($count)';
  }

  @override
  String get invalidStepEncountered => 'Invalid hakbang encountered';

  @override
  String failedToSendNamed(Object name) {
    return 'Nabigong magpadala: $name';
  }

  @override
  String get buttonNotFound => 'Button not found';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Hindi nahanap ang button: $name';
  }

  @override
  String get unknownButton => 'Hindi kilalang Button';

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
  String get noSteps => 'Walang mga hakbang';

  @override
  String stepProgress(int current, int total) {
    return 'Hakbang $current / $total';
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
    return '$current / $total mga hakbang';
  }

  @override
  String get waiting => 'Waiting';

  @override
  String secondsRemaining(Object seconds) {
    return '${seconds}s natitira';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Tapikin ang Continue when ready para sa the next hakbang';

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
    return 'Maghintay ${ms}ms';
  }

  @override
  String get runAgain => 'Run Again';

  @override
  String get startMacro => 'Start Macro';

  @override
  String get continueAction => 'Continue';

  @override
  String get unnamedRemote => 'Remote na walang pangalan';

  @override
  String get enterMacroName => 'Enter a macro pangalan';

  @override
  String get addAtLeastOneStep => 'Add at least one hakbang';

  @override
  String get fixInvalidSteps => 'Fix hindi wasto mga hakbang';

  @override
  String get unknownCommand => 'Hindi kilala Command';

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
      'Recommended: 250-5000ms para sa most mga device';

  @override
  String get enterValidPositiveNumber => 'Please enter a valid positive number';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Remote';

  @override
  String get macroName => 'Macro Pangalan';

  @override
  String get macroNameHint => 'e.g., i-cybie Advanced Mode';

  @override
  String stepsTitleCount(int count) {
    return 'Steps ($count)';
  }

  @override
  String get noStepsYet => 'Walang mga hakbang yet';

  @override
  String get addCommandsAndDelaysHint =>
      'Add commands at delays below to build iyong sequence';

  @override
  String get addStep => 'Add Hakbang';

  @override
  String get reorderStepsHint =>
      'Tip: Drag the handle to reorder mga hakbang. Tapikin ang a hakbang to edit it.';

  @override
  String reorderStep(int index) {
    return 'Reorder hakbang $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Press at drag to change hakbang order';

  @override
  String deleteStep(int index) {
    return 'Delete hakbang $index';
  }

  @override
  String get invalidStepTapToFix => 'Invalid hakbang — tapikin to fix';

  @override
  String get sendIrCommand => 'Send IR command';

  @override
  String get waitForUserConfirmation => 'Maghintay para sa user confirmation';

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
  String get noSignalInfo => 'Walang signal info';

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
  String get start => 'Simulan';

  @override
  String get resume => 'Ipagpatuloy';

  @override
  String get pause => 'I-pause';

  @override
  String get stopped => 'Stopped';

  @override
  String get copy => 'Kopyahin';

  @override
  String get send => 'Send';

  @override
  String get step => 'Hakbang';

  @override
  String get addToRemote => 'Add to remote';

  @override
  String get noDescriptionAvailable => 'Walang description available.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Kaseikyo vendor must be exactly 4 hex digits.';

  @override
  String get irFinderDatabaseNotReady => 'Database is not ready yet.';

  @override
  String get irFinderSelectBrandFirst => 'Select a brand first in Setup.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute-force is not available para sa this protocol yet.';

  @override
  String get irFinderInvalidPrefix => 'Invalid prefix.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Brand: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Modelo: $value';
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
  String get irFinderTestTab => 'Subukan';

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
      'Wala pang saved hits. Sa Test page, pindutin ang \"Save hit\" kapag tumugon ang device.';

  @override
  String get irFinderBackToTest => 'Back to Test';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Large search space';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Napakalaki ng brute-force space na ito ($human possibilities). Igagalang pa rin ng IR Finder ang max attempts at cooldown mo, pero mag-ingat sa pag-spam ng mga IR device.\n\nRekomendasyon: gamitin muna ang Database mode at maglagay ng kilalang prefix bytes para lumiit ang space.';
  }

  @override
  String get irFinderDatabaseSession => 'Database session';

  @override
  String get irFinderBruteforceSession => 'Brute-force session';

  @override
  String get irFinderResumeLastSession => 'Resume last session';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Brand: $brand · Modelo: $model';
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
      'Controls encoding at tditofore the search space.';

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
      'Brute-force is not configured para sa this protocol yet.';

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
    return 'Slider range: 1–$max (type any number para sa larger values)';
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
      'Tip: gamitin muna ang Database mode. Pinakamainam ang brute-force kapag may kilalang prefix, halimbawa ang unang 1 hanggang 4 bytes.';

  @override
  String get irFinderDatabaseInitFailed => 'Database initialization nabigo.';

  @override
  String get irFinderPreparingDatabase => 'Preparing local IR code database…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Database-assisted search';

  @override
  String get irFinderBrand => 'Brand';

  @override
  String get irFinderSelectBrand => 'Select brand';

  @override
  String get irFinderModelOptional => 'Modelo (optional)';

  @override
  String get irFinderSelectBrandFirstShort => 'Select a brand first';

  @override
  String get irFinderSelectModelRecommended => 'Select a modelo (recommended)';

  @override
  String get irFinderOnlySelectedProtocol => 'Only napiling protocol';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Filters keys to the napiling protocol. Disable it to browse all protocols.';

  @override
  String get irFinderQuickWinsFirst => 'Quick wins first';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Prioritizes POWER, MUTE, VOL, at CH style keys before deeper keys.';

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
  String get irFinderRetryLast => 'Subukan muli last';

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
      'Sinusuportahan agad ng resulta ang Test at Copy. Maaari pang palawakin ang direktang add to remote integration sa daloy ng editor.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Browse DB candidates';

  @override
  String get irFinderFilterByLabelOrHex => 'Filter by label o hex…';

  @override
  String get irFinderJumpHere => 'Jump dito';

  @override
  String get irFinderSelectModel => 'Select modelo';

  @override
  String get irFinderSearchBrands => 'Search brands…';

  @override
  String get irFinderSearchModels => 'Search models…';

  @override
  String get iconPickerTitle => 'Select Icon';

  @override
  String get iconPickerSearchHint => 'Search icons...';

  @override
  String get iconPickerNoIconsFound => 'Walang icons found';

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
  String get iconPickerCategorySettings => 'Mga Setting';

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
      'Iniikot ng Universal Power ang mga IR power code. Gamitin lamang ito sa mga device na pag-aari o kontrolado mo. Ihinto agad kapag tumugon ang device.';

  @override
  String get universalPowerConsentCheckbox => 'I own o control the device';

  @override
  String get universalPowerSetupBody =>
      'Iniikot ang mga power code para sa napili mong brand. Ihinto agad kapag tumugon ang device.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Last sent: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Walang power codes found. Try broadening the search.';

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
  String get iconNamePause => 'I-pause';

  @override
  String get iconNameStop => 'Ihinto';

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
  String get iconNameCancel => 'Kanselahin';

  @override
  String get iconNameClose => 'Isara';

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
  String get iconNameSettings => 'Mga Setting';

  @override
  String get iconNameMenu => 'Menu';

  @override
  String get iconNameMoreVertical => 'More Vertical';

  @override
  String get iconNameMoreHorizontal => 'More Horizontal';

  @override
  String get iconNameTune => 'Tune';

  @override
  String get iconNameRemoteSettings => 'Mga Setting ng Remote';

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
  String get iconNameLightMode => 'Maliwanag na Mode';

  @override
  String get iconNameDarkMode => 'Madilim na Mode';

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
  String get iconNameDone => 'Tapos';

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
  String get iconNameLight => 'Maliwanag';

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
  String get iconNameSearch => 'Hanapin';

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
  String get iconNameDelete => 'Burahin';

  @override
  String get iconNameEdit => 'I-edit';

  @override
  String get iconNameSave => 'I-save';

  @override
  String get iconNameShare => 'Share';

  @override
  String get iconNamePrint => 'Print';

  @override
  String get iconNameLanguage => 'Wika';

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
  String get iconNameLoadingFa => 'Naglo-load FA';

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
  String get unknownLabel => 'Hindi kilala';

  @override
  String get selectedFilesLabel => 'napiling file(s)';

  @override
  String get folderNotFoundOrInaccessible => 'Folder not found o inaccessible.';

  @override
  String get importedRemoteDefaultName => 'ImportedRemote';

  @override
  String get demoRemoteName => 'Demo Remote';

  @override
  String get protocolFieldsInvalid =>
      'Fill kailangan protocol fields at ensure frequency is 15k–60k if set.';

  @override
  String get unknownProtocolSelected => 'Hindi kilala protocol selected.';

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
  String get learningModeCaptureFailed => 'Nabigo ang pag-aaral ng pagkuha.';

  @override
  String get learningModeReplaySent => 'Ang natutunang signal ay na-replay.';

  @override
  String get learningModeReplayFailed =>
      'Hindi ma-replay ang natutunang signal.';

  @override
  String get learningModeNoRemotesAvailable => 'Wala pang naka-save na remote.';

  @override
  String get learningModeChooseRemoteTitle => 'Pumili ng remote';

  @override
  String get learningModeNewRemoteTitle => 'Gumawa ng bagong remote';

  @override
  String get learningModeSaveSuccess => 'Na-save ang natutunan na button.';

  @override
  String get learningModeSaveFailed => 'Hindi ma-save ang button na natutunan.';

  @override
  String get remoteSetupIntro =>
      'Pumili muna ng pangalan at layout. Maaari kang magdagdag ng mga button pagkatapos.';

  @override
  String get startWithDefault => 'Magsimula sa default';

  @override
  String get browseGithubStore => 'Buksan ang GitHub Store';

  @override
  String get addFirstButton => 'Idagdag ang unang button';

  @override
  String get moreWaysToStart => 'Iba pang paraan para magsimula';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Itapon ang bagong setup ng remote na ito at umalis sa screen na ito?';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Itapon ang mga pagbabago sa remote at umalis sa screen na ito?';

  @override
  String get firstButtonAdded => 'Naidagdag ang unang button.';

  @override
  String get iconColorTitle => 'Kulay ng icon';

  @override
  String get iconColorHelper =>
      'Pumili ng kulay ng simbolo na mananatiling malinaw sa ibabaw ng background ng button.';

  @override
  String get colorRed => 'Pula';

  @override
  String get colorPink => 'Rosas';

  @override
  String get colorPurple => 'Lila';

  @override
  String get colorDeepPurple => 'Madilim na lila';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorBlue => 'Asul';

  @override
  String get colorLightBlue => 'Mapusyaw na asul';

  @override
  String get colorCyan => 'Cyan';

  @override
  String get colorTeal => 'Teal';

  @override
  String get colorGreen => 'Berde';

  @override
  String get colorLightGreen => 'Mapusyaw na berde';

  @override
  String get colorLime => 'Lime';

  @override
  String get colorYellow => 'Dilaw';

  @override
  String get colorAmber => 'Amber';

  @override
  String get colorOrange => 'Kahel';

  @override
  String get colorDeepOrange => 'Madilim na kahel';

  @override
  String get colorBrown => 'Kayumanggi';

  @override
  String get colorGrey => 'Abo';

  @override
  String get colorBlueGrey => 'Asul-abong';

  @override
  String get colorBlack => 'Itim';

  @override
  String get colorWhite => 'Puti';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Kulay ng button na $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Kulay ng button na $colorName, napili';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Kulay ng icon na $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Kulay ng icon na $colorName, napili';
  }
}
