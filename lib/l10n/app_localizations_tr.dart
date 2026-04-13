// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Yükleniyor…';

  @override
  String get unknownError => 'Bilinmeyen hata';

  @override
  String get failedToStart => 'Başlatılamadı';

  @override
  String get retry => 'Yeniden dene';

  @override
  String get quickTilePower => 'Güç';

  @override
  String get quickTileMute => 'Sessiz';

  @override
  String get quickTileVolumeUp => 'Ses +';

  @override
  String get quickTileVolumeDown => 'Ses -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Bu telefonda dahili IR verici yok. Bir USB IR dongle algılandı, ancak izin henüz verilmedi.\n\nIR göndermeyi etkinleştirmek için USB izin istemini onaylayın.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'Bu telefonda dahili IR verici yok. Bir USB IR dongle algılandı, ancak USB izni reddedildi.\n\nİzni yeniden isteyin ve IR göndermeyi etkinleştirmek için istemi onaylayın.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'Bu telefonda dahili IR verici yok. USB IR dongle yetkilendirildi, ancak henüz başlatılmadı.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Bu telefonda dahili IR verici yok. USB IR dongle algılandı ve yetkilendirildi, ancak başlatılamadı.\n\nDongle\'ı yeniden takıp tekrar deneyin.';

  @override
  String get homeUsbReadyMessage => 'Bu telefonda dahili IR verici yok.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Bu telefonda dahili IR verici yok ve şu anda desteklenen bir USB IR dongle bağlı değil.\n\nYine de kumandalar oluşturabilir, içe aktarabilir ve yönetebilirsiniz — ancak IR sinyali göndermek için aşağıdaki seçeneklerden birine ihtiyacınız var.';

  @override
  String get homeUsbOptionPlugIn =>
      'Desteklenen bir USB IR dongle takın, sonra izni onaylayın.';

  @override
  String get homeUsbOptionReady => 'Kullanıma hazır.';

  @override
  String get homeUsbOptionPermissionRequired => 'Takılı. İzin gerekli.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'İzin reddedildi. Yeniden isteyin.';

  @override
  String get homeUsbOptionPermissionGranted => 'Yetkili. Dongle başlatılıyor.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Yetkili, ancak başlatma başarısız oldu.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Bu telefonda dahili IR yok. Bir USB IR dongle bağlayın veya Ayarlar\'da Ses modunu etkinleştirin.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'USB dongle algılandı. IR göndermek için izin gerekli.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'USB izni reddedildi. IR göndermek için yeniden isteyin.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'USB dongle yetkilendirildi. Başlatma bekleniyor.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'USB dongle yetkilendirildi, ancak başlatma başarısız oldu.';

  @override
  String get homeHardwareBannerReady => 'USB hazır.';

  @override
  String get homeHardwareRequiredTitle =>
      'Komut göndermek için IR donanımı gerekli';

  @override
  String get homeUsbDongleRecommended => 'USB IR dongle (önerilen)';

  @override
  String get homeAudioAdapterAlternative => 'Ses IR adaptörü (alternatif)';

  @override
  String get homeAudioAdapterDescription =>
      'Ayarlar → IR Verici → Ses (1 LED / 2 LED). Ses-IR adaptörü gerekir.';

  @override
  String get close => 'Kapat';

  @override
  String get homeChooseTransmitter => 'Bir verici seçin';

  @override
  String get openSettings => 'Ayarları Aç';

  @override
  String get homeUsbPermissionSentApprove =>
      'USB izin isteği gönderildi. USB\'yi etkinleştirmek için istemi onaylayın.';

  @override
  String get homeUsbDongleNotDetected =>
      'Desteklenen USB IR dongle algılanmadı. Takıp yeniden deneyin.';

  @override
  String get homeUsbPermissionRequestFailed => 'USB izni istenemedi.';

  @override
  String get working => 'Çalışıyor…';

  @override
  String get requestUsbPermission => 'USB izni iste';

  @override
  String get homeHardwareTip =>
      'İpucu: Kumandaları şimdi de oluşturup düzenleyebilirsiniz. Donanım yalnızca gönderimde gerekir.';

  @override
  String get homeNoIrTransmitterTitle => 'IR verici yok';

  @override
  String get homeHardwareRequiredBody =>
      'IR Blaster herhangi bir telefonda kumandalar oluşturup yönetebilir. Ancak gerçekten kızılötesi komut göndermek için cihazınızın aşağıdaki donanım seçeneklerinden birine sahip olması gerekir.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Şu anda yine de kumandalar oluşturabilir, içe aktarabilir ve düzenleyebilirsiniz.';

  @override
  String get homeWaysToUseIrBlaster => 'IR Blaster kullanma yolları';

  @override
  String get homeBuiltInIrOptionTitle => 'Dahili IR bulunan telefon';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Dahili IR vericisi olan desteklenen telefonlarda çalışır. Bu telefonda yok.';

  @override
  String get homeBuiltInIrUnavailable => 'Bu telefonda mevcut değil';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => '3,5 mm ses adaptörü';

  @override
  String get homeContinueWithoutHardware => 'Donanım olmadan devam et';

  @override
  String get homeHowItWorks => 'Nasıl çalışır';

  @override
  String get settingsNavLabel => 'Ayarlar';

  @override
  String get dismiss => 'Kapat';

  @override
  String get remotesNavLabel => 'Kumandalar';

  @override
  String get macrosNavLabel => 'Makrolar';

  @override
  String get signalTesterNavLabel => 'Sinyal Testi';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get remoteNoIrEmitterTitle => 'No IR emitter';

  @override
  String get remoteNoIrEmitterMessage => 'Bu cihazda IR verici yok';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Bu uygulamanın çalışması için IR verici gerekir';

  @override
  String get remoteDismiss => 'Kapat';

  @override
  String get remoteClose => 'Kapat';

  @override
  String remoteFailedToSend(Object error) {
    return 'Başarısız to gönder IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Başarısız to başlat döngü: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Döngü stopped (gönder başarısız): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return '\"$title\" döngüde. Durdurmak için üst çubuktaki Durdur\'a dokunun.';
  }

  @override
  String get remoteLoopStopped => 'Döngü stopped.';

  @override
  String get remoteUpdatedNotFound =>
      'Kumanda ekranda güncellendi. Kayıtlı listede bulunamadı.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Güncellendi \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Sil başarısız: $error';
  }

  @override
  String get remoteNotFoundSavedList => 'Kumanda kayıtlı listede bulunamadı.';

  @override
  String remoteDeletedNamed(Object name) {
    return '\"$name\" silindi.';
  }

  @override
  String get buttonFallbackTitle => 'Düğme';

  @override
  String get imageFallbackTitle => 'Resim';

  @override
  String get noBrowserAvailable => 'Tarayıcı yok';

  @override
  String failedToOpen(Object error) {
    return 'Başarısız to open: $error';
  }

  @override
  String get cancel => 'İptal';

  @override
  String get settingsRestoreDemoTitle => 'Demo kumandalar geri yüklensin mi?';

  @override
  String get settingsRestoreDemoMessage =>
      'Bu işlem mevcut kumandalarınızı yerleşik demo kumandalarla değiştirir. Mevcut listenizi korumak istiyorsanız yedek önerilir.';

  @override
  String get settingsRestoreDemoConfirm => 'Demoyu geri yükle';

  @override
  String get settingsDemoRemotesRestored => 'Demo kumandalar geri yüklendi.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Tüm kumandalar silinsin mi?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Bu işlem bu cihazdaki tüm kumandaları kaldırır. Bu işlem geri alınamaz.';

  @override
  String get settingsDeleteAllConfirm => 'Tümünü sil';

  @override
  String get settingsAllRemotesDeleted => 'Tüm kumandalar silindi.';

  @override
  String get themeAuto => 'Otomatik Tema';

  @override
  String get themeLight => 'Açık Tema';

  @override
  String get themeDark => 'Koyu Tema';

  @override
  String get themeDescAuto => 'Cihaz ayarlarınızı izler';

  @override
  String get themeDescLight => 'Her zaman parlak ve net';

  @override
  String get themeDescDark => 'Göz yormaz';

  @override
  String get themeHintAuto =>
      'Tema, cihaz ayarlarınız açık ve koyu mod arasında değiştiğinde otomatik olarak geçer.';

  @override
  String get themeHintLight =>
      'Gündüz kullanımı ve iyi aydınlatılmış ortamlar için ideal';

  @override
  String get themeHintDark =>
      'Düşük ışıkta göz yorgunluğunu azaltır ve OLED ekranlarda pil tasarrufu sağlar';

  @override
  String get supportDevelopmentTitle => 'Gelişimi Destekle';

  @override
  String get supportDevelopmentSubtitle =>
      'IR Blaster\'ın bakımını ve donanım uyumluluğunu destekleyin';

  @override
  String get supportDevelopmentBody =>
      'Reklam yok, takip yok, kilitli özellik yok. Desteğiniz protokol geliştirmesini, USB dongle desteğini ve cihazlar arası daha iyi uyumluluğu finanse eder.';

  @override
  String get donate => 'Donate';

  @override
  String get starRepo => 'Star Repo';

  @override
  String get repositoryLinkCopied => 'Repository link kopyalandı';

  @override
  String get supportPillLocalOnly => 'Local-yalnızca';

  @override
  String get supportPillNoTracking => 'No tracking';

  @override
  String get supportPillHardwareAware => 'Donanım-aware';

  @override
  String get supportPillOpenSource => 'Aç-source';

  @override
  String get appearanceTitle => 'Appearance';

  @override
  String get appearanceSubtitle => 'Görsel deneyiminizi özelleştirin';

  @override
  String get localizationTitle => 'Localization';

  @override
  String get localizationSubtitle => 'Uygulama dili ve çeviri davranışı';

  @override
  String localizationAutoUsing(Object language) {
    return 'Otomatik: using $language';
  }

  @override
  String get localizationAutoDescription =>
      'Uygulama mümkün olduğunda cihaz dilinizi izler.';

  @override
  String get localizationManualDescription =>
      'Uygulama dili elle geçersiz kılındı.';

  @override
  String get useSystemLanguageTitle => 'Sistem dilini kullan';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Cihaz dili izleniyor: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Cihaz varsayılanı yerine aşağıda seçilen dili kullan.';

  @override
  String get chooseAppLanguage => 'Uygulama dilini seç';

  @override
  String get languagePickerDisabledHint =>
      'Bir dili elle seçmek için sistem dilini kapatın.';

  @override
  String get searchLanguages => 'Dillerde ara';

  @override
  String get noLanguagesFound => 'Eşleşen dil yok';

  @override
  String get localizationHint =>
      'Sistem dili açıksa uygulama cihaz yerel ayarınızı izler ve çeviri yoksa İngilizceye döner. Uygulamayı belirli bir dile sabitlemek için bunu kapatın.';

  @override
  String get appLanguageTitle => 'Uygulama dili';

  @override
  String get appLanguageHint =>
      'Otomatik olarak cihaz dilinizi izler. Yalnızca uygulama için geçersiz kılmak üzere burada İngilizce veya Fransızca seçin.';

  @override
  String get languageAuto => 'Otomatik (sistem)';

  @override
  String get languageAutoDescription => 'Cihaz dilinizi otomatik izle';

  @override
  String get languageEnglish => 'İngilizce';

  @override
  String get languageEnglishDescription =>
      'Uygulamayı her zaman İngilizce kullanmaya zorla';

  @override
  String get languageFrench => 'Fransızca';

  @override
  String get languageFrenchDescription =>
      'Uygulamayı her zaman Fransızca kullanmaya zorla';

  @override
  String get languageAutoShort => 'Otomatik';

  @override
  String get languageEnglishShort => 'İngilizce';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'Dinamik renkleri kullan';

  @override
  String get themeChoiceAuto => 'Otomatik';

  @override
  String get themeChoiceLight => 'Açık';

  @override
  String get themeChoiceDark => 'Dark';

  @override
  String get irTransmitterTitle => 'IR Verici';

  @override
  String get irTransmitterSubtitle => 'Choose which donanım sends IR commands';

  @override
  String get learningModeEntryTitle => 'Öğrenme Modu';

  @override
  String get learningModeEntrySubtitle =>
      'Fiziksel uzaktan kumandadan bir düğmeyi adım adım yakalayın';

  @override
  String get learningModeTitle => 'Öğrenme Modu';

  @override
  String get learningModeHeroTitle =>
      'Uzak bir düğmeyi temiz bir şekilde öğrenin';

  @override
  String get learningModeHeroSubtitle =>
      'Alıcınızı kurun, orijinal uzaktan kumandayı hazırlayın, bir komutu yakalayın ve ardından onu uzaktan kumandaya kaydetmeden önce gözden geçirin.';

  @override
  String get learningModeReadyBadge => 'Alıcı hazır';

  @override
  String get learningModeNeedsPermissionBadge => 'USB izni gerekli';

  @override
  String get learningModeSetupBadge => 'Alıcı kurulumu gerekli';

  @override
  String get learningModeNoReceiverBadge => 'Öğrenme alıcısı yok';

  @override
  String get learningModeCheckingBadge => 'Donanım kontrol ediliyor';

  @override
  String get learningModeFourStepFlow => '4 adımlı yönlendirmeli akış';

  @override
  String get learningModeSaveAnywhereBadge => 'Kaydetmeden önce inceleyin';

  @override
  String get learningModeGuideTitle =>
      'Yakalamanın gerçekleşmesi gereken yerden alın';

  @override
  String get learningModeStepHardwareShort => 'Donanım';

  @override
  String get learningModeStepPrepareShort => 'Hazırlanmak';

  @override
  String get learningModeStepCaptureShort => 'Esir almak';

  @override
  String get learningModeStepReviewShort => 'Gözden geçirmek';

  @override
  String get learningModeStepHardwareTitle => 'Alıcı donanımını kontrol edin';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Başlamadan önce uyumlu bir öğrenme alıcısının takılı olduğundan ve yetkilendirildiğinden emin olun.';

  @override
  String get learningModeCurrentSenderLabel => 'Akım verici';

  @override
  String get learningModeReceiverStatusLabel => 'Öğrenme durumu';

  @override
  String get learningModeCheckingHardwareBody =>
      'Mevcut verici ve USB alıcı durumu kontrol ediliyor.';

  @override
  String get learningModeHardwareReadyBody =>
      'Bir USB IR donanım kilidi takılır ve başlatılır. Yakalama kablolaması bağlandıktan sonra öğrenme akışını başlatmak için doğru yer burasıdır.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Bir USB donanım kilidi mevcut ancak Android izni onu hâlâ engelliyor. Öğrenmeden önce verici bölümünde USB izni verin.';

  @override
  String get learningModeHardwareSetupBody =>
      'Bir donanım kilidi kısmen algılandı ancak öğrenmenin güvenilir bir şekilde başlayabilmesi için yine de kurulumu veya yeniden bağlanması gerekiyor.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Şu anda uyumlu bir alıcı donanımı mevcut değil. Öğrenme modu, alma özelliğine sahip, desteklenen harici donanım kilitleri için tasarlanmıştır.';

  @override
  String get learningModeRefreshHardware => 'Donanım durumunu yenile';

  @override
  String get learningModeHardwareTipTitle => 'En iyi yerleşim';

  @override
  String get learningModeHardwareTipBody =>
      'Öğrenme Modu, donanımın kullanılabilirliğine bağlı olduğundan ve uzaktan kumanda göndermekten daha az kullanıldığından IR Verici altında bulunur.';

  @override
  String get learningModeStepPrepareTitle =>
      'Orijinal uzaktan kumandayı hazırlayın';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Ne öğreneceğinize karar verin, ardından orijinal uzaktan kumandayı sabit ve alıcıya yakın tutun.';

  @override
  String get learningModeButtonNameLabel => 'Düğme adı';

  @override
  String get learningModeButtonNameHint => 'Örneğin: HDMI 1, Güç, Menü';

  @override
  String get learningModeSinglePress => 'Tek basış';

  @override
  String get learningModeHoldButton => 'Basılı tut düğmesi';

  @override
  String get learningModePreparationChecklistTitle => 'Yakalamadan önce';

  @override
  String get learningModePreparationItemDistance =>
      'Orijinal uzaktan kumandayı alıcıdan yaklaşık 2 ila 5 cm uzakta tutun.';

  @override
  String get learningModePreparationItemOneButton =>
      'Her seferinde bir düğmeyi öğrenin ve önce kısa, temiz bir basış kullanın.';

  @override
  String get learningModePreparationItemStill =>
      'Gürültülü veya kısmi çekimlerden kaçınmak için her iki cihazı da sabit tutun.';

  @override
  String get learningModeStepCaptureTitle => 'Sinyali yakalayın';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Tek bir komutu dinleyin ve ardından incelemeden önce sonucu kilitleyin.';

  @override
  String get learningModeCaptureReadyTitle => 'Dinlemeye hazır';

  @override
  String get learningModeCaptureReadyBody =>
      'Donanım durumunuz iyi görünüyor. Yakalama arka ucu bir sonraki adıma eklenecektir.';

  @override
  String get learningModeCaptureBlockedTitle => 'Donanım henüz hazır değil';

  @override
  String get learningModeCaptureBlockedBody =>
      'Akışı şimdi inceleyebilirsiniz ancak yakalama işlemi, alıcı hazır olana kadar beklemelidir.';

  @override
  String get learningModeStartListening => 'Dinlemeye başla';

  @override
  String get learningModeCaptureStubTitle =>
      'Arka uç yakalama daha sonra gelir';

  @override
  String get learningModeCaptureStubBody =>
      'Bu ekran öncelikle tamamen desteklenir, böylece son yakalama akışı daha sonra sabitlenmek yerine gerçek donanım durumlarına bağlanabilir.';

  @override
  String get learningModeCaptureStubMessage =>
      'Öğrenme yakalama henüz kablolu değil. Bu ekran ilk önce tam akışın iskelesini oluşturur.';

  @override
  String get learningModeUnnamedCapture => 'Adsız yakalama';

  @override
  String get learningModeStatusCheckingTitle => 'Alıcı kontrol ediliyor';

  @override
  String get learningModeStatusNoReceiverTitle => 'Alıcı hazır değil';

  @override
  String get learningModeStatusPermissionTitle => 'USB izni gerekli';

  @override
  String get learningModeStatusSetupTitle => 'Alıcının kuruluma ihtiyacı var';

  @override
  String get learningModeStatusReadyTitle => 'Öğrenmeye hazır';

  @override
  String get learningModeStatusListeningTitle => 'Bir sinyalin dinlenmesi';

  @override
  String get learningModeStatusCapturedTitle => 'Yakalanan sinyal';

  @override
  String get learningModeStatusReadyBody =>
      'Düğmeye bir ad verin, orijinal uzaktan kumandayı alıcıya doğrultun ve hazır olduğunuzda dinlemeye başlayın.';

  @override
  String get learningModeStatusListeningBody =>
      'Şimdi orijinal uzaktan kumanda düğmesine basın. Yakalama kablolandıktan sonra bu durum bir sonraki temiz sinyale kilitlenecektir.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return '$buttonName için öğrenilmiş bir sinyal önizlemesi hazır. Tekrar oynatın, çalıştığını onaylayın ve ardından kitaplığınıza kaydedin.';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'Uyumlu bir öğrenme donanım kilidini bağlayın';

  @override
  String get learningModeConnectReceiverBody =>
      'Öğrenme modu IR alabilen harici donanıma bağlıdır. Alıcı tespit edilip yetkilendirildikten sonra bu sayfa doğrudan dinleme, test etme ve kaydetme akışına dönüşür.';

  @override
  String get learningModeListenCardTitle => 'Bir düğmeyi dinle';

  @override
  String get learningModeListenCardBody =>
      'İsterseniz önce bir etiket belirleyin, ardından dinlemeye başlayın ve orijinal uzaktan kumandadaki düğmeye basın.';

  @override
  String get learningModeReadyToListenTitle => 'Dinlemeye hazır';

  @override
  String get learningModeReadyToListenBody =>
      'Bu ana yakalama yüzeyidir. Yalnızca orijinal uzaktan kumanda hedeflendiğinde ve sabit olduğunda dinlemeye başlayın.';

  @override
  String get learningModeListeningNowTitle => 'Şimdi dinliyorum';

  @override
  String get learningModeListeningNowBody =>
      'Orijinal uzaktan kumanda düğmesine bir kez basın. Gerçek yakalama arka ucu kablolanmadan önce iskelenin geri kalanında ilerlemek için önizleme yakalamayı kullanın.';

  @override
  String get learningModePreviewCaptureAction => 'Yakalanan sinyali önizleyin';

  @override
  String get learningModeCapturedSummary => 'Öğrenilen sinyal önizlemesi';

  @override
  String get learningModeResultActionsTitle => 'Test edin ve kaydedin';

  @override
  String get learningModeResultActionsBody =>
      'Öğrenilen sinyali yeniden oynatın, hedef cihazın yanıt verdiğini doğrulayın ve ardından onu yeniden kullanılabilir bir düğme olarak kaydedin.';

  @override
  String get learningModeReplayAction => 'Tekrar oynat';

  @override
  String get learningModeReplayStubMessage =>
      'Tekrar oynatma henüz kablolu değil. Bu, son öğrenme, test etme ve kaydetme akışına yönelik kullanıcı arayüzü iskelesidir.';

  @override
  String get learningModeSaveStubMessage =>
      'Kaydetme henüz bağlanmadı. Bir sonraki adım bu ekranı Create Button\'a ve mevcut uzaktan kumandalara bağlamaktır.';

  @override
  String get learningModeLearnAnotherAction => 'Başka bir düğme öğrenin';

  @override
  String get learningModeStepReviewTitle => 'İnceleyin ve kaydedin';

  @override
  String get learningModeStepReviewSubtitle =>
      'Öğrenilenleri onaylayın ve ardından uzak kitaplığınızda nerede saklanacağını seçin.';

  @override
  String get learningModeSaveToExistingRemote => 'Mevcut uzaktan kumanda';

  @override
  String get learningModeCreateNewRemote => 'Yeni uzaktan kumanda';

  @override
  String get learningModeProtocolPreviewTitle => 'Protokol önizlemesi';

  @override
  String get learningModeProtocolPreviewBody =>
      'Alıcı temiz bir düğmeye basmayı algıladığında kodu çözülmüş protokol ayrıntıları burada görünecektir.';

  @override
  String get learningModeRawPreviewTitle => 'Ham geri dönüş';

  @override
  String get learningModeRawPreviewBody =>
      'Kod çözme tamamlanmadıysa ham zamanlama yakalaması incelenmek ve kaydedilmek üzere burada mevcut olacaktır.';

  @override
  String get learningModeSaveCapture => 'Yakalamayı kaydet';

  @override
  String get learningModeReviewTipTitle => 'Bu bundan sonra nereye gidecek';

  @override
  String get learningModeReviewTipBody =>
      'Bir sonraki uygulama adımı, öğrenilen sinyalin doğrudan kitaplığınıza düşmesi için bu inceleme panelini Oluştur Düğmesine ve mevcut uzaktan kumandalara bağlamalıdır.';

  @override
  String get learningModeFinishPreview => 'Önizlemeyi bitir';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interaction';

  @override
  String get interactionSubtitle => 'Dokunma geri bildirimi ve kumanda düzeni';

  @override
  String get hapticFeedbackTitle => 'Haptic feedback';

  @override
  String get hapticFeedbackSubtitle => 'Dokunuşlarda ve eylemlerde titreşim';

  @override
  String get forceInAppVibrationTitle => 'Uygulama içi titreşimi zorla';

  @override
  String get forceInAppVibrationSubtitle =>
      'Sistem dokunma geri bildirimi kapalı olsa bile titreşimi doğrudan kullan';

  @override
  String get forceInAppVibrationWarning =>
      'Gelişmiş seçenek. Android dokunma geri bildirimi genel olarak kapalı olsa bile uygulama titreşebilir.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'Intensity';

  @override
  String get intensityLight => 'Açık';

  @override
  String get intensityMedium => 'Medium';

  @override
  String get intensityStrong => 'Strong';

  @override
  String get flipRemoteDefaultTitle => 'Flip Kumanda Görünüm by default';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Kumanda ekranlarını 180° döndürerek açar (alta takılan USB dongle\'lar için).';

  @override
  String get remoteViewFlipped => 'Kumanda görünümü ters açılacak.';

  @override
  String get remoteViewNormal => 'Kumanda görünümü normal açılacak.';

  @override
  String get backupTitle => 'Yedek';

  @override
  String get backupSubtitle => 'Kumandaları ve makroları içe/dışa aktar';

  @override
  String get importBackup => 'İçe aktar yedek';

  @override
  String get importBackupSubtitle =>
      'İçe aktar remotes/macros yedek or Flipper Sıfır, LIRC or IRPLUS files';

  @override
  String get bulkImportFolder => 'Bulk içe aktar klasör';

  @override
  String get bulkImportFolderSubtitle =>
      'Bir klasörden birden çok kumanda içe aktar';

  @override
  String get exportBackup => 'Dışa aktar yedek';

  @override
  String get exportBackupSubtitle =>
      'Kumandaları ve makroları tek bir JSON dosyası olarak İndirilenler\'e kaydet';

  @override
  String get restoreDemoRemotes => 'Demoyu geri yükle remotes';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Mevcut kumandaları yerleşik demo ile değiştir';

  @override
  String get deleteAllRemotes => 'Tümünü sil remotes';

  @override
  String get deleteAllRemotesSubtitle => 'Bu cihazdaki tüm kumandaları kaldır';

  @override
  String get backupTip =>
      'İpucu: Büyük düzenlemelerden önce bir yedek dışa aktarın. İçe aktarma; tam yedekleri, eski yalnızca-kumanda JSON yedeklerini ve Flipper Zero .ir dosyalarını destekler.';

  @override
  String get aboutTitle => 'About';

  @override
  String get aboutSubtitle => 'Uygulama bilgileri ve açık kaynak ayrıntıları';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Version $version';
  }

  @override
  String get sourceCode => 'Source Kod';

  @override
  String get viewOnGitHub => 'Görünüm on GitHub';

  @override
  String get repositoryUrlCopied => 'Repository URL kopyalandı';

  @override
  String get reportIssue => 'Report Issue';

  @override
  String get reportIssueSubtitle => 'Bug reports & feature requests';

  @override
  String get issuesUrlCopied => 'Issues URL kopyalandı';

  @override
  String get license => 'License';

  @override
  String get openSourceLicense => 'Aç-source license';

  @override
  String get licenseUrlCopied => 'License URL kopyalandı';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Visit our website';

  @override
  String get companyUrlCopied => 'Company URL kopyalandı';

  @override
  String get licenses => 'Licenses';

  @override
  String get openSourceLicenses => 'Aç source licenses';

  @override
  String byCreator(Object creator) {
    return 'by $creator';
  }

  @override
  String get deviceControlsTitle => 'Cihaz Kontrolleri';

  @override
  String get deviceControlsSubtitle =>
      'Favori düğmeleri sistem kontrolleri sayfasında göster';

  @override
  String get manageFavorites => 'Manage favorites';

  @override
  String get manageFavoritesSubtitle =>
      'Cihaz kontrollerinde hangi düğmelerin görüneceğini seçin';

  @override
  String get quickSettingsTitle => 'Hızlı Ayarlar';

  @override
  String get quickSettingsSubtitle =>
      'Güç ve ses kısayolları için döşemeler ekleyin';

  @override
  String get configureTiles => 'Configure tiles';

  @override
  String get configureTilesSubtitle => 'Döşemeleri kumanda düğmelerine eşleyin';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Sahip olduğunuz cihazlar için evrensel güç döngüsü';

  @override
  String get openTvKill => 'Aç TVKill';

  @override
  String get openTvKillSubtitle =>
      'Güç kodlarını döngüye alın (yalnızca size ait cihazlarda kullanın)';

  @override
  String get failedToLoadTransmitterSettings =>
      'Başarısız to load verici settings.';

  @override
  String get usbStatusReady => 'USB dongle bağlı ve IR göndermeye hazır.';

  @override
  String get usbStatusPermissionRequired =>
      'USB dongle algılandı. USB izni isteyin ve sistem istemini onaylayın.';

  @override
  String get usbStatusPermissionDenied =>
      'Takılı dongle için USB izni reddedildi. Yeniden isteyin ve istemi onaylayın.';

  @override
  String get usbStatusPermissionGranted =>
      'USB izni verildi. IR göndermeden önce dongle\'ın yine de başlatılması gerekir.';

  @override
  String get usbStatusOpenFailed =>
      'USB izni verildi, ancak dongle başlatılamadı. Yeniden takıp tekrar deneyin.';

  @override
  String get usbStatusNoDevice => 'No supported USB IR dongle detected.';

  @override
  String get usbSelectPermissionRequired =>
      'USB dongle algılandı ama henüz yetkili değil. \"USB izni iste\"ye dokunun.';

  @override
  String get usbSelectPermissionDenied =>
      'USB izni reddedildi. \"USB izni iste\"ye dokunun ve istemi onaylayın.';

  @override
  String get usbSelectPermissionGranted =>
      'USB izni verildi, ancak dongle henüz başlatılmadı. Yeniden takmayı deneyin.';

  @override
  String get usbSelectOpenFailed =>
      'USB izni verildi, ancak dongle başlatılamadı. Yeniden takıp tekrar deneyin.';

  @override
  String get usbSelectNoDevice =>
      'No supported USB IR dongle detected. Plug it in, then dokun \"İste USB izin\".';

  @override
  String get usbSelectReady => 'USB dongle hazır.';

  @override
  String get autoSwitchEnabledMessage =>
      'Otomatik geçiş etkin: bağlı olduğunda USB\'yi, aksi halde Dahili\'yi kullanır.';

  @override
  String get autoSwitchDisabledMessage =>
      'Otomatik geçiş kapalı: verici seçimi artık elle yapılıyor.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Başarısız to update auto-switch setting.';

  @override
  String get failedToSwitchTransmitter => 'Başarısız to switch verici.';

  @override
  String get deviceHasNoInternalIr => 'Bu cihazda dahili IR verici yok.';

  @override
  String get audioModeEnabledMessage =>
      'Ses modu etkin. Azami medya sesini kullanın ve bir ses-IR LED adaptörü bağlayın.';

  @override
  String get usbPermissionRequestSent => 'USB izin request sent.';

  @override
  String get usbPermissionRequestSentApprove =>
      'USB izin isteği gönderildi. USB\'yi etkinleştirmek için istemi onaylayın.';

  @override
  String get usbAlreadyReady => 'USB dongle zaten başlatılmış ve hazır.';

  @override
  String get failedToRequestUsbPermission => 'USB izni istenemedi.';

  @override
  String get transmitterHelpInternal =>
      'Komut göndermek için telefonun dahili IR vericisini kullanın.';

  @override
  String get transmitterHelpUsb =>
      'Komut göndermek için bir USB IR dongle kullanın (izin gerekir).';

  @override
  String get transmitterHelpAudio1 =>
      'Ses çıkışını kullanır (mono). Ses-IR LED adaptörü ve yüksek medya sesi gerekir.';

  @override
  String get transmitterHelpAudio2 =>
      'Ses çıkışını kullanır (stereo). Uyumlu adaptörlerle daha iyi LED sürüşü için iki kanal kullanır.';

  @override
  String get transmitterInternal => 'Dahili IR';

  @override
  String get transmitterUsb => 'USB IR Dongle';

  @override
  String get transmitterAudio1 => 'Ses (1 LED)';

  @override
  String get transmitterAudio2 => 'Ses (2 LED)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Başarısız to load verici capabilities.';

  @override
  String get selectedTransmitter => 'Seçili verici';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Active: $active';
  }

  @override
  String get refresh => 'Yenile';

  @override
  String get autoSwitchTitle => 'Otomatik geçiş';

  @override
  String get autoSwitchDisabledWhileAudio => 'Disabled while using Ses mod';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Bağlı olduğunda USB\'yi, aksi halde Dahili\'yi kullanır';

  @override
  String get unavailableOnThisDevice => 'Bu cihazda kullanılamaz';

  @override
  String get openOnUsbAttachTitle => 'Aç on USB attach';

  @override
  String get openOnUsbAttachSubtitle =>
      'Desteklenen bir USB IR dongle bağlandığında Android uygulamayı açmayı önerebilir.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Desteklenen bir USB dongle takıldığında IR Blaster\'ı açmayı önerecek.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'USB bağlanınca açmayı önermeyecek.';

  @override
  String get failedToUpdateSetting => 'Başarısız to update setting.';

  @override
  String get unnamedButton => 'Unnamed düğme';

  @override
  String get iconFallback => 'Icon';

  @override
  String get remoteListReorderHint =>
      'Yeniden sıralama modu: taşımak için bir karta uzun basıp sürükleyin.';

  @override
  String get deleteRemoteTitle => 'Sil kumanda?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" kalıcı olarak kaldırılacak. Bu işlem geri alınamaz.';
  }

  @override
  String get delete => 'Sil';

  @override
  String get addToDeviceControlsTitle => 'Ekle to Cihaz Kontrolleri?';

  @override
  String get addToDeviceControlsDescription =>
      'Sistem cihaz kontrollerinde hızlı erişim.';

  @override
  String get skip => 'Skip';

  @override
  String get add => 'Ekle';

  @override
  String get addedToDeviceControls => 'Eklendi to Cihaz Kontrolleri.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return '\"$name\" silindi. Bu işlem geri alınamaz.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count düğme(s) · $layout';
  }

  @override
  String get layoutComfort => 'Comfort';

  @override
  String get layoutCompact => 'Compact';

  @override
  String get open => 'Aç';

  @override
  String get useThisRemote => 'Bu kumandayı kullan';

  @override
  String get edit => 'Düzenle';

  @override
  String get editRemoteSubtitle => 'Yeniden adlandırın ve düğmeleri düzenleyin';

  @override
  String get thisCannotBeUndone => 'Bu işlem geri alınamaz';

  @override
  String get searchRemotes => 'Ara Kumandalar';

  @override
  String get reorderRemotes => 'Reorder remotes';

  @override
  String get addRemote => 'Ekle kumanda';

  @override
  String get more => 'Daha';

  @override
  String get reorderMode => 'Reorder mod';

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
      'Create a kumanda to başlat sending IR codes.';

  @override
  String get noRemotesNextStep =>
      'Sonraki adım: Kumanda Ekle\'ye dokunun, sonra ilk düğmelerinizi ekleyin.';

  @override
  String get actions => 'Actions';

  @override
  String get macrosTitle => 'Makrolar';

  @override
  String get help => 'Help';

  @override
  String get createMacro => 'Create Macro';

  @override
  String get timedMacrosTitle => 'Timed Makrolar';

  @override
  String get timedMacrosSubtitle =>
      'Automate sequences of IR commands with precise timing';

  @override
  String get timedMacrosNextStep =>
      'Sonraki adım: İlk Makronu Oluştur\'a dokun, bir kumanda seç, sonra komutlar ve gecikmeler ekle.';

  @override
  String get macroFeatureToysTitle => 'Etkileşimli oyuncaklar için ideal';

  @override
  String get macroFeatureToysDescription =>
      'Komutlar arasında işlem süresi gereken i-cybie robot köpekler, i-sobot robotlar ve benzeri oyuncakları kontrol edin.';

  @override
  String get macroFeatureTimingTitle => 'Hassas Zamanlama Kontrolü';

  @override
  String get macroFeatureTimingDescription =>
      'Cihazınızın sonraki eylemden önce yanıt verebilmesi için komutlar arasına gecikmeler ekleyin (250 ms\'den özel sürelere kadar).';

  @override
  String get macroFeatureManualTitle => 'Elle Devam Et adımları';

  @override
  String get macroFeatureManualDescription =>
      'Animasyon süresi değiştiğinde veya görsel geri bildirim gerektiğinde yürütmeyi duraklatır ve onayınızı bekler.';

  @override
  String get exampleUseCase => 'Örnek Kullanım Senaryosu';

  @override
  String get macroExampleText =>
      'i-cybie Gelişmiş Mod\n1. \"Mode\" komutunu gönder\n2. 1000 ms bekle (oyuncak işler)\n3. \"Action 1\" gönder\n4. 1000 ms bekle\n5. \"Action 2\" gönder\n… ve bu şekilde otomatik devam eder!';

  @override
  String get createFirstMacro => 'İlk Makronu Oluştur';

  @override
  String get noRemote => 'No kumanda';

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
  String get aboutTimedMacros => 'About Timed Makrolar';

  @override
  String get aboutTimedMacrosDescription =>
      'Zamanlı Makrolar, her adım arasında hassas gecikmelerle IR komut dizilerini otomatikleştirmenizi sağlar.';

  @override
  String get sendCommand => 'Komut Gönder';

  @override
  String get sendCommandDescription => 'Kumandanızdan bir IR komutu gönderir.';

  @override
  String get delay => 'Delay';

  @override
  String get delayDescription =>
      'Bir sonraki adımdan önce belirtilen süre kadar bekler (örn. 1000 ms).';

  @override
  String get manualContinue => 'Elle Devam Et';

  @override
  String get manualContinueDescription =>
      'Devam Et\'e dokunana kadar yürütmeyi duraklatır (değişken uzunluklu animasyonlar için kullanışlıdır).';

  @override
  String get gotIt => 'Got it';

  @override
  String get failedToSaveMacros => 'Başarısız to kaydet macros.';

  @override
  String deletedMacroNamed(Object name) {
    return '\"$name\" silindi.';
  }

  @override
  String get undo => 'Undo';

  @override
  String get failedToRestoreMacro => 'Başarısız to geri yükle macro.';

  @override
  String get deleteMacroTitle => 'Sil macro?';

  @override
  String get deleteMacroMessage =>
      'Bunu bir sonraki alt bildirimden geri alabilirsiniz.';

  @override
  String get noRemotesAvailable => 'No remotes mevcut.';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count düğme(s)';
  }

  @override
  String get remoteOrientationFlippedTooltip => 'Yön: ters (dokun to normal)';

  @override
  String get remoteOrientationNormalTooltip => 'Yön: normal (dokun to flip)';

  @override
  String get stopLoop => 'Durdur döngü';

  @override
  String get reorderButtons => 'Düğmeleri yeniden sırala';

  @override
  String get remoteReorderHint =>
      'Yeniden sıralama modu: taşımak için bir düğmeye uzun basıp sürükleyin.';

  @override
  String get manageRemote => 'Manage kumanda';

  @override
  String get remoteNoButtons => 'Bu kumandada düğme yok';

  @override
  String get remoteNoButtonsDescription =>
      'Düğme eklemek veya yapılandırmak için \"Kumandayı Düzenle\"yi kullanın.';

  @override
  String get editRemote => 'Düzenle kumanda';

  @override
  String get editRemoteActionsSubtitle =>
      'Yeniden adlandırın, sıralayın ve düğmeleri düzenleyin';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Güncellendi \"$name\".';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Eklendi \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Düğme duplicated.';

  @override
  String get loopRunningForButton => 'Bu düğme için döngü çalışıyor.';

  @override
  String get loopTip =>
      'İpucu: Siz durdurana kadar tekrarlamak için Döngü\'yü kullanın.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Kod kopyalandı.';

  @override
  String get copyCode => 'Kopyala kod';

  @override
  String get startLoop => 'Başlat döngü';

  @override
  String get editButtonSubtitle =>
      'Etiketi, kodu, protokolü ve frekansı değiştirin';

  @override
  String get newButton => 'New düğme';

  @override
  String get newButtonSubtitle => 'Bundan sonra yeni bir düğme oluştur';

  @override
  String get duplicate => 'Çoğalt';

  @override
  String get duplicateButtonSubtitle => 'Bu düğmenin bir kopyasını oluştur';

  @override
  String get removeFromDeviceControls => 'Cihaz Kontrollerinden Kaldır';

  @override
  String get addToDeviceControls => 'Ekle to Cihaz Kontrolleri';

  @override
  String get deviceControlsButtonSubtitle =>
      'Bu düğmeyi sistem cihaz kontrollerinde gösterir';

  @override
  String get removedFromDeviceControls => 'Cihaz Kontrollerinden kaldırıldı.';

  @override
  String get pinQuickTile => 'Pin to Hızlı Döşeme favorites';

  @override
  String get unpinQuickTile => 'Hızlı Döşeme favorilerinden kaldır';

  @override
  String get quickTileButtonSubtitle =>
      'Bu düğmeyi hızlı döşeme seçicisinde üstte gösterir';

  @override
  String get removedFromQuickTileFavorites =>
      'Hızlı Döşeme favorilerinden kaldırıldı.';

  @override
  String get pinnedToQuickTileFavorites => 'Pinned to Hızlı Döşeme favorites.';

  @override
  String get duplicateAndEdit => 'Çoğalt ve düzenle';

  @override
  String get duplicateAndEditSubtitle => 'Bir kopya oluştur ve hemen düzenle';

  @override
  String get done => 'Done';

  @override
  String get run => 'Çalıştır';

  @override
  String get untitledRemote => 'Untitled Kumanda';

  @override
  String get createRemoteTitle => 'Create kumanda';

  @override
  String get editRemoteTitle => 'Düzenle kumanda';

  @override
  String get removeButtonTitle => 'Kaldır düğme?';

  @override
  String get imageButtonRemovedMessage => 'Bu resim düğmesi kaldırılacak.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" kaldırılacak.';
  }

  @override
  String get remove => 'Kaldır';

  @override
  String importedButtonCount(int count) {
    return '$count düğme içe aktarıldı.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Mevcut kumandalardan $count düğme içe aktarıldı.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Etiketi, sinyali ve gelişmiş ayarları değiştirin';

  @override
  String get createButtonCopySubtitle => 'Bu düğmenin bir kopyasını oluştur';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Bir kopya oluştur ve hemen düzenle';

  @override
  String get undoAvailableInNextSnackbar =>
      'Bir sonraki alt bildirimden geri alabilirsiniz';

  @override
  String get buttonRemoved => 'Düğme removed.';

  @override
  String get remoteNameCannotBeEmpty => 'Kumanda name can\'t be empty.';

  @override
  String get saveRemote => 'Kaydet kumanda';

  @override
  String get remoteName => 'Kumanda name';

  @override
  String get remoteNameHint => 'e.g., TV, Air Conditioner, LED Strip';

  @override
  String get remoteNameHelper => 'Bu ad Kumandalar listenizde görünür.';

  @override
  String get layoutStyle => 'Düzen stili';

  @override
  String get layoutWideDescription =>
      'Geniş: Ek ayrıntılarla 2 sütunlu düğmeler (önerilen).';

  @override
  String get layoutCompactDescription =>
      'Compact: classic 4× grid (icons/text yalnızca).';

  @override
  String get importFromRemotes => 'Kumandalardan içe aktar';

  @override
  String get importFromDatabase => 'Veritabanından içe aktar';

  @override
  String get addButton => 'Ekle düğme';

  @override
  String get noButtonsYet => 'Henüz düğme yok';

  @override
  String get createRemoteEmptyStateDescription =>
      'İlk düğmenizi ekleyin, sonra düzenleme/kaldırma seçenekleri için ona uzun basın.';

  @override
  String get createButtonTitle => 'Create Düğme';

  @override
  String get editButtonTitle => 'Düzenle Düğme';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Başarısız to load protocols: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Veritabanı tuşları yüklenemedi: $error';
  }

  @override
  String get presetPower => 'Güç';

  @override
  String get presetVolume => 'Ses';

  @override
  String get presetChannel => 'Kanal';

  @override
  String get presetNavigation => 'Navigation';

  @override
  String get all => 'Tümü';

  @override
  String get completeRequiredFieldsToSave =>
      'Complete gerekli fields to kaydet';

  @override
  String get buttonLabelStepTitle => 'Düğme etiketi';

  @override
  String get buttonLabelStepSubtitle =>
      'Choose an image, icon, or type a text label.';

  @override
  String get buttonColorStepTitle => 'Düğme rengi';

  @override
  String get buttonColorStepSubtitle =>
      'Bu düğme için bir arka plan rengi seçin.';

  @override
  String get selectColor => 'Renk seçin:';

  @override
  String get noImageSelected => 'No image seçili';

  @override
  String get gallery => 'Gallery';

  @override
  String get builtIn => 'Built-in';

  @override
  String get removeImage => 'Kaldır image';

  @override
  String get requiredSelectImageOrSwitch =>
      'Required: select an image, choose an icon, or switch to Metin.';

  @override
  String get iconSelected => 'Icon seçili';

  @override
  String get noIconSelected => 'No icon seçili';

  @override
  String get chooseIcon => 'Choose Icon';

  @override
  String get removeIcon => 'Kaldır icon';

  @override
  String get requiredSelectIconOrSwitch =>
      'Required: select an icon or switch to Resim/Metin.';

  @override
  String get buttonText => 'Düğme text';

  @override
  String get buttonTextHint => 'e.g., Güç, Ses +, HDMI 1';

  @override
  String get buttonTextHelper => 'Bu metin düğmede görünecek.';

  @override
  String get requiredEnterButtonLabel => 'Required: enter a düğme label.';

  @override
  String get defaultColorName => 'Varsayılan';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Son eşleşmeden bir düğmeyle yeni kumanda oluşturuldu.';

  @override
  String get selectRemote => 'Seç kumanda';

  @override
  String remoteNumber(Object id) {
    return 'Kumanda #$id';
  }

  @override
  String get newRemoteCreated => 'New kumanda created.';

  @override
  String get failedToCreateRemote => 'Başarısız to create kumanda.';

  @override
  String get newRemoteEllipsis => 'New kumanda…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Eklendi to $name.';
  }

  @override
  String get failedToAddToRemote => 'Başarısız to ekle to kumanda.';

  @override
  String get newRemoteDefaultName => 'New Kumanda';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Ofset $offset konumuna atlandı. Duraklatıldı — devam etmek için Sürdür\'e basın.';
  }

  @override
  String get sent => 'Sent.';

  @override
  String failedToSend(Object error) {
    return 'Başarısız to gönder: $error';
  }

  @override
  String get copiedProtocolCode => 'Kopyalandı (protokol:kod).';

  @override
  String get savedToResults => 'Kaydetd to Sonuçlar.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Protokol için geçersiz kod: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Copied current candidate.';

  @override
  String get jumpToOffset => 'Atla to ofset';

  @override
  String get jumpToBruteCursor => 'Atla to brute imleç';

  @override
  String get jump => 'Atla';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'İmleç 0x$cursor konumuna atlandı. Duraklatıldı — devam etmek için Sürdür\'e basın.';
  }

  @override
  String get irSignalTester => 'IR Sinyal Testi';

  @override
  String get stop => 'Durdur';

  @override
  String get selectButton => 'Seç düğme';

  @override
  String get buttonNotFoundInRemotes => 'Düğme kumandalarda bulunamadı.';

  @override
  String sentNamed(Object name) {
    return 'Sent \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'Gönder başarısız: $error';
  }

  @override
  String get noFavoritesYet => 'Henüz favori yok';

  @override
  String get deviceControlsEmptyHint =>
      'Bir kumanda düğmesine uzun basın ve “Cihaz Kontrollerine Ekle”yi seçin.';

  @override
  String get sendTest => 'Gönder test';

  @override
  String get testSendCompleted => 'Test gönderimi tamamlandı.';

  @override
  String testSendFailed(Object error) {
    return 'Test gönderimi başarısız: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Removed \"$name\".';
  }

  @override
  String get brand => 'Marka';

  @override
  String get model => 'Model';

  @override
  String get selectBrand => 'Seç marka';

  @override
  String get searchBrand => 'Ara marka…';

  @override
  String get selectModel => 'Model seç';

  @override
  String get searchModel => 'Model ara…';

  @override
  String get unnamedKey => 'Unnamed key';

  @override
  String get unknown => 'Bilinmeyen';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'Ara commands';

  @override
  String get noMatchingCommands => 'Eşleşen yok commands';

  @override
  String get quickTileFavoritesTitle => 'Hızlı döşeme favorileri';

  @override
  String changeMappingForTile(Object tileLabel) {
    return '$tileLabel döşemesi için eşlemeyi değiştir';
  }

  @override
  String get pickDifferentButton => 'Pick a different düğme';

  @override
  String get browseAllRemotesEllipsis => 'Tüm kumandalara göz at…';

  @override
  String get invalidMacroFileFormat => 'Geçersiz makro dosya biçimi.';

  @override
  String get failedToParseMacroFile => 'Makro dosyası ayrıştırılamadı.';

  @override
  String get deviceCodeLabel => 'Cihaz Kodu';

  @override
  String get commandLabel => 'Komut';

  @override
  String get editButtonCodeTitle => 'Düzenle Kod of the düğme';

  @override
  String get thisRemoteHasNoButtons => 'Bu kumandada düğme yok.';

  @override
  String get selectCommand => 'Komut seç';

  @override
  String get databaseModeAutofillHint =>
      'Veritabanı modu 2. adımı sizin için otomatik doldurur (marka + model + protokol). Bir tuş içe aktardıktan sonra Manuel bölümünde her şeyi iyileştirebilirsiniz.';

  @override
  String get test => 'Test';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Tüm seçili düğmeler yinelemeydi.';

  @override
  String get noButtonsImported => 'Hiç düğme içe aktarılmadı.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return '$addedCount düğme içe aktarıldı. $skippedCount yineleme atlandı.';
  }

  @override
  String get importAllMatchingTitle =>
      'Eşleşen tüm düğmeler içe aktarılsın mı?';

  @override
  String get noMatchingKeysFound => 'Eşleşen tuş bulunamadı.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Bu işlem mevcut veritabanı seçiminden en fazla $count eşleşen tuşu içe aktarır.';
  }

  @override
  String get importAll => 'Tümünü içe aktar';

  @override
  String get importingButtons => 'Düğmeler içe aktarılıyor…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Eşleşen tüm düğmeler yinelemeydi.';

  @override
  String get quickPresets => 'Hızlı ön ayarlar';

  @override
  String get selectDeviceFirst => 'Seç cihaz first';

  @override
  String get searchByLabelOrHex => 'Ara by label or hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'İsteğe bağlı: $preset ön ayar tuşlarını iyileştirin';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Önce marka, model ve protokol seçin.';

  @override
  String get importFromDatabaseTitle => 'Veritabanından içe aktar';

  @override
  String get importFromDatabaseSubtitle =>
      'Bir cihaz seçin, eşleşen tuşları yükleyin, sonra seçili düğmeleri içe aktarın.';

  @override
  String get deviceAndFilters => 'Cihaz ve filtreler';

  @override
  String loadedCount(int count) {
    return '$count loaded';
  }

  @override
  String get hideFilters => 'Hide filtres';

  @override
  String get showFilters => 'Filtreleri göster';

  @override
  String get noProtocolFoundForBrandModel =>
      'Bu marka ve model için protokol bulunamadı.';

  @override
  String get protocolAutoDetected => 'Protokol';

  @override
  String get protocolAutoDetectedHelper =>
      'Veritabanından otomatik algılandı. İçe aktarmadan önce değiştirebilirsiniz.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Tuşları yüklemek için bir marka, model ve protokol seçin.';

  @override
  String get noKeysFound => 'Tuş bulunamadı.';

  @override
  String noKeysFoundForSearch(Object query) {
    return '“$query” için tuş bulunamadı.';
  }

  @override
  String get skipDuplicates => 'Skip duplicates';

  @override
  String get skipDuplicatesSubtitle =>
      'Bu kumandada zaten bulunan düğmeleri içe aktarmayın.';

  @override
  String get importSelected => 'İçe aktar seçili';

  @override
  String get noMacrosToExport => 'No macros to dışa aktar.';

  @override
  String get macrosExportedToDownloads => 'Makrolar İndirilenler\'e aktarıldı.';

  @override
  String get failedToExportMacros => 'Başarısız to dışa aktar macros.';

  @override
  String get failedToReadFile => 'Dosya okunamadı.';

  @override
  String get importFromExistingRemotesTitle => 'Mevcut Kumandalardan İçe Aktar';

  @override
  String selectedCount(int count) {
    return '$count seçili';
  }

  @override
  String get noOtherRemotesWithButtons => 'Düğmeli başka kumanda bulunamadı.';

  @override
  String get sourceRemote => 'Source kumanda';

  @override
  String get searchButtons => 'Düğmelerde ara';

  @override
  String get searchButtonsHint => 'Güç, Ses, Sessiz...';

  @override
  String get selectVisible => 'Seç visible';

  @override
  String get clearVisible => 'Temizle visible';

  @override
  String protocolNamed(Object name) {
    return 'Protokol: $name';
  }

  @override
  String get rawSignal => 'Raw';

  @override
  String get legacyCode => 'Eski kod';

  @override
  String importCount(int count) {
    return 'İçe aktar $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Storage izin denied (needed on some older Android cihazlar).';

  @override
  String get backupExportedToDownloads => 'Yedek İndirilenler\'e aktarıldı.';

  @override
  String failedToExport(Object error) {
    return 'Başarısız to dışa aktar: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Eski JSON yedeğinden $count kumanda içe aktarıldı. Makrolar değiştirilmedi.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'İçe aktarma başarısız: varsa yedekteki \"remotes\" bir JSON listesi olmalıdır.';

  @override
  String get importFailedMacrosMustBeList =>
      'İçe aktarma başarısız: varsa yedekteki \"macros\" bir JSON listesi olmalıdır.';

  @override
  String get importFailedInvalidBackupFormat =>
      'İçe aktarma başarısız: geçersiz yedek biçimi (beklenen eski Liste veya kumandalar/makrolar içeren Harita).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Yedekten $remoteCount kumanda içe aktarıldı. Makrolar değiştirilmedi.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Yedekten $remoteCount kumanda ve $macroCount makro içe aktarıldı.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'İçe aktarma başarısız: .ir dosyasında geçerli düğme bulunamadı.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Flipper .ir\'den 1 kumanda içe aktarıldı. Makrolar değiştirilmedi.';

  @override
  String get importFailedInvalidIrplus =>
      'İçe aktarma başarısız: geçersiz irplus dosyası (geçerli düğme bulunamadı).';

  @override
  String get importedOneRemoteFromIrplus =>
      'IRPLUS\'tan 1 kumanda içe aktarıldı. Makrolar değiştirilmedi.';

  @override
  String get importFailedInvalidLirc =>
      'İçe aktarma başarısız: geçersiz LIRC dosyası (geçerli kod veya ham kod bulunamadı).';

  @override
  String get importedOneRemoteFromLirc =>
      'LIRC yapılandırmasından 1 kumanda içe aktarıldı. Makrolar değiştirilmedi.';

  @override
  String get unsupportedFileTypeSelected =>
      'Desteklenmeyen dosya türü seçildi.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'İçe aktarma başarısız: geçersiz veya okunamayan dosya.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Toplu içe aktarma tamamlandı: klasörde desteklenen dosya bulunamadı.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Toplu içe aktarma tamamlandı: hiç kumanda içe aktarılmadı. $skippedCount dosya atlandı.';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Toplu içe aktarma tamamlandı: $supportedCount desteklenen dosyadan $importedCount kumanda içe aktarıldı. $skippedCount dosya atlandı.';
  }

  @override
  String get storagePermissionDenied => 'Depolama izni reddedildi.';

  @override
  String get bulkImportFailedReadFolder =>
      'Toplu içe aktarma başarısız: unable to read klasör contents.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Toplu içe aktarma tamamlandı: desteklenen dosya bulunamadı ($sourceLabel).';
  }

  @override
  String get clearAction => 'Temizle';

  @override
  String get saveAction => 'Kaydet';

  @override
  String buttonsTitleCount(int count) {
    return 'Düğmeler ($count)';
  }

  @override
  String get invalidStepEncountered => 'Geçersiz adımla karşılaşıldı';

  @override
  String failedToSendNamed(Object name) {
    return 'Başarısız to gönder: $name';
  }

  @override
  String get buttonNotFound => 'Düğme bulunamadı';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Düğme bulunamadı: $name';
  }

  @override
  String get unknownButton => 'Bilinmeyen Düğme';

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
  String get orientationFlippedTooltip => 'Yön: ters (dokun to normal)';

  @override
  String get orientationNormalTooltip => 'Yön: normal (dokun to flip)';

  @override
  String get noSteps => 'No steps';

  @override
  String stepProgress(int current, int total) {
    return 'Adım $current / $total';
  }

  @override
  String get completed => 'Completed';

  @override
  String get paused => 'Duraklatıldı';

  @override
  String get running => 'Çalıştırning';

  @override
  String get ready => 'Hazır';

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
      'Sonraki adım için hazır olduğunuzda Devam Et\'e dokunun';

  @override
  String get error => 'Hata';

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
    return '$ms ms bekle';
  }

  @override
  String get runAgain => 'Tekrar çalıştır';

  @override
  String get startMacro => 'Başlat Macro';

  @override
  String get continueAction => 'Devam et';

  @override
  String get unnamedRemote => 'Unnamed Kumanda';

  @override
  String get enterMacroName => 'Girin a macro name';

  @override
  String get addAtLeastOneStep => 'En az bir adım ekleyin';

  @override
  String get fixInvalidSteps => 'Fix geçersiz steps';

  @override
  String get unknownCommand => 'Bilinmeyen Komut';

  @override
  String get unnamedCommand => 'Adsız Komut';

  @override
  String get iconCommand => 'Simge Komutu';

  @override
  String get selectDelay => 'Seç Delay';

  @override
  String keepMilliseconds(int ms) {
    return 'Koru: $ms ms';
  }

  @override
  String get custom => 'Özel';

  @override
  String get enterCustomDelayDuration => 'Özel gecikme süresi girin';

  @override
  String millisecondsLong(int ms) {
    return '$ms milliseconds';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds second$plural';
  }

  @override
  String get customDelay => 'Özel Delay';

  @override
  String get delayMillisecondsLabel => 'Delay (milliseconds)';

  @override
  String get delayMillisecondsHint => 'e.g., 3000';

  @override
  String get recommendedDelayRange => 'Önerilen: çoğu cihaz için 250-5000 ms';

  @override
  String get enterValidPositiveNumber => 'Please enter a valid positive number';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Kumanda';

  @override
  String get macroName => 'Macro Ad';

  @override
  String get macroNameHint => 'ör. i-cybie Gelişmiş Mod';

  @override
  String stepsTitleCount(int count) {
    return 'Steps ($count)';
  }

  @override
  String get noStepsYet => 'No steps yet';

  @override
  String get addCommandsAndDelaysHint =>
      'Dizinizi oluşturmak için aşağıya komutlar ve gecikmeler ekleyin';

  @override
  String get addStep => 'Adım ekle';

  @override
  String get reorderStepsHint =>
      'İpucu: Adımları yeniden sıralamak için tutamacı sürükleyin. Düzenlemek için bir adıma dokunun.';

  @override
  String reorderStep(int index) {
    return '$index. adımı yeniden sırala';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Adım sırasını değiştirmek için basılı tutup sürükleyin';

  @override
  String deleteStep(int index) {
    return '$index. adımı sil';
  }

  @override
  String get invalidStepTapToFix => 'Geçersiz adım — düzeltmek için dokunun';

  @override
  String get sendIrCommand => 'IR komutu gönder';

  @override
  String get waitForUserConfirmation => 'Kullanıcı onayı bekle';

  @override
  String get notImplemented => 'Henüz uygulanmadı';

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
  String get iconButton => 'Icon düğme';

  @override
  String get imageButton => 'Resim düğme';

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
  String get idle => 'Idle';

  @override
  String get start => 'Başlat';

  @override
  String get resume => 'Sürdür';

  @override
  String get pause => 'Duraklat';

  @override
  String get stopped => 'Durduruldu';

  @override
  String get copy => 'Kopyala';

  @override
  String get send => 'Gönder';

  @override
  String get step => 'Adım';

  @override
  String get addToRemote => 'Ekle to kumanda';

  @override
  String get noDescriptionAvailable => 'No description mevcut.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Kaseikyo üretici must be exactly 4 hex digits.';

  @override
  String get irFinderDatabaseNotReady => 'Veritabanı henüz hazır değil.';

  @override
  String get irFinderSelectBrandFirst => 'Seç a marka first in Kurulum.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Bu protokol için kaba kuvvet henüz kullanılamıyor.';

  @override
  String get irFinderInvalidPrefix => 'Invalid prefix.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Marka: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Model: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Tuş: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Kumanda #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Filtrelenmiş ve sıralı veritabanı sonuçları içinde 0 tabanlı bir dizin girin.';

  @override
  String get irFinderJumpCursorHelper =>
      'Kaba kuvvet alanında 0 tabanlı bir hex imleci girin.';

  @override
  String get irFinderSetupTab => 'Kurulum';

  @override
  String get irFinderTestTab => 'Test';

  @override
  String get irFinderResultsTab => 'Sonuçlar';

  @override
  String get irFinderContinueToTest => 'Teste devam et';

  @override
  String get irFinderKaseikyoVendorTitle => 'Kaseikyo Üretici';

  @override
  String get irFinderCustomVendorLabel => 'Özel üretici (4 hex)';

  @override
  String get irFinderBrowseDbCandidates => 'DB adaylarına göz at…';

  @override
  String get irFinderEditSetup => 'Kurulumu düzenle';

  @override
  String get irFinderNoSavedHits =>
      'Henüz kayıtlı eşleşme yok. Cihaz yanıt verdiğinde Test sayfasında \"Eşleşmeyi kaydet\"e basın.';

  @override
  String get irFinderBackToTest => 'Teste dön';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Geniş arama alanı';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Bu kaba kuvvet alanı çok büyük ($human olasılık). IR Finder yine de azami deneme ve bekleme sürenize uyar, ancak IR cihazlarını spamlememeye dikkat edin.\n\nÖneri: önce Veritabanı modunu kullanın ve/veya alanı azaltmak için bilinen önek baytlarını girin.';
  }

  @override
  String get irFinderDatabaseSession => 'Veritabanı oturumu';

  @override
  String get irFinderBruteforceSession => 'Kaba kuvvet oturumu';

  @override
  String get irFinderResumeLastSession => 'Son oturumu sürdür';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Marka: $brand · Model: $model';
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
  String get irFinderApplyResume => 'Apply & Sürdür';

  @override
  String get irFinderBruteforceMode => 'Kaba kuvvet';

  @override
  String get irFinderDatabaseAssistedMode => 'Veritabanı-assisted';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Protokol: $name';
  }

  @override
  String get irFinderProtocolLabel => 'IR protokolü';

  @override
  String get irFinderProtocolHelper =>
      'Kodlamayı ve dolayısıyla arama alanını kontrol eder.';

  @override
  String get irFinderKnownPrefixLabel =>
      'Bilinen önek (hex bayt, isteğe bağlı)';

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
      'Arama alanını daraltmak için bilinen ilk baytları girin.';

  @override
  String get irFinderDatabaseMode => 'Veritabanı';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Normalized prefix: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Normalized prefix';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Bu protokol için kaba kuvvet henüz yapılandırılmadı.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Tümü ($value)';
  }

  @override
  String get irFinderTestControls => 'Test kontrolleri';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Yük uzunluğu: $digits hex hane.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Arama alanı: $value olasılık (önek kısıtlarından sonra).';
  }

  @override
  String get irFinderCooldownMs => 'Cooldown (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Max attempts (per run)';

  @override
  String get irFinderTestAllCombinations => 'Tüm kombinasyonları test et';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Arama alanı tükenene kadar çalışır. Etkin sınır: $value';
  }

  @override
  String get irFinderAttempts => 'Attempts';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Kaydırıcı aralığı: 1–$max (daha büyük değerler için istediğiniz sayıyı yazın)';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Max\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Bu çalıştırmada etkin sınır: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'İpucu: Önce Veritabanı modunu kullanın; kaba kuvvet en iyi bilinen bir önekle çalışır (örneğin ilk 1–4 bayt).';

  @override
  String get irFinderDatabaseInitFailed => 'Veritabanı başlatma başarısız.';

  @override
  String get irFinderPreparingDatabase =>
      'Yerel IR kod veritabanı hazırlanıyor…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Veritabanı-assisted arama';

  @override
  String get irFinderBrand => 'Marka';

  @override
  String get irFinderSelectBrand => 'Seç marka';

  @override
  String get irFinderModelOptional => 'Model (isteğe bağlı)';

  @override
  String get irFinderSelectBrandFirstShort => 'Seç a marka first';

  @override
  String get irFinderSelectModelRecommended => 'Bir model seçin (önerilen)';

  @override
  String get irFinderOnlySelectedProtocol => 'Yalnızca seçili protokol';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Tuşları seçili protokole göre filtreler. Tüm protokollere göz atmak için bunu kapatın.';

  @override
  String get irFinderQuickWinsFirst => 'Önce hızlı kazanımlar';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Daha derin tuşlardan önce POWER, MUTE, VOL ve CH tarzı tuşlara öncelik verir.';

  @override
  String get irFinderMaxKeysPerRun => 'Çalıştırma başına azami tuş testi';

  @override
  String get irFinderTesting => 'Test ediliyor…';

  @override
  String get irFinderCooldown => 'Cooldown';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'Mod';

  @override
  String get irFinderRetryLast => 'Yeniden dene last';

  @override
  String get irFinderTrigger => 'Trigger';

  @override
  String get irFinderJump => 'Atla…';

  @override
  String get irFinderSaveHit => 'Kaydet eşleşme';

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
    return 'Last attempted kod: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Son denenen kodu görmek için testi başlatın.';

  @override
  String irFinderFromDb(Object value) {
    return 'Veritabanından: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'Kaba kuvvetten (protokol kodlayıcı tarafından üretildi).';

  @override
  String irFinderSendError(Object error) {
    return 'Gönder hata: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Source: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Sonuçlar hemen Test ve Kopyala işlemlerini destekler. Düzenleyici akışında doğrudan kumandaya ekleme daha da genişletilebilir.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Göz at DB candidates';

  @override
  String get irFinderFilterByLabelOrHex => 'Filter by label or hex…';

  @override
  String get irFinderJumpHere => 'Atla here';

  @override
  String get irFinderSelectModel => 'Model seç';

  @override
  String get irFinderSearchBrands => 'Ara brands…';

  @override
  String get irFinderSearchModels => 'Ara models…';

  @override
  String get iconPickerTitle => 'Seç Icon';

  @override
  String get iconPickerSearchHint => 'Ara icons...';

  @override
  String get iconPickerNoIconsFound => 'Simge bulunamadı';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count icons mevcut';
  }

  @override
  String get iconPickerCategoryAll => 'Tümü';

  @override
  String get iconPickerCategoryMedia => 'Medya';

  @override
  String get iconPickerCategoryVolume => 'Ses';

  @override
  String get iconPickerCategoryNavigation => 'Navigation';

  @override
  String get iconPickerCategoryPower => 'Güç';

  @override
  String get iconPickerCategoryNumbers => 'Sayılar';

  @override
  String get iconPickerCategorySettings => 'Ayarlar';

  @override
  String get iconPickerCategoryDisplay => 'Ekran';

  @override
  String get iconPickerCategoryInput => 'Giriş';

  @override
  String get iconPickerCategoryFavorite => 'Favori';

  @override
  String get universalPowerTitle => 'Universal Güç';

  @override
  String get universalPowerRunTab => 'Çalıştır';

  @override
  String get universalPowerUseResponsibly => 'Sorumlu kullanın';

  @override
  String get universalPowerConsentBody =>
      'Evrensel Güç, IR güç kodlarını döngüye alır. Bunu yalnızca sahip olduğunuz veya kontrol ettiğiniz cihazlarda kullanın. Cihaz yanıt verir vermez durdurun.';

  @override
  String get universalPowerConsentCheckbox =>
      'Cihazın sahibiyim veya kontrol ediyorum';

  @override
  String get universalPowerSetupBody =>
      'Seçili markanız için güç kodlarını döngüye alır. Cihaz yanıt verir vermez durdurun.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Son gönderilen: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Güç kodu bulunamadı. Aramayı genişletmeyi deneyin.';

  @override
  String get universalPowerUnableToStart => 'Başlatılamıyor.';

  @override
  String get universalPowerAllBrands => 'Tüm markalar (filtresiz)';

  @override
  String get universalPowerClearBrandFilter => 'Marka filtresini temizle';

  @override
  String get universalPowerBroadenSearch => 'Gerekirse aramayı genişletin';

  @override
  String get universalPowerBroadenSearchHint =>
      'Güç etiketleri bulunamazsa diğer tuşları da dahil edin.';

  @override
  String get universalPowerAdditionalPatternsDepth => 'Ek desen derinliği';

  @override
  String get universalPowerDepth1 => 'Yalnızca öncelik: POWER/OFF';

  @override
  String get universalPowerDepth2 => 'POWER takma adlarını dahil et';

  @override
  String get universalPowerDepth3 => 'İkincil güç etiketlerini dahil et';

  @override
  String get universalPowerDepth4 =>
      'Tüm etiketleri dahil et (en düşük öncelik)';

  @override
  String get universalPowerLoopUntilStopped => 'Durdurulana kadar döngü';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Kuyruğu siz durdurana kadar döngüde tutar.';

  @override
  String get universalPowerDelayBetweenCodes => 'Delay between codes';

  @override
  String get universalPowerStart => 'Başlat Universal Güç';

  @override
  String get universalPowerRunStatus => 'Çalıştır status';

  @override
  String universalPowerProgress(Object value) {
    return 'Progress: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Uygulama arka plana alındığı için duraklatıldı.';

  @override
  String get universalPowerSendOneCode => 'Gönder one kod';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Cihaz yanıt verir vermez durdurun.';

  @override
  String get iconNamePlay => 'Oynat';

  @override
  String get iconNamePause => 'Duraklat';

  @override
  String get iconNameStop => 'Durdur';

  @override
  String get iconNameFastForward => 'Fast Forward';

  @override
  String get iconNameRewind => 'Rewind';

  @override
  String get iconNameSkipNext => 'Skip Sonraki';

  @override
  String get iconNameSkipPrevious => 'Skip Önceki';

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
  String get iconNameRecord => 'Kayıt';

  @override
  String get iconNameRecordAlt => 'Kayıt Alt';

  @override
  String get iconNameEject => 'Eject';

  @override
  String get iconNameShuffle => 'Shuffle';

  @override
  String get iconNameRepeat => 'Repeat';

  @override
  String get iconNameRepeatOne => 'Repeat Bir';

  @override
  String get iconNameVolumeUp => 'Ses Yukarı';

  @override
  String get iconNameVolumeDown => 'Ses Aşağı';

  @override
  String get iconNameVolumeOff => 'Ses Kapalı';

  @override
  String get iconNameMute => 'Sessiz';

  @override
  String get iconNameSpeaker => 'Hoparlör';

  @override
  String get iconNameSurroundSound => 'Surround Sound';

  @override
  String get iconNameEqualizer => 'Equalizer';

  @override
  String get iconNameAudio => 'Ses';

  @override
  String get iconNameMicrophone => 'Microphone';

  @override
  String get iconNameMicOff => 'Mic Kapalı';

  @override
  String get iconNameUp => 'Yukarı';

  @override
  String get iconNameDown => 'Aşağı';

  @override
  String get iconNameLeft => 'Sol';

  @override
  String get iconNameRight => 'Sağ';

  @override
  String get iconNameArrowUp => 'Ok Yukarı';

  @override
  String get iconNameArrowDown => 'Ok Aşağı';

  @override
  String get iconNameArrowLeft => 'Ok Sol';

  @override
  String get iconNameArrowRight => 'Ok Sağ';

  @override
  String get iconNameNavigation => 'Navigation';

  @override
  String get iconNameChevronLeft => 'Chevron Sol';

  @override
  String get iconNameChevronRight => 'Chevron Sağ';

  @override
  String get iconNameExpandLess => 'Expand Less';

  @override
  String get iconNameExpandMore => 'Expand Daha';

  @override
  String get iconNameCollapse => 'Collapse';

  @override
  String get iconNameExpand => 'Expand';

  @override
  String get iconNameCircleUp => 'Circle Yukarı';

  @override
  String get iconNameCircleDown => 'Circle Aşağı';

  @override
  String get iconNameCircleLeft => 'Circle Sol';

  @override
  String get iconNameCircleRight => 'Circle Sağ';

  @override
  String get iconNameOkSelect => 'OK/Seç';

  @override
  String get iconNameConfirm => 'Confirm';

  @override
  String get iconNameCancel => 'İptal';

  @override
  String get iconNameClose => 'Kapat';

  @override
  String get iconNameHome => 'Ana Sayfa';

  @override
  String get iconNameReturn => 'Return';

  @override
  String get iconNameExit => 'Exit';

  @override
  String get iconNameUndo => 'Undo';

  @override
  String get iconNameRedo => 'Redo';

  @override
  String get iconNamePower => 'Güç';

  @override
  String get iconNamePowerAlt => 'Güç Alt';

  @override
  String get iconNamePowerOff => 'Güç Kapalı';

  @override
  String get iconNameOn => 'On';

  @override
  String get iconNameOff => 'Kapalı';

  @override
  String get iconNameToggleOn => 'Toggle On';

  @override
  String get iconNameToggleOff => 'Toggle Kapalı';

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
  String get iconNameOne => 'Bir';

  @override
  String get iconNameTwo => 'İki';

  @override
  String get iconNameThree => 'Üç';

  @override
  String get iconNameFour => 'Dört';

  @override
  String get iconNameFive => 'Beş';

  @override
  String get iconNameSix => 'Altı';

  @override
  String get iconNamePlus => 'Artı';

  @override
  String get iconNameMinus => 'Eksi';

  @override
  String get iconNameAddCircle => 'Ekle Circle';

  @override
  String get iconNameRemoveCircle => 'Kaldır Circle';

  @override
  String get iconNameSettings => 'Ayarlar';

  @override
  String get iconNameMenu => 'Menü';

  @override
  String get iconNameMoreVertical => 'Daha Dikey';

  @override
  String get iconNameMoreHorizontal => 'Daha Horizontal';

  @override
  String get iconNameTune => 'Tune';

  @override
  String get iconNameRemoteSettings => 'Kumanda Ayarlar';

  @override
  String get iconNameInfo => 'Bilgi';

  @override
  String get iconNameInfoOutline => 'Bilgi Çizgi';

  @override
  String get iconNameHelp => 'Help';

  @override
  String get iconNameHelpOutline => 'Help Çizgi';

  @override
  String get iconNameList => 'Liste';

  @override
  String get iconNameViewList => 'Liste Görünümü';

  @override
  String get iconNameViewGrid => 'Görünüm Izgara';

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
  String get iconNameBrightnessHigh => 'Brightness Yüksek';

  @override
  String get iconNameBrightnessMedium => 'Brightness Medium';

  @override
  String get iconNameBrightnessLow => 'Brightness Düşük';

  @override
  String get iconNameAutoBrightness => 'Otomatik Brightness';

  @override
  String get iconNameLightMode => 'Açık Mod';

  @override
  String get iconNameDarkMode => 'Koyu Mod';

  @override
  String get iconNameContrast => 'Contrast';

  @override
  String get iconNameHdrOn => 'HDR On';

  @override
  String get iconNameHdrOff => 'HDR Kapalı';

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
  String get iconNameFitScreen => 'Ekrana Sığdır';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'Crop Free';

  @override
  String get iconNameInput => 'Giriş';

  @override
  String get iconNameCable => 'Cable';

  @override
  String get iconNameCast => 'Cast';

  @override
  String get iconNameCastConnected => 'Yayın Bağlı';

  @override
  String get iconNameScreenShare => 'Ekran Paylaş';

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
  String get iconNameMedia => 'Medya';

  @override
  String get iconNameMusicQueue => 'Müzik Queue';

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
  String get iconNameFavorite => 'Favori';

  @override
  String get iconNameFavoriteOutline => 'Favori Çizgi';

  @override
  String get iconNameStar => 'Star';

  @override
  String get iconNameStarOutline => 'Star Çizgi';

  @override
  String get iconNameBookmark => 'Bookmark';

  @override
  String get iconNameBookmarkOutline => 'Bookmark Çizgi';

  @override
  String get iconNameFlag => 'Flag';

  @override
  String get iconNameCheck => 'Check';

  @override
  String get iconNameDone => 'Done';

  @override
  String get iconNameDoneAll => 'Tümü Bitti';

  @override
  String get iconNameSchedule => 'Zamanla';

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
  String get iconNameLight => 'Işık';

  @override
  String get iconNameLightOutline => 'Işık Çizgi';

  @override
  String get iconNameWarmLight => 'Sıcak Işık';

  @override
  String get iconNameSunny => 'Sunny';

  @override
  String get iconNameCloudy => 'Bulutlu';

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
  String get iconNameSearch => 'Ara';

  @override
  String get iconNameRefresh => 'Yenile';

  @override
  String get iconNameSync => 'Eşitle';

  @override
  String get iconNameUpdate => 'Güncelle';

  @override
  String get iconNameDownload => 'İndir';

  @override
  String get iconNameUpload => 'Yükle';

  @override
  String get iconNameCloud => 'Bulut';

  @override
  String get iconNameFolder => 'Klasör';

  @override
  String get iconNameDelete => 'Sil';

  @override
  String get iconNameEdit => 'Düzenle';

  @override
  String get iconNameSave => 'Kaydet';

  @override
  String get iconNameShare => 'Paylaş';

  @override
  String get iconNamePrint => 'Yazdır';

  @override
  String get iconNameLanguage => 'Dil';

  @override
  String get iconNameTranslate => 'Çevir';

  @override
  String get iconNameMicNone => 'Mic None';

  @override
  String get iconNameSubtitles => 'Altyazılar';

  @override
  String get iconNameClosedCaption => 'Closed Caption';

  @override
  String get iconNameMusic => 'Müzik';

  @override
  String get iconNameMovie => 'Movie';

  @override
  String get iconNameTheater => 'Theater';

  @override
  String get iconNameLiveTv => 'Live TV';

  @override
  String get iconNameRadio => 'Radio';

  @override
  String get iconNameCamera => 'Kamera';

  @override
  String get iconNameVideoCamera => 'Video Kamera';

  @override
  String get iconNamePhotoCamera => 'Photo Kamera';

  @override
  String get iconNameSlowMotion => 'Slow Motion';

  @override
  String get iconNameSpeed => 'Speed';

  @override
  String get iconNameVideoSettings => 'Video Ayarlar';

  @override
  String get iconNameAudioTrack => 'Ses Track';

  @override
  String get iconNameGraphicEq => 'Graphic EQ';

  @override
  String get iconNameMusicVideo => 'Müzik Video';

  @override
  String get iconNamePlaylist => 'Çalma Listesi';

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
  String get iconNameNotEqualFa => 'Eşit Değil ≠ FA';

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
  String get iconNamePlayFa => 'Oynat FA';

  @override
  String get iconNamePauseFa => 'Duraklat FA';

  @override
  String get iconNameStopFa => 'Durdur FA';

  @override
  String get iconNamePlayFaOutline => 'Oynat FA Çizgi';

  @override
  String get iconNamePauseFaOutline => 'Duraklat FA Çizgi';

  @override
  String get iconNameStopFaOutline => 'Durdur FA Çizgi';

  @override
  String get iconNameBackwardFa => 'Backward FA';

  @override
  String get iconNameForwardFa => 'İleri FA';

  @override
  String get iconNamePreviousFa => 'Önceki FA';

  @override
  String get iconNameNextFa => 'Sonraki FA';

  @override
  String get iconNameRewindFa => 'Geri Sar FA';

  @override
  String get iconNameFastForwardFa => 'Hızlı İleri FA';

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
  String get iconNameMusicFa => 'Müzik FA';

  @override
  String get iconNameMicrophoneFa => 'Microphone FA';

  @override
  String get iconNameCameraFa => 'Kamera FA';

  @override
  String get iconNameCameraRetroFa => 'Kamera Retro FA';

  @override
  String get iconNameVolumeHighFa => 'Ses Yüksek FA';

  @override
  String get iconNameVolumeLowFa => 'Ses Düşük FA';

  @override
  String get iconNameVolumeOffFa => 'Ses Kapalı FA';

  @override
  String get iconNameMuteFa => 'Sessiz FA';

  @override
  String get iconNameMicMuteFa => 'Mikrofon Sessiz FA';

  @override
  String get iconNameHeadphonesFa => 'Kulaklık FA';

  @override
  String get iconNameSpeakerFa => 'Hoparlör FA';

  @override
  String get iconNameUpFa => 'Yukarı FA';

  @override
  String get iconNameDownFa => 'Aşağı FA';

  @override
  String get iconNameLeftFa => 'Sol FA';

  @override
  String get iconNameRightFa => 'Sağ FA';

  @override
  String get iconNameUpFaOutline => 'Yukarı FA Çizgi';

  @override
  String get iconNameDownFaOutline => 'Aşağı FA Çizgi';

  @override
  String get iconNameLeftFaOutline => 'Sol FA Çizgi';

  @override
  String get iconNameRightFaOutline => 'Sağ FA Çizgi';

  @override
  String get iconNameArrowUpFa => 'Ok Yukarı FA';

  @override
  String get iconNameArrowDownFa => 'Ok Aşağı FA';

  @override
  String get iconNameArrowLeftFa => 'Ok Sol FA';

  @override
  String get iconNameArrowRightFa => 'Ok Sağ FA';

  @override
  String get iconNameChevronUpFa => 'Chevron Yukarı FA';

  @override
  String get iconNameChevronDownFa => 'Chevron Aşağı FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron Sol FA';

  @override
  String get iconNameChevronRightFa => 'Chevron Sağ FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Çizgi';

  @override
  String get iconNameCheckFa => 'Check FA';

  @override
  String get iconNameCloseFa => 'Close FA';

  @override
  String get iconNameCloseCircleFa => 'Close Daire FA';

  @override
  String get iconNameHomeFa => 'Ana Sayfa FA';

  @override
  String get iconNameUndoFa => 'Undo FA';

  @override
  String get iconNameRedoFa => 'Redo FA';

  @override
  String get iconNameRotateFa => 'Rotate FA';

  @override
  String get iconNameSearchFa => 'Ara FA';

  @override
  String get iconNameRefreshFa => 'Yenile FA';

  @override
  String get iconNamePowerOffFa => 'Güç Kapalı FA';

  @override
  String get iconNamePlugFa => 'Plug FA';

  @override
  String get iconNameToggleOnFa => 'Toggle On FA';

  @override
  String get iconNameToggleOffFa => 'Toggle Kapalı FA';

  @override
  String get iconNameSettingsFa => 'Ayarlar FA';

  @override
  String get iconNameSettingsAltFa => 'Ayarlar Alt FA';

  @override
  String get iconNameMenuFa => 'Menü FA';

  @override
  String get iconNameMoreFa => 'Daha FA';

  @override
  String get iconNameMoreVerticalFa => 'Daha Dikey FA';

  @override
  String get iconNameInfoFa => 'Info FA';

  @override
  String get iconNameInfoFaOutline => 'Info FA Çizgi';

  @override
  String get iconNameHelpFa => 'Help FA';

  @override
  String get iconNameHelpFaOutline => 'Help FA Çizgi';

  @override
  String get iconNameListFa => 'Liste FA';

  @override
  String get iconNameGridFa => 'Izgara FA';

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
  String get iconNameNightModeFa => 'Gece Modu FA';

  @override
  String get iconNameLightFa => 'Işık FA';

  @override
  String get iconNameLightFaOutline => 'Işık FA Çizgi';

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
  String get iconNameSubtitlesFa => 'Altyazılar FA';

  @override
  String get iconNamePictureInPictureFa => 'Picture in Picture FA';

  @override
  String get iconNameColorFa => 'Color FA';

  @override
  String get iconNamePaintFa => 'Paint FA';

  @override
  String get iconNameInputFa => 'Giriş FA';

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
  String get iconNameCloudFa => 'Bulut FA';

  @override
  String get iconNameStarFa => 'Star FA';

  @override
  String get iconNameStarFaOutline => 'Star FA Çizgi';

  @override
  String get iconNameHeartFa => 'Heart FA';

  @override
  String get iconNameHeartFaOutline => 'Heart FA Çizgi';

  @override
  String get iconNameBookmarkFa => 'Bookmark FA';

  @override
  String get iconNameBookmarkFaOutline => 'Bookmark FA Çizgi';

  @override
  String get iconNameFlagFa => 'Flag FA';

  @override
  String get iconNameClockFa => 'Clock FA';

  @override
  String get iconNameClockFaOutline => 'Clock FA Çizgi';

  @override
  String get iconNameBellFa => 'Bell FA';

  @override
  String get iconNameBellFaOutline => 'Bell FA Çizgi';

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
  String get iconNameVideoFileFa => 'Video Dosyası FA';

  @override
  String get iconNameAudioFileFa => 'Ses Dosyası FA';

  @override
  String get iconNamePlayOutlineFa => 'Oynat Çizgi FA';

  @override
  String get iconNamePlaySimpleFa => 'Oynat Basit FA';

  @override
  String get iconNamePauseSimpleFa => 'Duraklat Basit FA';

  @override
  String get iconNameStopSimpleFa => 'Durdur Basit FA';

  @override
  String get iconNameRecordFa => 'Kayıt FA';

  @override
  String get iconNameStopCircleFa => 'Durdur Daire FA';

  @override
  String get iconNameLoadingFa => 'Yükleniyor FA';

  @override
  String get iconNameTextFa => 'Metin FA';

  @override
  String get iconNameTextSizeFa => 'Metin Boyut FA';

  @override
  String get iconNameLanguageFa => 'Dil FA';

  @override
  String get iconNameGlobeFa => 'Küre FA';

  @override
  String get iconNameSubtitlesAltFa => 'Altyazılar Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Altyazılar Alt Çizgi FA';

  @override
  String get iconNameChannelUpFa => 'Kanal Yukarı FA';

  @override
  String get iconNameChannelDownFa => 'Kanal Aşağı FA';

  @override
  String get iconNamePageUpFa => 'Sayfa Yukarı FA';

  @override
  String get iconNamePageDownFa => 'Sayfa Aşağı FA';

  @override
  String get iconNameGuideFa => 'Kılavuz FA';

  @override
  String get iconNameGridViewFa => 'Izgara Görünüm FA';

  @override
  String get iconNameGridAltFa => 'Izgara Alt FA';

  @override
  String get iconNameScheduleFa => 'Zamanla FA';

  @override
  String get iconNameCalendarFa => 'Takvim FA';

  @override
  String get iconNameRedButtonFa => 'Kırmızı Düğme FA';

  @override
  String get iconNameButtonOutlineFa => 'Düğme Çizgi FA';

  @override
  String get iconNameSquareButtonFa => 'Kare Düğme FA';

  @override
  String get iconNameSquareOutlineFa => 'Kare Çizgi FA';

  @override
  String get iconNameDotCircleFa => 'Dot Daire FA';

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
  String get iconNameSortDownFa => 'Sort Aşağı FA';

  @override
  String get iconNameSortUpFa => 'Sort Yukarı FA';

  @override
  String get iconNameSleepFa => 'Sleep FA';

  @override
  String get iconNameTimerStartFa => 'Timer Start FA';

  @override
  String get iconNameTimerHalfFa => 'Timer Half FA';

  @override
  String get iconNameTimerEndFa => 'Timer End FA';

  @override
  String get iconNameStopwatchFa => 'Kronometre FA';

  @override
  String get iconNameAlarmFa => 'Alarm FA';

  @override
  String get iconNameCropAltFa => 'Crop Alt FA';

  @override
  String get iconNameCropFa => 'Crop FA';

  @override
  String get iconNameSquareFullFa => 'Kare Full FA';

  @override
  String get iconNameFullscreenAltFa => 'Fullscreen Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Zoom Artı FA';

  @override
  String get iconNameZoomMinusFa => 'Zoom Eksi FA';

  @override
  String get iconNameMusicNoteFa => 'Müzik Note FA';

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
  String get iconNameChildModeFa => 'Çocuk Modu FA';

  @override
  String get iconNameCastFa => 'Cast FA';

  @override
  String get iconNameStreamFa => 'Stream FA';

  @override
  String get iconNameSignalFa => 'Signal FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => 'Daire Ok Yukarı FA';

  @override
  String get iconNameCircleArrowDownFa => 'Daire Ok Aşağı FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Daire Ok Sol FA';

  @override
  String get iconNameCircleArrowRightFa => 'Daire Ok Sağ FA';

  @override
  String get iconNameLongArrowUpFa => 'Long Ok Yukarı FA';

  @override
  String get iconNameLongArrowDownFa => 'Long Ok Aşağı FA';

  @override
  String get iconNameLongArrowLeftFa => 'Long Ok Sol FA';

  @override
  String get iconNameLongArrowRightFa => 'Long Ok Sağ FA';

  @override
  String get iconNamePlusFa => 'Artı FA';

  @override
  String get iconNameMinusFa => 'Eksi FA';

  @override
  String get iconNamePlusCircleFa => 'Artı Daire FA';

  @override
  String get iconNameMinusCircleFa => 'Eksi Daire FA';

  @override
  String get iconNamePlusSquareFa => 'Artı Kare FA';

  @override
  String get iconNameMinusSquareFa => 'Eksi Kare FA';

  @override
  String get iconNameTimesFa => 'Times FA';

  @override
  String get iconNameTimesCircleFa => 'Times Daire FA';

  @override
  String get iconNameBatteryFullFa => 'Pil Dolu FA';

  @override
  String get iconNameBattery34Fa => 'Pil 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'Pil Yarım FA';

  @override
  String get iconNameBattery14Fa => 'Pil 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'Pil Boş FA';

  @override
  String get iconNameChargingFa => 'Charging FA';

  @override
  String get iconNameCloudSunFa => 'Bulut Sun FA';

  @override
  String get iconNameCloudMoonFa => 'Bulut Moon FA';

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
  String get unknownLabel => 'Bilinmeyen';

  @override
  String get selectedFilesLabel => 'seçili dosya(lar)';

  @override
  String get folderNotFoundOrInaccessible =>
      'Klasör bulunamadı veya erişilemiyor.';

  @override
  String get importedRemoteDefaultName => 'İçeAktarılanKumanda';

  @override
  String get demoRemoteName => 'Demo Kumanda';

  @override
  String get protocolFieldsInvalid =>
      'Gerekli protokol alanlarını doldurun ve ayarlıysa frekansın 15k–60k olduğundan emin olun.';

  @override
  String get unknownProtocolSelected => 'Bilinmeyen protokol seçildi.';

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
  String get learningModeCaptureFailed => 'Yakalamayı öğrenme başarısız oldu.';

  @override
  String get learningModeReplaySent => 'Öğrenilen sinyal tekrarlandı.';

  @override
  String get learningModeReplayFailed =>
      'Öğrenilen sinyal tekrar oynatılamadı.';

  @override
  String get learningModeNoRemotesAvailable =>
      'Henüz kayıtlı uzaktan kumanda yok.';

  @override
  String get learningModeChooseRemoteTitle => 'Bir uzaktan kumanda seçin';

  @override
  String get learningModeNewRemoteTitle => 'Yeni bir uzaktan kumanda oluştur';

  @override
  String get learningModeSaveSuccess => 'Öğrenilen düğme kaydedildi.';

  @override
  String get learningModeSaveFailed => 'Öğrenilen düğme kaydedilemedi.';

  @override
  String get remoteSetupIntro =>
      'Önce bir ad ve düzen seçin. Düğmeleri daha sonra ekleyebilirsiniz.';

  @override
  String get startWithDefault => 'Varsayılanla başla';

  @override
  String get browseGithubStore => 'GitHub Store\'u aç';

  @override
  String get addFirstButton => 'İlk düğmeyi ekle';

  @override
  String get moreWaysToStart => 'Başlamanın diğer yolları';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Bu yeni kumanda kurulumunu silip bu ekrandan çıkmak istiyor musunuz?';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Kumanda değişikliklerini silip bu ekrandan çıkmak istiyor musunuz?';

  @override
  String get firstButtonAdded => 'İlk düğme eklendi.';

  @override
  String get iconColorTitle => 'Simge rengi';

  @override
  String get iconColorHelper =>
      'Düğme arka planında görünür kalacak bir simge rengi seçin.';

  @override
  String get colorRed => 'Kırmızı';

  @override
  String get colorPink => 'Pembe';

  @override
  String get colorPurple => 'Mor';

  @override
  String get colorDeepPurple => 'Koyu mor';

  @override
  String get colorIndigo => 'İndigo';

  @override
  String get colorBlue => 'Mavi';

  @override
  String get colorLightBlue => 'Açık mavi';

  @override
  String get colorCyan => 'Camgöbeği';

  @override
  String get colorTeal => 'Mavi-yeşil';

  @override
  String get colorGreen => 'Yeşil';

  @override
  String get colorLightGreen => 'Açık yeşil';

  @override
  String get colorLime => 'Limon';

  @override
  String get colorYellow => 'Sarı';

  @override
  String get colorAmber => 'Kehribar';

  @override
  String get colorOrange => 'Turuncu';

  @override
  String get colorDeepOrange => 'Koyu turuncu';

  @override
  String get colorBrown => 'Kahverengi';

  @override
  String get colorGrey => 'Gri';

  @override
  String get colorBlueGrey => 'Mavi-gri';

  @override
  String get colorBlack => 'Siyah';

  @override
  String get colorWhite => 'Beyaz';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Düğme rengi $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Düğme rengi $colorName, seçili';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Simge rengi $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Simge rengi $colorName, seçili';
  }
}
