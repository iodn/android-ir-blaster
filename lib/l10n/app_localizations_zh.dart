// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => '加载中…';

  @override
  String get unknownError => '未知错误';

  @override
  String get failedToStart => '启动失败';

  @override
  String get retry => '重试';

  @override
  String get quickTilePower => '电源';

  @override
  String get quickTileMute => '静音';

  @override
  String get quickTileVolumeUp => '音量 +';

  @override
  String get quickTileVolumeDown => '音量 -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      '此手机没有内置红外发射器。检测到 USB 红外 dongle，但尚未获得权限。\n\n请在 USB 权限提示中点击允许以启用红外发送。';

  @override
  String get homeUsbPermissionDeniedMessage =>
      '此手机没有内置红外发射器。检测到 USB 红外 dongle，但 USB 权限被拒绝。\n\n请再次申请权限并在提示中允许，以启用红外发送。';

  @override
  String get homeUsbPermissionGrantedMessage =>
      '此手机没有内置红外发射器。USB 红外 dongle 已授权，但尚未初始化。';

  @override
  String get homeUsbOpenFailedMessage =>
      '此手机没有内置红外发射器。检测到并已授权 USB 红外 dongle，但初始化失败。\n\n请重新连接 dongle 后重试。';

  @override
  String get homeUsbReadyMessage => '此手机没有内置红外发射器。';

  @override
  String get homeUsbNoDeviceMessage =>
      '此手机没有内置红外发射器，且当前未连接受支持的 USB 红外 dongle。\n\n你仍可创建、导入和管理遥控器，但要发射红外信号，需要使用下方其中一种方式。';

  @override
  String get homeUsbOptionPlugIn => '插入受支持的 USB 红外 dongle，然后授予权限。';

  @override
  String get homeUsbOptionReady => '可立即使用。';

  @override
  String get homeUsbOptionPermissionRequired => '已连接。需要权限。';

  @override
  String get homeUsbOptionPermissionDenied => '权限被拒。请重新申请。';

  @override
  String get homeUsbOptionPermissionGranted => '已授权。正在初始化 dongle。';

  @override
  String get homeUsbOptionOpenFailed => '已授权，但初始化失败。';

  @override
  String get homeHardwareBannerNoInternal =>
      '此手机没有内置红外。请连接 USB 红外 dongle，或在设置中启用音频模式。';

  @override
  String get homeHardwareBannerPermissionRequired =>
      '检测到 USB dongle。发送红外前需要权限。';

  @override
  String get homeHardwareBannerPermissionDenied => 'USB 权限被拒。请重新申请后再发送红外。';

  @override
  String get homeHardwareBannerPermissionGranted => 'USB dongle 已授权。正在等待初始化。';

  @override
  String get homeHardwareBannerOpenFailed => 'USB dongle 已授权，但初始化失败。';

  @override
  String get homeHardwareBannerReady => 'USB 已就绪。';

  @override
  String get homeHardwareRequiredTitle => '发送命令需要红外硬件';

  @override
  String get homeUsbDongleRecommended => 'USB 红外 dongle 推荐';

  @override
  String get homeAudioAdapterAlternative => '音频红外适配器 备选';

  @override
  String get homeAudioAdapterDescription =>
      '设置 → 红外发射器 → 音频 1 LED / 2 LED。需要音频转红外适配器。';

  @override
  String get close => '关闭';

  @override
  String get homeChooseTransmitter => '选择发射器';

  @override
  String get openSettings => '打开设置';

  @override
  String get homeUsbPermissionSentApprove => '已发送 USB 权限请求。请在提示中允许以启用 USB。';

  @override
  String get homeUsbDongleNotDetected => '未检测到受支持的 USB 红外 dongle。请插入后重试。';

  @override
  String get homeUsbPermissionRequestFailed => '申请 USB 权限失败。';

  @override
  String get working => '处理中…';

  @override
  String get requestUsbPermission => '申请 USB 权限';

  @override
  String get homeHardwareTip => '提示 你现在仍可创建和整理遥控器。只有发送时才需要硬件。';

  @override
  String get homeNoIrTransmitterTitle => '没有可用的红外发射器';

  @override
  String get settingsNavLabel => '设置';

  @override
  String get dismiss => '关闭';

  @override
  String get remotesNavLabel => '遥控器';

  @override
  String get macrosNavLabel => '宏';

  @override
  String get signalTesterNavLabel => '信号测试器';

  @override
  String get settingsTitle => '设置';

  @override
  String get remoteNoIrEmitterTitle => '没有红外发射器';

  @override
  String get remoteNoIrEmitterMessage => '此设备没有红外发射器';

  @override
  String get remoteNoIrEmitterNeedsEmitter => '此应用需要红外发射器才能工作';

  @override
  String get remoteDismiss => '关闭';

  @override
  String get remoteClose => '关闭';

  @override
  String remoteFailedToSend(Object error) {
    return '发送红外失败 $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return '启动循环失败 $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return '循环已停止 发送失败 $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return '正在循环 \"$title\"。点击顶部栏的停止即可结束。';
  }

  @override
  String get remoteLoopStopped => '循环已停止。';

  @override
  String get remoteUpdatedNotFound => '屏幕中的遥控器已更新，但在已保存列表中未找到。';

  @override
  String remoteUpdatedNamed(Object name) {
    return '已更新 \"$name\"。';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return '删除 失败: $error';
  }

  @override
  String get remoteNotFoundSavedList => '在已保存列表中未找到遥控器。';

  @override
  String remoteDeletedNamed(Object name) {
    return '已删除 \"$name\"。';
  }

  @override
  String get buttonFallbackTitle => '按钮';

  @override
  String get imageFallbackTitle => '图片';

  @override
  String get noBrowserAvailable => '没有可用浏览器';

  @override
  String failedToOpen(Object error) {
    return '打开失败 $error';
  }

  @override
  String get cancel => '取消';

  @override
  String get settingsRestoreDemoTitle => '恢复演示遥控器';

  @override
  String get settingsRestoreDemoMessage => '这将用内置演示遥控器替换当前遥控器。如果想保留现有列表，建议先备份。';

  @override
  String get settingsRestoreDemoConfirm => '恢复演示';

  @override
  String get settingsDemoRemotesRestored => '已恢复演示遥控器。';

  @override
  String get settingsDeleteAllRemotesTitle => '删除所有遥控器';

  @override
  String get settingsDeleteAllRemotesMessage => '这会从此设备移除所有遥控器。此操作无法撤销。';

  @override
  String get settingsDeleteAllConfirm => '全部删除';

  @override
  String get settingsAllRemotesDeleted => '已删除所有遥控器。';

  @override
  String get themeAuto => '自动主题';

  @override
  String get themeLight => '浅色主题';

  @override
  String get themeDark => '深色主题';

  @override
  String get themeDescAuto => '跟随设备设置';

  @override
  String get themeDescLight => '始终明亮清晰';

  @override
  String get themeDescDark => '更护眼';

  @override
  String get themeHintAuto => '当设备在浅色与深色模式间切换时，主题会自动切换';

  @override
  String get themeHintLight => '适合白天和明亮环境';

  @override
  String get themeHintDark => '降低弱光下的眼疲劳，并在 OLED 屏幕上节省电量';

  @override
  String get supportDevelopmentTitle => '支持开发';

  @override
  String get supportDevelopmentSubtitle => '帮助 IR Blaster 持续维护并兼容更多硬件';

  @override
  String get supportDevelopmentBody =>
      '无广告，无跟踪，无功能锁定。你的支持将用于协议适配、USB dongle 支持以及提升设备兼容性。';

  @override
  String get donate => '捐赠';

  @override
  String get starRepo => '给仓库点星';

  @override
  String get repositoryLinkCopied => '仓库链接已复制';

  @override
  String get supportPillLocalOnly => '仅本地';

  @override
  String get supportPillNoTracking => '无跟踪';

  @override
  String get supportPillHardwareAware => '适配硬件';

  @override
  String get supportPillOpenSource => '开源';

  @override
  String get appearanceTitle => '外观';

  @override
  String get appearanceSubtitle => '自定义视觉体验';

  @override
  String get localizationTitle => '本地化';

  @override
  String get localizationSubtitle => '应用语言与翻译行为';

  @override
  String localizationAutoUsing(Object language) {
    return '自动 使用 $language';
  }

  @override
  String get localizationAutoDescription => '应用会在可能时跟随设备语言。';

  @override
  String get localizationManualDescription => '应用语言已被手动覆盖。';

  @override
  String get useSystemLanguageTitle => '使用系统语言';

  @override
  String useSystemLanguageEnabled(Object language) {
    return '正在跟随设备语言 $language';
  }

  @override
  String get useSystemLanguageDisabled => '使用下方所选语言，而不是设备默认语言。';

  @override
  String get chooseAppLanguage => '选择应用语言';

  @override
  String get languagePickerDisabledHint => '关闭系统语言后可手动选择语言。';

  @override
  String get searchLanguages => '搜索语言';

  @override
  String get noLanguagesFound => '没有匹配的语言';

  @override
  String get localizationHint =>
      '启用系统语言时，应用会跟随设备地区语言，若无翻译则回退到英语。关闭后可将应用锁定为指定语言。';

  @override
  String get appLanguageTitle => '应用语言';

  @override
  String get appLanguageHint => '自动跟随设备语言。你也可以在此选择英语或法语，仅覆盖本应用。';

  @override
  String get languageAuto => '自动 系统';

  @override
  String get languageAutoDescription => '自动跟随设备语言';

  @override
  String get languageEnglish => '英语';

  @override
  String get languageEnglishDescription => '强制应用始终使用英语';

  @override
  String get languageFrench => '法语';

  @override
  String get languageFrenchDescription => '强制应用始终使用法语';

  @override
  String get languageAutoShort => '自动';

  @override
  String get languageEnglishShort => '英语';

  @override
  String get languageFrenchShort => '法语';

  @override
  String get useDynamicColors => '使用动态配色';

  @override
  String get themeChoiceAuto => '自动';

  @override
  String get themeChoiceLight => '浅色';

  @override
  String get themeChoiceDark => '深色';

  @override
  String get irTransmitterTitle => '红外发射器';

  @override
  String get irTransmitterSubtitle => '选择用于发送红外命令的硬件';

  @override
  String get interactionTitle => '交互';

  @override
  String get interactionSubtitle => '触控反馈与遥控器布局';

  @override
  String get hapticFeedbackTitle => '触觉反馈';

  @override
  String get hapticFeedbackSubtitle => '点击和操作时振动';

  @override
  String get forceInAppVibrationTitle => '强制应用内振动';

  @override
  String get forceInAppVibrationSubtitle => '即使系统触觉反馈已关闭，也直接使用振动器';

  @override
  String get forceInAppVibrationWarning => '高级选项。即使 Android 全局触觉反馈已关闭，应用也可能振动。';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => '强度';

  @override
  String get intensityLight => '轻';

  @override
  String get intensityMedium => '中';

  @override
  String get intensityStrong => '强';

  @override
  String get flipRemoteDefaultTitle => '默认翻转遥控器视图';

  @override
  String get flipRemoteDefaultSubtitle => '打开遥控器页面时旋转 180° 适用于底部 USB dongle。';

  @override
  String get remoteViewFlipped => '遥控器视图将以翻转方式打开。';

  @override
  String get remoteViewNormal => '遥控器视图将正常打开。';

  @override
  String get backupTitle => '备份';

  @override
  String get backupSubtitle => '导入导出遥控器和宏';

  @override
  String get importBackup => '导入备份';

  @override
  String get importBackupSubtitle => '导入遥控器 宏备份或 Flipper Zero LIRC IRPLUS 文件';

  @override
  String get bulkImportFolder => '批量导入文件夹';

  @override
  String get bulkImportFolderSubtitle => '从文件夹导入多个遥控器';

  @override
  String get exportBackup => '导出备份';

  @override
  String get exportBackupSubtitle => '将遥控器与宏保存为一个 JSON 文件到下载目录';

  @override
  String get restoreDemoRemotes => '恢复演示遥控器';

  @override
  String get restoreDemoRemotesSubtitle => '用内置演示替换当前遥控器';

  @override
  String get deleteAllRemotes => '删除所有遥控器';

  @override
  String get deleteAllRemotesSubtitle => '从此设备移除所有遥控器';

  @override
  String get backupTip =>
      '提示 大改前请先导出备份。导入支持完整备份、旧版仅遥控器 JSON 备份和 Flipper Zero .ir 文件。';

  @override
  String get aboutTitle => '关于';

  @override
  String get aboutSubtitle => '应用信息与开源详情';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return '版本 $version';
  }

  @override
  String get sourceCode => '源代码';

  @override
  String get viewOnGitHub => '在 GitHub 查看';

  @override
  String get repositoryUrlCopied => '仓库 URL 已复制';

  @override
  String get reportIssue => '报告问题';

  @override
  String get reportIssueSubtitle => '错误报告与功能请求';

  @override
  String get issuesUrlCopied => '问题页 URL 已复制';

  @override
  String get license => '许可证';

  @override
  String get openSourceLicense => '开源许可证';

  @override
  String get licenseUrlCopied => '许可证 URL 已复制';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => '访问我们的网站';

  @override
  String get companyUrlCopied => '公司 URL 已复制';

  @override
  String get licenses => '许可证';

  @override
  String get openSourceLicenses => '开源许可证';

  @override
  String byCreator(Object creator) {
    return '作者 $creator';
  }

  @override
  String get deviceControlsTitle => '设备控制';

  @override
  String get deviceControlsSubtitle => '在系统控制页面显示收藏按钮';

  @override
  String get manageFavorites => '管理收藏';

  @override
  String get manageFavoritesSubtitle => '选择显示在设备控制中的按钮';

  @override
  String get quickSettingsTitle => '快捷设置';

  @override
  String get quickSettingsSubtitle => '为电源和音量快捷操作添加磁贴';

  @override
  String get configureTiles => '配置磁贴';

  @override
  String get configureTilesSubtitle => '将磁贴映射到遥控器按钮';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle => '对自有设备进行通用电源循环';

  @override
  String get openTvKill => '打开 TVKill';

  @override
  String get openTvKillSubtitle => '循环发送电源码 仅用于你拥有的设备';

  @override
  String get failedToLoadTransmitterSettings => '加载发射器设置失败。';

  @override
  String get usbStatusReady => 'USB dongle 已连接并可发送红外。';

  @override
  String get usbStatusPermissionRequired =>
      '检测到 USB dongle。请申请 USB 权限并在系统提示中允许。';

  @override
  String get usbStatusPermissionDenied =>
      '已连接 dongle 的 USB 权限被拒绝。请再次申请并在提示中允许。';

  @override
  String get usbStatusPermissionGranted => 'USB 权限已授予，但 dongle 仍需初始化后才能发送红外。';

  @override
  String get usbStatusOpenFailed => 'USB 权限已授予，但 dongle 初始化失败。请重新连接后重试。';

  @override
  String get usbStatusNoDevice => '未检测到受支持的 USB 红外 dongle。';

  @override
  String get usbSelectPermissionRequired =>
      '检测到 USB dongle，但尚未授权。点击 \"申请 USB 权限\"。';

  @override
  String get usbSelectPermissionDenied => 'USB 权限被拒。点击 \"申请 USB 权限\" 并在提示中允许。';

  @override
  String get usbSelectPermissionGranted => 'USB 权限已授予，但 dongle 尚未初始化。请尝试重新连接。';

  @override
  String get usbSelectOpenFailed => 'USB 权限已授予，但 dongle 初始化失败。请重新连接后重试。';

  @override
  String get usbSelectNoDevice =>
      '未检测到受支持的 USB 红外 dongle。请先插入，再点击 \"申请 USB 权限\"。';

  @override
  String get usbSelectReady => 'USB dongle 已就绪。';

  @override
  String get autoSwitchEnabledMessage => '已启用自动切换 已连接时使用 USB，否则使用内置。';

  @override
  String get autoSwitchDisabledMessage => '已禁用自动切换 现在需要手动选择发射器。';

  @override
  String get failedToUpdateAutoSwitch => '更新自动切换设置失败。';

  @override
  String get failedToSwitchTransmitter => '切换发射器失败。';

  @override
  String get deviceHasNoInternalIr => '此设备没有内置红外发射器。';

  @override
  String get audioModeEnabledMessage => '已启用音频模式。请使用最大媒体音量和音频转红外 LED 适配器。';

  @override
  String get usbPermissionRequestSent => '已发送 USB 权限请求。';

  @override
  String get usbPermissionRequestSentApprove => '已发送 USB 权限请求。请在提示中允许以启用 USB。';

  @override
  String get usbAlreadyReady => 'USB dongle 已初始化并就绪。';

  @override
  String get failedToRequestUsbPermission => '申请 USB 权限失败。';

  @override
  String get transmitterHelpInternal => '使用手机内置红外发射器发送命令。';

  @override
  String get transmitterHelpUsb => '使用 USB 红外 dongle 发送命令 需要权限。';

  @override
  String get transmitterHelpAudio1 => '使用音频输出 单声道。需要音频转红外 LED 适配器和较高媒体音量。';

  @override
  String get transmitterHelpAudio2 =>
      '使用音频输出 立体声。配合兼容适配器时使用双声道以获得更好的 LED 驱动效果。';

  @override
  String get transmitterInternal => '内置 红外';

  @override
  String get transmitterUsb => 'USB 红外 dongle';

  @override
  String get transmitterAudio1 => '音频 (1 LED)';

  @override
  String get transmitterAudio2 => '音频 (2 LEDs)';

  @override
  String get failedToLoadTransmitterCapabilities => '加载发射器能力失败。';

  @override
  String get selectedTransmitter => '已选发射器';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • 当前 $active';
  }

  @override
  String get refresh => '刷新';

  @override
  String get autoSwitchTitle => '自动切换';

  @override
  String get autoSwitchDisabledWhileAudio => '使用音频模式时禁用';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal => '已连接时使用 USB，否则使用内置';

  @override
  String get unavailableOnThisDevice => '此设备不可用';

  @override
  String get openOnUsbAttachTitle => '连接 USB 时打开';

  @override
  String get openOnUsbAttachSubtitle =>
      '连接受支持的 USB 红外 dongle 时，Android 可能会建议打开此应用。';

  @override
  String get openOnUsbAttachEnabledMessage =>
      '连接受支持的 USB dongle 时，将建议打开 IR Blaster。';

  @override
  String get openOnUsbAttachDisabledMessage => '连接 USB 时不会建议打开。';

  @override
  String get failedToUpdateSetting => '更新设置失败。';

  @override
  String get unnamedButton => '未命名按钮';

  @override
  String get iconFallback => '图标';

  @override
  String get remoteListReorderHint => '排序模式 长按并拖动卡片以移动。';

  @override
  String get deleteRemoteTitle => '删除遥控器';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" 将被永久移除。此操作无法撤销。';
  }

  @override
  String get delete => '删除';

  @override
  String get addToDeviceControlsTitle => '添加到设备控制';

  @override
  String get addToDeviceControlsDescription => '可在系统设备控制中快速访问。';

  @override
  String get skip => '跳过';

  @override
  String get add => '添加';

  @override
  String get addedToDeviceControls => '已添加到设备控制。';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return '已删除 \"$name\"。此操作无法撤销。';
  }

  @override
  String remoteLayoutSummary(Object count, Object layout) {
    return '$count 按钮(s) · $layout';
  }

  @override
  String get layoutComfort => '舒适';

  @override
  String get layoutCompact => '紧凑';

  @override
  String get open => '打开';

  @override
  String get useThisRemote => '使用此遥控器';

  @override
  String get edit => '编辑';

  @override
  String get editRemoteSubtitle => '重命名并编辑按钮';

  @override
  String get thisCannotBeUndone => '此操作无法撤销';

  @override
  String get searchRemotes => '搜索遥控器';

  @override
  String get reorderRemotes => '重排 遥控器';

  @override
  String get addRemote => '添加 遥控器';

  @override
  String get more => '更多';

  @override
  String get reorderMode => '排序模式';

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
  String get noRemotesYet => '还没有遥控器';

  @override
  String get noRemotesDescription => '创建遥控器即可开始发送红外代码。';

  @override
  String get noRemotesNextStep => '下一步 点击添加遥控器，然后添加第一个按钮。';

  @override
  String get actions => '操作';

  @override
  String get macrosTitle => '宏';

  @override
  String get help => '帮助';

  @override
  String get createMacro => '创建宏';

  @override
  String get timedMacrosTitle => '定时宏';

  @override
  String get timedMacrosSubtitle => '以精确定时自动执行一系列红外命令';

  @override
  String get timedMacrosNextStep => '下一步 点击创建你的第一个宏，选择一个遥控器，然后添加命令和延迟。';

  @override
  String get macroFeatureToysTitle => '非常适合互动玩具';

  @override
  String get macroFeatureToysDescription =>
      '控制 i-cybie 机器狗、i-sobot 机器人等需要在命令间留出处理时间的设备。';

  @override
  String get macroFeatureTimingTitle => '精确定时控制';

  @override
  String get macroFeatureTimingDescription =>
      '在命令之间添加延迟 250ms 到自定义时长，让设备有时间在下一步前作出响应。';

  @override
  String get macroFeatureManualTitle => '手动继续步骤';

  @override
  String get macroFeatureManualDescription => '当动画时长不固定或你需要视觉反馈时，暂停执行并等待你的确认。';

  @override
  String get exampleUseCase => '示例用例';

  @override
  String get macroExampleText =>
      'i-cybie 高级模式\n1. 发送 “Mode” 命令\n2. 等待 1000ms 玩具处理\n3. 发送 “Action 1”\n4. 等待 1000ms\n5. 发送 “Action 2”\n…随后自动继续。';

  @override
  String get createFirstMacro => '创建你的第一个宏';

  @override
  String get noRemote => '没有遥控器';

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
  String get aboutTimedMacros => '关于定时宏';

  @override
  String get aboutTimedMacrosDescription => '定时宏可让你以精确延迟自动执行一系列红外命令。';

  @override
  String get sendCommand => '发送命令';

  @override
  String get sendCommandDescription => '发送来自遥控器的红外命令。';

  @override
  String get delay => '延迟';

  @override
  String get delayDescription => '在下一步前等待指定时长 例如 1000ms。';

  @override
  String get manualContinue => '手动继续';

  @override
  String get manualContinueDescription => '暂停执行，直到你点击继续 适合时长不固定的动画。';

  @override
  String get gotIt => '知道了';

  @override
  String get failedToSaveMacros => '保存宏失败。';

  @override
  String deletedMacroNamed(Object name) {
    return '已删除 \"$name\"。';
  }

  @override
  String get undo => '撤销';

  @override
  String get failedToRestoreMacro => '恢复宏失败。';

  @override
  String get deleteMacroTitle => '删除宏';

  @override
  String get deleteMacroMessage => '你可以在接下来的提示条中撤销此操作。';

  @override
  String get noRemotesAvailable => '没有可用遥控器。';

  @override
  String remoteButtonCountSummary(Object count) {
    return '$count 个按钮';
  }

  @override
  String get remoteOrientationFlippedTooltip => '方向 已翻转 点击恢复正常';

  @override
  String get remoteOrientationNormalTooltip => '方向 正常 点击翻转';

  @override
  String get stopLoop => '停止循环';

  @override
  String get reorderButtons => '重排按钮';

  @override
  String get remoteReorderHint => '排序模式 长按并拖动按钮以移动。';

  @override
  String get manageRemote => '管理遥控器';

  @override
  String get remoteNoButtons => '此遥控器中没有按钮';

  @override
  String get remoteNoButtonsDescription => '使用 \"编辑遥控器\" 添加或配置按钮。';

  @override
  String get editRemote => '编辑遥控器';

  @override
  String get editRemoteActionsSubtitle => '重命名、重排并编辑按钮';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return '已更新 \"$name\"。';
  }

  @override
  String buttonAddedNamed(Object name) {
    return '已添加 \"$name\".';
  }

  @override
  String get buttonDuplicated => '按钮已复制。';

  @override
  String get loopRunningForButton => '此按钮正在循环运行。';

  @override
  String get loopTip => '提示 使用循环可持续重复，直到你停止为止。';

  @override
  String get codeCopied => '代码已复制。';

  @override
  String get copyCode => '复制代码';

  @override
  String get startLoop => '开始循环';

  @override
  String get editButtonSubtitle => '修改标签、代码、协议和频率';

  @override
  String get newButton => '新建按钮';

  @override
  String get newButtonSubtitle => '在此按钮后创建新按钮';

  @override
  String get duplicate => '复制';

  @override
  String get duplicateButtonSubtitle => '创建此按钮的副本';

  @override
  String get removeFromDeviceControls => '从设备控制中移除';

  @override
  String get addToDeviceControls => '添加到设备控制';

  @override
  String get deviceControlsButtonSubtitle => '在系统设备控制中显示此按钮';

  @override
  String get removedFromDeviceControls => '已从 设备 控制 移除。';

  @override
  String get pinQuickTile => '固定到快捷磁贴收藏';

  @override
  String get unpinQuickTile => '取消固定快捷磁贴收藏';

  @override
  String get quickTileButtonSubtitle => '在快捷磁贴选择器顶部显示此按钮';

  @override
  String get removedFromQuickTileFavorites => '已从 快捷 磁贴 收藏 移除。';

  @override
  String get pinnedToQuickTileFavorites => '已固定到快捷磁贴收藏。';

  @override
  String get duplicateAndEdit => '复制并编辑';

  @override
  String get duplicateAndEditSubtitle => '创建副本并立即编辑';

  @override
  String get done => '完成';

  @override
  String get run => '运行';

  @override
  String get untitledRemote => '未命名遥控器';

  @override
  String get createRemoteTitle => '创建遥控器';

  @override
  String get editRemoteTitle => '编辑遥控器';

  @override
  String get removeButtonTitle => '移除按钮';

  @override
  String get imageButtonRemovedMessage => '此图片按钮将被移除。';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" 将被移除。';
  }

  @override
  String get remove => '移除';

  @override
  String importedButtonCount(int count) {
    return '已导入 $count 个按钮。';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return '已从现有遥控器导入 $count 个按钮。';
  }

  @override
  String get editButtonSettingsSubtitle => '更改标签、信号和高级设置';

  @override
  String get createButtonCopySubtitle => '创建此按钮的副本';

  @override
  String get duplicateAndEditButtonSubtitle => '创建副本并立即编辑';

  @override
  String get undoAvailableInNextSnackbar => '你可以在接下来的提示条中撤销';

  @override
  String get buttonRemoved => '按钮已移除。';

  @override
  String get remoteNameCannotBeEmpty => '遥控器名称不能为空。';

  @override
  String get saveRemote => '保存遥控器';

  @override
  String get remoteName => '遥控器名称';

  @override
  String get remoteNameHint => '例如 电视 空调 LED 灯带';

  @override
  String get remoteNameHelper => '此名称会显示在遥控器列表中。';

  @override
  String get layoutStyle => '布局样式';

  @override
  String get layoutWideDescription => '宽布局 2 列按钮并显示更多详情 推荐。';

  @override
  String get layoutCompactDescription => '紧凑布局 经典 4× 网格 仅图标 文本。';

  @override
  String get importFromRemotes => '从遥控器导入';

  @override
  String get importFromDatabase => '从数据库导入';

  @override
  String get addButton => '添加按钮';

  @override
  String get noButtonsYet => '还没有按钮';

  @override
  String get createRemoteEmptyStateDescription => '添加第一个按钮后，长按它可进行编辑或移除。';

  @override
  String get createButtonTitle => '创建按钮';

  @override
  String get editButtonTitle => '编辑按钮';

  @override
  String failedToLoadProtocols(Object error) {
    return '加载协议失败 $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return '加载数据库按键失败 $error';
  }

  @override
  String get presetPower => '电源';

  @override
  String get presetVolume => '音量';

  @override
  String get presetChannel => '频道';

  @override
  String get presetNavigation => '导航';

  @override
  String get all => '全部';

  @override
  String get completeRequiredFieldsToSave => '请填写必填项后再保存';

  @override
  String get buttonLabelStepTitle => '1 按钮标签';

  @override
  String get buttonLabelStepSubtitle => '选择图片、图标或输入文本标签。';

  @override
  String get buttonColorStepTitle => '2 按钮颜色 可选';

  @override
  String get buttonColorStepSubtitle => '为此按钮选择背景颜色。';

  @override
  String get selectColor => '选择颜色';

  @override
  String get noImageSelected => '未选择图片';

  @override
  String get gallery => '图库';

  @override
  String get builtIn => '内置';

  @override
  String get removeImage => '移除 图片';

  @override
  String get requiredSelectImageOrSwitch => '必填 请选择图片、图标，或切换到文本模式。';

  @override
  String get iconSelected => '已选择图标';

  @override
  String get noIconSelected => '未选择图标';

  @override
  String get chooseIcon => '选择图标';

  @override
  String get removeIcon => '移除图标';

  @override
  String get requiredSelectIconOrSwitch => '必填 请选择图标，或切换到图片 文本模式。';

  @override
  String get buttonText => '按钮文本';

  @override
  String get buttonTextHint => '例如 电源、音量 +、HDMI 1';

  @override
  String get buttonTextHelper => '此文本将显示在按钮上。';

  @override
  String get requiredEnterButtonLabel => '必填 请输入按钮标签。';

  @override
  String get defaultColorName => '默认';

  @override
  String get newRemoteCreatedFromLastHit => '已根据上次命中创建一个包含单个按钮的新遥控器。';

  @override
  String get selectRemote => '选择遥控器';

  @override
  String remoteNumber(Object id) {
    return '遥控器 #$id';
  }

  @override
  String get newRemoteCreated => '已创建新遥控器。';

  @override
  String get failedToCreateRemote => '创建遥控器失败。';

  @override
  String get newRemoteEllipsis => '新遥控器…';

  @override
  String addedToRemoteNamed(Object name) {
    return '已添加到 $name。';
  }

  @override
  String get failedToAddToRemote => '添加到遥控器失败。';

  @override
  String get newRemoteDefaultName => '新遥控器';

  @override
  String jumpedToOffsetPaused(int offset) {
    return '已跳转到偏移 $offset。已暂停 按恢复继续。';
  }

  @override
  String get sent => '已发送。';

  @override
  String failedToSend(Object error) {
    return '发送失败 $error';
  }

  @override
  String get copiedProtocolCode => '已复制 协议 代码。';

  @override
  String get savedToResults => '已保存到结果。';

  @override
  String invalidCodeForProtocol(Object error) {
    return '协议代码无效 $error';
  }

  @override
  String get copiedCurrentCandidate => '已复制当前候选项。';

  @override
  String get jumpToOffset => '跳转到偏移';

  @override
  String get jumpToBruteCursor => '跳转到暴力游标';

  @override
  String get jump => '跳转';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return '已跳转到游标 0x$cursor。已暂停 按恢复继续。';
  }

  @override
  String get irSignalTester => '红外信号测试器';

  @override
  String get stop => '停止';

  @override
  String get selectButton => '选择按钮';

  @override
  String get buttonNotFoundInRemotes => '在遥控器中未找到按钮。';

  @override
  String sentNamed(Object name) {
    return '已发送 \"$name\"。';
  }

  @override
  String sendFailed(Object error) {
    return '发送失败 $error';
  }

  @override
  String get noFavoritesYet => '还没有收藏';

  @override
  String get deviceControlsEmptyHint => '长按遥控器按钮并选择 “添加到设备控制”。';

  @override
  String get sendTest => '发送测试';

  @override
  String get testSendCompleted => '测试发送完成。';

  @override
  String testSendFailed(Object error) {
    return '测试发送失败 $error';
  }

  @override
  String removedNamed(Object name) {
    return '已移除 \"$name\"。';
  }

  @override
  String get brand => '品牌';

  @override
  String get model => '型号';

  @override
  String get selectBrand => '选择品牌';

  @override
  String get searchBrand => '搜索品牌…';

  @override
  String get selectModel => '选择型号';

  @override
  String get searchModel => '搜索型号…';

  @override
  String get unnamedKey => '未命名按键';

  @override
  String get unknown => '未知';

  @override
  String get emDash => '-';

  @override
  String get searchCommands => '搜索命令';

  @override
  String get noMatchingCommands => '没有匹配命令';

  @override
  String get quickTileFavoritesTitle => '快捷磁贴收藏';

  @override
  String changeMappingForTile(Object tileLabel) {
    return '更改 $tileLabel 磁贴映射';
  }

  @override
  String get pickDifferentButton => '选择其他按钮';

  @override
  String get browseAllRemotesEllipsis => '浏览所有遥控器…';

  @override
  String get invalidMacroFileFormat => '宏文件格式无效。';

  @override
  String get failedToParseMacroFile => '解析宏文件失败。';

  @override
  String get deviceCodeLabel => '设备代码';

  @override
  String get commandLabel => '命令';

  @override
  String get editButtonCodeTitle => '编辑按钮代码';

  @override
  String get thisRemoteHasNoButtons => '此遥控器没有按钮。';

  @override
  String get selectCommand => '选择命令';

  @override
  String get databaseModeAutofillHint =>
      '数据库模式会自动为你填充第 2 步 品牌 型号 协议。导入按键后，你仍可在手动模式中进一步调整。';

  @override
  String get test => '测试';

  @override
  String get allSelectedButtonsWereDuplicates => '所选按钮全部为重复项。';

  @override
  String get noButtonsImported => '未导入任何按钮。';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return '已导入 $addedCount 个按钮。跳过 $skippedCount 个重复项。';
  }

  @override
  String get importAllMatchingTitle => '导入所有匹配按钮';

  @override
  String get noMatchingKeysFound => '未找到匹配按键。';

  @override
  String importAllMatchingMessage(int count) {
    return '这将从当前数据库选择中导入最多 $count 个匹配按键。';
  }

  @override
  String get importAll => '全部导入';

  @override
  String get importingButtons => '正在导入按钮…';

  @override
  String get allMatchingButtonsWereDuplicates => '所有匹配按钮都是重复项。';

  @override
  String get quickPresets => '快捷预设';

  @override
  String get selectDeviceFirst => '请先选择设备';

  @override
  String get searchByLabelOrHex => '按标签或十六进制搜索';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return '可选 进一步细化 $preset 预设按键';
  }

  @override
  String get selectBrandModelProtocolFirst => '请先选择品牌、型号和协议。';

  @override
  String get importFromDatabaseTitle => '从数据库导入';

  @override
  String get importFromDatabaseSubtitle => '选择设备，加载匹配按键，然后导入所选按钮。';

  @override
  String get deviceAndFilters => '设备与筛选';

  @override
  String loadedCount(int count) {
    return '已加载 $count';
  }

  @override
  String get hideFilters => '隐藏筛选';

  @override
  String get showFilters => '显示筛选';

  @override
  String get noProtocolFoundForBrandModel => '未找到此品牌和型号对应的协议。';

  @override
  String get protocolAutoDetected => '协议';

  @override
  String get protocolAutoDetectedHelper => '已从数据库自动检测。导入前你仍可修改。';

  @override
  String get selectBrandModelToLoadKeys => '请选择品牌、型号和协议以加载按键。';

  @override
  String get noKeysFound => '未找到按键。';

  @override
  String noKeysFoundForSearch(Object query) {
    return '未找到 “$query” 的按键。';
  }

  @override
  String get skipDuplicates => '跳过重复项';

  @override
  String get skipDuplicatesSubtitle => '不要导入此遥控器中已存在的按钮。';

  @override
  String get importSelected => '导入所选';

  @override
  String get noMacrosToExport => '没有可导出的宏。';

  @override
  String get macrosExportedToDownloads => '宏已导出到下载目录。';

  @override
  String get failedToExportMacros => '导出宏失败。';

  @override
  String get failedToReadFile => '读取文件失败。';

  @override
  String get importFromExistingRemotesTitle => '从现有遥控器导入';

  @override
  String selectedCount(int count) {
    return '已选择 $count';
  }

  @override
  String get noOtherRemotesWithButtons => '未找到其他带按钮的遥控器。';

  @override
  String get sourceRemote => '来源遥控器';

  @override
  String get searchButtons => '搜索按钮';

  @override
  String get searchButtonsHint => '电源、音量、静音…';

  @override
  String get selectVisible => '选择可见项';

  @override
  String get clearVisible => '清除可见项';

  @override
  String protocolNamed(Object name) {
    return '协议 $name';
  }

  @override
  String get rawSignal => '原始';

  @override
  String get legacyCode => '旧代码';

  @override
  String importCount(int count) {
    return '导入 $count';
  }

  @override
  String get storagePermissionDeniedLegacy => '存储权限被拒 某些旧版 Android 设备需要此权限。';

  @override
  String get backupExportedToDownloads => '备份已导出到下载目录。';

  @override
  String failedToExport(Object error) {
    return '导出失败 $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return '已从旧版 JSON 备份导入 $count 个遥控器。宏未更改。';
  }

  @override
  String get importFailedRemotesMustBeList =>
      '导入失败 备份中的 \"遥控器\" 存在时必须是 JSON 列表。';

  @override
  String get importFailedMacrosMustBeList => '导入失败 备份中的 \"宏\" 存在时必须是 JSON 列表。';

  @override
  String get importFailedInvalidBackupFormat =>
      '导入失败 备份格式无效 预期为旧版列表或包含 遥控器 宏 的映射。';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return '已从备份导入 $remoteCount 个遥控器。宏未更改。';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return '已从备份导入 $remoteCount 个遥控器和 $macroCount 个宏。';
  }

  @override
  String get importFailedNoValidButtonsInIr => '导入失败 在.ir 文件中未找到有效按钮。';

  @override
  String get importedOneRemoteFromFlipper => '已从 Flipper.ir 导入 1 个遥控器。宏未更改。';

  @override
  String get importFailedInvalidIrplus => '导入失败 IRPlus 文件无效 未找到有效按钮。';

  @override
  String get importedOneRemoteFromIrplus => '已从 IRPlus 导入 1 个遥控器。宏未更改。';

  @override
  String get importFailedInvalidLirc => '导入失败 LIRC 文件无效 未找到有效代码 原始代码。';

  @override
  String get importedOneRemoteFromLirc => '已从 LIRC 配置导入 1 个遥控器。宏未更改。';

  @override
  String get unsupportedFileTypeSelected => '所选文件类型不受支持。';

  @override
  String get importFailedInvalidUnreadableFile => '导入失败 文件无效或无法读取。';

  @override
  String get bulkImportNoSupportedFilesInFolder => '批量导入完成 文件夹中未找到受支持文件。';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return '批量导入完成 未导入任何遥控器。已跳过 $skippedCount 个文件。';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return '批量导入完成 已从 $supportedCount 个受支持文件导入 $importedCount 个遥控器。已跳过 $skippedCount 个文件。';
  }

  @override
  String get storagePermissionDenied => '存储权限被拒。';

  @override
  String get bulkImportFailedReadFolder => '批量导入失败 无法读取文件夹内容。';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return '批量导入完成 未找到受支持文件 $sourceLabel。';
  }

  @override
  String get clearAction => '清除';

  @override
  String get saveAction => '保存';

  @override
  String buttonsTitleCount(int count) {
    return '按钮 ($count)';
  }

  @override
  String get invalidStepEncountered => '遇到无效步骤';

  @override
  String failedToSendNamed(Object name) {
    return '发送失败 $name';
  }

  @override
  String get buttonNotFound => '未找到按钮';

  @override
  String buttonNotFoundNamed(Object name) {
    return '未找到按钮 $name';
  }

  @override
  String get unknownButton => '未知 按钮';

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
  String get orientationFlippedTooltip => '方向 已翻转 点击恢复正常';

  @override
  String get orientationNormalTooltip => '方向 正常 点击翻转';

  @override
  String get noSteps => '没有步骤';

  @override
  String stepProgress(int current, int total) {
    return '步骤 $current / $total';
  }

  @override
  String get completed => '已完成';

  @override
  String get paused => '已暂停';

  @override
  String get running => '运行中';

  @override
  String get ready => '就绪';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total 步骤';
  }

  @override
  String get waiting => '等待中';

  @override
  String secondsRemaining(Object seconds) {
    return '剩余 ${seconds}s';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady => '准备好下一步后点击继续';

  @override
  String get error => '错误';

  @override
  String get macroCompleted => '宏已完成';

  @override
  String finishedIn(Object duration) {
    return '完成用时 $duration';
  }

  @override
  String get sequence => '序列';

  @override
  String waitMilliseconds(int ms) {
    return '等待 ${ms}ms';
  }

  @override
  String get runAgain => '再次运行';

  @override
  String get startMacro => '开始宏';

  @override
  String get continueAction => '继续';

  @override
  String get unnamedRemote => '未命名遥控器';

  @override
  String get enterMacroName => '输入宏名称';

  @override
  String get addAtLeastOneStep => '至少添加一个步骤';

  @override
  String get fixInvalidSteps => '修正无效步骤';

  @override
  String get unknownCommand => '未知命令';

  @override
  String get unnamedCommand => '未命名命令';

  @override
  String get iconCommand => '图标命令';

  @override
  String get selectDelay => '选择延迟';

  @override
  String keepMilliseconds(int ms) {
    return '保留 ${ms}ms';
  }

  @override
  String get custom => '自定义';

  @override
  String get enterCustomDelayDuration => '输入自定义延迟时长';

  @override
  String millisecondsLong(int ms) {
    return '$ms 毫秒';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds 秒$plural';
  }

  @override
  String get customDelay => '自定义延迟';

  @override
  String get delayMillisecondsLabel => '延迟 毫秒';

  @override
  String get delayMillisecondsHint => '例如 3000';

  @override
  String get recommendedDelayRange => '建议 大多数设备为 250 到 5000ms';

  @override
  String get enterValidPositiveNumber => '请输入有效的正数';

  @override
  String get ok => '确定';

  @override
  String get remote => '遥控器';

  @override
  String get macroName => '宏名称';

  @override
  String get macroNameHint => '例如 i-cybie 高级模式';

  @override
  String stepsTitleCount(int count) {
    return '步骤 $count';
  }

  @override
  String get noStepsYet => '还没有步骤';

  @override
  String get addCommandsAndDelaysHint => '在下方添加命令和延迟以构建你的序列';

  @override
  String get addStep => '添加步骤';

  @override
  String get reorderStepsHint => '提示 拖动把手可重排步骤。点击步骤可编辑。';

  @override
  String reorderStep(int index) {
    return '重排步骤 $index';
  }

  @override
  String get pressAndDragToChangeStepOrder => '按住并拖动以更改步骤顺序';

  @override
  String deleteStep(int index) {
    return '删除步骤 $index';
  }

  @override
  String get invalidStepTapToFix => '步骤无效 点击修复';

  @override
  String get sendIrCommand => '发送红外命令';

  @override
  String get waitForUserConfirmation => '等待用户确认';

  @override
  String get notImplemented => '尚未实现';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => '宽布局';

  @override
  String get iconButton => '图标按钮';

  @override
  String get imageButton => '图片按钮';

  @override
  String get noSignalInfo => '没有信号信息';

  @override
  String get proceed => '继续';

  @override
  String get discard => '丢弃';

  @override
  String get idle => '空闲';

  @override
  String get start => '开始';

  @override
  String get resume => '恢复';

  @override
  String get pause => '暂停';

  @override
  String get stopped => '已停止';

  @override
  String get copy => '复制';

  @override
  String get send => '发送';

  @override
  String get step => '步骤';

  @override
  String get addToRemote => '添加到遥控器';

  @override
  String get noDescriptionAvailable => '没有可用说明。';

  @override
  String get notAvailableSymbol => '-';

  @override
  String get irFinderKaseikyoVendorInvalid => 'Kaseikyo 厂商值必须正好为 4 个十六进制数字。';

  @override
  String get irFinderDatabaseNotReady => '数据库尚未就绪。';

  @override
  String get irFinderSelectBrandFirst => '请先在设置中选择品牌。';

  @override
  String get irFinderBruteforceUnavailable => '此协议暂不支持暴力枚举。';

  @override
  String get irFinderInvalidPrefix => '前缀无效。';

  @override
  String irFinderBrandValue(Object value) {
    return '品牌: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return '型号: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return '按键 $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return '遥控器 #$value';
  }

  @override
  String get irFinderJumpOffsetHelper => '请输入筛选并排序后的数据库结果中的从 0 开始索引。';

  @override
  String get irFinderJumpCursorHelper => '请输入暴力枚举空间中的从 0 开始十六进制游标。';

  @override
  String get irFinderSetupTab => '设置';

  @override
  String get irFinderTestTab => '测试';

  @override
  String get irFinderResultsTab => '结果';

  @override
  String get irFinderContinueToTest => '继续测试';

  @override
  String get irFinderKaseikyoVendorTitle => 'Kaseikyo 厂商';

  @override
  String get irFinderCustomVendorLabel => '自定义厂商 4 位十六进制';

  @override
  String get irFinderBrowseDbCandidates => '浏览数据库候选项…';

  @override
  String get irFinderEditSetup => '编辑设置';

  @override
  String get irFinderNoSavedHits => '还没有已保存命中。在测试页面中，当设备有反应时点击 “保存命中”。';

  @override
  String get irFinderBackToTest => '返回测试';

  @override
  String get irFinderLargeSearchSpaceTitle => '搜索空间很大';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return '该暴力枚举空间非常大 共 $human 种可能。IR Finder 仍会遵守你的最大尝试次数和冷却时间，但请注意不要对红外设备过度发送。\n\n建议 先使用数据库模式，或输入已知前缀字节以缩小空间。';
  }

  @override
  String get irFinderDatabaseSession => '数据库会话';

  @override
  String get irFinderBruteforceSession => '暴力会话';

  @override
  String get irFinderResumeLastSession => '恢复上次会话';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return '品牌: $brand · 型号: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return '前缀 $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return '进度 $progress · 开始时间 $when';
  }

  @override
  String get irFinderApplyResume => '应用并恢复';

  @override
  String get irFinderBruteforceMode => '暴力枚举';

  @override
  String get irFinderDatabaseAssistedMode => '数据库辅助';

  @override
  String irFinderProtocolTitle(Object name) {
    return '协议 $name';
  }

  @override
  String get irFinderProtocolLabel => '红外 协议';

  @override
  String get irFinderProtocolHelper => '它决定编码方式，因此也会影响搜索空间。';

  @override
  String get irFinderKnownPrefixLabel => '已知前缀 十六进制字节 可选';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return '负载 $digits 个十六进制数字';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return '负载 $digits 个十六进制数字 · 示例 $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return '负载 $digits 个十六进制数字 · 最大前缀 $bytes 字节';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return '负载 $digits 个十六进制数字 · 示例 $example · 最大前缀 $bytes 字节';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return '示例 $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback => '输入任意已知起始字节以缩小搜索空间。';

  @override
  String get irFinderDatabaseMode => '数据库';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return '规范化前缀 $value';
  }

  @override
  String get irFinderNormalizedPrefix => '规范化前缀';

  @override
  String get irFinderBruteforceNotConfigured => '此协议尚未配置暴力枚举。';

  @override
  String irFinderAllLimit(Object value) {
    return '全部 ($value)';
  }

  @override
  String get irFinderTestControls => '测试控制';

  @override
  String irFinderPayloadLength(int digits) {
    return '负载长度 $digits 个十六进制数字。';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return '搜索空间 $value 种可能 受前缀约束后。';
  }

  @override
  String get irFinderCooldownMs => '冷却时间 毫秒';

  @override
  String get irFinderMaxAttemptsPerRun => '最大尝试次数 每次运行';

  @override
  String get irFinderTestAllCombinations => '测试所有组合';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return '将持续运行直到搜索空间耗尽。本次有效上限 $value';
  }

  @override
  String get irFinderAttempts => '尝试次数';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return '滑块范围 1 到 $max 若需更大值可直接输入数字';
  }

  @override
  String irFinderMaxButton(int value) {
    return '最大\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return '本次运行有效上限 $value';
  }

  @override
  String get irFinderBruteforceTip =>
      '提示 先使用数据库模式。若已知前缀 例如前 1 到 4 个字节 时，暴力枚举效果最好。';

  @override
  String get irFinderDatabaseInitFailed => '数据库初始化失败。';

  @override
  String get irFinderPreparingDatabase => '正在准备本地红外代码数据库…';

  @override
  String get irFinderDatabaseAssistedSearch => '数据库辅助搜索';

  @override
  String get irFinderBrand => '品牌';

  @override
  String get irFinderSelectBrand => '选择品牌';

  @override
  String get irFinderModelOptional => '型号 (可选)';

  @override
  String get irFinderSelectBrandFirstShort => '请先选择品牌';

  @override
  String get irFinderSelectModelRecommended => '选择a 型号 (推荐)';

  @override
  String get irFinderOnlySelectedProtocol => '仅所选协议';

  @override
  String get irFinderOnlySelectedProtocolHint => '仅筛选为所选协议的按键。关闭后可浏览全部协议。';

  @override
  String get irFinderQuickWinsFirst => '优先快速命中';

  @override
  String get irFinderQuickWinsFirstHint =>
      '会优先尝试 POWER、MUTE、VOL、CH 等样式的按键，然后再尝试更深层的按键。';

  @override
  String get irFinderMaxKeysPerRun => '每次运行最多测试按键数';

  @override
  String get irFinderTesting => '测试中…';

  @override
  String get irFinderCooldown => '冷却时间';

  @override
  String get irFinderEta => '预计时间';

  @override
  String get irFinderMode => '模式';

  @override
  String get irFinderRetryLast => '重试上次';

  @override
  String get irFinderTrigger => '触发';

  @override
  String get irFinderJump => '跳转…';

  @override
  String get irFinderSaveHit => '保存命中';

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
    return '上次尝试的代码 $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode => '开始测试后即可查看上次尝试的代码。';

  @override
  String irFinderFromDb(Object value) {
    return '来自数据库 $value';
  }

  @override
  String get irFinderFromBruteforce => '来自暴力枚举 由协议编码器生成。';

  @override
  String irFinderSendError(Object error) {
    return '发送错误 $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return '来源: $value';
  }

  @override
  String get irFinderResultsNote => '结果支持立即测试和复制。直接添加到遥控器的集成还可在编辑器流程中继续扩展。';

  @override
  String get irFinderBrowseDbCandidatesTitle => '浏览数据库候选项';

  @override
  String get irFinderFilterByLabelOrHex => '按标签或十六进制筛选…';

  @override
  String get irFinderJumpHere => '跳到这里';

  @override
  String get irFinderSelectModel => '选择型号';

  @override
  String get irFinderSearchBrands => '搜索品牌…';

  @override
  String get irFinderSearchModels => '搜索型号…';

  @override
  String get iconPickerTitle => '选择图标';

  @override
  String get iconPickerSearchHint => '搜索图标…';

  @override
  String get iconPickerNoIconsFound => '未找到图标';

  @override
  String iconPickerIconsAvailable(int count) {
    return '可用图标 $count';
  }

  @override
  String get iconPickerCategoryAll => '全部';

  @override
  String get iconPickerCategoryMedia => '媒体';

  @override
  String get iconPickerCategoryVolume => '音量';

  @override
  String get iconPickerCategoryNavigation => '导航';

  @override
  String get iconPickerCategoryPower => '电源';

  @override
  String get iconPickerCategoryNumbers => '数字';

  @override
  String get iconPickerCategorySettings => '设置';

  @override
  String get iconPickerCategoryDisplay => '显示';

  @override
  String get iconPickerCategoryInput => '输入';

  @override
  String get iconPickerCategoryFavorite => '收藏';

  @override
  String get universalPowerTitle => '通用电源';

  @override
  String get universalPowerRunTab => '运行';

  @override
  String get universalPowerUseResponsibly => '请谨慎使用';

  @override
  String get universalPowerConsentBody =>
      '通用电源会循环发送红外电源码。仅可用于你拥有或控制的设备。设备有反应后请立即停止。';

  @override
  String get universalPowerConsentCheckbox => '我拥有或控制该设备';

  @override
  String get universalPowerSetupBody => '为所选品牌循环发送电源码。设备有反应后请立即停止。';

  @override
  String universalPowerLastSent(Object value) {
    return '上次发送 $value';
  }

  @override
  String get universalPowerNoCodesFound => '未找到电源码。请尝试扩大搜索范围。';

  @override
  String get universalPowerUnableToStart => '无法启动。';

  @override
  String get universalPowerAllBrands => '所有品牌 不筛选';

  @override
  String get universalPowerClearBrandFilter => '清除品牌筛选';

  @override
  String get universalPowerBroadenSearch => '必要时扩大搜索范围';

  @override
  String get universalPowerBroadenSearchHint => '如果未找到电源标签，请包含其他按键。';

  @override
  String get universalPowerAdditionalPatternsDepth => '附加模式深度';

  @override
  String get universalPowerDepth1 => '仅优先级 POWER OFF';

  @override
  String get universalPowerDepth2 => '包含 POWER 别名';

  @override
  String get universalPowerDepth3 => '包含次级电源标签';

  @override
  String get universalPowerDepth4 => '包含所有标签 最低优先级';

  @override
  String get universalPowerLoopUntilStopped => '循环直到停止';

  @override
  String get universalPowerLoopUntilStoppedHint => '会持续循环队列，直到你停止。';

  @override
  String get universalPowerDelayBetweenCodes => '代码之间的延迟';

  @override
  String get universalPowerStart => '开始通用电源';

  @override
  String get universalPowerRunStatus => '运行状态';

  @override
  String universalPowerProgress(Object value) {
    return '进度 $value';
  }

  @override
  String get universalPowerPausedInBackground => '因应用切到后台而暂停。';

  @override
  String get universalPowerSendOneCode => '发送一个代码';

  @override
  String get universalPowerStopWhenDeviceResponds => '设备有反应后请立即停止。';

  @override
  String get iconNamePlay => '播放';

  @override
  String get iconNamePause => '暂停';

  @override
  String get iconNameStop => '停止';

  @override
  String get iconNameFastForward => '快进';

  @override
  String get iconNameRewind => '快退';

  @override
  String get iconNameSkipNext => '下一项';

  @override
  String get iconNameSkipPrevious => '上一项';

  @override
  String get iconNameReplay => '重播';

  @override
  String get iconNameForward10S => '快进 10 秒';

  @override
  String get iconNameForward30S => '快进 30 秒';

  @override
  String get iconNameReplay10S => '重播 10s';

  @override
  String get iconNameReplay30S => '重播 30s';

  @override
  String get iconNameRecord => '录制';

  @override
  String get iconNameRecordAlt => '录制 替代';

  @override
  String get iconNameEject => '弹出';

  @override
  String get iconNameShuffle => '随机';

  @override
  String get iconNameRepeat => '重复';

  @override
  String get iconNameRepeatOne => '重复 一';

  @override
  String get iconNameVolumeUp => '音量加';

  @override
  String get iconNameVolumeDown => '音量减';

  @override
  String get iconNameVolumeOff => '关闭音量';

  @override
  String get iconNameMute => '静音';

  @override
  String get iconNameSpeaker => '扬声器';

  @override
  String get iconNameSurroundSound => '环绕 声音';

  @override
  String get iconNameEqualizer => '均衡器';

  @override
  String get iconNameAudio => '音频';

  @override
  String get iconNameMicrophone => '麦克风';

  @override
  String get iconNameMicOff => '麦克风 关';

  @override
  String get iconNameUp => '上';

  @override
  String get iconNameDown => '下';

  @override
  String get iconNameLeft => '左';

  @override
  String get iconNameRight => '右';

  @override
  String get iconNameArrowUp => '箭头 上';

  @override
  String get iconNameArrowDown => '箭头 下';

  @override
  String get iconNameArrowLeft => '箭头 左';

  @override
  String get iconNameArrowRight => '箭头 右';

  @override
  String get iconNameNavigation => '导航';

  @override
  String get iconNameChevronLeft => '尖角 左';

  @override
  String get iconNameChevronRight => '尖角 右';

  @override
  String get iconNameExpandLess => '收起';

  @override
  String get iconNameExpandMore => '展开 更多';

  @override
  String get iconNameCollapse => '折叠';

  @override
  String get iconNameExpand => '展开';

  @override
  String get iconNameCircleUp => '圆形 上';

  @override
  String get iconNameCircleDown => '圆形 下';

  @override
  String get iconNameCircleLeft => '圆形 左';

  @override
  String get iconNameCircleRight => '圆形 右';

  @override
  String get iconNameOkSelect => '确定 选择';

  @override
  String get iconNameConfirm => '确认';

  @override
  String get iconNameCancel => '取消';

  @override
  String get iconNameClose => '关闭';

  @override
  String get iconNameHome => '主页';

  @override
  String get iconNameReturn => '返回';

  @override
  String get iconNameExit => '退出';

  @override
  String get iconNameUndo => '撤销';

  @override
  String get iconNameRedo => '重做';

  @override
  String get iconNamePower => '电源';

  @override
  String get iconNamePowerAlt => '电源 替代';

  @override
  String get iconNamePowerOff => '关机';

  @override
  String get iconNameOn => '开';

  @override
  String get iconNameOff => '关';

  @override
  String get iconNameToggleOn => '切换开';

  @override
  String get iconNameToggleOff => '切换关';

  @override
  String get iconNameRestart => '重启';

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
  String get iconNameOne => '一';

  @override
  String get iconNameTwo => '二';

  @override
  String get iconNameThree => '三';

  @override
  String get iconNameFour => '四';

  @override
  String get iconNameFive => '五';

  @override
  String get iconNameSix => '六';

  @override
  String get iconNamePlus => '加号';

  @override
  String get iconNameMinus => '减号';

  @override
  String get iconNameAddCircle => '添加 圆形';

  @override
  String get iconNameRemoveCircle => '移除 圆形';

  @override
  String get iconNameSettings => '设置';

  @override
  String get iconNameMenu => '菜单';

  @override
  String get iconNameMoreVertical => '更多 竖向';

  @override
  String get iconNameMoreHorizontal => '更多 横向';

  @override
  String get iconNameTune => '调节';

  @override
  String get iconNameRemoteSettings => '遥控器设置';

  @override
  String get iconNameInfo => '信息';

  @override
  String get iconNameInfoOutline => '信息 轮廓';

  @override
  String get iconNameHelp => '帮助';

  @override
  String get iconNameHelpOutline => '帮助 轮廓';

  @override
  String get iconNameList => '列表';

  @override
  String get iconNameViewList => '列表视图';

  @override
  String get iconNameViewGrid => '网格视图';

  @override
  String get iconNameApps => '应用';

  @override
  String get iconNameWidgets => '小部件';

  @override
  String get iconNameTv => '电视';

  @override
  String get iconNameMonitor => '显示器';

  @override
  String get iconNameDesktop => '桌面';

  @override
  String get iconNameBrightnessHigh => '亮度高';

  @override
  String get iconNameBrightnessMedium => '亮度中';

  @override
  String get iconNameBrightnessLow => '亮度低';

  @override
  String get iconNameAutoBrightness => '自动亮度';

  @override
  String get iconNameLightMode => '浅色模式';

  @override
  String get iconNameDarkMode => '深色模式';

  @override
  String get iconNameContrast => '对比度';

  @override
  String get iconNameHdrOn => 'HDR 开';

  @override
  String get iconNameHdrOff => 'HDR 关';

  @override
  String get iconNameAspectRatio => '宽高比';

  @override
  String get iconNameCrop => '裁剪';

  @override
  String get iconNameZoomIn => '放大';

  @override
  String get iconNameZoomOut => '缩小';

  @override
  String get iconNameFullscreen => '全屏';

  @override
  String get iconNameExitFullscreen => '退出全屏';

  @override
  String get iconNameFitScreen => '适应屏幕';

  @override
  String get iconNamePip => '画中画';

  @override
  String get iconNameCropFree => '自由裁剪';

  @override
  String get iconNameInput => '输入';

  @override
  String get iconNameCable => '线缆';

  @override
  String get iconNameCast => '投屏';

  @override
  String get iconNameCastConnected => '投屏已连接';

  @override
  String get iconNameScreenShare => '屏幕共享';

  @override
  String get iconNameBluetooth => '蓝牙';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => '路由器';

  @override
  String get iconNameMemory => '内存';

  @override
  String get iconNameGameConsole => '游戏主机';

  @override
  String get iconNameGaming => '游戏';

  @override
  String get iconNameMedia => '媒体';

  @override
  String get iconNameMusicQueue => '音乐队列';

  @override
  String get iconNameVideoLibrary => '视频库';

  @override
  String get iconNamePhotoLibrary => '图片库';

  @override
  String get iconNameComponent => '分量';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => '复合输入';

  @override
  String get iconNameAntenna => '天线';

  @override
  String get iconNameFavorite => '收藏';

  @override
  String get iconNameFavoriteOutline => '收藏 轮廓';

  @override
  String get iconNameStar => '星标';

  @override
  String get iconNameStarOutline => '星标 轮廓';

  @override
  String get iconNameBookmark => '书签';

  @override
  String get iconNameBookmarkOutline => '书签 轮廓';

  @override
  String get iconNameFlag => '旗标';

  @override
  String get iconNameCheck => '勾选';

  @override
  String get iconNameDone => '完成';

  @override
  String get iconNameDoneAll => '全部完成';

  @override
  String get iconNameSchedule => '日程';

  @override
  String get iconNameTimer => '计时器';

  @override
  String get iconNameTime => '时间';

  @override
  String get iconNameAlarm => '闹钟';

  @override
  String get iconNameNotifications => '通知';

  @override
  String get iconNameLock => '锁定';

  @override
  String get iconNameUnlock => '解锁';

  @override
  String get iconNameLight => '灯光';

  @override
  String get iconNameLightOutline => '灯光 轮廓';

  @override
  String get iconNameWarmLight => '暖光';

  @override
  String get iconNameSunny => '晴天';

  @override
  String get iconNameCloudy => '多云';

  @override
  String get iconNameNight => '夜间';

  @override
  String get iconNameFlare => '闪光';

  @override
  String get iconNameGradient => '渐变';

  @override
  String get iconNameInvertColors => '反转颜色';

  @override
  String get iconNamePalette => '调色板';

  @override
  String get iconNameColor => '颜色';

  @override
  String get iconNameTonality => '色调';

  @override
  String get iconNameSearch => '搜索';

  @override
  String get iconNameRefresh => '刷新';

  @override
  String get iconNameSync => '同步';

  @override
  String get iconNameUpdate => '更新';

  @override
  String get iconNameDownload => '下载';

  @override
  String get iconNameUpload => '上传';

  @override
  String get iconNameCloud => '云';

  @override
  String get iconNameFolder => '文件夹';

  @override
  String get iconNameDelete => '删除';

  @override
  String get iconNameEdit => '编辑';

  @override
  String get iconNameSave => '保存';

  @override
  String get iconNameShare => '分享';

  @override
  String get iconNamePrint => '打印';

  @override
  String get iconNameLanguage => '语言';

  @override
  String get iconNameTranslate => '翻译';

  @override
  String get iconNameMicNone => '麦克风 无';

  @override
  String get iconNameSubtitles => '字幕';

  @override
  String get iconNameClosedCaption => '隐藏字幕';

  @override
  String get iconNameMusic => '音乐';

  @override
  String get iconNameMovie => '电影';

  @override
  String get iconNameTheater => '影院';

  @override
  String get iconNameLiveTv => '直播电视';

  @override
  String get iconNameRadio => '收音机';

  @override
  String get iconNameCamera => '相机';

  @override
  String get iconNameVideoCamera => '摄像机';

  @override
  String get iconNamePhotoCamera => '照相机';

  @override
  String get iconNameSlowMotion => '慢动作';

  @override
  String get iconNameSpeed => '速度';

  @override
  String get iconNameVideoSettings => '视频设置';

  @override
  String get iconNameAudioTrack => '音轨';

  @override
  String get iconNameGraphicEq => '图形均衡器';

  @override
  String get iconNameMusicVideo => '音乐视频';

  @override
  String get iconNamePlaylist => '播放列表';

  @override
  String get iconNameQueue => '队列';

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
  String get iconNameHashFa => '井号 # FA';

  @override
  String get iconNamePercentFa => '百分号 % FA';

  @override
  String get iconNameDivideFa => '除号 ÷ FA';

  @override
  String get iconNameMultiplyFa => '乘号 × FA';

  @override
  String get iconNameEqualsFa => '等号 = FA';

  @override
  String get iconNameNotEqualFa => '不等于 ≠ FA';

  @override
  String get iconNameGreaterThanFa => '大于 > FA';

  @override
  String get iconNameLessThanFa => '小于 < FA';

  @override
  String get iconNameAsteriskFa => '星号 * FA';

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
  String get iconNamePlayFa => '播放 FA';

  @override
  String get iconNamePauseFa => '暂停 FA';

  @override
  String get iconNameStopFa => '停止 FA';

  @override
  String get iconNamePlayFaOutline => '播放 FA 轮廓';

  @override
  String get iconNamePauseFaOutline => '暂停 FA 轮廓';

  @override
  String get iconNameStopFaOutline => '停止 FA 轮廓';

  @override
  String get iconNameBackwardFa => '后退 FA';

  @override
  String get iconNameForwardFa => '前进 FA';

  @override
  String get iconNamePreviousFa => '上一个 FA';

  @override
  String get iconNameNextFa => '下一个 FA';

  @override
  String get iconNameRewindFa => '快退 FA';

  @override
  String get iconNameFastForwardFa => '快进 FA';

  @override
  String get iconNameRepeatFa => '重复 FA';

  @override
  String get iconNameShuffleFa => '随机 FA';

  @override
  String get iconNameEjectFa => '弹出 FA';

  @override
  String get iconNameFilmFa => '胶片 FA';

  @override
  String get iconNameVideoFa => '视频 FA';

  @override
  String get iconNameMusicFa => '音乐 FA';

  @override
  String get iconNameMicrophoneFa => '麦克风 FA';

  @override
  String get iconNameCameraFa => '相机 FA';

  @override
  String get iconNameCameraRetroFa => '复古相机 FA';

  @override
  String get iconNameVolumeHighFa => '高音量 FA';

  @override
  String get iconNameVolumeLowFa => '低音量 FA';

  @override
  String get iconNameVolumeOffFa => '关闭音量 FA';

  @override
  String get iconNameMuteFa => '静音 FA';

  @override
  String get iconNameMicMuteFa => '麦克风静音 FA';

  @override
  String get iconNameHeadphonesFa => '耳机 FA';

  @override
  String get iconNameSpeakerFa => '扬声器 FA';

  @override
  String get iconNameUpFa => '上 FA';

  @override
  String get iconNameDownFa => '下 FA';

  @override
  String get iconNameLeftFa => '左 FA';

  @override
  String get iconNameRightFa => '右 FA';

  @override
  String get iconNameUpFaOutline => '上 FA 轮廓';

  @override
  String get iconNameDownFaOutline => '下 FA 轮廓';

  @override
  String get iconNameLeftFaOutline => '左 FA 轮廓';

  @override
  String get iconNameRightFaOutline => '右 FA 轮廓';

  @override
  String get iconNameArrowUpFa => '箭头 上 FA';

  @override
  String get iconNameArrowDownFa => '箭头 下 FA';

  @override
  String get iconNameArrowLeftFa => '箭头 左 FA';

  @override
  String get iconNameArrowRightFa => '箭头 右 FA';

  @override
  String get iconNameChevronUpFa => '尖角 上 FA';

  @override
  String get iconNameChevronDownFa => '尖角 下 FA';

  @override
  String get iconNameChevronLeftFa => '尖角 左 FA';

  @override
  String get iconNameChevronRightFa => '尖角 右 FA';

  @override
  String get iconNameOkFa => '确定 FA';

  @override
  String get iconNameOkFaOutline => '确定 FA 轮廓';

  @override
  String get iconNameCheckFa => '勾选 FA';

  @override
  String get iconNameCloseFa => '关闭 FA';

  @override
  String get iconNameCloseCircleFa => '关闭 圆形 FA';

  @override
  String get iconNameHomeFa => '主页 FA';

  @override
  String get iconNameUndoFa => '撤销 FA';

  @override
  String get iconNameRedoFa => '重做 FA';

  @override
  String get iconNameRotateFa => '旋转 FA';

  @override
  String get iconNameSearchFa => '搜索 FA';

  @override
  String get iconNameRefreshFa => '刷新 FA';

  @override
  String get iconNamePowerOffFa => '关机 FA';

  @override
  String get iconNamePlugFa => '插头 FA';

  @override
  String get iconNameToggleOnFa => '切换开 FA';

  @override
  String get iconNameToggleOffFa => '切换关 FA';

  @override
  String get iconNameSettingsFa => '设置 FA';

  @override
  String get iconNameSettingsAltFa => '设置 替代 FA';

  @override
  String get iconNameMenuFa => '菜单 FA';

  @override
  String get iconNameMoreFa => '更多 FA';

  @override
  String get iconNameMoreVerticalFa => '更多 竖向 FA';

  @override
  String get iconNameInfoFa => '信息 FA';

  @override
  String get iconNameInfoFaOutline => '信息 FA 轮廓';

  @override
  String get iconNameHelpFa => '帮助 FA';

  @override
  String get iconNameHelpFaOutline => '帮助 FA 轮廓';

  @override
  String get iconNameListFa => '列表 FA';

  @override
  String get iconNameGridFa => '网格 FA';

  @override
  String get iconNameSlidersFa => '滑块 FA';

  @override
  String get iconNameTvFa => '电视 FA';

  @override
  String get iconNameMonitorFa => '显示器 FA';

  @override
  String get iconNameDesktopFa => '桌面 FA';

  @override
  String get iconNameBrightnessFa => '亮度 FA';

  @override
  String get iconNameNightModeFa => '夜间模式 FA';

  @override
  String get iconNameLightFa => '灯光 FA';

  @override
  String get iconNameLightFaOutline => '灯光 FA 轮廓';

  @override
  String get iconNameFlashFa => '闪光 FA';

  @override
  String get iconNameFullscreenFa => '全屏 FA';

  @override
  String get iconNameExitFullscreenFa => '退出全屏 FA';

  @override
  String get iconNameZoomInFa => '放大 FA';

  @override
  String get iconNameZoomOutFa => '缩小 FA';

  @override
  String get iconNameSubtitlesFa => '字幕 FA';

  @override
  String get iconNamePictureInPictureFa => '画中画 FA';

  @override
  String get iconNameColorFa => '颜色 FA';

  @override
  String get iconNamePaintFa => '绘制 FA';

  @override
  String get iconNameInputFa => '输入 FA';

  @override
  String get iconNameWifiFa => 'WiFi FA';

  @override
  String get iconNameBluetoothFa => '蓝牙 FA';

  @override
  String get iconNameUsbFa => 'USB FA';

  @override
  String get iconNameEthernetFa => '以太网 FA';

  @override
  String get iconNameGamepadFa => '手柄 FA';

  @override
  String get iconNameBroadcastFa => '广播 FA';

  @override
  String get iconNameSatelliteFa => '卫星 FA';

  @override
  String get iconNameAntennaFa => '天线 FA';

  @override
  String get iconNameNetworkFa => '网络 FA';

  @override
  String get iconNameCloudFa => '云 FA';

  @override
  String get iconNameStarFa => '星标 FA';

  @override
  String get iconNameStarFaOutline => '星标 FA 轮廓';

  @override
  String get iconNameHeartFa => '爱心 FA';

  @override
  String get iconNameHeartFaOutline => '爱心 FA 轮廓';

  @override
  String get iconNameBookmarkFa => '书签 FA';

  @override
  String get iconNameBookmarkFaOutline => '书签 FA 轮廓';

  @override
  String get iconNameFlagFa => '旗标 FA';

  @override
  String get iconNameClockFa => '时钟 FA';

  @override
  String get iconNameClockFaOutline => '时钟 FA 轮廓';

  @override
  String get iconNameBellFa => '铃铛 FA';

  @override
  String get iconNameBellFaOutline => '铃铛 FA 轮廓';

  @override
  String get iconNameTimerFa => '计时器 FA';

  @override
  String get iconNameLockFa => '锁定 FA';

  @override
  String get iconNameUnlockFa => '解锁 FA';

  @override
  String get iconNameGalleryFa => '图库 FA';

  @override
  String get iconNameImagesFa => '图片 FA';

  @override
  String get iconNameImageFa => '图片 FA';

  @override
  String get iconNameVideoFileFa => '视频文件 FA';

  @override
  String get iconNameAudioFileFa => '音频文件 FA';

  @override
  String get iconNamePlayOutlineFa => '播放 轮廓 FA';

  @override
  String get iconNamePlaySimpleFa => '播放 简洁 FA';

  @override
  String get iconNamePauseSimpleFa => '暂停 简洁 FA';

  @override
  String get iconNameStopSimpleFa => '停止 简洁 FA';

  @override
  String get iconNameRecordFa => '录制 FA';

  @override
  String get iconNameStopCircleFa => '停止 圆形 FA';

  @override
  String get iconNameLoadingFa => '加载中 FA';

  @override
  String get iconNameTextFa => '文本 FA';

  @override
  String get iconNameTextSizeFa => '文本 大小 FA';

  @override
  String get iconNameLanguageFa => '语言 FA';

  @override
  String get iconNameGlobeFa => '地球 FA';

  @override
  String get iconNameSubtitlesAltFa => '字幕 替代 FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => '字幕 替代 轮廓 FA';

  @override
  String get iconNameChannelUpFa => '频道加 FA';

  @override
  String get iconNameChannelDownFa => '频道减 FA';

  @override
  String get iconNamePageUpFa => '向上翻页 FA';

  @override
  String get iconNamePageDownFa => '向下翻页 FA';

  @override
  String get iconNameGuideFa => '指南 FA';

  @override
  String get iconNameGridViewFa => '网格视图 FA';

  @override
  String get iconNameGridAltFa => '网格 替代 FA';

  @override
  String get iconNameScheduleFa => '日程 FA';

  @override
  String get iconNameCalendarFa => '日历 FA';

  @override
  String get iconNameRedButtonFa => '红色按钮 FA';

  @override
  String get iconNameButtonOutlineFa => '按钮轮廓 FA';

  @override
  String get iconNameSquareButtonFa => '方形按钮 FA';

  @override
  String get iconNameSquareOutlineFa => '方形轮廓 FA';

  @override
  String get iconNameDotCircleFa => '点圆 FA';

  @override
  String get iconNameToolsFa => '工具 FA';

  @override
  String get iconNameScrewdriverFa => '螺丝刀 FA';

  @override
  String get iconNameHammerFa => '锤子 FA';

  @override
  String get iconNameToolboxFa => '工具箱 FA';

  @override
  String get iconNameCogFa => '齿轮 FA';

  @override
  String get iconNameAdjustFa => '调整 FA';

  @override
  String get iconNameFilterFa => '筛选 FA';

  @override
  String get iconNameSortDownFa => '排序 下 FA';

  @override
  String get iconNameSortUpFa => '排序 上 FA';

  @override
  String get iconNameSleepFa => '睡眠 FA';

  @override
  String get iconNameTimerStartFa => '计时开始 FA';

  @override
  String get iconNameTimerHalfFa => '计时一半 FA';

  @override
  String get iconNameTimerEndFa => '计时结束 FA';

  @override
  String get iconNameStopwatchFa => '秒表 FA';

  @override
  String get iconNameAlarmFa => '闹钟 FA';

  @override
  String get iconNameCropAltFa => '裁剪 替代 FA';

  @override
  String get iconNameCropFa => '裁剪 FA';

  @override
  String get iconNameSquareFullFa => '实心方块 FA';

  @override
  String get iconNameFullscreenAltFa => '全屏 替代 FA';

  @override
  String get iconNameZoomPlusFa => '放大加 FA';

  @override
  String get iconNameZoomMinusFa => '缩小减 FA';

  @override
  String get iconNameMusicNoteFa => '音符 FA';

  @override
  String get iconNameCdFa => 'CD FA';

  @override
  String get iconNameVinylFa => '黑胶 FA';

  @override
  String get iconNameRssFa => 'RSS FA';

  @override
  String get iconNameMagicFa => '魔法 FA';

  @override
  String get iconNameFingerprintFa => '指纹 FA';

  @override
  String get iconNameUserFa => '用户 FA';

  @override
  String get iconNameUsersFa => '用户 FA';

  @override
  String get iconNameChildModeFa => '儿童模式 FA';

  @override
  String get iconNameCastFa => '投屏 FA';

  @override
  String get iconNameStreamFa => '流 FA';

  @override
  String get iconNameSignalFa => '信号 FA';

  @override
  String get iconNameFeedFa => '动态 FA';

  @override
  String get iconNameCircleArrowUpFa => '圆形上箭头 FA';

  @override
  String get iconNameCircleArrowDownFa => '圆形下箭头 FA';

  @override
  String get iconNameCircleArrowLeftFa => '圆形左箭头 FA';

  @override
  String get iconNameCircleArrowRightFa => '圆形右箭头 FA';

  @override
  String get iconNameLongArrowUpFa => '长上箭头 FA';

  @override
  String get iconNameLongArrowDownFa => '长下箭头 FA';

  @override
  String get iconNameLongArrowLeftFa => '长左箭头 FA';

  @override
  String get iconNameLongArrowRightFa => '长右箭头 FA';

  @override
  String get iconNamePlusFa => '加号 FA';

  @override
  String get iconNameMinusFa => '减号 FA';

  @override
  String get iconNamePlusCircleFa => '加号圆 FA';

  @override
  String get iconNameMinusCircleFa => '减号圆 FA';

  @override
  String get iconNamePlusSquareFa => '加号方 FA';

  @override
  String get iconNameMinusSquareFa => '减号方 FA';

  @override
  String get iconNameTimesFa => '乘号 FA';

  @override
  String get iconNameTimesCircleFa => '乘号圆 FA';

  @override
  String get iconNameBatteryFullFa => '电池满 FA';

  @override
  String get iconNameBattery34Fa => '电池 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => '半电量 FA';

  @override
  String get iconNameBattery14Fa => '电池 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => '电量空 FA';

  @override
  String get iconNameChargingFa => '充电 FA';

  @override
  String get iconNameCloudSunFa => '晴云 FA';

  @override
  String get iconNameCloudMoonFa => '月云 FA';

  @override
  String get iconNameRainFa => '雨 FA';

  @override
  String get iconNameSnowflakeFa => '雪花 FA';

  @override
  String get iconNameFireFa => '火 FA';

  @override
  String get iconNameTemperatureFa => '温度 FA';

  @override
  String get iconNameBoxFa => '盒子 FA';

  @override
  String get iconNameGiftFa => '礼物 FA';

  @override
  String get iconNameTrophyFa => '奖杯 FA';

  @override
  String get iconNameCrownFa => '王冠 FA';

  @override
  String get iconNameGemFa => '宝石 FA';

  @override
  String get unknownLabel => '未知';

  @override
  String get selectedFilesLabel => '已选择文件';

  @override
  String get folderNotFoundOrInaccessible => '文件夹不存在或无法访问。';

  @override
  String get importedRemoteDefaultName => '已导入遥控器';

  @override
  String get demoRemoteName => '演示遥控器';

  @override
  String get protocolFieldsInvalid => '请填写必填协议字段，若设置频率，请确保在 15k 到 60k 之间。';

  @override
  String get unknownProtocolSelected => '所选协议未知。';
}
