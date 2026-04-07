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
      'هذا الهاتف لا يحتوي على مرسل IR مدمج. تم اكتشاف دونجل IR عبر USB، لكن لم يتم منح الإذن بعد.\n\nوافق على طلب إذن USB لتفعيل الإرسال عبر IR.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'هذا الهاتف لا يحتوي على مرسل IR مدمج. تم اكتشاف دونجل IR عبر USB، لكن تم رفض إذن USB.\n\nاطلب الإذن مرة أخرى ووافق على الرسالة لتفعيل الإرسال عبر IR.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'هذا الهاتف لا يحتوي على مرسل IR مدمج. تم السماح لدونجل IR عبر USB، لكنه لم يتهيأ بعد.';

  @override
  String get homeUsbOpenFailedMessage =>
      'هذا الهاتف لا يحتوي على مرسل IR مدمج. تم اكتشاف دونجل IR عبر USB والسماح له، لكن تعذر تهيئته.\n\nأعد توصيل الدونجل وحاول مرة أخرى.';

  @override
  String get homeUsbReadyMessage => 'هذا الهاتف لا يحتوي على مرسل IR مدمج.';

  @override
  String get homeUsbNoDeviceMessage =>
      'هذا الهاتف لا يحتوي على مرسل IR مدمج، ولا يوجد حالياً دونجل IR عبر USB مدعوم متصل.\n\nما زال بإمكانك إنشاء أجهزة التحكم واستيرادها وإدارتها، لكن لإرسال إشارات IR تحتاج إلى أحد الخيارات أدناه.';

  @override
  String get homeUsbOptionPlugIn =>
      'وصّل دونجل IR عبر USB مدعوماً، ثم وافق على الإذن.';

  @override
  String get homeUsbOptionReady => 'جاهز للاستخدام.';

  @override
  String get homeUsbOptionPermissionRequired => 'موصول. الإذن مطلوب.';

  @override
  String get homeUsbOptionPermissionDenied => 'تم رفض الإذن. اطلبه مرة أخرى.';

  @override
  String get homeUsbOptionPermissionGranted => 'تم السماح. جار تهيئة الدونجل.';

  @override
  String get homeUsbOptionOpenFailed => 'تم السماح، لكن فشلت التهيئة.';

  @override
  String get homeHardwareBannerNoInternal =>
      'هذا الهاتف لا يحتوي على IR مدمج. وصّل دونجل IR عبر USB أو فعّل وضع الصوت من الإعدادات.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'تم اكتشاف دونجل USB. الإذن مطلوب لإرسال IR.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'تم رفض إذن USB. اطلبه مرة أخرى لإرسال IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'تم السماح لدونجل USB. في انتظار التهيئة.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'USB دونجل authorized, but تهيئة فشل.';

  @override
  String get homeHardwareBannerReady => 'USB جاهز.';

  @override
  String get homeHardwareRequiredTitle => 'IR hardware مطلوب إلى send commands';

  @override
  String get homeUsbDongleRecommended => 'دونجل IR عبر USB، موصى به';

  @override
  String get homeAudioAdapterAlternative => 'صوت IR adapter (alternative)';

  @override
  String get homeAudioAdapterDescription =>
      'الإعدادات → مرسل IR → الصوت 1 LED أو 2 LED. يتطلب محول صوت إلى IR.';

  @override
  String get close => 'إغلاق';

  @override
  String get homeChooseTransmitter => 'اختر a transmitter';

  @override
  String get openSettings => 'فتح الإعدادات';

  @override
  String get homeUsbPermissionSentApprove =>
      'تم إرسال طلب إذن USB. وافق على الرسالة لتفعيل USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'لم يتم اكتشاف دونجل IR عبر USB مدعوم. وصّله ثم حاول مرة أخرى.';

  @override
  String get homeUsbPermissionRequestFailed => 'فشل طلب إذن USB.';

  @override
  String get working => 'Working…';

  @override
  String get requestUsbPermission => 'طلب إذن USB';

  @override
  String get homeHardwareTip =>
      'ملاحظة: ما زال بإمكانك إنشاء أجهزة التحكم وتنظيمها الآن. يلزم العتاد فقط عند الإرسال.';

  @override
  String get homeNoIrTransmitterTitle => 'No IR transmitter available';

  @override
  String get settingsNavLabel => 'الإعدادات';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get remotesNavLabel => 'أجهزة التحكم';

  @override
  String get macrosNavLabel => 'الماكرو';

  @override
  String get signalTesterNavLabel => 'مختبر الإشارة';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get remoteNoIrEmitterTitle => 'No IR emitter';

  @override
  String get remoteNoIrEmitterMessage => 'هذا الجهاز لا يحتوي على مرسل IR.';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'This app needs an IR emitter إلى function';

  @override
  String get remoteDismiss => 'Dismiss';

  @override
  String get remoteClose => 'إغلاق';

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
    return 'حذف فشل: $error';
  }

  @override
  String get remoteNotFoundSavedList => 'جهاز التحكم not موجود in saved list.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'تم حذف \"$name\".';
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
  String get learningModeEntryTitle => 'وضع التعلم';

  @override
  String get learningModeEntrySubtitle =>
      'التقط زرًا من جهاز التحكم عن بعد الفعلي خطوة بخطوة';

  @override
  String get learningModeTitle => 'وضع التعلم';

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
      'التحقق من حالة جهاز الإرسال وجهاز استقبال USB المتاحين.';

  @override
  String get learningModeHardwareReadyBody =>
      'يتم توصيل دونجل USB IR وتهيئته. هذا هو المكان المناسب لبدء تدفق التعلم بمجرد توصيل أسلاك الالتقاط.';

  @override
  String get learningModeHardwarePermissionBody =>
      'يوجد دونجل USB، لكن إذن Android لا يزال يمنعه. امنح إذن USB في قسم جهاز الإرسال قبل التعلم.';

  @override
  String get learningModeHardwareSetupBody =>
      'تم اكتشاف جهاز دونجل جزئيًا، لكنه لا يزال بحاجة إلى الإعداد أو إعادة الاتصال قبل أن يبدأ التعلم بشكل موثوق.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'لا يتوفر حاليًا أي جهاز استقبال متوافق. وضع التعلم مخصص لأجهزة الدونجل الخارجية المدعومة ذات القدرة على الاستقبال.';

  @override
  String get learningModeRefreshHardware => 'تحديث حالة الأجهزة';

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
  String get learningModeButtonNameHint =>
      'على سبيل المثال: HDMI 1، الطاقة، القائمة';

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
  String get learningModeStartListening => 'ابدأ بالاستماع';

  @override
  String get learningModeCaptureStubTitle => 'التقاط الخلفية يأتي بعد ذلك';

  @override
  String get learningModeCaptureStubBody =>
      'يتم دعم هذه الشاشة بالكامل أولاً حتى يمكن توصيل تدفق الالتقاط النهائي بحالات الأجهزة الحقيقية بدلاً من تثبيته لاحقًا.';

  @override
  String get learningModeCaptureStubMessage =>
      'التقاط التعلم ليس سلكيًا بعد. تعمل هذه الشاشة على دعم التدفق الكامل أولاً.';

  @override
  String get learningModeUnnamedCapture => 'التقاط بدون اسم';

  @override
  String get learningModeStatusCheckingTitle => 'فحص المتلقي';

  @override
  String get learningModeStatusNoReceiverTitle => 'المتلقي غير جاهز';

  @override
  String get learningModeStatusPermissionTitle => 'مطلوب إذن USB';

  @override
  String get learningModeStatusSetupTitle => 'يحتاج المتلقي إلى الإعداد';

  @override
  String get learningModeStatusReadyTitle => 'جاهز للتعلم';

  @override
  String get learningModeStatusListeningTitle => 'الاستماع للإشارة';

  @override
  String get learningModeStatusCapturedTitle => 'تم التقاط الإشارة';

  @override
  String get learningModeStatusReadyBody =>
      'قم بتسمية الزر، وقم بتوجيه جهاز التحكم عن بعد الأصلي نحو جهاز الاستقبال، وابدأ في الاستماع عندما تكون جاهزًا.';

  @override
  String get learningModeStatusListeningBody =>
      'اضغط على الزر البعيد الأصلي الآن. بمجرد توصيل الالتقاط، سيتم تثبيت هذه الحالة على الإشارة النظيفة التالية.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'معاينة الإشارة المكتسبة جاهزة لـ $buttonName. أعد تشغيله، وتأكد من أنه يعمل، ثم احفظه في مكتبتك.';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'قم بتوصيل دونجل تعليمي متوافق';

  @override
  String get learningModeConnectReceiverBody =>
      'يعتمد وضع التعلم على الأجهزة الخارجية التي يمكنها استقبال الأشعة تحت الحمراء. بمجرد اكتشاف جهاز الاستقبال والترخيص له، تصبح هذه الصفحة بمثابة تدفق مباشر للاستماع والاختبار والحفظ.';

  @override
  String get learningModeListenCardTitle => 'استمع لزر واحد';

  @override
  String get learningModeListenCardBody =>
      'قم بتعيين الملصق أولاً إذا كنت تريد ذلك، ثم ابدأ الاستماع واضغط على الزر الموجود على جهاز التحكم عن بعد الأصلي.';

  @override
  String get learningModeReadyToListenTitle => 'جاهز للاستماع';

  @override
  String get learningModeReadyToListenBody =>
      'هذا هو سطح الالتقاط الرئيسي. ابدأ الاستماع فقط عندما يكون جهاز التحكم عن بعد الأصلي موجهًا وثابتًا.';

  @override
  String get learningModeListeningNowTitle => 'الاستماع الآن';

  @override
  String get learningModeListeningNowBody =>
      'اضغط على زر التحكم عن بعد الأصلي مرة واحدة. استخدم التقاط المعاينة للتنقل عبر بقية السقالة قبل أن يتم توصيل واجهة الالتقاط الخلفية الحقيقية.';

  @override
  String get learningModePreviewCaptureAction => 'معاينة الإشارة الملتقطة';

  @override
  String get learningModeCapturedSummary => 'معاينة الإشارة المستفادة';

  @override
  String get learningModeResultActionsTitle => 'اختبار وحفظ';

  @override
  String get learningModeResultActionsBody =>
      'أعد تشغيل الإشارة التي تم تعلمها، وتأكد من استجابة الجهاز المستهدف، ثم احفظها كزر قابل لإعادة الاستخدام.';

  @override
  String get learningModeReplayAction => 'إعادة التشغيل';

  @override
  String get learningModeReplayStubMessage =>
      'إعادة التشغيل ليست سلكية بعد. هذه هي دعامة واجهة المستخدم لتدفق التعلم والاختبار والحفظ النهائي.';

  @override
  String get learningModeSaveStubMessage =>
      'الحفظ ليس سلكيًا بعد. الخطوة التالية هي توصيل هذه الشاشة بـ \"إنشاء زر\" وأجهزة التحكم عن بعد الموجودة.';

  @override
  String get learningModeLearnAnotherAction => 'تعلم زر آخر';

  @override
  String get learningModeStepReviewTitle => 'مراجعة وحفظ';

  @override
  String get learningModeStepReviewSubtitle =>
      'قم بتأكيد ما تعلمته، ثم اختر المكان الذي يجب أن يكون موجودًا فيه في مكتبتك البعيدة.';

  @override
  String get learningModeSaveToExistingRemote => 'البعيد الموجود';

  @override
  String get learningModeCreateNewRemote => 'ريموت جديد';

  @override
  String get learningModeProtocolPreviewTitle => 'معاينة البروتوكول';

  @override
  String get learningModeProtocolPreviewBody =>
      'ستظهر هنا تفاصيل البروتوكول الذي تم فك تشفيره بمجرد أن يلتقط جهاز الاستقبال ضغطة زر نظيفة.';

  @override
  String get learningModeRawPreviewTitle => 'احتياطي الخام';

  @override
  String get learningModeRawPreviewBody =>
      'إذا لم يكتمل فك التشفير، فسيظل التقاط التوقيت الأولي متاحًا هنا للمراجعة والحفظ.';

  @override
  String get learningModeSaveCapture => 'حفظ الالتقاط';

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
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'Intensity';

  @override
  String get intensityLight => 'فاتح';

  @override
  String get intensityMedium => 'Medium';

  @override
  String get intensityStrong => 'Strong';

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
  String get manageFavorites => 'Manage favorites';

  @override
  String get manageFavoritesSubtitle =>
      'اختر الأزرار التي تظهر في عناصر تحكم الجهاز';

  @override
  String get quickSettingsTitle => 'Quick الإعدادات';

  @override
  String get quickSettingsSubtitle => 'أضف مربعات لاختصارات الطاقة والصوت';

  @override
  String get configureTiles => 'Configure tiles';

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
  String get unnamedButton => 'زر بدون اسم';

  @override
  String get iconFallback => 'أيقونة';

  @override
  String get remoteListReorderHint =>
      'وضع إعادة الترتيب: اضغط مطولاً واسحب البطاقة لتحريكها.';

  @override
  String get deleteRemoteTitle => 'حذف جهاز التحكم؟';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" will be permanently removed. This action can\'t be undone.';
  }

  @override
  String get delete => 'حذف';

  @override
  String get addToDeviceControlsTitle => 'إضافة إلى الجهاز Controls?';

  @override
  String get addToDeviceControlsDescription =>
      'وصول سريع في عناصر تحكم جهاز النظام.';

  @override
  String get skip => 'تخطي';

  @override
  String get add => 'إضافة';

  @override
  String get addedToDeviceControls => 'Added إلى الجهاز Controls.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Deleted \"$name\". This action can\'t be undone.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count زر · $layout';
  }

  @override
  String get layoutComfort => 'Comfort';

  @override
  String get layoutCompact => 'Compact';

  @override
  String get open => 'فتح';

  @override
  String get useThisRemote => 'استخدم جهاز التحكم هذا';

  @override
  String get edit => 'تعديل';

  @override
  String get editRemoteSubtitle => 'إعادة التسمية وتعديل الأزرار';

  @override
  String get thisCannotBeUndone => 'This cannot be undone';

  @override
  String get searchRemotes => 'ابحث أجهزة التحكم';

  @override
  String get reorderRemotes => 'Reorder remotes';

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
      other: '$count buttons',
      one: '$count button',
    );
    return '$_temp0';
  }

  @override
  String get noRemotesYet => 'No remotes yet';

  @override
  String get noRemotesDescription => 'أنشئ جهاز تحكم لبدء إرسال أكواد IR.';

  @override
  String get noRemotesNextStep =>
      'ماذا بعد: اضغط إضافة جهاز تحكم، ثم أضف أول أزرارك.';

  @override
  String get actions => 'Actions';

  @override
  String get macrosTitle => 'الماكرو';

  @override
  String get help => 'مساعدة';

  @override
  String get createMacro => 'إنشاء ماكرو';

  @override
  String get timedMacrosTitle => 'ماكرو مؤقت';

  @override
  String get timedMacrosSubtitle => 'أتمتة تسلسلات أوامر IR بتوقيت دقيق';

  @override
  String get timedMacrosNextStep =>
      'الخطوة التالية: اضغط إنشاء أول ماكرو، اختر جهاز تحكم، ثم أضف الأوامر وفترات التأخير.';

  @override
  String get macroFeatureToysTitle => 'مثالي للألعاب التفاعلية';

  @override
  String get macroFeatureToysDescription =>
      'تحكم في أجهزة مثل كلاب i-cybie الروبوتية وروبوتات i-sobot وغيرها من الألعاب التي تحتاج وقتاً بين الأوامر لمعالجة الإجراءات.';

  @override
  String get macroFeatureTimingTitle => 'تحكم دقيق بالتوقيت';

  @override
  String get macroFeatureTimingDescription =>
      'أضف تأخيرات بين الأوامر، من 250ms إلى مدد مخصصة، حتى يجد جهازك وقتاً للاستجابة قبل الأمر التالي.';

  @override
  String get macroFeatureManualTitle => 'خطوات متابعة يدوية';

  @override
  String get macroFeatureManualDescription =>
      'أوقف التنفيذ وانتظر تأكيدك عندما تختلف مدة الحركة أو عندما تحتاج إلى ملاحظة مرئية.';

  @override
  String get exampleUseCase => 'مثال Use Case';

  @override
  String get macroExampleText =>
      'وضع i-cybie المتقدم:\n1. أرسل أمر الوضع\n2. انتظر 1000ms، اللعبة تعالج\n3. أرسل الإجراء 1\n4. انتظر 1000ms\n5. أرسل الإجراء 2\n…وهكذا تلقائياً';

  @override
  String get createFirstMacro => 'أنشئ أول ماكرو';

  @override
  String get noRemote => 'لا يوجد جهاز تحكم';

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
  String get aboutTimedMacros => 'حول الماكرو المؤقت';

  @override
  String get aboutTimedMacrosDescription =>
      'تتيح لك وحدات الماكرو المؤقتة أتمتة تسلسلات أوامر IR مع تأخيرات دقيقة بين كل خطوة.';

  @override
  String get sendCommand => 'إرسال Command';

  @override
  String get sendCommandDescription => 'يرسل أمر IR من جهاز التحكم الخاص بك.';

  @override
  String get delay => 'تأخير';

  @override
  String get delayDescription =>
      'ينتظر مدة محددة، مثل 1000ms، قبل الخطوة التالية.';

  @override
  String get manualContinue => 'يدوي متابعة';

  @override
  String get manualContinueDescription =>
      'يوقف التنفيذ حتى تضغط متابعة، مفيد للحركات ذات الطول المتغير.';

  @override
  String get gotIt => 'فهمت';

  @override
  String get failedToSaveMacros => 'فشل حفظ الماكرو.';

  @override
  String deletedMacroNamed(Object name) {
    return 'تم حذف \"$name\".';
  }

  @override
  String get undo => 'Undo';

  @override
  String get failedToRestoreMacro => 'فشل استعادة الماكرو.';

  @override
  String get deleteMacroTitle => 'حذف الماكرو؟';

  @override
  String get deleteMacroMessage => 'يمكنك التراجع عن ذلك من الشريط التالي.';

  @override
  String get noRemotesAvailable => 'No remotes available.';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count زر';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Orientation: flipped (tap إلى normal)';

  @override
  String get remoteOrientationNormalTooltip =>
      'Orientation: normal (tap إلى flip)';

  @override
  String get stopLoop => 'إيقاف loop';

  @override
  String get reorderButtons => 'Reorder أزرار';

  @override
  String get remoteReorderHint =>
      'وضع إعادة الترتيب: اضغط مطولاً واسحب الزر لتحريكه.';

  @override
  String get manageRemote => 'إدارة جهاز التحكم';

  @override
  String get remoteNoButtons => 'لا توجد أزرار في جهاز التحكم هذا';

  @override
  String get remoteNoButtonsDescription =>
      'استخدم تعديل جهاز التحكم لإضافة الأزرار أو ضبطها.';

  @override
  String get editRemote => 'تعديل جهاز التحكم';

  @override
  String get editRemoteActionsSubtitle =>
      'إعادة التسمية وإعادة الترتيب وتعديل الأزرار';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'تم تحديث \"$name\".';
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
  String get editButtonSubtitle => 'تعديل التسمية والكود والبروتوكول والتردد';

  @override
  String get newButton => 'زر جديد';

  @override
  String get newButtonSubtitle => 'أنشئ زراً جديداً بعد هذا الزر';

  @override
  String get duplicate => 'Duplicate';

  @override
  String get duplicateButtonSubtitle => 'أنشئ نسخة من هذا الزر';

  @override
  String get removeFromDeviceControls => 'Remove من الجهاز Controls';

  @override
  String get addToDeviceControls => 'إضافة إلى الجهاز Controls';

  @override
  String get deviceControlsButtonSubtitle =>
      'يعرض هذا الزر في عناصر تحكم جهاز النظام';

  @override
  String get removedFromDeviceControls => 'Removed من الجهاز Controls.';

  @override
  String get pinQuickTile => 'Pin إلى Quick Tile favorites';

  @override
  String get unpinQuickTile => 'Unpin من Quick Tile favorites';

  @override
  String get quickTileButtonSubtitle =>
      'يعرض هذا الزر أعلى قائمة اختيار المربعات السريعة';

  @override
  String get removedFromQuickTileFavorites =>
      'Removed من Quick Tile favorites.';

  @override
  String get pinnedToQuickTileFavorites => 'Pinned إلى Quick Tile favorites.';

  @override
  String get duplicateAndEdit => 'نسخ وتعديل';

  @override
  String get duplicateAndEditSubtitle => 'أنشئ نسخة وعدلها فوراً';

  @override
  String get done => 'تم';

  @override
  String get run => 'تشغيل';

  @override
  String get untitledRemote => 'Untitled جهاز التحكم';

  @override
  String get createRemoteTitle => 'إنشاء جهاز تحكم';

  @override
  String get editRemoteTitle => 'تعديل جهاز التحكم';

  @override
  String get removeButtonTitle => 'إزالة الزر؟';

  @override
  String get imageButtonRemovedMessage => 'سيتم حذف زر الصورة هذا.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" will be removed.';
  }

  @override
  String get remove => 'Remove';

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
      'غيّر التسمية والإشارة والإعدادات المتقدمة';

  @override
  String get createButtonCopySubtitle => 'أنشئ نسخة من هذا الزر';

  @override
  String get duplicateAndEditButtonSubtitle => 'أنشئ نسخة وعدلها فوراً';

  @override
  String get undoAvailableInNextSnackbar => 'يمكنك التراجع من الشريط التالي';

  @override
  String get buttonRemoved => 'زر removed.';

  @override
  String get remoteNameCannotBeEmpty => 'جهاز التحكم name can\'t be empty.';

  @override
  String get saveRemote => 'حفظ جهاز التحكم';

  @override
  String get remoteName => 'جهاز التحكم name';

  @override
  String get remoteNameHint => 'e.g., TV, Air Conditioner, LED Strip';

  @override
  String get remoteNameHelper => 'سيظهر هذا الاسم في قائمة أجهزة التحكم لديك.';

  @override
  String get layoutStyle => 'Layout style';

  @override
  String get layoutWideDescription =>
      'عريض: أزرار بعمودين مع تفاصيل إضافية، موصى به.';

  @override
  String get layoutCompactDescription =>
      'Compact: classic 4× grid (icons/text only).';

  @override
  String get importFromRemotes => 'استيراد من remotes';

  @override
  String get importFromDatabase => 'استيراد من DB';

  @override
  String get addButton => 'إضافة زر';

  @override
  String get noButtonsYet => 'No أزرار yet';

  @override
  String get createRemoteEmptyStateDescription =>
      'أضف أول زر، ثم اضغطه مطولاً لخيارات التعديل أو الإزالة.';

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
  String get buttonLabelStepTitle => '1) زر label';

  @override
  String get buttonLabelStepSubtitle =>
      'اختر an image, icon, or type a text label.';

  @override
  String get buttonColorStepTitle => '2) زر color (optional)';

  @override
  String get buttonColorStepSubtitle => 'اختر لون خلفية لهذا الزر.';

  @override
  String get selectColor => 'اختر color:';

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
  String get defaultColorName => 'Default';

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
  String get searchCommands => 'ابحث commands';

  @override
  String get noMatchingCommands => 'No matching commands';

  @override
  String get quickTileFavoritesTitle => 'Quick tile favorites';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Change mapping for $tileLabel tile';
  }

  @override
  String get pickDifferentButton => 'اختر زراً آخر';

  @override
  String get browseAllRemotesEllipsis => 'Browse all remotes…';

  @override
  String get invalidMacroFileFormat => 'تنسيق ملف الماكرو غير صالح.';

  @override
  String get failedToParseMacroFile => 'فشل تحليل ملف الماكرو.';

  @override
  String get deviceCodeLabel => 'الجهاز Code';

  @override
  String get commandLabel => 'Command';

  @override
  String get editButtonCodeTitle => 'تعديل كود الزر';

  @override
  String get thisRemoteHasNoButtons => 'هذا الجهاز لا يحتوي على أزرار.';

  @override
  String get selectCommand => 'اختر Command';

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
      'اختر جهازاً، حمّل المفاتيح المطابقة، ثم استورد الأزرار المحددة.';

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
    return 'أزرار ($count)';
  }

  @override
  String get invalidStepEncountered => 'تم العثور على خطوة غير صالحة';

  @override
  String failedToSendNamed(Object name) {
    return 'فشل إلى send: $name';
  }

  @override
  String get buttonNotFound => 'زر not موجود';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'زر not موجود: $name';
  }

  @override
  String get unknownButton => 'غير معروف زر';

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
      'Orientation: flipped (tap إلى normal)';

  @override
  String get orientationNormalTooltip => 'Orientation: normal (tap إلى flip)';

  @override
  String get noSteps => 'لا توجد خطوات';

  @override
  String stepProgress(int current, int total) {
    return 'خطوة $current / $total';
  }

  @override
  String get completed => 'Completed';

  @override
  String get paused => 'Paused';

  @override
  String get running => 'Running';

  @override
  String get ready => 'جاهز';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total خطوات';
  }

  @override
  String get waiting => 'Waiting';

  @override
  String secondsRemaining(Object seconds) {
    return 'يتبقى ${seconds}s';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'اضغط متابعة عندما تصبح جاهزاً للخطوة التالية';

  @override
  String get error => 'خطأ';

  @override
  String get macroCompleted => 'اكتمل الماكرو';

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
  String get runAgain => 'تشغيل Again';

  @override
  String get startMacro => 'بدء الماكرو';

  @override
  String get continueAction => 'متابعة';

  @override
  String get unnamedRemote => 'Unnamed جهاز التحكم';

  @override
  String get enterMacroName => 'أدخل اسم الماكرو';

  @override
  String get addAtLeastOneStep => 'أضف خطوة واحدة على الأقل';

  @override
  String get fixInvalidSteps => 'أصلح الخطوات غير الصالحة';

  @override
  String get unknownCommand => 'غير معروف Command';

  @override
  String get unnamedCommand => 'Unnamed Command';

  @override
  String get iconCommand => 'Icon Command';

  @override
  String get selectDelay => 'اختر تأخير';

  @override
  String keepMilliseconds(int ms) {
    return 'Keep: ${ms}ms';
  }

  @override
  String get custom => 'مخصص';

  @override
  String get enterCustomDelayDuration => 'Enter a custom delay duration';

  @override
  String millisecondsLong(int ms) {
    return '$ms milliseconds';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds ثانية$plural';
  }

  @override
  String get customDelay => 'Custom تأخير';

  @override
  String get delayMillisecondsLabel => 'تأخير (milliseconds)';

  @override
  String get delayMillisecondsHint => 'e.g., 3000';

  @override
  String get recommendedDelayRange => 'Recommended: 250-5000ms for most أجهزة';

  @override
  String get enterValidPositiveNumber => 'Please enter a valid positive number';

  @override
  String get ok => 'موافق';

  @override
  String get remote => 'جهاز التحكم';

  @override
  String get macroName => 'اسم الماكرو';

  @override
  String get macroNameHint => 'مثال، وضع i-cybie المتقدم';

  @override
  String stepsTitleCount(int count) {
    return 'خطوات ($count)';
  }

  @override
  String get noStepsYet => 'لا توجد خطوات بعد';

  @override
  String get addCommandsAndDelaysHint =>
      'أضف الأوامر وفترات التأخير أدناه لبناء التسلسل';

  @override
  String get addStep => 'إضافة خطوة';

  @override
  String get reorderStepsHint =>
      'ملاحظة: اسحب المقبض لإعادة ترتيب الخطوات. اضغط على خطوة لتعديلها.';

  @override
  String reorderStep(int index) {
    return 'إعادة ترتيب الخطوة $index';
  }

  @override
  String get pressAndDragToChangeStepOrder => 'اضغط واسحب لتغيير ترتيب الخطوات';

  @override
  String deleteStep(int index) {
    return 'حذف الخطوة $index';
  }

  @override
  String get invalidStepTapToFix => 'خطوة غير صالحة، اضغط لإصلاحها';

  @override
  String get sendIrCommand => 'إرسال IR command';

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
  String get learningModeCaptureFailed => 'فشل التقاط التعلم.';

  @override
  String get learningModeReplaySent => 'تم إعادة تشغيل الإشارة المستفادة.';

  @override
  String get learningModeReplayFailed =>
      'لا يمكن إعادة تشغيل الإشارة التي تم تعلمها.';

  @override
  String get learningModeNoRemotesAvailable =>
      'لا توجد أجهزة التحكم عن بعد المحفوظة حتى الآن.';

  @override
  String get learningModeChooseRemoteTitle => 'اختر جهاز التحكم عن بعد';

  @override
  String get learningModeNewRemoteTitle => 'إنشاء جهاز تحكم عن بعد جديد';

  @override
  String get learningModeSaveSuccess => 'تم حفظ الزر الذي تم تعلمه.';

  @override
  String get learningModeSaveFailed => 'لا يمكن حفظ الزر الذي تم التعرف عليه.';
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
      'هذا الهاتف لا يحتوي على مرسل IR مدمج. تم اكتشاف دونجل IR عبر USB، لكن لم يتم منح الإذن بعد.\n\nوافق على طلب إذن USB لتفعيل الإرسال عبر IR.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'هذا الهاتف لا يحتوي على مرسل IR مدمج. تم اكتشاف دونجل IR عبر USB، لكن تم رفض إذن USB.\n\nاطلب الإذن مرة أخرى ووافق على الرسالة لتفعيل الإرسال عبر IR.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'هذا الهاتف لا يحتوي على مرسل IR مدمج. تم السماح لدونجل IR عبر USB، لكنه لم يتهيأ بعد.';

  @override
  String get homeUsbOpenFailedMessage =>
      'هذا الهاتف لا يحتوي على مرسل IR مدمج. تم اكتشاف دونجل IR عبر USB والسماح له، لكن تعذر تهيئته.\n\nأعد توصيل الدونجل وحاول مرة أخرى.';

  @override
  String get homeUsbReadyMessage => 'هذا الهاتف لا يحتوي على مرسل IR مدمج.';

  @override
  String get homeUsbNoDeviceMessage =>
      'هذا الهاتف لا يحتوي على مرسل IR مدمج، ولا يوجد حالياً دونجل IR عبر USB مدعوم متصل.\n\nما زال بإمكانك إنشاء أجهزة التحكم واستيرادها وإدارتها، لكن لإرسال إشارات IR تحتاج إلى أحد الخيارات أدناه.';

  @override
  String get homeUsbOptionPlugIn =>
      'وصّل دونجل IR عبر USB مدعوماً، ثم وافق على الإذن.';

  @override
  String get homeUsbOptionReady => 'جاهز للاستخدام.';

  @override
  String get homeUsbOptionPermissionRequired => 'موصول. الإذن مطلوب.';

  @override
  String get homeUsbOptionPermissionDenied => 'تم رفض الإذن. اطلبه مرة أخرى.';

  @override
  String get homeUsbOptionPermissionGranted => 'تم السماح. جار تهيئة الدونجل.';

  @override
  String get homeUsbOptionOpenFailed => 'تم السماح، لكن فشلت التهيئة.';

  @override
  String get homeHardwareBannerNoInternal =>
      'هذا الهاتف لا يحتوي على IR مدمج. وصّل دونجل IR عبر USB أو فعّل وضع الصوت من الإعدادات.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'تم اكتشاف دونجل USB. الإذن مطلوب لإرسال IR.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'تم رفض إذن USB. اطلبه مرة أخرى لإرسال IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'تم السماح لدونجل USB. في انتظار التهيئة.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'USB دونجل authorized, but تهيئة فشل.';

  @override
  String get homeHardwareBannerReady => 'USB جاهز.';

  @override
  String get homeHardwareRequiredTitle => 'IR hardware مطلوب إلى send commands';

  @override
  String get homeUsbDongleRecommended => 'دونجل IR عبر USB، موصى به';

  @override
  String get homeAudioAdapterAlternative => 'صوت IR adapter (alternative)';

  @override
  String get homeAudioAdapterDescription =>
      'الإعدادات → مرسل IR → الصوت 1 LED أو 2 LED. يتطلب محول صوت إلى IR.';

  @override
  String get close => 'إغلاق';

  @override
  String get homeChooseTransmitter => 'اختر a transmitter';

  @override
  String get openSettings => 'فتح الإعدادات';

  @override
  String get homeUsbPermissionSentApprove =>
      'تم إرسال طلب إذن USB. وافق على الرسالة لتفعيل USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'لم يتم اكتشاف دونجل IR عبر USB مدعوم. وصّله ثم حاول مرة أخرى.';

  @override
  String get homeUsbPermissionRequestFailed => 'فشل طلب إذن USB.';

  @override
  String get working => 'Working…';

  @override
  String get requestUsbPermission => 'طلب إذن USB';

  @override
  String get homeHardwareTip =>
      'ملاحظة: ما زال بإمكانك إنشاء أجهزة التحكم وتنظيمها الآن. يلزم العتاد فقط عند الإرسال.';

  @override
  String get homeNoIrTransmitterTitle => 'No IR transmitter available';

  @override
  String get settingsNavLabel => 'الإعدادات';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get remotesNavLabel => 'أجهزة التحكم';

  @override
  String get macrosNavLabel => 'الماكرو';

  @override
  String get signalTesterNavLabel => 'مختبر الإشارة';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get remoteNoIrEmitterTitle => 'No IR emitter';

  @override
  String get remoteNoIrEmitterMessage => 'هذا الجهاز لا يحتوي على مرسل IR.';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'This app needs an IR emitter إلى function';

  @override
  String get remoteDismiss => 'Dismiss';

  @override
  String get remoteClose => 'إغلاق';

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
    return 'حذف فشل: $error';
  }

  @override
  String get remoteNotFoundSavedList => 'جهاز التحكم not موجود in saved list.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'تم حذف \"$name\".';
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
  String get learningModeEntryTitle => 'وضع التعلم';

  @override
  String get learningModeEntrySubtitle =>
      'التقط زرًا من جهاز التحكم عن بعد الفعلي خطوة بخطوة';

  @override
  String get learningModeTitle => 'وضع التعلم';

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
      'التحقق من حالة جهاز الإرسال وجهاز استقبال USB المتاحين.';

  @override
  String get learningModeHardwareReadyBody =>
      'يتم توصيل دونجل USB IR وتهيئته. هذا هو المكان المناسب لبدء تدفق التعلم بمجرد توصيل أسلاك الالتقاط.';

  @override
  String get learningModeHardwarePermissionBody =>
      'يوجد دونجل USB، لكن إذن Android لا يزال يمنعه. امنح إذن USB في قسم جهاز الإرسال قبل التعلم.';

  @override
  String get learningModeHardwareSetupBody =>
      'تم اكتشاف جهاز دونجل جزئيًا، لكنه لا يزال بحاجة إلى الإعداد أو إعادة الاتصال قبل أن يبدأ التعلم بشكل موثوق.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'لا يتوفر حاليًا أي جهاز استقبال متوافق. وضع التعلم مخصص لأجهزة الدونجل الخارجية المدعومة ذات القدرة على الاستقبال.';

  @override
  String get learningModeRefreshHardware => 'تحديث حالة الأجهزة';

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
  String get learningModeButtonNameHint =>
      'على سبيل المثال: HDMI 1، الطاقة، القائمة';

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
  String get learningModeStartListening => 'ابدأ بالاستماع';

  @override
  String get learningModeCaptureStubTitle => 'التقاط الخلفية يأتي بعد ذلك';

  @override
  String get learningModeCaptureStubBody =>
      'يتم دعم هذه الشاشة بالكامل أولاً حتى يمكن توصيل تدفق الالتقاط النهائي بحالات الأجهزة الحقيقية بدلاً من تثبيته لاحقًا.';

  @override
  String get learningModeCaptureStubMessage =>
      'التقاط التعلم ليس سلكيًا بعد. تعمل هذه الشاشة على دعم التدفق الكامل أولاً.';

  @override
  String get learningModeUnnamedCapture => 'التقاط بدون اسم';

  @override
  String get learningModeStatusCheckingTitle => 'فحص المتلقي';

  @override
  String get learningModeStatusNoReceiverTitle => 'المتلقي غير جاهز';

  @override
  String get learningModeStatusPermissionTitle => 'مطلوب إذن USB';

  @override
  String get learningModeStatusSetupTitle => 'يحتاج المتلقي إلى الإعداد';

  @override
  String get learningModeStatusReadyTitle => 'جاهز للتعلم';

  @override
  String get learningModeStatusListeningTitle => 'الاستماع للإشارة';

  @override
  String get learningModeStatusCapturedTitle => 'تم التقاط الإشارة';

  @override
  String get learningModeStatusReadyBody =>
      'قم بتسمية الزر، وقم بتوجيه جهاز التحكم عن بعد الأصلي نحو جهاز الاستقبال، وابدأ في الاستماع عندما تكون جاهزًا.';

  @override
  String get learningModeStatusListeningBody =>
      'اضغط على الزر البعيد الأصلي الآن. بمجرد توصيل الالتقاط، سيتم تثبيت هذه الحالة على الإشارة النظيفة التالية.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'معاينة الإشارة المكتسبة جاهزة لـ $buttonName. أعد تشغيله، وتأكد من أنه يعمل، ثم احفظه في مكتبتك.';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'قم بتوصيل دونجل تعليمي متوافق';

  @override
  String get learningModeConnectReceiverBody =>
      'يعتمد وضع التعلم على الأجهزة الخارجية التي يمكنها استقبال الأشعة تحت الحمراء. بمجرد اكتشاف جهاز الاستقبال والترخيص له، تصبح هذه الصفحة بمثابة تدفق مباشر للاستماع والاختبار والحفظ.';

  @override
  String get learningModeListenCardTitle => 'استمع لزر واحد';

  @override
  String get learningModeListenCardBody =>
      'قم بتعيين الملصق أولاً إذا كنت تريد ذلك، ثم ابدأ الاستماع واضغط على الزر الموجود على جهاز التحكم عن بعد الأصلي.';

  @override
  String get learningModeReadyToListenTitle => 'جاهز للاستماع';

  @override
  String get learningModeReadyToListenBody =>
      'هذا هو سطح الالتقاط الرئيسي. ابدأ الاستماع فقط عندما يكون جهاز التحكم عن بعد الأصلي موجهًا وثابتًا.';

  @override
  String get learningModeListeningNowTitle => 'الاستماع الآن';

  @override
  String get learningModeListeningNowBody =>
      'اضغط على زر التحكم عن بعد الأصلي مرة واحدة. استخدم التقاط المعاينة للتنقل عبر بقية السقالة قبل أن يتم توصيل واجهة الالتقاط الخلفية الحقيقية.';

  @override
  String get learningModePreviewCaptureAction => 'معاينة الإشارة الملتقطة';

  @override
  String get learningModeCapturedSummary => 'معاينة الإشارة المستفادة';

  @override
  String get learningModeResultActionsTitle => 'اختبار وحفظ';

  @override
  String get learningModeResultActionsBody =>
      'أعد تشغيل الإشارة التي تم تعلمها، وتأكد من استجابة الجهاز المستهدف، ثم احفظها كزر قابل لإعادة الاستخدام.';

  @override
  String get learningModeReplayAction => 'إعادة التشغيل';

  @override
  String get learningModeReplayStubMessage =>
      'إعادة التشغيل ليست سلكية بعد. هذه هي دعامة واجهة المستخدم لتدفق التعلم والاختبار والحفظ النهائي.';

  @override
  String get learningModeSaveStubMessage =>
      'الحفظ ليس سلكيًا بعد. الخطوة التالية هي توصيل هذه الشاشة بـ \"إنشاء زر\" وأجهزة التحكم عن بعد الموجودة.';

  @override
  String get learningModeLearnAnotherAction => 'تعلم زر آخر';

  @override
  String get learningModeStepReviewTitle => 'مراجعة وحفظ';

  @override
  String get learningModeStepReviewSubtitle =>
      'قم بتأكيد ما تعلمته، ثم اختر المكان الذي يجب أن يكون موجودًا فيه في مكتبتك البعيدة.';

  @override
  String get learningModeSaveToExistingRemote => 'البعيد الموجود';

  @override
  String get learningModeCreateNewRemote => 'ريموت جديد';

  @override
  String get learningModeProtocolPreviewTitle => 'معاينة البروتوكول';

  @override
  String get learningModeProtocolPreviewBody =>
      'ستظهر هنا تفاصيل البروتوكول الذي تم فك تشفيره بمجرد أن يلتقط جهاز الاستقبال ضغطة زر نظيفة.';

  @override
  String get learningModeRawPreviewTitle => 'احتياطي الخام';

  @override
  String get learningModeRawPreviewBody =>
      'إذا لم يكتمل فك التشفير، فسيظل التقاط التوقيت الأولي متاحًا هنا للمراجعة والحفظ.';

  @override
  String get learningModeSaveCapture => 'حفظ الالتقاط';

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
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'Intensity';

  @override
  String get intensityLight => 'فاتح';

  @override
  String get intensityMedium => 'Medium';

  @override
  String get intensityStrong => 'Strong';

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
  String get manageFavorites => 'Manage favorites';

  @override
  String get manageFavoritesSubtitle =>
      'اختر الأزرار التي تظهر في عناصر تحكم الجهاز';

  @override
  String get quickSettingsTitle => 'Quick الإعدادات';

  @override
  String get quickSettingsSubtitle => 'أضف مربعات لاختصارات الطاقة والصوت';

  @override
  String get configureTiles => 'Configure tiles';

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
  String get unnamedButton => 'زر بدون اسم';

  @override
  String get iconFallback => 'أيقونة';

  @override
  String get remoteListReorderHint =>
      'وضع إعادة الترتيب: اضغط مطولاً واسحب البطاقة لتحريكها.';

  @override
  String get deleteRemoteTitle => 'حذف جهاز التحكم؟';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" will be permanently removed. This action can\'t be undone.';
  }

  @override
  String get delete => 'حذف';

  @override
  String get addToDeviceControlsTitle => 'إضافة إلى الجهاز Controls?';

  @override
  String get addToDeviceControlsDescription =>
      'وصول سريع في عناصر تحكم جهاز النظام.';

  @override
  String get skip => 'تخطي';

  @override
  String get add => 'إضافة';

  @override
  String get addedToDeviceControls => 'Added إلى الجهاز Controls.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Deleted \"$name\". This action can\'t be undone.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count زر · $layout';
  }

  @override
  String get layoutComfort => 'Comfort';

  @override
  String get layoutCompact => 'Compact';

  @override
  String get open => 'فتح';

  @override
  String get useThisRemote => 'استخدم جهاز التحكم هذا';

  @override
  String get edit => 'تعديل';

  @override
  String get editRemoteSubtitle => 'إعادة التسمية وتعديل الأزرار';

  @override
  String get thisCannotBeUndone => 'This cannot be undone';

  @override
  String get searchRemotes => 'ابحث أجهزة التحكم';

  @override
  String get reorderRemotes => 'Reorder remotes';

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
      other: '$count buttons',
      one: '$count button',
    );
    return '$_temp0';
  }

  @override
  String get noRemotesYet => 'No remotes yet';

  @override
  String get noRemotesDescription => 'أنشئ جهاز تحكم لبدء إرسال أكواد IR.';

  @override
  String get noRemotesNextStep =>
      'ماذا بعد: اضغط إضافة جهاز تحكم، ثم أضف أول أزرارك.';

  @override
  String get actions => 'Actions';

  @override
  String get macrosTitle => 'الماكرو';

  @override
  String get help => 'مساعدة';

  @override
  String get createMacro => 'إنشاء ماكرو';

  @override
  String get timedMacrosTitle => 'ماكرو مؤقت';

  @override
  String get timedMacrosSubtitle => 'أتمتة تسلسلات أوامر IR بتوقيت دقيق';

  @override
  String get timedMacrosNextStep =>
      'الخطوة التالية: اضغط إنشاء أول ماكرو، اختر جهاز تحكم، ثم أضف الأوامر وفترات التأخير.';

  @override
  String get macroFeatureToysTitle => 'مثالي للألعاب التفاعلية';

  @override
  String get macroFeatureToysDescription =>
      'تحكم في أجهزة مثل كلاب i-cybie الروبوتية وروبوتات i-sobot وغيرها من الألعاب التي تحتاج وقتاً بين الأوامر لمعالجة الإجراءات.';

  @override
  String get macroFeatureTimingTitle => 'تحكم دقيق بالتوقيت';

  @override
  String get macroFeatureTimingDescription =>
      'أضف تأخيرات بين الأوامر، من 250ms إلى مدد مخصصة، حتى يجد جهازك وقتاً للاستجابة قبل الأمر التالي.';

  @override
  String get macroFeatureManualTitle => 'خطوات متابعة يدوية';

  @override
  String get macroFeatureManualDescription =>
      'أوقف التنفيذ وانتظر تأكيدك عندما تختلف مدة الحركة أو عندما تحتاج إلى ملاحظة مرئية.';

  @override
  String get exampleUseCase => 'مثال Use Case';

  @override
  String get macroExampleText =>
      'وضع i-cybie المتقدم:\n1. أرسل أمر الوضع\n2. انتظر 1000ms، اللعبة تعالج\n3. أرسل الإجراء 1\n4. انتظر 1000ms\n5. أرسل الإجراء 2\n…وهكذا تلقائياً';

  @override
  String get createFirstMacro => 'أنشئ أول ماكرو';

  @override
  String get noRemote => 'لا يوجد جهاز تحكم';

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
  String get aboutTimedMacros => 'حول الماكرو المؤقت';

  @override
  String get aboutTimedMacrosDescription =>
      'تتيح لك وحدات الماكرو المؤقتة أتمتة تسلسلات أوامر IR مع تأخيرات دقيقة بين كل خطوة.';

  @override
  String get sendCommand => 'إرسال Command';

  @override
  String get sendCommandDescription => 'يرسل أمر IR من جهاز التحكم الخاص بك.';

  @override
  String get delay => 'تأخير';

  @override
  String get delayDescription =>
      'ينتظر مدة محددة، مثل 1000ms، قبل الخطوة التالية.';

  @override
  String get manualContinue => 'يدوي متابعة';

  @override
  String get manualContinueDescription =>
      'يوقف التنفيذ حتى تضغط متابعة، مفيد للحركات ذات الطول المتغير.';

  @override
  String get gotIt => 'فهمت';

  @override
  String get failedToSaveMacros => 'فشل حفظ الماكرو.';

  @override
  String deletedMacroNamed(Object name) {
    return 'تم حذف \"$name\".';
  }

  @override
  String get undo => 'Undo';

  @override
  String get failedToRestoreMacro => 'فشل استعادة الماكرو.';

  @override
  String get deleteMacroTitle => 'حذف الماكرو؟';

  @override
  String get deleteMacroMessage => 'يمكنك التراجع عن ذلك من الشريط التالي.';

  @override
  String get noRemotesAvailable => 'No remotes available.';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count زر';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Orientation: flipped (tap إلى normal)';

  @override
  String get remoteOrientationNormalTooltip =>
      'Orientation: normal (tap إلى flip)';

  @override
  String get stopLoop => 'إيقاف loop';

  @override
  String get reorderButtons => 'Reorder أزرار';

  @override
  String get remoteReorderHint =>
      'وضع إعادة الترتيب: اضغط مطولاً واسحب الزر لتحريكه.';

  @override
  String get manageRemote => 'إدارة جهاز التحكم';

  @override
  String get remoteNoButtons => 'لا توجد أزرار في جهاز التحكم هذا';

  @override
  String get remoteNoButtonsDescription =>
      'استخدم تعديل جهاز التحكم لإضافة الأزرار أو ضبطها.';

  @override
  String get editRemote => 'تعديل جهاز التحكم';

  @override
  String get editRemoteActionsSubtitle =>
      'إعادة التسمية وإعادة الترتيب وتعديل الأزرار';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'تم تحديث \"$name\".';
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
  String get editButtonSubtitle => 'تعديل التسمية والكود والبروتوكول والتردد';

  @override
  String get newButton => 'زر جديد';

  @override
  String get newButtonSubtitle => 'أنشئ زراً جديداً بعد هذا الزر';

  @override
  String get duplicate => 'Duplicate';

  @override
  String get duplicateButtonSubtitle => 'أنشئ نسخة من هذا الزر';

  @override
  String get removeFromDeviceControls => 'Remove من الجهاز Controls';

  @override
  String get addToDeviceControls => 'إضافة إلى الجهاز Controls';

  @override
  String get deviceControlsButtonSubtitle =>
      'يعرض هذا الزر في عناصر تحكم جهاز النظام';

  @override
  String get removedFromDeviceControls => 'Removed من الجهاز Controls.';

  @override
  String get pinQuickTile => 'Pin إلى Quick Tile favorites';

  @override
  String get unpinQuickTile => 'Unpin من Quick Tile favorites';

  @override
  String get quickTileButtonSubtitle =>
      'يعرض هذا الزر أعلى قائمة اختيار المربعات السريعة';

  @override
  String get removedFromQuickTileFavorites =>
      'Removed من Quick Tile favorites.';

  @override
  String get pinnedToQuickTileFavorites => 'Pinned إلى Quick Tile favorites.';

  @override
  String get duplicateAndEdit => 'نسخ وتعديل';

  @override
  String get duplicateAndEditSubtitle => 'أنشئ نسخة وعدلها فوراً';

  @override
  String get done => 'تم';

  @override
  String get run => 'تشغيل';

  @override
  String get untitledRemote => 'Untitled جهاز التحكم';

  @override
  String get createRemoteTitle => 'إنشاء جهاز تحكم';

  @override
  String get editRemoteTitle => 'تعديل جهاز التحكم';

  @override
  String get removeButtonTitle => 'إزالة الزر؟';

  @override
  String get imageButtonRemovedMessage => 'سيتم حذف زر الصورة هذا.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" will be removed.';
  }

  @override
  String get remove => 'Remove';

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
      'غيّر التسمية والإشارة والإعدادات المتقدمة';

  @override
  String get createButtonCopySubtitle => 'أنشئ نسخة من هذا الزر';

  @override
  String get duplicateAndEditButtonSubtitle => 'أنشئ نسخة وعدلها فوراً';

  @override
  String get undoAvailableInNextSnackbar => 'يمكنك التراجع من الشريط التالي';

  @override
  String get buttonRemoved => 'زر removed.';

  @override
  String get remoteNameCannotBeEmpty => 'جهاز التحكم name can\'t be empty.';

  @override
  String get saveRemote => 'حفظ جهاز التحكم';

  @override
  String get remoteName => 'جهاز التحكم name';

  @override
  String get remoteNameHint => 'e.g., TV, Air Conditioner, LED Strip';

  @override
  String get remoteNameHelper => 'سيظهر هذا الاسم في قائمة أجهزة التحكم لديك.';

  @override
  String get layoutStyle => 'Layout style';

  @override
  String get layoutWideDescription =>
      'عريض: أزرار بعمودين مع تفاصيل إضافية، موصى به.';

  @override
  String get layoutCompactDescription =>
      'Compact: classic 4× grid (icons/text only).';

  @override
  String get importFromRemotes => 'استيراد من remotes';

  @override
  String get importFromDatabase => 'استيراد من DB';

  @override
  String get addButton => 'إضافة زر';

  @override
  String get noButtonsYet => 'No أزرار yet';

  @override
  String get createRemoteEmptyStateDescription =>
      'أضف أول زر، ثم اضغطه مطولاً لخيارات التعديل أو الإزالة.';

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
  String get buttonLabelStepTitle => '1) زر label';

  @override
  String get buttonLabelStepSubtitle =>
      'اختر an image, icon, or type a text label.';

  @override
  String get buttonColorStepTitle => '2) زر color (optional)';

  @override
  String get buttonColorStepSubtitle => 'اختر لون خلفية لهذا الزر.';

  @override
  String get selectColor => 'اختر color:';

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
  String get defaultColorName => 'Default';

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
  String get searchCommands => 'ابحث commands';

  @override
  String get noMatchingCommands => 'No matching commands';

  @override
  String get quickTileFavoritesTitle => 'Quick tile favorites';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Change mapping for $tileLabel tile';
  }

  @override
  String get pickDifferentButton => 'اختر زراً آخر';

  @override
  String get browseAllRemotesEllipsis => 'Browse all remotes…';

  @override
  String get invalidMacroFileFormat => 'تنسيق ملف الماكرو غير صالح.';

  @override
  String get failedToParseMacroFile => 'فشل تحليل ملف الماكرو.';

  @override
  String get deviceCodeLabel => 'الجهاز Code';

  @override
  String get commandLabel => 'Command';

  @override
  String get editButtonCodeTitle => 'تعديل كود الزر';

  @override
  String get thisRemoteHasNoButtons => 'هذا الجهاز لا يحتوي على أزرار.';

  @override
  String get selectCommand => 'اختر Command';

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
      'اختر جهازاً، حمّل المفاتيح المطابقة، ثم استورد الأزرار المحددة.';

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
    return 'أزرار ($count)';
  }

  @override
  String get invalidStepEncountered => 'تم العثور على خطوة غير صالحة';

  @override
  String failedToSendNamed(Object name) {
    return 'فشل إلى send: $name';
  }

  @override
  String get buttonNotFound => 'زر not موجود';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'زر not موجود: $name';
  }

  @override
  String get unknownButton => 'غير معروف زر';

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
      'Orientation: flipped (tap إلى normal)';

  @override
  String get orientationNormalTooltip => 'Orientation: normal (tap إلى flip)';

  @override
  String get noSteps => 'لا توجد خطوات';

  @override
  String stepProgress(int current, int total) {
    return 'خطوة $current / $total';
  }

  @override
  String get completed => 'Completed';

  @override
  String get paused => 'Paused';

  @override
  String get running => 'Running';

  @override
  String get ready => 'جاهز';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total خطوات';
  }

  @override
  String get waiting => 'Waiting';

  @override
  String secondsRemaining(Object seconds) {
    return 'يتبقى ${seconds}s';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'اضغط متابعة عندما تصبح جاهزاً للخطوة التالية';

  @override
  String get error => 'خطأ';

  @override
  String get macroCompleted => 'اكتمل الماكرو';

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
  String get runAgain => 'تشغيل Again';

  @override
  String get startMacro => 'بدء الماكرو';

  @override
  String get continueAction => 'متابعة';

  @override
  String get unnamedRemote => 'Unnamed جهاز التحكم';

  @override
  String get enterMacroName => 'أدخل اسم الماكرو';

  @override
  String get addAtLeastOneStep => 'أضف خطوة واحدة على الأقل';

  @override
  String get fixInvalidSteps => 'أصلح الخطوات غير الصالحة';

  @override
  String get unknownCommand => 'غير معروف Command';

  @override
  String get unnamedCommand => 'Unnamed Command';

  @override
  String get iconCommand => 'Icon Command';

  @override
  String get selectDelay => 'اختر تأخير';

  @override
  String keepMilliseconds(int ms) {
    return 'Keep: ${ms}ms';
  }

  @override
  String get custom => 'مخصص';

  @override
  String get enterCustomDelayDuration => 'Enter a custom delay duration';

  @override
  String millisecondsLong(int ms) {
    return '$ms milliseconds';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds ثانية$plural';
  }

  @override
  String get customDelay => 'Custom تأخير';

  @override
  String get delayMillisecondsLabel => 'تأخير (milliseconds)';

  @override
  String get delayMillisecondsHint => 'e.g., 3000';

  @override
  String get recommendedDelayRange => 'Recommended: 250-5000ms for most أجهزة';

  @override
  String get enterValidPositiveNumber => 'Please enter a valid positive number';

  @override
  String get ok => 'موافق';

  @override
  String get remote => 'جهاز التحكم';

  @override
  String get macroName => 'اسم الماكرو';

  @override
  String get macroNameHint => 'مثال، وضع i-cybie المتقدم';

  @override
  String stepsTitleCount(int count) {
    return 'خطوات ($count)';
  }

  @override
  String get noStepsYet => 'لا توجد خطوات بعد';

  @override
  String get addCommandsAndDelaysHint =>
      'أضف الأوامر وفترات التأخير أدناه لبناء التسلسل';

  @override
  String get addStep => 'إضافة خطوة';

  @override
  String get reorderStepsHint =>
      'ملاحظة: اسحب المقبض لإعادة ترتيب الخطوات. اضغط على خطوة لتعديلها.';

  @override
  String reorderStep(int index) {
    return 'إعادة ترتيب الخطوة $index';
  }

  @override
  String get pressAndDragToChangeStepOrder => 'اضغط واسحب لتغيير ترتيب الخطوات';

  @override
  String deleteStep(int index) {
    return 'حذف الخطوة $index';
  }

  @override
  String get invalidStepTapToFix => 'خطوة غير صالحة، اضغط لإصلاحها';

  @override
  String get sendIrCommand => 'إرسال IR command';

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
  String get learningModeCaptureFailed => 'فشل التقاط التعلم.';

  @override
  String get learningModeReplaySent => 'تم إعادة تشغيل الإشارة المستفادة.';

  @override
  String get learningModeReplayFailed =>
      'لا يمكن إعادة تشغيل الإشارة التي تم تعلمها.';

  @override
  String get learningModeNoRemotesAvailable =>
      'لا توجد أجهزة التحكم عن بعد المحفوظة حتى الآن.';

  @override
  String get learningModeChooseRemoteTitle => 'اختر جهاز التحكم عن بعد';

  @override
  String get learningModeNewRemoteTitle => 'إنشاء جهاز تحكم عن بعد جديد';

  @override
  String get learningModeSaveSuccess => 'تم حفظ الزر الذي تم تعلمه.';

  @override
  String get learningModeSaveFailed => 'لا يمكن حفظ الزر الذي تم التعرف عليه.';
}
