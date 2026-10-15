// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'جار التحميل…';

  @override
  String get unknownError => 'خطأ غير معروف';

  @override
  String get failedToStart => 'تعذر البدء';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get quickTilePower => 'تشغيل';

  @override
  String get quickTileMute => 'كتم';

  @override
  String get quickTileVolumeUp => 'الصوت +';

  @override
  String get quickTileVolumeDown => 'الصوت -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'تم اكتشاف محوّل IR USB. اسمح بالوصول إلى USB لإرسال الأوامر.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'تم رفض الوصول إلى USB. اطلب الإذن مجددًا واسمح بالوصول لإرسال الأوامر.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'الوصول إلى USB مسموح، لكن المحوّل ليس جاهزًا بعد.';

  @override
  String get homeUsbOpenFailedMessage =>
      'تعذّر الاتصال بمحوّل USB رغم السماح بالوصول. افصله ثم أعد توصيله وحاول مجددًا.';

  @override
  String get homeUsbReadyMessage => 'محوّل IR USB جاهز.';

  @override
  String get homeUsbNoDeviceMessage =>
      'هذا الهاتف لا يحتوي على مرسل IR مدمج، ولا يوجد محوّل IR USB مدعوم متصل.';

  @override
  String get homeUsbOptionPlugIn =>
      'وصّل محوّل IR USB مدعومًا واسمح بالوصول إليه.';

  @override
  String get homeUsbOptionReady => 'جاهز للإرسال.';

  @override
  String get homeUsbOptionPermissionRequired => 'متصل. اسمح بالوصول إلى USB.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'الوصول مرفوض. اطلب الإذن مجددًا.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'الوصول مسموح. في انتظار المحوّل.';

  @override
  String get homeUsbOptionOpenFailed => 'تعذّر الاتصال. أعد توصيل المحوّل.';

  @override
  String get homeHardwareBannerNoInternal =>
      'لا يوجد مرسل IR مدمج. استخدم محوّل IR USB متوافقًا أو ملحقًا يحوّل الصوت إلى أشعة تحت الحمراء.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'متصل. اسمح بالوصول إلى USB.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'الوصول مرفوض. اطلب الإذن مجددًا.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'الوصول مسموح. في انتظار المحوّل.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'تعذّر الاتصال. أعد توصيل المحوّل.';

  @override
  String get homeHardwareBannerReady => 'جاهز للإرسال.';

  @override
  String get homeHardwareRequiredTitle => 'يلزم مرسل للأشعة تحت الحمراء';

  @override
  String get homeUsbDongleRecommended => 'محوّل IR USB (موصى به)';

  @override
  String get homeAudioAdapterAlternative => 'محوّل IR عبر الصوت';

  @override
  String get homeAudioAdapterDescription =>
      'يلزم محوّل صوت إلى IR. اختر الصوت (LED واحد أو اثنان) في الإعدادات وارفع مستوى صوت الوسائط.';

  @override
  String get close => 'إغلاق';

  @override
  String get homeChooseTransmitter => 'اختيار المرسل';

  @override
  String get openSettings => 'فتح الإعدادات';

  @override
  String get homeUsbPermissionSentApprove =>
      'تم طلب الإذن. اسمح بالوصول إلى USB في نافذة Android.';

  @override
  String get homeUsbDongleNotDetected =>
      'لم يتم العثور على محوّل IR USB مدعوم. وصّله وحاول مجددًا.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'تعذّر طلب الوصول إلى USB. حاول مجددًا.';

  @override
  String get working => 'جارٍ التنفيذ…';

  @override
  String get requestUsbPermission => 'طلب الوصول إلى USB';

  @override
  String get homeHardwareTip =>
      'يمكنك إعداد أجهزة التحكم الآن. تحتاج إلى مرسل IR فقط عند إرسال الأوامر.';

  @override
  String get homeNoIrTransmitterTitle => 'لا يوجد مرسل IR متاح';

  @override
  String get homeHardwareRequiredBody =>
      'يمكنك إنشاء أجهزة التحكم وتنظيمها دون مرسل IR. للتحكم في جهاز، استخدم أحد الخيارات أدناه.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'لا يزال بإمكانك إنشاء أجهزة التحكم واستيرادها وتنظيمها.';

  @override
  String get homeWaysToUseIrBlaster => 'خيارات الأجهزة';

  @override
  String get homeBuiltInIrOptionTitle => 'مرسل IR مدمج';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'تحتوي بعض الهواتف على مرسل IR مدمج. هذا الهاتف لا يحتوي عليه.';

  @override
  String get homeBuiltInIrUnavailable => 'غير مدمج في هذا الهاتف';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'محوّل صوت إلى IR';

  @override
  String get homeContinueWithoutHardware => 'المتابعة دون إرسال';

  @override
  String get homeHowItWorks => 'طريقة الاستخدام';

  @override
  String get settingsNavLabel => 'الإعدادات';

  @override
  String get dismiss => 'تجاهل';

  @override
  String get remotesNavLabel => 'أجهزة التحكم';

  @override
  String get macrosNavLabel => 'الماكرو';

  @override
  String get signalTesterNavLabel => 'مختبر الإشارة';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get remoteNoIrEmitterTitle => 'مرسل الأشعة تحت الحمراء غير متاح';

  @override
  String get remoteNoIrEmitterMessage =>
      'لم يُكتشف مرسل أشعة تحت الحمراء متاح للاستخدام.';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'لإرسال الإشارات، تحتاج إلى مرسل مدمج في الهاتف أو مرسل خارجي متوافق.';

  @override
  String get remoteDismiss => 'متابعة التصفح';

  @override
  String get remoteClose => 'إغلاق التطبيق';

  @override
  String remoteFailedToSend(Object error) {
    return 'فشل إلى send IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'فشل إلى start loop: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Loop stopped (send فشل): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'يتم الآن تكرار \"$title\". اضغط إيقاف في الشريط العلوي للتوقف.';
  }

  @override
  String get remoteLoopStopped => 'Loop stopped.';

  @override
  String get remoteUpdatedNotFound =>
      'تم تحديث جهاز التحكم على الشاشة. لم يتم العثور عليه في القائمة المحفوظة.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'تم تحديث \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'تعذّر حذف جهاز التحكم: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'لم يُعثر على جهاز التحكم في القائمة المحفوظة.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'حُذف جهاز التحكم «$name».';
  }

  @override
  String get buttonFallbackTitle => 'زر';

  @override
  String get imageFallbackTitle => 'Image';

  @override
  String get noBrowserAvailable => 'No browser available';

  @override
  String failedToOpen(Object error) {
    return 'فشل الفتح: $error';
  }

  @override
  String get cancel => 'إلغاء';

  @override
  String get settingsRestoreDemoTitle => 'استعادة أجهزة التحكم التجريبية؟';

  @override
  String get settingsRestoreDemoMessage =>
      'سيؤدي هذا إلى استبدال أجهزة التحكم الحالية بالأجهزة التجريبية المدمجة. يُنصح بأخذ نسخة احتياطية إذا كنت تريد الاحتفاظ بالقائمة الحالية.';

  @override
  String get settingsRestoreDemoConfirm => 'استعادة التجريبي';

  @override
  String get settingsDemoRemotesRestored => 'تمت استعادة الأجهزة التجريبية.';

  @override
  String get settingsDeleteAllRemotesTitle => 'حذف all remotes?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'سيؤدي هذا إلى إزالة كل أجهزة التحكم من هذا الجهاز. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get settingsDeleteAllConfirm => 'حذف الكل';

  @override
  String get settingsAllRemotesDeleted => 'الكل remotes deleted.';

  @override
  String get themeAuto => 'تلقائي Theme';

  @override
  String get themeLight => 'فاتح Theme';

  @override
  String get themeDark => 'داكن Theme';

  @override
  String get themeDescAuto => 'يتبع إعدادات جهازك';

  @override
  String get themeDescLight => 'مشرق وواضح دائماً';

  @override
  String get themeDescDark => 'مريح للعين';

  @override
  String get themeHintAuto =>
      'يتبدل المظهر تلقائياً عند تغيير إعدادات جهازك بين الوضع الفاتح والداكن';

  @override
  String get themeHintLight => 'مثالي للاستخدام النهاري والأماكن المضيئة جيداً';

  @override
  String get themeHintDark =>
      'يقلل إجهاد العين في الإضاءة المنخفضة ويوفر البطارية على شاشات OLED';

  @override
  String get supportDevelopmentTitle => 'دعم التطوير';

  @override
  String get supportDevelopmentSubtitle =>
      'ساعد على إبقاء IR Blaster محدثاً ومتوافقاً مع العتاد';

  @override
  String get supportDevelopmentBody =>
      'لا إعلانات، ولا تتبع، ولا ميزات مقفلة. دعمك يمول عمل البروتوكولات، ودعم دونجل USB، وتحسين التوافق بين الأجهزة.';

  @override
  String get donate => 'تبرع';

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
  String get supportPillOpenSource => 'فتح-source';

  @override
  String get appearanceTitle => 'Appearance';

  @override
  String get appearanceSubtitle => 'خصص تجربتك البصرية';

  @override
  String get localizationTitle => 'الترجمة';

  @override
  String get localizationSubtitle => 'لغة التطبيق وسلوك الترجمة';

  @override
  String localizationAutoUsing(Object language) {
    return 'تلقائي، يستخدم $language';
  }

  @override
  String get localizationAutoDescription => 'يتبع التطبيق لغة جهازك متى أمكن.';

  @override
  String get localizationManualDescription => 'تم ضبط لغة التطبيق يدوياً.';

  @override
  String get useSystemLanguageTitle => 'استخدام لغة النظام';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'يتبع لغة جهازك: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'استخدم اللغة المحددة أدناه بدلاً من لغة الجهاز الافتراضية.';

  @override
  String get chooseAppLanguage => 'اختر لغة التطبيق';

  @override
  String get languagePickerDisabledHint =>
      'أوقف لغة النظام لاختيار لغة يدوياً.';

  @override
  String get searchLanguages => 'ابحث عن اللغات';

  @override
  String get noLanguagesFound => 'لا توجد لغات مطابقة';

  @override
  String get localizationHint =>
      'عند تفعيل لغة النظام، يتبع التطبيق إعداد اللغة في جهازك ويعود إلى الإنجليزية إذا لم تتوفر ترجمة. أوقفه لقفل التطبيق على لغة محددة.';

  @override
  String get appLanguageTitle => 'لغة التطبيق';

  @override
  String get appLanguageHint =>
      'الوضع التلقائي يتبع لغة جهازك. اختر الإنجليزية أو الفرنسية هنا لتطبيقها على التطبيق فقط.';

  @override
  String get languageAuto => 'تلقائي، النظام';

  @override
  String get languageAutoDescription => 'اتبع لغة جهازك تلقائياً';

  @override
  String get languageEnglish => 'الإنجليزية';

  @override
  String get languageEnglishDescription =>
      'اجعل التطبيق يستخدم الإنجليزية دائماً';

  @override
  String get languageFrench => 'الفرنسية';

  @override
  String get languageFrenchDescription => 'اجعل التطبيق يستخدم الفرنسية دائماً';

  @override
  String get languageAutoShort => 'تلقائي';

  @override
  String get languageEnglishShort => 'الإنجليزية';

  @override
  String get languageFrenchShort => 'الفرنسية';

  @override
  String get useDynamicColors => 'Use dynamic colors';

  @override
  String get themeChoiceAuto => 'تلقائي';

  @override
  String get themeChoiceLight => 'فاتح';

  @override
  String get themeChoiceDark => 'داكن';

  @override
  String get irTransmitterTitle => 'IR Transmitter';

  @override
  String get irTransmitterSubtitle => 'اختر التي hardware sends IR commands';

  @override
  String get learningModeEntryTitle => 'تعلّم الإشارات';

  @override
  String get learningModeEntrySubtitle =>
      'انسخ إشارة الأشعة تحت الحمراء لأحد أزرار جهاز التحكم.';

  @override
  String get learningModeTitle => 'تعلّم الإشارات';

  @override
  String get learningModeHeroTitle => 'تعلم زر التحكم عن بعد بشكل نظيف';

  @override
  String get learningModeHeroSubtitle =>
      'قم بإعداد جهاز الاستقبال الخاص بك، وقم بإعداد جهاز التحكم عن بعد الأصلي، والتقط أمرًا واحدًا، ثم قم بمراجعته قبل حفظه في جهاز التحكم عن بعد.';

  @override
  String get learningModeReadyBadge => 'المتلقي جاهز';

  @override
  String get learningModeNeedsPermissionBadge => 'إذن USB مطلوب';

  @override
  String get learningModeSetupBadge => 'يلزم إعداد جهاز الاستقبال';

  @override
  String get learningModeNoReceiverBadge => 'لا يوجد استقبال التعلم';

  @override
  String get learningModeCheckingBadge => 'فحص الأجهزة';

  @override
  String get learningModeFourStepFlow => 'تدفق موجه من 4 خطوات';

  @override
  String get learningModeSaveAnywhereBadge => 'المراجعة قبل الحفظ';

  @override
  String get learningModeGuideTitle =>
      'التقط المكان الذي يجب أن يحدث فيه الالتقاط';

  @override
  String get learningModeStepHardwareShort => 'الأجهزة';

  @override
  String get learningModeStepPrepareShort => 'يحضر';

  @override
  String get learningModeStepCaptureShort => 'يأسر';

  @override
  String get learningModeStepReviewShort => 'مراجعة';

  @override
  String get learningModeStepHardwareTitle => 'تحقق من أجهزة الاستقبال';

  @override
  String get learningModeStepHardwareSubtitle =>
      'تأكد من توصيل جهاز استقبال تعليمي متوافق واعتماده قبل البدء.';

  @override
  String get learningModeCurrentSenderLabel => 'الارسال الحالي';

  @override
  String get learningModeReceiverStatusLabel => 'حالة التعلم';

  @override
  String get learningModeCheckingHardwareBody =>
      'جارٍ فحص المرسل ومستقبل الأشعة تحت الحمراء.';

  @override
  String get learningModeHardwareReadyBody =>
      'يتم توصيل دونجل USB IR وتهيئته. هذا هو المكان المناسب لبدء تدفق التعلم بمجرد توصيل أسلاك الالتقاط.';

  @override
  String get learningModeHardwarePermissionBody =>
      'اسمح بالوصول إلى محوّل USB، ثم ابدأ تعلّم الإشارة.';

  @override
  String get learningModeHardwareSetupBody =>
      'المستقبل غير جاهز. تحقّق من إعداده أو أعد توصيله، ثم حاول مجددًا.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'وصّل مستقبل أشعة تحت الحمراء متوافقًا لتعلّم إشارات جهاز التحكم.';

  @override
  String get learningModeRefreshHardware => 'فحص المستقبل';

  @override
  String get learningModeHardwareTipTitle => 'أفضل موضع';

  @override
  String get learningModeHardwareTipBody =>
      'يوجد وضع التعلم ضمن جهاز إرسال الأشعة تحت الحمراء لأنه يعتمد على توفر الأجهزة ويتم استخدامه بشكل أقل من إرسال أجهزة التحكم عن بعد.';

  @override
  String get learningModeStepPrepareTitle => 'تحضير جهاز التحكم عن بعد الأصلي';

  @override
  String get learningModeStepPrepareSubtitle =>
      'قرر ما تتعلمه، ثم احتفظ بجهاز التحكم عن بعد الأصلي ثابتًا وقريبًا من جهاز الاستقبال.';

  @override
  String get learningModeButtonNameLabel => 'اسم الزر';

  @override
  String get learningModeButtonNameHint => 'مثل: التشغيل، HDMI 1، القائمة';

  @override
  String get learningModeSinglePress => 'ضغطة واحدة';

  @override
  String get learningModeHoldButton => 'زر الضغط';

  @override
  String get learningModePreparationChecklistTitle => 'قبل أن تلتقط';

  @override
  String get learningModePreparationItemDistance =>
      'احتفظ بجهاز التحكم عن بعد الأصلي على بعد 2 إلى 5 سم تقريبًا من جهاز الاستقبال.';

  @override
  String get learningModePreparationItemOneButton =>
      'تعلم زرًا واحدًا في كل مرة واستخدم ضغطة قصيرة ونظيفة أولاً.';

  @override
  String get learningModePreparationItemStill =>
      'حافظ على ثبات كلا الجهازين لتجنب التقاط الصور الصاخبة أو الجزئية.';

  @override
  String get learningModeStepCaptureTitle => 'التقط الإشارة';

  @override
  String get learningModeStepCaptureSubtitle =>
      'استمع لأمر واحد، ثم قم بقفل النتيجة قبل مراجعتها.';

  @override
  String get learningModeCaptureReadyTitle => 'جاهز للاستماع';

  @override
  String get learningModeCaptureReadyBody =>
      'حالة أجهزتك تبدو جيدة. سيتم توصيل الواجهة الخلفية للالتقاط بهذه الخطوة التالية.';

  @override
  String get learningModeCaptureBlockedTitle => 'الأجهزة ليست جاهزة بعد';

  @override
  String get learningModeCaptureBlockedBody =>
      'لا يزال بإمكانك مراجعة التدفق الآن، ولكن يجب أن ينتظر الالتقاط حتى يصبح جهاز الاستقبال جاهزًا.';

  @override
  String get learningModeStartListening => 'بدء الاستقبال';

  @override
  String get learningModeCaptureStubTitle => 'التقاط الخلفية يأتي بعد ذلك';

  @override
  String get learningModeCaptureStubBody =>
      'يتم دعم هذه الشاشة بالكامل أولاً حتى يمكن توصيل تدفق الالتقاط النهائي بحالات الأجهزة الحقيقية بدلاً من تثبيته لاحقًا.';

  @override
  String get learningModeCaptureStubMessage =>
      'التقاط التعلم ليس سلكيًا بعد. تعمل هذه الشاشة على دعم التدفق الكامل أولاً.';

  @override
  String get learningModeUnnamedCapture => 'إشارة بلا اسم';

  @override
  String get learningModeStatusCheckingTitle => 'جارٍ فحص المستقبل';

  @override
  String get learningModeStatusNoReceiverTitle => 'المستقبل غير جاهز';

  @override
  String get learningModeStatusPermissionTitle => 'يلزم إذن USB';

  @override
  String get learningModeStatusSetupTitle => 'يلزم إعداد المستقبل';

  @override
  String get learningModeStatusReadyTitle => 'جاهز للتعلّم';

  @override
  String get learningModeStatusListeningTitle => 'بانتظار الإشارة';

  @override
  String get learningModeStatusCapturedTitle => 'تم استقبال الإشارة';

  @override
  String get learningModeStatusReadyBody =>
      'قم بتسمية الزر، وقم بتوجيه جهاز التحكم عن بعد الأصلي نحو جهاز الاستقبال، وابدأ في الاستماع عندما تكون جاهزًا.';

  @override
  String get learningModeStatusListeningBody =>
      'وجّه جهاز التحكم الأصلي نحو المستقبل واضغط على الزر مرة واحدة.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'تم استقبال إشارة $buttonName. أرسلها للتأكد من استجابة الجهاز، ثم احفظها.';
  }

  @override
  String get learningModeConnectReceiverTitle => 'وصّل مستقبل أشعة تحت الحمراء';

  @override
  String get learningModeConnectReceiverBody =>
      'يعتمد وضع التعلم على الأجهزة الخارجية التي يمكنها استقبال الأشعة تحت الحمراء. بمجرد اكتشاف جهاز الاستقبال والترخيص له، تصبح هذه الصفحة بمثابة تدفق مباشر للاستماع والاختبار والحفظ.';

  @override
  String get learningModeListenCardTitle => 'استمع لزر واحد';

  @override
  String get learningModeListenCardBody =>
      'قم بتعيين الملصق أولاً إذا كنت تريد ذلك، ثم ابدأ الاستماع واضغط على الزر الموجود على جهاز التحكم عن بعد الأصلي.';

  @override
  String get learningModeReadyToListenTitle => 'جاهز للاستقبال';

  @override
  String get learningModeReadyToListenBody =>
      'وجّه جهاز التحكم الأصلي نحو المستقبل، ثم ابدأ استقبال الإشارة.';

  @override
  String get learningModeListeningNowTitle => 'بانتظار الإشارة';

  @override
  String get learningModeListeningNowBody =>
      'اضغط على زر التحكم عن بعد الأصلي مرة واحدة. استخدم التقاط المعاينة للتنقل عبر بقية السقالة قبل أن يتم توصيل واجهة الالتقاط الخلفية الحقيقية.';

  @override
  String get learningModePreviewCaptureAction => 'معاينة الإشارة الملتقطة';

  @override
  String get learningModeCapturedSummary => 'الإشارة المستقبلة';

  @override
  String get learningModeResultActionsTitle => 'اختبار وحفظ';

  @override
  String get learningModeResultActionsBody =>
      'أرسل الإشارة وتأكد من استجابة الجهاز قبل حفظ الزر.';

  @override
  String get learningModeReplayAction => 'إرسال مجددًا';

  @override
  String get learningModeReplayStubMessage =>
      'إعادة التشغيل ليست سلكية بعد. هذه هي دعامة واجهة المستخدم لتدفق التعلم والاختبار والحفظ النهائي.';

  @override
  String get learningModeSaveStubMessage =>
      'الحفظ ليس سلكيًا بعد. الخطوة التالية هي توصيل هذه الشاشة بـ \"إنشاء زر\" وأجهزة التحكم عن بعد الموجودة.';

  @override
  String get learningModeLearnAnotherAction => 'تعلّم زر آخر';

  @override
  String get learningModeStepReviewTitle => 'مراجعة وحفظ';

  @override
  String get learningModeStepReviewSubtitle =>
      'قم بتأكيد ما تعلمته، ثم اختر المكان الذي يجب أن يكون موجودًا فيه في مكتبتك البعيدة.';

  @override
  String get learningModeSaveToExistingRemote => 'جهاز تحكم محفوظ';

  @override
  String get learningModeCreateNewRemote => 'جهاز تحكم جديد';

  @override
  String get learningModeProtocolPreviewTitle => 'معاينة البروتوكول';

  @override
  String get learningModeProtocolPreviewBody =>
      'ستظهر هنا تفاصيل البروتوكول الذي تم فك تشفيره بمجرد أن يلتقط جهاز الاستقبال ضغطة زر نظيفة.';

  @override
  String get learningModeRawPreviewTitle => 'البيانات الخام';

  @override
  String get learningModeRawPreviewBody =>
      'إذا لم يكتمل فك التشفير، فسيظل التقاط التوقيت الأولي متاحًا هنا للمراجعة والحفظ.';

  @override
  String get learningModeSaveCapture => 'حفظ الإشارة';

  @override
  String get learningModeReviewTipTitle => 'أين سيذهب هذا بعد ذلك';

  @override
  String get learningModeReviewTipBody =>
      'يجب أن تقوم خطوة التنفيذ التالية بتوصيل لوحة المراجعة هذه بزر الإنشاء وأجهزة التحكم عن بعد الموجودة بحيث تنخفض الإشارة المستفادة مباشرة إلى مكتبتك.';

  @override
  String get learningModeFinishPreview => 'إنهاء المعاينة';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interaction';

  @override
  String get interactionSubtitle => 'استجابة اللمس وتخطيط جهاز التحكم';

  @override
  String get autoOpenLastRemoteTitle => 'فتح آخر جهاز تحكم عند بدء التشغيل';

  @override
  String get autoOpenLastRemoteSubtitle =>
      'يفتح آخر جهاز تحكم تم استخدامه عند بدء التطبيق. إذا لم يعد متاحًا، فستظهر قائمة أجهزة التحكم.';

  @override
  String get hapticFeedbackTitle => 'Haptic feedback';

  @override
  String get hapticFeedbackSubtitle => 'اهتزاز عند اللمس والإجراءات';

  @override
  String get forceInAppVibrationTitle => 'فرض الاهتزاز داخل التطبيق';

  @override
  String get forceInAppVibrationSubtitle =>
      'استخدام الهزاز مباشرة حتى إذا كان اللمس الارتدادي للنظام معطلاً';

  @override
  String get forceInAppVibrationWarning =>
      'خيار متقدم. قد يجعل التطبيق يهتز حتى عندما يكون اللمس الارتدادي في أندرويد معطلاً على مستوى النظام.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'تم تعطيل اهتزاز النظام في أندرويد. لا يمكن للاهتزاز داخل التطبيق تجاوزه على هذا الجهاز.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'لا يبلّغ هذا الجهاز عن وجود محرك اهتزاز، لذلك لا يمكن أن يعمل الاهتزاز داخل التطبيق.';

  @override
  String get intensity => 'Intensity';

  @override
  String get intensityLight => 'فاتح';

  @override
  String get intensityMedium => 'Medium';

  @override
  String get intensityStrong => 'Strong';

  @override
  String get remoteButtonMetadataTitle => 'إظهار التسميات التقنية للأزرار';

  @override
  String get remoteButtonMetadataSubtitle =>
      'اعرض البروتوكول والرمز وتردد الإرسال على أزرار جهاز التحكم.';

  @override
  String get remoteButtonMetadataShown => 'تم إظهار التسميات التقنية للأزرار.';

  @override
  String get remoteButtonMetadataHidden => 'تم إخفاء التسميات التقنية للأزرار.';

  @override
  String get flipRemoteDefaultTitle => 'Flip جهاز التحكم عرض by default';

  @override
  String get flipRemoteDefaultSubtitle =>
      'فتح جهاز التحكم screens rotated 180° (for bottom-mounted USB dongles).';

  @override
  String get remoteViewFlipped => 'سيفتح عرض جهاز التحكم بوضع مقلوب.';

  @override
  String get remoteViewNormal => 'سيفتح عرض جهاز التحكم بشكل عادي.';

  @override
  String get backupTitle => 'نسخة احتياطية';

  @override
  String get backupSubtitle => 'استيراد أو تصدير أجهزة التحكم والماكرو';

  @override
  String get importBackup => 'استيراد نسخة احتياطية';

  @override
  String get importBackupSubtitle =>
      'استيراد نسخة أجهزة التحكم أو الماكرو أو ملفات Flipper Zero أو LIRC أو IRPLUS';

  @override
  String get bulkImportFolder => 'Bulk import folder';

  @override
  String get bulkImportFolderSubtitle => 'استيراد multiple remotes من a folder';

  @override
  String get exportBackup => 'تصدير نسخة احتياطية';

  @override
  String get exportBackupSubtitle =>
      'احفظ أجهزة التحكم والماكرو في ملف JSON واحد داخل التنزيلات';

  @override
  String get restoreDemoRemotes => 'استعادة الأجهزة التجريبية';

  @override
  String get restoreDemoRemotesSubtitle =>
      'استبدال الأجهزة الحالية بالنسخة التجريبية المدمجة';

  @override
  String get deleteAllRemotes => 'حذف all remotes';

  @override
  String get deleteAllRemotesSubtitle => 'إزالة كل أجهزة التحكم من هذا الجهاز';

  @override
  String get backupTip =>
      'ملاحظة: صدّر نسخة احتياطية قبل التعديلات الكبيرة. يدعم الاستيراد النسخ الكاملة ونسخ JSON القديمة الخاصة بالأجهزة فقط وملفات Flipper Zero بصيغة .ir.';

  @override
  String get aboutTitle => 'حول';

  @override
  String get aboutSubtitle => 'معلومات التطبيق وتفاصيل المصدر المفتوح';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Version $version';
  }

  @override
  String get sourceCode => 'المصدر Code';

  @override
  String get viewOnGitHub => 'عرض on GitHub';

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
  String get openSourceLicense => 'فتح-source license';

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
  String get openSourceLicenses => 'فتح source licenses';

  @override
  String byCreator(Object creator) {
    return 'by $creator';
  }

  @override
  String get deviceControlsTitle => 'الجهاز Controls';

  @override
  String get deviceControlsSubtitle =>
      'اعرض الأزرار المفضلة في صفحة عناصر تحكم النظام';

  @override
  String get manageFavorites => 'إدارة المفضلات';

  @override
  String get manageFavoritesSubtitle =>
      'اختر الأزرار التي تظهر في عناصر تحكم الجهاز';

  @override
  String get quickSettingsTitle => 'Quick الإعدادات';

  @override
  String get quickSettingsSubtitle => 'أضف مربعات لاختصارات الطاقة والصوت';

  @override
  String get configureTiles => 'تكوين المربعات';

  @override
  String get configureTilesSubtitle => 'اربط المربعات بأزرار جهاز التحكم';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle => 'Universal power cycling for owned أجهزة';

  @override
  String get openTvKill => 'فتح TVKill';

  @override
  String get openTvKillSubtitle =>
      'Cycle power codes (use only on أجهزة you own)';

  @override
  String get failedToLoadTransmitterSettings =>
      'فشل إلى تحميل transmitter settings.';

  @override
  String get usbStatusReady => 'دونجل USB متصل وجاهز لإرسال IR.';

  @override
  String get usbStatusPermissionRequired =>
      'تم اكتشاف دونجل USB. اطلب إذن USB ووافق على رسالة النظام.';

  @override
  String get usbStatusPermissionDenied =>
      'تم رفض إذن USB للدونجل الموصول. اطلبه مرة أخرى ووافق على الرسالة.';

  @override
  String get usbStatusPermissionGranted =>
      'تم منح إذن USB. ما زال الدونجل يحتاج إلى تهيئة قبل أن يتمكن من إرسال IR.';

  @override
  String get usbStatusOpenFailed =>
      'تم منح إذن USB، لكن تعذر تهيئة الدونجل. أعد توصيله وحاول مرة أخرى.';

  @override
  String get usbStatusNoDevice => 'لم يتم اكتشاف دونجل IR عبر USB مدعوم.';

  @override
  String get usbSelectPermissionRequired =>
      'تم اكتشاف دونجل USB لكنه غير مصرح. اضغط طلب إذن USB.';

  @override
  String get usbSelectPermissionDenied =>
      'تم رفض إذن USB. اضغط طلب إذن USB ووافق على الرسالة.';

  @override
  String get usbSelectPermissionGranted =>
      'تم منح إذن USB، لكن الدونجل لم يتهيأ بعد. جرّب إعادة توصيله.';

  @override
  String get usbSelectOpenFailed =>
      'تم منح إذن USB، لكن تعذر تهيئة الدونجل. أعد توصيله وحاول مرة أخرى.';

  @override
  String get usbSelectNoDevice =>
      'لم يتم اكتشاف دونجل IR عبر USB مدعوم. وصّله ثم اضغط طلب إذن USB.';

  @override
  String get usbSelectReady => 'دونجل USB جاهز.';

  @override
  String get autoSwitchEnabledMessage =>
      'التبديل التلقائي مفعّل: يستخدم USB عند التوصيل، وإلا الداخلي.';

  @override
  String get autoSwitchDisabledMessage =>
      'تلقائي-switch disabled: transmitter selection is now يدوي.';

  @override
  String get failedToUpdateAutoSwitch => 'فشل إلى update auto-switch setting.';

  @override
  String get failedToSwitchTransmitter => 'فشل إلى switch transmitter.';

  @override
  String get deviceHasNoInternalIr => 'هذا الجهاز لا يحتوي على مرسل IR مدمج.';

  @override
  String get audioModeEnabledMessage =>
      'تم تفعيل وضع الصوت. استخدم أعلى مستوى لصوت الوسائط ومحول صوت إلى IR LED.';

  @override
  String get usbPermissionRequestSent => 'تم إرسال طلب إذن USB.';

  @override
  String get usbPermissionRequestSentApprove =>
      'تم إرسال طلب إذن USB. وافق على الرسالة لتفعيل USB.';

  @override
  String get usbAlreadyReady => 'تمت تهيئة دونجل USB بالفعل وهو جاهز.';

  @override
  String get failedToRequestUsbPermission => 'فشل طلب إذن USB.';

  @override
  String get transmitterHelpInternal =>
      'استخدم مرسل IR المدمج في الهاتف لإرسال الأوامر.';

  @override
  String get transmitterHelpUsb =>
      'استخدم دونجل IR عبر USB، الإذن مطلوب، لإرسال الأوامر.';

  @override
  String get transmitterHelpAudio1 =>
      'استخدم خرج الصوت أحادي. يتطلب محول صوت إلى IR LED ومستوى صوت وسائط مرتفع.';

  @override
  String get transmitterHelpAudio2 =>
      'استخدم خرج الصوت الستيريو. يستخدم قناتين لتحسين تشغيل LED مع المحولات المتوافقة.';

  @override
  String get transmitterInternal => 'Internal IR';

  @override
  String get transmitterUsb => 'دونجل IR عبر USB';

  @override
  String get transmitterAudio1 => 'صوت (1 LED)';

  @override
  String get transmitterAudio2 => 'صوت (2 LEDs)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'فشل إلى تحميل transmitter capabilities.';

  @override
  String get selectedTransmitter => 'المحدد transmitter';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Active: $active';
  }

  @override
  String get refresh => 'تحديث';

  @override
  String get autoSwitchTitle => 'تلقائي-switch';

  @override
  String get autoSwitchDisabledWhileAudio => 'Disabled while using صوت mode';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'يستخدم USB عند التوصيل، وإلا الداخلي';

  @override
  String get unavailableOnThisDevice => 'غير متاح على هذا الجهاز';

  @override
  String get openOnUsbAttachTitle => 'الفتح عند توصيل USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'قد يقترح أندرويد فتح التطبيق عند توصيل دونجل IR عبر USB مدعوم.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'سيُقترح فتح IR Blaster عند توصيل دونجل USB مدعوم.';

  @override
  String get openOnUsbAttachDisabledMessage => 'لن يُقترح الفتح عند توصيل USB.';

  @override
  String get failedToUpdateSetting => 'فشل إلى update setting.';

  @override
  String get unnamedButton => 'زر بلا اسم';

  @override
  String get iconFallback => 'أيقونة';

  @override
  String get remoteListReorderHint =>
      'اضغط مطولاً على جهاز تحكم واسحبه لتغيير ترتيبه.';

  @override
  String get deleteRemoteTitle => 'حذف جهاز التحكم؟';

  @override
  String deleteRemoteMessage(Object name) {
    return 'سيُحذف جهاز التحكم «$name» نهائيًا. لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get delete => 'حذف';

  @override
  String get addToDeviceControlsTitle => 'إضافة إلى عناصر تحكم الجهاز؟';

  @override
  String get addToDeviceControlsDescription =>
      'وصول سريع من عناصر تحكم الجهاز في النظام.';

  @override
  String get skip => 'تخطي';

  @override
  String get add => 'إضافة';

  @override
  String get addedToDeviceControls => 'Added إلى الجهاز Controls.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'حُذف جهاز التحكم «$name». لا يمكن التراجع عن الحذف.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count زر',
      many: '$count زرًا',
      few: '$count أزرار',
      two: 'زران',
      one: 'زر واحد',
      zero: 'لا أزرار',
    );
    return '$_temp0 · $layout';
  }

  @override
  String get layoutComfort => 'عريض';

  @override
  String get layoutCompact => 'مدمج';

  @override
  String get open => 'فتح';

  @override
  String get useThisRemote => 'استخدم جهاز التحكم هذا';

  @override
  String get edit => 'تعديل';

  @override
  String get editRemoteSubtitle => 'إعادة التسمية وتعديل الأزرار';

  @override
  String get thisCannotBeUndone => 'لا يمكن التراجع عن الحذف';

  @override
  String get searchRemotes => 'ابحث أجهزة التحكم';

  @override
  String get reorderRemotes => 'ترتيب أجهزة التحكم';

  @override
  String get addRemote => 'إضافة جهاز تحكم';

  @override
  String get more => 'المزيد';

  @override
  String get reorderMode => 'Reorder mode';

  @override
  String remoteButtonCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count زر',
      many: '$count زرًا',
      few: '$count أزرار',
      two: 'زران',
      one: 'زر واحد',
      zero: 'لا أزرار',
    );
    return '$_temp0';
  }

  @override
  String get noRemotesYet => 'لا توجد أجهزة تحكم بعد';

  @override
  String get noRemotesDescription =>
      'أنشئ جهاز تحكم لإرسال إشارات الأشعة تحت الحمراء.';

  @override
  String get noRemotesNextStep => 'ابدأ بإضافة جهاز تحكم، ثم أضف إليه الأزرار.';

  @override
  String get actions => 'الإجراءات';

  @override
  String get macrosTitle => 'الماكرو';

  @override
  String get help => 'مساعدة';

  @override
  String get createMacro => 'إنشاء ماكرو';

  @override
  String get timedMacrosTitle => 'الماكرو';

  @override
  String get timedMacrosSubtitle =>
      'شغّل سلسلة من أوامر الأشعة تحت الحمراء مع فترات انتظار بين الخطوات.';

  @override
  String get timedMacrosNextStep =>
      'اختر جهاز تحكم، ثم أضف أوامر وفترات انتظار لإنشاء أول ماكرو.';

  @override
  String get macroFeatureToysTitle => 'للألعاب التي تعمل بالأشعة تحت الحمراء';

  @override
  String get macroFeatureToysDescription =>
      'امنح اللعبة وقتاً لإنهاء الحركة قبل إرسال الأمر التالي.';

  @override
  String get macroFeatureTimingTitle => 'فترات انتظار قابلة للتعديل';

  @override
  String get macroFeatureTimingDescription =>
      'حدد وقت الانتظار بين الأوامر ليتمكن جهازك من الاستجابة.';

  @override
  String get macroFeatureManualTitle => 'انتظار التأكيد';

  @override
  String get macroFeatureManualDescription =>
      'ينتظر حتى تضغط على متابعة للانتقال إلى الخطوة التالية.';

  @override
  String get exampleUseCase => 'مثال';

  @override
  String get macroExampleText =>
      '1. أرسل الأمر الأول\n2. انتظر ثانية واحدة\n3. أرسل الأمر التالي';

  @override
  String get createFirstMacro => 'إنشاء أول ماكرو';

  @override
  String get noRemote => 'لا يوجد جهاز تحكم';

  @override
  String macroCopyName(String name) {
    return '$name (نسخة)';
  }

  @override
  String macroStepCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count خطوة',
      many: '$count خطوة',
      few: '$count خطوات',
      two: 'خطوتان',
      one: 'خطوة واحدة',
      zero: '$count خطوة',
    );
    return '$_temp0';
  }

  @override
  String get aboutTimedMacros => 'حول الماكرو';

  @override
  String get aboutTimedMacrosDescription =>
      'شغّل سلسلة من أوامر الأشعة تحت الحمراء مع فترات انتظار بين الخطوات.';

  @override
  String get sendCommand => 'إرسال أمر';

  @override
  String get sendCommandDescription =>
      'يرسل إشارة الأشعة تحت الحمراء لزر محفوظ في جهاز التحكم.';

  @override
  String get delay => 'تأخير';

  @override
  String get delayDescription =>
      'ينتظر المدة التي تحددها قبل الانتقال إلى الخطوة التالية.';

  @override
  String get manualContinue => 'انتظار التأكيد';

  @override
  String get manualContinueDescription =>
      'ينتظر حتى تضغط على متابعة للانتقال إلى الخطوة التالية.';

  @override
  String get gotIt => 'فهمت';

  @override
  String get failedToSaveMacros => 'تعذّر حفظ الماكرو.';

  @override
  String deletedMacroNamed(Object name) {
    return 'تم حذف «$name».';
  }

  @override
  String get undo => 'تراجع';

  @override
  String get failedToRestoreMacro => 'تعذّرت استعادة الماكرو.';

  @override
  String get deleteMacroTitle => 'حذف الماكرو؟';

  @override
  String get deleteMacroMessage =>
      'بعد الحذف، اضغط على تراجع في الرسالة التي تظهر لاستعادة الماكرو.';

  @override
  String get noRemotesAvailable => 'لا توجد أجهزة تحكم متاحة.';

  @override
  String remoteButtonCountSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count زر',
      many: '$count زرًا',
      few: '$count أزرار',
      two: 'زران',
      one: 'زر واحد',
      zero: 'لا أزرار',
    );
    return '$_temp0';
  }

  @override
  String get remoteOrientationFlippedTooltip => 'إعادة الاتجاه الأصلي';

  @override
  String get remoteOrientationNormalTooltip => 'تدوير جهاز التحكم 180°';

  @override
  String get stopLoop => 'إيقاف التكرار';

  @override
  String get reorderButtons => 'ترتيب الأزرار';

  @override
  String get remoteReorderHint => 'اضغط مطولًا على زر واسحبه لتغيير موضعه.';

  @override
  String get manageRemote => 'إدارة جهاز التحكم';

  @override
  String get remoteNoButtons => 'لا توجد أزرار بعد';

  @override
  String get remoteNoButtonsDescription =>
      'عدّل جهاز التحكم لإضافة الأزرار أو إعدادها.';

  @override
  String get editRemote => 'تعديل جهاز التحكم';

  @override
  String get editRemoteActionsSubtitle => 'تغيير الاسم وترتيب الأزرار وتعديلها';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'حُدّث الزر «$name».';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Added \"$name\".';
  }

  @override
  String get buttonDuplicated => 'زر duplicated.';

  @override
  String get loopRunningForButton => 'التكرار يعمل لهذا الزر.';

  @override
  String get loopTip => 'ملاحظة: Use Loop إلى repeat until you stop it.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Code copied.';

  @override
  String get copyCode => 'نسخ code';

  @override
  String get startLoop => 'بدء loop';

  @override
  String get editButtonSubtitle =>
      'غيّر التسمية أو الألوان أو إشارة الأشعة تحت الحمراء';

  @override
  String get newButton => 'زر جديد';

  @override
  String get newButtonSubtitle => 'أنشئ زراً آخر لجهاز التحكم هذا';

  @override
  String get duplicate => 'إنشاء نسخة';

  @override
  String get duplicateButtonSubtitle => 'أنشئ نسخة من هذا الزر';

  @override
  String get removeFromDeviceControls => 'إزالة من عناصر تحكم الجهاز';

  @override
  String get addToDeviceControls => 'إضافة إلى عناصر تحكم الجهاز';

  @override
  String get deviceControlsButtonSubtitle =>
      'استخدم هذا الزر من عناصر التحكم بالأجهزة في Android';

  @override
  String get removedFromDeviceControls => 'تمت الإزالة من عناصر تحكم الجهاز.';

  @override
  String get pinQuickTile => 'تثبيت في مفضلات المربعات السريعة';

  @override
  String get unpinQuickTile => 'إلغاء التثبيت من مفضلات المربعات السريعة';

  @override
  String get quickTileButtonSubtitle =>
      'تظهر المفضلة أولاً عند إعداد مربع في الإعدادات السريعة';

  @override
  String get removedFromQuickTileFavorites =>
      'Removed من Quick Tile favorites.';

  @override
  String get pinnedToQuickTileFavorites => 'Pinned إلى Quick Tile favorites.';

  @override
  String get duplicateAndEdit => 'نسخ وتعديل';

  @override
  String get duplicateAndEditSubtitle => 'أنشئ نسخة وافتحها للتعديل';

  @override
  String get done => 'تم';

  @override
  String get run => 'تشغيل';

  @override
  String get untitledRemote => 'جهاز تحكم بلا اسم';

  @override
  String get createRemoteTitle => 'إنشاء جهاز تحكم';

  @override
  String get editRemoteTitle => 'تعديل جهاز التحكم';

  @override
  String get removeButtonTitle => 'إزالة الزر؟';

  @override
  String get imageButtonRemovedMessage => 'ستتم إزالة هذا الزر من جهاز التحكم.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return 'ستتم إزالة «$name» من جهاز التحكم.';
  }

  @override
  String get remove => 'إزالة';

  @override
  String importedButtonCount(int count) {
    return 'تم استيراد $count زر.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'تم استيراد $count زر من أجهزة التحكم الموجودة.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'غيّر التسمية أو الألوان أو إشارة الأشعة تحت الحمراء';

  @override
  String get createButtonCopySubtitle => 'أنشئ نسخة من هذا الزر';

  @override
  String get duplicateAndEditButtonSubtitle => 'أنشئ نسخة وافتحها للتعديل';

  @override
  String get undoAvailableInNextSnackbar =>
      'بعد إزالة الزر، اضغط على تراجع في الرسالة التي تظهر.';

  @override
  String get buttonRemoved => 'تمت إزالة الزر.';

  @override
  String get remoteNameCannotBeEmpty => 'أدخل اسماً لجهاز التحكم.';

  @override
  String get saveRemote => 'حفظ جهاز التحكم';

  @override
  String get remoteName => 'اسم جهاز التحكم';

  @override
  String get remoteNameHint => 'مثلاً: التلفاز أو المكيّف';

  @override
  String get remoteNameHelper => 'سيظهر هذا الاسم في قائمة أجهزة التحكم.';

  @override
  String get layoutStyle => 'تخطيط الأزرار';

  @override
  String get layoutWideDescription => 'عمودان من الأزرار مع تفاصيل إضافية.';

  @override
  String get layoutCompactDescription =>
      'أربعة أعمدة من الأزرار تعرض رموزًا أو نصوصًا.';

  @override
  String get importFromRemotes => 'استيراد من أجهزة التحكم';

  @override
  String get importFromDatabase => 'استيراد من قاعدة البيانات';

  @override
  String get addButton => 'إضافة زر';

  @override
  String get noButtonsYet => 'لا توجد أزرار بعد';

  @override
  String get createRemoteEmptyStateDescription =>
      'ابحث عن أزرار في قاعدة البيانات، أو استوردها من جهاز تحكم آخر، أو أنشئ أزرارك بنفسك.';

  @override
  String get createButtonTitle => 'إنشاء زر';

  @override
  String get editButtonTitle => 'تعديل زر';

  @override
  String failedToLoadProtocols(Object error) {
    return 'فشل إلى تحميل protocols: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'فشل تحميل مفاتيح قاعدة البيانات: $error';
  }

  @override
  String get presetPower => 'تشغيل';

  @override
  String get presetVolume => 'الصوت';

  @override
  String get presetChannel => 'Channel';

  @override
  String get presetNavigation => 'تنقل';

  @override
  String get all => 'الكل';

  @override
  String get completeRequiredFieldsToSave => 'أكمل الحقول المطلوبة للحفظ';

  @override
  String get buttonLabelStepTitle => 'تسمية الزر';

  @override
  String get buttonLabelStepSubtitle =>
      'اختر an image, icon, or type a text label.';

  @override
  String get buttonColorStepTitle => 'لون الزر';

  @override
  String get buttonColorStepSubtitle => 'اختر لون خلفية لهذا الزر.';

  @override
  String get selectColor => 'اختر اللون:';

  @override
  String get noImageSelected => 'No image المحدد';

  @override
  String get gallery => 'Gallery';

  @override
  String get builtIn => 'Built-in';

  @override
  String get removeImage => 'Remove image';

  @override
  String get requiredSelectImageOrSwitch =>
      'مطلوب: اختر صورة أو أيقونة أو بدّل إلى نص.';

  @override
  String get iconSelected => 'Icon المحدد';

  @override
  String get noIconSelected => 'No icon المحدد';

  @override
  String get chooseIcon => 'اختر Icon';

  @override
  String get removeIcon => 'Remove icon';

  @override
  String get requiredSelectIconOrSwitch =>
      'مطلوب: اختر أيقونة أو بدّل إلى صورة أو نص.';

  @override
  String get buttonText => 'زر text';

  @override
  String get buttonTextHint => 'e.g., تشغيل, الصوت +, HDMI 1';

  @override
  String get buttonTextHelper => 'سيظهر هذا النص على الزر.';

  @override
  String get requiredEnterButtonLabel => 'مطلوب: أدخل تسمية للزر.';

  @override
  String get defaultColorName => 'افتراضي';

  @override
  String get newRemoteCreatedFromLastHit =>
      'تم إنشاء جهاز تحكم جديد مع زر واحد من آخر إصابة.';

  @override
  String get selectRemote => 'اختر جهاز تحكم';

  @override
  String remoteNumber(Object id) {
    return 'جهاز التحكم #$id';
  }

  @override
  String get newRemoteCreated => 'تم إنشاء جهاز تحكم جديد.';

  @override
  String get failedToCreateRemote => 'فشل إنشاء جهاز التحكم.';

  @override
  String get newRemoteEllipsis => 'جهاز تحكم جديد…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Added إلى $name.';
  }

  @override
  String get failedToAddToRemote => 'فشل الإضافة إلى جهاز التحكم.';

  @override
  String get newRemoteDefaultName => 'New جهاز التحكم';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Jumped إلى offset $offset. Paused — press استئناف إلى continue.';
  }

  @override
  String get sent => 'تم الإرسال.';

  @override
  String failedToSend(Object error) {
    return 'فشل إلى send: $error';
  }

  @override
  String get copiedProtocolCode => 'تم النسخ، البروتوكول: الكود.';

  @override
  String get savedToResults => 'Saved إلى النتائج.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'كود غير صالح لهذا البروتوكول: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Copied الحالي candidate.';

  @override
  String get jumpToOffset => 'انتقال إلى offset';

  @override
  String get jumpToBruteCursor => 'انتقال إلى brute cursor';

  @override
  String get jump => 'انتقال';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Jumped إلى cursor 0x$cursor. Paused — press استئناف إلى continue.';
  }

  @override
  String get irSignalTester => 'IR إشارة Tester';

  @override
  String get stop => 'إيقاف';

  @override
  String get selectButton => 'اختر زر';

  @override
  String get buttonNotFoundInRemotes => 'زر not موجود in remotes.';

  @override
  String sentNamed(Object name) {
    return 'Sent \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'إرسال فشل: $error';
  }

  @override
  String get noFavoritesYet => 'No favorites yet';

  @override
  String get deviceControlsEmptyHint =>
      'اضغط مطولاً على زر في جهاز التحكم واختر إضافة إلى عناصر تحكم الجهاز.';

  @override
  String get sendTest => 'إرسال test';

  @override
  String get testSendCompleted => 'اختبار send completed.';

  @override
  String testSendFailed(Object error) {
    return 'اختبار send فشل: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Removed \"$name\".';
  }

  @override
  String get brand => 'العلامة';

  @override
  String get model => 'الطراز';

  @override
  String get selectBrand => 'اختر العلامة';

  @override
  String get searchBrand => 'ابحث عن علامة…';

  @override
  String get selectModel => 'اختر الطراز';

  @override
  String get searchModel => 'ابحث عن طراز…';

  @override
  String get unnamedKey => 'Unnamed key';

  @override
  String get unknown => 'غير معروف';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'البحث عن أمر';

  @override
  String get noMatchingCommands => 'لا توجد أوامر مطابقة';

  @override
  String get quickTileFavoritesTitle => 'الأزرار المفضلة';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'تغيير زر مربع «$tileLabel»';
  }

  @override
  String get pickDifferentButton => 'اختر زرًا آخر';

  @override
  String get browseAllRemotesEllipsis => 'تصفح أجهزة التحكم';

  @override
  String get invalidMacroFileFormat => 'تنسيق ملف الماكرو غير صالح.';

  @override
  String get failedToParseMacroFile => 'فشل تحليل ملف الماكرو.';

  @override
  String get deviceCodeLabel => 'الجهاز Code';

  @override
  String get commandLabel => 'أمر';

  @override
  String get editButtonCodeTitle => 'تعديل كود الزر';

  @override
  String get thisRemoteHasNoButtons => 'لا يحتوي هذا الريموت على أزرار.';

  @override
  String get selectCommand => 'اختر أمرًا';

  @override
  String get databaseModeAutofillHint =>
      'يقوم وضع قاعدة البيانات بملء الخطوة 2 تلقائياً، العلامة والطراز والبروتوكول. بعد استيراد مفتاح، يمكنك تعديل أي شيء في الوضع اليدوي.';

  @override
  String get test => 'اختبار';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'الكل المحدد أزرار were duplicates.';

  @override
  String get noButtonsImported => 'No أزرار imported.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'تم استيراد $addedCount زر. تم تخطي $skippedCount من النسخ المكررة.';
  }

  @override
  String get importAllMatchingTitle => 'استيراد all matching أزرار?';

  @override
  String get noMatchingKeysFound => 'No matching keys موجود.';

  @override
  String importAllMatchingMessage(int count) {
    return 'سيتم استيراد ما يصل إلى $count من المفاتيح المطابقة من اختيار قاعدة البيانات الحالي.';
  }

  @override
  String get importAll => 'استيراد all';

  @override
  String get importingButtons => 'Importing أزرار…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'الكل matching أزرار were duplicates.';

  @override
  String get quickPresets => 'Quick presets';

  @override
  String get selectDeviceFirst => 'اختر الجهاز أولاً';

  @override
  String get searchByLabelOrHex => 'ابحث by label or hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'اختياري: حسّن مفاتيح الإعداد المسبق $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'اختر العلامة والطراز والبروتوكول أولاً.';

  @override
  String get importFromDatabaseTitle => 'استيراد من قاعدة البيانات';

  @override
  String get importFromDatabaseSubtitle =>
      'ابحث عن جهازك، واختر الأزرار التي تريد استيرادها.';

  @override
  String get deviceAndFilters => 'الجهاز & filters';

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
      'لم يتم العثور على بروتوكول لهذه العلامة والطراز.';

  @override
  String get protocolAutoDetected => 'البروتوكول';

  @override
  String get protocolAutoDetectedHelper =>
      'تم اكتشافه تلقائياً من قاعدة البيانات. يمكنك تغييره قبل الاستيراد.';

  @override
  String get selectBrandModelToLoadKeys =>
      'اختر علامة وطرازاً وبروتوكولاً لتحميل المفاتيح.';

  @override
  String get noKeysFound => 'No keys موجود.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'No keys موجود for “$query”.';
  }

  @override
  String get skipDuplicates => 'Skip duplicates';

  @override
  String get skipDuplicatesSubtitle =>
      'لا تستورد الأزرار الموجودة بالفعل في جهاز التحكم هذا.';

  @override
  String get importSelected => 'استيراد المحدد';

  @override
  String get noMacrosToExport => 'لا توجد وحدات ماكرو للتصدير.';

  @override
  String get macrosExportedToDownloads => 'تم تصدير الماكرو إلى التنزيلات.';

  @override
  String get failedToExportMacros => 'فشل تصدير الماكرو.';

  @override
  String get failedToReadFile => 'فشل إلى read file.';

  @override
  String get importFromExistingRemotesTitle =>
      'استيراد من Existing أجهزة التحكم';

  @override
  String selectedCount(int count) {
    return '$count المحدد';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'لم يتم العثور على أجهزة تحكم أخرى تحتوي على أزرار.';

  @override
  String get sourceRemote => 'جهاز التحكم المصدر';

  @override
  String get searchButtons => 'ابحث أزرار';

  @override
  String get searchButtonsHint => 'تشغيل, الصوت, كتم...';

  @override
  String get selectVisible => 'اختر visible';

  @override
  String get clearVisible => 'Clear visible';

  @override
  String protocolNamed(Object name) {
    return 'البروتوكول: $name';
  }

  @override
  String get rawSignal => 'خام';

  @override
  String get legacyCode => 'Legacy code';

  @override
  String importCount(int count) {
    return 'استيراد $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'تم رفض إذن التخزين، وهو مطلوب في بعض أجهزة أندرويد الأقدم.';

  @override
  String get backupExportedToDownloads =>
      'تم تصدير النسخة الاحتياطية إلى التنزيلات.';

  @override
  String failedToExport(Object error) {
    return 'فشل إلى export: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'تم استيراد $count من أجهزة التحكم من نسخة JSON القديمة. لم يتم تغيير الماكرو.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'فشل الاستيراد: يجب أن تكون النسخة الاحتياطية remotes قائمة JSON عند وجودها.';

  @override
  String get importFailedMacrosMustBeList =>
      'فشل الاستيراد: يجب أن تكون النسخة الاحتياطية للماكرو قائمة JSON عند وجودها.';

  @override
  String get importFailedInvalidBackupFormat =>
      'فشل الاستيراد: تنسيق النسخة الاحتياطية غير صالح، المطلوب قائمة قديمة أو خريطة مع أجهزة التحكم أو الماكرو.';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'تم استيراد $remoteCount من أجهزة التحكم من النسخة الاحتياطية. لم يتم تغيير الماكرو.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'تم استيراد $remoteCount من أجهزة التحكم و $macroCount من وحدات الماكرو من النسخة الاحتياطية.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'فشل الاستيراد: no valid أزرار موجود in .ir file.';

  @override
  String get importedOneRemoteFromFlipper =>
      'تم استيراد جهاز تحكم واحد من Flipper بصيغة .ir. لم يتم تغيير الماكرو.';

  @override
  String get importFailedInvalidIrplus =>
      'فشل الاستيراد: invalid irplus file (no valid أزرار موجود).';

  @override
  String get importedOneRemoteFromIrplus =>
      'تم استيراد جهاز تحكم واحد من irplus. لم يتم تغيير الماكرو.';

  @override
  String get importFailedInvalidLirc =>
      'فشل الاستيراد: invalid LIRC file (no valid codes/raw codes موجود).';

  @override
  String get importedOneRemoteFromLirc =>
      'تم استيراد جهاز تحكم واحد من إعداد LIRC. لم يتم تغيير الماكرو.';

  @override
  String get unsupportedFileTypeSelected => 'Unsupported file type المحدد.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'فشل الاستيراد: invalid or unreadable file.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'اكتمل الاستيراد المجمع: no مدعوم files موجود in folder.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'اكتمل الاستيراد المجمع: لم يتم استيراد أي جهاز تحكم. تم تخطي $skippedCount ملفاً.';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'اكتمل الاستيراد المجمع: تم استيراد $importedCount جهاز تحكم من $supportedCount ملفاً مدعوماً. تم تخطي $skippedCount ملفاً.';
  }

  @override
  String get storagePermissionDenied => 'تم رفض إذن التخزين.';

  @override
  String get bulkImportFailedReadFolder =>
      'Bulk import فشل: unable إلى read folder contents.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'اكتمل الاستيراد المجمع: no مدعوم files موجود ($sourceLabel).';
  }

  @override
  String get clearAction => 'مسح';

  @override
  String get saveAction => 'حفظ';

  @override
  String buttonsTitleCount(int count) {
    return 'الأزرار ($count)';
  }

  @override
  String get invalidStepEncountered =>
      'يحتوي هذا الماكرو على خطوة غير صالحة. عدّلها قبل المحاولة مجددًا.';

  @override
  String failedToSendNamed(Object name) {
    return 'تعذّر إرسال الأمر: $name';
  }

  @override
  String get buttonNotFound => 'لم يتم العثور على الزر';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'لم يتم العثور على الزر: $name';
  }

  @override
  String get unknownButton => 'زر غير معروف';

  @override
  String durationSecondsShort(int seconds) {
    return '$seconds ث';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '$minutes د $seconds ث';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '$hours س $minutes د';
  }

  @override
  String get orientationFlippedTooltip =>
      'Orientation: flipped (tap إلى normal)';

  @override
  String get orientationNormalTooltip => 'Orientation: normal (tap إلى flip)';

  @override
  String get noSteps => 'لا توجد خطوات';

  @override
  String stepProgress(int current, int total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get completed => 'اكتمل';

  @override
  String get paused => 'متوقف مؤقتًا';

  @override
  String get running => 'قيد التنفيذ';

  @override
  String get ready => 'جاهز';

  @override
  String stepsProgress(int current, int total) {
    return 'الخطوات: $current / $total';
  }

  @override
  String get waiting => 'قيد الانتظار';

  @override
  String secondsRemaining(num seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
            locale: localeName, decimalDigits: 1);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'المتبقي: $secondsString ث';
  }

  @override
  String millisecondsShort(int ms) {
    return '$ms ms';
  }

  @override
  String get tapContinueWhenReady =>
      'اضغط على متابعة عندما تكون مستعداً للخطوة التالية.';

  @override
  String get error => 'خطأ';

  @override
  String get macroCompleted => 'اكتمل الماكرو';

  @override
  String finishedIn(Object duration) {
    return 'اكتمل خلال $duration';
  }

  @override
  String get sequence => 'الخطوات';

  @override
  String waitMilliseconds(int ms) {
    return 'انتظار $ms ملي ثانية';
  }

  @override
  String get runAgain => 'تشغيل مجدداً';

  @override
  String get startMacro => 'بدء الماكرو';

  @override
  String get continueAction => 'متابعة';

  @override
  String get unnamedRemote => 'جهاز تحكم بلا اسم';

  @override
  String get enterMacroName => 'أدخل اسماً للماكرو.';

  @override
  String get addAtLeastOneStep => 'أضف خطوة واحدة على الأقل.';

  @override
  String get fixInvalidSteps => 'صحّح الخطوات غير الصالحة قبل الحفظ.';

  @override
  String get unknownCommand => 'أمر غير معروف';

  @override
  String get unnamedCommand => 'أمر بلا اسم';

  @override
  String get iconCommand => 'زر بأيقونة';

  @override
  String get selectDelay => 'اختر وقت الانتظار';

  @override
  String keepMilliseconds(int ms) {
    return 'الإبقاء على $ms مللي ثانية';
  }

  @override
  String get custom => 'مخصص';

  @override
  String get enterCustomDelayDuration => 'أدخل وقت انتظار آخر';

  @override
  String millisecondsLong(int ms) {
    return '$ms ملي ثانية';
  }

  @override
  String secondsLong(num seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$secondsString ثانية',
      many: '$secondsString ثانية',
      few: '$secondsString ثوانٍ',
      two: 'ثانيتان',
      one: '$secondsString ثانية',
    );
    return '$_temp0';
  }

  @override
  String get customDelay => 'انتظار مخصص';

  @override
  String get delayMillisecondsLabel => 'الانتظار (مللي ثانية)';

  @override
  String get delayMillisecondsHint => '3000';

  @override
  String get recommendedDelayRange =>
      '1000 مللي ثانية = ثانية واحدة. اختر وقتاً يسمح لجهازك بالاستجابة.';

  @override
  String get enterValidPositiveNumber => 'أدخل عدداً صحيحاً أكبر من صفر.';

  @override
  String get ok => 'موافق';

  @override
  String get remote => 'جهاز التحكم';

  @override
  String get macroName => 'اسم الماكرو';

  @override
  String get macroNameHint => 'مثلاً: سهرة سينما';

  @override
  String stepsTitleCount(int count) {
    return 'الخطوات ($count)';
  }

  @override
  String get noStepsYet => 'لا توجد خطوات بعد';

  @override
  String get addCommandsAndDelaysHint =>
      'أضف أوامر أو فترات انتظار أو توقفاً للتأكيد. تُنفّذ الخطوات بالترتيب المعروض.';

  @override
  String get addStep => 'إضافة خطوة';

  @override
  String get reorderStepsHint =>
      'اسحب مقبض الخطوة لتغيير ترتيبها. اضغط على الخطوة لتعديلها.';

  @override
  String reorderStep(int index) {
    return 'نقل الخطوة $index';
  }

  @override
  String get pressAndDragToChangeStepOrder => 'اضغط واسحب لتغيير ترتيب الخطوة';

  @override
  String deleteStep(int index) {
    return 'حذف الخطوة $index';
  }

  @override
  String get invalidStepTapToFix => 'خطوة غير صالحة. اضغط لتعديلها.';

  @override
  String get sendIrCommand => 'إرسال أمر بالأشعة تحت الحمراء';

  @override
  String get waitForUserConfirmation =>
      'يتوقف الماكرو مؤقتاً حتى تختار المتابعة.';

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
  String get layoutWide => 'عريض';

  @override
  String get iconButton => 'زر أيقونة';

  @override
  String get imageButton => 'زر صورة';

  @override
  String get noSignalInfo => 'No signal info';

  @override
  String get proceed => 'Proceed';

  @override
  String get discard => 'تجاهل';

  @override
  String get continueEditing => 'متابعة التعديل';

  @override
  String get unsavedChangesTitle => 'تغييرات غير محفوظة';

  @override
  String get unsavedMacroChangesMessage =>
      'هل تريد تجاهل تغييرات هذا الماكرو؟ لن تُحفظ هذه التغييرات.';

  @override
  String get stopMacroBeforeLeaving => 'أوقف الماكرو قبل مغادرة هذه الشاشة.';

  @override
  String get stopTestingBeforeLeaving =>
      'Stop testing before leaving this screen.';

  @override
  String get idle => 'خامل';

  @override
  String get start => 'بدء';

  @override
  String get resume => 'استئناف';

  @override
  String get pause => 'إيقاف مؤقت';

  @override
  String get stopped => 'Stopped';

  @override
  String get copy => 'نسخ';

  @override
  String get send => 'إرسال';

  @override
  String get step => 'خطوة';

  @override
  String get addToRemote => 'إضافة إلى جهاز التحكم';

  @override
  String get noDescriptionAvailable => 'No description available.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'يجب أن يكون مورد Kaseikyo من 4 أرقام hex بالضبط.';

  @override
  String get irFinderDatabaseNotReady => 'قاعدة البيانات غير جاهزة بعد.';

  @override
  String get irFinderSelectBrandFirst => 'اختر علامة تجارية أولاً من الإعداد.';

  @override
  String get irFinderBruteforceUnavailable =>
      'البحث بالقوة الغاشمة غير متاح لهذا البروتوكول بعد.';

  @override
  String get irFinderInvalidPrefix => 'بادئة غير صالحة.';

  @override
  String irFinderBrandValue(Object value) {
    return 'العلامة: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'الطراز: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'المفتاح: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'جهاز التحكم رقم $value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'أدخل فهرساً يبدأ من الصفر داخل نتائج قاعدة البيانات المصفاة والمرتبة.';

  @override
  String get irFinderJumpCursorHelper =>
      'أدخل مؤشراً hex يبدأ من الصفر داخل مساحة القوة الغاشمة.';

  @override
  String get irFinderSetupTab => 'الإعداد';

  @override
  String get irFinderTestTab => 'اختبار';

  @override
  String get irFinderResultsTab => 'النتائج';

  @override
  String get irFinderContinueToTest => 'تابع إلى الاختبار';

  @override
  String get irFinderKaseikyoVendorTitle => 'مورد Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'مورد مخصص، 4 hex';

  @override
  String get irFinderBrowseDbCandidates => 'تصفح مرشحي القاعدة…';

  @override
  String get irFinderEditSetup => 'تعديل الإعداد';

  @override
  String get irFinderNoSavedHits =>
      'لا توجد إصابات محفوظة بعد. في صفحة الاختبار، اضغط حفظ الإصابة عندما يستجيب الجهاز.';

  @override
  String get irFinderBackToTest => 'عودة للاختبار';

  @override
  String get irFinderLargeSearchSpaceTitle => 'مساحة بحث كبيرة';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'مساحة القوة الغاشمة هذه كبيرة جداً، $human احتمالاً. سيظل IR Finder يحترم الحد الأقصى للمحاولات وفترة التهدئة، لكن انتبه لعدم إغراق أجهزة IR.\n\nالتوصية: استخدم وضع قاعدة البيانات أولاً، أو أدخل بايتات بادئة معروفة لتقليل المساحة.';
  }

  @override
  String get irFinderDatabaseSession => 'جلسة قاعدة البيانات';

  @override
  String get irFinderBruteforceSession => 'جلسة القوة الغاشمة';

  @override
  String get irFinderResumeLastSession => 'استئناف آخر جلسة';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'العلامة: $brand · الطراز: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'البادئة: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'التقدم: $progress · بدأ: $when';
  }

  @override
  String get irFinderApplyResume => 'تطبيق واستئناف';

  @override
  String get irFinderBruteforceMode => 'قوة غاشمة';

  @override
  String get irFinderDatabaseAssistedMode => 'بمساعدة قاعدة البيانات';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'البروتوكول: $name';
  }

  @override
  String get irFinderProtocolLabel => 'بروتوكول IR';

  @override
  String get irFinderProtocolHelper =>
      'يتحكم في الترميز وبالتالي في مساحة البحث.';

  @override
  String get irFinderKnownPrefixLabel => 'بادئة معروفة، بايتات hex اختيارية';

  @override
  String get irFinderKnownPrefixHint => 'A1B2، A1 B2، A1:B2، 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'الحمولة: $digits رقم hex';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'الحمولة: $digits رقم hex · مثال: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'الحمولة: $digits رقم hex · أقصى بادئة: $bytes بايت';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'الحمولة: $digits رقم hex · مثال: $example · أقصى بادئة: $bytes بايت';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'مثال: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'أدخل أي بايتات أولى معروفة لتقليل مساحة البحث.';

  @override
  String get irFinderDatabaseMode => 'قاعدة البيانات';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'البادئة المطبعة: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'البادئة المطبعة';

  @override
  String get irFinderBruteforceNotConfigured =>
      'القوة الغاشمة غير مضبوطة لهذا البروتوكول بعد.';

  @override
  String irFinderAllLimit(Object value) {
    return 'الكل، $value';
  }

  @override
  String get irFinderTestControls => 'عناصر الاختبار';

  @override
  String irFinderPayloadLength(int digits) {
    return 'طول الحمولة: $digits رقم hex.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'مساحة البحث: $value احتمالاً، بعد قيود البادئة.';
  }

  @override
  String get irFinderCooldownMs => 'التهدئة، ms';

  @override
  String get irFinderMaxAttemptsPerRun => 'أقصى محاولات، لكل تشغيل';

  @override
  String get irFinderTestAllCombinations => 'اختبر كل التركيبات';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'يستمر حتى تنتهي مساحة البحث. الحد الفعلي: $value';
  }

  @override
  String get irFinderAttempts => 'المحاولات';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'نطاق المؤشر: من 1 إلى $max، اكتب أي رقم للقيم الأكبر';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'الحد الأقصى\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'الحد الفعلي لهذا التشغيل: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'ملاحظة: استخدم وضع قاعدة البيانات أولاً؛ القوة الغاشمة أفضل مع بادئة معروفة، مثل أول 1 إلى 4 بايتات.';

  @override
  String get irFinderDatabaseInitFailed => 'فشل تهيئة قاعدة البيانات.';

  @override
  String get irFinderPreparingDatabase => 'جار تجهيز قاعدة بيانات IR المحلية…';

  @override
  String get irFinderDatabaseAssistedSearch => 'بحث بمساعدة قاعدة البيانات';

  @override
  String get irFinderBrand => 'العلامة';

  @override
  String get irFinderSelectBrand => 'اختر العلامة';

  @override
  String get irFinderModelOptional => 'الطراز، اختياري';

  @override
  String get irFinderSelectBrandFirstShort => 'اختر علامة أولاً';

  @override
  String get irFinderSelectModelRecommended => 'اختر طرازاً، موصى به';

  @override
  String get irFinderOnlySelectedProtocol => 'البروتوكول المحدد فقط';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'يصفّي المفاتيح إلى البروتوكول المحدد. عطله لتصفح كل البروتوكولات.';

  @override
  String get irFinderQuickWinsFirst => 'النتائج السريعة أولاً';

  @override
  String get irFinderQuickWinsFirstHint =>
      'يعطي أولوية لمفاتيح الطاقة والكتم والصوت والقنوات قبل المفاتيح الأعمق.';

  @override
  String get irFinderMaxKeysPerRun => 'أقصى عدد مفاتيح للاختبار، لكل تشغيل';

  @override
  String get irFinderTesting => 'جار الاختبار…';

  @override
  String get irFinderCooldown => 'التهدئة';

  @override
  String get irFinderEta => 'الوقت المتوقع';

  @override
  String get irFinderMode => 'الوضع';

  @override
  String get irFinderRetryLast => 'إعادة آخر محاولة';

  @override
  String get irFinderTrigger => 'تشغيل';

  @override
  String get irFinderJump => 'انتقال…';

  @override
  String get irFinderSaveHit => 'حفظ الإصابة';

  @override
  String irFinderEtaSeconds(int seconds) {
    return '$secondsث';
  }

  @override
  String irFinderEtaMinutesSeconds(int minutes, int seconds) {
    return '$minutesد $secondsث';
  }

  @override
  String irFinderEtaHoursMinutes(int hours, int minutes) {
    return '$hoursس $minutesد';
  }

  @override
  String irFinderLastAttemptedCode(Object value) {
    return 'آخر كود تمت تجربته: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'ابدأ الاختبار لرؤية آخر كود تمت تجربته.';

  @override
  String irFinderFromDb(Object value) {
    return 'من القاعدة: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'من القوة الغاشمة، تم إنشاؤه بواسطة مشفر البروتوكول.';

  @override
  String irFinderSendError(Object error) {
    return 'خطأ إرسال: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'المصدر: $value';
  }

  @override
  String get irFinderResultsNote =>
      'تدعم النتائج الاختبار والنسخ فوراً. يمكن توسيع إضافة النتائج مباشرة إلى جهاز التحكم لاحقاً داخل مسار المحرر.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'تصفح مرشحي القاعدة';

  @override
  String get irFinderFilterByLabelOrHex => 'صفِّ حسب التسمية أو hex…';

  @override
  String get irFinderJumpHere => 'انتقل هنا';

  @override
  String get irFinderSelectModel => 'اختر الطراز';

  @override
  String get irFinderSearchBrands => 'ابحث عن العلامات…';

  @override
  String get irFinderSearchModels => 'ابحث عن الطرز…';

  @override
  String get iconPickerTitle => 'اختر Icon';

  @override
  String get iconPickerSearchHint => 'ابحث icons...';

  @override
  String get iconPickerNoIconsFound => 'No icons موجود';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count icons available';
  }

  @override
  String get iconPickerCategoryAll => 'الكل';

  @override
  String get iconPickerCategoryMedia => 'وسائط';

  @override
  String get iconPickerCategoryVolume => 'الصوت';

  @override
  String get iconPickerCategoryNavigation => 'تنقل';

  @override
  String get iconPickerCategoryPower => 'تشغيل';

  @override
  String get iconPickerCategoryNumbers => 'Numbers';

  @override
  String get iconPickerCategorySettings => 'الإعدادات';

  @override
  String get iconPickerCategoryDisplay => 'Display';

  @override
  String get iconPickerCategoryInput => 'إدخال';

  @override
  String get iconPickerCategoryFavorite => 'مفضل';

  @override
  String get universalPowerTitle => 'Universal تشغيل';

  @override
  String get universalPowerRunTab => 'تشغيل';

  @override
  String get universalPowerUseResponsibly => 'Use responsibly';

  @override
  String get universalPowerConsentBody =>
      'يقوم Universal Power بتدوير أكواد الطاقة عبر IR. استخدمه فقط مع الأجهزة التي تملكها أو تتحكم بها. توقف فور استجابة الجهاز.';

  @override
  String get universalPowerConsentCheckbox => 'أنا أملك الجهاز أو أتحكم به';

  @override
  String get universalPowerSetupBody =>
      'يدوّر أكواد الطاقة للعلامة المحددة. توقف فور استجابة الجهاز.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Last sent: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'لم يتم العثور على أكواد طاقة. جرّب توسيع البحث.';

  @override
  String get universalPowerUnableToStart => 'Unable إلى start.';

  @override
  String get universalPowerAllBrands => 'الكل brands (no filter)';

  @override
  String get universalPowerClearBrandFilter => 'مسح عامل تصفية العلامة';

  @override
  String get universalPowerBroadenSearch => 'وسّع البحث عند الحاجة';

  @override
  String get universalPowerBroadenSearchHint =>
      'If no power labels are موجود, include other keys.';

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
      'يستمر في تدوير الطابور حتى توقفه.';

  @override
  String get universalPowerDelayBetweenCodes => 'تأخير between codes';

  @override
  String get universalPowerStart => 'بدء Universal تشغيل';

  @override
  String get universalPowerRunStatus => 'تشغيل status';

  @override
  String universalPowerProgress(Object value) {
    return 'التقدم: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'تم الإيقاف المؤقت لأن التطبيق انتقل إلى الخلفية.';

  @override
  String get universalPowerSendOneCode => 'إرسال one code';

  @override
  String get universalPowerStopWhenDeviceResponds => 'توقف فور استجابة الجهاز.';

  @override
  String get iconNamePlay => 'تشغيل';

  @override
  String get iconNamePause => 'إيقاف مؤقت';

  @override
  String get iconNameStop => 'إيقاف';

  @override
  String get iconNameFastForward => 'Fast Forward';

  @override
  String get iconNameRewind => 'Rewind';

  @override
  String get iconNameSkipNext => 'Skip Next';

  @override
  String get iconNameSkipPrevious => 'Skip Previous';

  @override
  String get iconNameReplay => 'إعادة تشغيل';

  @override
  String get iconNameForward10S => 'Forward 10s';

  @override
  String get iconNameForward30S => 'Forward 30s';

  @override
  String get iconNameReplay10S => 'إعادة تشغيل 10s';

  @override
  String get iconNameReplay30S => 'إعادة تشغيل 30s';

  @override
  String get iconNameRecord => 'تسجيل';

  @override
  String get iconNameRecordAlt => 'تسجيل Alt';

  @override
  String get iconNameEject => 'إخراج';

  @override
  String get iconNameShuffle => 'Shuffle';

  @override
  String get iconNameRepeat => 'تكرار';

  @override
  String get iconNameRepeatOne => 'تكرار واحد';

  @override
  String get iconNameVolumeUp => 'رفع الصوت';

  @override
  String get iconNameVolumeDown => 'خفض الصوت';

  @override
  String get iconNameVolumeOff => 'الصوت Off';

  @override
  String get iconNameMute => 'كتم';

  @override
  String get iconNameSpeaker => 'Speaker';

  @override
  String get iconNameSurroundSound => 'Surround Sound';

  @override
  String get iconNameEqualizer => 'Equalizer';

  @override
  String get iconNameAudio => 'صوت';

  @override
  String get iconNameMicrophone => 'Microphone';

  @override
  String get iconNameMicOff => 'Mic Off';

  @override
  String get iconNameUp => 'أعلى';

  @override
  String get iconNameDown => 'أسفل';

  @override
  String get iconNameLeft => 'يسار';

  @override
  String get iconNameRight => 'يمين';

  @override
  String get iconNameArrowUp => 'Arrow أعلى';

  @override
  String get iconNameArrowDown => 'Arrow أسفل';

  @override
  String get iconNameArrowLeft => 'Arrow يسار';

  @override
  String get iconNameArrowRight => 'Arrow يمين';

  @override
  String get iconNameNavigation => 'تنقل';

  @override
  String get iconNameChevronLeft => 'Chevron يسار';

  @override
  String get iconNameChevronRight => 'Chevron يمين';

  @override
  String get iconNameExpandLess => 'توسيع Less';

  @override
  String get iconNameExpandMore => 'توسيع المزيد';

  @override
  String get iconNameCollapse => 'Collapse';

  @override
  String get iconNameExpand => 'توسيع';

  @override
  String get iconNameCircleUp => 'Circle أعلى';

  @override
  String get iconNameCircleDown => 'Circle أسفل';

  @override
  String get iconNameCircleLeft => 'Circle يسار';

  @override
  String get iconNameCircleRight => 'Circle يمين';

  @override
  String get iconNameOkSelect => 'OK/اختر';

  @override
  String get iconNameConfirm => 'Confirm';

  @override
  String get iconNameCancel => 'إلغاء';

  @override
  String get iconNameClose => 'إغلاق';

  @override
  String get iconNameHome => 'الرئيسية';

  @override
  String get iconNameReturn => 'رجوع';

  @override
  String get iconNameExit => 'خروج';

  @override
  String get iconNameUndo => 'Undo';

  @override
  String get iconNameRedo => 'إعادة';

  @override
  String get iconNamePower => 'تشغيل';

  @override
  String get iconNamePowerAlt => 'تشغيل Alt';

  @override
  String get iconNamePowerOff => 'تشغيل Off';

  @override
  String get iconNameOn => 'تشغيل';

  @override
  String get iconNameOff => 'إيقاف';

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
  String get iconNameOne => 'واحد';

  @override
  String get iconNameTwo => 'اثنان';

  @override
  String get iconNameThree => 'ثلاثة';

  @override
  String get iconNameFour => 'أربعة';

  @override
  String get iconNameFive => 'خمسة';

  @override
  String get iconNameSix => 'ستة';

  @override
  String get iconNamePlus => 'زائد';

  @override
  String get iconNameMinus => 'ناقص';

  @override
  String get iconNameAddCircle => 'إضافة Circle';

  @override
  String get iconNameRemoveCircle => 'Remove Circle';

  @override
  String get iconNameSettings => 'الإعدادات';

  @override
  String get iconNameMenu => 'القائمة';

  @override
  String get iconNameMoreVertical => 'المزيد Vertical';

  @override
  String get iconNameMoreHorizontal => 'المزيد Horizontal';

  @override
  String get iconNameTune => 'ضبط';

  @override
  String get iconNameRemoteSettings => 'جهاز التحكم الإعدادات';

  @override
  String get iconNameInfo => 'معلومات';

  @override
  String get iconNameInfoOutline => 'معلومات Outline';

  @override
  String get iconNameHelp => 'مساعدة';

  @override
  String get iconNameHelpOutline => 'مساعدة Outline';

  @override
  String get iconNameList => 'قائمة';

  @override
  String get iconNameViewList => 'عرض قائمة';

  @override
  String get iconNameViewGrid => 'عرض Grid';

  @override
  String get iconNameApps => 'تطبيقات';

  @override
  String get iconNameWidgets => 'Widgets';

  @override
  String get iconNameTv => 'تلفاز';

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
  String get iconNameAutoBrightness => 'تلقائي Brightness';

  @override
  String get iconNameLightMode => 'فاتح الوضع';

  @override
  String get iconNameDarkMode => 'داكن الوضع';

  @override
  String get iconNameContrast => 'Contrast';

  @override
  String get iconNameHdrOn => 'HDR On';

  @override
  String get iconNameHdrOff => 'HDR Off';

  @override
  String get iconNameAspectRatio => 'Aspect Ratio';

  @override
  String get iconNameCrop => 'قص';

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
  String get iconNamePip => 'صورة داخل صورة';

  @override
  String get iconNameCropFree => 'Crop Free';

  @override
  String get iconNameInput => 'إدخال';

  @override
  String get iconNameCable => 'كابل';

  @override
  String get iconNameCast => 'بث';

  @override
  String get iconNameCastConnected => 'Cast متصل';

  @override
  String get iconNameScreenShare => 'Screen مشاركة';

  @override
  String get iconNameBluetooth => 'Bluetooth';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => 'Router';

  @override
  String get iconNameMemory => 'ذاكرة';

  @override
  String get iconNameGameConsole => 'Game Console';

  @override
  String get iconNameGaming => 'ألعاب';

  @override
  String get iconNameMedia => 'وسائط';

  @override
  String get iconNameMusicQueue => 'موسيقى قائمة انتظار';

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
  String get iconNameFavorite => 'مفضل';

  @override
  String get iconNameFavoriteOutline => 'مفضل Outline';

  @override
  String get iconNameStar => 'نجمة';

  @override
  String get iconNameStarOutline => 'Star Outline';

  @override
  String get iconNameBookmark => 'Bookmark';

  @override
  String get iconNameBookmarkOutline => 'Bookmark Outline';

  @override
  String get iconNameFlag => 'علم';

  @override
  String get iconNameCheck => 'تحقق';

  @override
  String get iconNameDone => 'تم';

  @override
  String get iconNameDoneAll => 'تم الكل';

  @override
  String get iconNameSchedule => 'Schedule';

  @override
  String get iconNameTimer => 'مؤقت';

  @override
  String get iconNameTime => 'الوقت';

  @override
  String get iconNameAlarm => 'منبه';

  @override
  String get iconNameNotifications => 'Notifications';

  @override
  String get iconNameLock => 'قفل';

  @override
  String get iconNameUnlock => 'Unlock';

  @override
  String get iconNameLight => 'فاتح';

  @override
  String get iconNameLightOutline => 'فاتح Outline';

  @override
  String get iconNameWarmLight => 'Warm فاتح';

  @override
  String get iconNameSunny => 'مشمس';

  @override
  String get iconNameCloudy => 'Cloudy';

  @override
  String get iconNameNight => 'ليل';

  @override
  String get iconNameFlare => 'توهج';

  @override
  String get iconNameGradient => 'Gradient';

  @override
  String get iconNameInvertColors => 'Invert Colors';

  @override
  String get iconNamePalette => 'Palette';

  @override
  String get iconNameColor => 'لون';

  @override
  String get iconNameTonality => 'Tonality';

  @override
  String get iconNameSearch => 'بحث';

  @override
  String get iconNameRefresh => 'تحديث';

  @override
  String get iconNameSync => 'مزامنة';

  @override
  String get iconNameUpdate => 'Update';

  @override
  String get iconNameDownload => 'Download';

  @override
  String get iconNameUpload => 'Upload';

  @override
  String get iconNameCloud => 'سحابة';

  @override
  String get iconNameFolder => 'مجلد';

  @override
  String get iconNameDelete => 'حذف';

  @override
  String get iconNameEdit => 'تعديل';

  @override
  String get iconNameSave => 'حفظ';

  @override
  String get iconNameShare => 'مشاركة';

  @override
  String get iconNamePrint => 'طباعة';

  @override
  String get iconNameLanguage => 'اللغة';

  @override
  String get iconNameTranslate => 'Translate';

  @override
  String get iconNameMicNone => 'Mic None';

  @override
  String get iconNameSubtitles => 'Subtitles';

  @override
  String get iconNameClosedCaption => 'Closed Caption';

  @override
  String get iconNameMusic => 'موسيقى';

  @override
  String get iconNameMovie => 'فيلم';

  @override
  String get iconNameTheater => 'Theater';

  @override
  String get iconNameLiveTv => 'Live TV';

  @override
  String get iconNameRadio => 'راديو';

  @override
  String get iconNameCamera => 'كاميرا';

  @override
  String get iconNameVideoCamera => 'Video كاميرا';

  @override
  String get iconNamePhotoCamera => 'Photo كاميرا';

  @override
  String get iconNameSlowMotion => 'Slow Motion';

  @override
  String get iconNameSpeed => 'سرعة';

  @override
  String get iconNameVideoSettings => 'Video الإعدادات';

  @override
  String get iconNameAudioTrack => 'صوت Track';

  @override
  String get iconNameGraphicEq => 'Graphic EQ';

  @override
  String get iconNameMusicVideo => 'موسيقى Video';

  @override
  String get iconNamePlaylist => 'Playlist';

  @override
  String get iconNameQueue => 'قائمة انتظار';

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
  String get iconNamePauseFa => 'إيقاف مؤقت FA';

  @override
  String get iconNameStopFa => 'إيقاف FA';

  @override
  String get iconNamePlayFaOutline => 'Play FA Outline';

  @override
  String get iconNamePauseFaOutline => 'إيقاف مؤقت FA Outline';

  @override
  String get iconNameStopFaOutline => 'إيقاف FA Outline';

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
  String get iconNameRepeatFa => 'تكرار FA';

  @override
  String get iconNameShuffleFa => 'Shuffle FA';

  @override
  String get iconNameEjectFa => 'Eject FA';

  @override
  String get iconNameFilmFa => 'Film FA';

  @override
  String get iconNameVideoFa => 'Video FA';

  @override
  String get iconNameMusicFa => 'موسيقى FA';

  @override
  String get iconNameMicrophoneFa => 'Microphone FA';

  @override
  String get iconNameCameraFa => 'كاميرا FA';

  @override
  String get iconNameCameraRetroFa => 'كاميرا Retro FA';

  @override
  String get iconNameVolumeHighFa => 'الصوت High FA';

  @override
  String get iconNameVolumeLowFa => 'الصوت Low FA';

  @override
  String get iconNameVolumeOffFa => 'الصوت Off FA';

  @override
  String get iconNameMuteFa => 'كتم FA';

  @override
  String get iconNameMicMuteFa => 'Mic كتم FA';

  @override
  String get iconNameHeadphonesFa => 'Headphones FA';

  @override
  String get iconNameSpeakerFa => 'Speaker FA';

  @override
  String get iconNameUpFa => 'أعلى FA';

  @override
  String get iconNameDownFa => 'أسفل FA';

  @override
  String get iconNameLeftFa => 'يسار FA';

  @override
  String get iconNameRightFa => 'يمين FA';

  @override
  String get iconNameUpFaOutline => 'أعلى FA Outline';

  @override
  String get iconNameDownFaOutline => 'أسفل FA Outline';

  @override
  String get iconNameLeftFaOutline => 'يسار FA Outline';

  @override
  String get iconNameRightFaOutline => 'يمين FA Outline';

  @override
  String get iconNameArrowUpFa => 'Arrow أعلى FA';

  @override
  String get iconNameArrowDownFa => 'Arrow أسفل FA';

  @override
  String get iconNameArrowLeftFa => 'Arrow يسار FA';

  @override
  String get iconNameArrowRightFa => 'Arrow يمين FA';

  @override
  String get iconNameChevronUpFa => 'Chevron أعلى FA';

  @override
  String get iconNameChevronDownFa => 'Chevron أسفل FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron يسار FA';

  @override
  String get iconNameChevronRightFa => 'Chevron يمين FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Outline';

  @override
  String get iconNameCheckFa => 'تحقق FA';

  @override
  String get iconNameCloseFa => 'إغلاق FA';

  @override
  String get iconNameCloseCircleFa => 'إغلاق Circle FA';

  @override
  String get iconNameHomeFa => 'الرئيسية FA';

  @override
  String get iconNameUndoFa => 'Undo FA';

  @override
  String get iconNameRedoFa => 'Redo FA';

  @override
  String get iconNameRotateFa => 'Rotate FA';

  @override
  String get iconNameSearchFa => 'ابحث FA';

  @override
  String get iconNameRefreshFa => 'Refresh FA';

  @override
  String get iconNamePowerOffFa => 'تشغيل Off FA';

  @override
  String get iconNamePlugFa => 'Plug FA';

  @override
  String get iconNameToggleOnFa => 'Toggle On FA';

  @override
  String get iconNameToggleOffFa => 'Toggle Off FA';

  @override
  String get iconNameSettingsFa => 'الإعدادات FA';

  @override
  String get iconNameSettingsAltFa => 'الإعدادات Alt FA';

  @override
  String get iconNameMenuFa => 'القائمة FA';

  @override
  String get iconNameMoreFa => 'المزيد FA';

  @override
  String get iconNameMoreVerticalFa => 'المزيد Vertical FA';

  @override
  String get iconNameInfoFa => 'معلومات FA';

  @override
  String get iconNameInfoFaOutline => 'معلومات FA Outline';

  @override
  String get iconNameHelpFa => 'مساعدة FA';

  @override
  String get iconNameHelpFaOutline => 'مساعدة FA Outline';

  @override
  String get iconNameListFa => 'قائمة FA';

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
  String get iconNameNightModeFa => 'ليل الوضع FA';

  @override
  String get iconNameLightFa => 'فاتح FA';

  @override
  String get iconNameLightFaOutline => 'فاتح FA Outline';

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
  String get iconNameColorFa => 'لون FA';

  @override
  String get iconNamePaintFa => 'Paint FA';

  @override
  String get iconNameInputFa => 'إدخال FA';

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
  String get iconNameCloudFa => 'سحابة FA';

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
  String get iconNameTimerFa => 'مؤقت FA';

  @override
  String get iconNameLockFa => 'قفل FA';

  @override
  String get iconNameUnlockFa => 'Unlock FA';

  @override
  String get iconNameGalleryFa => 'Gallery FA';

  @override
  String get iconNameImagesFa => 'Images FA';

  @override
  String get iconNameImageFa => 'Image FA';

  @override
  String get iconNameVideoFileFa => 'Video ملف FA';

  @override
  String get iconNameAudioFileFa => 'صوت ملف FA';

  @override
  String get iconNamePlayOutlineFa => 'Play Outline FA';

  @override
  String get iconNamePlaySimpleFa => 'Play Simple FA';

  @override
  String get iconNamePauseSimpleFa => 'إيقاف مؤقت Simple FA';

  @override
  String get iconNameStopSimpleFa => 'إيقاف Simple FA';

  @override
  String get iconNameRecordFa => 'تسجيل FA';

  @override
  String get iconNameStopCircleFa => 'إيقاف Circle FA';

  @override
  String get iconNameLoadingFa => 'Loading FA';

  @override
  String get iconNameTextFa => 'Text FA';

  @override
  String get iconNameTextSizeFa => 'Text Size FA';

  @override
  String get iconNameLanguageFa => 'اللغة FA';

  @override
  String get iconNameGlobeFa => 'Globe FA';

  @override
  String get iconNameSubtitlesAltFa => 'Subtitles Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Subtitles Alt Outline FA';

  @override
  String get iconNameChannelUpFa => 'Channel أعلى FA';

  @override
  String get iconNameChannelDownFa => 'Channel أسفل FA';

  @override
  String get iconNamePageUpFa => 'Page أعلى FA';

  @override
  String get iconNamePageDownFa => 'Page أسفل FA';

  @override
  String get iconNameGuideFa => 'Guide FA';

  @override
  String get iconNameGridViewFa => 'Grid عرض FA';

  @override
  String get iconNameGridAltFa => 'Grid Alt FA';

  @override
  String get iconNameScheduleFa => 'Schedule FA';

  @override
  String get iconNameCalendarFa => 'Calendar FA';

  @override
  String get iconNameRedButtonFa => 'Red زر FA';

  @override
  String get iconNameButtonOutlineFa => 'زر Outline FA';

  @override
  String get iconNameSquareButtonFa => 'Square زر FA';

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
  String get iconNameFilterFa => 'تصفية FA';

  @override
  String get iconNameSortDownFa => 'Sort أسفل FA';

  @override
  String get iconNameSortUpFa => 'Sort أعلى FA';

  @override
  String get iconNameSleepFa => 'Sleep FA';

  @override
  String get iconNameTimerStartFa => 'مؤقت بدء FA';

  @override
  String get iconNameTimerHalfFa => 'مؤقت Half FA';

  @override
  String get iconNameTimerEndFa => 'مؤقت End FA';

  @override
  String get iconNameStopwatchFa => 'Stopwatch FA';

  @override
  String get iconNameAlarmFa => 'منبه FA';

  @override
  String get iconNameCropAltFa => 'Crop Alt FA';

  @override
  String get iconNameCropFa => 'Crop FA';

  @override
  String get iconNameSquareFullFa => 'Square Full FA';

  @override
  String get iconNameFullscreenAltFa => 'Fullscreen Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Zoom زائد FA';

  @override
  String get iconNameZoomMinusFa => 'Zoom ناقص FA';

  @override
  String get iconNameMusicNoteFa => 'موسيقى Note FA';

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
  String get iconNameChildModeFa => 'Child الوضع FA';

  @override
  String get iconNameCastFa => 'Cast FA';

  @override
  String get iconNameStreamFa => 'Stream FA';

  @override
  String get iconNameSignalFa => 'إشارة FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => 'Circle Arrow أعلى FA';

  @override
  String get iconNameCircleArrowDownFa => 'Circle Arrow أسفل FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Circle Arrow يسار FA';

  @override
  String get iconNameCircleArrowRightFa => 'Circle Arrow يمين FA';

  @override
  String get iconNameLongArrowUpFa => 'Long Arrow أعلى FA';

  @override
  String get iconNameLongArrowDownFa => 'Long Arrow أسفل FA';

  @override
  String get iconNameLongArrowLeftFa => 'Long Arrow يسار FA';

  @override
  String get iconNameLongArrowRightFa => 'Long Arrow يمين FA';

  @override
  String get iconNamePlusFa => 'زائد FA';

  @override
  String get iconNameMinusFa => 'ناقص FA';

  @override
  String get iconNamePlusCircleFa => 'زائد Circle FA';

  @override
  String get iconNameMinusCircleFa => 'ناقص Circle FA';

  @override
  String get iconNamePlusSquareFa => 'زائد Square FA';

  @override
  String get iconNameMinusSquareFa => 'ناقص Square FA';

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
  String get iconNameCloudSunFa => 'سحابة Sun FA';

  @override
  String get iconNameCloudMoonFa => 'سحابة Moon FA';

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
  String get unknownLabel => 'غير معروف';

  @override
  String get selectedFilesLabel => 'المحدد file(s)';

  @override
  String get folderNotFoundOrInaccessible => 'مجلد not موجود or inaccessible.';

  @override
  String get importedRemoteDefaultName => 'ImportedRemote';

  @override
  String get demoRemoteName => 'Demo جهاز التحكم';

  @override
  String get protocolFieldsInvalid =>
      'املأ حقول البروتوكول المطلوبة وتأكد أن التردد بين 15k و 60k إذا تم ضبطه.';

  @override
  String get unknownProtocolSelected => 'تم تحديد بروتوكول غير معروف.';

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
  String get pinRemote => 'تثبيت جهاز التحكم';

  @override
  String get unpinRemote => 'إلغاء تثبيت جهاز التحكم';

  @override
  String get pinRemoteSubtitle => 'ضع جهاز التحكم في الأعلى للوصول إليه بسرعة.';

  @override
  String get remoteAddedToPinned => 'ثُبّت جهاز التحكم.';

  @override
  String get remoteRemovedFromPinned => 'أُلغي تثبيت جهاز التحكم.';

  @override
  String get homeDeviceControlsTitle => 'عناصر تحكم سريعة';

  @override
  String get homeDeviceControlsSubtitle =>
      'تشغيل وكتم صوت ومستوى صوت دون فتح جهاز تحكم.';

  @override
  String get homeDeviceControlsEmptySubtitle =>
      'قم بإعداد أزرار التشغيل وكتم الصوت ومستوى الصوت في عناصر تحكم الجهاز.';

  @override
  String get showDeviceControlsOnHome =>
      'إظهار عناصر التحكم السريعة في الشاشة الرئيسية';

  @override
  String get showDeviceControlsOnHomeSubtitle =>
      'إظهار صف التشغيل وكتم الصوت ومستوى الصوت المختصر في الشاشة الرئيسية.';

  @override
  String get homeDeviceControlsShown =>
      'تم إظهار عناصر التحكم السريعة في التطبيق.';

  @override
  String get homeDeviceControlsHidden =>
      'تم إخفاء عناصر التحكم السريعة في التطبيق.';

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
  String get learningModeCaptureFailed => 'تعذّر استقبال الإشارة.';

  @override
  String get learningModeReplaySent => 'تم إرسال الإشارة.';

  @override
  String get learningModeReplayFailed => 'تعذّر إرسال الإشارة المستقبلة.';

  @override
  String get learningModeNoRemotesAvailable => 'لا توجد أجهزة تحكم محفوظة بعد.';

  @override
  String get learningModeChooseRemoteTitle => 'اختر جهاز تحكم';

  @override
  String get learningModeNewRemoteTitle => 'إنشاء جهاز تحكم';

  @override
  String get learningModeSaveSuccess => 'تم حفظ الزر.';

  @override
  String get learningModeSaveFailed => 'تعذّر حفظ الزر.';

  @override
  String get remoteSetupIntro =>
      'اختر اسمًا لجهاز التحكم وتخطيطًا للأزرار، ثم أضف الأزرار في الخطوة التالية.';

  @override
  String get startWithDefault => 'استخدام الاسم الافتراضي';

  @override
  String get browseGithubStore => 'تصفح GitHub';

  @override
  String get addFirstButton => 'أضف الزر الأول';

  @override
  String get moreWaysToStart => 'طرق أخرى لإضافة الأزرار';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'هل تريد تجاهل إعداد جهاز التحكم الجديد؟ لن تُحفظ تغييراتك.';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'هل تريد تجاهل تغييرات جهاز التحكم؟ لن تُحفظ هذه التغييرات.';

  @override
  String get firstButtonAdded => 'تمت إضافة الزر الأول.';

  @override
  String get iconColorTitle => 'لون الرمز';

  @override
  String get iconColorHelper => 'اختر لونًا للرمز يبقى واضحًا فوق خلفية الزر.';

  @override
  String get colorRed => 'أحمر';

  @override
  String get colorPink => 'وردي';

  @override
  String get colorPurple => 'أرجواني';

  @override
  String get colorDeepPurple => 'أرجواني داكن';

  @override
  String get colorIndigo => 'نيلي';

  @override
  String get colorBlue => 'أزرق';

  @override
  String get colorLightBlue => 'أزرق فاتح';

  @override
  String get colorCyan => 'سماوي';

  @override
  String get colorTeal => 'تركوازي';

  @override
  String get colorGreen => 'أخضر';

  @override
  String get colorLightGreen => 'أخضر فاتح';

  @override
  String get colorLime => 'ليموني';

  @override
  String get colorYellow => 'أصفر';

  @override
  String get colorAmber => 'كهرماني';

  @override
  String get colorOrange => 'برتقالي';

  @override
  String get colorDeepOrange => 'برتقالي داكن';

  @override
  String get colorBrown => 'بني';

  @override
  String get colorGrey => 'رمادي';

  @override
  String get colorBlueGrey => 'أزرق رمادي';

  @override
  String get colorBlack => 'أسود';

  @override
  String get colorWhite => 'أبيض';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'لون الزر $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'لون الزر $colorName، محدد';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'لون الرمز $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'لون الرمز $colorName، محدد';
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
  String get quickSettingsTilesTitle => 'مربعات الإعدادات السريعة';

  @override
  String get quickSettingsPowerTile => 'مربع التشغيل';

  @override
  String get quickSettingsMuteTile => 'مربع كتم الصوت';

  @override
  String get quickSettingsVolumeUpTile => 'مربع رفع الصوت';

  @override
  String get quickSettingsVolumeDownTile => 'مربع خفض الصوت';

  @override
  String get quickSettingsNoTilesConfigured => 'لا توجد مربعات مهيأة';

  @override
  String get quickSettingsEmptyHint =>
      'الخطوة التالية: اختر أمرا لمربع واحد على الأقل، ثم أضف المربع من قائمة تحرير الإعدادات السريعة في Android.';

  @override
  String get quickSettingsSetPowerTile => 'تعيين مربع التشغيل';

  @override
  String get quickSettingsConfiguredHint =>
      'اختر الزر الذي يرسله كل مربع. أضف المربعات من قائمة تحرير الإعدادات السريعة في Android.';

  @override
  String get quickSettingsNotSet => 'غير معين';

  @override
  String quickSettingsTileMappingSummary(String title, String subtitle) {
    return '$title · $subtitle';
  }

  @override
  String get quickSettingsPickButtonTooltip => 'اختيار زر';

  @override
  String get quickSettingsClearTooltip => 'مسح';

  @override
  String get homeWidgetUnsupportedLauncher =>
      'أضف أداة IR Blaster من قائمة الأدوات على الشاشة الرئيسية بدلاً من ذلك.';

  @override
  String get homeWidgetButtonUnsupported =>
      'لا يمكن إضافة هذا الزر كأداة على الشاشة الرئيسية.';

  @override
  String get homeWidgetRequestSent =>
      'تم طلب إضافة الأداة. أكّد الإضافة على الشاشة الرئيسية إذا طُلب منك ذلك.';

  @override
  String get homeWidgetRequestRejected =>
      'تعذّر طلب إضافة الأداة. جرّب إضافتها من الشاشة الرئيسية.';

  @override
  String homeWidgetSetupFailed(String error) {
    return 'تعذّر إعداد الأداة: $error';
  }

  @override
  String get addHomeWidget => 'إضافة ودجة للشاشة الرئيسية';

  @override
  String get addHomeWidgetSubtitle => 'ضع هذا الزر على شاشتك الرئيسية.';

  @override
  String buttonInfoType(String type) {
    return 'النوع: $type';
  }

  @override
  String get buttonInfoCodeRaw => 'الرمز: إشارة خام';

  @override
  String buttonInfoCode(String code) {
    return 'الرمز: $code';
  }

  @override
  String get buttonInfoNoCode => 'لا يوجد رمز';

  @override
  String buttonInfoFrequency(String frequency) {
    return 'التردد: $frequency';
  }

  @override
  String get frequencyHzLabel => 'التردد (Hz)';

  @override
  String get carrierFrequencyHelper => 'تردد الحامل، مثال 38000';

  @override
  String get requiredFrequencyHelper => 'مطلوب. مثال: 38000';

  @override
  String get validFrequencyError => 'أدخل ترددا صالحا (15k-60k).';

  @override
  String get resetToDefaultFrequency => 'إعادة الضبط إلى 38000';

  @override
  String get rawDataLabel => 'البيانات الخام';

  @override
  String get rawDataHelper =>
      'أعداد صحيحة مفصولة بمسافات، مثال 9000 4500 560 560 ...';

  @override
  String get rawDataInvalid =>
      'يجب أن تكون البيانات الخام أعدادا صحيحة مفصولة بمسافات أو أسطر جديدة.';

  @override
  String get rawDataSafeguard =>
      'حماية: يتم حظر الرموز غير الصالحة لمنع حفظ نمط لا يمكن إرساله.';

  @override
  String get protocolLabel => 'البروتوكول';

  @override
  String get protocolEncodingHelper =>
      'الترميز متاح فقط للبروتوكولات المحددة كمنفذة.';

  @override
  String get protocolFrequencyHelper =>
      'اختياري. إذا كان فارغا، يتم استخدام التردد الافتراضي للبروتوكول عند توفره.';

  @override
  String get rawSignalInvalidWithFrequency =>
      'يجب أن تكون البيانات الخام أعدادا صحيحة مفصولة بمسافات أو أسطر جديدة، ويجب أن يكون التردد 15k-60k.';

  @override
  String get necTimingsNumeric => 'يجب أن تكون كل توقيتات NEC رقمية.';

  @override
  String get frequencyRangeError => 'يجب أن يكون التردد 15k-60k Hz.';

  @override
  String get pasteTooltip => 'لصق';

  @override
  String get clearTooltip => 'مسح';

  @override
  String irFinderResumeMask(Object value) {
    return 'القناع: $value';
  }

  @override
  String get irFinderKnownMaskLabel => 'قناع الرمز المعروف (اختياري)';

  @override
  String get irFinderKnownMaskHint => '00FFXXFF أو FFXXFF أو 0xA1XX';

  @override
  String irFinderKnownMaskHelper(int digits, Object example) {
    return 'حمولة من $digits خانات. استخدم X للخانات المجهولة، وتُعامل الخانات النهائية المحذوفة كـ X. مثال: $example';
  }

  @override
  String get irFinderKnownMaskInvalidCharacters =>
      'استخدم أرقام hex وبدائل X والمسافات والنقطتين والشرطات والشرطات السفلية فقط.';

  @override
  String irFinderKnownMaskTooLong(int digits) {
    return 'القناع أطول من حمولة هذا البروتوكول المكونة من $digits خانات.';
  }

  @override
  String irFinderNormalizedMaskValue(Object value) {
    return 'القناع الموحّد: $value';
  }

  @override
  String get irFinderNormalizedMask => 'القناع الموحّد';

  @override
  String get irFinderNormalizedMaskAllUnknown => 'كل الخانات مجهولة';

  @override
  String get irFinderSearchOrder => 'ترتيب البحث';

  @override
  String get irFinderSmartOrder => 'ذكي';

  @override
  String get irFinderSequentialOrder => 'تسلسلي';

  @override
  String get irFinderSmartOrderHint =>
      'يراعي البروتوكول: يختبر القيم المنخفضة الشائعة أولاً، ثم يوزع البحث على حقول الأوامر والجهاز ويتجاوز البتات التي يتجاهلها المُرمّز.';

  @override
  String get irFinderSequentialOrderHint =>
      'وضع التوافق: يختبر خانات البدل بترتيب hex تصاعدي.';

  @override
  String irFinderSmartMeaningfulBits(int bits) {
    return 'يغيّر الوضع الذكي $bits بتات ذات معنى لهذا القناع.';
  }

  @override
  String get irFinderBruteforceMaskTip =>
      'نصيحة: استبدل كل خانة مجهولة بـ X. تثبيت الخانات المعروفة في أي موضع يقلل البحث بشكل كبير.';

  @override
  String get automationBroadcastsTitle => 'السماح ببث الأتمتة';

  @override
  String get automationBroadcastsSubtitle =>
      'يمكن لأي تطبيق مثبّت إرسال أوامر الأشعة تحت الحمراء عبر المرسل المدمج أو USB أو مخرج الصوت، حتى عندما يكون هذا التطبيق مغلقًا. يتطلب USB إذنًا مسبقًا. ويتطلب الصوت محوّل أشعة تحت الحمراء ورفع مستوى صوت الوسائط.';

  @override
  String get automationSettingsError =>
      'تعذر تحميل إعداد الأتمتة أو حفظه. يرجى المحاولة مرة أخرى.';

  @override
  String get settingsHardwareTitle => 'أجهزة الأشعة تحت الحمراء والتعلّم';

  @override
  String get settingsHardwareSubtitle =>
      'اختيار باعث وإدارة USB وتعلّم الإشارات';

  @override
  String get settingsAppearanceSubtitle => 'المظهر والألوان ولغة التطبيق';

  @override
  String get settingsInteractionSubtitle =>
      'بدء التشغيل والاهتزاز وعرض جهاز التحكم والأتمتة';

  @override
  String get settingsToolsTitle => 'الأدوات والاختصارات';

  @override
  String get settingsToolsSubtitle =>
      'التحكم بالأجهزة والإعدادات السريعة ومتجر GitHub والطاقة العامة';

  @override
  String get layoutCustom => 'مخصص';

  @override
  String get layoutCustomDescription =>
      'اختر عدد الأعمدة وشكل الأزرار. أضف الفراغات في المحرر.';

  @override
  String get layoutColumns => 'الأزرار في كل صف';

  @override
  String get layoutShape => 'شكل الأزرار';

  @override
  String get layoutCircle => 'دائرة';

  @override
  String get layoutRoundedSquare => 'مربع مستدير الزوايا';

  @override
  String get layoutRectangle => 'مستطيل';

  @override
  String get layoutReflowHint =>
      'تغيير عدد الأعمدة يعيد ترتيب الشبكة. اسحب جانبياً إذا كانت الشبكة أعرض من الشاشة.';

  @override
  String get layoutUpdated => 'تم تحديث التخطيط';

  @override
  String get layoutArrange => 'ترتيب الأزرار';

  @override
  String get layoutAddRow => 'إضافة صف فارغ';

  @override
  String get layoutArrangeHint =>
      'اضغط مطولاً على زر واسحبه، أو المسه ثم المس موضعه الجديد. إذا كان هناك زر آخر، يتبادل الزران موضعيهما.';

  @override
  String get layoutEmptyHint =>
      'المس مساحة فارغة لإضافة زر، أو المس زرًا لتعديله. اضغط مطولاً على زر لعرض المزيد من الخيارات.';

  @override
  String layoutCell(int row, int column) {
    return 'الصف $row، العمود $column';
  }

  @override
  String get dbBrandSearchHelp =>
      'ابدأ بالعلامة التجارية، مثل Sony أو TCL. ثم اختر طراز الجهاز أو جهاز التحكم عن بُعد.';

  @override
  String get dbModelSearchHelp =>
      'ابحث عن الطراز المطبوع على الجهاز أو جهاز التحكم عن بُعد. لا يلزم تطابق المسافات والشرطات.';

  @override
  String get irFinderDatabaseSearchHint =>
      'ابدأ باختيار العلامة التجارية في وضع قاعدة البيانات لاختبار الرموز المعروفة دون تكرار. يرتب البحث الشامل الذكي الاحتمالات حسب الأولوية، لكنه لا يكتشف استجابة الجهاز. احفظ الرمز الناجح عندما تلاحظ استجابة.';

  @override
  String get irFinderClearSearchToJump =>
      'امسح البحث للانتقال إلى موضع في الاختبار.';

  @override
  String get crashReportTitle => 'حدثت مشكلة في المرة السابقة';

  @override
  String get crashReportExplanation =>
      'يحتوي تقرير محلي على تفاصيل تقنية عن التطبيق والجهاز والخطأ. لا يُرسل أي شيء تلقائيًا. راجع المعلومات الحساسة قبل المشاركة. المشاركة تُبقي التقرير؛ عدم الإرسال يحذفه؛ ليس الآن يحتفظ به حتى التشغيل التالي.';

  @override
  String get crashReportDetails => 'مراجعة التقرير';

  @override
  String get crashReportShare => 'مشاركة التقرير';

  @override
  String get crashReportEmail => 'مراسلة الدعم';

  @override
  String get crashReportCopied => 'تم نسخ التقرير.';

  @override
  String get crashReportDontSend => 'عدم الإرسال';

  @override
  String get crashReportNotNow => 'ليس الآن';

  @override
  String get crashReportActionFailed =>
      'تعذر إكمال الإجراء. ما زال التقرير محفوظًا. جرّب نسخه أو مشاركته.';

  @override
  String get shareTitle => 'المشاركة والاستلام';

  @override
  String get shareReceive => 'استلام';

  @override
  String get shareScan => 'مسح رمز QR';

  @override
  String get shareOpenFile => 'فتح ملف مشترك';

  @override
  String get shareSelect => 'اختر ما تريد مشاركته';

  @override
  String get shareSend => 'المشاركة مع جهاز آخر';

  @override
  String get shareQr => 'عرض رمز QR';

  @override
  String get shareQrHint =>
      'على الهاتف الآخر، افتح IR Blaster > أجهزة التحكم > المشاركة والاستلام > مسح رمز QR.';

  @override
  String get shareTooLarge =>
      'البيانات كثيرة جدًا لرمز QR واضح. استخدم المشاركة مع جهاز آخر.';

  @override
  String get sharePreview => 'مراجعة العناصر المشتركة';

  @override
  String get sharePrivacy =>
      'لا حاجة لحساب أو خادم. لا تُرسل بيانات أو إشارات تلقائيًا. يحتاج الجهاز المستلم إلى مرسل أشعة تحت الحمراء متوافق.';

  @override
  String get shareHardwareWarning =>
      'تتطلب بعض الإشارات المتعلمة العتاد الأصلي وقد لا تعمل على جهاز آخر.';

  @override
  String get shareMacroInfo =>
      'تتضمن الماكرو أجهزة التحكم والأزرار المرتبطة بها. ينشئ الاستيراد نسخًا جديدة دون استبدال أي شيء أو تشغيله تلقائيًا.';

  @override
  String get shareAdd => 'إضافة نسخ';

  @override
  String get shareAdded => 'تمت إضافة العناصر المشتركة.';

  @override
  String get shareDestination => 'إضافة الزر إلى';

  @override
  String get shareCamera =>
      'اسمح بالوصول إلى الكاميرا لمسح رموز QR أو افتح ملفًا مشتركًا.';

  @override
  String get shareInvalid =>
      'هذه البيانات غير صالحة أو كبيرة جدًا أو تستخدم إصدارًا غير مدعوم.';

  @override
  String get sharePrepareFailed =>
      'تعذر إعداد المشاركة. تحقق من الصور أو أزرار الماكرو المفقودة أو حجم المجموعة.';

  @override
  String get shareFailed =>
      'تعذر إكمال المشاركة أو الحفظ. لم تُستبدل عناصرك الحالية.';

  @override
  String get updatesTitle => 'تحديثات التطبيق';

  @override
  String get updatesAutomatic => 'التحقق التلقائي من التحديثات';

  @override
  String get updatesPrivacyGithub =>
      'معطّل افتراضيًا. عند تفعيله، يتصل التطبيق بـ GitHub مرة يوميًا أثناء استخدامه. لا يتم التنزيل تلقائيًا.';

  @override
  String get updatesPrivacyPlay =>
      'معطّل افتراضيًا. عند تفعيله، يتصل التطبيق بـ Google Play مرة يوميًا أثناء استخدامه. لا يتم التنزيل تلقائيًا.';

  @override
  String get updatesUnknown => 'غير معروف';

  @override
  String get updatesChooseSource => 'اختر مصدر التحديثات';

  @override
  String get updatesCheck => 'التحقق الآن';

  @override
  String get updatesNever => 'لم يتم التحقق بعد';

  @override
  String updatesLastChecked(String date) {
    return 'آخر تحقق: $date';
  }

  @override
  String updatesAvailable(String version) {
    return 'إصدار جديد: $version';
  }

  @override
  String get updatesCurrent => 'لم يتم العثور على إصدار أحدث.';

  @override
  String get updatesFailed =>
      'فشل التحديث. تحقق من الاتصال وحاول مجددًا. تُحظر ملفات APK غير المتوافقة ولا تُحذف بيانات التطبيق.';

  @override
  String get updatesFdroidNote =>
      'قد يُعلن GitHub عن إصدار قبل أن يُكمل F-Droid بناءه. حدّث عبر F-Droid للحفاظ على توافق التوقيع وبياناتك.';

  @override
  String get updatesOpenFdroid => 'فتح F-Droid';

  @override
  String get updatesOpenPlay => 'فتح Google Play';

  @override
  String get updatesDownload => 'تنزيل التحديث';

  @override
  String get updatesInstall => 'تثبيت التحديث';

  @override
  String get updatesAllowInstall => 'السماح بالتثبيت';

  @override
  String get updatesInstallHint =>
      'قد يطلب Android السماح بالتثبيت من هذا التطبيق. عد إلى هنا ثم اضغط على تثبيت التحديث. ستُحفظ أجهزة التحكم ووحدات الماكرو.';

  @override
  String get updatesReady => 'تم تنزيل التحديث وهو جاهز للتثبيت.';

  @override
  String get updatesNoAsset =>
      'لا يتوفر ملف APK تم التحقق منه لهذا الجهاز. راجع ملاحظات الإصدار.';

  @override
  String get updatesReleaseNotes => 'ملاحظات الإصدار';

  @override
  String updatesChannel(String source) {
    return 'مصدر التحديثات: $source';
  }

  @override
  String updatesDownloadConfirm(String size) {
    return 'هل تريد تنزيل $size ميغابايت من GitHub؟ يتطلب التثبيت تأكيدك.';
  }

  @override
  String get learningModeIncompleteSignal =>
      'يبدو أن الإشارة غير مكتملة. قرّب جهاز التحكم وحاول مجددًا.';

  @override
  String get learningModeUseUsb => 'استخدام محوّل USB';

  @override
  String get learningModeSwitchedUsb => 'تم التبديل إلى محوّل USB.';

  @override
  String learningModeSwitchUsbFailed(String error) {
    return 'تعذّر التبديل إلى محوّل USB: $error';
  }

  @override
  String get learningModeAudioUnavailableTitle => 'التعلّم عبر الصوت غير متاح';

  @override
  String get learningModeAudioUnavailableBody =>
      'يمكن لملحقات الأشعة تحت الحمراء المتصلة بالصوت إرسال الأوامر، لكن لا يمكنها تعلّم الإشارات في هذا التطبيق. استخدم مستقبلًا مدعومًا للتعلّم.';

  @override
  String learningModeBuiltInReceiver(String brand) {
    return 'مستقبل IR مدمج من $brand';
  }

  @override
  String get learningModeUsbReceiver => 'مستقبل USB للتعلّم';

  @override
  String learningModeDefaultRemoteName(String buttonName) {
    return 'جهاز تحكم $buttonName';
  }

  @override
  String get learningModeSupportedReceivers =>
      'استخدم مستقبلًا يدعمه هذا التطبيق:\n• محوّل IR USB متوافق من Tiqiaa أو ZaZa أو ElkSmart\n• هاتف Huawei / Honor مدعوم يمكنه استقبال الأشعة تحت الحمراء\n• هاتف LG مدعوم مزوّد بخدمة UEI Quickset\n\nليست كل الطرازات قادرة على التعلّم.';

  @override
  String learningModeCapturedWith(String device) {
    return 'تم استقبال الإشارة عبر $device';
  }

  @override
  String get learningModeLgReplayRestriction =>
      'لإعادة إرسال هذه الإشارة، يلزم استخدام هاتف LG نفسه الذي سجّلها.';

  @override
  String learningModeTimingCount(int count) {
    return 'الفترات المسجّلة: $count';
  }

  @override
  String get learningModeUnknownCarrier => 'تردد الموجة الحاملة غير معروف';

  @override
  String learningModeByteCount(int count) {
    return 'عدد البايتات: $count';
  }
}

/// The translations for Arabic, as used in Egypt (`ar_EG`).
class AppLocalizationsArEg extends AppLocalizationsAr {
  AppLocalizationsArEg() : super('ar_EG');

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'جار التحميل…';

  @override
  String get unknownError => 'خطأ غير معروف';

  @override
  String get failedToStart => 'تعذر البدء';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get quickTilePower => 'تشغيل';

  @override
  String get quickTileMute => 'كتم';

  @override
  String get quickTileVolumeUp => 'الصوت +';

  @override
  String get quickTileVolumeDown => 'الصوت -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'لقينا محوّل IR USB. اسمح بالوصول للـ USB عشان تبعت أوامر.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'الوصول للـ USB اترفض. اطلب الإذن تاني واسمح بالوصول عشان تبعت أوامر.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'الوصول للـ USB مسموح، لكن المحوّل لسه مش جاهز.';

  @override
  String get homeUsbOpenFailedMessage =>
      'ما قدرناش نتصل بمحوّل USB رغم إن الإذن موجود. افصله ووصّله تاني، وجرب من جديد.';

  @override
  String get homeUsbReadyMessage => 'محوّل IR USB جاهز.';

  @override
  String get homeUsbNoDeviceMessage =>
      'الموبايل ده مافيهوش مرسل IR مدمج، ومافيش محوّل IR USB مدعوم متوصل.';

  @override
  String get homeUsbOptionPlugIn =>
      'وصّل محوّل IR USB مدعوم واسمح بالوصول ليه.';

  @override
  String get homeUsbOptionReady => 'جاهز للإرسال.';

  @override
  String get homeUsbOptionPermissionRequired => 'متوصل. اسمح بالوصول للـ USB.';

  @override
  String get homeUsbOptionPermissionDenied => 'الوصول اترفض. اطلب الإذن تاني.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'الوصول مسموح. مستنيين المحوّل يجهز.';

  @override
  String get homeUsbOptionOpenFailed => 'الاتصال فشل. وصّل المحوّل تاني.';

  @override
  String get homeHardwareBannerNoInternal =>
      'مافيش مرسل IR مدمج. استخدم محوّل IR USB متوافق أو إكسسوار بيحوّل الصوت لأشعة تحت الحمراء.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'متوصل. اسمح بالوصول للـ USB.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'الوصول اترفض. اطلب الإذن تاني.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'الوصول مسموح. مستنيين المحوّل يجهز.';

  @override
  String get homeHardwareBannerOpenFailed => 'الاتصال فشل. وصّل المحوّل تاني.';

  @override
  String get homeHardwareBannerReady => 'جاهز للإرسال.';

  @override
  String get homeHardwareRequiredTitle => 'محتاج مرسل أشعة تحت الحمراء';

  @override
  String get homeUsbDongleRecommended => 'محوّل IR USB (بننصح بيه)';

  @override
  String get homeAudioAdapterAlternative => 'محوّل IR عن طريق الصوت';

  @override
  String get homeAudioAdapterDescription =>
      'محتاج محوّل صوت لـ IR. من الإعدادات، اختار الصوت (LED واحد أو اتنين) وارفع صوت الوسائط.';

  @override
  String get close => 'إغلاق';

  @override
  String get homeChooseTransmitter => 'اختار المرسل';

  @override
  String get openSettings => 'فتح الإعدادات';

  @override
  String get homeUsbPermissionSentApprove =>
      'طلبنا الإذن. اسمح بالوصول للـ USB في نافذة Android.';

  @override
  String get homeUsbDongleNotDetected =>
      'ما لقيناش محوّل IR USB مدعوم. وصّله وجرب تاني.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'ما قدرناش نطلب الوصول للـ USB. جرب تاني.';

  @override
  String get working => 'جارٍ التنفيذ…';

  @override
  String get requestUsbPermission => 'اطلب الوصول للـ USB';

  @override
  String get homeHardwareTip =>
      'تقدر تجهز ريموتاتك دلوقتي. هتحتاج مرسل IR بس لما تبعت أوامر.';

  @override
  String get homeNoIrTransmitterTitle => 'مافيش مرسل IR متاح';

  @override
  String get homeHardwareRequiredBody =>
      'تقدر تعمل ريموتات وترتبها من غير مرسل IR. عشان تتحكم في جهاز، استخدم واحد من الاختيارات اللي تحت.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'لسه تقدر تعمل ريموتات وتستوردها وترتبها.';

  @override
  String get homeWaysToUseIrBlaster => 'الأجهزة اللي تقدر تستخدمها';

  @override
  String get homeBuiltInIrOptionTitle => 'مرسل IR مدمج';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'بعض الموبايلات فيها مرسل IR مدمج، لكن الموبايل ده مافيهوش.';

  @override
  String get homeBuiltInIrUnavailable => 'مش مدمج في الموبايل ده';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'محوّل صوت لـ IR';

  @override
  String get homeContinueWithoutHardware => 'كمّل من غير إرسال';

  @override
  String get homeHowItWorks => 'طريقة الاستخدام';

  @override
  String get settingsNavLabel => 'الإعدادات';

  @override
  String get dismiss => 'تجاهل';

  @override
  String get remotesNavLabel => 'أجهزة التحكم';

  @override
  String get macrosNavLabel => 'الماكرو';

  @override
  String get signalTesterNavLabel => 'مختبر الإشارة';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get remoteNoIrEmitterTitle => 'مرسل الأشعة تحت الحمراء غير متاح';

  @override
  String get remoteNoIrEmitterMessage =>
      'لم يُكتشف مرسل أشعة تحت الحمراء متاح للاستخدام.';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'لإرسال الإشارات، تحتاج إلى مرسل مدمج في الهاتف أو مرسل خارجي متوافق.';

  @override
  String get remoteDismiss => 'متابعة التصفح';

  @override
  String get remoteClose => 'إغلاق التطبيق';

  @override
  String remoteFailedToSend(Object error) {
    return 'فشل إلى send IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'فشل إلى start loop: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Loop stopped (send فشل): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'يتم الآن تكرار \"$title\". اضغط إيقاف في الشريط العلوي للتوقف.';
  }

  @override
  String get remoteLoopStopped => 'Loop stopped.';

  @override
  String get remoteUpdatedNotFound =>
      'تم تحديث جهاز التحكم على الشاشة. لم يتم العثور عليه في القائمة المحفوظة.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'تم تحديث \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'تعذّر حذف جهاز التحكم: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'لم يُعثر على جهاز التحكم في القائمة المحفوظة.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'حُذف جهاز التحكم «$name».';
  }

  @override
  String get buttonFallbackTitle => 'زر';

  @override
  String get imageFallbackTitle => 'Image';

  @override
  String get noBrowserAvailable => 'No browser available';

  @override
  String failedToOpen(Object error) {
    return 'فشل الفتح: $error';
  }

  @override
  String get cancel => 'إلغاء';

  @override
  String get settingsRestoreDemoTitle => 'استعادة أجهزة التحكم التجريبية؟';

  @override
  String get settingsRestoreDemoMessage =>
      'سيؤدي هذا إلى استبدال أجهزة التحكم الحالية بالأجهزة التجريبية المدمجة. يُنصح بأخذ نسخة احتياطية إذا كنت تريد الاحتفاظ بالقائمة الحالية.';

  @override
  String get settingsRestoreDemoConfirm => 'استعادة التجريبي';

  @override
  String get settingsDemoRemotesRestored => 'تمت استعادة الأجهزة التجريبية.';

  @override
  String get settingsDeleteAllRemotesTitle => 'حذف all remotes?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'سيؤدي هذا إلى إزالة كل أجهزة التحكم من هذا الجهاز. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get settingsDeleteAllConfirm => 'حذف الكل';

  @override
  String get settingsAllRemotesDeleted => 'الكل remotes deleted.';

  @override
  String get themeAuto => 'تلقائي Theme';

  @override
  String get themeLight => 'فاتح Theme';

  @override
  String get themeDark => 'داكن Theme';

  @override
  String get themeDescAuto => 'يتبع إعدادات جهازك';

  @override
  String get themeDescLight => 'مشرق وواضح دائماً';

  @override
  String get themeDescDark => 'مريح للعين';

  @override
  String get themeHintAuto =>
      'يتبدل المظهر تلقائياً عند تغيير إعدادات جهازك بين الوضع الفاتح والداكن';

  @override
  String get themeHintLight => 'مثالي للاستخدام النهاري والأماكن المضيئة جيداً';

  @override
  String get themeHintDark =>
      'يقلل إجهاد العين في الإضاءة المنخفضة ويوفر البطارية على شاشات OLED';

  @override
  String get supportDevelopmentTitle => 'دعم التطوير';

  @override
  String get supportDevelopmentSubtitle =>
      'ساعد على إبقاء IR Blaster محدثاً ومتوافقاً مع العتاد';

  @override
  String get supportDevelopmentBody =>
      'لا إعلانات، ولا تتبع، ولا ميزات مقفلة. دعمك يمول عمل البروتوكولات، ودعم دونجل USB، وتحسين التوافق بين الأجهزة.';

  @override
  String get donate => 'تبرع';

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
  String get supportPillOpenSource => 'فتح-source';

  @override
  String get appearanceTitle => 'Appearance';

  @override
  String get appearanceSubtitle => 'خصص تجربتك البصرية';

  @override
  String get localizationTitle => 'الترجمة';

  @override
  String get localizationSubtitle => 'لغة التطبيق وسلوك الترجمة';

  @override
  String localizationAutoUsing(Object language) {
    return 'تلقائي، يستخدم $language';
  }

  @override
  String get localizationAutoDescription => 'يتبع التطبيق لغة جهازك متى أمكن.';

  @override
  String get localizationManualDescription => 'تم ضبط لغة التطبيق يدوياً.';

  @override
  String get useSystemLanguageTitle => 'استخدام لغة النظام';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'يتبع لغة جهازك: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'استخدم اللغة المحددة أدناه بدلاً من لغة الجهاز الافتراضية.';

  @override
  String get chooseAppLanguage => 'اختر لغة التطبيق';

  @override
  String get languagePickerDisabledHint =>
      'أوقف لغة النظام لاختيار لغة يدوياً.';

  @override
  String get searchLanguages => 'ابحث عن اللغات';

  @override
  String get noLanguagesFound => 'لا توجد لغات مطابقة';

  @override
  String get localizationHint =>
      'عند تفعيل لغة النظام، يتبع التطبيق إعداد اللغة في جهازك ويعود إلى الإنجليزية إذا لم تتوفر ترجمة. أوقفه لقفل التطبيق على لغة محددة.';

  @override
  String get appLanguageTitle => 'لغة التطبيق';

  @override
  String get appLanguageHint =>
      'الوضع التلقائي يتبع لغة جهازك. اختر الإنجليزية أو الفرنسية هنا لتطبيقها على التطبيق فقط.';

  @override
  String get languageAuto => 'تلقائي، النظام';

  @override
  String get languageAutoDescription => 'اتبع لغة جهازك تلقائياً';

  @override
  String get languageEnglish => 'الإنجليزية';

  @override
  String get languageEnglishDescription =>
      'اجعل التطبيق يستخدم الإنجليزية دائماً';

  @override
  String get languageFrench => 'الفرنسية';

  @override
  String get languageFrenchDescription => 'اجعل التطبيق يستخدم الفرنسية دائماً';

  @override
  String get languageAutoShort => 'تلقائي';

  @override
  String get languageEnglishShort => 'الإنجليزية';

  @override
  String get languageFrenchShort => 'الفرنسية';

  @override
  String get useDynamicColors => 'Use dynamic colors';

  @override
  String get themeChoiceAuto => 'تلقائي';

  @override
  String get themeChoiceLight => 'فاتح';

  @override
  String get themeChoiceDark => 'داكن';

  @override
  String get irTransmitterTitle => 'IR Transmitter';

  @override
  String get irTransmitterSubtitle => 'اختر التي hardware sends IR commands';

  @override
  String get learningModeEntryTitle => 'تعلّم الإشارات';

  @override
  String get learningModeEntrySubtitle =>
      'انسخ إشارة الأشعة تحت الحمراء لزر من الريموت.';

  @override
  String get learningModeTitle => 'تعلّم الإشارات';

  @override
  String get learningModeHeroTitle => 'تعلم زر التحكم عن بعد بشكل نظيف';

  @override
  String get learningModeHeroSubtitle =>
      'قم بإعداد جهاز الاستقبال الخاص بك، وقم بإعداد جهاز التحكم عن بعد الأصلي، والتقط أمرًا واحدًا، ثم قم بمراجعته قبل حفظه في جهاز التحكم عن بعد.';

  @override
  String get learningModeReadyBadge => 'المتلقي جاهز';

  @override
  String get learningModeNeedsPermissionBadge => 'إذن USB مطلوب';

  @override
  String get learningModeSetupBadge => 'يلزم إعداد جهاز الاستقبال';

  @override
  String get learningModeNoReceiverBadge => 'لا يوجد استقبال التعلم';

  @override
  String get learningModeCheckingBadge => 'فحص الأجهزة';

  @override
  String get learningModeFourStepFlow => 'تدفق موجه من 4 خطوات';

  @override
  String get learningModeSaveAnywhereBadge => 'المراجعة قبل الحفظ';

  @override
  String get learningModeGuideTitle =>
      'التقط المكان الذي يجب أن يحدث فيه الالتقاط';

  @override
  String get learningModeStepHardwareShort => 'الأجهزة';

  @override
  String get learningModeStepPrepareShort => 'يحضر';

  @override
  String get learningModeStepCaptureShort => 'يأسر';

  @override
  String get learningModeStepReviewShort => 'مراجعة';

  @override
  String get learningModeStepHardwareTitle => 'تحقق من أجهزة الاستقبال';

  @override
  String get learningModeStepHardwareSubtitle =>
      'تأكد من توصيل جهاز استقبال تعليمي متوافق واعتماده قبل البدء.';

  @override
  String get learningModeCurrentSenderLabel => 'الارسال الحالي';

  @override
  String get learningModeReceiverStatusLabel => 'حالة التعلم';

  @override
  String get learningModeCheckingHardwareBody =>
      'جاري فحص المرسل ومستقبل الأشعة تحت الحمراء.';

  @override
  String get learningModeHardwareReadyBody =>
      'يتم توصيل دونجل USB IR وتهيئته. هذا هو المكان المناسب لبدء تدفق التعلم بمجرد توصيل أسلاك الالتقاط.';

  @override
  String get learningModeHardwarePermissionBody =>
      'اسمح بالوصول لمحوّل USB، وبعدها ابدأ تعلّم الإشارة.';

  @override
  String get learningModeHardwareSetupBody =>
      'المستقبل مش جاهز. راجع إعداده أو وصّله من جديد، وبعدها جرّب تاني.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'وصّل مستقبل أشعة تحت الحمراء متوافق علشان تتعلّم إشارات الريموت.';

  @override
  String get learningModeRefreshHardware => 'فحص المستقبل';

  @override
  String get learningModeHardwareTipTitle => 'أفضل موضع';

  @override
  String get learningModeHardwareTipBody =>
      'يوجد وضع التعلم ضمن جهاز إرسال الأشعة تحت الحمراء لأنه يعتمد على توفر الأجهزة ويتم استخدامه بشكل أقل من إرسال أجهزة التحكم عن بعد.';

  @override
  String get learningModeStepPrepareTitle => 'تحضير جهاز التحكم عن بعد الأصلي';

  @override
  String get learningModeStepPrepareSubtitle =>
      'قرر ما تتعلمه، ثم احتفظ بجهاز التحكم عن بعد الأصلي ثابتًا وقريبًا من جهاز الاستقبال.';

  @override
  String get learningModeButtonNameLabel => 'اسم الزر';

  @override
  String get learningModeButtonNameHint => 'زي: التشغيل، HDMI 1، القائمة';

  @override
  String get learningModeSinglePress => 'ضغطة واحدة';

  @override
  String get learningModeHoldButton => 'زر الضغط';

  @override
  String get learningModePreparationChecklistTitle => 'قبل أن تلتقط';

  @override
  String get learningModePreparationItemDistance =>
      'احتفظ بجهاز التحكم عن بعد الأصلي على بعد 2 إلى 5 سم تقريبًا من جهاز الاستقبال.';

  @override
  String get learningModePreparationItemOneButton =>
      'تعلم زرًا واحدًا في كل مرة واستخدم ضغطة قصيرة ونظيفة أولاً.';

  @override
  String get learningModePreparationItemStill =>
      'حافظ على ثبات كلا الجهازين لتجنب التقاط الصور الصاخبة أو الجزئية.';

  @override
  String get learningModeStepCaptureTitle => 'التقط الإشارة';

  @override
  String get learningModeStepCaptureSubtitle =>
      'استمع لأمر واحد، ثم قم بقفل النتيجة قبل مراجعتها.';

  @override
  String get learningModeCaptureReadyTitle => 'جاهز للاستماع';

  @override
  String get learningModeCaptureReadyBody =>
      'حالة أجهزتك تبدو جيدة. سيتم توصيل الواجهة الخلفية للالتقاط بهذه الخطوة التالية.';

  @override
  String get learningModeCaptureBlockedTitle => 'الأجهزة ليست جاهزة بعد';

  @override
  String get learningModeCaptureBlockedBody =>
      'لا يزال بإمكانك مراجعة التدفق الآن، ولكن يجب أن ينتظر الالتقاط حتى يصبح جهاز الاستقبال جاهزًا.';

  @override
  String get learningModeStartListening => 'بدء الاستقبال';

  @override
  String get learningModeCaptureStubTitle => 'التقاط الخلفية يأتي بعد ذلك';

  @override
  String get learningModeCaptureStubBody =>
      'يتم دعم هذه الشاشة بالكامل أولاً حتى يمكن توصيل تدفق الالتقاط النهائي بحالات الأجهزة الحقيقية بدلاً من تثبيته لاحقًا.';

  @override
  String get learningModeCaptureStubMessage =>
      'التقاط التعلم ليس سلكيًا بعد. تعمل هذه الشاشة على دعم التدفق الكامل أولاً.';

  @override
  String get learningModeUnnamedCapture => 'إشارة من غير اسم';

  @override
  String get learningModeStatusCheckingTitle => 'جاري فحص المستقبل';

  @override
  String get learningModeStatusNoReceiverTitle => 'المستقبل مش جاهز';

  @override
  String get learningModeStatusPermissionTitle => 'مطلوب إذن USB';

  @override
  String get learningModeStatusSetupTitle => 'المستقبل محتاج إعداد';

  @override
  String get learningModeStatusReadyTitle => 'جاهز للتعلّم';

  @override
  String get learningModeStatusListeningTitle => 'في انتظار الإشارة';

  @override
  String get learningModeStatusCapturedTitle => 'تم استقبال الإشارة';

  @override
  String get learningModeStatusReadyBody =>
      'قم بتسمية الزر، وقم بتوجيه جهاز التحكم عن بعد الأصلي نحو جهاز الاستقبال، وابدأ في الاستماع عندما تكون جاهزًا.';

  @override
  String get learningModeStatusListeningBody =>
      'وجّه الريموت الأصلي ناحية المستقبل واضغط على الزر مرة واحدة.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'تم استقبال إشارة $buttonName. ابعتها عشان تتأكد إن الجهاز بيستجيب، وبعدها احفظها.';
  }

  @override
  String get learningModeConnectReceiverTitle => 'وصّل مستقبل أشعة تحت الحمراء';

  @override
  String get learningModeConnectReceiverBody =>
      'يعتمد وضع التعلم على الأجهزة الخارجية التي يمكنها استقبال الأشعة تحت الحمراء. بمجرد اكتشاف جهاز الاستقبال والترخيص له، تصبح هذه الصفحة بمثابة تدفق مباشر للاستماع والاختبار والحفظ.';

  @override
  String get learningModeListenCardTitle => 'استمع لزر واحد';

  @override
  String get learningModeListenCardBody =>
      'قم بتعيين الملصق أولاً إذا كنت تريد ذلك، ثم ابدأ الاستماع واضغط على الزر الموجود على جهاز التحكم عن بعد الأصلي.';

  @override
  String get learningModeReadyToListenTitle => 'جاهز للاستقبال';

  @override
  String get learningModeReadyToListenBody =>
      'وجّه الريموت الأصلي ناحية المستقبل، وبعدها ابدأ استقبال الإشارة.';

  @override
  String get learningModeListeningNowTitle => 'في انتظار الإشارة';

  @override
  String get learningModeListeningNowBody =>
      'اضغط على زر التحكم عن بعد الأصلي مرة واحدة. استخدم التقاط المعاينة للتنقل عبر بقية السقالة قبل أن يتم توصيل واجهة الالتقاط الخلفية الحقيقية.';

  @override
  String get learningModePreviewCaptureAction => 'معاينة الإشارة الملتقطة';

  @override
  String get learningModeCapturedSummary => 'الإشارة المستقبلة';

  @override
  String get learningModeResultActionsTitle => 'اختبار وحفظ';

  @override
  String get learningModeResultActionsBody =>
      'ابعت الإشارة واتأكد إن الجهاز بيستجيب قبل ما تحفظ الزر.';

  @override
  String get learningModeReplayAction => 'إرسال تاني';

  @override
  String get learningModeReplayStubMessage =>
      'إعادة التشغيل ليست سلكية بعد. هذه هي دعامة واجهة المستخدم لتدفق التعلم والاختبار والحفظ النهائي.';

  @override
  String get learningModeSaveStubMessage =>
      'الحفظ ليس سلكيًا بعد. الخطوة التالية هي توصيل هذه الشاشة بـ \"إنشاء زر\" وأجهزة التحكم عن بعد الموجودة.';

  @override
  String get learningModeLearnAnotherAction => 'تعلّم زر تاني';

  @override
  String get learningModeStepReviewTitle => 'مراجعة وحفظ';

  @override
  String get learningModeStepReviewSubtitle =>
      'قم بتأكيد ما تعلمته، ثم اختر المكان الذي يجب أن يكون موجودًا فيه في مكتبتك البعيدة.';

  @override
  String get learningModeSaveToExistingRemote => 'ريموت محفوظ';

  @override
  String get learningModeCreateNewRemote => 'ريموت جديد';

  @override
  String get learningModeProtocolPreviewTitle => 'معاينة البروتوكول';

  @override
  String get learningModeProtocolPreviewBody =>
      'ستظهر هنا تفاصيل البروتوكول الذي تم فك تشفيره بمجرد أن يلتقط جهاز الاستقبال ضغطة زر نظيفة.';

  @override
  String get learningModeRawPreviewTitle => 'البيانات الخام';

  @override
  String get learningModeRawPreviewBody =>
      'إذا لم يكتمل فك التشفير، فسيظل التقاط التوقيت الأولي متاحًا هنا للمراجعة والحفظ.';

  @override
  String get learningModeSaveCapture => 'حفظ الإشارة';

  @override
  String get learningModeReviewTipTitle => 'أين سيذهب هذا بعد ذلك';

  @override
  String get learningModeReviewTipBody =>
      'يجب أن تقوم خطوة التنفيذ التالية بتوصيل لوحة المراجعة هذه بزر الإنشاء وأجهزة التحكم عن بعد الموجودة بحيث تنخفض الإشارة المستفادة مباشرة إلى مكتبتك.';

  @override
  String get learningModeFinishPreview => 'إنهاء المعاينة';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interaction';

  @override
  String get interactionSubtitle => 'استجابة اللمس وتخطيط جهاز التحكم';

  @override
  String get autoOpenLastRemoteTitle => 'فتح آخر جهاز تحكم عند بدء التشغيل';

  @override
  String get autoOpenLastRemoteSubtitle =>
      'يفتح آخر جهاز تحكم تم استخدامه عند بدء التطبيق. إذا لم يعد متاحًا، فستظهر قائمة أجهزة التحكم.';

  @override
  String get hapticFeedbackTitle => 'Haptic feedback';

  @override
  String get hapticFeedbackSubtitle => 'اهتزاز عند اللمس والإجراءات';

  @override
  String get forceInAppVibrationTitle => 'فرض الاهتزاز داخل التطبيق';

  @override
  String get forceInAppVibrationSubtitle =>
      'استخدام الهزاز مباشرة حتى إذا كان اللمس الارتدادي للنظام معطلاً';

  @override
  String get forceInAppVibrationWarning =>
      'خيار متقدم. قد يجعل التطبيق يهتز حتى عندما يكون اللمس الارتدادي في أندرويد معطلاً على مستوى النظام.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'تم تعطيل اهتزاز النظام في أندرويد. لا يمكن للاهتزاز داخل التطبيق تجاوزه على هذا الجهاز.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'الجهاز ده لا يبلّغ عن وجود محرك اهتزاز، لذلك لا يمكن أن يعمل الاهتزاز داخل التطبيق.';

  @override
  String get intensity => 'Intensity';

  @override
  String get intensityLight => 'فاتح';

  @override
  String get intensityMedium => 'Medium';

  @override
  String get intensityStrong => 'Strong';

  @override
  String get remoteButtonMetadataTitle => 'إظهار التسميات التقنية للأزرار';

  @override
  String get remoteButtonMetadataSubtitle =>
      'اعرض البروتوكول والرمز وتردد الإرسال على أزرار جهاز التحكم.';

  @override
  String get remoteButtonMetadataShown => 'تم إظهار التسميات التقنية للأزرار.';

  @override
  String get remoteButtonMetadataHidden => 'تم إخفاء التسميات التقنية للأزرار.';

  @override
  String get flipRemoteDefaultTitle => 'Flip جهاز التحكم عرض by default';

  @override
  String get flipRemoteDefaultSubtitle =>
      'فتح جهاز التحكم screens rotated 180° (for bottom-mounted USB dongles).';

  @override
  String get remoteViewFlipped => 'سيفتح عرض جهاز التحكم بوضع مقلوب.';

  @override
  String get remoteViewNormal => 'سيفتح عرض جهاز التحكم بشكل عادي.';

  @override
  String get backupTitle => 'نسخة احتياطية';

  @override
  String get backupSubtitle => 'استيراد أو تصدير أجهزة التحكم والماكرو';

  @override
  String get importBackup => 'استيراد نسخة احتياطية';

  @override
  String get importBackupSubtitle =>
      'استيراد نسخة أجهزة التحكم أو الماكرو أو ملفات Flipper Zero أو LIRC أو IRPLUS';

  @override
  String get bulkImportFolder => 'Bulk import folder';

  @override
  String get bulkImportFolderSubtitle => 'استيراد multiple remotes من a folder';

  @override
  String get exportBackup => 'تصدير نسخة احتياطية';

  @override
  String get exportBackupSubtitle =>
      'احفظ أجهزة التحكم والماكرو في ملف JSON واحد داخل التنزيلات';

  @override
  String get restoreDemoRemotes => 'استعادة الأجهزة التجريبية';

  @override
  String get restoreDemoRemotesSubtitle =>
      'استبدال الأجهزة الحالية بالنسخة التجريبية المدمجة';

  @override
  String get deleteAllRemotes => 'حذف all remotes';

  @override
  String get deleteAllRemotesSubtitle => 'إزالة كل أجهزة التحكم من هذا الجهاز';

  @override
  String get backupTip =>
      'ملاحظة: صدّر نسخة احتياطية قبل التعديلات الكبيرة. يدعم الاستيراد النسخ الكاملة ونسخ JSON القديمة الخاصة بالأجهزة فقط وملفات Flipper Zero بصيغة .ir.';

  @override
  String get aboutTitle => 'حول';

  @override
  String get aboutSubtitle => 'معلومات التطبيق وتفاصيل المصدر المفتوح';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Version $version';
  }

  @override
  String get sourceCode => 'المصدر Code';

  @override
  String get viewOnGitHub => 'عرض on GitHub';

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
  String get openSourceLicense => 'فتح-source license';

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
  String get openSourceLicenses => 'فتح source licenses';

  @override
  String byCreator(Object creator) {
    return 'by $creator';
  }

  @override
  String get deviceControlsTitle => 'الجهاز Controls';

  @override
  String get deviceControlsSubtitle =>
      'اعرض الأزرار المفضلة في صفحة عناصر تحكم النظام';

  @override
  String get manageFavorites => 'إدارة المفضلات';

  @override
  String get manageFavoritesSubtitle =>
      'اختر الأزرار التي تظهر في عناصر تحكم الجهاز';

  @override
  String get quickSettingsTitle => 'Quick الإعدادات';

  @override
  String get quickSettingsSubtitle => 'أضف مربعات لاختصارات الطاقة والصوت';

  @override
  String get configureTiles => 'تكوين المربعات';

  @override
  String get configureTilesSubtitle => 'اربط المربعات بأزرار جهاز التحكم';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle => 'Universal power cycling for owned أجهزة';

  @override
  String get openTvKill => 'فتح TVKill';

  @override
  String get openTvKillSubtitle =>
      'Cycle power codes (use only on أجهزة you own)';

  @override
  String get failedToLoadTransmitterSettings =>
      'فشل إلى تحميل transmitter settings.';

  @override
  String get usbStatusReady => 'دونجل USB متصل وجاهز لإرسال IR.';

  @override
  String get usbStatusPermissionRequired =>
      'تم اكتشاف دونجل USB. اطلب إذن USB ووافق على رسالة النظام.';

  @override
  String get usbStatusPermissionDenied =>
      'تم رفض إذن USB للدونجل الموصول. اطلبه مرة أخرى ووافق على الرسالة.';

  @override
  String get usbStatusPermissionGranted =>
      'تم منح إذن USB. ما زال الدونجل يحتاج إلى تهيئة قبل أن يتمكن من إرسال IR.';

  @override
  String get usbStatusOpenFailed =>
      'تم منح إذن USB، لكن تعذر تهيئة الدونجل. أعد توصيله وحاول مرة أخرى.';

  @override
  String get usbStatusNoDevice => 'لم يتم اكتشاف دونجل IR عبر USB مدعوم.';

  @override
  String get usbSelectPermissionRequired =>
      'تم اكتشاف دونجل USB لكنه غير مصرح. اضغط طلب إذن USB.';

  @override
  String get usbSelectPermissionDenied =>
      'تم رفض إذن USB. اضغط طلب إذن USB ووافق على الرسالة.';

  @override
  String get usbSelectPermissionGranted =>
      'تم منح إذن USB، لكن الدونجل لم يتهيأ بعد. جرّب إعادة توصيله.';

  @override
  String get usbSelectOpenFailed =>
      'تم منح إذن USB، لكن تعذر تهيئة الدونجل. أعد توصيله وحاول مرة أخرى.';

  @override
  String get usbSelectNoDevice =>
      'لم يتم اكتشاف دونجل IR عبر USB مدعوم. وصّله ثم اضغط طلب إذن USB.';

  @override
  String get usbSelectReady => 'دونجل USB جاهز.';

  @override
  String get autoSwitchEnabledMessage =>
      'التبديل التلقائي مفعّل: يستخدم USB عند التوصيل، وإلا الداخلي.';

  @override
  String get autoSwitchDisabledMessage =>
      'تلقائي-switch disabled: transmitter selection is now يدوي.';

  @override
  String get failedToUpdateAutoSwitch => 'فشل إلى update auto-switch setting.';

  @override
  String get failedToSwitchTransmitter => 'فشل إلى switch transmitter.';

  @override
  String get deviceHasNoInternalIr => 'هذا الجهاز لا يحتوي على مرسل IR مدمج.';

  @override
  String get audioModeEnabledMessage =>
      'تم تفعيل وضع الصوت. استخدم أعلى مستوى لصوت الوسائط ومحول صوت إلى IR LED.';

  @override
  String get usbPermissionRequestSent => 'تم إرسال طلب إذن USB.';

  @override
  String get usbPermissionRequestSentApprove =>
      'تم إرسال طلب إذن USB. وافق على الرسالة لتفعيل USB.';

  @override
  String get usbAlreadyReady => 'تمت تهيئة دونجل USB بالفعل وهو جاهز.';

  @override
  String get failedToRequestUsbPermission => 'فشل طلب إذن USB.';

  @override
  String get transmitterHelpInternal =>
      'استخدم مرسل IR المدمج في الهاتف لإرسال الأوامر.';

  @override
  String get transmitterHelpUsb =>
      'استخدم دونجل IR عبر USB، الإذن مطلوب، لإرسال الأوامر.';

  @override
  String get transmitterHelpAudio1 =>
      'استخدم خرج الصوت أحادي. يتطلب محول صوت إلى IR LED ومستوى صوت وسائط مرتفع.';

  @override
  String get transmitterHelpAudio2 =>
      'استخدم خرج الصوت الستيريو. يستخدم قناتين لتحسين تشغيل LED مع المحولات المتوافقة.';

  @override
  String get transmitterInternal => 'Internal IR';

  @override
  String get transmitterUsb => 'دونجل IR عبر USB';

  @override
  String get transmitterAudio1 => 'صوت (1 LED)';

  @override
  String get transmitterAudio2 => 'صوت (2 LEDs)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'فشل إلى تحميل transmitter capabilities.';

  @override
  String get selectedTransmitter => 'المحدد transmitter';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Active: $active';
  }

  @override
  String get refresh => 'تحديث';

  @override
  String get autoSwitchTitle => 'تلقائي-switch';

  @override
  String get autoSwitchDisabledWhileAudio => 'Disabled while using صوت mode';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'يستخدم USB عند التوصيل، وإلا الداخلي';

  @override
  String get unavailableOnThisDevice => 'غير متاح على هذا الجهاز';

  @override
  String get openOnUsbAttachTitle => 'الفتح عند توصيل USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'قد يقترح أندرويد فتح التطبيق عند توصيل دونجل IR عبر USB مدعوم.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'سيُقترح فتح IR Blaster عند توصيل دونجل USB مدعوم.';

  @override
  String get openOnUsbAttachDisabledMessage => 'لن يُقترح الفتح عند توصيل USB.';

  @override
  String get failedToUpdateSetting => 'فشل إلى update setting.';

  @override
  String get unnamedButton => 'زر من غير اسم';

  @override
  String get iconFallback => 'أيقونة';

  @override
  String get remoteListReorderHint =>
      'اضغط مطوّلًا على جهاز تحكم واسحبه لتغيير ترتيبه.';

  @override
  String get deleteRemoteTitle => 'حذف جهاز التحكم؟';

  @override
  String deleteRemoteMessage(Object name) {
    return 'سيُحذف جهاز التحكم «$name» نهائيًا. لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get delete => 'حذف';

  @override
  String get addToDeviceControlsTitle => 'إضافة إلى عناصر تحكم الجهاز؟';

  @override
  String get addToDeviceControlsDescription =>
      'وصول سريع من عناصر تحكم الجهاز في النظام.';

  @override
  String get skip => 'تخطي';

  @override
  String get add => 'إضافة';

  @override
  String get addedToDeviceControls => 'Added إلى الجهاز Controls.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'حُذف جهاز التحكم «$name». لا يمكن التراجع عن الحذف.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count زر',
      many: '$count زرًا',
      few: '$count أزرار',
      two: 'زران',
      one: 'زر واحد',
      zero: 'لا أزرار',
    );
    return '$_temp0 · $layout';
  }

  @override
  String get layoutComfort => 'عريض';

  @override
  String get layoutCompact => 'مدمج';

  @override
  String get open => 'فتح';

  @override
  String get useThisRemote => 'استخدم جهاز التحكم هذا';

  @override
  String get edit => 'تعديل';

  @override
  String get editRemoteSubtitle => 'إعادة التسمية وتعديل الأزرار';

  @override
  String get thisCannotBeUndone => 'لا يمكن التراجع عن الحذف';

  @override
  String get searchRemotes => 'ابحث أجهزة التحكم';

  @override
  String get reorderRemotes => 'ترتيب أجهزة التحكم';

  @override
  String get addRemote => 'إضافة جهاز تحكم';

  @override
  String get more => 'المزيد';

  @override
  String get reorderMode => 'Reorder mode';

  @override
  String remoteButtonCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count زر',
      many: '$count زرًا',
      few: '$count أزرار',
      two: 'زران',
      one: 'زر واحد',
      zero: 'لا أزرار',
    );
    return '$_temp0';
  }

  @override
  String get noRemotesYet => 'لسه مفيش أجهزة تحكم';

  @override
  String get noRemotesDescription =>
      'اعمل جهاز تحكم لإرسال إشارات الأشعة تحت الحمراء.';

  @override
  String get noRemotesNextStep =>
      'ابدأ بإضافة جهاز تحكم، وبعدها ضيف له الأزرار.';

  @override
  String get actions => 'الإجراءات';

  @override
  String get macrosTitle => 'الماكرو';

  @override
  String get help => 'مساعدة';

  @override
  String get createMacro => 'إنشاء ماكرو';

  @override
  String get timedMacrosTitle => 'الماكرو';

  @override
  String get timedMacrosSubtitle =>
      'شغّل أوامر الأشعة تحت الحمراء ورا بعض، مع وقت انتظار بين الخطوات.';

  @override
  String get timedMacrosNextStep =>
      'اختار ريموت، وبعدها ضيف أوامر وأوقات انتظار عشان تعمل أول ماكرو.';

  @override
  String get macroFeatureToysTitle => 'للألعاب اللي بتشتغل بالأشعة تحت الحمراء';

  @override
  String get macroFeatureToysDescription =>
      'سيب للعبة وقت تخلّص الحركة قبل ما تبعت الأمر اللي بعده.';

  @override
  String get macroFeatureTimingTitle => 'وقت انتظار حسب احتياجك';

  @override
  String get macroFeatureTimingDescription =>
      'حدد وقت الانتظار بين الأوامر عشان الجهاز يلحق يستجيب.';

  @override
  String get macroFeatureManualTitle => 'انتظار التأكيد';

  @override
  String get macroFeatureManualDescription =>
      'بيستنى لحد ما تضغط على متابعة عشان يروح للخطوة اللي بعدها.';

  @override
  String get exampleUseCase => 'مثال';

  @override
  String get macroExampleText =>
      '1. ابعت أول أمر\n2. استنى ثانية\n3. ابعت الأمر اللي بعده';

  @override
  String get createFirstMacro => 'إنشاء أول ماكرو';

  @override
  String get noRemote => 'مفيش ريموت';

  @override
  String macroCopyName(String name) {
    return '$name (نسخة)';
  }

  @override
  String macroStepCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count خطوة',
      many: '$count خطوة',
      few: '$count خطوات',
      two: 'خطوتان',
      one: 'خطوة واحدة',
      zero: '$count خطوة',
    );
    return '$_temp0';
  }

  @override
  String get aboutTimedMacros => 'عن الماكرو';

  @override
  String get aboutTimedMacrosDescription =>
      'شغّل أوامر الأشعة تحت الحمراء ورا بعض، مع وقت انتظار بين الخطوات.';

  @override
  String get sendCommand => 'إرسال أمر';

  @override
  String get sendCommandDescription =>
      'بيبعت إشارة الأشعة تحت الحمراء لزر محفوظ في الريموت.';

  @override
  String get delay => 'تأخير';

  @override
  String get delayDescription =>
      'بيستنى المدة اللي تحددها قبل ما يروح للخطوة اللي بعدها.';

  @override
  String get manualContinue => 'انتظار التأكيد';

  @override
  String get manualContinueDescription =>
      'بيستنى لحد ما تضغط على متابعة عشان يروح للخطوة اللي بعدها.';

  @override
  String get gotIt => 'فهمت';

  @override
  String get failedToSaveMacros => 'ماقدرناش نحفظ الماكرو.';

  @override
  String deletedMacroNamed(Object name) {
    return 'اتحذف «$name».';
  }

  @override
  String get undo => 'تراجع';

  @override
  String get failedToRestoreMacro => 'ماقدرناش نرجّع الماكرو.';

  @override
  String get deleteMacroTitle => 'تحذف الماكرو؟';

  @override
  String get deleteMacroMessage =>
      'بعد الحذف، اضغط على تراجع في الرسالة اللي هتظهر عشان ترجّع الماكرو.';

  @override
  String get noRemotesAvailable => 'لا توجد أجهزة تحكم متاحة.';

  @override
  String remoteButtonCountSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count زر',
      many: '$count زرًا',
      few: '$count أزرار',
      two: 'زران',
      one: 'زر واحد',
      zero: 'لا أزرار',
    );
    return '$_temp0';
  }

  @override
  String get remoteOrientationFlippedTooltip => 'إعادة الاتجاه الأصلي';

  @override
  String get remoteOrientationNormalTooltip => 'تدوير جهاز التحكم 180°';

  @override
  String get stopLoop => 'إيقاف التكرار';

  @override
  String get reorderButtons => 'ترتيب الأزرار';

  @override
  String get remoteReorderHint => 'اضغط مطولًا على زر واسحبه لتغيير موضعه.';

  @override
  String get manageRemote => 'إدارة جهاز التحكم';

  @override
  String get remoteNoButtons => 'لا توجد أزرار بعد';

  @override
  String get remoteNoButtonsDescription =>
      'عدّل جهاز التحكم لإضافة الأزرار أو إعدادها.';

  @override
  String get editRemote => 'تعديل جهاز التحكم';

  @override
  String get editRemoteActionsSubtitle => 'تغيير الاسم وترتيب الأزرار وتعديلها';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'حُدّث الزر «$name».';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Added \"$name\".';
  }

  @override
  String get buttonDuplicated => 'زر duplicated.';

  @override
  String get loopRunningForButton => 'التكرار يعمل لهذا الزر.';

  @override
  String get loopTip => 'ملاحظة: Use Loop إلى repeat until you stop it.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Code copied.';

  @override
  String get copyCode => 'نسخ code';

  @override
  String get startLoop => 'بدء loop';

  @override
  String get editButtonSubtitle =>
      'غيّر اسم الزر أو ألوانه أو إشارة الأشعة تحت الحمراء';

  @override
  String get newButton => 'زر جديد';

  @override
  String get newButtonSubtitle => 'اعمل زر تاني للريموت ده';

  @override
  String get duplicate => 'عمل نسخة';

  @override
  String get duplicateButtonSubtitle => 'اعمل نسخة من الزر ده';

  @override
  String get removeFromDeviceControls => 'إزالة من عناصر تحكم الجهاز';

  @override
  String get addToDeviceControls => 'إضافة إلى عناصر تحكم الجهاز';

  @override
  String get deviceControlsButtonSubtitle =>
      'استخدم الزر ده من عناصر التحكم بالأجهزة في Android';

  @override
  String get removedFromDeviceControls => 'تمت الإزالة من عناصر تحكم الجهاز.';

  @override
  String get pinQuickTile => 'تثبيت في مفضلات المربعات السريعة';

  @override
  String get unpinQuickTile => 'إلغاء التثبيت من مفضلات المربعات السريعة';

  @override
  String get quickTileButtonSubtitle =>
      'المفضلة بتظهر الأول لما تختار زر للإعدادات السريعة';

  @override
  String get removedFromQuickTileFavorites =>
      'Removed من Quick Tile favorites.';

  @override
  String get pinnedToQuickTileFavorites => 'Pinned إلى Quick Tile favorites.';

  @override
  String get duplicateAndEdit => 'نسخ وتعديل';

  @override
  String get duplicateAndEditSubtitle => 'اعمل نسخة وافتحها للتعديل';

  @override
  String get done => 'تم';

  @override
  String get run => 'تشغيل';

  @override
  String get untitledRemote => 'ريموت من غير اسم';

  @override
  String get createRemoteTitle => 'إنشاء ريموت';

  @override
  String get editRemoteTitle => 'تعديل جهاز التحكم';

  @override
  String get removeButtonTitle => 'تشيل الزر؟';

  @override
  String get imageButtonRemovedMessage => 'الزر ده هيتشال من الريموت.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '«$name» هيتشال من الريموت.';
  }

  @override
  String get remove => 'إزالة';

  @override
  String importedButtonCount(int count) {
    return 'تم استيراد $count زر.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'تم استيراد $count زر من أجهزة التحكم الموجودة.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'غيّر اسم الزر أو ألوانه أو إشارة الأشعة تحت الحمراء';

  @override
  String get createButtonCopySubtitle => 'اعمل نسخة من الزر ده';

  @override
  String get duplicateAndEditButtonSubtitle => 'اعمل نسخة وافتحها للتعديل';

  @override
  String get undoAvailableInNextSnackbar =>
      'بعد إزالة الزر، اضغط على تراجع في الرسالة اللي هتظهر.';

  @override
  String get buttonRemoved => 'تمت إزالة الزر.';

  @override
  String get remoteNameCannotBeEmpty => 'اكتب اسم للريموت.';

  @override
  String get saveRemote => 'حفظ جهاز التحكم';

  @override
  String get remoteName => 'اسم الريموت';

  @override
  String get remoteNameHint => 'مثلاً: التلفزيون أو التكييف';

  @override
  String get remoteNameHelper => 'الاسم ده هيظهر في قائمة الريموتات.';

  @override
  String get layoutStyle => 'ترتيب الأزرار';

  @override
  String get layoutWideDescription => 'عمودين من الأزرار مع تفاصيل أكتر.';

  @override
  String get layoutCompactDescription =>
      'أربع أعمدة من الأزرار بتعرض رموز أو نصوص.';

  @override
  String get importFromRemotes => 'استيراد من الريموتات';

  @override
  String get importFromDatabase => 'استيراد من قاعدة البيانات';

  @override
  String get addButton => 'إضافة زر';

  @override
  String get noButtonsYet => 'لسه مفيش أزرار';

  @override
  String get createRemoteEmptyStateDescription =>
      'دوّر على أزرار في قاعدة البيانات، أو استوردها من ريموت تاني، أو اعمل أزرارك بنفسك.';

  @override
  String get createButtonTitle => 'إنشاء زر';

  @override
  String get editButtonTitle => 'تعديل زر';

  @override
  String failedToLoadProtocols(Object error) {
    return 'فشل إلى تحميل protocols: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'فشل تحميل مفاتيح قاعدة البيانات: $error';
  }

  @override
  String get presetPower => 'تشغيل';

  @override
  String get presetVolume => 'الصوت';

  @override
  String get presetChannel => 'Channel';

  @override
  String get presetNavigation => 'تنقل';

  @override
  String get all => 'الكل';

  @override
  String get completeRequiredFieldsToSave => 'أكمل الحقول المطلوبة للحفظ';

  @override
  String get buttonLabelStepTitle => 'تسمية الزر';

  @override
  String get buttonLabelStepSubtitle =>
      'اختر an image, icon, or type a text label.';

  @override
  String get buttonColorStepTitle => 'لون الزر';

  @override
  String get buttonColorStepSubtitle => 'اختر لون خلفية لهذا الزر.';

  @override
  String get selectColor => 'اختر اللون:';

  @override
  String get noImageSelected => 'No image المحدد';

  @override
  String get gallery => 'Gallery';

  @override
  String get builtIn => 'Built-in';

  @override
  String get removeImage => 'Remove image';

  @override
  String get requiredSelectImageOrSwitch =>
      'مطلوب: اختر صورة أو أيقونة أو بدّل إلى نص.';

  @override
  String get iconSelected => 'Icon المحدد';

  @override
  String get noIconSelected => 'No icon المحدد';

  @override
  String get chooseIcon => 'اختر Icon';

  @override
  String get removeIcon => 'Remove icon';

  @override
  String get requiredSelectIconOrSwitch =>
      'مطلوب: اختر أيقونة أو بدّل إلى صورة أو نص.';

  @override
  String get buttonText => 'زر text';

  @override
  String get buttonTextHint => 'e.g., تشغيل, الصوت +, HDMI 1';

  @override
  String get buttonTextHelper => 'سيظهر هذا النص على الزر.';

  @override
  String get requiredEnterButtonLabel => 'مطلوب: أدخل تسمية للزر.';

  @override
  String get defaultColorName => 'افتراضي';

  @override
  String get newRemoteCreatedFromLastHit =>
      'تم إنشاء جهاز تحكم جديد مع زر واحد من آخر إصابة.';

  @override
  String get selectRemote => 'اختر جهاز تحكم';

  @override
  String remoteNumber(Object id) {
    return 'جهاز التحكم #$id';
  }

  @override
  String get newRemoteCreated => 'تم إنشاء جهاز تحكم جديد.';

  @override
  String get failedToCreateRemote => 'فشل إنشاء جهاز التحكم.';

  @override
  String get newRemoteEllipsis => 'جهاز تحكم جديد…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Added إلى $name.';
  }

  @override
  String get failedToAddToRemote => 'فشل الإضافة إلى جهاز التحكم.';

  @override
  String get newRemoteDefaultName => 'New جهاز التحكم';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Jumped إلى offset $offset. Paused — press استئناف إلى continue.';
  }

  @override
  String get sent => 'تم الإرسال.';

  @override
  String failedToSend(Object error) {
    return 'فشل إلى send: $error';
  }

  @override
  String get copiedProtocolCode => 'تم النسخ، البروتوكول: الكود.';

  @override
  String get savedToResults => 'Saved إلى النتائج.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'كود غير صالح لهذا البروتوكول: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Copied الحالي candidate.';

  @override
  String get jumpToOffset => 'انتقال إلى offset';

  @override
  String get jumpToBruteCursor => 'انتقال إلى brute cursor';

  @override
  String get jump => 'انتقال';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Jumped إلى cursor 0x$cursor. Paused — press استئناف إلى continue.';
  }

  @override
  String get irSignalTester => 'IR إشارة Tester';

  @override
  String get stop => 'إيقاف';

  @override
  String get selectButton => 'اختر زر';

  @override
  String get buttonNotFoundInRemotes => 'زر not موجود in remotes.';

  @override
  String sentNamed(Object name) {
    return 'Sent \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'إرسال فشل: $error';
  }

  @override
  String get noFavoritesYet => 'No favorites yet';

  @override
  String get deviceControlsEmptyHint =>
      'اضغط مطولاً على زر في جهاز التحكم واختر إضافة إلى عناصر تحكم الجهاز.';

  @override
  String get sendTest => 'إرسال test';

  @override
  String get testSendCompleted => 'اختبار send completed.';

  @override
  String testSendFailed(Object error) {
    return 'اختبار send فشل: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Removed \"$name\".';
  }

  @override
  String get brand => 'العلامة';

  @override
  String get model => 'الطراز';

  @override
  String get selectBrand => 'اختر العلامة';

  @override
  String get searchBrand => 'ابحث عن علامة…';

  @override
  String get selectModel => 'اختر الطراز';

  @override
  String get searchModel => 'ابحث عن طراز…';

  @override
  String get unnamedKey => 'Unnamed key';

  @override
  String get unknown => 'غير معروف';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'ابحث عن أمر';

  @override
  String get noMatchingCommands => 'مفيش أوامر مطابقة';

  @override
  String get quickTileFavoritesTitle => 'الأزرار المفضلة';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'تغيير زر مربع «$tileLabel»';
  }

  @override
  String get pickDifferentButton => 'اختار زر تاني';

  @override
  String get browseAllRemotesEllipsis => 'تصفح أجهزة التحكم';

  @override
  String get invalidMacroFileFormat => 'تنسيق ملف الماكرو غير صالح.';

  @override
  String get failedToParseMacroFile => 'فشل تحليل ملف الماكرو.';

  @override
  String get deviceCodeLabel => 'الجهاز Code';

  @override
  String get commandLabel => 'أمر';

  @override
  String get editButtonCodeTitle => 'تعديل كود الزر';

  @override
  String get thisRemoteHasNoButtons => 'الريموت ده مفيهوش أزرار.';

  @override
  String get selectCommand => 'اختار أمر';

  @override
  String get databaseModeAutofillHint =>
      'يقوم وضع قاعدة البيانات بملء الخطوة 2 تلقائياً، العلامة والطراز والبروتوكول. بعد استيراد مفتاح، يمكنك تعديل أي شيء في الوضع اليدوي.';

  @override
  String get test => 'اختبار';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'الكل المحدد أزرار were duplicates.';

  @override
  String get noButtonsImported => 'No أزرار imported.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'تم استيراد $addedCount زر. تم تخطي $skippedCount من النسخ المكررة.';
  }

  @override
  String get importAllMatchingTitle => 'استيراد all matching أزرار?';

  @override
  String get noMatchingKeysFound => 'No matching keys موجود.';

  @override
  String importAllMatchingMessage(int count) {
    return 'سيتم استيراد ما يصل إلى $count من المفاتيح المطابقة من اختيار قاعدة البيانات الحالي.';
  }

  @override
  String get importAll => 'استيراد all';

  @override
  String get importingButtons => 'Importing أزرار…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'الكل matching أزرار were duplicates.';

  @override
  String get quickPresets => 'Quick presets';

  @override
  String get selectDeviceFirst => 'اختر الجهاز أولاً';

  @override
  String get searchByLabelOrHex => 'ابحث by label or hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'اختياري: حسّن مفاتيح الإعداد المسبق $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'اختر العلامة والطراز والبروتوكول أولاً.';

  @override
  String get importFromDatabaseTitle => 'استيراد من قاعدة البيانات';

  @override
  String get importFromDatabaseSubtitle =>
      'دوّر على جهازك واختار الأزرار اللي عايز تستوردها.';

  @override
  String get deviceAndFilters => 'الجهاز & filters';

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
      'لم يتم العثور على بروتوكول لهذه العلامة والطراز.';

  @override
  String get protocolAutoDetected => 'البروتوكول';

  @override
  String get protocolAutoDetectedHelper =>
      'تم اكتشافه تلقائياً من قاعدة البيانات. يمكنك تغييره قبل الاستيراد.';

  @override
  String get selectBrandModelToLoadKeys =>
      'اختر علامة وطرازاً وبروتوكولاً لتحميل المفاتيح.';

  @override
  String get noKeysFound => 'No keys موجود.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'No keys موجود for “$query”.';
  }

  @override
  String get skipDuplicates => 'Skip duplicates';

  @override
  String get skipDuplicatesSubtitle =>
      'لا تستورد الأزرار الموجودة بالفعل في جهاز التحكم هذا.';

  @override
  String get importSelected => 'استيراد المحدد';

  @override
  String get noMacrosToExport => 'لا توجد وحدات ماكرو للتصدير.';

  @override
  String get macrosExportedToDownloads => 'تم تصدير الماكرو إلى التنزيلات.';

  @override
  String get failedToExportMacros => 'فشل تصدير الماكرو.';

  @override
  String get failedToReadFile => 'فشل إلى read file.';

  @override
  String get importFromExistingRemotesTitle =>
      'استيراد من Existing أجهزة التحكم';

  @override
  String selectedCount(int count) {
    return '$count المحدد';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'لم يتم العثور على أجهزة تحكم أخرى تحتوي على أزرار.';

  @override
  String get sourceRemote => 'جهاز التحكم المصدر';

  @override
  String get searchButtons => 'ابحث أزرار';

  @override
  String get searchButtonsHint => 'تشغيل, الصوت, كتم...';

  @override
  String get selectVisible => 'اختر visible';

  @override
  String get clearVisible => 'Clear visible';

  @override
  String protocolNamed(Object name) {
    return 'البروتوكول: $name';
  }

  @override
  String get rawSignal => 'خام';

  @override
  String get legacyCode => 'Legacy code';

  @override
  String importCount(int count) {
    return 'استيراد $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'تم رفض إذن التخزين، وهو مطلوب في بعض أجهزة أندرويد الأقدم.';

  @override
  String get backupExportedToDownloads =>
      'تم تصدير النسخة الاحتياطية إلى التنزيلات.';

  @override
  String failedToExport(Object error) {
    return 'فشل إلى export: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'تم استيراد $count من أجهزة التحكم من نسخة JSON القديمة. لم يتم تغيير الماكرو.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'فشل الاستيراد: يجب أن تكون النسخة الاحتياطية remotes قائمة JSON عند وجودها.';

  @override
  String get importFailedMacrosMustBeList =>
      'فشل الاستيراد: يجب أن تكون النسخة الاحتياطية للماكرو قائمة JSON عند وجودها.';

  @override
  String get importFailedInvalidBackupFormat =>
      'فشل الاستيراد: تنسيق النسخة الاحتياطية غير صالح، المطلوب قائمة قديمة أو خريطة مع أجهزة التحكم أو الماكرو.';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'تم استيراد $remoteCount من أجهزة التحكم من النسخة الاحتياطية. لم يتم تغيير الماكرو.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'تم استيراد $remoteCount من أجهزة التحكم و $macroCount من وحدات الماكرو من النسخة الاحتياطية.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'فشل الاستيراد: no valid أزرار موجود in .ir file.';

  @override
  String get importedOneRemoteFromFlipper =>
      'تم استيراد جهاز تحكم واحد من Flipper بصيغة .ir. لم يتم تغيير الماكرو.';

  @override
  String get importFailedInvalidIrplus =>
      'فشل الاستيراد: invalid irplus file (no valid أزرار موجود).';

  @override
  String get importedOneRemoteFromIrplus =>
      'تم استيراد جهاز تحكم واحد من irplus. لم يتم تغيير الماكرو.';

  @override
  String get importFailedInvalidLirc =>
      'فشل الاستيراد: invalid LIRC file (no valid codes/raw codes موجود).';

  @override
  String get importedOneRemoteFromLirc =>
      'تم استيراد جهاز تحكم واحد من إعداد LIRC. لم يتم تغيير الماكرو.';

  @override
  String get unsupportedFileTypeSelected => 'Unsupported file type المحدد.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'فشل الاستيراد: invalid or unreadable file.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'اكتمل الاستيراد المجمع: no مدعوم files موجود in folder.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'اكتمل الاستيراد المجمع: لم يتم استيراد أي جهاز تحكم. تم تخطي $skippedCount ملفاً.';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'اكتمل الاستيراد المجمع: تم استيراد $importedCount جهاز تحكم من $supportedCount ملفاً مدعوماً. تم تخطي $skippedCount ملفاً.';
  }

  @override
  String get storagePermissionDenied => 'تم رفض إذن التخزين.';

  @override
  String get bulkImportFailedReadFolder =>
      'Bulk import فشل: unable إلى read folder contents.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'اكتمل الاستيراد المجمع: no مدعوم files موجود ($sourceLabel).';
  }

  @override
  String get clearAction => 'مسح';

  @override
  String get saveAction => 'حفظ';

  @override
  String buttonsTitleCount(int count) {
    return 'الأزرار ($count)';
  }

  @override
  String get invalidStepEncountered =>
      'الماكرو ده فيه خطوة غير صالحة. عدّلها قبل ما تحاول تاني.';

  @override
  String failedToSendNamed(Object name) {
    return 'تعذّر إرسال الأمر: $name';
  }

  @override
  String get buttonNotFound => 'الزر مش موجود';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'الزر مش موجود: $name';
  }

  @override
  String get unknownButton => 'زر غير معروف';

  @override
  String durationSecondsShort(int seconds) {
    return '$seconds ث';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '$minutes د $seconds ث';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '$hours س $minutes د';
  }

  @override
  String get orientationFlippedTooltip =>
      'Orientation: flipped (tap إلى normal)';

  @override
  String get orientationNormalTooltip => 'Orientation: normal (tap إلى flip)';

  @override
  String get noSteps => 'مفيش خطوات';

  @override
  String stepProgress(int current, int total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get completed => 'اكتمل';

  @override
  String get paused => 'متوقف مؤقتًا';

  @override
  String get running => 'قيد التنفيذ';

  @override
  String get ready => 'جاهز';

  @override
  String stepsProgress(int current, int total) {
    return 'الخطوات: $current / $total';
  }

  @override
  String get waiting => 'في الانتظار';

  @override
  String secondsRemaining(num seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
            locale: localeName, decimalDigits: 1);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'المتبقي: $secondsString ث';
  }

  @override
  String millisecondsShort(int ms) {
    return '$ms ms';
  }

  @override
  String get tapContinueWhenReady =>
      'اضغط على متابعة لما تكون جاهز للخطوة اللي بعدها.';

  @override
  String get error => 'خطأ';

  @override
  String get macroCompleted => 'الماكرو خلص';

  @override
  String finishedIn(Object duration) {
    return 'خلص في $duration';
  }

  @override
  String get sequence => 'الخطوات';

  @override
  String waitMilliseconds(int ms) {
    return 'انتظار $ms ملي ثانية';
  }

  @override
  String get runAgain => 'تشغيل تاني';

  @override
  String get startMacro => 'تشغيل الماكرو';

  @override
  String get continueAction => 'متابعة';

  @override
  String get unnamedRemote => 'ريموت من غير اسم';

  @override
  String get enterMacroName => 'اكتب اسم للماكرو.';

  @override
  String get addAtLeastOneStep => 'ضيف خطوة واحدة على الأقل.';

  @override
  String get fixInvalidSteps => 'صحّح الخطوات غير الصالحة قبل الحفظ.';

  @override
  String get unknownCommand => 'أمر غير معروف';

  @override
  String get unnamedCommand => 'أمر من غير اسم';

  @override
  String get iconCommand => 'زر بأيقونة';

  @override
  String get selectDelay => 'اختار وقت الانتظار';

  @override
  String keepMilliseconds(int ms) {
    return 'خليها $ms مللي ثانية';
  }

  @override
  String get custom => 'مخصص';

  @override
  String get enterCustomDelayDuration => 'اكتب وقت انتظار مختلف';

  @override
  String millisecondsLong(int ms) {
    return '$ms ملي ثانية';
  }

  @override
  String secondsLong(num seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$secondsString ثانية',
      many: '$secondsString ثانية',
      few: '$secondsString ثوانٍ',
      two: 'ثانيتان',
      one: '$secondsString ثانية',
    );
    return '$_temp0';
  }

  @override
  String get customDelay => 'وقت انتظار مخصص';

  @override
  String get delayMillisecondsLabel => 'الانتظار (مللي ثانية)';

  @override
  String get delayMillisecondsHint => '3000';

  @override
  String get recommendedDelayRange =>
      '1000 مللي ثانية = ثانية واحدة. اختار وقت يدي الجهاز فرصة يستجيب.';

  @override
  String get enterValidPositiveNumber => 'اكتب عدد صحيح أكبر من صفر.';

  @override
  String get ok => 'موافق';

  @override
  String get remote => 'جهاز التحكم';

  @override
  String get macroName => 'اسم الماكرو';

  @override
  String get macroNameHint => 'مثلاً: سهرة أفلام';

  @override
  String stepsTitleCount(int count) {
    return 'الخطوات ($count)';
  }

  @override
  String get noStepsYet => 'لسه مفيش خطوات';

  @override
  String get addCommandsAndDelaysHint =>
      'ضيف أوامر أو وقت انتظار أو وقفة للتأكيد. الخطوات هتشتغل بالترتيب المعروض.';

  @override
  String get addStep => 'إضافة خطوة';

  @override
  String get reorderStepsHint =>
      'اسحب مقبض الخطوة عشان تغيّر ترتيبها. اضغط على الخطوة عشان تعدّلها.';

  @override
  String reorderStep(int index) {
    return 'نقل الخطوة $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'اضغط واسحب عشان تغيّر ترتيب الخطوة';

  @override
  String deleteStep(int index) {
    return 'حذف الخطوة $index';
  }

  @override
  String get invalidStepTapToFix => 'الخطوة غير صالحة. اضغط عشان تعدّلها.';

  @override
  String get sendIrCommand => 'إرسال أمر بالأشعة تحت الحمراء';

  @override
  String get waitForUserConfirmation =>
      'الماكرو بيقف مؤقتاً لحد ما تختار تكمّل.';

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
  String get layoutWide => 'عريض';

  @override
  String get iconButton => 'زر أيقونة';

  @override
  String get imageButton => 'زر صورة';

  @override
  String get noSignalInfo => 'No signal info';

  @override
  String get proceed => 'Proceed';

  @override
  String get discard => 'تجاهل';

  @override
  String get continueEditing => 'كمّل التعديل';

  @override
  String get unsavedChangesTitle => 'تغييرات مش محفوظة';

  @override
  String get unsavedMacroChangesMessage =>
      'تتجاهل تغييرات الماكرو ده؟ التغييرات دي مش هتتحفظ.';

  @override
  String get stopMacroBeforeLeaving => 'وقّف الماكرو قبل ما تسيب الشاشة دي.';

  @override
  String get stopTestingBeforeLeaving =>
      'Stop testing before leaving this screen.';

  @override
  String get idle => 'خامل';

  @override
  String get start => 'بدء';

  @override
  String get resume => 'استئناف';

  @override
  String get pause => 'إيقاف مؤقت';

  @override
  String get stopped => 'Stopped';

  @override
  String get copy => 'نسخ';

  @override
  String get send => 'إرسال';

  @override
  String get step => 'خطوة';

  @override
  String get addToRemote => 'إضافة إلى جهاز التحكم';

  @override
  String get noDescriptionAvailable => 'No description available.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'يجب أن يكون مورد Kaseikyo من 4 أرقام hex بالضبط.';

  @override
  String get irFinderDatabaseNotReady => 'قاعدة البيانات غير جاهزة بعد.';

  @override
  String get irFinderSelectBrandFirst => 'اختر علامة تجارية أولاً من الإعداد.';

  @override
  String get irFinderBruteforceUnavailable =>
      'البحث بالقوة الغاشمة غير متاح لهذا البروتوكول بعد.';

  @override
  String get irFinderInvalidPrefix => 'بادئة غير صالحة.';

  @override
  String irFinderBrandValue(Object value) {
    return 'العلامة: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'الطراز: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'المفتاح: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'جهاز التحكم رقم $value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'أدخل فهرساً يبدأ من الصفر داخل نتائج قاعدة البيانات المصفاة والمرتبة.';

  @override
  String get irFinderJumpCursorHelper =>
      'أدخل مؤشراً hex يبدأ من الصفر داخل مساحة القوة الغاشمة.';

  @override
  String get irFinderSetupTab => 'الإعداد';

  @override
  String get irFinderTestTab => 'اختبار';

  @override
  String get irFinderResultsTab => 'النتائج';

  @override
  String get irFinderContinueToTest => 'تابع إلى الاختبار';

  @override
  String get irFinderKaseikyoVendorTitle => 'مورد Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'مورد مخصص، 4 hex';

  @override
  String get irFinderBrowseDbCandidates => 'تصفح مرشحي القاعدة…';

  @override
  String get irFinderEditSetup => 'تعديل الإعداد';

  @override
  String get irFinderNoSavedHits =>
      'لا توجد إصابات محفوظة بعد. في صفحة الاختبار، اضغط حفظ الإصابة عندما يستجيب الجهاز.';

  @override
  String get irFinderBackToTest => 'عودة للاختبار';

  @override
  String get irFinderLargeSearchSpaceTitle => 'مساحة بحث كبيرة';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'مساحة القوة الغاشمة هذه كبيرة جداً، $human احتمالاً. سيظل IR Finder يحترم الحد الأقصى للمحاولات وفترة التهدئة، لكن انتبه لعدم إغراق أجهزة IR.\n\nالتوصية: استخدم وضع قاعدة البيانات أولاً، أو أدخل بايتات بادئة معروفة لتقليل المساحة.';
  }

  @override
  String get irFinderDatabaseSession => 'جلسة قاعدة البيانات';

  @override
  String get irFinderBruteforceSession => 'جلسة القوة الغاشمة';

  @override
  String get irFinderResumeLastSession => 'استئناف آخر جلسة';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'العلامة: $brand · الطراز: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'البادئة: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'التقدم: $progress · بدأ: $when';
  }

  @override
  String get irFinderApplyResume => 'تطبيق واستئناف';

  @override
  String get irFinderBruteforceMode => 'قوة غاشمة';

  @override
  String get irFinderDatabaseAssistedMode => 'بمساعدة قاعدة البيانات';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'البروتوكول: $name';
  }

  @override
  String get irFinderProtocolLabel => 'بروتوكول IR';

  @override
  String get irFinderProtocolHelper =>
      'يتحكم في الترميز وبالتالي في مساحة البحث.';

  @override
  String get irFinderKnownPrefixLabel => 'بادئة معروفة، بايتات hex اختيارية';

  @override
  String get irFinderKnownPrefixHint => 'A1B2، A1 B2، A1:B2، 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'الحمولة: $digits رقم hex';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'الحمولة: $digits رقم hex · مثال: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'الحمولة: $digits رقم hex · أقصى بادئة: $bytes بايت';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'الحمولة: $digits رقم hex · مثال: $example · أقصى بادئة: $bytes بايت';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'مثال: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'أدخل أي بايتات أولى معروفة لتقليل مساحة البحث.';

  @override
  String get irFinderDatabaseMode => 'قاعدة البيانات';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'البادئة المطبعة: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'البادئة المطبعة';

  @override
  String get irFinderBruteforceNotConfigured =>
      'القوة الغاشمة غير مضبوطة لهذا البروتوكول بعد.';

  @override
  String irFinderAllLimit(Object value) {
    return 'الكل، $value';
  }

  @override
  String get irFinderTestControls => 'عناصر الاختبار';

  @override
  String irFinderPayloadLength(int digits) {
    return 'طول الحمولة: $digits رقم hex.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'مساحة البحث: $value احتمالاً، بعد قيود البادئة.';
  }

  @override
  String get irFinderCooldownMs => 'التهدئة، ms';

  @override
  String get irFinderMaxAttemptsPerRun => 'أقصى محاولات، لكل تشغيل';

  @override
  String get irFinderTestAllCombinations => 'اختبر كل التركيبات';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'يستمر حتى تنتهي مساحة البحث. الحد الفعلي: $value';
  }

  @override
  String get irFinderAttempts => 'المحاولات';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'نطاق المؤشر: من 1 إلى $max، اكتب أي رقم للقيم الأكبر';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'الحد الأقصى\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'الحد الفعلي لهذا التشغيل: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'ملاحظة: استخدم وضع قاعدة البيانات أولاً؛ القوة الغاشمة أفضل مع بادئة معروفة، مثل أول 1 إلى 4 بايتات.';

  @override
  String get irFinderDatabaseInitFailed => 'فشل تهيئة قاعدة البيانات.';

  @override
  String get irFinderPreparingDatabase => 'جار تجهيز قاعدة بيانات IR المحلية…';

  @override
  String get irFinderDatabaseAssistedSearch => 'بحث بمساعدة قاعدة البيانات';

  @override
  String get irFinderBrand => 'العلامة';

  @override
  String get irFinderSelectBrand => 'اختر العلامة';

  @override
  String get irFinderModelOptional => 'الطراز، اختياري';

  @override
  String get irFinderSelectBrandFirstShort => 'اختر علامة أولاً';

  @override
  String get irFinderSelectModelRecommended => 'اختر طرازاً، موصى به';

  @override
  String get irFinderOnlySelectedProtocol => 'البروتوكول المحدد فقط';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'يصفّي المفاتيح إلى البروتوكول المحدد. عطله لتصفح كل البروتوكولات.';

  @override
  String get irFinderQuickWinsFirst => 'النتائج السريعة أولاً';

  @override
  String get irFinderQuickWinsFirstHint =>
      'يعطي أولوية لمفاتيح الطاقة والكتم والصوت والقنوات قبل المفاتيح الأعمق.';

  @override
  String get irFinderMaxKeysPerRun => 'أقصى عدد مفاتيح للاختبار، لكل تشغيل';

  @override
  String get irFinderTesting => 'جار الاختبار…';

  @override
  String get irFinderCooldown => 'التهدئة';

  @override
  String get irFinderEta => 'الوقت المتوقع';

  @override
  String get irFinderMode => 'الوضع';

  @override
  String get irFinderRetryLast => 'إعادة آخر محاولة';

  @override
  String get irFinderTrigger => 'تشغيل';

  @override
  String get irFinderJump => 'انتقال…';

  @override
  String get irFinderSaveHit => 'حفظ الإصابة';

  @override
  String irFinderEtaSeconds(int seconds) {
    return '$secondsث';
  }

  @override
  String irFinderEtaMinutesSeconds(int minutes, int seconds) {
    return '$minutesد $secondsث';
  }

  @override
  String irFinderEtaHoursMinutes(int hours, int minutes) {
    return '$hoursس $minutesد';
  }

  @override
  String irFinderLastAttemptedCode(Object value) {
    return 'آخر كود تمت تجربته: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'ابدأ الاختبار لرؤية آخر كود تمت تجربته.';

  @override
  String irFinderFromDb(Object value) {
    return 'من القاعدة: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'من القوة الغاشمة، تم إنشاؤه بواسطة مشفر البروتوكول.';

  @override
  String irFinderSendError(Object error) {
    return 'خطأ إرسال: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'المصدر: $value';
  }

  @override
  String get irFinderResultsNote =>
      'تدعم النتائج الاختبار والنسخ فوراً. يمكن توسيع إضافة النتائج مباشرة إلى جهاز التحكم لاحقاً داخل مسار المحرر.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'تصفح مرشحي القاعدة';

  @override
  String get irFinderFilterByLabelOrHex => 'صفِّ حسب التسمية أو hex…';

  @override
  String get irFinderJumpHere => 'انتقل هنا';

  @override
  String get irFinderSelectModel => 'اختر الطراز';

  @override
  String get irFinderSearchBrands => 'ابحث عن العلامات…';

  @override
  String get irFinderSearchModels => 'ابحث عن الطرز…';

  @override
  String get iconPickerTitle => 'اختر Icon';

  @override
  String get iconPickerSearchHint => 'ابحث icons...';

  @override
  String get iconPickerNoIconsFound => 'No icons موجود';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count icons available';
  }

  @override
  String get iconPickerCategoryAll => 'الكل';

  @override
  String get iconPickerCategoryMedia => 'وسائط';

  @override
  String get iconPickerCategoryVolume => 'الصوت';

  @override
  String get iconPickerCategoryNavigation => 'تنقل';

  @override
  String get iconPickerCategoryPower => 'تشغيل';

  @override
  String get iconPickerCategoryNumbers => 'Numbers';

  @override
  String get iconPickerCategorySettings => 'الإعدادات';

  @override
  String get iconPickerCategoryDisplay => 'Display';

  @override
  String get iconPickerCategoryInput => 'إدخال';

  @override
  String get iconPickerCategoryFavorite => 'مفضل';

  @override
  String get universalPowerTitle => 'Universal تشغيل';

  @override
  String get universalPowerRunTab => 'تشغيل';

  @override
  String get universalPowerUseResponsibly => 'Use responsibly';

  @override
  String get universalPowerConsentBody =>
      'يقوم Universal Power بتدوير أكواد الطاقة عبر IR. استخدمه فقط مع الأجهزة التي تملكها أو تتحكم بها. توقف فور استجابة الجهاز.';

  @override
  String get universalPowerConsentCheckbox => 'أنا أملك الجهاز أو أتحكم به';

  @override
  String get universalPowerSetupBody =>
      'يدوّر أكواد الطاقة للعلامة المحددة. توقف فور استجابة الجهاز.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Last sent: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'لم يتم العثور على أكواد طاقة. جرّب توسيع البحث.';

  @override
  String get universalPowerUnableToStart => 'Unable إلى start.';

  @override
  String get universalPowerAllBrands => 'الكل brands (no filter)';

  @override
  String get universalPowerClearBrandFilter => 'مسح عامل تصفية العلامة';

  @override
  String get universalPowerBroadenSearch => 'وسّع البحث عند الحاجة';

  @override
  String get universalPowerBroadenSearchHint =>
      'If no power labels are موجود, include other keys.';

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
      'يستمر في تدوير الطابور حتى توقفه.';

  @override
  String get universalPowerDelayBetweenCodes => 'تأخير between codes';

  @override
  String get universalPowerStart => 'بدء Universal تشغيل';

  @override
  String get universalPowerRunStatus => 'تشغيل status';

  @override
  String universalPowerProgress(Object value) {
    return 'التقدم: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'تم الإيقاف المؤقت لأن التطبيق انتقل إلى الخلفية.';

  @override
  String get universalPowerSendOneCode => 'إرسال one code';

  @override
  String get universalPowerStopWhenDeviceResponds => 'توقف فور استجابة الجهاز.';

  @override
  String get iconNamePlay => 'تشغيل';

  @override
  String get iconNamePause => 'إيقاف مؤقت';

  @override
  String get iconNameStop => 'إيقاف';

  @override
  String get iconNameFastForward => 'Fast Forward';

  @override
  String get iconNameRewind => 'Rewind';

  @override
  String get iconNameSkipNext => 'Skip Next';

  @override
  String get iconNameSkipPrevious => 'Skip Previous';

  @override
  String get iconNameReplay => 'إعادة تشغيل';

  @override
  String get iconNameForward10S => 'Forward 10s';

  @override
  String get iconNameForward30S => 'Forward 30s';

  @override
  String get iconNameReplay10S => 'إعادة تشغيل 10s';

  @override
  String get iconNameReplay30S => 'إعادة تشغيل 30s';

  @override
  String get iconNameRecord => 'تسجيل';

  @override
  String get iconNameRecordAlt => 'تسجيل Alt';

  @override
  String get iconNameEject => 'إخراج';

  @override
  String get iconNameShuffle => 'Shuffle';

  @override
  String get iconNameRepeat => 'تكرار';

  @override
  String get iconNameRepeatOne => 'تكرار واحد';

  @override
  String get iconNameVolumeUp => 'رفع الصوت';

  @override
  String get iconNameVolumeDown => 'خفض الصوت';

  @override
  String get iconNameVolumeOff => 'الصوت Off';

  @override
  String get iconNameMute => 'كتم';

  @override
  String get iconNameSpeaker => 'Speaker';

  @override
  String get iconNameSurroundSound => 'Surround Sound';

  @override
  String get iconNameEqualizer => 'Equalizer';

  @override
  String get iconNameAudio => 'صوت';

  @override
  String get iconNameMicrophone => 'Microphone';

  @override
  String get iconNameMicOff => 'Mic Off';

  @override
  String get iconNameUp => 'أعلى';

  @override
  String get iconNameDown => 'أسفل';

  @override
  String get iconNameLeft => 'يسار';

  @override
  String get iconNameRight => 'يمين';

  @override
  String get iconNameArrowUp => 'Arrow أعلى';

  @override
  String get iconNameArrowDown => 'Arrow أسفل';

  @override
  String get iconNameArrowLeft => 'Arrow يسار';

  @override
  String get iconNameArrowRight => 'Arrow يمين';

  @override
  String get iconNameNavigation => 'تنقل';

  @override
  String get iconNameChevronLeft => 'Chevron يسار';

  @override
  String get iconNameChevronRight => 'Chevron يمين';

  @override
  String get iconNameExpandLess => 'توسيع Less';

  @override
  String get iconNameExpandMore => 'توسيع المزيد';

  @override
  String get iconNameCollapse => 'Collapse';

  @override
  String get iconNameExpand => 'توسيع';

  @override
  String get iconNameCircleUp => 'Circle أعلى';

  @override
  String get iconNameCircleDown => 'Circle أسفل';

  @override
  String get iconNameCircleLeft => 'Circle يسار';

  @override
  String get iconNameCircleRight => 'Circle يمين';

  @override
  String get iconNameOkSelect => 'OK/اختر';

  @override
  String get iconNameConfirm => 'Confirm';

  @override
  String get iconNameCancel => 'إلغاء';

  @override
  String get iconNameClose => 'إغلاق';

  @override
  String get iconNameHome => 'الرئيسية';

  @override
  String get iconNameReturn => 'رجوع';

  @override
  String get iconNameExit => 'خروج';

  @override
  String get iconNameUndo => 'Undo';

  @override
  String get iconNameRedo => 'إعادة';

  @override
  String get iconNamePower => 'تشغيل';

  @override
  String get iconNamePowerAlt => 'تشغيل Alt';

  @override
  String get iconNamePowerOff => 'تشغيل Off';

  @override
  String get iconNameOn => 'تشغيل';

  @override
  String get iconNameOff => 'إيقاف';

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
  String get iconNameOne => 'واحد';

  @override
  String get iconNameTwo => 'اثنان';

  @override
  String get iconNameThree => 'ثلاثة';

  @override
  String get iconNameFour => 'أربعة';

  @override
  String get iconNameFive => 'خمسة';

  @override
  String get iconNameSix => 'ستة';

  @override
  String get iconNamePlus => 'زائد';

  @override
  String get iconNameMinus => 'ناقص';

  @override
  String get iconNameAddCircle => 'إضافة Circle';

  @override
  String get iconNameRemoveCircle => 'Remove Circle';

  @override
  String get iconNameSettings => 'الإعدادات';

  @override
  String get iconNameMenu => 'القائمة';

  @override
  String get iconNameMoreVertical => 'المزيد Vertical';

  @override
  String get iconNameMoreHorizontal => 'المزيد Horizontal';

  @override
  String get iconNameTune => 'ضبط';

  @override
  String get iconNameRemoteSettings => 'جهاز التحكم الإعدادات';

  @override
  String get iconNameInfo => 'معلومات';

  @override
  String get iconNameInfoOutline => 'معلومات Outline';

  @override
  String get iconNameHelp => 'مساعدة';

  @override
  String get iconNameHelpOutline => 'مساعدة Outline';

  @override
  String get iconNameList => 'قائمة';

  @override
  String get iconNameViewList => 'عرض قائمة';

  @override
  String get iconNameViewGrid => 'عرض Grid';

  @override
  String get iconNameApps => 'تطبيقات';

  @override
  String get iconNameWidgets => 'Widgets';

  @override
  String get iconNameTv => 'تلفاز';

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
  String get iconNameAutoBrightness => 'تلقائي Brightness';

  @override
  String get iconNameLightMode => 'فاتح الوضع';

  @override
  String get iconNameDarkMode => 'داكن الوضع';

  @override
  String get iconNameContrast => 'Contrast';

  @override
  String get iconNameHdrOn => 'HDR On';

  @override
  String get iconNameHdrOff => 'HDR Off';

  @override
  String get iconNameAspectRatio => 'Aspect Ratio';

  @override
  String get iconNameCrop => 'قص';

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
  String get iconNamePip => 'صورة داخل صورة';

  @override
  String get iconNameCropFree => 'Crop Free';

  @override
  String get iconNameInput => 'إدخال';

  @override
  String get iconNameCable => 'كابل';

  @override
  String get iconNameCast => 'بث';

  @override
  String get iconNameCastConnected => 'Cast متصل';

  @override
  String get iconNameScreenShare => 'Screen مشاركة';

  @override
  String get iconNameBluetooth => 'Bluetooth';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => 'Router';

  @override
  String get iconNameMemory => 'ذاكرة';

  @override
  String get iconNameGameConsole => 'Game Console';

  @override
  String get iconNameGaming => 'ألعاب';

  @override
  String get iconNameMedia => 'وسائط';

  @override
  String get iconNameMusicQueue => 'موسيقى قائمة انتظار';

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
  String get iconNameFavorite => 'مفضل';

  @override
  String get iconNameFavoriteOutline => 'مفضل Outline';

  @override
  String get iconNameStar => 'نجمة';

  @override
  String get iconNameStarOutline => 'Star Outline';

  @override
  String get iconNameBookmark => 'Bookmark';

  @override
  String get iconNameBookmarkOutline => 'Bookmark Outline';

  @override
  String get iconNameFlag => 'علم';

  @override
  String get iconNameCheck => 'تحقق';

  @override
  String get iconNameDone => 'تم';

  @override
  String get iconNameDoneAll => 'تم الكل';

  @override
  String get iconNameSchedule => 'Schedule';

  @override
  String get iconNameTimer => 'مؤقت';

  @override
  String get iconNameTime => 'الوقت';

  @override
  String get iconNameAlarm => 'منبه';

  @override
  String get iconNameNotifications => 'Notifications';

  @override
  String get iconNameLock => 'قفل';

  @override
  String get iconNameUnlock => 'Unlock';

  @override
  String get iconNameLight => 'فاتح';

  @override
  String get iconNameLightOutline => 'فاتح Outline';

  @override
  String get iconNameWarmLight => 'Warm فاتح';

  @override
  String get iconNameSunny => 'مشمس';

  @override
  String get iconNameCloudy => 'Cloudy';

  @override
  String get iconNameNight => 'ليل';

  @override
  String get iconNameFlare => 'توهج';

  @override
  String get iconNameGradient => 'Gradient';

  @override
  String get iconNameInvertColors => 'Invert Colors';

  @override
  String get iconNamePalette => 'Palette';

  @override
  String get iconNameColor => 'لون';

  @override
  String get iconNameTonality => 'Tonality';

  @override
  String get iconNameSearch => 'بحث';

  @override
  String get iconNameRefresh => 'تحديث';

  @override
  String get iconNameSync => 'مزامنة';

  @override
  String get iconNameUpdate => 'Update';

  @override
  String get iconNameDownload => 'Download';

  @override
  String get iconNameUpload => 'Upload';

  @override
  String get iconNameCloud => 'سحابة';

  @override
  String get iconNameFolder => 'مجلد';

  @override
  String get iconNameDelete => 'حذف';

  @override
  String get iconNameEdit => 'تعديل';

  @override
  String get iconNameSave => 'حفظ';

  @override
  String get iconNameShare => 'مشاركة';

  @override
  String get iconNamePrint => 'طباعة';

  @override
  String get iconNameLanguage => 'اللغة';

  @override
  String get iconNameTranslate => 'Translate';

  @override
  String get iconNameMicNone => 'Mic None';

  @override
  String get iconNameSubtitles => 'Subtitles';

  @override
  String get iconNameClosedCaption => 'Closed Caption';

  @override
  String get iconNameMusic => 'موسيقى';

  @override
  String get iconNameMovie => 'فيلم';

  @override
  String get iconNameTheater => 'Theater';

  @override
  String get iconNameLiveTv => 'Live TV';

  @override
  String get iconNameRadio => 'راديو';

  @override
  String get iconNameCamera => 'كاميرا';

  @override
  String get iconNameVideoCamera => 'Video كاميرا';

  @override
  String get iconNamePhotoCamera => 'Photo كاميرا';

  @override
  String get iconNameSlowMotion => 'Slow Motion';

  @override
  String get iconNameSpeed => 'سرعة';

  @override
  String get iconNameVideoSettings => 'Video الإعدادات';

  @override
  String get iconNameAudioTrack => 'صوت Track';

  @override
  String get iconNameGraphicEq => 'Graphic EQ';

  @override
  String get iconNameMusicVideo => 'موسيقى Video';

  @override
  String get iconNamePlaylist => 'Playlist';

  @override
  String get iconNameQueue => 'قائمة انتظار';

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
  String get iconNamePauseFa => 'إيقاف مؤقت FA';

  @override
  String get iconNameStopFa => 'إيقاف FA';

  @override
  String get iconNamePlayFaOutline => 'Play FA Outline';

  @override
  String get iconNamePauseFaOutline => 'إيقاف مؤقت FA Outline';

  @override
  String get iconNameStopFaOutline => 'إيقاف FA Outline';

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
  String get iconNameRepeatFa => 'تكرار FA';

  @override
  String get iconNameShuffleFa => 'Shuffle FA';

  @override
  String get iconNameEjectFa => 'Eject FA';

  @override
  String get iconNameFilmFa => 'Film FA';

  @override
  String get iconNameVideoFa => 'Video FA';

  @override
  String get iconNameMusicFa => 'موسيقى FA';

  @override
  String get iconNameMicrophoneFa => 'Microphone FA';

  @override
  String get iconNameCameraFa => 'كاميرا FA';

  @override
  String get iconNameCameraRetroFa => 'كاميرا Retro FA';

  @override
  String get iconNameVolumeHighFa => 'الصوت High FA';

  @override
  String get iconNameVolumeLowFa => 'الصوت Low FA';

  @override
  String get iconNameVolumeOffFa => 'الصوت Off FA';

  @override
  String get iconNameMuteFa => 'كتم FA';

  @override
  String get iconNameMicMuteFa => 'Mic كتم FA';

  @override
  String get iconNameHeadphonesFa => 'Headphones FA';

  @override
  String get iconNameSpeakerFa => 'Speaker FA';

  @override
  String get iconNameUpFa => 'أعلى FA';

  @override
  String get iconNameDownFa => 'أسفل FA';

  @override
  String get iconNameLeftFa => 'يسار FA';

  @override
  String get iconNameRightFa => 'يمين FA';

  @override
  String get iconNameUpFaOutline => 'أعلى FA Outline';

  @override
  String get iconNameDownFaOutline => 'أسفل FA Outline';

  @override
  String get iconNameLeftFaOutline => 'يسار FA Outline';

  @override
  String get iconNameRightFaOutline => 'يمين FA Outline';

  @override
  String get iconNameArrowUpFa => 'Arrow أعلى FA';

  @override
  String get iconNameArrowDownFa => 'Arrow أسفل FA';

  @override
  String get iconNameArrowLeftFa => 'Arrow يسار FA';

  @override
  String get iconNameArrowRightFa => 'Arrow يمين FA';

  @override
  String get iconNameChevronUpFa => 'Chevron أعلى FA';

  @override
  String get iconNameChevronDownFa => 'Chevron أسفل FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron يسار FA';

  @override
  String get iconNameChevronRightFa => 'Chevron يمين FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Outline';

  @override
  String get iconNameCheckFa => 'تحقق FA';

  @override
  String get iconNameCloseFa => 'إغلاق FA';

  @override
  String get iconNameCloseCircleFa => 'إغلاق Circle FA';

  @override
  String get iconNameHomeFa => 'الرئيسية FA';

  @override
  String get iconNameUndoFa => 'Undo FA';

  @override
  String get iconNameRedoFa => 'Redo FA';

  @override
  String get iconNameRotateFa => 'Rotate FA';

  @override
  String get iconNameSearchFa => 'ابحث FA';

  @override
  String get iconNameRefreshFa => 'Refresh FA';

  @override
  String get iconNamePowerOffFa => 'تشغيل Off FA';

  @override
  String get iconNamePlugFa => 'Plug FA';

  @override
  String get iconNameToggleOnFa => 'Toggle On FA';

  @override
  String get iconNameToggleOffFa => 'Toggle Off FA';

  @override
  String get iconNameSettingsFa => 'الإعدادات FA';

  @override
  String get iconNameSettingsAltFa => 'الإعدادات Alt FA';

  @override
  String get iconNameMenuFa => 'القائمة FA';

  @override
  String get iconNameMoreFa => 'المزيد FA';

  @override
  String get iconNameMoreVerticalFa => 'المزيد Vertical FA';

  @override
  String get iconNameInfoFa => 'معلومات FA';

  @override
  String get iconNameInfoFaOutline => 'معلومات FA Outline';

  @override
  String get iconNameHelpFa => 'مساعدة FA';

  @override
  String get iconNameHelpFaOutline => 'مساعدة FA Outline';

  @override
  String get iconNameListFa => 'قائمة FA';

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
  String get iconNameNightModeFa => 'ليل الوضع FA';

  @override
  String get iconNameLightFa => 'فاتح FA';

  @override
  String get iconNameLightFaOutline => 'فاتح FA Outline';

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
  String get iconNameColorFa => 'لون FA';

  @override
  String get iconNamePaintFa => 'Paint FA';

  @override
  String get iconNameInputFa => 'إدخال FA';

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
  String get iconNameCloudFa => 'سحابة FA';

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
  String get iconNameTimerFa => 'مؤقت FA';

  @override
  String get iconNameLockFa => 'قفل FA';

  @override
  String get iconNameUnlockFa => 'Unlock FA';

  @override
  String get iconNameGalleryFa => 'Gallery FA';

  @override
  String get iconNameImagesFa => 'Images FA';

  @override
  String get iconNameImageFa => 'Image FA';

  @override
  String get iconNameVideoFileFa => 'Video ملف FA';

  @override
  String get iconNameAudioFileFa => 'صوت ملف FA';

  @override
  String get iconNamePlayOutlineFa => 'Play Outline FA';

  @override
  String get iconNamePlaySimpleFa => 'Play Simple FA';

  @override
  String get iconNamePauseSimpleFa => 'إيقاف مؤقت Simple FA';

  @override
  String get iconNameStopSimpleFa => 'إيقاف Simple FA';

  @override
  String get iconNameRecordFa => 'تسجيل FA';

  @override
  String get iconNameStopCircleFa => 'إيقاف Circle FA';

  @override
  String get iconNameLoadingFa => 'Loading FA';

  @override
  String get iconNameTextFa => 'Text FA';

  @override
  String get iconNameTextSizeFa => 'Text Size FA';

  @override
  String get iconNameLanguageFa => 'اللغة FA';

  @override
  String get iconNameGlobeFa => 'Globe FA';

  @override
  String get iconNameSubtitlesAltFa => 'Subtitles Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Subtitles Alt Outline FA';

  @override
  String get iconNameChannelUpFa => 'Channel أعلى FA';

  @override
  String get iconNameChannelDownFa => 'Channel أسفل FA';

  @override
  String get iconNamePageUpFa => 'Page أعلى FA';

  @override
  String get iconNamePageDownFa => 'Page أسفل FA';

  @override
  String get iconNameGuideFa => 'Guide FA';

  @override
  String get iconNameGridViewFa => 'Grid عرض FA';

  @override
  String get iconNameGridAltFa => 'Grid Alt FA';

  @override
  String get iconNameScheduleFa => 'Schedule FA';

  @override
  String get iconNameCalendarFa => 'Calendar FA';

  @override
  String get iconNameRedButtonFa => 'Red زر FA';

  @override
  String get iconNameButtonOutlineFa => 'زر Outline FA';

  @override
  String get iconNameSquareButtonFa => 'Square زر FA';

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
  String get iconNameFilterFa => 'تصفية FA';

  @override
  String get iconNameSortDownFa => 'Sort أسفل FA';

  @override
  String get iconNameSortUpFa => 'Sort أعلى FA';

  @override
  String get iconNameSleepFa => 'Sleep FA';

  @override
  String get iconNameTimerStartFa => 'مؤقت بدء FA';

  @override
  String get iconNameTimerHalfFa => 'مؤقت Half FA';

  @override
  String get iconNameTimerEndFa => 'مؤقت End FA';

  @override
  String get iconNameStopwatchFa => 'Stopwatch FA';

  @override
  String get iconNameAlarmFa => 'منبه FA';

  @override
  String get iconNameCropAltFa => 'Crop Alt FA';

  @override
  String get iconNameCropFa => 'Crop FA';

  @override
  String get iconNameSquareFullFa => 'Square Full FA';

  @override
  String get iconNameFullscreenAltFa => 'Fullscreen Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Zoom زائد FA';

  @override
  String get iconNameZoomMinusFa => 'Zoom ناقص FA';

  @override
  String get iconNameMusicNoteFa => 'موسيقى Note FA';

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
  String get iconNameChildModeFa => 'Child الوضع FA';

  @override
  String get iconNameCastFa => 'Cast FA';

  @override
  String get iconNameStreamFa => 'Stream FA';

  @override
  String get iconNameSignalFa => 'إشارة FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => 'Circle Arrow أعلى FA';

  @override
  String get iconNameCircleArrowDownFa => 'Circle Arrow أسفل FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Circle Arrow يسار FA';

  @override
  String get iconNameCircleArrowRightFa => 'Circle Arrow يمين FA';

  @override
  String get iconNameLongArrowUpFa => 'Long Arrow أعلى FA';

  @override
  String get iconNameLongArrowDownFa => 'Long Arrow أسفل FA';

  @override
  String get iconNameLongArrowLeftFa => 'Long Arrow يسار FA';

  @override
  String get iconNameLongArrowRightFa => 'Long Arrow يمين FA';

  @override
  String get iconNamePlusFa => 'زائد FA';

  @override
  String get iconNameMinusFa => 'ناقص FA';

  @override
  String get iconNamePlusCircleFa => 'زائد Circle FA';

  @override
  String get iconNameMinusCircleFa => 'ناقص Circle FA';

  @override
  String get iconNamePlusSquareFa => 'زائد Square FA';

  @override
  String get iconNameMinusSquareFa => 'ناقص Square FA';

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
  String get iconNameCloudSunFa => 'سحابة Sun FA';

  @override
  String get iconNameCloudMoonFa => 'سحابة Moon FA';

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
  String get unknownLabel => 'غير معروف';

  @override
  String get selectedFilesLabel => 'المحدد file(s)';

  @override
  String get folderNotFoundOrInaccessible => 'مجلد not موجود or inaccessible.';

  @override
  String get importedRemoteDefaultName => 'ImportedRemote';

  @override
  String get demoRemoteName => 'Demo جهاز التحكم';

  @override
  String get protocolFieldsInvalid =>
      'املأ حقول البروتوكول المطلوبة وتأكد أن التردد بين 15k و 60k إذا تم ضبطه.';

  @override
  String get unknownProtocolSelected => 'تم تحديد بروتوكول غير معروف.';

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
  String get pinRemote => 'تثبيت جهاز التحكم';

  @override
  String get unpinRemote => 'إلغاء تثبيت جهاز التحكم';

  @override
  String get pinRemoteSubtitle => 'ضع جهاز التحكم في الأعلى للوصول إليه بسرعة.';

  @override
  String get remoteAddedToPinned => 'ثُبّت جهاز التحكم.';

  @override
  String get remoteRemovedFromPinned => 'أُلغي تثبيت جهاز التحكم.';

  @override
  String get homeDeviceControlsTitle => 'عناصر تحكم سريعة';

  @override
  String get homeDeviceControlsSubtitle =>
      'تشغيل وكتم صوت ومستوى صوت دون فتح جهاز تحكم.';

  @override
  String get homeDeviceControlsEmptySubtitle =>
      'قم بإعداد أزرار التشغيل وكتم الصوت ومستوى الصوت في عناصر تحكم الجهاز.';

  @override
  String get showDeviceControlsOnHome =>
      'إظهار عناصر التحكم السريعة في الشاشة الرئيسية';

  @override
  String get showDeviceControlsOnHomeSubtitle =>
      'إظهار صف التشغيل وكتم الصوت ومستوى الصوت المختصر في الشاشة الرئيسية.';

  @override
  String get homeDeviceControlsShown => 'عناصر التحكم السريعة ظهرت في التطبيق.';

  @override
  String get homeDeviceControlsHidden =>
      'عناصر التحكم السريعة اتخفت في التطبيق.';

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
  String get learningModeCaptureFailed => 'تعذّر استقبال الإشارة.';

  @override
  String get learningModeReplaySent => 'تم إرسال الإشارة.';

  @override
  String get learningModeReplayFailed => 'تعذّر إرسال الإشارة المستقبلة.';

  @override
  String get learningModeNoRemotesAvailable => 'لسه مفيش ريموتات محفوظة.';

  @override
  String get learningModeChooseRemoteTitle => 'اختار ريموت';

  @override
  String get learningModeNewRemoteTitle => 'إنشاء ريموت';

  @override
  String get learningModeSaveSuccess => 'تم حفظ الزر.';

  @override
  String get learningModeSaveFailed => 'تعذّر حفظ الزر.';

  @override
  String get remoteSetupIntro =>
      'اختار اسم للريموت وشكل ترتيب الأزرار، وبعدها ضيف الأزرار.';

  @override
  String get startWithDefault => 'استخدم الاسم الافتراضي';

  @override
  String get browseGithubStore => 'تصفح GitHub';

  @override
  String get addFirstButton => 'أضف الزر الأول';

  @override
  String get moreWaysToStart => 'طرق تانية لإضافة الأزرار';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'تلغي إعداد الريموت الجديد؟ التغييرات مش هتتحفظ.';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'تتجاهل تغييرات الريموت؟ التغييرات دي مش هتتحفظ.';

  @override
  String get firstButtonAdded => 'تمت إضافة الزر الأول.';

  @override
  String get iconColorTitle => 'لون الرمز';

  @override
  String get iconColorHelper => 'اختر لونًا للرمز يبقى واضحًا فوق خلفية الزر.';

  @override
  String get colorRed => 'أحمر';

  @override
  String get colorPink => 'وردي';

  @override
  String get colorPurple => 'أرجواني';

  @override
  String get colorDeepPurple => 'أرجواني داكن';

  @override
  String get colorIndigo => 'نيلي';

  @override
  String get colorBlue => 'أزرق';

  @override
  String get colorLightBlue => 'أزرق فاتح';

  @override
  String get colorCyan => 'سماوي';

  @override
  String get colorTeal => 'تركوازي';

  @override
  String get colorGreen => 'أخضر';

  @override
  String get colorLightGreen => 'أخضر فاتح';

  @override
  String get colorLime => 'ليموني';

  @override
  String get colorYellow => 'أصفر';

  @override
  String get colorAmber => 'كهرماني';

  @override
  String get colorOrange => 'برتقالي';

  @override
  String get colorDeepOrange => 'برتقالي داكن';

  @override
  String get colorBrown => 'بني';

  @override
  String get colorGrey => 'رمادي';

  @override
  String get colorBlueGrey => 'أزرق رمادي';

  @override
  String get colorBlack => 'أسود';

  @override
  String get colorWhite => 'أبيض';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'لون الزر $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'لون الزر $colorName، محدد';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'لون الرمز $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'لون الرمز $colorName، محدد';
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
  String get quickSettingsTilesTitle => 'مربعات الإعدادات السريعة';

  @override
  String get quickSettingsPowerTile => 'مربع التشغيل';

  @override
  String get quickSettingsMuteTile => 'مربع كتم الصوت';

  @override
  String get quickSettingsVolumeUpTile => 'مربع رفع الصوت';

  @override
  String get quickSettingsVolumeDownTile => 'مربع خفض الصوت';

  @override
  String get quickSettingsNoTilesConfigured => 'لا توجد مربعات مهيأة';

  @override
  String get quickSettingsEmptyHint =>
      'الخطوة التالية: اختار أمر لمربع واحد على الأقل، وبعدها ضيف المربع من قائمة تعديل الإعدادات السريعة في Android.';

  @override
  String get quickSettingsSetPowerTile => 'تعيين مربع التشغيل';

  @override
  String get quickSettingsConfiguredHint =>
      'اختار الزر اللي كل مربع هيبعته. ضيف المربعات من قائمة تعديل الإعدادات السريعة في Android.';

  @override
  String get quickSettingsNotSet => 'غير معين';

  @override
  String quickSettingsTileMappingSummary(String title, String subtitle) {
    return '$title · $subtitle';
  }

  @override
  String get quickSettingsPickButtonTooltip => 'اختيار زر';

  @override
  String get quickSettingsClearTooltip => 'مسح';

  @override
  String get homeWidgetUnsupportedLauncher =>
      'بدل كده، ضيف أداة IR Blaster من قائمة الأدوات في الشاشة الرئيسية.';

  @override
  String get homeWidgetButtonUnsupported =>
      'مينفعش تضيف الزر ده كأداة في الشاشة الرئيسية.';

  @override
  String get homeWidgetRequestSent =>
      'طلب إضافة الأداة اتبعت. أكّد الإضافة في الشاشة الرئيسية لو ظهر لك طلب.';

  @override
  String get homeWidgetRequestRejected =>
      'مقدرناش نطلب إضافة الأداة. جرّب تضيفها من الشاشة الرئيسية.';

  @override
  String homeWidgetSetupFailed(String error) {
    return 'مقدرناش نجهّز الأداة: $error';
  }

  @override
  String get addHomeWidget => 'إضافة ودجة للشاشة الرئيسية';

  @override
  String get addHomeWidgetSubtitle => 'ضع هذا الزر على شاشتك الرئيسية.';

  @override
  String buttonInfoType(String type) {
    return 'النوع: $type';
  }

  @override
  String get buttonInfoCodeRaw => 'الرمز: إشارة خام';

  @override
  String buttonInfoCode(String code) {
    return 'الرمز: $code';
  }

  @override
  String get buttonInfoNoCode => 'لا يوجد رمز';

  @override
  String buttonInfoFrequency(String frequency) {
    return 'التردد: $frequency';
  }

  @override
  String get frequencyHzLabel => 'التردد (Hz)';

  @override
  String get carrierFrequencyHelper => 'تردد الحامل، مثال 38000';

  @override
  String get requiredFrequencyHelper => 'مطلوب. مثال: 38000';

  @override
  String get validFrequencyError => 'أدخل تردد صالح (15k-60k).';

  @override
  String get resetToDefaultFrequency => 'إعادة الضبط إلى 38000';

  @override
  String get rawDataLabel => 'البيانات الخام';

  @override
  String get rawDataHelper =>
      'أرقام صحيحة مفصولة بمسافات، مثال 9000 4500 560 560 ...';

  @override
  String get rawDataInvalid =>
      'البيانات الخام لازم تكون أرقام صحيحة مفصولة بمسافات أو أسطر جديدة.';

  @override
  String get rawDataSafeguard =>
      'حماية: يتم حظر القيم غير الصالحة لمنع حفظ نمط لا يمكن إرساله.';

  @override
  String get protocolLabel => 'البروتوكول';

  @override
  String get protocolEncodingHelper =>
      'الترميز متاح فقط للبروتوكولات المحددة كمنفذة.';

  @override
  String get protocolFrequencyHelper =>
      'اختياري. لو فاضي، سيتم استخدام التردد الافتراضي للبروتوكول عند توفره.';

  @override
  String get rawSignalInvalidWithFrequency =>
      'البيانات الخام لازم تكون أرقام صحيحة مفصولة بمسافات أو أسطر جديدة، والتردد لازم يكون 15k-60k.';

  @override
  String get necTimingsNumeric => 'كل توقيتات NEC لازم تكون أرقام.';

  @override
  String get frequencyRangeError => 'التردد لازم يكون 15k-60k Hz.';

  @override
  String get pasteTooltip => 'لصق';

  @override
  String get clearTooltip => 'مسح';

  @override
  String irFinderResumeMask(Object value) {
    return 'القناع: $value';
  }

  @override
  String get irFinderKnownMaskLabel => 'قناع الرمز المعروف (اختياري)';

  @override
  String get irFinderKnownMaskHint => '00FFXXFF أو FFXXFF أو 0xA1XX';

  @override
  String irFinderKnownMaskHelper(int digits, Object example) {
    return 'حمولة من $digits خانات. استخدم X للخانات المجهولة، وتُعامل الخانات النهائية المحذوفة كـ X. مثال: $example';
  }

  @override
  String get irFinderKnownMaskInvalidCharacters =>
      'استخدم أرقام hex وبدائل X والمسافات والنقطتين والشرطات والشرطات السفلية فقط.';

  @override
  String irFinderKnownMaskTooLong(int digits) {
    return 'القناع أطول من حمولة هذا البروتوكول المكونة من $digits خانات.';
  }

  @override
  String irFinderNormalizedMaskValue(Object value) {
    return 'القناع الموحّد: $value';
  }

  @override
  String get irFinderNormalizedMask => 'القناع الموحّد';

  @override
  String get irFinderNormalizedMaskAllUnknown => 'كل الخانات مجهولة';

  @override
  String get irFinderSearchOrder => 'ترتيب البحث';

  @override
  String get irFinderSmartOrder => 'ذكي';

  @override
  String get irFinderSequentialOrder => 'تسلسلي';

  @override
  String get irFinderSmartOrderHint =>
      'يراعي البروتوكول: يختبر القيم المنخفضة الشائعة أولاً، ثم يوزع البحث على حقول الأوامر والجهاز ويتجاوز البتات التي يتجاهلها المُرمّز.';

  @override
  String get irFinderSequentialOrderHint =>
      'وضع التوافق: يختبر خانات البدل بترتيب hex تصاعدي.';

  @override
  String irFinderSmartMeaningfulBits(int bits) {
    return 'يغيّر الوضع الذكي $bits بتات ذات معنى لهذا القناع.';
  }

  @override
  String get irFinderBruteforceMaskTip =>
      'نصيحة: استبدل كل خانة مجهولة بـ X. تثبيت الخانات المعروفة في أي موضع يقلل البحث بشكل كبير.';

  @override
  String get automationBroadcastsTitle => 'السماح ببث الأتمتة';

  @override
  String get automationBroadcastsSubtitle =>
      'أي تطبيق متثبّت يقدر يبعت أوامر الأشعة تحت الحمراء من المرسل المدمج أو USB أو مخرج الصوت، حتى والتطبيق ده مقفول. USB محتاج إذن مسبق. والصوت محتاج محوّل أشعة تحت الحمراء وتعلية صوت الوسائط.';

  @override
  String get automationSettingsError =>
      'ماقدرناش نحمّل أو نحفظ إعداد الأتمتة. جرّب تاني.';

  @override
  String get settingsHardwareTitle => 'أجهزة الأشعة تحت الحمراء والتعلّم';

  @override
  String get settingsHardwareSubtitle =>
      'اختيار باعث وإدارة USB وتعلّم الإشارات';

  @override
  String get settingsAppearanceSubtitle => 'المظهر والألوان ولغة التطبيق';

  @override
  String get settingsInteractionSubtitle =>
      'بدء التشغيل والاهتزاز وعرض جهاز التحكم والأتمتة';

  @override
  String get settingsToolsTitle => 'الأدوات والاختصارات';

  @override
  String get settingsToolsSubtitle =>
      'التحكم بالأجهزة والإعدادات السريعة ومتجر GitHub والطاقة العامة';

  @override
  String get layoutCustom => 'مخصص';

  @override
  String get layoutCustomDescription =>
      'اختار عدد الأعمدة وشكل الأزرار. ضيف الفراغات في شاشة التعديل.';

  @override
  String get layoutColumns => 'الأزرار في كل صف';

  @override
  String get layoutShape => 'شكل الأزرار';

  @override
  String get layoutCircle => 'دائرة';

  @override
  String get layoutRoundedSquare => 'مربع مستدير الزوايا';

  @override
  String get layoutRectangle => 'مستطيل';

  @override
  String get layoutReflowHint =>
      'تغيير عدد الأعمدة بيغيّر ترتيب الأزرار. اسحب على الجنب لو الشبكة أعرض من الشاشة.';

  @override
  String get layoutUpdated => 'تم تحديث التخطيط';

  @override
  String get layoutArrange => 'ترتيب الأزرار';

  @override
  String get layoutAddRow => 'إضافة صف فارغ';

  @override
  String get layoutArrangeHint =>
      'اضغط على الزر شوية واسحبه، أو دوس عليه وبعدين على مكانه الجديد. لو فيه زر تاني هناك، هيبدّلوا أماكنهم.';

  @override
  String get layoutEmptyHint =>
      'دوس على مكان فاضي عشان تضيف زر، أو على زر عشان تعدّله. اضغط على الزر شوية عشان تشوف خيارات أكتر.';

  @override
  String layoutCell(int row, int column) {
    return 'الصف $row، العمود $column';
  }

  @override
  String get dbBrandSearchHelp =>
      'ابدأ بالماركة، زي Sony أو TCL. بعد كده اختار موديل الجهاز أو الريموت.';

  @override
  String get dbModelSearchHelp =>
      'ابحث عن الموديل المكتوب على الجهاز أو الريموت. مش لازم المسافات والشرطات تكون متطابقة.';

  @override
  String get irFinderDatabaseSearchHint =>
      'ابدأ باختيار الماركة في وضع قاعدة البيانات عشان تختبر الأكواد المعروفة من غير تكرار. البحث الشامل الذكي بيرتب الاحتمالات حسب الأولوية، لكنه مش بيكتشف استجابة الجهاز. احفظ الكود الناجح لما تلاحظ استجابة.';

  @override
  String get irFinderClearSearchToJump =>
      'امسح البحث عشان تنتقل لموضع في الاختبار.';

  @override
  String get crashReportTitle => 'حصلت مشكلة في المرة اللي فاتت';

  @override
  String get crashReportExplanation =>
      'التقرير المحلي فيه تفاصيل تقنية عن التطبيق والجهاز والخطأ. مفيش حاجة بتتبعت تلقائيًا. راجع أي معلومات حساسة قبل المشاركة. المشاركة بتحتفظ بالتقرير؛ عدم الإرسال بيمسحه؛ مش دلوقتي بيحتفظ بيه لحد التشغيل الجاي.';

  @override
  String get crashReportDetails => 'راجع التقرير';

  @override
  String get crashReportShare => 'شارك التقرير';

  @override
  String get crashReportEmail => 'راسل الدعم';

  @override
  String get crashReportCopied => 'تم نسخ التقرير.';

  @override
  String get crashReportDontSend => 'عدم الإرسال';

  @override
  String get crashReportNotNow => 'مش دلوقتي';

  @override
  String get crashReportActionFailed =>
      'مش قادرين نكمل الإجراء. التقرير لسه محفوظ. جرّب تنسخه أو تشاركه.';

  @override
  String get shareTitle => 'مشاركة واستلام';

  @override
  String get shareReceive => 'استلام';

  @override
  String get shareScan => 'امسح رمز QR';

  @override
  String get shareOpenFile => 'افتح ملف مشترك';

  @override
  String get shareSelect => 'اختار اللي عايز تشاركه';

  @override
  String get shareSend => 'شارك مع جهاز تاني';

  @override
  String get shareQr => 'اعرض رمز QR';

  @override
  String get shareQrHint =>
      'على الموبايل التاني، افتح IR Blaster > أجهزة التحكم > مشاركة واستلام > امسح رمز QR.';

  @override
  String get shareTooLarge =>
      'البيانات كتير على رمز QR واضح. استخدم المشاركة مع جهاز تاني.';

  @override
  String get sharePreview => 'راجع العناصر المشتركة';

  @override
  String get sharePrivacy =>
      'مش محتاج حساب ولا سيرفر. مفيش بيانات أو إشارات بتتبعت تلقائيًا. الجهاز اللي بيستقبل محتاج مرسل أشعة تحت الحمراء متوافق.';

  @override
  String get shareHardwareWarning =>
      'بعض الإشارات المتعلّمة محتاجة الجهاز الأصلي وممكن متشتغلش على جهاز تاني.';

  @override
  String get shareMacroInfo =>
      'الماكرو بتشمل أجهزة التحكم والأزرار المرتبطة بيها. الاستيراد بيعمل نسخ جديدة من غير استبدال أو تشغيل تلقائي.';

  @override
  String get shareAdd => 'ضيف نسخ';

  @override
  String get shareAdded => 'تمت إضافة العناصر المشتركة.';

  @override
  String get shareDestination => 'ضيف الزر إلى';

  @override
  String get shareCamera =>
      'اسمح باستخدام الكاميرا لمسح رموز QR أو افتح ملف مشترك.';

  @override
  String get shareInvalid =>
      'البيانات دي مش صالحة أو كبيرة جدًا أو بتستخدم إصدار مش مدعوم.';

  @override
  String get sharePrepareFailed =>
      'مش قادرين نجهز المشاركة. راجع الصور أو أزرار الماكرو الناقصة أو حجم المجموعة.';

  @override
  String get shareFailed =>
      'مش قادرين نكمل المشاركة أو الحفظ. عناصرك الموجودة متغيرتش.';

  @override
  String get updatesTitle => 'تحديثات التطبيق';

  @override
  String get updatesAutomatic => 'التحقق التلقائي من التحديثات';

  @override
  String get updatesPrivacyGithub =>
      'معطّل افتراضيًا. عند تفعيله، يتصل التطبيق بـ GitHub مرة يوميًا أثناء استخدامه. لا يتم التنزيل تلقائيًا.';

  @override
  String get updatesPrivacyPlay =>
      'معطّل افتراضيًا. عند تفعيله، يتصل التطبيق بـ Google Play مرة يوميًا أثناء استخدامه. لا يتم التنزيل تلقائيًا.';

  @override
  String get updatesUnknown => 'غير معروف';

  @override
  String get updatesChooseSource => 'اختر مصدر التحديثات';

  @override
  String get updatesCheck => 'التحقق الآن';

  @override
  String get updatesNever => 'لم يتم التحقق بعد';

  @override
  String updatesLastChecked(String date) {
    return 'آخر تحقق: $date';
  }

  @override
  String updatesAvailable(String version) {
    return 'إصدار جديد: $version';
  }

  @override
  String get updatesCurrent => 'لم يتم العثور على إصدار أحدث.';

  @override
  String get updatesFailed =>
      'فشل التحديث. تحقق من الاتصال وحاول مجددًا. تُحظر ملفات APK غير المتوافقة ولا تُحذف بيانات التطبيق.';

  @override
  String get updatesFdroidNote =>
      'قد يُعلن GitHub عن إصدار قبل أن يُكمل F-Droid بناءه. حدّث عبر F-Droid للحفاظ على توافق التوقيع وبياناتك.';

  @override
  String get updatesOpenFdroid => 'فتح F-Droid';

  @override
  String get updatesOpenPlay => 'فتح Google Play';

  @override
  String get updatesDownload => 'تنزيل التحديث';

  @override
  String get updatesInstall => 'تثبيت التحديث';

  @override
  String get updatesAllowInstall => 'السماح بالتثبيت';

  @override
  String get updatesInstallHint =>
      'قد يطلب Android السماح بالتثبيت من هذا التطبيق. عد إلى هنا ثم اضغط على تثبيت التحديث. ستُحفظ أجهزة التحكم ووحدات الماكرو.';

  @override
  String get updatesReady => 'تم تنزيل التحديث وهو جاهز للتثبيت.';

  @override
  String get updatesNoAsset =>
      'لا يتوفر ملف APK تم التحقق منه لهذا الجهاز. راجع ملاحظات الإصدار.';

  @override
  String get updatesReleaseNotes => 'ملاحظات الإصدار';

  @override
  String updatesChannel(String source) {
    return 'مصدر التحديثات: $source';
  }

  @override
  String updatesDownloadConfirm(String size) {
    return 'هل تريد تنزيل $size ميغابايت من GitHub؟ يتطلب التثبيت تأكيدك.';
  }

  @override
  String get learningModeIncompleteSignal =>
      'الإشارة شكلها مش كاملة. قرّب الريموت وجرب تاني.';

  @override
  String get learningModeUseUsb => 'استخدم محوّل USB';

  @override
  String get learningModeSwitchedUsb => 'تم التحويل لمحوّل USB.';

  @override
  String learningModeSwitchUsbFailed(String error) {
    return 'ما قدرناش نحوّل لمحوّل USB: $error';
  }

  @override
  String get learningModeAudioUnavailableTitle =>
      'التعلّم عن طريق الصوت مش متاح';

  @override
  String get learningModeAudioUnavailableBody =>
      'إكسسوارات الأشعة تحت الحمراء المتوصلة بالصوت تقدر تبعت أوامر، لكن مش بتتعلّم إشارات في التطبيق ده. استخدم مستقبل بيدعم التعلّم.';

  @override
  String learningModeBuiltInReceiver(String brand) {
    return 'مستقبل IR مدمج من $brand';
  }

  @override
  String get learningModeUsbReceiver => 'مستقبل USB للتعلّم';

  @override
  String learningModeDefaultRemoteName(String buttonName) {
    return 'ريموت $buttonName';
  }

  @override
  String get learningModeSupportedReceivers =>
      'استخدم مستقبل بيدعمه التطبيق:\n• محوّل IR USB متوافق من Tiqiaa أو ZaZa أو ElkSmart\n• موبايل Huawei / Honor مدعوم بيستقبل أشعة تحت الحمراء\n• موبايل LG مدعوم وعليه خدمة UEI Quickset\n\nمش كل الموديلات بتدعم التعلّم.';

  @override
  String learningModeCapturedWith(String device) {
    return 'الإشارة اتسجلت باستخدام $device';
  }

  @override
  String get learningModeLgReplayRestriction =>
      'عشان تبعت الإشارة دي تاني، لازم تستخدم نفس موبايل LG اللي سجلتها بيه.';

  @override
  String learningModeTimingCount(int count) {
    return 'الفترات المسجّلة: $count';
  }

  @override
  String get learningModeUnknownCarrier => 'تردد الموجة الحاملة مش معروف';

  @override
  String learningModeByteCount(int count) {
    return 'عدد البايتات: $count';
  }
}
