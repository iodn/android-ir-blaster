// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Memuat…';

  @override
  String get unknownError => 'Ralat tidak diketahui';

  @override
  String get failedToStart => 'Gagal bermula';

  @override
  String get retry => 'Cuba lagi';

  @override
  String get quickTilePower => 'Daya';

  @override
  String get quickTileMute => 'Senyap';

  @override
  String get quickTileVolumeUp => 'Vol +';

  @override
  String get quickTileVolumeDown => 'Vol -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Telefon ini tidak mempunyai pemancar IR terbina dalam. Dongel IR USB dikesan, tetapi izin belum diberi.\n\nBenarkan dialog izin USB untuk mengaktifkan penghantaran IR.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'Telefon ini tidak mempunyai pemancar IR terbina dalam. Dongel IR USB dikesan, tetapi izin USB ditolak.\n\nMinta izin lagi kemudian benarkan dialog untuk mengaktifkan penghantaran IR.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'Telefon ini tidak mempunyai pemancar IR terbina dalam. Dongel IR USB dibenarkan, tetapi belum dimulakan.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Telefon ini tidak mempunyai pemancar IR terbina dalam. Dongel IR USB dikesan dan dibenarkan, tetapi gagal dimulakan.\n\nSambung semula dongel kemudian cuba lagi.';

  @override
  String get homeUsbReadyMessage =>
      'Telefon ini tidak mempunyai pemancar IR terbina dalam.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Telefon ini tidak mempunyai pemancar IR terbina dalam, dan tiada dongel IR USB yang disokong sedang tersambung.\n\nAnda masih boleh membuat, mengimport, dan mengurus remote, tetapi untuk menghantar isyarat IR anda memerlukan salah satu pilihan di bawah.';

  @override
  String get homeUsbOptionPlugIn =>
      'Sambung dongel IR USB yang disokong, kemudian benarkan izin.';

  @override
  String get homeUsbOptionReady => 'Sedia digunakan.';

  @override
  String get homeUsbOptionPermissionRequired => 'Terpasang. Perlu izin.';

  @override
  String get homeUsbOptionPermissionDenied => 'Izin ditolak. Minta lagi.';

  @override
  String get homeUsbOptionPermissionGranted => 'Dibenarkan. Memula dongel.';

  @override
  String get homeUsbOptionOpenFailed => 'Dibenarkan, tapi gagal memula.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Telefon ini tiada IR terbina dalam. Sambung dongel IR USB atau aktifkan mod Audio di Tetapan.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Dongel USB dikesan. Izin diperlukan untuk menghantar IR.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Izin USB ditolak. Minta lagi untuk menghantar IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Dongel USB dibenarkan. Menunggu permulaan.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Dongel USB dibenarkan, tetapi permulaan gagal.';

  @override
  String get homeHardwareBannerReady => 'USB sedia.';

  @override
  String get homeHardwareRequiredTitle =>
      'Peranti IR diperlukan untuk hantar arahan';

  @override
  String get homeUsbDongleRecommended => 'Dongel IR USB (disyorkan)';

  @override
  String get homeAudioAdapterAlternative => 'Adaptor IR audio (alternatif)';

  @override
  String get homeAudioAdapterDescription =>
      'Tetapan → Pemancar IR → Audio (1 LED / 2 LED). Memerlukan penyesuai audio-ke-IR.';

  @override
  String get close => 'Tutup';

  @override
  String get homeChooseTransmitter => 'Pilih pemancar';

  @override
  String get openSettings => 'Buka Tetapan';

  @override
  String get homeUsbPermissionSentApprove =>
      'Permintaan izin USB dihantar. Benarkan dialog untuk mengaktifkan USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'Tiada dongel IR USB yang disokong dikesan. Sambung kemudian cuba lagi.';

  @override
  String get homeUsbPermissionRequestFailed => 'Gagal meminta izin USB.';

  @override
  String get working => 'Sedang bekerja…';

  @override
  String get requestUsbPermission => 'Minta izin USB';

  @override
  String get homeHardwareTip =>
      'Tip: Anda masih boleh membuat dan mengatur remote sekarang. Peranti keras hanya diperlukan saat menghantar.';

  @override
  String get homeNoIrTransmitterTitle => 'Tiada pemancar IR';

  @override
  String get homeHardwareRequiredBody =>
      'IR Blaster boleh mencipta dan mengurus alat kawalan jauh pada mana-mana telefon. Tetapi untuk benar-benar menghantar arahan inframerah, peranti anda memerlukan salah satu pilihan perkakasan di bawah.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Anda masih boleh mencipta, mengimport dan menyusun alat kawalan jauh sekarang.';

  @override
  String get homeWaysToUseIrBlaster => 'Cara menggunakan IR Blaster';

  @override
  String get homeBuiltInIrOptionTitle => 'Telefon dengan IR terbina dalam';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Berfungsi pada telefon yang disokong dengan pemancar IR terbina dalam. Telefon ini tidak memilikinya.';

  @override
  String get homeBuiltInIrUnavailable => 'Tidak tersedia pada telefon ini';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'Penyesuai audio 3.5 mm';

  @override
  String get homeContinueWithoutHardware => 'Teruskan tanpa perkakasan';

  @override
  String get homeHowItWorks => 'Cara ia berfungsi';

  @override
  String get settingsNavLabel => 'Tetapan';

  @override
  String get dismiss => 'Tutup';

  @override
  String get remotesNavLabel => 'Remote';

  @override
  String get macrosNavLabel => 'Makro';

  @override
  String get signalTesterNavLabel => 'Penguji Isyarat';

  @override
  String get settingsTitle => 'Tetapan';

  @override
  String get remoteNoIrEmitterTitle => 'Tiada pemancar IR';

  @override
  String get remoteNoIrEmitterMessage => 'Peranti ini tiada pemancar IR';

  @override
  String get remoteNoIrEmitterNeedsEmitter => 'Aplikasi ini perlu pemancar IR';

  @override
  String get remoteDismiss => 'Tutup';

  @override
  String get remoteClose => 'Tutup';

  @override
  String remoteFailedToSend(Object error) {
    return 'Gagal menghantar IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Gagal memula loop: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Loop berhenti (gagal kirim): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Mengulang \"$title\". Tekan Hentikan di bilah atas untuk berhenti.';
  }

  @override
  String get remoteLoopStopped => 'Loop berhenti.';

  @override
  String get remoteUpdatedNotFound =>
      'Remote diperbarui di layar. Remote tidak ditemui di daftar tersimpan.';

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
      'Remote tidak ditemui di daftar tersimpan.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Dihapus \"$name\".';
  }

  @override
  String get buttonFallbackTitle => 'Butang';

  @override
  String get imageFallbackTitle => 'Gambar';

  @override
  String get noBrowserAvailable => 'Tiada browser';

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
      'Ini akan mengganti remote semasa dengan remote demo terbina dalam. Sandaran disyorkan jika anda mahu menyimpan senarai semasa.';

  @override
  String get settingsRestoreDemoConfirm => 'Pulihkan demo';

  @override
  String get settingsDemoRemotesRestored => 'Remote demo dipulihkan.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Hapus semua remote?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Ini menghapus semua remote dari peranti ini. Tindakan ini tidak boleh dibatalkan.';

  @override
  String get settingsDeleteAllConfirm => 'Hapus semua';

  @override
  String get settingsAllRemotesDeleted => 'Semua remote dihapus.';

  @override
  String get themeAuto => 'Tema Automatik';

  @override
  String get themeLight => 'Tema Cerah';

  @override
  String get themeDark => 'Tema Gelap';

  @override
  String get themeDescAuto => 'Mengikuti tetapan peranti';

  @override
  String get themeDescLight => 'Sekemudian terang dan jelas';

  @override
  String get themeDescDark => 'Nyaman di mata';

  @override
  String get themeHintAuto =>
      'Tema berubah automatik apabila tetapan peranti bertukar antara mod cerah dan gelap';

  @override
  String get themeHintLight => 'Cocok untuk siang hari dan tempat terang';

  @override
  String get themeHintDark =>
      'Mengurangi lelah mata pada kondisi minim cahaya dan menghemat baterai di layar OLED';

  @override
  String get supportDevelopmentTitle => 'Dukung Pengembangan';

  @override
  String get supportDevelopmentSubtitle =>
      'Bantu IR Blaster kekal terjaga dan serasi perkakasan';

  @override
  String get supportDevelopmentBody =>
      'Tiada iklan, tiada penjejakan, tiada ciri terkunci. Sokongan anda membantu pembangunan protokol, sokongan dongel USB, dan keserasian yang lebih baik merentas peranti.';

  @override
  String get donate => 'Donasi';

  @override
  String get starRepo => 'Bintang repositori';

  @override
  String get repositoryLinkCopied => 'Pautan repositori disalin';

  @override
  String get supportPillLocalOnly => 'Hanya lokal';

  @override
  String get supportPillNoTracking => 'Tanpa pelacakan';

  @override
  String get supportPillHardwareAware => 'Sadar peranti';

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
    return 'Automatik: memakai $language';
  }

  @override
  String get localizationAutoDescription =>
      'Aplikasi mengikuti bahasa peranti bila memungkinkan.';

  @override
  String get localizationManualDescription =>
      'Bahasa aplikasi ditetapkan manual.';

  @override
  String get useSystemLanguageTitle => 'Gunakan bahasa sistem';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Mengikuti bahasa peranti: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Gunakan bahasa yang dipilih di bawah, bukan default peranti.';

  @override
  String get chooseAppLanguage => 'Pilih bahasa aplikasi';

  @override
  String get languagePickerDisabledHint =>
      'Matikan bahasa sistem untuk pilih bahasa secara manual.';

  @override
  String get searchLanguages => 'Cari bahasa';

  @override
  String get noLanguagesFound => 'Tiada bahasa cocok';

  @override
  String get localizationHint =>
      'Saat bahasa sistem aktif, aplikasi mengikuti lokal peranti dan kembali ke Inggeris jika terjemahan tidak tersedia. Matikan agar aplikasi terkunci ke bahasa tertentu.';

  @override
  String get appLanguageTitle => 'Bahasa aplikasi';

  @override
  String get appLanguageHint =>
      'Automatik mengikuti bahasa peranti. Pilih Inggeris atau Perancis di sini untuk menimpa hanya di aplikasi.';

  @override
  String get languageAuto => 'Automatik (sistem)';

  @override
  String get languageAutoDescription => 'Ikut bahasa peranti secara automatik';

  @override
  String get languageEnglish => 'Inggeris';

  @override
  String get languageEnglishDescription =>
      'Paksa aplikasi sentiasa guna Inggeris';

  @override
  String get languageFrench => 'Perancis';

  @override
  String get languageFrenchDescription =>
      'Paksa aplikasi sentiasa guna Perancis';

  @override
  String get languageAutoShort => 'Auto';

  @override
  String get languageEnglishShort => 'Inggeris';

  @override
  String get languageFrenchShort => 'Perancis';

  @override
  String get useDynamicColors => 'Gunakan warna dinamis';

  @override
  String get themeChoiceAuto => 'Automatik';

  @override
  String get themeChoiceLight => 'Cerah';

  @override
  String get themeChoiceDark => 'Gelap';

  @override
  String get irTransmitterTitle => 'Pemancar IR';

  @override
  String get irTransmitterSubtitle => 'Pilih peranti yang menghantar arahan IR';

  @override
  String get learningModeEntryTitle => 'Mod Pembelajaran';

  @override
  String get learningModeEntrySubtitle =>
      'Tangkap butang dari jarak jauh fizikal langkah demi langkah';

  @override
  String get learningModeTitle => 'Mod Pembelajaran';

  @override
  String get learningModeHeroTitle => 'Belajar butang jauh dengan bersih';

  @override
  String get learningModeHeroSubtitle =>
      'Sediakan penerima anda, sediakan alat kawalan jauh asal, tangkap satu arahan, kemudian semaknya sebelum menyimpannya ke dalam alat kawalan jauh.';

  @override
  String get learningModeReadyBadge => 'Penerima sedia';

  @override
  String get learningModeNeedsPermissionBadge => 'Kebenaran USB diperlukan';

  @override
  String get learningModeSetupBadge => 'Persediaan penerima diperlukan';

  @override
  String get learningModeNoReceiverBadge => 'Tiada penerima pembelajaran';

  @override
  String get learningModeCheckingBadge => 'Menyemak perkakasan';

  @override
  String get learningModeFourStepFlow => 'Aliran berpandu 4 langkah';

  @override
  String get learningModeSaveAnywhereBadge => 'Semak sebelum menyimpan';

  @override
  String get learningModeGuideTitle =>
      'Ambil tempat penangkapan sepatutnya berlaku';

  @override
  String get learningModeStepHardwareShort => 'Perkakasan';

  @override
  String get learningModeStepPrepareShort => 'Sediakan';

  @override
  String get learningModeStepCaptureShort => 'Tangkap';

  @override
  String get learningModeStepReviewShort => 'Semakan';

  @override
  String get learningModeStepHardwareTitle => 'Periksa perkakasan penerima';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Pastikan penerima pembelajaran yang serasi dilampirkan dan dibenarkan sebelum memulakan.';

  @override
  String get learningModeCurrentSenderLabel => 'Pemancar semasa';

  @override
  String get learningModeReceiverStatusLabel => 'Status pembelajaran';

  @override
  String get learningModeCheckingHardwareBody =>
      'Memeriksa keadaan pemancar dan penerima USB yang tersedia.';

  @override
  String get learningModeHardwareReadyBody =>
      'Dongle IR USB dilampirkan dan dimulakan. Ini adalah tempat yang sesuai untuk memulakan aliran pembelajaran setelah pendawaian tangkapan disambungkan.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Dongle USB ada, tetapi kebenaran Android masih menyekatnya. Berikan kebenaran USB di bahagian pemancar sebelum belajar.';

  @override
  String get learningModeHardwareSetupBody =>
      'Dongle sebahagiannya dikesan, tetapi ia masih memerlukan persediaan atau penyambungan semula sebelum pembelajaran boleh bermula dengan pasti.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Tiada perkakasan penerima yang serasi tersedia pada masa ini. Mod pembelajaran bertujuan untuk dongle luaran yang disokong dengan keupayaan menerima.';

  @override
  String get learningModeRefreshHardware => 'Muat semula status perkakasan';

  @override
  String get learningModeHardwareTipTitle => 'Penempatan terbaik';

  @override
  String get learningModeHardwareTipBody =>
      'Mod Pembelajaran hidup di bawah Pemancar IR kerana ia bergantung pada ketersediaan perkakasan dan digunakan kurang kerap daripada menghantar alat kawalan jauh.';

  @override
  String get learningModeStepPrepareTitle => 'Sediakan alat kawalan jauh asal';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Tentukan perkara yang anda pelajari, kemudian pastikan alat kawalan jauh asal stabil dan dekat dengan penerima.';

  @override
  String get learningModeButtonNameLabel => 'Nama butang';

  @override
  String get learningModeButtonNameHint => 'Contohnya: HDMI 1, Kuasa, Menu';

  @override
  String get learningModeSinglePress => 'Akhbar tunggal';

  @override
  String get learningModeHoldButton => 'Butang tahan';

  @override
  String get learningModePreparationChecklistTitle => 'Sebelum anda menangkap';

  @override
  String get learningModePreparationItemDistance =>
      'Simpan alat kawalan jauh asal kira-kira 2 hingga 5 cm dari penerima.';

  @override
  String get learningModePreparationItemOneButton =>
      'Pelajari satu butang pada satu masa dan gunakan tekan pendek dan bersih dahulu.';

  @override
  String get learningModePreparationItemStill =>
      'Pastikan kedua-dua peranti stabil untuk mengelakkan tangkapan bising atau separa.';

  @override
  String get learningModeStepCaptureTitle => 'Tangkap isyarat';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Dengar satu arahan, kemudian kunci keputusan sebelum menyemaknya.';

  @override
  String get learningModeCaptureReadyTitle => 'Sedia untuk mendengar';

  @override
  String get learningModeCaptureReadyBody =>
      'Keadaan perkakasan anda kelihatan baik. Bahagian belakang tangkapan akan dipalamkan ke langkah ini seterusnya.';

  @override
  String get learningModeCaptureBlockedTitle => 'Perkakasan belum siap';

  @override
  String get learningModeCaptureBlockedBody =>
      'Anda masih boleh menyemak aliran sekarang, tetapi tangkapan hendaklah menunggu sehingga penerima sedia.';

  @override
  String get learningModeStartListening => 'Mula mendengar';

  @override
  String get learningModeCaptureStubTitle =>
      'Tangkap bahagian belakang datang seterusnya';

  @override
  String get learningModeCaptureStubBody =>
      'Skrin ini diperancah sepenuhnya terlebih dahulu supaya aliran tangkapan terakhir boleh dipalamkan ke dalam keadaan perkakasan sebenar dan bukannya disambungkan kemudian.';

  @override
  String get learningModeCaptureStubMessage =>
      'Belajar menangkap belum berwayar lagi. Skrin ini perancah aliran penuh terlebih dahulu.';

  @override
  String get learningModeUnnamedCapture => 'Tangkapan tanpa nama';

  @override
  String get learningModeStatusCheckingTitle => 'Memeriksa penerima';

  @override
  String get learningModeStatusNoReceiverTitle => 'Penerima tidak bersedia';

  @override
  String get learningModeStatusPermissionTitle => 'Kebenaran USB diperlukan';

  @override
  String get learningModeStatusSetupTitle => 'Penerima memerlukan persediaan';

  @override
  String get learningModeStatusReadyTitle => 'Bersedia untuk belajar';

  @override
  String get learningModeStatusListeningTitle => 'Mendengar isyarat';

  @override
  String get learningModeStatusCapturedTitle => 'Isyarat ditangkap';

  @override
  String get learningModeStatusReadyBody =>
      'Namakan butang, halakan alat kawalan jauh asal pada penerima, dan mula mendengar apabila anda sudah bersedia.';

  @override
  String get learningModeStatusListeningBody =>
      'Tekan butang jauh asal sekarang. Setelah tangkapan disambungkan, keadaan ini akan terkunci pada isyarat bersih seterusnya.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Pratonton isyarat yang dipelajari sedia untuk $buttonName. Main semula, sahkan ia berfungsi, kemudian simpan ke dalam pustaka anda.';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'Sambungkan dongle pembelajaran yang serasi';

  @override
  String get learningModeConnectReceiverBody =>
      'Mod pembelajaran bergantung pada perkakasan luaran yang boleh menerima IR. Setelah penerima dikesan dan dibenarkan, halaman ini menjadi aliran dengar, ujian dan simpan secara langsung.';

  @override
  String get learningModeListenCardTitle => 'Dengar satu butang';

  @override
  String get learningModeListenCardBody =>
      'Tetapkan label dahulu jika anda mahu, kemudian mula mendengar dan tekan butang pada alat kawalan jauh asal.';

  @override
  String get learningModeReadyToListenTitle => 'Sedia untuk mendengar';

  @override
  String get learningModeReadyToListenBody =>
      'Ini adalah permukaan tangkapan utama. Mula mendengar hanya apabila alat kawalan jauh asal dihalakan dan stabil.';

  @override
  String get learningModeListeningNowTitle => 'Mendengar sekarang';

  @override
  String get learningModeListeningNowBody =>
      'Tekan butang jauh asal sekali. Gunakan tangkapan pratonton untuk bergerak melalui seluruh perancah sebelum bahagian belakang tangkapan sebenar berwayar.';

  @override
  String get learningModePreviewCaptureAction =>
      'Pratonton isyarat yang ditangkap';

  @override
  String get learningModeCapturedSummary => 'Pratonton isyarat yang dipelajari';

  @override
  String get learningModeResultActionsTitle => 'Uji dan simpan';

  @override
  String get learningModeResultActionsBody =>
      'Main semula isyarat yang dipelajari, sahkan peranti sasaran bertindak balas, kemudian simpannya sebagai butang boleh guna semula.';

  @override
  String get learningModeReplayAction => 'Main semula';

  @override
  String get learningModeReplayStubMessage =>
      'Main semula belum berwayar. Ini ialah perancah UI untuk aliran pembelajaran, ujian dan simpan terakhir.';

  @override
  String get learningModeSaveStubMessage =>
      'Simpan belum berwayar lagi. Langkah seterusnya ialah menyambungkan skrin ini kepada Buat Butang dan alat kawalan jauh sedia ada.';

  @override
  String get learningModeLearnAnotherAction => 'Ketahui butang lain';

  @override
  String get learningModeStepReviewTitle => 'Semak dan simpan';

  @override
  String get learningModeStepReviewSubtitle =>
      'Sahkan apa yang telah dipelajari, kemudian pilih tempat ia harus tinggal di perpustakaan jauh anda.';

  @override
  String get learningModeSaveToExistingRemote => 'Jauh sedia ada';

  @override
  String get learningModeCreateNewRemote => 'Alat kawalan jauh baharu';

  @override
  String get learningModeProtocolPreviewTitle => 'Pratonton protokol';

  @override
  String get learningModeProtocolPreviewBody =>
      'Butiran protokol yang dinyahkod akan dipaparkan di sini sebaik sahaja penerima menangkap butang tekan bersih.';

  @override
  String get learningModeRawPreviewTitle => 'Sandaran mentah';

  @override
  String get learningModeRawPreviewBody =>
      'Jika penyahkodan tidak lengkap, tangkapan masa mentah masih tersedia di sini untuk semakan dan simpanan.';

  @override
  String get learningModeSaveCapture => 'Simpan tangkapan';

  @override
  String get learningModeReviewTipTitle => 'Ke mana ini akan pergi seterusnya';

  @override
  String get learningModeReviewTipBody =>
      'Langkah pelaksanaan seterusnya harus menyambungkan panel semakan ini kepada Buat Butang dan alat kawalan jauh sedia ada supaya isyarat yang dipelajari jatuh terus ke dalam pustaka anda.';

  @override
  String get learningModeFinishPreview => 'Selesai pratonton';

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
  String get forceInAppVibrationTitle => 'Paksa getaran dalam aplikasi';

  @override
  String get forceInAppVibrationSubtitle =>
      'Gunakan penggetar secara langsung walaupun maklum balas sentuhan sistem dimatikan';

  @override
  String get forceInAppVibrationWarning =>
      'Pilihan lanjutan. Aplikasi boleh bergetar walaupun maklum balas sentuhan Android dimatikan secara global.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'Intensitas';

  @override
  String get intensityLight => 'Cerah';

  @override
  String get intensityMedium => 'Sedang';

  @override
  String get intensityStrong => 'Kuat';

  @override
  String get flipRemoteDefaultTitle => 'Balik Tampilan Remote default';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Buka layar Remote diputar 180° (untuk dongel USB yang terpasang di bawah).';

  @override
  String get remoteViewFlipped => 'Tampilan Remote akan terbuka terbalik.';

  @override
  String get remoteViewNormal => 'Tampilan Remote akan terbuka normal.';

  @override
  String get backupTitle => 'Sandaran';

  @override
  String get backupSubtitle => 'Import/ekspor remote dan makro';

  @override
  String get importBackup => 'Import sandaran';

  @override
  String get importBackupSubtitle =>
      'Import sandaran remote/makro atau file Flipper Zero, LIRC, atau IRPLUS';

  @override
  String get bulkImportFolder => 'Import massal folder';

  @override
  String get bulkImportFolderSubtitle => 'Import banyak remote dari folder';

  @override
  String get exportBackup => 'Ekspor sandaran';

  @override
  String get exportBackupSubtitle =>
      'Simpan remote + makro sebagai satu fail JSON ke Muat Turun';

  @override
  String get restoreDemoRemotes => 'Pulihkan remote demo';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Ganti remote semasa dengan demo terbina dalam';

  @override
  String get deleteAllRemotes => 'Hapus semua remote';

  @override
  String get deleteAllRemotesSubtitle => 'Hapus semua remote dari peranti ini';

  @override
  String get backupTip =>
      'Petua: eksport sandaran sebelum perubahan besar. Import menyokong sandaran penuh, sandaran JSON remote versi lama, dan fail Flipper Zero .ir.';

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
  String get sourceCode => 'Kod Sumber';

  @override
  String get viewOnGitHub => 'Lihat di GitHub';

  @override
  String get repositoryUrlCopied => 'URL repositori disalin';

  @override
  String get reportIssue => 'Laporkan Masalah';

  @override
  String get reportIssueSubtitle => 'Laporan bug dan permintaan fitur';

  @override
  String get issuesUrlCopied => 'URL isu disalin';

  @override
  String get license => 'Lisensi';

  @override
  String get openSourceLicense => 'Lisensi sumber terbuka';

  @override
  String get licenseUrlCopied => 'URL lesen disalin';

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
  String get deviceControlsTitle => 'Kawalan Peranti';

  @override
  String get deviceControlsSubtitle =>
      'Tampilkan butang kegemaran di halaman kawalan sistem';

  @override
  String get manageFavorites => 'Urus kegemaran';

  @override
  String get manageFavoritesSubtitle =>
      'Pilih which butang appear in peranti kawalan';

  @override
  String get quickSettingsTitle => 'Tetapan Cepat';

  @override
  String get quickSettingsSubtitle =>
      'Tambah jubin untuk pintasan daya dan volume';

  @override
  String get configureTiles => 'Atur jubin';

  @override
  String get configureTilesSubtitle => 'Petakan jubin ke butang remote';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Perputaran daya universal untuk peranti milik Anda';

  @override
  String get openTvKill => 'Buka TVKill';

  @override
  String get openTvKillSubtitle =>
      'Putar kod daya (gunakan hanya pada peranti milik Anda)';

  @override
  String get failedToLoadTransmitterSettings =>
      'Gagal memuat tetapan pemancar.';

  @override
  String get usbStatusReady => 'Dongel USB tersambung dan sedia menghantar IR.';

  @override
  String get usbStatusPermissionRequired =>
      'Dongel USB dikesan. Minta izin USB kemudian benarkan dialog sistem.';

  @override
  String get usbStatusPermissionDenied =>
      'Izin USB ditolak untuk dongel yang dipasang. Minta lagi kemudian benarkan dialog.';

  @override
  String get usbStatusPermissionGranted =>
      'Izin USB diberi. Dongel masih perlu dimulakan sebelum boleh menghantar IR.';

  @override
  String get usbStatusOpenFailed =>
      'Izin USB diberi, tetapi dongel gagal dimulakan. Sambung semula kemudian cuba lagi.';

  @override
  String get usbStatusNoDevice => 'Dongel IR USB yang disokong tidak dikesan.';

  @override
  String get usbSelectPermissionRequired =>
      'Dongel USB dikesan tetapi belum dibenarkan. Tekan \"Minta izin USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'Izin USB ditolak. Tekan \"Minta izin USB\" kemudian benarkan dialog.';

  @override
  String get usbSelectPermissionGranted =>
      'Izin USB diberi, tetapi dongel belum dimulakan. Cuba sambung semula.';

  @override
  String get usbSelectOpenFailed =>
      'Izin USB diberi, tetapi dongel gagal dimulakan. Sambung semula kemudian cuba lagi.';

  @override
  String get usbSelectNoDevice =>
      'Tiada dongel IR USB yang disokong dikesan. Sambung kemudian tekan \"Minta izin USB\".';

  @override
  String get usbSelectReady => 'Dongel IR USB sedia.';

  @override
  String get autoSwitchEnabledMessage =>
      'Alih automatik aktif: guna USB apabila tersambung, jika tidak Dalaman.';

  @override
  String get autoSwitchDisabledMessage =>
      'Alih automatik nonaktif: pemilihan pemancar sekarang manual.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Gagal memperbarui tetapan alih automatik.';

  @override
  String get failedToSwitchTransmitter => 'Gagal mengganti pemancar.';

  @override
  String get deviceHasNoInternalIr =>
      'Peranti ini tiada pemancar IR terbina dalam.';

  @override
  String get audioModeEnabledMessage =>
      'Mod Audio aktif. Gunakan volum media maksimum dan penyesuai LED audio-ke-IR.';

  @override
  String get usbPermissionRequestSent => 'Permintaan izin USB dihantar.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Permintaan izin USB dihantar. Benarkan dialog untuk mengaktifkan USB.';

  @override
  String get usbAlreadyReady => 'Dongel USB sudah dimulakan dan sedia.';

  @override
  String get failedToRequestUsbPermission => 'Gagal meminta izin USB.';

  @override
  String get transmitterHelpInternal =>
      'Gunakan pemancar IR terbina dalam telefon untuk menghantar perintah.';

  @override
  String get transmitterHelpUsb =>
      'Gunakan dongel IR USB (izin diperlukan) untuk menghantar arahan.';

  @override
  String get transmitterHelpAudio1 =>
      'Gunakan keluaran audio (mono). Memerlukan adaptor LED audio-ke-IR dan volume media tinggi.';

  @override
  String get transmitterHelpAudio2 =>
      'Gunakan output audio (stereo). Guna dua saluran untuk pemacu LED yang lebih baik dengan penyesuai yang serasi.';

  @override
  String get transmitterInternal => 'IR Dalaman';

  @override
  String get transmitterUsb => 'Dongel IR USB';

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
  String get autoSwitchTitle => 'Alih automatik';

  @override
  String get autoSwitchDisabledWhileAudio => 'Nonaktif saat mode Audio';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Guna USB apabila tersambung, jika tidak Dalaman';

  @override
  String get unavailableOnThisDevice => 'Tidak tersedia di peranti ini';

  @override
  String get openOnUsbAttachTitle => 'Buka saat USB terpasang';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android boleh mencadangkan membuka aplikasi apabila dongel IR USB yang disokong tersambung.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Akan mencadangkan membuka IR Blaster apabila dongel USB yang disokong dipasang.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Tidak akan mencadangkan buka apabila USB dipasang.';

  @override
  String get failedToUpdateSetting => 'Gagal memperbarui tetapan.';

  @override
  String get unnamedButton => 'Butang tanpa nama';

  @override
  String get iconFallback => 'Ikon';

  @override
  String get remoteListReorderHint =>
      'Mode urut ulang: tekan lama dan seret kartu untuk memindahkannya.';

  @override
  String get deleteRemoteTitle => 'Hapus remote?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" akan dihapus permanen. Tindakan ini tidak boleh dibatalkan.';
  }

  @override
  String get delete => 'Hapus';

  @override
  String get addToDeviceControlsTitle => 'Tambah ke Kawalan Peranti?';

  @override
  String get addToDeviceControlsDescription =>
      'Akses cepat di kawalan peranti sistem.';

  @override
  String get skip => 'Lewati';

  @override
  String get add => 'Tambah';

  @override
  String get addedToDeviceControls => 'Ditambahkan ke Kawalan Peranti.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Dihapus \"$name\". Tindakan ini tidak boleh dibatalkan.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count butang · $layout';
  }

  @override
  String get layoutComfort => 'Nyaman';

  @override
  String get layoutCompact => 'Padat';

  @override
  String get open => 'Buka';

  @override
  String get useThisRemote => 'Gunakan remote ini';

  @override
  String get edit => 'Ubah';

  @override
  String get editRemoteSubtitle => 'Ganti nama dan ubah butang';

  @override
  String get thisCannotBeUndone => 'Ini tidak boleh dibatalkan';

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
      'Buat remote untuk mula menghantar kod IR.';

  @override
  String get noRemotesNextStep =>
      'Berikutnya: tekan Tambah remote, kemudian tambahkan butang pertama.';

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
      'Automasikan urutan arahan IR dengan masa yang tepat';

  @override
  String get timedMacrosNextStep =>
      'Berikutnya: tekan Buat Makro Pertama, pilih remote, kemudian tambahkan perintah dan jeda.';

  @override
  String get macroFeatureToysTitle => 'Cocok untuk Mainan Interaktif';

  @override
  String get macroFeatureToysDescription =>
      'Kendalikan peranti seperti anjing robot i-cybie, robot i-sobot, dan mainan lain yang memerlukan jeda antarperintah untuk memproses aksi.';

  @override
  String get macroFeatureTimingTitle => 'Kawalan Waktu Presisi';

  @override
  String get macroFeatureTimingDescription =>
      'Tambahkan jeda antarperintah (250ms hingga durasi kustom) agar peranti punya waktu merespons sebelum aksi berikutnya.';

  @override
  String get macroFeatureManualTitle => 'Langkah Lanjut Manual';

  @override
  String get macroFeatureManualDescription =>
      'Jeda eksekusi dan tunggu konfirmasi Anda saat durasi animasi berubah atau Anda perlu umpan balik visual.';

  @override
  String get exampleUseCase => 'Contoh Penggunaan';

  @override
  String get macroExampleText =>
      'Mode Lanjut i-cybie:\n1. Kirim perintah \"Mode\"\n2. Tunggu 1000ms (mainan memproses)\n3. Kirim \"Aksi 1\"\n4. Tunggu 1000ms\n5. Kirim \"Aksi 2\"\n…dan seterusnya automatik!';

  @override
  String get createFirstMacro => 'Buat Makro Pertama';

  @override
  String get noRemote => 'Tiada remote';

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
      'Makro Berjadual membolehkan anda mengautomasikan urutan arahan IR dengan jeda tepat pada setiap langkah.';

  @override
  String get sendCommand => 'Kirim Perintah';

  @override
  String get sendCommandDescription => 'Menghantar arahan IR dari remote anda.';

  @override
  String get delay => 'Jeda';

  @override
  String get delayDescription =>
      'Menunggu durasi tertentu (cth. 1000ms) sebelum langkah berikutnya.';

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
      'Anda boleh membatalkannya dari snackbar berikutnya.';

  @override
  String get noRemotesAvailable => 'Tiada remote tersedia.';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count butang(s)';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Orientasi: terbalik (tekan untuk normal)';

  @override
  String get remoteOrientationNormalTooltip =>
      'Orientasi: normal (tekan untuk balik)';

  @override
  String get stopLoop => 'Hentikan loop';

  @override
  String get reorderButtons => 'Reorder butang';

  @override
  String get remoteReorderHint =>
      'Mode urut ulang: tekan lama dan seret butang untuk memindahkannya.';

  @override
  String get manageRemote => 'Urus remote';

  @override
  String get remoteNoButtons => 'Tiada butang di remote ini';

  @override
  String get remoteNoButtonsDescription =>
      'Gunakan \"Ubah remote\" untuk menambah atau mengatur butang.';

  @override
  String get editRemote => 'Ubah remote';

  @override
  String get editRemoteActionsSubtitle =>
      'Ganti nama, urutkan ulang, dan ubah butang';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Diperbarui \"$name\".';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Ditambahkan \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Butang duplicated.';

  @override
  String get loopRunningForButton => 'Loop sedang berjalan untuk butang ini.';

  @override
  String get loopTip =>
      'Tip: gunakan Loop untuk mengulang sampai Anda menghentikannya.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Kod disalin.';

  @override
  String get copyCode => 'Copy kod';

  @override
  String get startLoop => 'Mula loop';

  @override
  String get editButtonSubtitle => 'Modify label, kod, protokol, frequency';

  @override
  String get newButton => 'New butang';

  @override
  String get newButtonSubtitle => 'Buat butang baru setelah butang ini';

  @override
  String get duplicate => 'Duplikat';

  @override
  String get duplicateButtonSubtitle => 'Buat salinan butang ini';

  @override
  String get removeFromDeviceControls => 'Hapus dari Kawalan Peranti';

  @override
  String get addToDeviceControls => 'Tambah ke Kawalan Peranti';

  @override
  String get deviceControlsButtonSubtitle =>
      'Menampilkan butang ini di kawalan peranti sistem';

  @override
  String get removedFromDeviceControls => 'Dihapus dari Kawalan Peranti.';

  @override
  String get pinQuickTile => 'Sematkan ke kegemaran Jubin Pantas';

  @override
  String get unpinQuickTile => 'Buang dari kegemaran Jubin Pantas';

  @override
  String get quickTileButtonSubtitle =>
      'Menampilkan butang ini di bagian atas pemilih jubin pantas';

  @override
  String get removedFromQuickTileFavorites =>
      'Dihapus dari kegemaran Jubin Pantas.';

  @override
  String get pinnedToQuickTileFavorites =>
      'Disematkan ke kegemaran Jubin Pantas.';

  @override
  String get duplicateAndEdit => 'Duplikat dan ubah';

  @override
  String get duplicateAndEditSubtitle => 'Buat salinan kemudian langsung ubah';

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
  String get removeButtonTitle => 'Remove butang?';

  @override
  String get imageButtonRemovedMessage => 'Butang gambar ini akan dihapus.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" akan dihapus.';
  }

  @override
  String get remove => 'Hapus';

  @override
  String importedButtonCount(int count) {
    return 'Mengimport $count butang.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Mengimport $count butang dari remote sedia ada.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Ubah label, isyarat, dan tetapan lanjutan';

  @override
  String get createButtonCopySubtitle => 'Buat salinan butang ini';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Buat salinan kemudian langsung ubah';

  @override
  String get undoAvailableInNextSnackbar =>
      'Anda boleh membatalkan dari snackbar berikutnya';

  @override
  String get buttonRemoved => 'Butang removed.';

  @override
  String get remoteNameCannotBeEmpty => 'Nama remote tidak boleh kosong.';

  @override
  String get saveRemote => 'Simpan remote';

  @override
  String get remoteName => 'Nama remote';

  @override
  String get remoteNameHint => 'cth. TV, Penghawa Dingin, Jalur LED';

  @override
  String get remoteNameHelper => 'Nama ini muncul di daftar Remote Anda.';

  @override
  String get layoutStyle => 'Gaya tata letak';

  @override
  String get layoutWideDescription =>
      'Luas: butang 2 kolom dengan detail tambahan (disyorkan).';

  @override
  String get layoutCompactDescription =>
      'Ringkas: kisi 4× klasik (ikon/teks saja).';

  @override
  String get importFromRemotes => 'Import dari remote';

  @override
  String get importFromDatabase => 'Import dari DB';

  @override
  String get addButton => 'Tambah butang';

  @override
  String get noButtonsYet => 'Tiada butang yet';

  @override
  String get createRemoteEmptyStateDescription =>
      'Tambahkan butang pertama, kemudian tekan lama untuk opsi ubah/hapus.';

  @override
  String get createButtonTitle => 'Buat Butang';

  @override
  String get editButtonTitle => 'Ubah Butang';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Gagal muat protocols: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Gagal muat pangkalan data butang: $error';
  }

  @override
  String get presetPower => 'Daya';

  @override
  String get presetVolume => 'Volum';

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
  String get buttonLabelStepTitle => 'Label butang';

  @override
  String get buttonLabelStepSubtitle =>
      'Pilih gambar, ikon, atau ketik label teks.';

  @override
  String get buttonColorStepTitle => 'Warna butang';

  @override
  String get buttonColorStepSubtitle => 'Pilih warna latar untuk butang ini.';

  @override
  String get selectColor => 'Pilih warna:';

  @override
  String get noImageSelected => 'Tiada gambar terpilih';

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
  String get noIconSelected => 'Tiada ikon terpilih';

  @override
  String get chooseIcon => 'Pilih Ikon';

  @override
  String get removeIcon => 'Remove ikon';

  @override
  String get requiredSelectIconOrSwitch =>
      'Wajib: pilih ikon atau beralih ke Gambar/Teks.';

  @override
  String get buttonText => 'Butang text';

  @override
  String get buttonTextHint => 'cth. Daya, Volum +, HDMI 1';

  @override
  String get buttonTextHelper => 'Teks ini akan muncul pada butang.';

  @override
  String get requiredEnterButtonLabel => 'Wajib: masukkan label butang.';

  @override
  String get defaultColorName => 'Lalai';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Remote baru dibuat dengan satu butang dari hasil terakhir.';

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
  String get copiedProtocolCode => 'Disalin (protokol:kod).';

  @override
  String get savedToResults => 'Disimpan ke Hasil.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Kod tidak sah untuk protokol: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Calon semasa disalin.';

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
  String get irSignalTester => 'Penguji Isyarat IR';

  @override
  String get stop => 'Hentikan';

  @override
  String get selectButton => 'Pilih butang';

  @override
  String get buttonNotFoundInRemotes => 'Butang tidak ditemui di remote.';

  @override
  String sentNamed(Object name) {
    return 'Menghantar \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'Kirim gagal: $error';
  }

  @override
  String get noFavoritesYet => 'Tiada kegemaran yet';

  @override
  String get deviceControlsEmptyHint =>
      'Tekan lama butang remote kemudian pilih \"Tambah ke Kawalan Peranti\".';

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
  String get brand => 'Jenama';

  @override
  String get model => 'Model';

  @override
  String get selectBrand => 'Pilih jenama';

  @override
  String get searchBrand => 'Cari jenama…';

  @override
  String get selectModel => 'Pilih model';

  @override
  String get searchModel => 'Cari model…';

  @override
  String get unnamedKey => 'Unnamed butang';

  @override
  String get unknown => 'Tidak dikenal';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'Cari arahans';

  @override
  String get noMatchingCommands => 'Tiada matching arahans';

  @override
  String get quickTileFavoritesTitle => 'Cepat jubin kegemaran';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Ubah pemetaan untuk jubin $tileLabel';
  }

  @override
  String get pickDifferentButton => 'Pilih butang lain';

  @override
  String get browseAllRemotesEllipsis => 'Browse semua remote…';

  @override
  String get invalidMacroFileFormat => 'Insah makro file format.';

  @override
  String get failedToParseMacroFile => 'Gagal parse makro file.';

  @override
  String get deviceCodeLabel => 'Peranti Kod';

  @override
  String get commandLabel => 'Perintah';

  @override
  String get editButtonCodeTitle => 'Ubah Kod butang';

  @override
  String get thisRemoteHasNoButtons => 'Remote ini tidak mempunyai butang.';

  @override
  String get selectCommand => 'Pilih Arahan';

  @override
  String get databaseModeAutofillHint =>
      'Mode Pangkalan data mengisi automatik Langkah 2 untuk Anda (jenama + model + protokol). Setelah mengimport butang, Anda boleh menyempurnakan apa pun di Manual.';

  @override
  String get test => 'Uji';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Semua butang terpilih adalah duplikat.';

  @override
  String get noButtonsImported => 'Tiada butang importted.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Mengimport $addedCount butang. Melangkau $skippedCount pendua.';
  }

  @override
  String get importAllMatchingTitle => 'Import semua matching butang?';

  @override
  String get noMatchingKeysFound => 'Tiada matching butang found.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Ini akan mengimport hingga $count butang yang sepadan dari pilihan pangkalan data semasa.';
  }

  @override
  String get importAll => 'Import semua';

  @override
  String get importingButtons => 'Importting butang…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Semua butang yang cocok adalah duplikat.';

  @override
  String get quickPresets => 'Cepat presets';

  @override
  String get selectDeviceFirst => 'Pilih peranti terlebih dahulu';

  @override
  String get searchByLabelOrHex => 'Cari menurut label atau hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Opsional: perhalus butang preset $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Pilih jenama, model, dan protokol terlebih dahulu.';

  @override
  String get importFromDatabaseTitle => 'Import dari pangkalan data';

  @override
  String get importFromDatabaseSubtitle =>
      'Pilih peranti, muat butang yang cocok, kemudian import butang terpilih.';

  @override
  String get deviceAndFilters => 'Peranti & filters';

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
      'Tiada protokol untuk jenama dan model ini.';

  @override
  String get protocolAutoDetected => 'Protokol';

  @override
  String get protocolAutoDetectedHelper =>
      'Dikesan automatik dari pangkalan data. Anda boleh mengubahnya sebelum import.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Pilih jenama, model, dan protokol untuk memuat butang.';

  @override
  String get noKeysFound => 'Tiada butang found.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Tiada butang ditemui untuk “$query”.';
  }

  @override
  String get skipDuplicates => 'Lewati duplikat';

  @override
  String get skipDuplicatesSubtitle =>
      'Jangan import butang yang sudah ada di remote ini.';

  @override
  String get importSelected => 'Import terpilih';

  @override
  String get noMacrosToExport => 'Tiada makro untuk diekspor.';

  @override
  String get macrosExportedToDownloads => 'Makro diekspor ke Unduhan.';

  @override
  String get failedToExportMacros => 'Gagal export makro.';

  @override
  String get failedToReadFile => 'Gagal read file.';

  @override
  String get importFromExistingRemotesTitle => 'Import dari Remote yang Ada';

  @override
  String selectedCount(int count) {
    return '$count terpilih';
  }

  @override
  String get noOtherRemotesWithButtons => 'Tiada remote lain dengan butang.';

  @override
  String get sourceRemote => 'Sumber remote';

  @override
  String get searchButtons => 'Cari butang';

  @override
  String get searchButtonsHint => 'Kuasa, Volum, Senyap...';

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
  String get legacyCode => 'Lama kod';

  @override
  String importCount(int count) {
    return 'Import $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Izin penyimpanan ditolak (diperlukan di beberapa peranti Android lama).';

  @override
  String get backupExportedToDownloads => 'Sandaran diekspor ke Unduhan.';

  @override
  String failedToExport(Object error) {
    return 'Gagal export: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Mengimport $count remote dari sandaran JSON lama. Makro tidak diubah.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Import gagal: \"remotes\" dalam sandaran mesti berupa senarai JSON jika ada.';

  @override
  String get importFailedMacrosMustBeList =>
      'Import gagal: \"macros\" dalam sandaran mesti berupa senarai JSON jika ada.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Import gagal: format sandaran tidak sah (diharapkan List atau Map lama dengan remote/makro).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Mengimport $remoteCount remote dari sandaran. Makro tidak diubah.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Mengimport $remoteCount remote dan $macroCount makro dari sandaran.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Import gagal: tiada butang sah di file .ir.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Mengimport 1 remote dari Flipper .ir. Makro tidak diubah.';

  @override
  String get importFailedInvalidIrplus =>
      'Import gagal: file irplus tidak sah (tiada butang sah).';

  @override
  String get importedOneRemoteFromIrplus =>
      'Mengimport 1 remote dari irplus. Makro tidak diubah.';

  @override
  String get importFailedInvalidLirc =>
      'Import gagal: file LIRC tidak sah (tiada kod/kod mentah sah).';

  @override
  String get importedOneRemoteFromLirc =>
      'Mengimport 1 remote dari konfigurasi LIRC. Makro tidak diubah.';

  @override
  String get unsupportedFileTypeSelected => 'Unsupported file type terpilih.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Import gagal: file tidak sah atau tidak boleh dibaca.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Import massal selesai: tiada file yang disokong di folder.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Import pukal selesai: tiada remote diimport. Melangkau $skippedCount fail.';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Import massal selesai: mengimport $importedCount remote dari $supportedCount file yang disokong. Melewati $skippedCount file.';
  }

  @override
  String get storagePermissionDenied => 'Storage izin ditolak.';

  @override
  String get bulkImportFailedReadFolder =>
      'Import massal gagal: tidak dapat membaca isi folder.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Import massal complete: tiada disokong file found ($sourceLabel).';
  }

  @override
  String get clearAction => 'Bersihkan';

  @override
  String get saveAction => 'Simpan';

  @override
  String buttonsTitleCount(int count) {
    return 'Butang ($count)';
  }

  @override
  String get invalidStepEncountered => 'Insah langkah encountered';

  @override
  String failedToSendNamed(Object name) {
    return 'Gagal send: $name';
  }

  @override
  String get buttonNotFound => 'Butang tidak ditemui';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Butang tidak ditemui: $name';
  }

  @override
  String get unknownButton => 'Tidak dikenal Butang';

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
      'Orientasi: terbalik (tekan untuk normal)';

  @override
  String get orientationNormalTooltip =>
      'Orientasi: normal (tekan untuk balik)';

  @override
  String get noSteps => 'Tiada langkah';

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
  String get ready => 'Sedia';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total langkah';
  }

  @override
  String get waiting => 'Menunggu';

  @override
  String secondsRemaining(Object seconds) {
    return 'Baki ${seconds}s';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Tekan Lanjut saat sedia untuk langkah berikutnya';

  @override
  String get error => 'Galat';

  @override
  String get macroCompleted => 'Makro selesai';

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
  String get startMacro => 'Mula Makro';

  @override
  String get continueAction => 'Lanjut';

  @override
  String get unnamedRemote => 'Remote tanpa nama';

  @override
  String get enterMacroName => 'Masukkan nama makro';

  @override
  String get addAtLeastOneStep => 'Tambah at least one langkah';

  @override
  String get fixInvalidSteps => 'Fix tidak sah langkah';

  @override
  String get unknownCommand => 'Tidak dikenal Arahan';

  @override
  String get unnamedCommand => 'Perintah tanpa nama';

  @override
  String get iconCommand => 'Ikon Arahan';

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
  String get delayMillisecondsHint => 'cth. 3000';

  @override
  String get recommendedDelayRange =>
      'Disyorkan: 250-5000ms untuk sebagian besar peranti';

  @override
  String get enterValidPositiveNumber => 'Masukkan angka positif yang sah';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Remote';

  @override
  String get macroName => 'Nama makro';

  @override
  String get macroNameHint => 'cth. i-cybie Mode Lanjut';

  @override
  String stepsTitleCount(int count) {
    return 'Langkah ($count)';
  }

  @override
  String get noStepsYet => 'Tiada langkah yet';

  @override
  String get addCommandsAndDelaysHint =>
      'Tambahkan perintah dan jeda di bawah untuk menyusun urutan';

  @override
  String get addStep => 'Tambah Langkah';

  @override
  String get reorderStepsHint =>
      'Tip: seret pegangan untuk mengurut ulang langkah. Tekan langkah untuk mengubahnya.';

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
  String get invalidStepTapToFix => 'Langkah tidak sah, tekan untuk baiki';

  @override
  String get sendIrCommand => 'Hantar arahan IR';

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
  String get layoutWide => 'Luas';

  @override
  String get iconButton => 'Ikon butang';

  @override
  String get imageButton => 'Gambar butang';

  @override
  String get noSignalInfo => 'Tiada info isyarat';

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
  String get start => 'Mula';

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
  String get noDescriptionAvailable => 'Tiada description tersedia.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Vendor Kaseikyo harus tepat 4 digit heksadesimal.';

  @override
  String get irFinderDatabaseNotReady => 'Pangkalan data belum sedia.';

  @override
  String get irFinderSelectBrandFirst =>
      'Pilih jenama terlebih dahulu di Sediakan.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute-force belum tersedia untuk protokol ini.';

  @override
  String get irFinderInvalidPrefix => 'Insah awalan.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Jenama: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Model: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Butang: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Remote #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Masukkan indeks berbasis 0 dalam hasil pangkalan data yang difilter dan diurutkan.';

  @override
  String get irFinderJumpCursorHelper =>
      'Masukkan kursor heksadesimal berbasis 0 dalam ruang brute-force.';

  @override
  String get irFinderSetupTab => 'Sediakan';

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
      'Belum ada hasil tersimpan. Di halaman Uji, tekan \"Simpan hasil\" saat peranti merespons.';

  @override
  String get irFinderBackToTest => 'Kembali ke Uji';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Ruang pencarian besar';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Ruang brute-force ini sangat besar ($human kemungkinan). IR Finder tetap akan menghormati had cubaan maksimum dan cooldown anda, tetapi berhati-hati agar tidak membanjiri peranti IR.\n\nSyor: guna mod Pangkalan data dahulu, dan/atau masukkan bait awalan yang diketahui untuk mengurangkan ruang.';
  }

  @override
  String get irFinderDatabaseSession => 'Pangkalan data session';

  @override
  String get irFinderBruteforceSession => 'Sesi brute-force';

  @override
  String get irFinderResumeLastSession => 'Lanjutkan last session';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Jenama: $brand · Model: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Awalan: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Progres: $progress · Mula: $when';
  }

  @override
  String get irFinderApplyResume => 'Apply & Lanjutkan';

  @override
  String get irFinderBruteforceMode => 'Brute-force';

  @override
  String get irFinderDatabaseAssistedMode => 'Pangkalan data-assisted';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Protokol: $name';
  }

  @override
  String get irFinderProtocolLabel => 'Protokol IR';

  @override
  String get irFinderProtocolHelper =>
      'Mengontrol enkod dan karena itu ruang pencarian.';

  @override
  String get irFinderKnownPrefixLabel =>
      'Awalan yang diketahui (byte hex, opsional)';

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
    return 'Payload: $digits digit heksadesimal · Awalan maks: $bytes byte';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Payload: $digits hex digit(s) · Contoh: $example · Max awalan: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Contoh: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Masukkan bait awalan yang diketahui untuk mengurangkan ruang carian.';

  @override
  String get irFinderDatabaseMode => 'Pangkalan data';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Normalized awalan: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Normalized awalan';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Brute-force belum dikonfigurasi untuk protokol ini.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Semua ($value)';
  }

  @override
  String get irFinderTestControls => 'Test kawalan';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Panjang payload: $digits digit heksadesimal.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Cari ruang: $value possibilities (after awalan constraints).';
  }

  @override
  String get irFinderCooldownMs => 'Jeda (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Maks percubaan (per jalan)';

  @override
  String get irFinderTestAllCombinations => 'Test semua combinations';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Berjalan sampai ruang pencarian habis. Batas efektif: $value';
  }

  @override
  String get irFinderAttempts => 'Percubaan';

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
      'Petua: guna mod Pangkalan data dahulu; brute-force paling baik dengan awalan yang diketahui, contohnya 1 hingga 4 bait pertama.';

  @override
  String get irFinderDatabaseInitFailed => 'Pangkalan data inisialisasi gagal.';

  @override
  String get irFinderPreparingDatabase =>
      'Menyedia pangkalan data kod IR setempat…';

  @override
  String get irFinderDatabaseAssistedSearch =>
      'Pangkalan data-assisted pencarian';

  @override
  String get irFinderBrand => 'Jenama';

  @override
  String get irFinderSelectBrand => 'Pilih jenama';

  @override
  String get irFinderModelOptional => 'Model (opsional)';

  @override
  String get irFinderSelectBrandFirstShort => 'Pilih jenama terlebih dahulu';

  @override
  String get irFinderSelectModelRecommended => 'Pilih a model (disyorkan)';

  @override
  String get irFinderOnlySelectedProtocol => 'Only terpilih protokol';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Menyaring butang ke protokol yang dipilih. Nonaktifkan untuk melihat semua protokol.';

  @override
  String get irFinderQuickWinsFirst => 'Kemenangan cepat dulu';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Utamakan butang gaya POWER, MUTE, VOL, dan CH sebelum butang lain.';

  @override
  String get irFinderMaxKeysPerRun => 'Maks butang untuk diuji (per jalan)';

  @override
  String get irFinderTesting => 'Menguji…';

  @override
  String get irFinderCooldown => 'Jeda';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'Mode';

  @override
  String get irFinderRetryLast => 'Cuba lagi last';

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
    return 'Last attempted kod: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Mula uji untuk melihat kod terakhir yang dicuba.';

  @override
  String irFinderFromDb(Object value) {
    return 'Dari DB: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'Dari brute-force (dijana oleh pengekod protokol).';

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
  String get iconPickerNoIconsFound => 'Tiada icons found';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count icons tersedia';
  }

  @override
  String get iconPickerCategoryAll => 'Semua';

  @override
  String get iconPickerCategoryMedia => 'Media';

  @override
  String get iconPickerCategoryVolume => 'Volum';

  @override
  String get iconPickerCategoryNavigation => 'Navigasi';

  @override
  String get iconPickerCategoryPower => 'Daya';

  @override
  String get iconPickerCategoryNumbers => 'Angka';

  @override
  String get iconPickerCategorySettings => 'Tetapan';

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
      'Kuasa Sejagat mengitar kod kuasa IR. Guna hanya pada peranti yang anda miliki atau kawal. Hentikan sebaik sahaja peranti memberi respons.';

  @override
  String get universalPowerConsentCheckbox =>
      'Saya memiliki atau mengendalikan peranti';

  @override
  String get universalPowerSetupBody =>
      'Memutar kod daya untuk jenama terpilih. Hentikan segera saat peranti merespons.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Terakhir dihantar: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Tiada kod daya ditemui. Cuba perluas pencarian.';

  @override
  String get universalPowerUnableToStart => 'Tidak dapat memula.';

  @override
  String get universalPowerAllBrands => 'Semua brands (tiada filter)';

  @override
  String get universalPowerClearBrandFilter => 'Clear jenama filter';

  @override
  String get universalPowerBroadenSearch => 'Perluas pencarian bila perlu';

  @override
  String get universalPowerBroadenSearchHint =>
      'Jika tiada label kuasa ditemui, sertakan butang lain.';

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
  String get universalPowerStart => 'Mula Universal Daya';

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
  String get universalPowerSendOneCode => 'Kirim one kod';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Hentikan segera saat peranti merespons.';

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
  String get iconNameVolumeUp => 'Volum Atas';

  @override
  String get iconNameVolumeDown => 'Volum Bawah';

  @override
  String get iconNameVolumeOff => 'Volum Nonaktif';

  @override
  String get iconNameMute => 'Senyap';

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
  String get iconNameRestart => 'Mula Ulang';

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
  String get iconNameSettings => 'Tetapan';

  @override
  String get iconNameMenu => 'Menu';

  @override
  String get iconNameMoreVertical => 'Lainnya Vertical';

  @override
  String get iconNameMoreHorizontal => 'Lainnya Horizontal';

  @override
  String get iconNameTune => 'Tuning';

  @override
  String get iconNameRemoteSettings => 'Remote Tetapan';

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
  String get iconNameAutoBrightness => 'Automatik Kecerahan';

  @override
  String get iconNameLightMode => 'Cerah Mode';

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
  String get iconNameLight => 'Cerah';

  @override
  String get iconNameLightOutline => 'Cerah Outline';

  @override
  String get iconNameWarmLight => 'Warm Cerah';

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
  String get iconNameVideoSettings => 'Video Tetapan';

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
  String get iconNameVolumeHighFa => 'Volum High FA';

  @override
  String get iconNameVolumeLowFa => 'Volum Low FA';

  @override
  String get iconNameVolumeOffFa => 'Volum Nonaktif FA';

  @override
  String get iconNameMuteFa => 'Senyap FA';

  @override
  String get iconNameMicMuteFa => 'Mic Senyap FA';

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
  String get iconNameSettingsFa => 'Tetapan FA';

  @override
  String get iconNameSettingsAltFa => 'Tetapan Alt FA';

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
  String get iconNameLightFa => 'Cerah FA';

  @override
  String get iconNameLightFaOutline => 'Cerah FA Outline';

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
  String get iconNameRedButtonFa => 'Red Butang FA';

  @override
  String get iconNameButtonOutlineFa => 'Butang Outline FA';

  @override
  String get iconNameSquareButtonFa => 'Persegi Butang FA';

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
  String get iconNameTimerStartFa => 'Timer Mula FA';

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
      'Folder tidak ditemui atau tidak boleh diakses.';

  @override
  String get importedRemoteDefaultName => 'RemoteImport';

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
  String get learningModeCaptureFailed => 'Gagal menangkap pembelajaran.';

  @override
  String get learningModeReplaySent =>
      'Isyarat yang dipelajari dimainkan semula.';

  @override
  String get learningModeReplayFailed =>
      'Isyarat yang dipelajari tidak dapat dimainkan semula.';

  @override
  String get learningModeNoRemotesAvailable =>
      'Masih belum ada alat kawalan jauh yang disimpan.';

  @override
  String get learningModeChooseRemoteTitle => 'Pilih alat kawalan jauh';

  @override
  String get learningModeNewRemoteTitle => 'Buat alat kawalan jauh baharu';

  @override
  String get learningModeSaveSuccess => 'Butang yang dipelajari disimpan.';

  @override
  String get learningModeSaveFailed =>
      'Butang yang dipelajari tidak dapat disimpan.';

  @override
  String get remoteSetupIntro =>
      'Pilih nama dan susun atur dahulu. Anda boleh menambah butang selepas itu.';

  @override
  String get startWithDefault => 'Mulakan dengan lalai';

  @override
  String get browseGithubStore => 'Semak GitHub Store';

  @override
  String get addFirstButton => 'Tambah butang pertama';

  @override
  String get moreWaysToStart => 'Lagi cara untuk bermula';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Buang persediaan alat kawalan jauh baharu ini dan tinggalkan skrin ini?';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Buang perubahan alat kawalan jauh dan tinggalkan skrin ini?';

  @override
  String get firstButtonAdded => 'Butang pertama ditambah.';

  @override
  String get iconColorTitle => 'Warna ikon';

  @override
  String get iconColorHelper =>
      'Pilih warna simbol yang kekal jelas pada latar butang.';

  @override
  String get colorRed => 'Merah';

  @override
  String get colorPink => 'Merah jambu';

  @override
  String get colorPurple => 'Ungu';

  @override
  String get colorDeepPurple => 'Ungu gelap';

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
  String get colorOrange => 'Oren';

  @override
  String get colorDeepOrange => 'Oren gelap';

  @override
  String get colorBrown => 'Coklat';

  @override
  String get colorGrey => 'Kelabu';

  @override
  String get colorBlueGrey => 'Biru kelabu';

  @override
  String get colorBlack => 'Hitam';

  @override
  String get colorWhite => 'Putih';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Warna butang $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Warna butang $colorName, dipilih';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Warna ikon $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Warna ikon $colorName, dipilih';
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
}
