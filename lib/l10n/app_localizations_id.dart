// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Memuat…';

  @override
  String get unknownError => 'Galat tidak dikenal';

  @override
  String get failedToStart => 'Gagal memulai';

  @override
  String get retry => 'Coba lagi';

  @override
  String get quickTilePower => 'Daya';

  @override
  String get quickTileMute => 'Bisu';

  @override
  String get quickTileVolumeUp => 'Vol +';

  @override
  String get quickTileVolumeDown => 'Vol -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Ponsel ini tidak memiliki pemancar IR bawaan. Dongle IR USB terdeteksi, tetapi izin belum diberikan.\n\nSetujui dialog izin USB untuk mengaktifkan pengiriman IR.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'Ponsel ini tidak memiliki pemancar IR bawaan. Dongle IR USB terdeteksi, tetapi izin USB ditolak.\n\nMinta izin lagi lalu setujui dialog untuk mengaktifkan pengiriman IR.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'Ponsel ini tidak memiliki pemancar IR bawaan. Dongle IR USB diizinkan, tetapi belum diinisialisasi.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Ponsel ini tidak memiliki pemancar IR bawaan. A USB IR dongle terdeteksi dan diizinkan, tetapi gagal diinisialisasi.\n\nSambungkan ulang dongle lalu coba lagi.';

  @override
  String get homeUsbReadyMessage =>
      'Ponsel ini tidak memiliki pemancar IR bawaan.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Ponsel ini tidak memiliki pemancar IR bawaan, dan tidak ada dongle IR USB yang didukung yang sedang terhubung.\n\nAnda masih bisa membuat, mengimpor, dan mengelola remote, tetapi untuk mengirim sinyal IR Anda memerlukan salah satu opsi di bawah.';

  @override
  String get homeUsbOptionPlugIn =>
      'Sambungkan dongle IR USB yang didukung, lalu setujui izin.';

  @override
  String get homeUsbOptionReady => 'Siap digunakan.';

  @override
  String get homeUsbOptionPermissionRequired => 'Terpasang. Perlu izin.';

  @override
  String get homeUsbOptionPermissionDenied => 'Izin ditolak. Minta lagi.';

  @override
  String get homeUsbOptionPermissionGranted => 'Diizinkan. Memulai dongle.';

  @override
  String get homeUsbOptionOpenFailed => 'Diizinkan, tapi gagal memulai.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Ponsel ini tidak memiliki IR bawaan. Sambungkan dongle IR USB atau aktifkan mode Audio di Setelan.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Dongle USB terdeteksi. Izin diperlukan untuk mengirim IR.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Izin USB ditolak. Minta lagi untuk mengirim IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Dongle USB diizinkan. Menunggu inisialisasi.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Dongle USB diizinkan, tetapi inisialisasi gagal.';

  @override
  String get homeHardwareBannerReady => 'USB siap.';

  @override
  String get homeHardwareRequiredTitle =>
      'Perlu perangkat IR untuk kirim perintah';

  @override
  String get homeUsbDongleRecommended => 'Dongle IR USB (disarankan)';

  @override
  String get homeAudioAdapterAlternative => 'Adaptor IR audio (alternatif)';

  @override
  String get homeAudioAdapterDescription =>
      'Setelan → IR Pemancar → Audio (1 LED / 2 LED). Memerlukan adaptor audio-ke-IR.';

  @override
  String get close => 'Tutup';

  @override
  String get homeChooseTransmitter => 'Pilih pemancar';

  @override
  String get openSettings => 'Buka Setelan';

  @override
  String get homeUsbPermissionSentApprove =>
      'Permintaan izin USB dikirim. Setujui dialog untuk mengaktifkan USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'Tidak ada dongle IR USB yang didukung terdeteksi. Sambungkan lalu coba lagi.';

  @override
  String get homeUsbPermissionRequestFailed => 'Gagal meminta izin USB.';

  @override
  String get working => 'Sedang bekerja…';

  @override
  String get requestUsbPermission => 'Minta izin USB';

  @override
  String get homeHardwareTip =>
      'Tip: Anda masih bisa membuat dan mengatur remote sekarang. Perangkat keras hanya diperlukan saat mengirim.';

  @override
  String get homeNoIrTransmitterTitle => 'Tidak ada pemancar IR';

  @override
  String get homeHardwareRequiredBody =>
      'IR Blaster dapat membuat dan mengelola remote di ponsel apa pun. Namun untuk benar-benar mengirim perintah inframerah, perangkat Anda memerlukan salah satu opsi perangkat keras di bawah ini.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Anda tetap bisa membuat, mengimpor, dan menata remote sekarang juga.';

  @override
  String get homeWaysToUseIrBlaster => 'Cara menggunakan IR Blaster';

  @override
  String get homeBuiltInIrOptionTitle => 'Ponsel dengan IR bawaan';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Berfungsi pada ponsel yang didukung dengan pemancar IR bawaan. Ponsel ini tidak memilikinya.';

  @override
  String get homeBuiltInIrUnavailable => 'Tidak tersedia di ponsel ini';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'Adaptor audio 3,5 mm';

  @override
  String get homeContinueWithoutHardware => 'Lanjutkan tanpa perangkat keras';

  @override
  String get homeHowItWorks => 'Cara kerjanya';

  @override
  String get settingsNavLabel => 'Setelan';

  @override
  String get dismiss => 'Tutup';

  @override
  String get remotesNavLabel => 'Remote';

  @override
  String get macrosNavLabel => 'Makro';

  @override
  String get signalTesterNavLabel => 'Penguji Sinyal';

  @override
  String get settingsTitle => 'Setelan';

  @override
  String get remoteNoIrEmitterTitle => 'Tidak ada IR pemancar';

  @override
  String get remoteNoIrEmitterMessage =>
      'Perangkat ini tidak punya pemancar IR';

  @override
  String get remoteNoIrEmitterNeedsEmitter => 'Aplikasi ini perlu pemancar IR';

  @override
  String get remoteDismiss => 'Tutup';

  @override
  String get remoteClose => 'Tutup';

  @override
  String remoteFailedToSend(Object error) {
    return 'Gagal mengirim IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Gagal memulai loop: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Loop berhenti (gagal kirim): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Mengulang \"$title\". Ketuk Hentikan di bilah atas untuk berhenti.';
  }

  @override
  String get remoteLoopStopped => 'Loop berhenti.';

  @override
  String get remoteUpdatedNotFound =>
      'Remote diperbarui di layar. Remote tidak ditemukan di daftar tersimpan.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Diperbarui \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Gagal menghapus: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'Remote tidak ditemukan di daftar tersimpan.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Dihapus \"$name\".';
  }

  @override
  String get buttonFallbackTitle => 'Tombol';

  @override
  String get imageFallbackTitle => 'Gambar';

  @override
  String get noBrowserAvailable => 'Tidak ada browser';

  @override
  String failedToOpen(Object error) {
    return 'Gagal membuka: $error';
  }

  @override
  String get cancel => 'Batal';

  @override
  String get settingsRestoreDemoTitle => 'Pulihkan remote demo?';

  @override
  String get settingsRestoreDemoMessage =>
      'Ini akan mengganti remote saat ini dengan remote demo bawaan. Cadangan disarankan jika Anda ingin menyimpan daftar saat ini.';

  @override
  String get settingsRestoreDemoConfirm => 'Pulihkan demo';

  @override
  String get settingsDemoRemotesRestored => 'Remote demo dipulihkan.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Hapus semua remote?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Ini menghapus semua remote dari perangkat ini. Tindakan ini tidak bisa dibatalkan.';

  @override
  String get settingsDeleteAllConfirm => 'Hapus semua';

  @override
  String get settingsAllRemotesDeleted => 'Semua remote dihapus.';

  @override
  String get themeAuto => 'Tema Otomatis';

  @override
  String get themeLight => 'Tema Terang';

  @override
  String get themeDark => 'Tema Gelap';

  @override
  String get themeDescAuto => 'Mengikuti setelan perangkat';

  @override
  String get themeDescLight => 'Selalu terang dan jelas';

  @override
  String get themeDescDark => 'Nyaman di mata';

  @override
  String get themeHintAuto =>
      'Tema berubah otomatis saat setelan perangkat berpindah antara mode terang dan gelap';

  @override
  String get themeHintLight => 'Cocok untuk siang hari dan tempat terang';

  @override
  String get themeHintDark =>
      'Mengurangi lelah mata pada kondisi minim cahaya dan menghemat baterai di layar OLED';

  @override
  String get supportDevelopmentTitle => 'Dukung Pengembangan';

  @override
  String get supportDevelopmentSubtitle =>
      'Bantu IR Blaster tetap terawat dan kompatibel';

  @override
  String get supportDevelopmentBody =>
      'Tanpa iklan, tanpa pelacakan, tanpa fitur terkunci. Dukungan Anda membantu pengembangan protokol, dukungan dongle USB, dan kompatibilitas yang lebih baik di berbagai perangkat.';

  @override
  String get donate => 'Donasi';

  @override
  String get starRepo => 'Beri bintang repo';

  @override
  String get repositoryLinkCopied => 'Tautan repo disalin';

  @override
  String get supportPillLocalOnly => 'Hanya lokal';

  @override
  String get supportPillNoTracking => 'Tanpa pelacakan';

  @override
  String get supportPillHardwareAware => 'Sadar perangkat';

  @override
  String get supportPillOpenSource => 'Sumber terbuka';

  @override
  String get appearanceTitle => 'Tampilan';

  @override
  String get appearanceSubtitle => 'Sesuaikan tampilan visual';

  @override
  String get localizationTitle => 'Pelokalan';

  @override
  String get localizationSubtitle => 'Bahasa aplikasi dan perilaku terjemahan';

  @override
  String localizationAutoUsing(Object language) {
    return 'Otomatis: memakai $language';
  }

  @override
  String get localizationAutoDescription =>
      'Aplikasi mengikuti bahasa perangkat bila memungkinkan.';

  @override
  String get localizationManualDescription =>
      'Bahasa aplikasi ditetapkan manual.';

  @override
  String get useSystemLanguageTitle => 'Gunakan bahasa sistem';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Mengikuti bahasa perangkat: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Gunakan bahasa yang dipilih di bawah, bukan default perangkat.';

  @override
  String get chooseAppLanguage => 'Pilih bahasa aplikasi';

  @override
  String get languagePickerDisabledHint =>
      'Matikan bahasa sistem untuk memilih bahasa secara manual.';

  @override
  String get searchLanguages => 'Cari bahasa';

  @override
  String get noLanguagesFound => 'Tidak ada bahasa cocok';

  @override
  String get localizationHint =>
      'Saat bahasa sistem aktif, aplikasi mengikuti lokal perangkat dan kembali ke Inggris jika terjemahan tidak tersedia. Matikan agar aplikasi terkunci ke bahasa tertentu.';

  @override
  String get appLanguageTitle => 'Bahasa aplikasi';

  @override
  String get appLanguageHint =>
      'Otomatis mengikuti bahasa perangkat. Pilih Inggris atau Prancis di sini untuk menimpa hanya di aplikasi.';

  @override
  String get languageAuto => 'Otomatis (sistem)';

  @override
  String get languageAutoDescription =>
      'Ikuti bahasa perangkat secara otomatis';

  @override
  String get languageEnglish => 'Inggris';

  @override
  String get languageEnglishDescription =>
      'Paksa aplikasi selalu pakai Inggris';

  @override
  String get languageFrench => 'Prancis';

  @override
  String get languageFrenchDescription => 'Paksa aplikasi selalu pakai Prancis';

  @override
  String get languageAutoShort => 'Otomatis';

  @override
  String get languageEnglishShort => 'Inggris';

  @override
  String get languageFrenchShort => 'Prancis';

  @override
  String get useDynamicColors => 'Gunakan warna dinamis';

  @override
  String get themeChoiceAuto => 'Otomatis';

  @override
  String get themeChoiceLight => 'Terang';

  @override
  String get themeChoiceDark => 'Gelap';

  @override
  String get irTransmitterTitle => 'Pemancar IR';

  @override
  String get irTransmitterSubtitle => 'Pilih perangkat yang kirim perintah IR';

  @override
  String get learningModeEntryTitle => 'Modus Pembelajaran';

  @override
  String get learningModeEntrySubtitle =>
      'Tangkap tombol dari jarak jauh fisik selangkah demi selangkah';

  @override
  String get learningModeTitle => 'Modus Pembelajaran';

  @override
  String get learningModeHeroTitle =>
      'Pelajari tombol jarak jauh dengan bersih';

  @override
  String get learningModeHeroSubtitle =>
      'Siapkan receiver Anda, siapkan remote asli, ambil satu perintah, lalu tinjau sebelum menyimpannya ke dalam remote.';

  @override
  String get learningModeReadyBadge => 'Penerima sudah siap';

  @override
  String get learningModeNeedsPermissionBadge => 'Izin USB diperlukan';

  @override
  String get learningModeSetupBadge => 'Diperlukan pengaturan penerima';

  @override
  String get learningModeNoReceiverBadge => 'Tidak ada penerima pembelajaran';

  @override
  String get learningModeCheckingBadge => 'Memeriksa perangkat keras';

  @override
  String get learningModeFourStepFlow => 'Aliran terpandu 4 langkah';

  @override
  String get learningModeSaveAnywhereBadge => 'Tinjau sebelum menyimpan';

  @override
  String get learningModeGuideTitle =>
      'Ambil di mana penangkapan harus dilakukan';

  @override
  String get learningModeStepHardwareShort => 'Perangkat keras';

  @override
  String get learningModeStepPrepareShort => 'Mempersiapkan';

  @override
  String get learningModeStepCaptureShort => 'Menangkap';

  @override
  String get learningModeStepReviewShort => 'Tinjauan';

  @override
  String get learningModeStepHardwareTitle =>
      'Periksa perangkat keras penerima';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Pastikan penerima pembelajaran yang kompatibel terpasang dan diotorisasi sebelum memulai.';

  @override
  String get learningModeCurrentSenderLabel => 'Pemancar saat ini';

  @override
  String get learningModeReceiverStatusLabel => 'Status pembelajaran';

  @override
  String get learningModeCheckingHardwareBody =>
      'Memeriksa status pemancar dan penerima USB yang tersedia.';

  @override
  String get learningModeHardwareReadyBody =>
      'Dongle USB IR terpasang dan diinisialisasi. Ini adalah tempat yang tepat untuk memulai alur pembelajaran setelah kabel penangkapan tersambung.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Dongle USB ada, namun izin Android masih memblokirnya. Berikan izin USB di bagian pemancar sebelum belajar.';

  @override
  String get learningModeHardwareSetupBody =>
      'Dongle terdeteksi sebagian, namun masih memerlukan penyiapan atau penyambungan kembali sebelum pembelajaran dapat dimulai dengan andal.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Saat ini tidak ada perangkat keras receiver yang kompatibel yang tersedia. Mode pembelajaran ditujukan untuk dongle eksternal yang didukung dengan kemampuan menerima.';

  @override
  String get learningModeRefreshHardware => 'Segarkan status perangkat keras';

  @override
  String get learningModeHardwareTipTitle => 'Penempatan terbaik';

  @override
  String get learningModeHardwareTipBody =>
      'Mode Pembelajaran berada di bawah Pemancar IR karena bergantung pada ketersediaan perangkat keras dan lebih jarang digunakan dibandingkan mengirim jarak jauh.';

  @override
  String get learningModeStepPrepareTitle => 'Siapkan remote aslinya';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Putuskan apa yang Anda pelajari, lalu jaga jarak jauh asli tetap stabil dan dekat dengan penerima.';

  @override
  String get learningModeButtonNameLabel => 'Nama tombol';

  @override
  String get learningModeButtonNameHint => 'Misalnya: HDMI 1, Daya, Menu';

  @override
  String get learningModeSinglePress => 'Tekan sekali';

  @override
  String get learningModeHoldButton => 'Tombol tahan';

  @override
  String get learningModePreparationChecklistTitle => 'Sebelum Anda menangkap';

  @override
  String get learningModePreparationItemDistance =>
      'Jaga jarak remote asli kira-kira 2 hingga 5 cm dari receiver.';

  @override
  String get learningModePreparationItemOneButton =>
      'Pelajari satu tombol pada satu waktu dan gunakan penekanan singkat dan bersih terlebih dahulu.';

  @override
  String get learningModePreparationItemStill =>
      'Jaga agar kedua perangkat tetap stabil untuk menghindari pengambilan gambar yang berisik atau sebagian.';

  @override
  String get learningModeStepCaptureTitle => 'Tangkap sinyalnya';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Dengarkan satu perintah, lalu kunci hasilnya sebelum meninjaunya.';

  @override
  String get learningModeCaptureReadyTitle => 'Siap mendengarkan';

  @override
  String get learningModeCaptureReadyBody =>
      'Status perangkat keras Anda terlihat bagus. Backend pengambilan akan dihubungkan ke langkah ini selanjutnya.';

  @override
  String get learningModeCaptureBlockedTitle => 'Perangkat keras belum siap';

  @override
  String get learningModeCaptureBlockedBody =>
      'Anda masih dapat meninjau alurnya sekarang, namun pengambilan gambar harus menunggu hingga penerima siap.';

  @override
  String get learningModeStartListening => 'Mulailah mendengarkan';

  @override
  String get learningModeCaptureStubTitle =>
      'Tangkap backend datang berikutnya';

  @override
  String get learningModeCaptureStubBody =>
      'Layar ini dirangkai sepenuhnya terlebih dahulu sehingga alur pengambilan akhir dapat dihubungkan ke status perangkat keras yang sebenarnya alih-alih dipasang di kemudian hari.';

  @override
  String get learningModeCaptureStubMessage =>
      'Pengambilan pembelajaran belum terhubung. Layar ini merancah aliran penuh terlebih dahulu.';

  @override
  String get learningModeUnnamedCapture => 'Penangkapan tanpa nama';

  @override
  String get learningModeStatusCheckingTitle => 'Memeriksa penerima';

  @override
  String get learningModeStatusNoReceiverTitle => 'Penerima belum siap';

  @override
  String get learningModeStatusPermissionTitle => 'Izin USB diperlukan';

  @override
  String get learningModeStatusSetupTitle => 'Penerima perlu pengaturan';

  @override
  String get learningModeStatusReadyTitle => 'Siap untuk belajar';

  @override
  String get learningModeStatusListeningTitle => 'Mendengarkan sinyal';

  @override
  String get learningModeStatusCapturedTitle => 'Sinyal ditangkap';

  @override
  String get learningModeStatusReadyBody =>
      'Beri nama tombolnya, arahkan remote asli ke penerima, dan mulailah mendengarkan ketika Anda siap.';

  @override
  String get learningModeStatusListeningBody =>
      'Tekan tombol remote asli sekarang. Setelah penangkapan dilakukan, status ini akan mengunci sinyal bersih berikutnya.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Pratinjau sinyal yang dipelajari siap untuk $buttonName. Putar ulang, konfirmasikan berfungsi, lalu simpan ke perpustakaan Anda.';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'Hubungkan dongle pembelajaran yang kompatibel';

  @override
  String get learningModeConnectReceiverBody =>
      'Mode pembelajaran bergantung pada perangkat keras eksternal yang dapat menerima IR. Setelah penerima terdeteksi dan diotorisasi, halaman ini menjadi aliran mendengarkan, menguji, dan menyimpan secara langsung.';

  @override
  String get learningModeListenCardTitle => 'Dengarkan satu tombol';

  @override
  String get learningModeListenCardBody =>
      'Tetapkan label terlebih dahulu jika Anda mau, lalu mulailah mendengarkan dan tekan tombol pada remote asli.';

  @override
  String get learningModeReadyToListenTitle => 'Siap mendengarkan';

  @override
  String get learningModeReadyToListenBody =>
      'Ini adalah permukaan tangkapan utama. Mulailah mendengarkan hanya ketika remote asli diarahkan dan stabil.';

  @override
  String get learningModeListeningNowTitle => 'Mendengarkan sekarang';

  @override
  String get learningModeListeningNowBody =>
      'Tekan tombol remote asli satu kali. Gunakan pengambilan pratinjau untuk menelusuri sisa scaffold sebelum backend pengambilan sebenarnya dihubungkan.';

  @override
  String get learningModePreviewCaptureAction =>
      'Pratinjau sinyal yang ditangkap';

  @override
  String get learningModeCapturedSummary => 'Pratinjau sinyal yang dipelajari';

  @override
  String get learningModeResultActionsTitle => 'Uji dan simpan';

  @override
  String get learningModeResultActionsBody =>
      'Putar ulang sinyal yang dipelajari, verifikasi respons perangkat target, lalu simpan sebagai tombol yang dapat digunakan kembali.';

  @override
  String get learningModeReplayAction => 'Memutar ulang';

  @override
  String get learningModeReplayStubMessage =>
      'Pemutaran ulang belum ditransfer. Ini adalah perancah UI untuk alur pembelajaran, pengujian, dan penyimpanan akhir.';

  @override
  String get learningModeSaveStubMessage =>
      'Simpan belum ditransfer. Langkah selanjutnya adalah menghubungkan layar ini ke Tombol Buat dan remote yang ada.';

  @override
  String get learningModeLearnAnotherAction => 'Pelajari tombol lain';

  @override
  String get learningModeStepReviewTitle => 'Tinjau dan simpan';

  @override
  String get learningModeStepReviewSubtitle =>
      'Konfirmasikan apa yang telah dipelajari, lalu pilih lokasinya di perpustakaan jarak jauh Anda.';

  @override
  String get learningModeSaveToExistingRemote => 'Jarak jauh yang ada';

  @override
  String get learningModeCreateNewRemote => 'Jarak jauh baru';

  @override
  String get learningModeProtocolPreviewTitle => 'Pratinjau protokol';

  @override
  String get learningModeProtocolPreviewBody =>
      'Detail protokol yang didekodekan akan muncul di sini setelah penerima menangkap penekanan tombol bersih.';

  @override
  String get learningModeRawPreviewTitle => 'Penggantian mentah';

  @override
  String get learningModeRawPreviewBody =>
      'Jika decoding tidak lengkap, rekaman waktu mentah akan tetap tersedia di sini untuk ditinjau dan disimpan.';

  @override
  String get learningModeSaveCapture => 'Simpan tangkapan';

  @override
  String get learningModeReviewTipTitle => 'Kemana arahnya selanjutnya';

  @override
  String get learningModeReviewTipBody =>
      'Langkah implementasi selanjutnya harus menghubungkan panel tinjauan ini ke Tombol Buat dan remote yang ada sehingga sinyal yang dipelajari langsung masuk ke perpustakaan Anda.';

  @override
  String get learningModeFinishPreview => 'Selesaikan pratinjau';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interaksi';

  @override
  String get interactionSubtitle => 'Umpan balik sentuh dan tata letak remote';

  @override
  String get hapticFeedbackTitle => 'Umpan balik haptik';

  @override
  String get hapticFeedbackSubtitle => 'Getar saat sentuh dan aksi';

  @override
  String get forceInAppVibrationTitle => 'Paksa getaran di aplikasi';

  @override
  String get forceInAppVibrationSubtitle =>
      'Gunakan vibrator secara langsung meskipun umpan balik sentuhan sistem dimatikan';

  @override
  String get forceInAppVibrationWarning =>
      'Opsi lanjutan. Aplikasi dapat bergetar meskipun umpan balik sentuhan Android dinonaktifkan secara global.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'Intensitas';

  @override
  String get intensityLight => 'Terang';

  @override
  String get intensityMedium => 'Sedang';

  @override
  String get intensityStrong => 'Kuat';

  @override
  String get flipRemoteDefaultTitle => 'Balik Tampilan Remote default';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Buka layar Remote diputar 180° (untuk dongle USB yang terpasang di bawah).';

  @override
  String get remoteViewFlipped => 'Tampilan Remote akan terbuka terbalik.';

  @override
  String get remoteViewNormal => 'Tampilan Remote akan terbuka normal.';

  @override
  String get backupTitle => 'Cadangan';

  @override
  String get backupSubtitle => 'Impor/ekspor remote dan makro';

  @override
  String get importBackup => 'Impor cadangan';

  @override
  String get importBackupSubtitle =>
      'Impor cadangan remote/makro atau file Flipper Zero, LIRC, atau IRPLUS';

  @override
  String get bulkImportFolder => 'Impor massal folder';

  @override
  String get bulkImportFolderSubtitle => 'Impor banyak remote dari folder';

  @override
  String get exportBackup => 'Ekspor cadangan';

  @override
  String get exportBackupSubtitle =>
      'Simpan remote + makro sebagai satu file JSON ke Unduhan';

  @override
  String get restoreDemoRemotes => 'Pulihkan remote demo';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Ganti remote saat ini dengan demo bawaan';

  @override
  String get deleteAllRemotes => 'Hapus semua remote';

  @override
  String get deleteAllRemotesSubtitle =>
      'Hapus semua remote dari perangkat ini';

  @override
  String get backupTip =>
      'Tip: ekspor cadangan sebelum pengubahan besar. Impor mendukung cadangan penuh, cadangan JSON remote saja versi lama, dan file Flipper Zero .ir.';

  @override
  String get aboutTitle => 'Tentang';

  @override
  String get aboutSubtitle => 'Info aplikasi dan detail sumber terbuka';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Versi $version';
  }

  @override
  String get sourceCode => 'Kode Sumber';

  @override
  String get viewOnGitHub => 'Lihat di GitHub';

  @override
  String get repositoryUrlCopied => 'URL repo disalin';

  @override
  String get reportIssue => 'Laporkan Masalah';

  @override
  String get reportIssueSubtitle => 'Laporan bug dan permintaan fitur';

  @override
  String get issuesUrlCopied => 'URL masalah disalin';

  @override
  String get license => 'Lisensi';

  @override
  String get openSourceLicense => 'Lisensi sumber terbuka';

  @override
  String get licenseUrlCopied => 'URL lisensi disalin';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Kunjungi situs kami';

  @override
  String get companyUrlCopied => 'URL perusahaan disalin';

  @override
  String get licenses => 'Lisensi';

  @override
  String get openSourceLicenses => 'Lisensi sumber terbuka';

  @override
  String byCreator(Object creator) {
    return 'oleh $creator';
  }

  @override
  String get deviceControlsTitle => 'Kontrol Perangkat';

  @override
  String get deviceControlsSubtitle =>
      'Tampilkan tombol favorit di halaman kontrol sistem';

  @override
  String get manageFavorites => 'Kelola favorit';

  @override
  String get manageFavoritesSubtitle =>
      'Pilih which tombol appear in perangkat kontrol';

  @override
  String get quickSettingsTitle => 'Setelan Cepat';

  @override
  String get quickSettingsSubtitle =>
      'Tambah tile untuk pintasan daya dan volume';

  @override
  String get configureTiles => 'Atur tile';

  @override
  String get configureTilesSubtitle => 'Petakan tile ke tombol remote';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Perputaran daya universal untuk perangkat milik Anda';

  @override
  String get openTvKill => 'Buka TVKill';

  @override
  String get openTvKillSubtitle =>
      'Putar kode daya (gunakan hanya pada perangkat milik Anda)';

  @override
  String get failedToLoadTransmitterSettings =>
      'Gagal memuat setelan pemancar.';

  @override
  String get usbStatusReady => 'Dongle USB terhubung dan siap mengirim IR.';

  @override
  String get usbStatusPermissionRequired =>
      'Dongle USB terdeteksi. Minta izin USB lalu setujui dialog sistem.';

  @override
  String get usbStatusPermissionDenied =>
      'Izin USB ditolak untuk dongle yang terpasang. Minta lagi lalu setujui dialog.';

  @override
  String get usbStatusPermissionGranted =>
      'Izin USB diberikan. Dongle masih perlu diinisialisasi sebelum bisa mengirim IR.';

  @override
  String get usbStatusOpenFailed =>
      'Izin USB diberikan, tetapi dongle gagal diinisialisasi. Sambungkan ulang lalu coba lagi.';

  @override
  String get usbStatusNoDevice =>
      'Dongle IR USB yang didukung tidak terdeteksi.';

  @override
  String get usbSelectPermissionRequired =>
      'Dongle USB terdeteksi tetapi belum diizinkan. Ketuk \"Minta izin USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'Izin USB ditolak. Ketuk \"Minta izin USB\" lalu setujui dialog.';

  @override
  String get usbSelectPermissionGranted =>
      'Izin USB diberikan, tetapi dongle belum diinisialisasi. Coba sambungkan ulang.';

  @override
  String get usbSelectOpenFailed =>
      'Izin USB diberikan, tetapi dongle gagal diinisialisasi. Sambungkan ulang lalu coba lagi.';

  @override
  String get usbSelectNoDevice =>
      'Tidak ada dongle IR USB yang didukung terdeteksi. Sambungkan lalu ketuk \"Minta izin USB\".';

  @override
  String get usbSelectReady => 'Dongle IR USB siap.';

  @override
  String get autoSwitchEnabledMessage =>
      'Alih otomatis aktif: memakai USB saat terhubung, jika tidak Internal.';

  @override
  String get autoSwitchDisabledMessage =>
      'Alih otomatis nonaktif: pemilihan pemancar sekarang manual.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Gagal memperbarui setelan alih otomatis.';

  @override
  String get failedToSwitchTransmitter => 'Gagal mengganti pemancar.';

  @override
  String get deviceHasNoInternalIr =>
      'Perangkat ini tidak punya pemancar IR bawaan.';

  @override
  String get audioModeEnabledMessage =>
      'Mode Audio aktif. Gunakan volume media maksimum dan adaptor LED audio-ke-IR.';

  @override
  String get usbPermissionRequestSent => 'Permintaan izin USB dikirim.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Permintaan izin USB dikirim. Setujui dialog untuk mengaktifkan USB.';

  @override
  String get usbAlreadyReady => 'Dongle USB sudah diinisialisasi dan siap.';

  @override
  String get failedToRequestUsbPermission => 'Gagal meminta izin USB.';

  @override
  String get transmitterHelpInternal =>
      'Gunakan pemancar IR bawaan ponsel untuk mengirim perintah.';

  @override
  String get transmitterHelpUsb =>
      'Gunakan dongle IR USB (perlu izin) untuk mengirim perintah.';

  @override
  String get transmitterHelpAudio1 =>
      'Gunakan keluaran audio (mono). Memerlukan adaptor LED audio-ke-IR dan volume media tinggi.';

  @override
  String get transmitterHelpAudio2 =>
      'Gunakan keluaran audio (stereo). Memakai dua kanal untuk pendorongan LED yang lebih baik dengan adaptor yang kompatibel.';

  @override
  String get transmitterInternal => 'IR Internal';

  @override
  String get transmitterUsb => 'Dongle IR USB';

  @override
  String get transmitterAudio1 => 'Audio (1 LED)';

  @override
  String get transmitterAudio2 => 'Audio (2 LED)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Gagal memuat kemampuan pemancar.';

  @override
  String get selectedTransmitter => 'Pemancar terpilih';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Aktif: $active';
  }

  @override
  String get refresh => 'Segarkan';

  @override
  String get autoSwitchTitle => 'Alih otomatis';

  @override
  String get autoSwitchDisabledWhileAudio => 'Nonaktif saat mode Audio';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Memakai USB saat tersambung, jika tidak Internal';

  @override
  String get unavailableOnThisDevice => 'Tidak tersedia di perangkat ini';

  @override
  String get openOnUsbAttachTitle => 'Buka saat USB terpasang';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android dapat menyarankan membuka aplikasi saat dongle IR USB yang didukung tersambung.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Akan menyarankan membuka IR Blaster saat dongle USB yang didukung terpasang.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Tidak akan menyarankan buka saat USB terpasang.';

  @override
  String get failedToUpdateSetting => 'Gagal memperbarui setelan.';

  @override
  String get unnamedButton => 'Tombol tanpa nama';

  @override
  String get iconFallback => 'Ikon';

  @override
  String get remoteListReorderHint =>
      'Mode urut ulang: tekan lama dan seret kartu untuk memindahkannya.';

  @override
  String get deleteRemoteTitle => 'Hapus remote?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" akan dihapus permanen. Tindakan ini tidak bisa dibatalkan.';
  }

  @override
  String get delete => 'Hapus';

  @override
  String get addToDeviceControlsTitle => 'Tambah ke Kontrol Perangkat?';

  @override
  String get addToDeviceControlsDescription =>
      'Akses cepat di kontrol perangkat sistem.';

  @override
  String get skip => 'Lewati';

  @override
  String get add => 'Tambah';

  @override
  String get addedToDeviceControls => 'Ditambahkan ke Kontrol Perangkat.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Dihapus \"$name\". Tindakan ini tidak bisa dibatalkan.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count tombol · $layout';
  }

  @override
  String get layoutComfort => 'Nyaman';

  @override
  String get layoutCompact => 'Ringkas';

  @override
  String get open => 'Buka';

  @override
  String get useThisRemote => 'Gunakan remote ini';

  @override
  String get edit => 'Ubah';

  @override
  String get editRemoteSubtitle => 'Ganti nama dan ubah tombol';

  @override
  String get thisCannotBeUndone => 'Ini tidak bisa dibatalkan';

  @override
  String get searchRemotes => 'Cari Remote';

  @override
  String get reorderRemotes => 'Urutkan ulang remote';

  @override
  String get addRemote => 'Tambah remote';

  @override
  String get more => 'Lainnya';

  @override
  String get reorderMode => 'Mode urut ulang';

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
  String get noRemotesYet => 'Belum ada remote';

  @override
  String get noRemotesDescription =>
      'Buat remote untuk mulai mengirim kode IR.';

  @override
  String get noRemotesNextStep =>
      'Berikutnya: ketuk Tambah remote, lalu tambahkan tombol pertama.';

  @override
  String get actions => 'Aksi';

  @override
  String get macrosTitle => 'Makro';

  @override
  String get help => 'Bantuan';

  @override
  String get createMacro => 'Buat Makro';

  @override
  String get timedMacrosTitle => 'Makro Terjadwal';

  @override
  String get timedMacrosSubtitle =>
      'Otomatiskan rangkaian perintah IR dengan waktu yang presisi';

  @override
  String get timedMacrosNextStep =>
      'Berikutnya: ketuk Buat Makro Pertama, pilih remote, lalu tambahkan perintah dan jeda.';

  @override
  String get macroFeatureToysTitle => 'Cocok untuk Mainan Interaktif';

  @override
  String get macroFeatureToysDescription =>
      'Kendalikan perangkat seperti anjing robot i-cybie, robot i-sobot, dan mainan lain yang memerlukan jeda antarperintah untuk memproses aksi.';

  @override
  String get macroFeatureTimingTitle => 'Kontrol Waktu Presisi';

  @override
  String get macroFeatureTimingDescription =>
      'Tambahkan jeda antarperintah (250ms hingga durasi kustom) agar perangkat punya waktu merespons sebelum aksi berikutnya.';

  @override
  String get macroFeatureManualTitle => 'Langkah Lanjut Manual';

  @override
  String get macroFeatureManualDescription =>
      'Jeda eksekusi dan tunggu konfirmasi Anda saat durasi animasi berubah atau Anda perlu umpan balik visual.';

  @override
  String get exampleUseCase => 'Contoh Penggunaan';

  @override
  String get macroExampleText =>
      'Mode Lanjut i-cybie:\n1. Kirim perintah \"Mode\"\n2. Tunggu 1000ms (mainan memproses)\n3. Kirim \"Aksi 1\"\n4. Tunggu 1000ms\n5. Kirim \"Aksi 2\"\n…dan seterusnya otomatis!';

  @override
  String get createFirstMacro => 'Buat Makro Pertama';

  @override
  String get noRemote => 'Tidak ada remote';

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
  String get aboutTimedMacros => 'Tentang Makro Terjadwal';

  @override
  String get aboutTimedMacrosDescription =>
      'Makro Terjadwal memungkinkan Anda mengotomatiskan urutan perintah IR dengan jeda presisi di setiap langkah.';

  @override
  String get sendCommand => 'Kirim Perintah';

  @override
  String get sendCommandDescription => 'Mengirim perintah IR dari remote Anda.';

  @override
  String get delay => 'Jeda';

  @override
  String get delayDescription =>
      'Menunggu durasi tertentu (mis. 1000ms) sebelum langkah berikutnya.';

  @override
  String get manualContinue => 'Manual Lanjut';

  @override
  String get manualContinueDescription =>
      'Menjeda eksekusi sampai Anda mengetuk Lanjut (berguna untuk animasi dengan durasi bervariasi).';

  @override
  String get gotIt => 'Mengerti';

  @override
  String get failedToSaveMacros => 'Gagal simpan makro.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Dihapus \"$name\".';
  }

  @override
  String get undo => 'Urungkan';

  @override
  String get failedToRestoreMacro => 'Gagal restore makro.';

  @override
  String get deleteMacroTitle => 'Hapus makro?';

  @override
  String get deleteMacroMessage =>
      'Anda bisa membatalkannya dari snackbar berikutnya.';

  @override
  String get noRemotesAvailable => 'Tidak ada remote tersedia.';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count tombol(s)';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Orientasi: terbalik (ketuk untuk normal)';

  @override
  String get remoteOrientationNormalTooltip =>
      'Orientasi: normal (ketuk untuk balik)';

  @override
  String get stopLoop => 'Hentikan loop';

  @override
  String get reorderButtons => 'Reorder tombol';

  @override
  String get remoteReorderHint =>
      'Mode urut ulang: tekan lama dan seret tombol untuk memindahkannya.';

  @override
  String get manageRemote => 'Kelola remote';

  @override
  String get remoteNoButtons => 'Tidak ada tombol di remote ini';

  @override
  String get remoteNoButtonsDescription =>
      'Gunakan \"Ubah remote\" untuk menambah atau mengatur tombol.';

  @override
  String get editRemote => 'Ubah remote';

  @override
  String get editRemoteActionsSubtitle =>
      'Ganti nama, urutkan ulang, dan ubah tombol';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Diperbarui \"$name\".';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Ditambahkan \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Tombol duplicated.';

  @override
  String get loopRunningForButton => 'Loop sedang berjalan untuk tombol ini.';

  @override
  String get loopTip =>
      'Tip: gunakan Loop untuk mengulang sampai Anda menghentikannya.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Kode disalin.';

  @override
  String get copyCode => 'Copy kode';

  @override
  String get startLoop => 'Mulai loop';

  @override
  String get editButtonSubtitle => 'Modify label, kode, protokol, frequency';

  @override
  String get newButton => 'New tombol';

  @override
  String get newButtonSubtitle => 'Buat tombol baru setelah tombol ini';

  @override
  String get duplicate => 'Duplikat';

  @override
  String get duplicateButtonSubtitle => 'Buat salinan tombol ini';

  @override
  String get removeFromDeviceControls => 'Hapus dari Kontrol Perangkat';

  @override
  String get addToDeviceControls => 'Tambah ke Kontrol Perangkat';

  @override
  String get deviceControlsButtonSubtitle =>
      'Menampilkan tombol ini di kontrol perangkat sistem';

  @override
  String get removedFromDeviceControls => 'Dihapus dari Kontrol Perangkat.';

  @override
  String get pinQuickTile => 'Sematkan ke favorit Tile Cepat';

  @override
  String get unpinQuickTile => 'Lepas dari favorit Tile Cepat';

  @override
  String get quickTileButtonSubtitle =>
      'Menampilkan tombol ini di bagian atas pemilih tile cepat';

  @override
  String get removedFromQuickTileFavorites =>
      'Dihapus dari favorit Tile Cepat.';

  @override
  String get pinnedToQuickTileFavorites => 'Disematkan ke favorit Tile Cepat.';

  @override
  String get duplicateAndEdit => 'Duplikat dan ubah';

  @override
  String get duplicateAndEditSubtitle => 'Buat salinan lalu langsung ubah';

  @override
  String get done => 'Selesai';

  @override
  String get run => 'Jalankan';

  @override
  String get untitledRemote => 'Remote tanpa judul';

  @override
  String get createRemoteTitle => 'Buat remote';

  @override
  String get editRemoteTitle => 'Ubah remote';

  @override
  String get removeButtonTitle => 'Remove tombol?';

  @override
  String get imageButtonRemovedMessage => 'Tombol gambar ini akan dihapus.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" akan dihapus.';
  }

  @override
  String get remove => 'Hapus';

  @override
  String importedButtonCount(int count) {
    return 'Mengimpor $count tombol(s).';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Mengimpor $count tombol dari remote yang ada.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Ubah label, sinyal, dan setelan lanjutan';

  @override
  String get createButtonCopySubtitle => 'Buat salinan tombol ini';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Buat salinan lalu langsung ubah';

  @override
  String get undoAvailableInNextSnackbar =>
      'Anda bisa membatalkan dari snackbar berikutnya';

  @override
  String get buttonRemoved => 'Tombol removed.';

  @override
  String get remoteNameCannotBeEmpty => 'Nama remote tidak boleh kosong.';

  @override
  String get saveRemote => 'Simpan remote';

  @override
  String get remoteName => 'Nama remote';

  @override
  String get remoteNameHint => 'mis. TV, AC, Strip LED';

  @override
  String get remoteNameHelper => 'Nama ini muncul di daftar Remote Anda.';

  @override
  String get layoutStyle => 'Gaya tata letak';

  @override
  String get layoutWideDescription =>
      'Lebar: tombol 2 kolom dengan detail tambahan (disarankan).';

  @override
  String get layoutCompactDescription =>
      'Ringkas: kisi 4× klasik (ikon/teks saja).';

  @override
  String get importFromRemotes => 'Impor dari remote';

  @override
  String get importFromDatabase => 'Impor dari DB';

  @override
  String get addButton => 'Tambah tombol';

  @override
  String get noButtonsYet => 'Tidak ada tombol yet';

  @override
  String get createRemoteEmptyStateDescription =>
      'Tambahkan tombol pertama, lalu tekan lama untuk opsi ubah/hapus.';

  @override
  String get createButtonTitle => 'Buat Tombol';

  @override
  String get editButtonTitle => 'Ubah Tombol';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Gagal muat protocols: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Gagal muat basis data tombol: $error';
  }

  @override
  String get presetPower => 'Daya';

  @override
  String get presetVolume => 'Volume';

  @override
  String get presetChannel => 'Kanal';

  @override
  String get presetNavigation => 'Navigasi';

  @override
  String get all => 'Semua';

  @override
  String get completeRequiredFieldsToSave =>
      'Lengkapi bidang wajib untuk menyimpan';

  @override
  String get buttonLabelStepTitle => 'Label tombol';

  @override
  String get buttonLabelStepSubtitle =>
      'Pilih gambar, ikon, atau ketik label teks.';

  @override
  String get buttonColorStepTitle => 'Warna tombol';

  @override
  String get buttonColorStepSubtitle => 'Pilih warna latar untuk tombol ini.';

  @override
  String get selectColor => 'Pilih warna:';

  @override
  String get noImageSelected => 'Tidak ada gambar terpilih';

  @override
  String get gallery => 'Galeri';

  @override
  String get builtIn => 'Bawaan';

  @override
  String get removeImage => 'Remove gambar';

  @override
  String get requiredSelectImageOrSwitch =>
      'Wajib: pilih gambar, ikon, atau beralih ke Teks.';

  @override
  String get iconSelected => 'Ikon terpilih';

  @override
  String get noIconSelected => 'Tidak ada ikon terpilih';

  @override
  String get chooseIcon => 'Pilih Ikon';

  @override
  String get removeIcon => 'Remove ikon';

  @override
  String get requiredSelectIconOrSwitch =>
      'Wajib: pilih ikon atau beralih ke Gambar/Teks.';

  @override
  String get buttonText => 'Tombol text';

  @override
  String get buttonTextHint => 'mis. Daya, Volume +, HDMI 1';

  @override
  String get buttonTextHelper => 'Teks ini akan muncul pada tombol.';

  @override
  String get requiredEnterButtonLabel => 'Wajib: masukkan label tombol.';

  @override
  String get defaultColorName => 'Bawaan';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Remote baru dibuat dengan satu tombol dari hasil terakhir.';

  @override
  String get selectRemote => 'Pilih remote';

  @override
  String remoteNumber(Object id) {
    return 'Remote #$id';
  }

  @override
  String get newRemoteCreated => 'Remote baru dibuat.';

  @override
  String get failedToCreateRemote => 'Gagal create remote.';

  @override
  String get newRemoteEllipsis => 'Remote baru…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Ditambahkan ke $name.';
  }

  @override
  String get failedToAddToRemote => 'Gagal menambah ke remote.';

  @override
  String get newRemoteDefaultName => 'Remote Baru';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Melompat ke offset $offset. Dijeda, tekan Lanjutkan untuk melanjutkan.';
  }

  @override
  String get sent => 'Terkirim.';

  @override
  String failedToSend(Object error) {
    return 'Gagal send: $error';
  }

  @override
  String get copiedProtocolCode => 'Copied (protokol:kode).';

  @override
  String get savedToResults => 'Disimpan ke Hasil.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Kode tidak valid untuk protokol: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Copied saat ini candidate.';

  @override
  String get jumpToOffset => 'Lompat ke offset';

  @override
  String get jumpToBruteCursor => 'Lompat ke kursor brute';

  @override
  String get jump => 'Lompat';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Melompat ke kursor 0x$cursor. Dijeda, tekan Lanjutkan untuk melanjutkan.';
  }

  @override
  String get irSignalTester => 'Penguji Sinyal IR';

  @override
  String get stop => 'Hentikan';

  @override
  String get selectButton => 'Pilih tombol';

  @override
  String get buttonNotFoundInRemotes => 'Tombol tidak ditemukan di remote.';

  @override
  String sentNamed(Object name) {
    return 'Mengirim \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'Kirim gagal: $error';
  }

  @override
  String get noFavoritesYet => 'Tidak ada favorit yet';

  @override
  String get deviceControlsEmptyHint =>
      'Tekan lama tombol remote lalu pilih \"Tambah ke Kontrol Perangkat\".';

  @override
  String get sendTest => 'Kirim test';

  @override
  String get testSendCompleted => 'Uji kirim selesai.';

  @override
  String testSendFailed(Object error) {
    return 'Test send gagal: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Menghapus \"$name\".';
  }

  @override
  String get brand => 'Merek';

  @override
  String get model => 'Model';

  @override
  String get selectBrand => 'Pilih merek';

  @override
  String get searchBrand => 'Cari merek…';

  @override
  String get selectModel => 'Pilih model';

  @override
  String get searchModel => 'Cari model…';

  @override
  String get unnamedKey => 'Unnamed tombol';

  @override
  String get unknown => 'Tidak dikenal';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'Cari commands';

  @override
  String get noMatchingCommands => 'Tidak ada matching commands';

  @override
  String get quickTileFavoritesTitle => 'Cepat tile favorit';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Ubah pemetaan untuk tile $tileLabel';
  }

  @override
  String get pickDifferentButton => 'Pilih tombol lain';

  @override
  String get browseAllRemotesEllipsis => 'Browse semua remote…';

  @override
  String get invalidMacroFileFormat => 'Invalid makro file format.';

  @override
  String get failedToParseMacroFile => 'Gagal parse makro file.';

  @override
  String get deviceCodeLabel => 'Perangkat Kode';

  @override
  String get commandLabel => 'Perintah';

  @override
  String get editButtonCodeTitle => 'Ubah Kode tombol';

  @override
  String get thisRemoteHasNoButtons => 'Remote ini tidak memiliki tombol.';

  @override
  String get selectCommand => 'Pilih Command';

  @override
  String get databaseModeAutofillHint =>
      'Mode Basis data mengisi otomatis Langkah 2 untuk Anda (merek + model + protokol). Setelah mengimpor tombol, Anda bisa menyempurnakan apa pun di Manual.';

  @override
  String get test => 'Uji';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Semua tombol terpilih adalah duplikat.';

  @override
  String get noButtonsImported => 'Tidak ada tombol imported.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Mengimpor $addedCount tombol(s). Skipped $skippedCount duplicate(s).';
  }

  @override
  String get importAllMatchingTitle => 'Impor semua matching tombol?';

  @override
  String get noMatchingKeysFound => 'Tidak ada matching tombol found.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Ini akan mengimpor hingga $count tombol yang cocok dari pilihan basis data saat ini.';
  }

  @override
  String get importAll => 'Impor semua';

  @override
  String get importingButtons => 'Importing tombol…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Semua tombol yang cocok adalah duplikat.';

  @override
  String get quickPresets => 'Cepat presets';

  @override
  String get selectDeviceFirst => 'Pilih perangkat terlebih dahulu';

  @override
  String get searchByLabelOrHex => 'Cari menurut label atau hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Opsional: perhalus tombol preset $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Pilih merek, model, dan protokol terlebih dahulu.';

  @override
  String get importFromDatabaseTitle => 'Impor dari basis data';

  @override
  String get importFromDatabaseSubtitle =>
      'Pilih perangkat, muat tombol yang cocok, lalu impor tombol terpilih.';

  @override
  String get deviceAndFilters => 'Perangkat & filters';

  @override
  String loadedCount(int count) {
    return '$count dimuat';
  }

  @override
  String get hideFilters => 'Sembunyikan filter';

  @override
  String get showFilters => 'Tampilkan filter';

  @override
  String get noProtocolFoundForBrandModel =>
      'Tidak ada protokol untuk merek dan model ini.';

  @override
  String get protocolAutoDetected => 'Protokol';

  @override
  String get protocolAutoDetectedHelper =>
      'Terdeteksi otomatis dari basis data. Anda bisa mengubahnya sebelum impor.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Pilih merek, model, dan protokol untuk memuat tombol.';

  @override
  String get noKeysFound => 'Tidak ada tombol found.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Tidak ada tombol ditemukan untuk “$query”.';
  }

  @override
  String get skipDuplicates => 'Lewati duplikat';

  @override
  String get skipDuplicatesSubtitle =>
      'Jangan impor tombol yang sudah ada di remote ini.';

  @override
  String get importSelected => 'Impor terpilih';

  @override
  String get noMacrosToExport => 'Tidak ada makro untuk diekspor.';

  @override
  String get macrosExportedToDownloads => 'Makro diekspor ke Unduhan.';

  @override
  String get failedToExportMacros => 'Gagal export makro.';

  @override
  String get failedToReadFile => 'Gagal read file.';

  @override
  String get importFromExistingRemotesTitle => 'Impor dari Remote yang Ada';

  @override
  String selectedCount(int count) {
    return '$count terpilih';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Tidak ada remote lain dengan tombol.';

  @override
  String get sourceRemote => 'Sumber remote';

  @override
  String get searchButtons => 'Cari tombol';

  @override
  String get searchButtonsHint => 'Daya, Volume, Bisu...';

  @override
  String get selectVisible => 'Pilih visible';

  @override
  String get clearVisible => 'Bersihkan yang terlihat';

  @override
  String protocolNamed(Object name) {
    return 'Protokol: $name';
  }

  @override
  String get rawSignal => 'Mentah';

  @override
  String get legacyCode => 'Legacy kode';

  @override
  String importCount(int count) {
    return 'Impor $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Izin penyimpanan ditolak (diperlukan di beberapa perangkat Android lama).';

  @override
  String get backupExportedToDownloads => 'Cadangan diekspor ke Unduhan.';

  @override
  String failedToExport(Object error) {
    return 'Gagal export: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Mengimpor $count remote dari cadangan JSON lama. Makro tidak diubah.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Impor gagal: \"remote\" pada cadangan harus berupa daftar JSON bila ada.';

  @override
  String get importFailedMacrosMustBeList =>
      'Impor gagal: \"makro\" pada cadangan harus berupa daftar JSON bila ada.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Impor gagal: format cadangan tidak valid (diharapkan List atau Map lama dengan remote/makro).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Mengimpor $remoteCount remote dari cadangan. Makro tidak diubah.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Mengimpor $remoteCount remote dan $macroCount makro dari cadangan.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Impor gagal: tidak ada tombol valid di file .ir.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Mengimpor 1 remote dari Flipper .ir. Makro tidak diubah.';

  @override
  String get importFailedInvalidIrplus =>
      'Impor gagal: file irplus tidak valid (tidak ada tombol valid).';

  @override
  String get importedOneRemoteFromIrplus =>
      'Mengimpor 1 remote dari irplus. Makro tidak diubah.';

  @override
  String get importFailedInvalidLirc =>
      'Impor gagal: file LIRC tidak valid (tidak ada kode/kode mentah valid).';

  @override
  String get importedOneRemoteFromLirc =>
      'Mengimpor 1 remote dari konfigurasi LIRC. Makro tidak diubah.';

  @override
  String get unsupportedFileTypeSelected => 'Unsupported file type terpilih.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Impor gagal: file tidak valid atau tidak bisa dibaca.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Impor massal selesai: tidak ada file yang didukung di folder.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Impor massal complete: tidak ada remote imported. Skipped $skippedCount file(s).';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Impor massal selesai: mengimpor $importedCount remote dari $supportedCount file yang didukung. Melewati $skippedCount file.';
  }

  @override
  String get storagePermissionDenied => 'Storage izin ditolak.';

  @override
  String get bulkImportFailedReadFolder =>
      'Impor massal gagal: tidak dapat membaca isi folder.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Impor massal complete: tidak ada didukung file found ($sourceLabel).';
  }

  @override
  String get clearAction => 'Bersihkan';

  @override
  String get saveAction => 'Simpan';

  @override
  String buttonsTitleCount(int count) {
    return 'Tombol ($count)';
  }

  @override
  String get invalidStepEncountered => 'Invalid langkah encountered';

  @override
  String failedToSendNamed(Object name) {
    return 'Gagal send: $name';
  }

  @override
  String get buttonNotFound => 'Tombol tidak ditemukan';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Tombol tidak ditemukan: $name';
  }

  @override
  String get unknownButton => 'Tidak dikenal Tombol';

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
      'Orientasi: terbalik (ketuk untuk normal)';

  @override
  String get orientationNormalTooltip =>
      'Orientasi: normal (ketuk untuk balik)';

  @override
  String get noSteps => 'Tidak ada langkah';

  @override
  String stepProgress(int current, int total) {
    return 'Langkah $current / $total';
  }

  @override
  String get completed => 'Selesai';

  @override
  String get paused => 'Dijeda';

  @override
  String get running => 'Berjalan';

  @override
  String get ready => 'Siap';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total langkah';
  }

  @override
  String get waiting => 'Menunggu';

  @override
  String secondsRemaining(Object seconds) {
    return 'sisa ${seconds}d';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Ketuk Lanjut saat siap untuk langkah berikutnya';

  @override
  String get error => 'Galat';

  @override
  String get macroCompleted => 'Makro Completed';

  @override
  String finishedIn(Object duration) {
    return 'Selesai dalam $duration';
  }

  @override
  String get sequence => 'Urutan';

  @override
  String waitMilliseconds(int ms) {
    return 'Tunggu ${ms}ms';
  }

  @override
  String get runAgain => 'Jalankan Lagi';

  @override
  String get startMacro => 'Mulai Makro';

  @override
  String get continueAction => 'Lanjut';

  @override
  String get unnamedRemote => 'Remote tanpa nama';

  @override
  String get enterMacroName => 'Masukkan nama makro';

  @override
  String get addAtLeastOneStep => 'Tambah at least one langkah';

  @override
  String get fixInvalidSteps => 'Fix tidak valid langkah';

  @override
  String get unknownCommand => 'Tidak dikenal Command';

  @override
  String get unnamedCommand => 'Perintah tanpa nama';

  @override
  String get iconCommand => 'Ikon Command';

  @override
  String get selectDelay => 'Pilih Jeda';

  @override
  String keepMilliseconds(int ms) {
    return 'Pertahankan: ${ms}ms';
  }

  @override
  String get custom => 'Kustom';

  @override
  String get enterCustomDelayDuration => 'Masukkan durasi jeda kustom';

  @override
  String millisecondsLong(int ms) {
    return '$ms milidetik';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds detik$plural';
  }

  @override
  String get customDelay => 'Custom Jeda';

  @override
  String get delayMillisecondsLabel => 'Jeda (milliseconds)';

  @override
  String get delayMillisecondsHint => 'mis. 3000';

  @override
  String get recommendedDelayRange =>
      'Disarankan: 250-5000ms untuk sebagian besar perangkat';

  @override
  String get enterValidPositiveNumber => 'Masukkan angka positif yang valid';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Remote';

  @override
  String get macroName => 'Makro Name';

  @override
  String get macroNameHint => 'mis. i-cybie Mode Lanjut';

  @override
  String stepsTitleCount(int count) {
    return 'Langkah ($count)';
  }

  @override
  String get noStepsYet => 'Tidak ada langkah yet';

  @override
  String get addCommandsAndDelaysHint =>
      'Tambahkan perintah dan jeda di bawah untuk menyusun urutan';

  @override
  String get addStep => 'Tambah Langkah';

  @override
  String get reorderStepsHint =>
      'Tip: seret pegangan untuk mengurut ulang langkah. Ketuk langkah untuk mengubahnya.';

  @override
  String reorderStep(int index) {
    return 'Reorder langkah $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Tekan dan seret untuk mengubah urutan langkah';

  @override
  String deleteStep(int index) {
    return 'Hapus langkah $index';
  }

  @override
  String get invalidStepTapToFix =>
      'Langkah tidak valid, ketuk untuk memperbaiki';

  @override
  String get sendIrCommand => 'Kirim IR command';

  @override
  String get waitForUserConfirmation => 'Tunggu konfirmasi pengguna';

  @override
  String get notImplemented => 'Belum diimplementasikan';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Lebar';

  @override
  String get iconButton => 'Ikon tombol';

  @override
  String get imageButton => 'Gambar tombol';

  @override
  String get noSignalInfo => 'Tidak ada signal info';

  @override
  String get proceed => 'Lanjut';

  @override
  String get discard => 'Buang';

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
  String get idle => 'Siaga';

  @override
  String get start => 'Mulai';

  @override
  String get resume => 'Lanjutkan';

  @override
  String get pause => 'Jeda';

  @override
  String get stopped => 'Berhenti';

  @override
  String get copy => 'Salin';

  @override
  String get send => 'Kirim';

  @override
  String get step => 'Langkah';

  @override
  String get addToRemote => 'Tambah ke remote';

  @override
  String get noDescriptionAvailable => 'Tidak ada description tersedia.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Vendor Kaseikyo harus tepat 4 digit heksadesimal.';

  @override
  String get irFinderDatabaseNotReady => 'Basis data belum siap.';

  @override
  String get irFinderSelectBrandFirst =>
      'Pilih merek terlebih dahulu di Siapkan.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute-force belum tersedia untuk protokol ini.';

  @override
  String get irFinderInvalidPrefix => 'Invalid prefiks.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Merek: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Model: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Tombol: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Remote #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Masukkan indeks berbasis 0 dalam hasil basis data yang difilter dan diurutkan.';

  @override
  String get irFinderJumpCursorHelper =>
      'Masukkan kursor heksadesimal berbasis 0 dalam ruang brute-force.';

  @override
  String get irFinderSetupTab => 'Siapkan';

  @override
  String get irFinderTestTab => 'Uji';

  @override
  String get irFinderResultsTab => 'Hasil';

  @override
  String get irFinderContinueToTest => 'Lanjut ke Uji';

  @override
  String get irFinderKaseikyoVendorTitle => 'Vendor Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'Vendor kustom (4 hex)';

  @override
  String get irFinderBrowseDbCandidates => 'Jelajahi kandidat DB…';

  @override
  String get irFinderEditSetup => 'Ubah Setup';

  @override
  String get irFinderNoSavedHits =>
      'Belum ada hasil tersimpan. Di halaman Uji, tekan \"Simpan hasil\" saat perangkat merespons.';

  @override
  String get irFinderBackToTest => 'Kembali ke Uji';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Ruang pencarian besar';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Ruang brute-force ini sangat besar ($human kemungkinan). IR Finder tetap akan menghormati batas percobaan maksimum dan cooldown Anda, tetapi hati-hati agar tidak membanjiri perangkat IR.\n\nSaran: gunakan mode Basis data terlebih dahulu, dan/atau masukkan byte prefiks yang diketahui untuk mengurangi ruang.';
  }

  @override
  String get irFinderDatabaseSession => 'Basis data session';

  @override
  String get irFinderBruteforceSession => 'Sesi brute-force';

  @override
  String get irFinderResumeLastSession => 'Lanjutkan last session';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Merek: $brand · Model: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Prefiks: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Progres: $progress · Mulai: $when';
  }

  @override
  String get irFinderApplyResume => 'Apply & Lanjutkan';

  @override
  String get irFinderBruteforceMode => 'Brute-force';

  @override
  String get irFinderDatabaseAssistedMode => 'Basis data-assisted';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Protokol: $name';
  }

  @override
  String get irFinderProtocolLabel => 'IR protokol';

  @override
  String get irFinderProtocolHelper =>
      'Mengontrol enkode dan karena itu ruang pencarian.';

  @override
  String get irFinderKnownPrefixLabel =>
      'Prefiks yang diketahui (byte hex, opsional)';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Payload: $digits digit heksadesimal';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Payload: $digits hex digit(s) · Contoh: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Payload: $digits digit heksadesimal · Prefiks maks: $bytes byte';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Payload: $digits hex digit(s) · Contoh: $example · Max prefiks: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Contoh: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Masukkan byte awal yang diketahui untuk mengurangi ruang pencarian.';

  @override
  String get irFinderDatabaseMode => 'Basis data';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Normalized prefiks: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Normalized prefiks';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Brute-force belum dikonfigurasi untuk protokol ini.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Semua ($value)';
  }

  @override
  String get irFinderTestControls => 'Test kontrol';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Panjang payload: $digits digit heksadesimal.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Cari ruang: $value possibilities (after prefiks constraints).';
  }

  @override
  String get irFinderCooldownMs => 'Jeda (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Maks percobaan (per jalan)';

  @override
  String get irFinderTestAllCombinations => 'Test semua combinations';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Berjalan sampai ruang pencarian habis. Batas efektif: $value';
  }

  @override
  String get irFinderAttempts => 'Percobaan';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Rentang slider: 1–$max (ketik angka apa saja untuk nilai lebih besar)';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Maks\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Batas efektif jalan ini: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Tip: gunakan mode Basis data terlebih dahulu; brute-force paling baik dengan prefiks yang diketahui (misalnya 1–4 byte pertama).';

  @override
  String get irFinderDatabaseInitFailed => 'Basis data inisialisasi gagal.';

  @override
  String get irFinderPreparingDatabase => 'Preparing local IR kode basis data…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Basis data-assisted pencarian';

  @override
  String get irFinderBrand => 'Merek';

  @override
  String get irFinderSelectBrand => 'Pilih merek';

  @override
  String get irFinderModelOptional => 'Model (opsional)';

  @override
  String get irFinderSelectBrandFirstShort => 'Pilih merek terlebih dahulu';

  @override
  String get irFinderSelectModelRecommended => 'Pilih a model (disarankan)';

  @override
  String get irFinderOnlySelectedProtocol => 'Only terpilih protokol';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Menyaring tombol ke protokol yang dipilih. Nonaktifkan untuk melihat semua protokol.';

  @override
  String get irFinderQuickWinsFirst => 'Kemenangan cepat dulu';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Memprioritaskan tombol gaya POWER, MUTE, VOL, dan CH sebelum tombol lain.';

  @override
  String get irFinderMaxKeysPerRun => 'Maks tombol untuk diuji (per jalan)';

  @override
  String get irFinderTesting => 'Menguji…';

  @override
  String get irFinderCooldown => 'Jeda';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'Mode';

  @override
  String get irFinderRetryLast => 'Coba lagi last';

  @override
  String get irFinderTrigger => 'Pemicu';

  @override
  String get irFinderJump => 'Lompat…';

  @override
  String get irFinderSaveHit => 'Simpan hit';

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
    return 'Last attempted kode: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Mulai uji untuk melihat kode terakhir yang dicoba.';

  @override
  String irFinderFromDb(Object value) {
    return 'Dari DB: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'Dari brute-force (dibuat oleh pengode protokol).';

  @override
  String irFinderSendError(Object error) {
    return 'Kirim galat: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Sumber: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Hasil mendukung Uji dan Salin langsung. Integrasi tambah-ke-remote langsung dapat diperluas di alur editor.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Jelajahi kandidat DB';

  @override
  String get irFinderFilterByLabelOrHex => 'Saring menurut label atau hex…';

  @override
  String get irFinderJumpHere => 'Lompat ke sini';

  @override
  String get irFinderSelectModel => 'Pilih model';

  @override
  String get irFinderSearchBrands => 'Cari brands…';

  @override
  String get irFinderSearchModels => 'Cari models…';

  @override
  String get iconPickerTitle => 'Pilih Ikon';

  @override
  String get iconPickerSearchHint => 'Cari icons...';

  @override
  String get iconPickerNoIconsFound => 'Tidak ada icons found';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count icons tersedia';
  }

  @override
  String get iconPickerCategoryAll => 'Semua';

  @override
  String get iconPickerCategoryMedia => 'Media';

  @override
  String get iconPickerCategoryVolume => 'Volume';

  @override
  String get iconPickerCategoryNavigation => 'Navigasi';

  @override
  String get iconPickerCategoryPower => 'Daya';

  @override
  String get iconPickerCategoryNumbers => 'Angka';

  @override
  String get iconPickerCategorySettings => 'Setelan';

  @override
  String get iconPickerCategoryDisplay => 'Tampilan';

  @override
  String get iconPickerCategoryInput => 'Masukan';

  @override
  String get iconPickerCategoryFavorite => 'Favorit';

  @override
  String get universalPowerTitle => 'Universal Daya';

  @override
  String get universalPowerRunTab => 'Jalankan';

  @override
  String get universalPowerUseResponsibly => 'Gunakan responsibly';

  @override
  String get universalPowerConsentBody =>
      'Universal Daya memutar kode daya IR. Gunakan hanya pada perangkat yang Anda miliki atau kendalikan. Hentikan segera saat perangkat merespons.';

  @override
  String get universalPowerConsentCheckbox =>
      'Saya memiliki atau mengendalikan perangkat';

  @override
  String get universalPowerSetupBody =>
      'Memutar kode daya untuk merek terpilih. Hentikan segera saat perangkat merespons.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Terakhir dikirim: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Tidak ada kode daya ditemukan. Coba perluas pencarian.';

  @override
  String get universalPowerUnableToStart => 'Tidak dapat memulai.';

  @override
  String get universalPowerAllBrands => 'Semua brands (tidak ada filter)';

  @override
  String get universalPowerClearBrandFilter => 'Clear merek filter';

  @override
  String get universalPowerBroadenSearch => 'Perluas pencarian bila perlu';

  @override
  String get universalPowerBroadenSearchHint =>
      'Jika tidak ada label daya ditemukan, sertakan tombol lain.';

  @override
  String get universalPowerAdditionalPatternsDepth => 'Kedalaman pola tambahan';

  @override
  String get universalPowerDepth1 => 'Hanya prioritas: POWER/OFF';

  @override
  String get universalPowerDepth2 => 'Sertakan alias POWER';

  @override
  String get universalPowerDepth3 => 'Include secondary daya labels';

  @override
  String get universalPowerDepth4 => 'Include semua labels (lowest priority)';

  @override
  String get universalPowerLoopUntilStopped => 'Loop sampai dihentikan';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Terus memutar antrean sampai Anda menghentikannya.';

  @override
  String get universalPowerDelayBetweenCodes => 'Jeda between codes';

  @override
  String get universalPowerStart => 'Mulai Universal Daya';

  @override
  String get universalPowerRunStatus => 'Status jalan';

  @override
  String universalPowerProgress(Object value) {
    return 'Progres: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Dijeda karena aplikasi dipindah ke latar belakang.';

  @override
  String get universalPowerSendOneCode => 'Kirim one kode';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Hentikan segera saat perangkat merespons.';

  @override
  String get iconNamePlay => 'Play';

  @override
  String get iconNamePause => 'Jeda';

  @override
  String get iconNameStop => 'Hentikan';

  @override
  String get iconNameFastForward => 'Maju Cepat';

  @override
  String get iconNameRewind => 'Rewind';

  @override
  String get iconNameSkipNext => 'Skip Berikutnya';

  @override
  String get iconNameSkipPrevious => 'Lewati Sebelumnya';

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
  String get iconNameRecordAlt => 'Rekam Alt';

  @override
  String get iconNameEject => 'Eject';

  @override
  String get iconNameShuffle => 'Shuffle';

  @override
  String get iconNameRepeat => 'Repeat';

  @override
  String get iconNameRepeatOne => 'Ulang Satu';

  @override
  String get iconNameVolumeUp => 'Volume Atas';

  @override
  String get iconNameVolumeDown => 'Volume Bawah';

  @override
  String get iconNameVolumeOff => 'Volume Nonaktif';

  @override
  String get iconNameMute => 'Bisu';

  @override
  String get iconNameSpeaker => 'Speaker';

  @override
  String get iconNameSurroundSound => 'Suara Surround';

  @override
  String get iconNameEqualizer => 'Equalizer';

  @override
  String get iconNameAudio => 'Audio';

  @override
  String get iconNameMicrophone => 'Microphone';

  @override
  String get iconNameMicOff => 'Mic Nonaktif';

  @override
  String get iconNameUp => 'Atas';

  @override
  String get iconNameDown => 'Bawah';

  @override
  String get iconNameLeft => 'Kiri';

  @override
  String get iconNameRight => 'Kanan';

  @override
  String get iconNameArrowUp => 'Panah Atas';

  @override
  String get iconNameArrowDown => 'Panah Bawah';

  @override
  String get iconNameArrowLeft => 'Panah Kiri';

  @override
  String get iconNameArrowRight => 'Panah Kanan';

  @override
  String get iconNameNavigation => 'Navigasi';

  @override
  String get iconNameChevronLeft => 'Chevron Kiri';

  @override
  String get iconNameChevronRight => 'Chevron Kanan';

  @override
  String get iconNameExpandLess => 'Ciutkan';

  @override
  String get iconNameExpandMore => 'Expand Lainnya';

  @override
  String get iconNameCollapse => 'Collapse';

  @override
  String get iconNameExpand => 'Expand';

  @override
  String get iconNameCircleUp => 'Lingkaran Atas';

  @override
  String get iconNameCircleDown => 'Lingkaran Bawah';

  @override
  String get iconNameCircleLeft => 'Lingkaran Kiri';

  @override
  String get iconNameCircleRight => 'Lingkaran Kanan';

  @override
  String get iconNameOkSelect => 'OK/Pilih';

  @override
  String get iconNameConfirm => 'Konfirmasi';

  @override
  String get iconNameCancel => 'Batal';

  @override
  String get iconNameClose => 'Tutup';

  @override
  String get iconNameHome => 'Home';

  @override
  String get iconNameReturn => 'Return';

  @override
  String get iconNameExit => 'Exit';

  @override
  String get iconNameUndo => 'Urungkan';

  @override
  String get iconNameRedo => 'Redo';

  @override
  String get iconNamePower => 'Daya';

  @override
  String get iconNamePowerAlt => 'Daya Alt';

  @override
  String get iconNamePowerOff => 'Daya Nonaktif';

  @override
  String get iconNameOn => 'Aktif';

  @override
  String get iconNameOff => 'Nonaktif';

  @override
  String get iconNameToggleOn => 'Toggle Aktif';

  @override
  String get iconNameToggleOff => 'Toggle Nonaktif';

  @override
  String get iconNameRestart => 'Mulai Ulang';

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
  String get iconNameOne => 'Satu';

  @override
  String get iconNameTwo => 'Dua';

  @override
  String get iconNameThree => 'Tiga';

  @override
  String get iconNameFour => 'Empat';

  @override
  String get iconNameFive => 'Lima';

  @override
  String get iconNameSix => 'Enam';

  @override
  String get iconNamePlus => 'Plus';

  @override
  String get iconNameMinus => 'Minus';

  @override
  String get iconNameAddCircle => 'Tambah Lingkaran';

  @override
  String get iconNameRemoveCircle => 'Remove Lingkaran';

  @override
  String get iconNameSettings => 'Setelan';

  @override
  String get iconNameMenu => 'Menu';

  @override
  String get iconNameMoreVertical => 'Lainnya Vertical';

  @override
  String get iconNameMoreHorizontal => 'Lainnya Horizontal';

  @override
  String get iconNameTune => 'Tuning';

  @override
  String get iconNameRemoteSettings => 'Remote Setelan';

  @override
  String get iconNameInfo => 'Info';

  @override
  String get iconNameInfoOutline => 'Info Outline';

  @override
  String get iconNameHelp => 'Bantuan';

  @override
  String get iconNameHelpOutline => 'Bantuan Outline';

  @override
  String get iconNameList => 'Daftar';

  @override
  String get iconNameViewList => 'Lihat List';

  @override
  String get iconNameViewGrid => 'Lihat Kisi';

  @override
  String get iconNameApps => 'Aplikasi';

  @override
  String get iconNameWidgets => 'Widget';

  @override
  String get iconNameTv => 'TV';

  @override
  String get iconNameMonitor => 'Monitor';

  @override
  String get iconNameDesktop => 'Desktop';

  @override
  String get iconNameBrightnessHigh => 'Kecerahan High';

  @override
  String get iconNameBrightnessMedium => 'Kecerahan Medium';

  @override
  String get iconNameBrightnessLow => 'Kecerahan Low';

  @override
  String get iconNameAutoBrightness => 'Otomatis Kecerahan';

  @override
  String get iconNameLightMode => 'Terang Mode';

  @override
  String get iconNameDarkMode => 'Gelap Mode';

  @override
  String get iconNameContrast => 'Contrast';

  @override
  String get iconNameHdrOn => 'HDR Aktif';

  @override
  String get iconNameHdrOff => 'HDR Nonaktif';

  @override
  String get iconNameAspectRatio => 'Aspect Ratio';

  @override
  String get iconNameCrop => 'Crop';

  @override
  String get iconNameZoomIn => 'Perbesar';

  @override
  String get iconNameZoomOut => 'Zoom Out';

  @override
  String get iconNameFullscreen => 'Layar penuh';

  @override
  String get iconNameExitFullscreen => 'Exit Layar penuh';

  @override
  String get iconNameFitScreen => 'Fit Screen';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'Crop Free';

  @override
  String get iconNameInput => 'Masukan';

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
  String get iconNameMusicQueue => 'Musik Queue';

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
  String get iconNameAntenna => 'Antena';

  @override
  String get iconNameFavorite => 'Favorit';

  @override
  String get iconNameFavoriteOutline => 'Favorite Outline';

  @override
  String get iconNameStar => 'Bintang';

  @override
  String get iconNameStarOutline => 'Star Outline';

  @override
  String get iconNameBookmark => 'Bookmark';

  @override
  String get iconNameBookmarkOutline => 'Bookmark Outline';

  @override
  String get iconNameFlag => 'Bendera';

  @override
  String get iconNameCheck => 'Check';

  @override
  String get iconNameDone => 'Selesai';

  @override
  String get iconNameDoneAll => 'Done Semua';

  @override
  String get iconNameSchedule => 'Schedule';

  @override
  String get iconNameTimer => 'Timer';

  @override
  String get iconNameTime => 'Waktu';

  @override
  String get iconNameAlarm => 'Alarm';

  @override
  String get iconNameNotifications => 'Notifications';

  @override
  String get iconNameLock => 'Kunci';

  @override
  String get iconNameUnlock => 'Unlock';

  @override
  String get iconNameLight => 'Terang';

  @override
  String get iconNameLightOutline => 'Terang Outline';

  @override
  String get iconNameWarmLight => 'Warm Terang';

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
  String get iconNamePalette => 'Palet';

  @override
  String get iconNameColor => 'Color';

  @override
  String get iconNameTonality => 'Tonality';

  @override
  String get iconNameSearch => 'Cari';

  @override
  String get iconNameRefresh => 'Segarkan';

  @override
  String get iconNameSync => 'Sinkron';

  @override
  String get iconNameUpdate => 'Update';

  @override
  String get iconNameDownload => 'Download';

  @override
  String get iconNameUpload => 'Upload';

  @override
  String get iconNameCloud => 'Awan';

  @override
  String get iconNameFolder => 'Folder';

  @override
  String get iconNameDelete => 'Hapus';

  @override
  String get iconNameEdit => 'Ubah';

  @override
  String get iconNameSave => 'Simpan';

  @override
  String get iconNameShare => 'Share';

  @override
  String get iconNamePrint => 'Print';

  @override
  String get iconNameLanguage => 'Bahasa';

  @override
  String get iconNameTranslate => 'Translate';

  @override
  String get iconNameMicNone => 'Tanpa Mikrofon';

  @override
  String get iconNameSubtitles => 'Subtitles';

  @override
  String get iconNameClosedCaption => 'Closed Caption';

  @override
  String get iconNameMusic => 'Musik';

  @override
  String get iconNameMovie => 'Movie';

  @override
  String get iconNameTheater => 'Teater';

  @override
  String get iconNameLiveTv => 'TV Langsung';

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
  String get iconNameVideoSettings => 'Video Setelan';

  @override
  String get iconNameAudioTrack => 'Audio Track';

  @override
  String get iconNameGraphicEq => 'Graphic EQ';

  @override
  String get iconNameMusicVideo => 'Musik Video';

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
  String get iconNamePauseFa => 'Jeda FA';

  @override
  String get iconNameStopFa => 'Hentikan FA';

  @override
  String get iconNamePlayFaOutline => 'Play FA Outline';

  @override
  String get iconNamePauseFaOutline => 'Jeda FA Outline';

  @override
  String get iconNameStopFaOutline => 'Hentikan FA Outline';

  @override
  String get iconNameBackwardFa => 'Backward FA';

  @override
  String get iconNameForwardFa => 'Forward FA';

  @override
  String get iconNamePreviousFa => 'Previous FA';

  @override
  String get iconNameNextFa => 'Berikutnya FA';

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
  String get iconNameMusicFa => 'Musik FA';

  @override
  String get iconNameMicrophoneFa => 'Microphone FA';

  @override
  String get iconNameCameraFa => 'Kamera FA';

  @override
  String get iconNameCameraRetroFa => 'Kamera Retro FA';

  @override
  String get iconNameVolumeHighFa => 'Volume High FA';

  @override
  String get iconNameVolumeLowFa => 'Volume Low FA';

  @override
  String get iconNameVolumeOffFa => 'Volume Nonaktif FA';

  @override
  String get iconNameMuteFa => 'Bisu FA';

  @override
  String get iconNameMicMuteFa => 'Mic Bisu FA';

  @override
  String get iconNameHeadphonesFa => 'Headphones FA';

  @override
  String get iconNameSpeakerFa => 'Speaker FA';

  @override
  String get iconNameUpFa => 'Atas FA';

  @override
  String get iconNameDownFa => 'Bawah FA';

  @override
  String get iconNameLeftFa => 'Kiri FA';

  @override
  String get iconNameRightFa => 'Kanan FA';

  @override
  String get iconNameUpFaOutline => 'Atas FA Outline';

  @override
  String get iconNameDownFaOutline => 'Bawah FA Outline';

  @override
  String get iconNameLeftFaOutline => 'Kiri FA Outline';

  @override
  String get iconNameRightFaOutline => 'Kanan FA Outline';

  @override
  String get iconNameArrowUpFa => 'Panah Atas FA';

  @override
  String get iconNameArrowDownFa => 'Panah Bawah FA';

  @override
  String get iconNameArrowLeftFa => 'Panah Kiri FA';

  @override
  String get iconNameArrowRightFa => 'Panah Kanan FA';

  @override
  String get iconNameChevronUpFa => 'Chevron Atas FA';

  @override
  String get iconNameChevronDownFa => 'Chevron Bawah FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron Kiri FA';

  @override
  String get iconNameChevronRightFa => 'Chevron Kanan FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Outline';

  @override
  String get iconNameCheckFa => 'Check FA';

  @override
  String get iconNameCloseFa => 'Tutup FA';

  @override
  String get iconNameCloseCircleFa => 'Tutup Lingkaran FA';

  @override
  String get iconNameHomeFa => 'Home FA';

  @override
  String get iconNameUndoFa => 'Undo FA';

  @override
  String get iconNameRedoFa => 'Redo FA';

  @override
  String get iconNameRotateFa => 'Rotate FA';

  @override
  String get iconNameSearchFa => 'Cari FA';

  @override
  String get iconNameRefreshFa => 'Refresh FA';

  @override
  String get iconNamePowerOffFa => 'Daya Nonaktif FA';

  @override
  String get iconNamePlugFa => 'Plug FA';

  @override
  String get iconNameToggleOnFa => 'Toggle Aktif FA';

  @override
  String get iconNameToggleOffFa => 'Toggle Nonaktif FA';

  @override
  String get iconNameSettingsFa => 'Setelan FA';

  @override
  String get iconNameSettingsAltFa => 'Setelan Alt FA';

  @override
  String get iconNameMenuFa => 'Menu FA';

  @override
  String get iconNameMoreFa => 'Lainnya FA';

  @override
  String get iconNameMoreVerticalFa => 'Lainnya Vertical FA';

  @override
  String get iconNameInfoFa => 'Info FA';

  @override
  String get iconNameInfoFaOutline => 'Info FA Outline';

  @override
  String get iconNameHelpFa => 'Bantuan FA';

  @override
  String get iconNameHelpFaOutline => 'Bantuan FA Outline';

  @override
  String get iconNameListFa => 'List FA';

  @override
  String get iconNameGridFa => 'Kisi FA';

  @override
  String get iconNameSlidersFa => 'Sliders FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'Monitor FA';

  @override
  String get iconNameDesktopFa => 'Desktop FA';

  @override
  String get iconNameBrightnessFa => 'Kecerahan FA';

  @override
  String get iconNameNightModeFa => 'Night Mode FA';

  @override
  String get iconNameLightFa => 'Terang FA';

  @override
  String get iconNameLightFaOutline => 'Terang FA Outline';

  @override
  String get iconNameFlashFa => 'Flash FA';

  @override
  String get iconNameFullscreenFa => 'Layar penuh FA';

  @override
  String get iconNameExitFullscreenFa => 'Exit Layar penuh FA';

  @override
  String get iconNameZoomInFa => 'Zoom In FA';

  @override
  String get iconNameZoomOutFa => 'Zoom Out FA';

  @override
  String get iconNameSubtitlesFa => 'Subtitles FA';

  @override
  String get iconNamePictureInPictureFa => 'Gambar dalam Gambar FA';

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
  String get iconNameCloudFa => 'Awan FA';

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
  String get iconNameImageFa => 'Gambar FA';

  @override
  String get iconNameVideoFileFa => 'Video File FA';

  @override
  String get iconNameAudioFileFa => 'Audio File FA';

  @override
  String get iconNamePlayOutlineFa => 'Play Outline FA';

  @override
  String get iconNamePlaySimpleFa => 'Play Simple FA';

  @override
  String get iconNamePauseSimpleFa => 'Jeda Simple FA';

  @override
  String get iconNameStopSimpleFa => 'Hentikan Simple FA';

  @override
  String get iconNameRecordFa => 'Record FA';

  @override
  String get iconNameStopCircleFa => 'Hentikan Lingkaran FA';

  @override
  String get iconNameLoadingFa => 'Loading FA';

  @override
  String get iconNameTextFa => 'Text FA';

  @override
  String get iconNameTextSizeFa => 'Text Size FA';

  @override
  String get iconNameLanguageFa => 'Bahasa FA';

  @override
  String get iconNameGlobeFa => 'Globe FA';

  @override
  String get iconNameSubtitlesAltFa => 'Subtitles Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Subjudul Alt Outline FA';

  @override
  String get iconNameChannelUpFa => 'Channel Atas FA';

  @override
  String get iconNameChannelDownFa => 'Channel Bawah FA';

  @override
  String get iconNamePageUpFa => 'Page Atas FA';

  @override
  String get iconNamePageDownFa => 'Page Bawah FA';

  @override
  String get iconNameGuideFa => 'Guide FA';

  @override
  String get iconNameGridViewFa => 'Kisi Lihat FA';

  @override
  String get iconNameGridAltFa => 'Kisi Alt FA';

  @override
  String get iconNameScheduleFa => 'Schedule FA';

  @override
  String get iconNameCalendarFa => 'Calendar FA';

  @override
  String get iconNameRedButtonFa => 'Red Tombol FA';

  @override
  String get iconNameButtonOutlineFa => 'Tombol Outline FA';

  @override
  String get iconNameSquareButtonFa => 'Persegi Tombol FA';

  @override
  String get iconNameSquareOutlineFa => 'Persegi Outline FA';

  @override
  String get iconNameDotCircleFa => 'Dot Lingkaran FA';

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
  String get iconNameSortDownFa => 'Sort Bawah FA';

  @override
  String get iconNameSortUpFa => 'Sort Atas FA';

  @override
  String get iconNameSleepFa => 'Sleep FA';

  @override
  String get iconNameTimerStartFa => 'Timer Mulai FA';

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
  String get iconNameSquareFullFa => 'Persegi Full FA';

  @override
  String get iconNameFullscreenAltFa => 'Layar penuh Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Zoom Plus FA';

  @override
  String get iconNameZoomMinusFa => 'Zoom Minus FA';

  @override
  String get iconNameMusicNoteFa => 'Musik Note FA';

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
  String get iconNameCircleArrowUpFa => 'Lingkaran Panah Atas FA';

  @override
  String get iconNameCircleArrowDownFa => 'Lingkaran Panah Bawah FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Lingkaran Panah Kiri FA';

  @override
  String get iconNameCircleArrowRightFa => 'Lingkaran Panah Kanan FA';

  @override
  String get iconNameLongArrowUpFa => 'Long Panah Atas FA';

  @override
  String get iconNameLongArrowDownFa => 'Long Panah Bawah FA';

  @override
  String get iconNameLongArrowLeftFa => 'Long Panah Kiri FA';

  @override
  String get iconNameLongArrowRightFa => 'Long Panah Kanan FA';

  @override
  String get iconNamePlusFa => 'Plus FA';

  @override
  String get iconNameMinusFa => 'Minus FA';

  @override
  String get iconNamePlusCircleFa => 'Plus Lingkaran FA';

  @override
  String get iconNameMinusCircleFa => 'Minus Lingkaran FA';

  @override
  String get iconNamePlusSquareFa => 'Plus Persegi FA';

  @override
  String get iconNameMinusSquareFa => 'Minus Persegi FA';

  @override
  String get iconNameTimesFa => 'Times FA';

  @override
  String get iconNameTimesCircleFa => 'Times Lingkaran FA';

  @override
  String get iconNameBatteryFullFa => 'Baterai Full FA';

  @override
  String get iconNameBattery34Fa => 'Baterai 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'Baterai Half FA';

  @override
  String get iconNameBattery14Fa => 'Baterai 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'Baterai Empty FA';

  @override
  String get iconNameChargingFa => 'Charging FA';

  @override
  String get iconNameCloudSunFa => 'Awan Sun FA';

  @override
  String get iconNameCloudMoonFa => 'Awan Moon FA';

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
  String get unknownLabel => 'Tidak dikenal';

  @override
  String get selectedFilesLabel => 'terpilih file(s)';

  @override
  String get folderNotFoundOrInaccessible =>
      'Folder tidak ditemukan atau tidak bisa diakses.';

  @override
  String get importedRemoteDefaultName => 'RemoteImpor';

  @override
  String get demoRemoteName => 'Remote Demo';

  @override
  String get protocolFieldsInvalid =>
      'Isi bidang protokol wajib dan pastikan frekuensi 15k–60k bila diatur.';

  @override
  String get unknownProtocolSelected => 'Tidak dikenal protokol terpilih.';

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
  String get learningModeCaptureFailed => 'Pengambilan pembelajaran gagal.';

  @override
  String get learningModeReplaySent => 'Sinyal yang dipelajari diputar ulang.';

  @override
  String get learningModeReplayFailed =>
      'Sinyal yang dipelajari tidak dapat diputar ulang.';

  @override
  String get learningModeNoRemotesAvailable =>
      'Belum ada remote yang disimpan.';

  @override
  String get learningModeChooseRemoteTitle => 'Pilih jarak jauh';

  @override
  String get learningModeNewRemoteTitle => 'Buat kendali jarak jauh baru';

  @override
  String get learningModeSaveSuccess => 'Tombol yang dipelajari disimpan.';

  @override
  String get learningModeSaveFailed =>
      'Tombol yang dipelajari tidak dapat disimpan.';

  @override
  String get remoteSetupIntro =>
      'Pilih nama dan tata letak terlebih dahulu. Setelah itu Anda dapat menambahkan tombol.';

  @override
  String get startWithDefault => 'Mulai dengan default';

  @override
  String get browseGithubStore => 'Telusuri GitHub Store';

  @override
  String get addFirstButton => 'Tambah tombol pertama';

  @override
  String get moreWaysToStart => 'Cara lain untuk memulai';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Buang pengaturan remote baru ini dan tinggalkan layar ini?';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Buang perubahan remote dan tinggalkan layar ini?';

  @override
  String get firstButtonAdded => 'Tombol pertama ditambahkan.';

  @override
  String get iconColorTitle => 'Warna ikon';

  @override
  String get iconColorHelper =>
      'Pilih warna simbol yang tetap terlihat jelas di atas latar tombol.';

  @override
  String get colorRed => 'Merah';

  @override
  String get colorPink => 'Merah muda';

  @override
  String get colorPurple => 'Ungu';

  @override
  String get colorDeepPurple => 'Ungu tua';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorBlue => 'Biru';

  @override
  String get colorLightBlue => 'Biru muda';

  @override
  String get colorCyan => 'Sian';

  @override
  String get colorTeal => 'Teal';

  @override
  String get colorGreen => 'Hijau';

  @override
  String get colorLightGreen => 'Hijau muda';

  @override
  String get colorLime => 'Limau';

  @override
  String get colorYellow => 'Kuning';

  @override
  String get colorAmber => 'Amber';

  @override
  String get colorOrange => 'Oranye';

  @override
  String get colorDeepOrange => 'Oranye tua';

  @override
  String get colorBrown => 'Cokelat';

  @override
  String get colorGrey => 'Abu-abu';

  @override
  String get colorBlueGrey => 'Biru abu-abu';

  @override
  String get colorBlack => 'Hitam';

  @override
  String get colorWhite => 'Putih';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Warna tombol $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Warna tombol $colorName, dipilih';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Warna ikon $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Warna ikon $colorName, dipilih';
  }
}
