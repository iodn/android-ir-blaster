// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Đang tải…';

  @override
  String get unknownError => 'Lỗi không rõ';

  @override
  String get failedToStart => 'Không khởi động được';

  @override
  String get retry => 'Thử lại';

  @override
  String get quickTilePower => 'Nguồn';

  @override
  String get quickTileMute => 'Tắt tiếng';

  @override
  String get quickTileVolumeUp => 'Âm +';

  @override
  String get quickTileVolumeDown => 'Âm -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Điện thoại này không có bộ phát IR tích hợp. Đã phát hiện USB IR dongle, nhưng chưa được cấp quyền.\n\nHãy chấp nhận lời nhắc quyền USB để bật gửi IR.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'Điện thoại này không có bộ phát IR tích hợp. Đã phát hiện USB IR dongle, nhưng quyền USB đã bị từ chối.\n\nHãy yêu cầu lại quyền và chấp nhận lời nhắc để bật gửi IR.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'Điện thoại này không có bộ phát IR tích hợp. USB IR dongle đã được cấp quyền, nhưng chưa được khởi tạo.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Điện thoại này không có bộ phát IR tích hợp. Đã phát hiện và cấp quyền cho USB IR dongle, nhưng không thể khởi tạo.\n\nHãy kết nối lại dongle và thử lại.';

  @override
  String get homeUsbReadyMessage =>
      'Điện thoại này không có bộ phát IR tích hợp.';

  @override
  String get homeUsbNoDeviceMessage =>
      'This phone does not include a built-in IR emitter, and hiện không có USB IR dongle được hỗ trợ nào được kết nối.\n\nBạn vẫn có thể tạo, nhập và quản lý điều khiển — nhưng để truyền tín hiệu IR bạn cần một trong các tùy chọn bên dưới.';

  @override
  String get homeUsbOptionPlugIn =>
      'Cắm USB IR dongle được hỗ trợ rồi chấp nhận quyền.';

  @override
  String get homeUsbOptionReady => 'Sẵn sàng sử dụng.';

  @override
  String get homeUsbOptionPermissionRequired => 'Đã cắm. Cần quyền.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Đã từ chối quyền. Hãy yêu cầu lại.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Đã cấp quyền. Đang khởi tạo dongle.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Đã cấp quyền, nhưng khởi tạo thất bại.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Điện thoại này không có IR tích hợp. Hãy kết nối USB IR dongle hoặc bật chế độ Audio trong Cài đặt.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Đã phát hiện USB dongle. Cần quyền để gửi IR.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Quyền USB đã bị từ chối. Hãy yêu cầu lại để gửi IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'USB dongle đã được cấp quyền. Đang chờ khởi tạo.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'USB dongle đã được cấp quyền, nhưng khởi tạo thất bại.';

  @override
  String get homeHardwareBannerReady => 'USB đã sẵn sàng.';

  @override
  String get homeHardwareRequiredTitle => 'Cần phần cứng IR để gửi lệnh';

  @override
  String get homeUsbDongleRecommended => 'USB IR dongle (khuyên dùng)';

  @override
  String get homeAudioAdapterAlternative => 'Bộ chuyển IR audio (thay thế)';

  @override
  String get homeAudioAdapterDescription =>
      'Cài đặt → Bộ phát IR → Audio (1 LED / 2 LED). Cần bộ chuyển audio sang IR.';

  @override
  String get close => 'Đóng';

  @override
  String get homeChooseTransmitter => 'Chọn bộ phát';

  @override
  String get openSettings => 'Mở Cài đặt';

  @override
  String get homeUsbPermissionSentApprove =>
      'Đã gửi yêu cầu quyền USB. Hãy chấp nhận lời nhắc để bật USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'Không phát hiện USB IR dongle được hỗ trợ. Hãy cắm vào rồi thử lại.';

  @override
  String get homeUsbPermissionRequestFailed => 'Không yêu cầu được quyền USB.';

  @override
  String get working => 'Đang xử lý…';

  @override
  String get requestUsbPermission => 'Yêu cầu quyền USB';

  @override
  String get homeHardwareTip =>
      'Mẹo: Bạn vẫn có thể tạo và sắp xếp điều khiển ngay bây giờ. Chỉ cần phần cứng khi truyền tín hiệu.';

  @override
  String get homeNoIrTransmitterTitle => 'Không có bộ phát IR khả dụng';

  @override
  String get settingsNavLabel => 'Cài đặt';

  @override
  String get dismiss => 'Bỏ qua';

  @override
  String get remotesNavLabel => 'Điều khiển';

  @override
  String get macrosNavLabel => 'Macro';

  @override
  String get signalTesterNavLabel => 'Kiểm tra tín hiệu';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get remoteNoIrEmitterTitle => 'Không có bộ phát IR';

  @override
  String get remoteNoIrEmitterMessage => 'Thiết bị này không có bộ phát IR';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Ứng dụng này cần bộ phát IR để hoạt động';

  @override
  String get remoteDismiss => 'Bỏ qua';

  @override
  String get remoteClose => 'Đóng';

  @override
  String remoteFailedToSend(Object error) {
    return 'Gửi IR thất bại: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Không khởi động được vòng lặp: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Đã dừng lặp (gửi thất bại): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Đang lặp \"$title\". Chạm Dừng trên thanh trên cùng để dừng.';
  }

  @override
  String get remoteLoopStopped => 'Đã dừng lặp.';

  @override
  String get remoteUpdatedNotFound =>
      'Điều khiển trên màn hình đã được cập nhật. Không tìm thấy trong danh sách đã lưu.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Đã cập nhật \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Xóa thất bại: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'Không tìm thấy điều khiển trong danh sách đã lưu.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Đã xóa \"$name\".';
  }

  @override
  String get buttonFallbackTitle => 'Nút';

  @override
  String get imageFallbackTitle => 'Hình ảnh';

  @override
  String get noBrowserAvailable => 'Không có trình duyệt';

  @override
  String failedToOpen(Object error) {
    return 'Mở thất bại: $error';
  }

  @override
  String get cancel => 'Hủy';

  @override
  String get settingsRestoreDemoTitle => 'Khôi phục điều khiển mẫu?';

  @override
  String get settingsRestoreDemoMessage =>
      'Thao tác này sẽ thay điều khiển hiện tại bằng điều khiển mẫu có sẵn. Nên sao lưu nếu bạn muốn giữ danh sách hiện tại.';

  @override
  String get settingsRestoreDemoConfirm => 'Khôi phục mẫu';

  @override
  String get settingsDemoRemotesRestored => 'Đã khôi phục điều khiển mẫu.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Xóa tất cả điều khiển?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Thao tác này sẽ xóa mọi điều khiển khỏi thiết bị này. Không thể hoàn tác.';

  @override
  String get settingsDeleteAllConfirm => 'Xóa tất cả';

  @override
  String get settingsAllRemotesDeleted => 'Đã xóa tất cả điều khiển.';

  @override
  String get themeAuto => 'Giao diện tự động';

  @override
  String get themeLight => 'Giao diện sáng';

  @override
  String get themeDark => 'Giao diện tối';

  @override
  String get themeDescAuto => 'Theo cài đặt thiết bị';

  @override
  String get themeDescLight => 'Luôn sáng rõ';

  @override
  String get themeDescDark => 'Dịu mắt';

  @override
  String get themeHintAuto =>
      'Giao diện sẽ tự động đổi khi bạn chuyển thiết bị giữa chế độ sáng và tối';

  @override
  String get themeHintLight => 'Phù hợp khi dùng ban ngày và nơi đủ sáng';

  @override
  String get themeHintDark =>
      'Giảm mỏi mắt trong môi trường thiếu sáng và tiết kiệm pin trên màn hình OLED';

  @override
  String get supportDevelopmentTitle => 'Ủng hộ phát triển';

  @override
  String get supportDevelopmentSubtitle =>
      'Giúp IR Blaster luôn được duy trì và tương thích phần cứng';

  @override
  String get supportDevelopmentBody =>
      'Không quảng cáo, không theo dõi, không khóa tính năng. Sự ủng hộ của bạn giúp phát triển giao thức, hỗ trợ USB dongle và tăng tương thích giữa các thiết bị.';

  @override
  String get donate => 'Ủng hộ';

  @override
  String get starRepo => 'Gắn sao repo';

  @override
  String get repositoryLinkCopied => 'Đã sao chép liên kết repo';

  @override
  String get supportPillLocalOnly => 'Chỉ cục bộ';

  @override
  String get supportPillNoTracking => 'Không theo dõi';

  @override
  String get supportPillHardwareAware => 'Hiểu phần cứng';

  @override
  String get supportPillOpenSource => 'Mã nguồn mở';

  @override
  String get appearanceTitle => 'Giao diện';

  @override
  String get appearanceSubtitle => 'Tùy chỉnh giao diện hiển thị';

  @override
  String get localizationTitle => 'Bản địa hóa';

  @override
  String get localizationSubtitle => 'Ngôn ngữ ứng dụng và cách dịch';

  @override
  String localizationAutoUsing(Object language) {
    return 'Tự động: đang dùng $language';
  }

  @override
  String get localizationAutoDescription =>
      'Ứng dụng sẽ theo ngôn ngữ thiết bị khi có thể.';

  @override
  String get localizationManualDescription =>
      'Ngôn ngữ ứng dụng đã được đặt thủ công.';

  @override
  String get useSystemLanguageTitle => 'Dùng ngôn ngữ hệ thống';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Đang theo ngôn ngữ thiết bị: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Dùng ngôn ngữ được chọn bên dưới thay cho mặc định của thiết bị.';

  @override
  String get chooseAppLanguage => 'Chọn ngôn ngữ ứng dụng';

  @override
  String get languagePickerDisabledHint =>
      'Tắt ngôn ngữ hệ thống để chọn ngôn ngữ thủ công.';

  @override
  String get searchLanguages => 'Tìm ngôn ngữ';

  @override
  String get noLanguagesFound => 'Không có ngôn ngữ phù hợp';

  @override
  String get localizationHint =>
      'Khi bật ngôn ngữ hệ thống, ứng dụng sẽ theo locale của thiết bị và dùng tiếng Anh nếu không có bản dịch. Tắt tùy chọn này để khóa ứng dụng ở một ngôn ngữ cụ thể.';

  @override
  String get appLanguageTitle => 'Ngôn ngữ ứng dụng';

  @override
  String get appLanguageHint =>
      'Tự động theo ngôn ngữ thiết bị. Chọn Tiếng Anh hoặc Tiếng Pháp ở đây để chỉ ghi đè cho ứng dụng.';

  @override
  String get languageAuto => 'Tự động (hệ thống)';

  @override
  String get languageAutoDescription => 'Tự động theo ngôn ngữ thiết bị';

  @override
  String get languageEnglish => 'Tiếng Anh';

  @override
  String get languageEnglishDescription => 'Luôn dùng tiếng Anh cho ứng dụng';

  @override
  String get languageFrench => 'Tiếng Pháp';

  @override
  String get languageFrenchDescription => 'Luôn dùng tiếng Pháp cho ứng dụng';

  @override
  String get languageAutoShort => 'Tự động';

  @override
  String get languageEnglishShort => 'Tiếng Anh';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'Dùng màu động';

  @override
  String get themeChoiceAuto => 'Tự động';

  @override
  String get themeChoiceLight => 'Nhẹ';

  @override
  String get themeChoiceDark => 'Tối';

  @override
  String get irTransmitterTitle => 'Bộ phát IR';

  @override
  String get irTransmitterSubtitle => 'Chọn phần cứng gửi lệnh IR';

  @override
  String get interactionTitle => 'Tương tác';

  @override
  String get interactionSubtitle => 'Phản hồi chạm và bố cục điều khiển';

  @override
  String get hapticFeedbackTitle => 'Phản hồi rung';

  @override
  String get hapticFeedbackSubtitle => 'Rung khi chạm và thao tác';

  @override
  String get forceInAppVibrationTitle => 'Buộc rung trong ứng dụng';

  @override
  String get forceInAppVibrationSubtitle =>
      'Dùng trực tiếp bộ rung ngay cả khi phản hồi chạm của hệ thống đã tắt';

  @override
  String get forceInAppVibrationWarning =>
      'Tùy chọn nâng cao. Ứng dụng có thể rung ngay cả khi phản hồi chạm của Android bị tắt trên toàn hệ thống.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'Cường độ';

  @override
  String get intensityLight => 'Nhẹ';

  @override
  String get intensityMedium => 'Vừa';

  @override
  String get intensityStrong => 'Mạnh';

  @override
  String get flipRemoteDefaultTitle => 'Mặc định lật màn hình điều khiển';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Mở màn hình điều khiển xoay 180° (cho USB dongle gắn dưới).';

  @override
  String get remoteViewFlipped => 'Màn hình điều khiển sẽ mở ở chế độ lật.';

  @override
  String get remoteViewNormal => 'Màn hình điều khiển sẽ mở bình thường.';

  @override
  String get backupTitle => 'Sao lưu';

  @override
  String get backupSubtitle => 'Nhập/xuất điều khiển và macro';

  @override
  String get importBackup => 'Nhập bản sao lưu';

  @override
  String get importBackupSubtitle =>
      'Nhập bản sao lưu điều khiển/macro hoặc tệp Flipper Zero, LIRC hay IRPLUS';

  @override
  String get bulkImportFolder => 'Nhập hàng loạt thư mục';

  @override
  String get bulkImportFolderSubtitle => 'Nhập nhiều điều khiển từ một thư mục';

  @override
  String get exportBackup => 'Xuất bản sao lưu';

  @override
  String get exportBackupSubtitle =>
      'Lưu điều khiển + macro thành một tệp JSON vào Downloads';

  @override
  String get restoreDemoRemotes => 'Khôi phục điều khiển mẫu';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Thay điều khiển hiện tại bằng bản mẫu có sẵn';

  @override
  String get deleteAllRemotes => 'Xóa tất cả điều khiển';

  @override
  String get deleteAllRemotesSubtitle => 'Xóa mọi điều khiển khỏi thiết bị này';

  @override
  String get backupTip =>
      'Tip: export a backup before large edits. Nhập hỗ trợ bản sao lưu đầy đủ, bản sao lưu JSON điều khiển cũ và tệp .ir của Flipper Zero.';

  @override
  String get aboutTitle => 'Giới thiệu';

  @override
  String get aboutSubtitle => 'Thông tin ứng dụng và chi tiết mã nguồn mở';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Phiên bản $version';
  }

  @override
  String get sourceCode => 'Mã nguồn';

  @override
  String get viewOnGitHub => 'Xem trên GitHub';

  @override
  String get repositoryUrlCopied => 'Đã sao chép URL repo';

  @override
  String get reportIssue => 'Báo lỗi';

  @override
  String get reportIssueSubtitle => 'Báo lỗi và yêu cầu tính năng';

  @override
  String get issuesUrlCopied => 'Đã sao chép URL lỗi';

  @override
  String get license => 'Giấy phép';

  @override
  String get openSourceLicense => 'Giấy phép mã nguồn mở';

  @override
  String get licenseUrlCopied => 'Đã sao chép URL giấy phép';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Truy cập website';

  @override
  String get companyUrlCopied => 'Đã sao chép URL công ty';

  @override
  String get licenses => 'Giấy phép';

  @override
  String get openSourceLicenses => 'Giấy phép mã nguồn mở';

  @override
  String byCreator(Object creator) {
    return 'bởi $creator';
  }

  @override
  String get deviceControlsTitle => 'Điều khiển thiết bị';

  @override
  String get deviceControlsSubtitle =>
      'Hiện nút yêu thích trong trang điều khiển hệ thống';

  @override
  String get manageFavorites => 'Quản lý mục yêu thích';

  @override
  String get manageFavoritesSubtitle =>
      'Chọn nút hiện trong điều khiển thiết bị';

  @override
  String get quickSettingsTitle => 'Cài đặt nhanh';

  @override
  String get quickSettingsSubtitle => 'Thêm ô cho phím tắt nguồn và âm lượng';

  @override
  String get configureTiles => 'Cấu hình ô';

  @override
  String get configureTilesSubtitle => 'Gán ô cho nút điều khiển';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle => 'Chu kỳ nguồn chung cho thiết bị của bạn';

  @override
  String get openTvKill => 'Mở TVKill';

  @override
  String get openTvKillSubtitle =>
      'Lặp mã nguồn (chỉ dùng với thiết bị của bạn)';

  @override
  String get failedToLoadTransmitterSettings =>
      'Không tải được cài đặt bộ phát.';

  @override
  String get usbStatusReady => 'USB dongle đã kết nối và sẵn sàng gửi IR.';

  @override
  String get usbStatusPermissionRequired =>
      'Đã phát hiện USB dongle. Hãy yêu cầu quyền USB và chấp nhận lời nhắc hệ thống.';

  @override
  String get usbStatusPermissionDenied =>
      'Quyền USB đã bị từ chối cho dongle đang gắn. Hãy yêu cầu lại và chấp nhận lời nhắc.';

  @override
  String get usbStatusPermissionGranted =>
      'Quyền USB đã được cấp. Dongle vẫn cần được khởi tạo trước khi có thể gửi IR.';

  @override
  String get usbStatusOpenFailed =>
      'Quyền USB đã được cấp, nhưng không thể khởi tạo dongle. Hãy kết nối lại rồi thử lại.';

  @override
  String get usbStatusNoDevice => 'Không phát hiện USB IR dongle được hỗ trợ.';

  @override
  String get usbSelectPermissionRequired =>
      'Đã phát hiện USB dongle nhưng chưa được cấp quyền. Hãy chạm \"Yêu cầu quyền USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'Quyền USB đã bị từ chối. Hãy chạm \"Yêu cầu quyền USB\" và chấp nhận lời nhắc.';

  @override
  String get usbSelectPermissionGranted =>
      'Quyền USB đã được cấp, nhưng dongle chưa được khởi tạo. Hãy thử kết nối lại.';

  @override
  String get usbSelectOpenFailed =>
      'Quyền USB đã được cấp, nhưng không thể khởi tạo dongle. Hãy kết nối lại rồi thử lại.';

  @override
  String get usbSelectNoDevice =>
      'Không phát hiện USB IR dongle được hỗ trợ. Hãy cắm vào rồi chạm \"Yêu cầu quyền USB\".';

  @override
  String get usbSelectReady => 'USB dongle đã sẵn sàng.';

  @override
  String get autoSwitchEnabledMessage =>
      'Đã bật tự chuyển: dùng USB khi kết nối, nếu không dùng tích hợp.';

  @override
  String get autoSwitchDisabledMessage =>
      'Đã tắt tự chuyển: giờ chọn bộ phát thủ công.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Không cập nhật được cài đặt tự chuyển.';

  @override
  String get failedToSwitchTransmitter => 'Không chuyển được bộ phát.';

  @override
  String get deviceHasNoInternalIr =>
      'Thiết bị này không có bộ phát IR tích hợp.';

  @override
  String get audioModeEnabledMessage =>
      'Đã bật chế độ Audio. Hãy dùng âm lượng media tối đa và bộ chuyển audio sang IR LED.';

  @override
  String get usbPermissionRequestSent => 'Đã gửi yêu cầu quyền USB.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Đã gửi yêu cầu quyền USB. Hãy chấp nhận lời nhắc để bật USB.';

  @override
  String get usbAlreadyReady => 'USB dongle đã được khởi tạo và sẵn sàng.';

  @override
  String get failedToRequestUsbPermission => 'Không yêu cầu được quyền USB.';

  @override
  String get transmitterHelpInternal =>
      'Dùng bộ phát IR tích hợp của điện thoại để gửi lệnh.';

  @override
  String get transmitterHelpUsb =>
      'Dùng USB IR dongle (cần quyền) để gửi lệnh.';

  @override
  String get transmitterHelpAudio1 =>
      'Dùng đầu ra audio (mono). Cần bộ chuyển audio sang IR và âm lượng media cao.';

  @override
  String get transmitterHelpAudio2 =>
      'Dùng đầu ra audio (stereo). Dùng hai kênh để điều khiển LED tốt hơn với bộ chuyển tương thích.';

  @override
  String get transmitterInternal => 'IR tích hợp';

  @override
  String get transmitterUsb => 'USB IR Dongle';

  @override
  String get transmitterAudio1 => 'Âm thanh (1 LED)';

  @override
  String get transmitterAudio2 => 'Audio (2 LED)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Không tải được khả năng của bộ phát.';

  @override
  String get selectedTransmitter => 'Bộ phát đã chọn';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Hoạt động: $active';
  }

  @override
  String get refresh => 'Làm mới';

  @override
  String get autoSwitchTitle => 'Tự chuyển';

  @override
  String get autoSwitchDisabledWhileAudio => 'Tắt khi dùng chế độ Audio';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Dùng USB khi kết nối, nếu không thì dùng tích hợp';

  @override
  String get unavailableOnThisDevice => 'Không khả dụng trên thiết bị này';

  @override
  String get openOnUsbAttachTitle => 'Mở khi gắn USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android có thể gợi ý mở ứng dụng khi USB IR dongle được hỗ trợ được kết nối.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Sẽ gợi ý mở IR Blaster khi có USB dongle được hỗ trợ được gắn vào.';

  @override
  String get openOnUsbAttachDisabledMessage => 'Sẽ không gợi ý mở khi gắn USB.';

  @override
  String get failedToUpdateSetting => 'Không cập nhật được cài đặt.';

  @override
  String get unnamedButton => 'Nút chưa tên';

  @override
  String get iconFallback => 'Biểu tượng';

  @override
  String get remoteListReorderHint =>
      'Chế độ sắp xếp lại: nhấn giữ và kéo thẻ để di chuyển.';

  @override
  String get deleteRemoteTitle => 'Xóa điều khiển?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" sẽ bị xóa vĩnh viễn. Không thể hoàn tác thao tác này.';
  }

  @override
  String get delete => 'Xóa';

  @override
  String get addToDeviceControlsTitle => 'Thêm vào Điều khiển thiết bị?';

  @override
  String get addToDeviceControlsDescription =>
      'Truy cập nhanh trong điều khiển thiết bị hệ thống.';

  @override
  String get skip => 'Bỏ qua';

  @override
  String get add => 'Thêm';

  @override
  String get addedToDeviceControls => 'Đã thêm vào Điều khiển thiết bị.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Đã xóa \"$name\". This action can\'t be undone.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count nút · $layout';
  }

  @override
  String get layoutComfort => 'Thoải mái';

  @override
  String get layoutCompact => 'Gọn';

  @override
  String get open => 'Mở';

  @override
  String get useThisRemote => 'Dùng điều khiển này';

  @override
  String get edit => 'Sửa';

  @override
  String get editRemoteSubtitle => 'Đổi tên và sửa nút';

  @override
  String get thisCannotBeUndone => 'Không thể hoàn tác';

  @override
  String get searchRemotes => 'Tìm điều khiển';

  @override
  String get reorderRemotes => 'Sắp xếp lại điều khiển';

  @override
  String get addRemote => 'Thêm điều khiển';

  @override
  String get more => 'Thêm';

  @override
  String get reorderMode => 'Chế độ sắp xếp lại';

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
  String get noRemotesYet => 'Chưa có điều khiển nào';

  @override
  String get noRemotesDescription => 'Tạo một điều khiển để bắt đầu gửi mã IR.';

  @override
  String get noRemotesNextStep =>
      'Tiếp theo: chạm Thêm điều khiển, rồi thêm các nút đầu tiên.';

  @override
  String get actions => 'Thao tác';

  @override
  String get macrosTitle => 'Macro';

  @override
  String get help => 'Trợ giúp';

  @override
  String get createMacro => 'Tạo Macro';

  @override
  String get timedMacrosTitle => 'Macro hẹn giờ';

  @override
  String get timedMacrosSubtitle =>
      'Tự động hóa chuỗi lệnh IR với thời gian chính xác';

  @override
  String get timedMacrosNextStep =>
      'Tiếp theo: chạm Tạo macro đầu tiên, chọn điều khiển rồi thêm lệnh và độ trễ.';

  @override
  String get macroFeatureToysTitle => 'Rất hợp cho đồ chơi tương tác';

  @override
  String get macroFeatureToysDescription =>
      'Điều khiển các thiết bị như chó robot i-cybie, robot i-sobot và các đồ chơi khác cần thời gian giữa các lệnh để xử lý thao tác.';

  @override
  String get macroFeatureTimingTitle => 'Điều khiển thời gian chính xác';

  @override
  String get macroFeatureTimingDescription =>
      'Thêm độ trễ giữa các lệnh (250ms đến thời lượng tùy chỉnh) để thiết bị có thời gian phản hồi trước thao tác tiếp theo.';

  @override
  String get macroFeatureManualTitle => 'Bước tiếp tục thủ công';

  @override
  String get macroFeatureManualDescription =>
      'Tạm dừng thực thi và chờ bạn xác nhận khi độ dài hoạt ảnh thay đổi hoặc khi cần phản hồi trực quan.';

  @override
  String get exampleUseCase => 'Ví dụ sử dụng';

  @override
  String get macroExampleText =>
      'Chế độ nâng cao i-cybie:\n1. Gửi lệnh \"Mode\"\n2. Chờ 1000ms (đồ chơi xử lý)\n3. Gửi \"Action 1\"\n4. Chờ 1000ms\n5. Gửi \"Action 2\"\n…và cứ thế tự động!';

  @override
  String get createFirstMacro => 'Tạo macro đầu tiên';

  @override
  String get noRemote => 'Không có điều khiển';

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
  String get aboutTimedMacros => 'Về macro hẹn giờ';

  @override
  String get aboutTimedMacrosDescription =>
      'Macro hẹn giờ cho phép bạn tự động hóa chuỗi lệnh IR với độ trễ chính xác giữa từng bước.';

  @override
  String get sendCommand => 'Gửi lệnh';

  @override
  String get sendCommandDescription => 'Gửi một lệnh IR từ điều khiển của bạn.';

  @override
  String get delay => 'Độ trễ';

  @override
  String get delayDescription =>
      'Waits for a specified duration (vd. 1000ms) before the next step.';

  @override
  String get manualContinue => 'Tiếp tục thủ công';

  @override
  String get manualContinueDescription =>
      'Tạm dừng cho đến khi bạn chạm Tiếp tục (hữu ích với hoạt ảnh có độ dài thay đổi).';

  @override
  String get gotIt => 'Đã hiểu';

  @override
  String get failedToSaveMacros => 'Không lưu được macro.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Đã xóa \"$name\".';
  }

  @override
  String get undo => 'Hoàn tác';

  @override
  String get failedToRestoreMacro => 'Không khôi phục được macro.';

  @override
  String get deleteMacroTitle => 'Xóa macro?';

  @override
  String get deleteMacroMessage => 'Bạn có thể hoàn tác từ snackbar tiếp theo.';

  @override
  String get noRemotesAvailable => 'Không có điều khiểns available.';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count nút';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Hướng: lật (chạm để về bình thường)';

  @override
  String get remoteOrientationNormalTooltip =>
      'Hướng: bình thường (chạm để lật)';

  @override
  String get stopLoop => 'Dừng lặp';

  @override
  String get reorderButtons => 'Sắp xếp lại nút';

  @override
  String get remoteReorderHint =>
      'Chế độ sắp xếp lại: long-press and drag a button to move it.';

  @override
  String get manageRemote => 'Quản lý điều khiển';

  @override
  String get remoteNoButtons => 'Điều khiển này không có nút';

  @override
  String get remoteNoButtonsDescription =>
      'Dùng \"Sửa điều khiển\" để thêm hoặc cấu hình nút.';

  @override
  String get editRemote => 'Sửa điều khiển';

  @override
  String get editRemoteActionsSubtitle => 'Đổi tên, sắp xếp lại và sửa nút';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Đã cập nhật \"$name\".';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Đã thêm \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Đã nhân bản nút.';

  @override
  String get loopRunningForButton => 'Vòng lặp đang chạy cho nút này.';

  @override
  String get loopTip => 'Mẹo: Dùng Lặp để lặp lại cho đến khi bạn dừng.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Đã sao chép mã.';

  @override
  String get copyCode => 'Sao chép mã';

  @override
  String get startLoop => 'Bắt đầu lặp';

  @override
  String get editButtonSubtitle => 'Sửa nhãn, mã, giao thức, tần số';

  @override
  String get newButton => 'Nút mới';

  @override
  String get newButtonSubtitle => 'Tạo nút mới sau nút này';

  @override
  String get duplicate => 'Nhân bản';

  @override
  String get duplicateButtonSubtitle => 'Tạo bản sao của nút này';

  @override
  String get removeFromDeviceControls => 'Xóa khỏi Điều khiển thiết bị';

  @override
  String get addToDeviceControls => 'Thêm vào Điều khiển thiết bị';

  @override
  String get deviceControlsButtonSubtitle =>
      'Hiển thị nút này trong điều khiển thiết bị hệ thống';

  @override
  String get removedFromDeviceControls => 'Đã xóa khỏi Điều khiển thiết bị.';

  @override
  String get pinQuickTile => 'Ghim vào mục yêu thích Ô nhanh';

  @override
  String get unpinQuickTile => 'Bỏ ghim khỏi mục yêu thích Ô nhanh';

  @override
  String get quickTileButtonSubtitle =>
      'Hiển thị nút này ở đầu bộ chọn ô nhanh';

  @override
  String get removedFromQuickTileFavorites =>
      'Đã bỏ khỏi mục yêu thích Ô nhanh.';

  @override
  String get pinnedToQuickTileFavorites => 'Đã ghim vào mục yêu thích Ô nhanh.';

  @override
  String get duplicateAndEdit => 'Nhân bản and edit';

  @override
  String get duplicateAndEditSubtitle => 'Tạo bản sao và sửa ngay';

  @override
  String get done => 'Xong';

  @override
  String get run => 'Chạy';

  @override
  String get untitledRemote => 'Điều khiển chưa tên';

  @override
  String get createRemoteTitle => 'Tạo điều khiển';

  @override
  String get editRemoteTitle => 'Sửa điều khiển';

  @override
  String get removeButtonTitle => 'Xóa nút?';

  @override
  String get imageButtonRemovedMessage => 'Nút hình ảnh này sẽ bị xóa.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" sẽ bị xóa.';
  }

  @override
  String get remove => 'Xóa';

  @override
  String importedButtonCount(int count) {
    return 'Imported $count nút.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Imported $count nút from existing remotes.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Đổi nhãn, tín hiệu và cài đặt nâng cao';

  @override
  String get createButtonCopySubtitle => 'Tạo bản sao của nút này';

  @override
  String get duplicateAndEditButtonSubtitle => 'Tạo bản sao và sửa ngay';

  @override
  String get undoAvailableInNextSnackbar =>
      'Bạn có thể hoàn tác từ snackbar tiếp theo';

  @override
  String get buttonRemoved => 'Đã xóa nút.';

  @override
  String get remoteNameCannotBeEmpty => 'Tên điều khiển không được để trống.';

  @override
  String get saveRemote => 'Lưu điều khiển';

  @override
  String get remoteName => 'Tên điều khiển';

  @override
  String get remoteNameHint => 'vd. TV, Air Conditioner, LED Strip';

  @override
  String get remoteNameHelper =>
      'Tên này sẽ hiện trong danh sách Điều khiển của bạn.';

  @override
  String get layoutStyle => 'Kiểu bố cục';

  @override
  String get layoutWideDescription =>
      'Rộng: nút 2 cột với chi tiết bổ sung (khuyên dùng).';

  @override
  String get layoutCompactDescription =>
      'Gọn: classic 4× grid (icons/text only).';

  @override
  String get importFromRemotes => 'Nhập từ điều khiển';

  @override
  String get importFromDatabase => 'Nhập từ CSDL';

  @override
  String get addButton => 'Thêm nút';

  @override
  String get noButtonsYet => 'Chưa có nút nào';

  @override
  String get createRemoteEmptyStateDescription =>
      'Thêm nút đầu tiên, rồi nhấn giữ để xem tùy chọn sửa/xóa.';

  @override
  String get createButtonTitle => 'Tạo nút';

  @override
  String get editButtonTitle => 'Sửa nút';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Không tải được giao thức: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Không tải được khóa CSDL: $error';
  }

  @override
  String get presetPower => 'Nguồn';

  @override
  String get presetVolume => 'Âm lượng';

  @override
  String get presetChannel => 'Kênh';

  @override
  String get presetNavigation => 'Điều hướng';

  @override
  String get all => 'Tất cả';

  @override
  String get completeRequiredFieldsToSave => 'Điền đủ trường bắt buộc để lưu';

  @override
  String get buttonLabelStepTitle => '1) Nhãn nút';

  @override
  String get buttonLabelStepSubtitle =>
      'Chọn hình ảnh, biểu tượng hoặc nhập nhãn văn bản.';

  @override
  String get buttonColorStepTitle => '2) Màu nút (tùy chọn)';

  @override
  String get buttonColorStepSubtitle => 'Chọn màu nền cho nút này.';

  @override
  String get selectColor => 'Chọn màu:';

  @override
  String get noImageSelected => 'Chưa chọn hình';

  @override
  String get gallery => 'Thư viện';

  @override
  String get builtIn => 'Có sẵn';

  @override
  String get removeImage => 'Xóa image';

  @override
  String get requiredSelectImageOrSwitch =>
      'Bắt buộc: chọn hình, chọn biểu tượng hoặc chuyển sang Văn bản.';

  @override
  String get iconSelected => 'Biểu tượng selected';

  @override
  String get noIconSelected => 'Chưa chọn biểu tượng';

  @override
  String get chooseIcon => 'Choose Biểu tượng';

  @override
  String get removeIcon => 'Xóa icon';

  @override
  String get requiredSelectIconOrSwitch =>
      'Bắt buộc: chọn biểu tượng hoặc chuyển sang Hình/Văn bản.';

  @override
  String get buttonText => 'Văn bản nút';

  @override
  String get buttonTextHint => 'vd. Nguồn, Âm lượng +, HDMI 1';

  @override
  String get buttonTextHelper => 'Văn bản này sẽ hiện trên nút.';

  @override
  String get requiredEnterButtonLabel => 'Bắt buộc: nhập nhãn nút.';

  @override
  String get defaultColorName => 'Mặc định';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Đã tạo điều khiển mới với một nút từ kết quả cuối.';

  @override
  String get selectRemote => 'Chọn điều khiển';

  @override
  String remoteNumber(Object id) {
    return 'Điều khiển #$id';
  }

  @override
  String get newRemoteCreated => 'Đã tạo điều khiển mới.';

  @override
  String get failedToCreateRemote => 'Không tạo được điều khiển.';

  @override
  String get newRemoteEllipsis => 'Điều khiển mới…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Đã thêm vào $name.';
  }

  @override
  String get failedToAddToRemote => 'Không thêm được vào điều khiển.';

  @override
  String get newRemoteDefaultName => 'Điều khiển mới';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Đã nhảy đến vị trí $offset. Đã tạm dừng — nhấn Tiếp tục để tiếp tục.';
  }

  @override
  String get sent => 'Đã gửi.';

  @override
  String failedToSend(Object error) {
    return 'Gửi thất bại: $error';
  }

  @override
  String get copiedProtocolCode => 'Đã sao chép (giao thức:mã).';

  @override
  String get savedToResults => 'Đã lưu vào Kết quả.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Mã không hợp lệ cho giao thức: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Đã sao chép ứng viên hiện tại.';

  @override
  String get jumpToOffset => 'Nhảy tới vị trí';

  @override
  String get jumpToBruteCursor => 'Nhảy tới con trỏ brute';

  @override
  String get jump => 'Nhảy';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Nhảyed to cursor 0x$cursor. Đã tạm dừng — press Tiếp tục to continue.';
  }

  @override
  String get irSignalTester => 'Bộ kiểm tra tín hiệu IR';

  @override
  String get stop => 'Dừng';

  @override
  String get selectButton => 'Chọn nút';

  @override
  String get buttonNotFoundInRemotes =>
      'Không tìm thấy nút trong các điều khiển.';

  @override
  String sentNamed(Object name) {
    return 'Đã gửi \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'Gửi thất bại: $error';
  }

  @override
  String get noFavoritesYet => 'Chưa có mục yêu thích';

  @override
  String get deviceControlsEmptyHint =>
      'Nhấn giữ nút điều khiển và chọn “Thêm vào Điều khiển thiết bị”.';

  @override
  String get sendTest => 'Gửi thử';

  @override
  String get testSendCompleted => 'Đã gửi thử xong.';

  @override
  String testSendFailed(Object error) {
    return 'Gửi thử thất bại: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Xóad \"$name\".';
  }

  @override
  String get brand => 'Hãng';

  @override
  String get model => 'Mẫu';

  @override
  String get selectBrand => 'Chọn hãng';

  @override
  String get searchBrand => 'Tìm hãng…';

  @override
  String get selectModel => 'Chọn mẫu';

  @override
  String get searchModel => 'Tìm mẫu…';

  @override
  String get unnamedKey => 'Khóa chưa tên';

  @override
  String get unknown => 'Không rõ';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'Tìm lệnh';

  @override
  String get noMatchingCommands => 'Không có lệnh khớp';

  @override
  String get quickTileFavoritesTitle => 'Yêu thích ô nhanh';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Đổi ánh xạ cho ô $tileLabel';
  }

  @override
  String get pickDifferentButton => 'Chọn nút khác';

  @override
  String get browseAllRemotesEllipsis => 'Duyệt mọi điều khiển…';

  @override
  String get invalidMacroFileFormat => 'Định dạng tệp macro không hợp lệ.';

  @override
  String get failedToParseMacroFile => 'Phân tích tệp macro thất bại.';

  @override
  String get deviceCodeLabel => 'Mã thiết bị';

  @override
  String get commandLabel => 'Lệnh';

  @override
  String get editButtonCodeTitle => 'Sửa mã của nút';

  @override
  String get thisRemoteHasNoButtons => 'Điều khiển này không có nút nào.';

  @override
  String get selectCommand => 'Chọn lệnh';

  @override
  String get databaseModeAutofillHint =>
      'Chế độ CSDL sẽ tự điền Bước 2 cho bạn (hãng + mẫu + giao thức). Sau khi nhập một khóa, bạn có thể chỉnh mọi thứ trong Thủ công.';

  @override
  String get test => 'Kiểm tra';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Tất cả nút đã chọn đều là bản trùng.';

  @override
  String get noButtonsImported => 'Không nhập nút nào.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Imported $addedCount nút. Bỏ quaped $skippedCount duplicate(s).';
  }

  @override
  String get importAllMatchingTitle => 'Nhập tất cả nút khớp?';

  @override
  String get noMatchingKeysFound => 'Không tìm thấy khóa khớp.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Thao tác này sẽ nhập tối đa $count khóa khớp từ lựa chọn CSDL hiện tại.';
  }

  @override
  String get importAll => 'Nhập tất cả';

  @override
  String get importingButtons => 'Đang nhập nút…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Tất cả nút khớp đều là bản trùng.';

  @override
  String get quickPresets => 'Mẫu nhanh';

  @override
  String get selectDeviceFirst => 'Chọn thiết bị trước';

  @override
  String get searchByLabelOrHex => 'Tìm theo nhãn hoặc hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Tùy chọn: tinh chỉnh khóa mẫu $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Chọn hãng, mẫu và giao thức trước.';

  @override
  String get importFromDatabaseTitle => 'Nhập từ cơ sở dữ liệu';

  @override
  String get importFromDatabaseSubtitle =>
      'Chọn thiết bị, tải khóa khớp rồi nhập các nút đã chọn.';

  @override
  String get deviceAndFilters => 'Thiết bị và bộ lọc';

  @override
  String loadedCount(int count) {
    return 'Đã tải $count';
  }

  @override
  String get hideFilters => 'Ẩn bộ lọc';

  @override
  String get showFilters => 'Hiện bộ lọc';

  @override
  String get noProtocolFoundForBrandModel =>
      'Không tìm thấy giao thức cho hãng và mẫu này.';

  @override
  String get protocolAutoDetected => 'Giao thức';

  @override
  String get protocolAutoDetectedHelper =>
      'Tự phát hiện từ cơ sở dữ liệu. Bạn có thể đổi trước khi nhập.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Chọn hãng, mẫu và giao thức để tải khóa.';

  @override
  String get noKeysFound => 'Không tìm thấy khóa nào.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Không tìm thấy khóa cho “$query”.';
  }

  @override
  String get skipDuplicates => 'Bỏ qua duplicates';

  @override
  String get skipDuplicatesSubtitle =>
      'Không nhập các nút đã tồn tại trong điều khiển này.';

  @override
  String get importSelected => 'Nhập mục đã chọn';

  @override
  String get noMacrosToExport => 'Không có macro để xuất.';

  @override
  String get macrosExportedToDownloads => 'Đã xuất macro vào Downloads.';

  @override
  String get failedToExportMacros => 'Xuất macro thất bại.';

  @override
  String get failedToReadFile => 'Đọc tệp thất bại.';

  @override
  String get importFromExistingRemotesTitle => 'Nhập từ điều khiển hiện có';

  @override
  String selectedCount(int count) {
    return 'Đã chọn $count';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Không tìm thấy điều khiển nào khác có nút.';

  @override
  String get sourceRemote => 'Điều khiển nguồn';

  @override
  String get searchButtons => 'Tìm nút';

  @override
  String get searchButtonsHint => 'Nguồn, Âm lượng, Tắt tiếng...';

  @override
  String get selectVisible => 'Chọn hiển thị';

  @override
  String get clearVisible => 'Xóa hiển thị';

  @override
  String protocolNamed(Object name) {
    return 'Giao thức: $name';
  }

  @override
  String get rawSignal => 'Raw';

  @override
  String get legacyCode => 'Mã cũ';

  @override
  String importCount(int count) {
    return 'Nhập $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Quyền bộ nhớ bị từ chối (cần trên một số thiết bị Android cũ).';

  @override
  String get backupExportedToDownloads => 'Đã xuất bản sao lưu vào Downloads.';

  @override
  String failedToExport(Object error) {
    return 'Xuất thất bại: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Đã nhập $count điều khiển từ bản sao lưu JSON cũ. Macro không đổi.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Nhập thất bại: \"remotes\" phải là danh sách JSON khi có mặt.';

  @override
  String get importFailedMacrosMustBeList =>
      'Nhập thất bại: \"macros\" phải là danh sách JSON khi có mặt.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Nhập thất bại: định dạng sao lưu không hợp lệ (cần List cũ hoặc Map có remotes/macros).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Đã nhập $remoteCount điều khiển từ bản sao lưu. Macro không đổi.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Đã nhập $remoteCount điều khiển và $macroCount macro từ bản sao lưu.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Nhập thất bại: không tìm thấy nút hợp lệ trong tệp .ir.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Đã nhập 1 điều khiển từ Flipper .ir. Macro không đổi.';

  @override
  String get importFailedInvalidIrplus =>
      'Nhập thất bại: tệp irplus không hợp lệ (không tìm thấy nút hợp lệ).';

  @override
  String get importedOneRemoteFromIrplus =>
      'Đã nhập 1 điều khiển từ irplus. Macro không đổi.';

  @override
  String get importFailedInvalidLirc =>
      'Nhập thất bại: tệp LIRC không hợp lệ (không tìm thấy mã/raw code hợp lệ).';

  @override
  String get importedOneRemoteFromLirc =>
      'Đã nhập 1 điều khiển từ cấu hình LIRC. Macro không đổi.';

  @override
  String get unsupportedFileTypeSelected =>
      'Đã chọn loại tệp không được hỗ trợ.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Nhập thất bại: tệp không hợp lệ hoặc không đọc được.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Nhập hàng loạt xong: không tìm thấy tệp được hỗ trợ trong thư mục.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Bulk import complete: no remotes imported. Bỏ quaped $skippedCount file(s).';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Nhập hàng loạt xong: đã nhập $importedCount điều khiển từ $supportedCount tệp được hỗ trợ. Bỏ qua $skippedCount tệp.';
  }

  @override
  String get storagePermissionDenied => 'Quyền bộ nhớ bị từ chối.';

  @override
  String get bulkImportFailedReadFolder =>
      'Nhập hàng loạt thất bại: không đọc được nội dung thư mục.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Nhập hàng loạt xong: không tìm thấy tệp được hỗ trợ ($sourceLabel).';
  }

  @override
  String get clearAction => 'Xóa';

  @override
  String get saveAction => 'Lưu';

  @override
  String buttonsTitleCount(int count) {
    return 'Nút ($count)';
  }

  @override
  String get invalidStepEncountered => 'Gặp bước không hợp lệ';

  @override
  String failedToSendNamed(Object name) {
    return 'Gửi thất bại: $name';
  }

  @override
  String get buttonNotFound => 'Không tìm thấy nút';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Không tìm thấy nút: $name';
  }

  @override
  String get unknownButton => 'Nút không rõ';

  @override
  String durationSecondsShort(int seconds) {
    return '${seconds}s';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '${minutes}p ${seconds}s';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '${hours}g ${minutes}p';
  }

  @override
  String get orientationFlippedTooltip => 'Hướng: lật (chạm để về bình thường)';

  @override
  String get orientationNormalTooltip => 'Hướng: bình thường (chạm để lật)';

  @override
  String get noSteps => 'Không có bước';

  @override
  String stepProgress(int current, int total) {
    return 'Bước $current / $total';
  }

  @override
  String get completed => 'Hoàn tất';

  @override
  String get paused => 'Đã tạm dừng';

  @override
  String get running => 'Đang chạy';

  @override
  String get ready => 'Sẵn sàng';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total bước';
  }

  @override
  String get waiting => 'Đang chờ';

  @override
  String secondsRemaining(Object seconds) {
    return 'Còn ${seconds}s';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Chạm Tiếp tục khi sẵn sàng cho bước tiếp theo';

  @override
  String get error => 'Lỗi';

  @override
  String get macroCompleted => 'Đã hoàn tất macro';

  @override
  String finishedIn(Object duration) {
    return 'Hoàn tất trong $duration';
  }

  @override
  String get sequence => 'Chuỗi';

  @override
  String waitMilliseconds(int ms) {
    return 'Chờ ${ms}ms';
  }

  @override
  String get runAgain => 'Chạy lại';

  @override
  String get startMacro => 'Bắt đầu Macro';

  @override
  String get continueAction => 'Tiếp tục';

  @override
  String get unnamedRemote => 'Điều khiển chưa tên';

  @override
  String get enterMacroName => 'Nhập tên macro';

  @override
  String get addAtLeastOneStep => 'Thêm ít nhất một bước';

  @override
  String get fixInvalidSteps => 'Sửa các bước không hợp lệ';

  @override
  String get unknownCommand => 'Lệnh không rõ';

  @override
  String get unnamedCommand => 'Lệnh chưa tên';

  @override
  String get iconCommand => 'Biểu tượng Command';

  @override
  String get selectDelay => 'Chọn độ trễ';

  @override
  String keepMilliseconds(int ms) {
    return 'Giữ: ${ms}ms';
  }

  @override
  String get custom => 'Tùy chỉnh';

  @override
  String get enterCustomDelayDuration => 'Nhập thời lượng trễ tùy chỉnh';

  @override
  String millisecondsLong(int ms) {
    return '$ms mili giây';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds giây$plural';
  }

  @override
  String get customDelay => 'Tùy chỉnh Delay';

  @override
  String get delayMillisecondsLabel => 'Độ trễ (mili giây)';

  @override
  String get delayMillisecondsHint => 'vd. 3000';

  @override
  String get recommendedDelayRange =>
      'Khuyên dùng: 250-5000ms cho đa số thiết bị';

  @override
  String get enterValidPositiveNumber => 'Vui lòng nhập số dương hợp lệ';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Điều khiển';

  @override
  String get macroName => 'Tên macro';

  @override
  String get macroNameHint => 'vd. i-cybie Advanced Mode';

  @override
  String stepsTitleCount(int count) {
    return 'Bước ($count)';
  }

  @override
  String get noStepsYet => 'Không có bước yet';

  @override
  String get addCommandsAndDelaysHint =>
      'Thêm lệnh và độ trễ bên dưới để tạo chuỗi';

  @override
  String get addStep => 'Thêm bước';

  @override
  String get reorderStepsHint =>
      'Mẹo: Kéo tay nắm để sắp xếp lại bước. Chạm vào bước để sửa.';

  @override
  String reorderStep(int index) {
    return 'Sắp xếp lại bước $index';
  }

  @override
  String get pressAndDragToChangeStepOrder => 'Nhấn và kéo để đổi thứ tự bước';

  @override
  String deleteStep(int index) {
    return 'Xóa bước $index';
  }

  @override
  String get invalidStepTapToFix => 'Bước không hợp lệ — chạm để sửa';

  @override
  String get sendIrCommand => 'Gửi lệnh IR';

  @override
  String get waitForUserConfirmation => 'Chờ xác nhận của người dùng';

  @override
  String get notImplemented => 'Chưa triển khai';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Rộng';

  @override
  String get iconButton => 'Biểu tượng button';

  @override
  String get imageButton => 'Nút hình ảnh';

  @override
  String get noSignalInfo => 'Không có thông tin tín hiệu';

  @override
  String get proceed => 'Tiếp tục';

  @override
  String get discard => 'Bỏ';

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
  String get idle => 'Nhàn';

  @override
  String get start => 'Bắt đầu';

  @override
  String get resume => 'Tiếp tục';

  @override
  String get pause => 'Tạm dừng';

  @override
  String get stopped => 'Đã dừng';

  @override
  String get copy => 'Sao chép';

  @override
  String get send => 'Gửi';

  @override
  String get step => 'Bước';

  @override
  String get addToRemote => 'Thêm vào điều khiển';

  @override
  String get noDescriptionAvailable => 'Không có mô tả.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Nhà cung cấp Kaseikyo phải có đúng 4 chữ số hex.';

  @override
  String get irFinderDatabaseNotReady => 'Cơ sở dữ liệu chưa sẵn sàng.';

  @override
  String get irFinderSelectBrandFirst => 'Hãy chọn hãng trước trong Thiết lập.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute-force chưa khả dụng cho giao thức này.';

  @override
  String get irFinderInvalidPrefix => 'Tiền tố không hợp lệ.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Hãng: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Mẫu: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Khóa: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Điều khiển #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Nhập chỉ số bắt đầu từ 0 trong kết quả CSDL đã lọc và sắp xếp.';

  @override
  String get irFinderJumpCursorHelper =>
      'Nhập con trỏ hex bắt đầu từ 0 trong không gian brute-force.';

  @override
  String get irFinderSetupTab => 'Thiết lập';

  @override
  String get irFinderTestTab => 'Kiểm tra';

  @override
  String get irFinderResultsTab => 'Kết quả';

  @override
  String get irFinderContinueToTest => 'Tiếp tục kiểm tra';

  @override
  String get irFinderKaseikyoVendorTitle => 'Nhà cung cấp Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'Nhà cung cấp tùy chỉnh (4 hex)';

  @override
  String get irFinderBrowseDbCandidates => 'Duyệt ứng viên CSDL…';

  @override
  String get irFinderEditSetup => 'Sửa thiết lập';

  @override
  String get irFinderNoSavedHits =>
      'Chưa có kết quả đã lưu. Trong trang Kiểm tra, nhấn \"Lưu kết quả\" khi thiết bị phản hồi.';

  @override
  String get irFinderBackToTest => 'Quay lại kiểm tra';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Không gian tìm kiếm lớn';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Không gian brute-force này rất lớn ($human khả năng). IR Finder vẫn sẽ tôn trọng số lần thử tối đa và thời gian nghỉ của bạn, nhưng hãy cẩn thận để không spam thiết bị IR.\n\nKhuyến nghị: hãy dùng chế độ CSDL trước và/hoặc nhập các byte tiền tố đã biết để thu hẹp không gian.';
  }

  @override
  String get irFinderDatabaseSession => 'Phiên CSDL';

  @override
  String get irFinderBruteforceSession => 'Phiên brute-force';

  @override
  String get irFinderResumeLastSession => 'Tiếp tục phiên trước';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Brand: $brand · Mẫu: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Tiền tố: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Progress: $progress · Bắt đầued: $when';
  }

  @override
  String get irFinderApplyResume => 'Áp dụng và tiếp tục';

  @override
  String get irFinderBruteforceMode => 'Brute-force';

  @override
  String get irFinderDatabaseAssistedMode => 'Có hỗ trợ CSDL';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Giao thức: $name';
  }

  @override
  String get irFinderProtocolLabel => 'Giao thức IR';

  @override
  String get irFinderProtocolHelper =>
      'Kiểm soát mã hóa và do đó là không gian tìm kiếm.';

  @override
  String get irFinderKnownPrefixLabel => 'Tiền tố đã biết (byte hex, tùy chọn)';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Payload: $digits chữ số hex';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Payload: $digits chữ số hex · Ví dụ: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Payload: $digits chữ số hex · Max prefix: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Payload: $digits chữ số hex · Ví dụ: $example · Tiền tố tối đa: $bytes byte';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Ví dụ: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Nhập các byte đầu đã biết để giảm không gian tìm kiếm.';

  @override
  String get irFinderDatabaseMode => 'Cơ sở dữ liệu';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Tiền tố chuẩn hóa: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Tiền tố chuẩn hóa';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Brute-force chưa được cấu hình cho giao thức này.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Tất cả ($value)';
  }

  @override
  String get irFinderTestControls => 'Điều khiển kiểm tra';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Độ dài payload: $digits chữ số hex.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Không gian tìm kiếm: $value khả năng (sau khi áp điều kiện tiền tố).';
  }

  @override
  String get irFinderCooldownMs => 'Thời gian nghỉ (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Số lần thử tối đa (mỗi lần chạy)';

  @override
  String get irFinderTestAllCombinations => 'Kiểm tra mọi tổ hợp';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Chạy cho đến khi hết không gian tìm kiếm. Giới hạn hiệu lực: $value';
  }

  @override
  String get irFinderAttempts => 'Lần thử';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Khoảng thanh trượt: 1–$max (nhập số bất kỳ cho giá trị lớn hơn)';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Max $value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Giới hạn hiệu lực lần chạy này: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Mẹo: Hãy dùng chế độ CSDL trước; brute-force hiệu quả nhất khi có tiền tố đã biết (ví dụ 1–4 byte đầu tiên).';

  @override
  String get irFinderDatabaseInitFailed => 'Khởi tạo cơ sở dữ liệu thất bại.';

  @override
  String get irFinderPreparingDatabase =>
      'Đang chuẩn bị cơ sở dữ liệu mã IR cục bộ…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Tìm kiếm có hỗ trợ CSDL';

  @override
  String get irFinderBrand => 'Hãng';

  @override
  String get irFinderSelectBrand => 'Chọn hãng';

  @override
  String get irFinderModelOptional => 'Mẫu (tùy chọn)';

  @override
  String get irFinderSelectBrandFirstShort => 'Chọn hãng trước';

  @override
  String get irFinderSelectModelRecommended => 'Chọn mẫu (khuyên dùng)';

  @override
  String get irFinderOnlySelectedProtocol => 'Chỉ giao thức đã chọn';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Lọc khóa theo giao thức đã chọn. Tắt để duyệt mọi giao thức.';

  @override
  String get irFinderQuickWinsFirst => 'Ưu tiên kết quả nhanh';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Ưu tiên khóa kiểu POWER, MUTE, VOL và CH trước các khóa sâu hơn.';

  @override
  String get irFinderMaxKeysPerRun =>
      'Số khóa tối đa để kiểm tra (mỗi lần chạy)';

  @override
  String get irFinderTesting => 'Đang kiểm tra…';

  @override
  String get irFinderCooldown => 'Thời gian nghỉ';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'Chế độ';

  @override
  String get irFinderRetryLast => 'Thử lại lần cuối';

  @override
  String get irFinderTrigger => 'Kích hoạt';

  @override
  String get irFinderJump => 'Nhảy…';

  @override
  String get irFinderSaveHit => 'Lưu kết quả';

  @override
  String irFinderEtaSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String irFinderEtaMinutesSeconds(int minutes, int seconds) {
    return '${minutes}p ${seconds}s';
  }

  @override
  String irFinderEtaHoursMinutes(int hours, int minutes) {
    return '${hours}g ${minutes}p';
  }

  @override
  String irFinderLastAttemptedCode(Object value) {
    return 'Mã thử gần nhất: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Bắt đầu testing to see the last attempted code.';

  @override
  String irFinderFromDb(Object value) {
    return 'Từ CSDL: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'From brute-force (generated bởi protocol encoder).';

  @override
  String irFinderSendError(Object error) {
    return 'Gửi error: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Nguồn: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Kết quả hỗ trợ Kiểm tra và Sao chép ngay. Tích hợp thêm trực tiếp vào điều khiển có thể được mở rộng thêm trong luồng sửa.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Duyệt ứng viên CSDL';

  @override
  String get irFinderFilterByLabelOrHex => 'Lọc theo nhãn hoặc hex…';

  @override
  String get irFinderJumpHere => 'Nhảy tới đây';

  @override
  String get irFinderSelectModel => 'Chọn mẫu';

  @override
  String get irFinderSearchBrands => 'Tìm hãng…';

  @override
  String get irFinderSearchModels => 'Tìm mẫu…';

  @override
  String get iconPickerTitle => 'Select Biểu tượng';

  @override
  String get iconPickerSearchHint => 'Tìm kiếm icons...';

  @override
  String get iconPickerNoIconsFound => 'Không tìm thấy biểu tượng';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count biểu tượng khả dụng';
  }

  @override
  String get iconPickerCategoryAll => 'Tất cả';

  @override
  String get iconPickerCategoryMedia => 'Media';

  @override
  String get iconPickerCategoryVolume => 'Âm lượng';

  @override
  String get iconPickerCategoryNavigation => 'Điều hướng';

  @override
  String get iconPickerCategoryPower => 'Nguồn';

  @override
  String get iconPickerCategoryNumbers => 'Số';

  @override
  String get iconPickerCategorySettings => 'Cài đặt';

  @override
  String get iconPickerCategoryDisplay => 'Màn hình';

  @override
  String get iconPickerCategoryInput => 'Ngõ vào';

  @override
  String get iconPickerCategoryFavorite => 'Yêu thích';

  @override
  String get universalPowerTitle => 'Nguồn chung';

  @override
  String get universalPowerRunTab => 'Chạy';

  @override
  String get universalPowerUseResponsibly => 'Dùng có trách nhiệm';

  @override
  String get universalPowerConsentBody =>
      'Nguồn chung sẽ lặp các mã nguồn IR. Chỉ dùng với thiết bị bạn sở hữu hoặc kiểm soát. Hãy dừng ngay khi thiết bị phản hồi.';

  @override
  String get universalPowerConsentCheckbox =>
      'Tôi sở hữu hoặc kiểm soát thiết bị';

  @override
  String get universalPowerSetupBody =>
      'Lặp mã nguồn cho hãng bạn chọn. Dừng ngay khi thiết bị phản hồi.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Đã gửi gần nhất: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Không tìm thấy mã nguồn. Hãy thử mở rộng tìm kiếm.';

  @override
  String get universalPowerUnableToStart => 'Không thể bắt đầu.';

  @override
  String get universalPowerAllBrands => 'Tất cả hãng (không lọc)';

  @override
  String get universalPowerClearBrandFilter => 'Xóa bộ lọc hãng';

  @override
  String get universalPowerBroadenSearch => 'Mở rộng tìm kiếm nếu cần';

  @override
  String get universalPowerBroadenSearchHint =>
      'Nếu không tìm thấy nhãn nguồn, hãy bao gồm các khóa khác.';

  @override
  String get universalPowerAdditionalPatternsDepth => 'Độ sâu mẫu bổ sung';

  @override
  String get universalPowerDepth1 => 'Chỉ ưu tiên: POWER/OFF';

  @override
  String get universalPowerDepth2 => 'Bao gồm bí danh POWER';

  @override
  String get universalPowerDepth3 => 'Bao gồm nhãn nguồn phụ';

  @override
  String get universalPowerDepth4 => 'Bao gồm mọi nhãn (ưu tiên thấp nhất)';

  @override
  String get universalPowerLoopUntilStopped => 'Lặp đến khi dừng';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Tiếp tục lặp hàng đợi cho đến khi bạn dừng.';

  @override
  String get universalPowerDelayBetweenCodes => 'Độ trễ giữa các mã';

  @override
  String get universalPowerStart => 'Bắt đầu Nguồn chung';

  @override
  String get universalPowerRunStatus => 'Trạng thái chạy';

  @override
  String universalPowerProgress(Object value) {
    return 'Tiến độ: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Đã tạm dừng because the app was backgrounded.';

  @override
  String get universalPowerSendOneCode => 'Gửi một mã';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Dừng ngay khi thiết bị phản hồi.';

  @override
  String get iconNamePlay => 'Phát';

  @override
  String get iconNamePause => 'Tạm dừng';

  @override
  String get iconNameStop => 'Dừng';

  @override
  String get iconNameFastForward => 'Tua nhanh';

  @override
  String get iconNameRewind => 'Tua lại';

  @override
  String get iconNameSkipNext => 'Bỏ qua Tiếp';

  @override
  String get iconNameSkipPrevious => 'Bỏ qua Trước';

  @override
  String get iconNameReplay => 'Phát lại';

  @override
  String get iconNameForward10S => 'Tua 10s';

  @override
  String get iconNameForward30S => 'Tua 30s';

  @override
  String get iconNameReplay10S => 'Lùi 10s';

  @override
  String get iconNameReplay30S => 'Lùi 30s';

  @override
  String get iconNameRecord => 'Ghi';

  @override
  String get iconNameRecordAlt => 'Ghi Alt';

  @override
  String get iconNameEject => 'Đẩy ra';

  @override
  String get iconNameShuffle => 'Trộn';

  @override
  String get iconNameRepeat => 'Lặp';

  @override
  String get iconNameRepeatOne => 'Lặp một';

  @override
  String get iconNameVolumeUp => 'Tăng âm';

  @override
  String get iconNameVolumeDown => 'Giảm âm';

  @override
  String get iconNameVolumeOff => 'Tắt âm';

  @override
  String get iconNameMute => 'Tắt tiếng';

  @override
  String get iconNameSpeaker => 'Loa';

  @override
  String get iconNameSurroundSound => 'Âm thanh vòm';

  @override
  String get iconNameEqualizer => 'Bộ cân bằng';

  @override
  String get iconNameAudio => 'Âm thanh';

  @override
  String get iconNameMicrophone => 'Micrô';

  @override
  String get iconNameMicOff => 'Tắt mic';

  @override
  String get iconNameUp => 'Lên';

  @override
  String get iconNameDown => 'Xuống';

  @override
  String get iconNameLeft => 'Trái';

  @override
  String get iconNameRight => 'Phải';

  @override
  String get iconNameArrowUp => 'Mũi tên lên';

  @override
  String get iconNameArrowDown => 'Mũi tên xuống';

  @override
  String get iconNameArrowLeft => 'Mũi tên trái';

  @override
  String get iconNameArrowRight => 'Mũi tên phải';

  @override
  String get iconNameNavigation => 'Điều hướng';

  @override
  String get iconNameChevronLeft => 'Chevron trái';

  @override
  String get iconNameChevronRight => 'Chevron phải';

  @override
  String get iconNameExpandLess => 'Thu gọn';

  @override
  String get iconNameExpandMore => 'Expand Thêm';

  @override
  String get iconNameCollapse => 'Thu gọn';

  @override
  String get iconNameExpand => 'Mở rộng';

  @override
  String get iconNameCircleUp => 'Vòng tròn lên';

  @override
  String get iconNameCircleDown => 'Vòng tròn xuống';

  @override
  String get iconNameCircleLeft => 'Vòng tròn trái';

  @override
  String get iconNameCircleRight => 'Vòng tròn phải';

  @override
  String get iconNameOkSelect => 'OK/Chọn';

  @override
  String get iconNameConfirm => 'Xác nhận';

  @override
  String get iconNameCancel => 'Hủy';

  @override
  String get iconNameClose => 'Đóng';

  @override
  String get iconNameHome => 'Trang chủ';

  @override
  String get iconNameReturn => 'Quay lại';

  @override
  String get iconNameExit => 'Thoát';

  @override
  String get iconNameUndo => 'Hoàn tác';

  @override
  String get iconNameRedo => 'Làm lại';

  @override
  String get iconNamePower => 'Nguồn';

  @override
  String get iconNamePowerAlt => 'Nguồn Alt';

  @override
  String get iconNamePowerOff => 'Tắt nguồn';

  @override
  String get iconNameOn => 'Bật';

  @override
  String get iconNameOff => 'Tắt';

  @override
  String get iconNameToggleOn => 'Bật chuyển';

  @override
  String get iconNameToggleOff => 'Tắt chuyển';

  @override
  String get iconNameRestart => 'Khởi động lại';

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
  String get iconNameOne => 'Một';

  @override
  String get iconNameTwo => 'Hai';

  @override
  String get iconNameThree => 'Ba';

  @override
  String get iconNameFour => 'Bốn';

  @override
  String get iconNameFive => 'Năm';

  @override
  String get iconNameSix => 'Sáu';

  @override
  String get iconNamePlus => 'Cộng';

  @override
  String get iconNameMinus => 'Trừ';

  @override
  String get iconNameAddCircle => 'Thêm vòng tròn';

  @override
  String get iconNameRemoveCircle => 'Xóa Circle';

  @override
  String get iconNameSettings => 'Cài đặt';

  @override
  String get iconNameMenu => 'Menu';

  @override
  String get iconNameMoreVertical => 'Thêm Vertical';

  @override
  String get iconNameMoreHorizontal => 'Thêm Horizontal';

  @override
  String get iconNameTune => 'Điều chỉnh';

  @override
  String get iconNameRemoteSettings => 'Cài đặt điều khiển';

  @override
  String get iconNameInfo => 'Thông tin';

  @override
  String get iconNameInfoOutline => 'Viền thông tin';

  @override
  String get iconNameHelp => 'Trợ giúp';

  @override
  String get iconNameHelpOutline => 'Viền trợ giúp';

  @override
  String get iconNameList => 'Danh sách';

  @override
  String get iconNameViewList => 'Xem danh sách';

  @override
  String get iconNameViewGrid => 'Xem lưới';

  @override
  String get iconNameApps => 'Ứng dụng';

  @override
  String get iconNameWidgets => 'Tiện ích';

  @override
  String get iconNameTv => 'TV';

  @override
  String get iconNameMonitor => 'Màn hình';

  @override
  String get iconNameDesktop => 'Máy tính';

  @override
  String get iconNameBrightnessHigh => 'Sáng cao';

  @override
  String get iconNameBrightnessMedium => 'Sáng vừa';

  @override
  String get iconNameBrightnessLow => 'Sáng thấp';

  @override
  String get iconNameAutoBrightness => 'Tự động sáng';

  @override
  String get iconNameLightMode => 'Chế độ sáng';

  @override
  String get iconNameDarkMode => 'Chế độ tối';

  @override
  String get iconNameContrast => 'Tương phản';

  @override
  String get iconNameHdrOn => 'HDR bật';

  @override
  String get iconNameHdrOff => 'HDR tắt';

  @override
  String get iconNameAspectRatio => 'Tỷ lệ khung';

  @override
  String get iconNameCrop => 'Cắt';

  @override
  String get iconNameZoomIn => 'Phóng to';

  @override
  String get iconNameZoomOut => 'Thu nhỏ';

  @override
  String get iconNameFullscreen => 'Toàn màn hình';

  @override
  String get iconNameExitFullscreen => 'Thoát toàn màn hình';

  @override
  String get iconNameFitScreen => 'Vừa màn hình';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'Cắt Tự do';

  @override
  String get iconNameInput => 'Ngõ vào';

  @override
  String get iconNameCable => 'Cáp';

  @override
  String get iconNameCast => 'Truyền';

  @override
  String get iconNameCastConnected => 'Truyền Đã kết nối';

  @override
  String get iconNameScreenShare => 'Chia sẻ màn hình';

  @override
  String get iconNameBluetooth => 'Bluetooth';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => 'Router';

  @override
  String get iconNameMemory => 'Bộ nhớ';

  @override
  String get iconNameGameConsole => 'Máy chơi game';

  @override
  String get iconNameGaming => 'Chơi game';

  @override
  String get iconNameMedia => 'Media';

  @override
  String get iconNameMusicQueue => 'Hàng đợi nhạc';

  @override
  String get iconNameVideoLibrary => 'Thư viện video';

  @override
  String get iconNamePhotoLibrary => 'Thư viện ảnh';

  @override
  String get iconNameComponent => 'Component';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => 'Composite';

  @override
  String get iconNameAntenna => 'Ăng ten';

  @override
  String get iconNameFavorite => 'Yêu thích';

  @override
  String get iconNameFavoriteOutline => 'Viền yêu thích';

  @override
  String get iconNameStar => 'Sao';

  @override
  String get iconNameStarOutline => 'Viền sao';

  @override
  String get iconNameBookmark => 'Đánh dấu';

  @override
  String get iconNameBookmarkOutline => 'Viền đánh dấu';

  @override
  String get iconNameFlag => 'Cờ';

  @override
  String get iconNameCheck => 'Kiểm';

  @override
  String get iconNameDone => 'Xong';

  @override
  String get iconNameDoneAll => 'Hoàn tất tất cả';

  @override
  String get iconNameSchedule => 'Lịch';

  @override
  String get iconNameTimer => 'Hẹn giờ';

  @override
  String get iconNameTime => 'Thời gian';

  @override
  String get iconNameAlarm => 'Báo thức';

  @override
  String get iconNameNotifications => 'Thông báo';

  @override
  String get iconNameLock => 'Khóa';

  @override
  String get iconNameUnlock => 'Mở khóa';

  @override
  String get iconNameLight => 'Nhẹ';

  @override
  String get iconNameLightOutline => 'Đèn Viền';

  @override
  String get iconNameWarmLight => 'Ánh sáng ấm';

  @override
  String get iconNameSunny => 'Nắng';

  @override
  String get iconNameCloudy => 'Nhiều mây';

  @override
  String get iconNameNight => 'Đêm';

  @override
  String get iconNameFlare => 'Lóa';

  @override
  String get iconNameGradient => 'Gradient';

  @override
  String get iconNameInvertColors => 'Đảo màu';

  @override
  String get iconNamePalette => 'Bảng màu';

  @override
  String get iconNameColor => 'Màu';

  @override
  String get iconNameTonality => 'Sắc độ';

  @override
  String get iconNameSearch => 'Tìm kiếm';

  @override
  String get iconNameRefresh => 'Làm mới';

  @override
  String get iconNameSync => 'Đồng bộ';

  @override
  String get iconNameUpdate => 'Cập nhật';

  @override
  String get iconNameDownload => 'Tải xuống';

  @override
  String get iconNameUpload => 'Tải lên';

  @override
  String get iconNameCloud => 'Mây';

  @override
  String get iconNameFolder => 'Thư mục';

  @override
  String get iconNameDelete => 'Xóa';

  @override
  String get iconNameEdit => 'Sửa';

  @override
  String get iconNameSave => 'Lưu';

  @override
  String get iconNameShare => 'Chia sẻ';

  @override
  String get iconNamePrint => 'In';

  @override
  String get iconNameLanguage => 'Ngôn ngữ';

  @override
  String get iconNameTranslate => 'Dịch';

  @override
  String get iconNameMicNone => 'Không có mic';

  @override
  String get iconNameSubtitles => 'Phụ đề';

  @override
  String get iconNameClosedCaption => 'Phụ đề kín';

  @override
  String get iconNameMusic => 'Nhạc';

  @override
  String get iconNameMovie => 'Phim';

  @override
  String get iconNameTheater => 'Rạp';

  @override
  String get iconNameLiveTv => 'Trực tiếp TV';

  @override
  String get iconNameRadio => 'Radio';

  @override
  String get iconNameCamera => 'Máy ảnh';

  @override
  String get iconNameVideoCamera => 'Máy quay video';

  @override
  String get iconNamePhotoCamera => 'Máy ảnh';

  @override
  String get iconNameSlowMotion => 'Chuyển động chậm';

  @override
  String get iconNameSpeed => 'Tốc độ';

  @override
  String get iconNameVideoSettings => 'Cài đặt video';

  @override
  String get iconNameAudioTrack => 'Rãnh âm thanh';

  @override
  String get iconNameGraphicEq => 'EQ đồ họa';

  @override
  String get iconNameMusicVideo => 'Video nhạc';

  @override
  String get iconNamePlaylist => 'Danh sách phát';

  @override
  String get iconNameQueue => 'Hàng đợi';

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
  String get iconNameHashFa => 'Dấu # FA';

  @override
  String get iconNamePercentFa => 'Phần trăm % FA';

  @override
  String get iconNameDivideFa => 'Chia ÷ FA';

  @override
  String get iconNameMultiplyFa => 'Nhân × FA';

  @override
  String get iconNameEqualsFa => 'Bằng = FA';

  @override
  String get iconNameNotEqualFa => 'Không bằng ≠ FA';

  @override
  String get iconNameGreaterThanFa => 'Lớn hơn > FA';

  @override
  String get iconNameLessThanFa => 'Nhỏ hơn < FA';

  @override
  String get iconNameAsteriskFa => 'Dấu * FA';

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
  String get iconNamePlayFa => 'Phát FA';

  @override
  String get iconNamePauseFa => 'Tạm dừng FA';

  @override
  String get iconNameStopFa => 'Dừng FA';

  @override
  String get iconNamePlayFaOutline => 'Phát FA viền';

  @override
  String get iconNamePauseFaOutline => 'Tạm dừng FA viền';

  @override
  String get iconNameStopFaOutline => 'Dừng FA viền';

  @override
  String get iconNameBackwardFa => 'Lùi FA';

  @override
  String get iconNameForwardFa => 'Tiến FA';

  @override
  String get iconNamePreviousFa => 'Trước FA';

  @override
  String get iconNameNextFa => 'Tiếp FA';

  @override
  String get iconNameRewindFa => 'Tua lại FA';

  @override
  String get iconNameFastForwardFa => 'Tua nhanh FA';

  @override
  String get iconNameRepeatFa => 'Lặp FA';

  @override
  String get iconNameShuffleFa => 'Trộn FA';

  @override
  String get iconNameEjectFa => 'Đẩy ra FA';

  @override
  String get iconNameFilmFa => 'Phim FA';

  @override
  String get iconNameVideoFa => 'Video FA';

  @override
  String get iconNameMusicFa => 'Nhạc FA';

  @override
  String get iconNameMicrophoneFa => 'Micrô FA';

  @override
  String get iconNameCameraFa => 'Máy ảnh FA';

  @override
  String get iconNameCameraRetroFa => 'Máy ảnh Retro FA';

  @override
  String get iconNameVolumeHighFa => 'Âm lượng High FA';

  @override
  String get iconNameVolumeLowFa => 'Âm lượng Low FA';

  @override
  String get iconNameVolumeOffFa => 'Tắt âm FA';

  @override
  String get iconNameMuteFa => 'Tắt tiếng FA';

  @override
  String get iconNameMicMuteFa => 'Mic Tắt tiếng FA';

  @override
  String get iconNameHeadphonesFa => 'Tai nghe FA';

  @override
  String get iconNameSpeakerFa => 'Loa FA';

  @override
  String get iconNameUpFa => 'Lên FA';

  @override
  String get iconNameDownFa => 'Xuống FA';

  @override
  String get iconNameLeftFa => 'Trái FA';

  @override
  String get iconNameRightFa => 'Phải FA';

  @override
  String get iconNameUpFaOutline => 'Lên FA viền';

  @override
  String get iconNameDownFaOutline => 'Xuống FA viền';

  @override
  String get iconNameLeftFaOutline => 'Trái FA viền';

  @override
  String get iconNameRightFaOutline => 'Phải FA viền';

  @override
  String get iconNameArrowUpFa => 'Mũi tên lên FA';

  @override
  String get iconNameArrowDownFa => 'Mũi tên xuống FA';

  @override
  String get iconNameArrowLeftFa => 'Mũi tên trái FA';

  @override
  String get iconNameArrowRightFa => 'Mũi tên phải FA';

  @override
  String get iconNameChevronUpFa => 'Chevron Lên FA';

  @override
  String get iconNameChevronDownFa => 'Chevron Xuống FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron trái FA';

  @override
  String get iconNameChevronRightFa => 'Chevron phải FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA viền';

  @override
  String get iconNameCheckFa => 'Kiểm FA';

  @override
  String get iconNameCloseFa => 'Đóng FA';

  @override
  String get iconNameCloseCircleFa => 'Đóng Circle FA';

  @override
  String get iconNameHomeFa => 'Trang chủ FA';

  @override
  String get iconNameUndoFa => 'Hoàn tác FA';

  @override
  String get iconNameRedoFa => 'Làm lại FA';

  @override
  String get iconNameRotateFa => 'Xoay FA';

  @override
  String get iconNameSearchFa => 'Tìm kiếm FA';

  @override
  String get iconNameRefreshFa => 'Làm mới FA';

  @override
  String get iconNamePowerOffFa => 'Tắt nguồn FA';

  @override
  String get iconNamePlugFa => 'Cắm FA';

  @override
  String get iconNameToggleOnFa => 'Bật chuyển FA';

  @override
  String get iconNameToggleOffFa => 'Tắt chuyển FA';

  @override
  String get iconNameSettingsFa => 'Cài đặt FA';

  @override
  String get iconNameSettingsAltFa => 'Cài đặt Alt FA';

  @override
  String get iconNameMenuFa => 'Menu FA';

  @override
  String get iconNameMoreFa => 'Thêm FA';

  @override
  String get iconNameMoreVerticalFa => 'Thêm Vertical FA';

  @override
  String get iconNameInfoFa => 'Thông tin FA';

  @override
  String get iconNameInfoFaOutline => 'Thông tin FA viền';

  @override
  String get iconNameHelpFa => 'Trợ giúp FA';

  @override
  String get iconNameHelpFaOutline => 'Trợ giúp FA viền';

  @override
  String get iconNameListFa => 'Danh sách FA';

  @override
  String get iconNameGridFa => 'Lưới FA';

  @override
  String get iconNameSlidersFa => 'Thanh trượt FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'Màn hình FA';

  @override
  String get iconNameDesktopFa => 'Máy tính FA';

  @override
  String get iconNameBrightnessFa => 'Độ sáng FA';

  @override
  String get iconNameNightModeFa => 'Đêm Mode FA';

  @override
  String get iconNameLightFa => 'Đèn FA';

  @override
  String get iconNameLightFaOutline => 'Đèn FA viền';

  @override
  String get iconNameFlashFa => 'Flash FA';

  @override
  String get iconNameFullscreenFa => 'Toàn màn hình FA';

  @override
  String get iconNameExitFullscreenFa => 'Thoát toàn màn hình FA';

  @override
  String get iconNameZoomInFa => 'Phóng to FA';

  @override
  String get iconNameZoomOutFa => 'Thu nhỏ FA';

  @override
  String get iconNameSubtitlesFa => 'Phụ đề FA';

  @override
  String get iconNamePictureInPictureFa => 'Ảnh trong ảnh FA';

  @override
  String get iconNameColorFa => 'Màu FA';

  @override
  String get iconNamePaintFa => 'Sơn FA';

  @override
  String get iconNameInputFa => 'Ngõ vào FA';

  @override
  String get iconNameWifiFa => 'WiFi FA';

  @override
  String get iconNameBluetoothFa => 'Bluetooth FA';

  @override
  String get iconNameUsbFa => 'USB FA';

  @override
  String get iconNameEthernetFa => 'Ethernet FA';

  @override
  String get iconNameGamepadFa => 'Tay cầm FA';

  @override
  String get iconNameBroadcastFa => 'Phát sóng FA';

  @override
  String get iconNameSatelliteFa => 'Vệ tinh FA';

  @override
  String get iconNameAntennaFa => 'Ăng ten FA';

  @override
  String get iconNameNetworkFa => 'Mạng FA';

  @override
  String get iconNameCloudFa => 'Mây FA';

  @override
  String get iconNameStarFa => 'Sao FA';

  @override
  String get iconNameStarFaOutline => 'Sao FA viền';

  @override
  String get iconNameHeartFa => 'Tim FA';

  @override
  String get iconNameHeartFaOutline => 'Tim FA viền';

  @override
  String get iconNameBookmarkFa => 'Đánh dấu FA';

  @override
  String get iconNameBookmarkFaOutline => 'Đánh dấu FA viền';

  @override
  String get iconNameFlagFa => 'Cờ FA';

  @override
  String get iconNameClockFa => 'Đồng hồ FA';

  @override
  String get iconNameClockFaOutline => 'Đồng hồ FA viền';

  @override
  String get iconNameBellFa => 'Chuông FA';

  @override
  String get iconNameBellFaOutline => 'Chuông FA Viền';

  @override
  String get iconNameTimerFa => 'Hẹn giờ FA';

  @override
  String get iconNameLockFa => 'Khóa FA';

  @override
  String get iconNameUnlockFa => 'Mở khóa FA';

  @override
  String get iconNameGalleryFa => 'Thư viện FA';

  @override
  String get iconNameImagesFa => 'Hình ảnh FA';

  @override
  String get iconNameImageFa => 'Hình ảnh FA';

  @override
  String get iconNameVideoFileFa => 'Tệp video FA';

  @override
  String get iconNameAudioFileFa => 'Âm thanh File FA';

  @override
  String get iconNamePlayOutlineFa => 'Phát Viền FA';

  @override
  String get iconNamePlaySimpleFa => 'Phát Đơn giản FA';

  @override
  String get iconNamePauseSimpleFa => 'Tạm dừng Đơn giản FA';

  @override
  String get iconNameStopSimpleFa => 'Dừng Đơn giản FA';

  @override
  String get iconNameRecordFa => 'Ghi FA';

  @override
  String get iconNameStopCircleFa => 'Dừng Circle FA';

  @override
  String get iconNameLoadingFa => 'Đang tải FA';

  @override
  String get iconNameTextFa => 'Văn bản FA';

  @override
  String get iconNameTextSizeFa => 'Văn bản Size FA';

  @override
  String get iconNameLanguageFa => 'Ngôn ngữ FA';

  @override
  String get iconNameGlobeFa => 'Địa cầu FA';

  @override
  String get iconNameSubtitlesAltFa => 'Phụ đề Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Phụ đề Alt Viền FA';

  @override
  String get iconNameChannelUpFa => 'Kênh Lên FA';

  @override
  String get iconNameChannelDownFa => 'Kênh Xuống FA';

  @override
  String get iconNamePageUpFa => 'Trang Lên FA';

  @override
  String get iconNamePageDownFa => 'Trang Xuống FA';

  @override
  String get iconNameGuideFa => 'Hướng dẫn FA';

  @override
  String get iconNameGridViewFa => 'Xem lưới FA';

  @override
  String get iconNameGridAltFa => 'Lưới Alt FA';

  @override
  String get iconNameScheduleFa => 'Lịch FA';

  @override
  String get iconNameCalendarFa => 'Lịch FA';

  @override
  String get iconNameRedButtonFa => 'Nút đỏ FA';

  @override
  String get iconNameButtonOutlineFa => 'Button Viền FA';

  @override
  String get iconNameSquareButtonFa => 'Vuông Button FA';

  @override
  String get iconNameSquareOutlineFa => 'Vuông Viền FA';

  @override
  String get iconNameDotCircleFa => 'Chấm Circle FA';

  @override
  String get iconNameToolsFa => 'Công cụ FA';

  @override
  String get iconNameScrewdriverFa => 'Tua vít FA';

  @override
  String get iconNameHammerFa => 'Búa FA';

  @override
  String get iconNameToolboxFa => 'Hộp đồ nghề FA';

  @override
  String get iconNameCogFa => 'Bánh răng FA';

  @override
  String get iconNameAdjustFa => 'Điều chỉnh FA';

  @override
  String get iconNameFilterFa => 'Bộ lọc FA';

  @override
  String get iconNameSortDownFa => 'Sort Xuống FA';

  @override
  String get iconNameSortUpFa => 'Sort Lên FA';

  @override
  String get iconNameSleepFa => 'Ngủ FA';

  @override
  String get iconNameTimerStartFa => 'Hẹn giờ Bắt đầu FA';

  @override
  String get iconNameTimerHalfFa => 'Hẹn giờ Nửa FA';

  @override
  String get iconNameTimerEndFa => 'Hẹn giờ Kết thúc FA';

  @override
  String get iconNameStopwatchFa => 'Đồng hồ bấm giờ FA';

  @override
  String get iconNameAlarmFa => 'Báo thức FA';

  @override
  String get iconNameCropAltFa => 'Cắt Alt FA';

  @override
  String get iconNameCropFa => 'Cắt FA';

  @override
  String get iconNameSquareFullFa => 'Vuông Full FA';

  @override
  String get iconNameFullscreenAltFa => 'Toàn màn hình Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Zoom Cộng FA';

  @override
  String get iconNameZoomMinusFa => 'Zoom Trừ FA';

  @override
  String get iconNameMusicNoteFa => 'Nhạc Nốt FA';

  @override
  String get iconNameCdFa => 'CD FA';

  @override
  String get iconNameVinylFa => 'Đĩa than FA';

  @override
  String get iconNameRssFa => 'RSS FA';

  @override
  String get iconNameMagicFa => 'Phép thuật FA';

  @override
  String get iconNameFingerprintFa => 'Vân tay FA';

  @override
  String get iconNameUserFa => 'Người dùng FA';

  @override
  String get iconNameUsersFa => 'Người dùng FA';

  @override
  String get iconNameChildModeFa => 'Chế độ trẻ em FA';

  @override
  String get iconNameCastFa => 'Truyền FA';

  @override
  String get iconNameStreamFa => 'Luồng FA';

  @override
  String get iconNameSignalFa => 'Tín hiệu FA';

  @override
  String get iconNameFeedFa => 'Nguồn tin FA';

  @override
  String get iconNameCircleArrowUpFa => 'Circle Arrow Lên FA';

  @override
  String get iconNameCircleArrowDownFa => 'Circle Arrow Xuống FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Circle Arrow Trái FA';

  @override
  String get iconNameCircleArrowRightFa => 'Circle Arrow Phải FA';

  @override
  String get iconNameLongArrowUpFa => 'Long Arrow Lên FA';

  @override
  String get iconNameLongArrowDownFa => 'Long Arrow Xuống FA';

  @override
  String get iconNameLongArrowLeftFa => 'Long Arrow Trái FA';

  @override
  String get iconNameLongArrowRightFa => 'Long Arrow Phải FA';

  @override
  String get iconNamePlusFa => 'Cộng FA';

  @override
  String get iconNameMinusFa => 'Trừ FA';

  @override
  String get iconNamePlusCircleFa => 'Cộng Circle FA';

  @override
  String get iconNameMinusCircleFa => 'Trừ Circle FA';

  @override
  String get iconNamePlusSquareFa => 'Cộng Vuông FA';

  @override
  String get iconNameMinusSquareFa => 'Trừ Vuông FA';

  @override
  String get iconNameTimesFa => 'Nhân FA';

  @override
  String get iconNameTimesCircleFa => 'Nhân Circle FA';

  @override
  String get iconNameBatteryFullFa => 'Pin đầy FA';

  @override
  String get iconNameBattery34Fa => 'Pin 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'Battery Nửa FA';

  @override
  String get iconNameBattery14Fa => 'Pin 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'Pin cạn FA';

  @override
  String get iconNameChargingFa => 'Đang sạc FA';

  @override
  String get iconNameCloudSunFa => 'Mây Sun FA';

  @override
  String get iconNameCloudMoonFa => 'Mây Moon FA';

  @override
  String get iconNameRainFa => 'Mưa FA';

  @override
  String get iconNameSnowflakeFa => 'Bông tuyết FA';

  @override
  String get iconNameFireFa => 'Lửa FA';

  @override
  String get iconNameTemperatureFa => 'Nhiệt độ FA';

  @override
  String get iconNameBoxFa => 'Hộp FA';

  @override
  String get iconNameGiftFa => 'Quà FA';

  @override
  String get iconNameTrophyFa => 'Cúp FA';

  @override
  String get iconNameCrownFa => 'Vương miện FA';

  @override
  String get iconNameGemFa => 'Ngọc FA';

  @override
  String get unknownLabel => 'Không rõ';

  @override
  String get selectedFilesLabel => 'tệp đã chọn';

  @override
  String get folderNotFoundOrInaccessible =>
      'Không tìm thấy thư mục hoặc không thể truy cập.';

  @override
  String get importedRemoteDefaultName => 'ĐiềuKhiểnĐãNhập';

  @override
  String get demoRemoteName => 'Điều khiển mẫu';

  @override
  String get protocolFieldsInvalid =>
      'Điền các trường giao thức bắt buộc và bảo đảm tần số là 15k–60k nếu có đặt.';

  @override
  String get unknownProtocolSelected => 'Đã chọn giao thức không rõ.';

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
}
