// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => '読み込み中…';

  @override
  String get unknownError => '不明なエラー';

  @override
  String get failedToStart => '開始に失敗しました';

  @override
  String get retry => '再試行';

  @override
  String get quickTilePower => '電源';

  @override
  String get quickTileMute => 'ミュート';

  @override
  String get quickTileVolumeUp => '音量 +';

  @override
  String get quickTileVolumeDown => '音量 -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'この端末には内蔵IR送信機がありません。 USB IRドングルを検出しましたが まだ権限がありません。\n\nIR送信を有効にするにはUSB権限の確認を許可してください。';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'この端末には内蔵IR送信機がありません。 USB IRドングルを検出しましたが USB権限が拒否されました。\n\nIR送信を有効にするには権限を再要求し 確認を許可してください。';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'この端末には内蔵IR送信機がありません。 USB IRドングルは認証済みですが まだ初期化されていません。';

  @override
  String get homeUsbOpenFailedMessage =>
      'この端末には内蔵IR送信機がありません。 USB IRドングルは検出済みかつ認証済みですが 初期化できませんでした。\n\nドングルを再接続して再試行してください。';

  @override
  String get homeUsbReadyMessage => 'この端末には内蔵IR送信機がありません。';

  @override
  String get homeUsbNoDeviceMessage =>
      'この端末には内蔵IR送信機がなく 対応するUSB IRドングルも現在接続されていません。\n\nリモコンの作成 取り込み 管理は可能ですが IR送信には以下のいずれかが必要です。';

  @override
  String get homeUsbOptionPlugIn => '対応USB IRドングルを接続し 権限を許可してください。';

  @override
  String get homeUsbOptionReady => '使用できます。';

  @override
  String get homeUsbOptionPermissionRequired => '接続済みです。権限が必要です。';

  @override
  String get homeUsbOptionPermissionDenied => '権限が拒否されました。再要求してください。';

  @override
  String get homeUsbOptionPermissionGranted => '認証済みです。ドングルを初期化中です。';

  @override
  String get homeUsbOptionOpenFailed => '認証済みですが 初期化に失敗しました。';

  @override
  String get homeHardwareBannerNoInternal =>
      'この端末には内蔵IRがありません。USB IRドングルを接続するか 設定で音声モードを有効にしてください。';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'USBドングルを検出しました。IR送信には権限が必要です。';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'USB権限が拒否されました。IR送信のため再要求してください。';

  @override
  String get homeHardwareBannerPermissionGranted => 'USBドングルは認証済みです。初期化待ちです。';

  @override
  String get homeHardwareBannerOpenFailed => 'USBドングルは認証済みですが 初期化に失敗しました。';

  @override
  String get homeHardwareBannerReady => 'USBは使用可能です。';

  @override
  String get homeHardwareRequiredTitle => 'コマンド送信にはIRハードが必要です';

  @override
  String get homeUsbDongleRecommended => 'USB IRドングル 推奨';

  @override
  String get homeAudioAdapterAlternative => '音声IRアダプタ 代替';

  @override
  String get homeAudioAdapterDescription =>
      '設定 → IR送信機 → 音声 1 LED / 2 LED。音声からIRへのアダプタが必要です。';

  @override
  String get close => '閉じる';

  @override
  String get homeChooseTransmitter => '送信機を選択';

  @override
  String get openSettings => '設定を開く';

  @override
  String get homeUsbPermissionSentApprove =>
      'USB権限要求を送信しました。USBを有効にするには確認を許可してください。';

  @override
  String get homeUsbDongleNotDetected =>
      '対応するUSB IRドングルが見つかりません。接続して再試行してください。';

  @override
  String get homeUsbPermissionRequestFailed => 'USB権限の要求に失敗しました。';

  @override
  String get working => '処理中…';

  @override
  String get requestUsbPermission => 'USB権限を要求';

  @override
  String get homeHardwareTip => 'ヒント リモコンの作成や整理は今でも可能です。ハードが必要なのは送信時だけです。';

  @override
  String get homeNoIrTransmitterTitle => 'IR送信機がありません';

  @override
  String get settingsNavLabel => '設定';

  @override
  String get dismiss => '閉じる';

  @override
  String get remotesNavLabel => 'リモコン';

  @override
  String get macrosNavLabel => 'マクロ';

  @override
  String get signalTesterNavLabel => '信号テスター';

  @override
  String get settingsTitle => '設定';

  @override
  String get remoteNoIrEmitterTitle => 'No IR emitter';

  @override
  String get remoteNoIrEmitterMessage => 'この端末にはIR送信機がありません';

  @override
  String get remoteNoIrEmitterNeedsEmitter => 'このアプリの動作にはIR送信機が必要です';

  @override
  String get remoteDismiss => '閉じる';

  @override
  String get remoteClose => '閉じる';

  @override
  String remoteFailedToSend(Object error) {
    return 'IR送信に失敗しました: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'ループ開始に失敗しました: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'ループ停止 送信失敗: $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return '\"$title\" をループ中です。上部バーの停止を押すと止まります。';
  }

  @override
  String get remoteLoopStopped => 'ループを停止しました。';

  @override
  String get remoteUpdatedNotFound => '画面上のリモコンを更新しました。保存済み一覧には見つかりませんでした。';

  @override
  String remoteUpdatedNamed(Object name) {
    return '\"$name\" を更新しました。';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return '削除に失敗しました: $error';
  }

  @override
  String get remoteNotFoundSavedList => '保存済み一覧にリモコンが見つかりません。';

  @override
  String remoteDeletedNamed(Object name) {
    return '\"$name\" を削除しました。';
  }

  @override
  String get buttonFallbackTitle => 'ボタン';

  @override
  String get imageFallbackTitle => '画像';

  @override
  String get noBrowserAvailable => 'ブラウザがありません';

  @override
  String failedToOpen(Object error) {
    return '開けませんでした: $error';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get settingsRestoreDemoTitle => 'デモリモコンを復元しますか?';

  @override
  String get settingsRestoreDemoMessage =>
      '現在のリモコンを内蔵デモリモコンに置き換えます。今の一覧を残したい場合はバックアップを推奨します。';

  @override
  String get settingsRestoreDemoConfirm => 'デモを復元';

  @override
  String get settingsDemoRemotesRestored => 'デモリモコンを復元しました';

  @override
  String get settingsDeleteAllRemotesTitle => 'すべてのリモコンを削除しますか?';

  @override
  String get settingsDeleteAllRemotesMessage => 'この端末のすべてのリモコンを削除します。元に戻せません。';

  @override
  String get settingsDeleteAllConfirm => 'すべて削除';

  @override
  String get settingsAllRemotesDeleted => 'すべてのリモコンを削除しました';

  @override
  String get themeAuto => '自動テーマ';

  @override
  String get themeLight => 'ライトテーマ';

  @override
  String get themeDark => 'ダークテーマ';

  @override
  String get themeDescAuto => '端末設定に従います';

  @override
  String get themeDescLight => '常に明るく見やすい';

  @override
  String get themeDescDark => '目にやさしい';

  @override
  String get themeHintAuto => '端末設定のライト ダーク切替に合わせてテーマも自動で切り替わります';

  @override
  String get themeHintLight => '日中や明るい場所に最適です';

  @override
  String get themeHintDark => '暗い場所で目の負担を減らし OLED画面では電池も節約します。';

  @override
  String get supportDevelopmentTitle => '開発を支援';

  @override
  String get supportDevelopmentSubtitle => 'IR Blasterの保守とハード互換性を支援';

  @override
  String get supportDevelopmentBody =>
      '広告なし 追跡なし 機能制限なし。ご支援はプロトコル対応 USBドングル対応 端末互換性向上に使われます。';

  @override
  String get donate => '寄付';

  @override
  String get starRepo => 'リポジトリにスター';

  @override
  String get repositoryLinkCopied => 'リポジトリのリンクをコピーしました';

  @override
  String get supportPillLocalOnly => 'ローカルのみ';

  @override
  String get supportPillNoTracking => '追跡なし';

  @override
  String get supportPillHardwareAware => 'ハード対応';

  @override
  String get supportPillOpenSource => 'オープンソース';

  @override
  String get appearanceTitle => '外観';

  @override
  String get appearanceSubtitle => '表示をカスタマイズ';

  @override
  String get localizationTitle => '言語設定';

  @override
  String get localizationSubtitle => 'アプリ言語と翻訳動作';

  @override
  String localizationAutoUsing(Object language) {
    return '自動 使用中: $language';
  }

  @override
  String get localizationAutoDescription => '可能な場合 アプリは端末の言語に従います。';

  @override
  String get localizationManualDescription => 'アプリ言語は手動で上書きされています。';

  @override
  String get useSystemLanguageTitle => 'システム言語を使用';

  @override
  String useSystemLanguageEnabled(Object language) {
    return '端末言語に追従中: $language';
  }

  @override
  String get useSystemLanguageDisabled => '端末既定ではなく 下で選んだ言語を使います。';

  @override
  String get chooseAppLanguage => 'アプリの言語を選択';

  @override
  String get languagePickerDisabledHint => '手動で言語を選ぶにはシステム言語をオフにしてください。';

  @override
  String get searchLanguages => '言語を検索';

  @override
  String get noLanguagesFound => '一致する言語がありません';

  @override
  String get localizationHint =>
      'システム言語が有効な場合 アプリは端末ロケールに従い 翻訳がないときは英語に戻ります。特定の言語に固定するにはオフにしてください。';

  @override
  String get appLanguageTitle => 'アプリ言語';

  @override
  String get appLanguageHint => '自動では端末言語に従います。ここで英語またはフランス語を選ぶとアプリだけ上書きされます。';

  @override
  String get languageAuto => '自動 システム';

  @override
  String get languageAutoDescription => '端末言語に自動追従';

  @override
  String get languageEnglish => '英語';

  @override
  String get languageEnglishDescription => '常に英語を使用';

  @override
  String get languageFrench => 'フランス語';

  @override
  String get languageFrenchDescription => '常にフランス語を使用';

  @override
  String get languageAutoShort => '自動';

  @override
  String get languageEnglishShort => '英語';

  @override
  String get languageFrenchShort => 'フランス語';

  @override
  String get useDynamicColors => '動的カラーを使用';

  @override
  String get themeChoiceAuto => '自動';

  @override
  String get themeChoiceLight => '弱';

  @override
  String get themeChoiceDark => 'ダーク';

  @override
  String get irTransmitterTitle => 'IR送信機';

  @override
  String get irTransmitterSubtitle => 'IR送信に使うハードを選択';

  @override
  String get interactionTitle => '操作';

  @override
  String get interactionSubtitle => '触覚フィードバックとレイアウト';

  @override
  String get hapticFeedbackTitle => '触覚フィードバック';

  @override
  String get hapticFeedbackSubtitle => 'タップや操作で振動';

  @override
  String get forceInAppVibrationTitle => 'アプリ内の振動を強制する';

  @override
  String get forceInAppVibrationSubtitle => 'システムのタッチフィードバックがオフでもバイブレータを直接使用する';

  @override
  String get forceInAppVibrationWarning =>
      '高度なオプションです。Android のタッチフィードバックが全体で無効でも、アプリが振動する場合があります。';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => '強さ';

  @override
  String get intensityLight => '弱';

  @override
  String get intensityMedium => '中';

  @override
  String get intensityStrong => '強';

  @override
  String get flipRemoteDefaultTitle => 'リモコン表示を既定で反転';

  @override
  String get flipRemoteDefaultSubtitle => 'リモコン画面を180°回転して開きます 下部接続のUSBドングル向け';

  @override
  String get remoteViewFlipped => 'リモコン表示は反転して開きます';

  @override
  String get remoteViewNormal => 'リモコン表示は通常で開きます';

  @override
  String get backupTitle => 'バックアップ';

  @override
  String get backupSubtitle => 'リモコンとマクロを入出力';

  @override
  String get importBackup => 'バックアップを取り込み';

  @override
  String get importBackupSubtitle =>
      'リモコン マクロのバックアップや Flipper Zero LIRC IRPLUS ファイルを取り込み';

  @override
  String get bulkImportFolder => 'フォルダ一括取り込み';

  @override
  String get bulkImportFolderSubtitle => 'フォルダから複数のリモコンを取り込み';

  @override
  String get exportBackup => 'バックアップをエクスポート';

  @override
  String get exportBackupSubtitle => 'リモコンとマクロを1つのJSONファイルでDownloadsに保存';

  @override
  String get restoreDemoRemotes => 'デモリモコンを復元';

  @override
  String get restoreDemoRemotesSubtitle => '現在のリモコンを内蔵デモに置換';

  @override
  String get deleteAllRemotes => 'すべてのリモコンを削除';

  @override
  String get deleteAllRemotesSubtitle => 'この端末の全リモコンを削除';

  @override
  String get backupTip =>
      'ヒント 大きな編集の前にバックアップをエクスポートしてください。取り込みでは完全バックアップ 旧形式のリモコンのみJSONバックアップ Flipper Zeroの.irファイルに対応します。';

  @override
  String get aboutTitle => '情報';

  @override
  String get aboutSubtitle => 'アプリ情報とオープンソース情報';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'バージョン $version';
  }

  @override
  String get sourceCode => 'ソースコード';

  @override
  String get viewOnGitHub => 'GitHubで見る';

  @override
  String get repositoryUrlCopied => 'リポジトリURLをコピーしました';

  @override
  String get reportIssue => '問題を報告';

  @override
  String get reportIssueSubtitle => '不具合報告と機能要望';

  @override
  String get issuesUrlCopied => 'Issues URLをコピーしました';

  @override
  String get license => 'ライセンス';

  @override
  String get openSourceLicense => 'オープンソースライセンス';

  @override
  String get licenseUrlCopied => 'ライセンスURLをコピーしました';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Webサイトを開く';

  @override
  String get companyUrlCopied => '会社URLをコピーしました';

  @override
  String get licenses => 'ライセンス';

  @override
  String get openSourceLicenses => 'オープンソースライセンス';

  @override
  String byCreator(Object creator) {
    return '$creator 作成';
  }

  @override
  String get deviceControlsTitle => 'デバイスコントロール';

  @override
  String get deviceControlsSubtitle => 'お気に入りボタンをシステムのデバイスコントロールに表示';

  @override
  String get manageFavorites => 'お気に入りを管理';

  @override
  String get manageFavoritesSubtitle => 'デバイスコントロールに出すボタンを選択';

  @override
  String get quickSettingsTitle => 'クイック設定';

  @override
  String get quickSettingsSubtitle => '電源と音量ショートカットのタイルを追加';

  @override
  String get configureTiles => 'タイルを設定';

  @override
  String get configureTilesSubtitle => 'タイルにリモコンボタンを割当';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle => '所有デバイス向けの電源コード巡回';

  @override
  String get openTvKill => 'TVKillを開く';

  @override
  String get openTvKillSubtitle => '電源コードを巡回 所有デバイスのみで使用';

  @override
  String get failedToLoadTransmitterSettings => '送信機設定の読み込みに失敗しました。';

  @override
  String get usbStatusReady => 'USBドングルは接続済みで IR送信の準備ができています。';

  @override
  String get usbStatusPermissionRequired =>
      'USBドングルを検出しました。USB権限を要求し システム確認を許可してください。';

  @override
  String get usbStatusPermissionDenied =>
      '接続したドングルのUSB権限が拒否されました。再要求して確認を許可してください。';

  @override
  String get usbStatusPermissionGranted =>
      'USB権限は付与されています。IR送信にはドングルの初期化がまだ必要です。';

  @override
  String get usbStatusOpenFailed =>
      'USB権限は付与されていますが ドングルを初期化できませんでした。再接続して再試行してください。';

  @override
  String get usbStatusNoDevice => '対応するUSB IRドングルが見つかりません。';

  @override
  String get usbSelectPermissionRequired =>
      'USBドングルを検出しましたが 未認証です。USB権限を要求 を押してください。';

  @override
  String get usbSelectPermissionDenied =>
      'USB権限が拒否されました。USB権限を要求 を押して確認を許可してください。';

  @override
  String get usbSelectPermissionGranted =>
      'USB権限は付与されていますが ドングルはまだ初期化されていません。再接続してみてください。';

  @override
  String get usbSelectOpenFailed =>
      'USB権限は付与されていますが ドングルを初期化できませんでした。再接続して再試行してください。';

  @override
  String get usbSelectNoDevice =>
      '対応するUSB IRドングルが見つかりません。接続してから USB権限を要求 を押してください。';

  @override
  String get usbSelectReady => 'USBドングルは使用可能です。';

  @override
  String get autoSwitchEnabledMessage => '自動切替を有効にしました 接続時はUSB それ以外は内蔵IRを使います。';

  @override
  String get autoSwitchDisabledMessage => '自動切替を無効にしました 送信機の選択は手動になります。';

  @override
  String get failedToUpdateAutoSwitch => '自動切替設定の更新に失敗しました。';

  @override
  String get failedToSwitchTransmitter => '送信機の切替に失敗しました。';

  @override
  String get deviceHasNoInternalIr => 'この端末には内蔵IR送信機がありません。';

  @override
  String get audioModeEnabledMessage =>
      '音声モードを有効にしました。メディア音量を最大にし 音声からIRへのLEDアダプタを使ってください。';

  @override
  String get usbPermissionRequestSent => 'USB権限要求を送信しました。';

  @override
  String get usbPermissionRequestSentApprove =>
      'USB権限要求を送信しました。USBを有効にするには確認を許可してください。';

  @override
  String get usbAlreadyReady => 'USBドングルはすでに初期化済みで 使用可能です。';

  @override
  String get failedToRequestUsbPermission => 'USB権限の要求に失敗しました。';

  @override
  String get transmitterHelpInternal => '端末内蔵のIR送信機でコマンドを送信します。';

  @override
  String get transmitterHelpUsb => 'USB IRドングル 権限必要 でコマンドを送信します。';

  @override
  String get transmitterHelpAudio1 =>
      '音声出力 モノラル を使用します。音声からIRへのLEDアダプタと高いメディア音量が必要です。';

  @override
  String get transmitterHelpAudio2 =>
      '音声出力 ステレオ を使用します。対応アダプタでは2チャンネルでLED駆動を改善します。';

  @override
  String get transmitterInternal => '内蔵 IR';

  @override
  String get transmitterUsb => 'USB IR ドングル';

  @override
  String get transmitterAudio1 => '音声 1 LED';

  @override
  String get transmitterAudio2 => '音声 2 LED';

  @override
  String get failedToLoadTransmitterCapabilities => '送信機機能の読み込みに失敗しました。';

  @override
  String get selectedTransmitter => '選択中の送信機';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • 有効: $active';
  }

  @override
  String get refresh => '更新';

  @override
  String get autoSwitchTitle => '自動切替';

  @override
  String get autoSwitchDisabledWhileAudio => '音声モード中は無効';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal => '接続時はUSB それ以外は内蔵IR';

  @override
  String get unavailableOnThisDevice => 'この端末では利用不可';

  @override
  String get openOnUsbAttachTitle => 'USB接続時に開く';

  @override
  String get openOnUsbAttachSubtitle =>
      '対応するUSB IRドングル接続時に Androidがアプリを開くよう提案することがあります。';

  @override
  String get openOnUsbAttachEnabledMessage =>
      '対応USBドングル接続時にIR Blasterを開く提案を表示します。';

  @override
  String get openOnUsbAttachDisabledMessage => 'USB接続時に開く提案はしません。';

  @override
  String get failedToUpdateSetting => '設定の更新に失敗しました。';

  @override
  String get unnamedButton => '無名のボタン';

  @override
  String get iconFallback => 'アイコン';

  @override
  String get remoteListReorderHint => '並べ替えモード 長押ししてカードをドラッグすると移動できます。';

  @override
  String get deleteRemoteTitle => 'リモコンを削除しますか?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" は完全に削除されます。元に戻せません。';
  }

  @override
  String get delete => '削除';

  @override
  String get addToDeviceControlsTitle => 'デバイスコントロールに追加しますか?';

  @override
  String get addToDeviceControlsDescription => 'システムのデバイスコントロールからすぐ使えます。';

  @override
  String get skip => 'スキップ';

  @override
  String get add => '追加';

  @override
  String get addedToDeviceControls => 'デバイスコントロールに追加しました';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return '\"$name\" を削除しました。元に戻せません。';
  }

  @override
  String remoteLayoutSummary(Object count, Object layout) {
    return '$count個のボタン ・ $layout';
  }

  @override
  String get layoutComfort => '快適';

  @override
  String get layoutCompact => 'コンパクト';

  @override
  String get open => '開く';

  @override
  String get useThisRemote => 'このリモコンを使う';

  @override
  String get edit => '編集';

  @override
  String get editRemoteSubtitle => '名前変更とボタン編集';

  @override
  String get thisCannotBeUndone => '元に戻せません';

  @override
  String get searchRemotes => 'リモコンを検索';

  @override
  String get reorderRemotes => 'リモコンを並べ替え';

  @override
  String get addRemote => 'リモコンを追加';

  @override
  String get more => 'その他';

  @override
  String get reorderMode => '並べ替えモード';

  @override
  String remoteButtonCount(Object count, Object plural) {
    return '$count個のボタン$plural';
  }

  @override
  String get noRemotesYet => 'まだリモコンがありません';

  @override
  String get noRemotesDescription => 'リモコンを作成してIRコード送信を始めましょう';

  @override
  String get noRemotesNextStep => '次の操作 追加を押して最初のボタンを追加してください。';

  @override
  String get actions => '操作';

  @override
  String get macrosTitle => 'マクロ';

  @override
  String get help => 'ヘルプ';

  @override
  String get createMacro => 'マクロを作成';

  @override
  String get timedMacrosTitle => '時間指定マクロ';

  @override
  String get timedMacrosSubtitle => 'IRコマンド列を正確なタイミングで自動実行';

  @override
  String get timedMacrosNextStep =>
      '次の操作 最初のマクロを作成を押し リモコンを選んでからコマンドと待機を追加してください。';

  @override
  String get macroFeatureToysTitle => 'インタラクティブ玩具に最適';

  @override
  String get macroFeatureToysDescription =>
      'i-cybieやi-sobotなど コマンド間に処理時間が必要なおもちゃを操作できます。';

  @override
  String get macroFeatureTimingTitle => '高精度タイミング制御';

  @override
  String get macroFeatureTimingDescription =>
      'コマンド間に待機 250msから任意 を入れ 次の動作前にデバイスが応答する時間を確保します。';

  @override
  String get macroFeatureManualTitle => '手動続行ステップ';

  @override
  String get macroFeatureManualDescription =>
      'アニメ時間が一定でない場合や目視確認が必要な場合に 一時停止して確認を待ちます。';

  @override
  String get exampleUseCase => '使用例';

  @override
  String get macroExampleText =>
      'i-cybie 高度モード\n1. \"Mode\" コマンドを送信\n2. 1000ms待機 おもちゃが処理\n3. \"Action 1\" を送信\n4. 1000ms待機\n5. \"Action 2\" を送信\n…以降も自動で続行';

  @override
  String get createFirstMacro => '最初のマクロを作成';

  @override
  String get noRemote => 'リモコンなし';

  @override
  String macroStepCount(Object count, Object plural) {
    return '$countステップ$plural';
  }

  @override
  String get aboutTimedMacros => '時間指定マクロについて';

  @override
  String get aboutTimedMacrosDescription =>
      '時間指定マクロでは 各ステップの間に正確な待機を入れてIRコマンド列を自動化できます。';

  @override
  String get sendCommand => 'コマンド送信';

  @override
  String get sendCommandDescription => 'リモコンからIRコマンドを送信します';

  @override
  String get delay => '待機';

  @override
  String get delayDescription => '次のステップまで指定時間 例 1000ms 待ちます。';

  @override
  String get manualContinue => '手動続行';

  @override
  String get manualContinueDescription => '続行を押すまで実行を一時停止します 可変長アニメに便利です。';

  @override
  String get gotIt => '了解';

  @override
  String get failedToSaveMacros => 'マクロの保存に失敗しました。';

  @override
  String deletedMacroNamed(Object name) {
    return '\"$name\" を削除しました。';
  }

  @override
  String get undo => '元に戻す';

  @override
  String get failedToRestoreMacro => 'マクロの復元に失敗しました。';

  @override
  String get deleteMacroTitle => 'マクロを削除しますか?';

  @override
  String get deleteMacroMessage => '次のスナックバーから元に戻せます。';

  @override
  String get noRemotesAvailable => '利用可能なリモコンがありません';

  @override
  String remoteButtonCountSummary(Object count) {
    return '$count個のボタン';
  }

  @override
  String get remoteOrientationFlippedTooltip => '向き 反転中 タップで通常';

  @override
  String get remoteOrientationNormalTooltip => '向き 通常 タップで反転';

  @override
  String get stopLoop => 'ループ停止';

  @override
  String get reorderButtons => 'ボタンを並べ替え';

  @override
  String get remoteReorderHint => '並べ替えモード 長押ししてボタンをドラッグすると移動できます。';

  @override
  String get manageRemote => 'リモコンを管理';

  @override
  String get remoteNoButtons => 'このリモコンにボタンがありません';

  @override
  String get remoteNoButtonsDescription => 'ボタンの追加や設定には リモコンを編集 を使ってください。';

  @override
  String get editRemote => 'リモコンを編集';

  @override
  String get editRemoteActionsSubtitle => '名前変更 並べ替え ボタン編集';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return '\"$name\" を更新しました。';
  }

  @override
  String buttonAddedNamed(Object name) {
    return '\"$name\" を追加しました。';
  }

  @override
  String get buttonDuplicated => 'ボタンを複製しました。';

  @override
  String get loopRunningForButton => 'このボタンでループ実行中です';

  @override
  String get loopTip => 'ヒント ループを使うと停止するまで繰り返せます。';

  @override
  String get codeCopied => 'コードをコピーしました';

  @override
  String get copyCode => 'コードをコピー';

  @override
  String get startLoop => 'ループ開始';

  @override
  String get editButtonSubtitle => 'ラベル コード プロトコル 周波数を変更';

  @override
  String get newButton => '新しいボタン';

  @override
  String get newButtonSubtitle => 'この後ろに新しいボタンを作成';

  @override
  String get duplicate => '複製';

  @override
  String get duplicateButtonSubtitle => 'このボタンの複製を作成';

  @override
  String get removeFromDeviceControls => 'デバイスコントロールから削除';

  @override
  String get addToDeviceControls => 'デバイスコントロールに追加';

  @override
  String get deviceControlsButtonSubtitle => 'このボタンをシステムのデバイスコントロールに表示';

  @override
  String get removedFromDeviceControls => 'デバイスコントロールから削除しました';

  @override
  String get pinQuickTile => 'クイックタイルお気に入りに固定';

  @override
  String get unpinQuickTile => 'クイックタイルお気に入りから解除';

  @override
  String get quickTileButtonSubtitle => 'このボタンをクイックタイル選択画面の上部に表示';

  @override
  String get removedFromQuickTileFavorites => 'クイックタイルお気に入りから削除しました';

  @override
  String get pinnedToQuickTileFavorites => 'クイックタイルお気に入りに固定しました';

  @override
  String get duplicateAndEdit => '複製して編集';

  @override
  String get duplicateAndEditSubtitle => '複製を作成してすぐ編集';

  @override
  String get done => '完了';

  @override
  String get run => '実行';

  @override
  String get untitledRemote => '無題のリモコン';

  @override
  String get createRemoteTitle => 'リモコンを作成';

  @override
  String get editRemoteTitle => 'リモコンを編集';

  @override
  String get removeButtonTitle => 'ボタンを削除しますか?';

  @override
  String get imageButtonRemovedMessage => 'この画像ボタンは削除されます。';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" は削除されます。';
  }

  @override
  String get remove => '削除';

  @override
  String importedButtonCount(int count) {
    return '$count個のボタンを取り込みました。';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return '既存のリモコンから$count個のボタンを取り込みました。';
  }

  @override
  String get editButtonSettingsSubtitle => 'ラベル 信号 詳細設定を変更';

  @override
  String get createButtonCopySubtitle => 'このボタンの複製を作成';

  @override
  String get duplicateAndEditButtonSubtitle => '複製を作成してすぐ編集';

  @override
  String get undoAvailableInNextSnackbar => '次のスナックバーから元に戻せます';

  @override
  String get buttonRemoved => 'ボタンを削除しました';

  @override
  String get remoteNameCannotBeEmpty => 'リモコン名は空にできません。';

  @override
  String get saveRemote => 'リモコンを保存';

  @override
  String get remoteName => 'リモコン名';

  @override
  String get remoteNameHint => '例 TV エアコン LEDテープ';

  @override
  String get remoteNameHelper => 'この名前はリモコン一覧に表示されます。';

  @override
  String get layoutStyle => 'レイアウト';

  @override
  String get layoutWideDescription => 'ワイド 2列ボタンで詳細も表示 推奨。';

  @override
  String get layoutCompactDescription => 'コンパクト 定番の4×グリッド アイコンまたは文字のみ。';

  @override
  String get importFromRemotes => 'リモコンから取り込み';

  @override
  String get importFromDatabase => 'DBから取り込み';

  @override
  String get addButton => 'ボタンを追加';

  @override
  String get noButtonsYet => 'まだボタンがありません';

  @override
  String get createRemoteEmptyStateDescription =>
      '最初のボタンを追加し その後長押しで編集や削除の操作を使ってください。';

  @override
  String get createButtonTitle => 'ボタンを作成';

  @override
  String get editButtonTitle => 'ボタンを編集';

  @override
  String failedToLoadProtocols(Object error) {
    return 'プロトコルの読み込みに失敗しました: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'データベースキーの読み込みに失敗しました: $error';
  }

  @override
  String get presetPower => '電源';

  @override
  String get presetVolume => '音量';

  @override
  String get presetChannel => 'チャンネル';

  @override
  String get presetNavigation => 'ナビ';

  @override
  String get all => 'すべて';

  @override
  String get completeRequiredFieldsToSave => '保存するには必須項目を入力してください';

  @override
  String get buttonLabelStepTitle => '1 ボタンラベル';

  @override
  String get buttonLabelStepSubtitle => '画像 アイコン または文字ラベルを選んでください。';

  @override
  String get buttonColorStepTitle => '2 ボタン色 任意';

  @override
  String get buttonColorStepSubtitle => 'このボタンの背景色を選んでください。';

  @override
  String get selectColor => '色を選択';

  @override
  String get noImageSelected => '画像未選択';

  @override
  String get gallery => 'ギャラリー';

  @override
  String get builtIn => '内蔵';

  @override
  String get removeImage => '画像を削除';

  @override
  String get requiredSelectImageOrSwitch => '必須 画像を選ぶか アイコンを選ぶか 文字に切り替えてください。';

  @override
  String get iconSelected => 'アイコンを選択済み';

  @override
  String get noIconSelected => 'アイコン未選択';

  @override
  String get chooseIcon => 'アイコンを選択';

  @override
  String get removeIcon => 'アイコンを削除';

  @override
  String get requiredSelectIconOrSwitch => '必須 アイコンを選ぶか 画像 文字に切り替えてください。';

  @override
  String get buttonText => 'ボタン文字';

  @override
  String get buttonTextHint => '例 電源 音量+ HDMI 1';

  @override
  String get buttonTextHelper => 'この文字がボタンに表示されます';

  @override
  String get requiredEnterButtonLabel => '必須 ボタンラベルを入力してください。';

  @override
  String get defaultColorName => '既定';

  @override
  String get newRemoteCreatedFromLastHit => '最後のヒットから1つのボタンで新しいリモコンを作成しました。';

  @override
  String get selectRemote => 'リモコンを選択';

  @override
  String remoteNumber(Object id) {
    return 'リモコン #$id';
  }

  @override
  String get newRemoteCreated => '新しいリモコンを作成しました。';

  @override
  String get failedToCreateRemote => 'リモコンの作成に失敗しました。';

  @override
  String get newRemoteEllipsis => '新しいリモコン…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Added to $name.';
  }

  @override
  String get failedToAddToRemote => 'add to リモコンに失敗しました。';

  @override
  String get newRemoteDefaultName => '新しいリモコン';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'オフセット $offset に移動しました。停止中です 続けるには再開を押してください。';
  }

  @override
  String get sent => '送信しました';

  @override
  String failedToSend(Object error) {
    return '送信に失敗しました: $error';
  }

  @override
  String get copiedProtocolCode => 'コピーしました プロトコル:コード';

  @override
  String get savedToResults => '結果に保存しました';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'このプロトコルでは無効なコードです: $error';
  }

  @override
  String get copiedCurrentCandidate => '現在の候補をコピーしました';

  @override
  String get jumpToOffset => 'オフセットへ移動';

  @override
  String get jumpToBruteCursor => '総当たりカーソルへ移動';

  @override
  String get jump => '移動';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'カーソル 0x$cursor に移動しました。停止中です 続けるには再開を押してください。';
  }

  @override
  String get irSignalTester => 'IR信号テスター';

  @override
  String get stop => '停止';

  @override
  String get selectButton => 'ボタンを選択';

  @override
  String get buttonNotFoundInRemotes => 'リモコン内にボタンが見つかりません。';

  @override
  String sentNamed(Object name) {
    return '\"$name\" を送信しました。';
  }

  @override
  String sendFailed(Object error) {
    return '送信に失敗しました: $error';
  }

  @override
  String get noFavoritesYet => 'まだお気に入りがありません';

  @override
  String get deviceControlsEmptyHint =>
      'リモコンボタンを長押しして デバイスコントロールに追加 を選択してください。';

  @override
  String get sendTest => 'テスト送信';

  @override
  String get testSendCompleted => 'テスト送信が完了しました';

  @override
  String testSendFailed(Object error) {
    return 'テスト送信に失敗しました: $error';
  }

  @override
  String removedNamed(Object name) {
    return '\"$name\" を削除しました。';
  }

  @override
  String get brand => 'ブランド';

  @override
  String get model => 'モデル';

  @override
  String get selectBrand => 'ブランドを選択';

  @override
  String get searchBrand => 'ブランドを検索…';

  @override
  String get selectModel => 'モデルを選択';

  @override
  String get searchModel => 'モデルを検索…';

  @override
  String get unnamedKey => 'Unnamed key';

  @override
  String get unknown => '不明';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'コマンドを検索';

  @override
  String get noMatchingCommands => '一致するコマンドがありません';

  @override
  String get quickTileFavoritesTitle => 'クイックタイルお気に入り';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Change mapping for $tileLabel tile';
  }

  @override
  String get pickDifferentButton => '別のボタンを選択';

  @override
  String get browseAllRemotesEllipsis => 'すべてのリモコンを見る…';

  @override
  String get invalidMacroFileFormat => '無効なマクロファイル形式です。';

  @override
  String get failedToParseMacroFile => 'マクロファイルの解析に失敗しました。';

  @override
  String get deviceCodeLabel => 'デバイスコード';

  @override
  String get commandLabel => 'コマンド';

  @override
  String get editButtonCodeTitle => 'ボタンのコードを編集';

  @override
  String get thisRemoteHasNoButtons => 'このリモコンにボタンがありません。';

  @override
  String get selectCommand => 'コマンドを選択';

  @override
  String get databaseModeAutofillHint =>
      'データベースモードではステップ2 ブランド モデル プロトコル を自動入力します。キー取り込み後は手動で調整できます。';

  @override
  String get test => 'テスト';

  @override
  String get allSelectedButtonsWereDuplicates => '選択したボタンはすべて重複でした。';

  @override
  String get noButtonsImported => 'ボタンは取り込まれませんでした。';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return '$addedCount個のボタンを取り込みました。重複$skippedCount件をスキップしました。';
  }

  @override
  String get importAllMatchingTitle => '一致する全ボタンを取り込みますか?';

  @override
  String get noMatchingKeysFound => '一致するキーが見つかりません。';

  @override
  String importAllMatchingMessage(int count) {
    return 'This will import up to $count matching keys from the current database selection.';
  }

  @override
  String get importAll => 'すべて取り込み';

  @override
  String get importingButtons => 'ボタンを取り込み中…';

  @override
  String get allMatchingButtonsWereDuplicates => '一致したボタンはすべて重複でした。';

  @override
  String get quickPresets => 'クイックプリセット';

  @override
  String get selectDeviceFirst => '先にデバイスを選択';

  @override
  String get searchByLabelOrHex => 'ラベルまたは16進で検索';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return '任意 $preset プリセットキーを絞り込む';
  }

  @override
  String get selectBrandModelProtocolFirst => '先にブランド モデル プロトコルを選択してください。';

  @override
  String get importFromDatabaseTitle => 'データベースから取り込み';

  @override
  String get importFromDatabaseSubtitle =>
      'デバイスを選び 一致するキーを読み込み 選択したボタンを取り込みます。';

  @override
  String get deviceAndFilters => 'デバイスとフィルタ';

  @override
  String loadedCount(int count) {
    return '$count loaded';
  }

  @override
  String get hideFilters => 'フィルタを隠す';

  @override
  String get showFilters => 'フィルタを表示';

  @override
  String get noProtocolFoundForBrandModel => 'このブランドとモデルに対応するプロトコルが見つかりません。';

  @override
  String get protocolAutoDetected => 'プロトコル';

  @override
  String get protocolAutoDetectedHelper => 'データベースから自動検出されました。取り込み前に変更できます。';

  @override
  String get selectBrandModelToLoadKeys => 'キー読み込みのため ブランド モデル プロトコルを選択してください。';

  @override
  String get noKeysFound => 'キーが見つかりません。';

  @override
  String noKeysFoundForSearch(Object query) {
    return '\"$query\" に一致するキーが見つかりません。';
  }

  @override
  String get skipDuplicates => '重複をスキップ';

  @override
  String get skipDuplicatesSubtitle => 'このリモコンにあるボタンは取り込みません';

  @override
  String get importSelected => '選択を取り込み';

  @override
  String get noMacrosToExport => 'エクスポートするマクロがありません';

  @override
  String get macrosExportedToDownloads => 'マクロをDownloadsに書き出しました。';

  @override
  String get failedToExportMacros => 'マクロのエクスポートに失敗しました。';

  @override
  String get failedToReadFile => 'ファイルの読み込みに失敗しました。';

  @override
  String get importFromExistingRemotesTitle => '既存のリモコンから取り込み';

  @override
  String selectedCount(int count) {
    return '$count selected';
  }

  @override
  String get noOtherRemotesWithButtons => 'ボタン付きの他のリモコンが見つかりません。';

  @override
  String get sourceRemote => '元のリモコン';

  @override
  String get searchButtons => 'ボタンを検索';

  @override
  String get searchButtonsHint => '電源 音量 ミュート...';

  @override
  String get selectVisible => '表示中を選択';

  @override
  String get clearVisible => '表示中を解除';

  @override
  String protocolNamed(Object name) {
    return 'プロトコル: $name';
  }

  @override
  String get rawSignal => '生';

  @override
  String get legacyCode => '旧形式コード';

  @override
  String importCount(int count) {
    return '$count件を取り込み';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'ストレージ権限が拒否されました 一部の古いAndroid端末では必要です。';

  @override
  String get backupExportedToDownloads => 'バックアップをDownloadsに書き出しました。';

  @override
  String failedToExport(Object error) {
    return 'エクスポートに失敗しました: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Imported $count remotes from legacy JSON backup. Macros were not changed.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      '取り込み失敗 backupの\"remotes\" は存在する場合 JSON配列である必要があります。';

  @override
  String get importFailedMacrosMustBeList =>
      '取り込み失敗 backupの\"macros\" は存在する場合 JSON配列である必要があります。';

  @override
  String get importFailedInvalidBackupFormat =>
      '取り込み失敗 無効なバックアップ形式です 旧形式の配列 または remotes macros を持つマップを想定しています。';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Imported $remoteCount remotes from backup. Macros were not changed.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Imported $remoteCount remotes and $macroCount macros from backup.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      '取り込み失敗 .ir ファイルに有効なボタンが見つかりません。';

  @override
  String get importedOneRemoteFromFlipper =>
      'Flipper .ir から1つのリモコンを取り込みました。マクロは変更されませんでした。';

  @override
  String get importFailedInvalidIrplus =>
      '取り込み失敗 無効な irplus ファイルです 有効なボタンが見つかりません。';

  @override
  String get importedOneRemoteFromIrplus =>
      'irplus から1つのリモコンを取り込みました。マクロは変更されませんでした。';

  @override
  String get importFailedInvalidLirc =>
      '取り込み失敗 無効なLIRCファイルです 有効なコードまたは生コードが見つかりません。';

  @override
  String get importedOneRemoteFromLirc =>
      'LIRC設定から1つのリモコンを取り込みました。マクロは変更されませんでした。';

  @override
  String get unsupportedFileTypeSelected => '未対応のファイル形式です';

  @override
  String get importFailedInvalidUnreadableFile => '取り込み失敗 無効または読めないファイルです。';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      '一括取り込み完了 対応ファイルがフォルダ内にありません。';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return '一括取り込み完了 リモコンは取り込まれませんでした。$skippedCount件のファイルをスキップしました。';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return '一括取り込み完了 $supportedCount件の対応ファイルから$importedCount個のリモコンを取り込みました。$skippedCount件をスキップしました。';
  }

  @override
  String get storagePermissionDenied => 'ストレージ権限が拒否されました。';

  @override
  String get bulkImportFailedReadFolder => '一括取り込み失敗 フォルダ内容を読めませんでした。';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return '一括取り込み完了 対応ファイルが見つかりませんでした $sourceLabel。';
  }

  @override
  String get clearAction => 'クリア';

  @override
  String get saveAction => '保存';

  @override
  String buttonsTitleCount(int count) {
    return 'ボタン $count';
  }

  @override
  String get invalidStepEncountered => '無効なステップがあります';

  @override
  String failedToSendNamed(Object name) {
    return '送信に失敗しました: $name';
  }

  @override
  String get buttonNotFound => 'ボタンが見つかりません';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'ボタンが見つかりません: $name';
  }

  @override
  String get unknownButton => '不明なボタン';

  @override
  String durationSecondsShort(int seconds) {
    return '$seconds秒';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '$minutes分 $seconds秒';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '$hours時間 $minutes分';
  }

  @override
  String get orientationFlippedTooltip => '向き 反転中 タップで通常';

  @override
  String get orientationNormalTooltip => '向き 通常 タップで反転';

  @override
  String get noSteps => 'No ステップ';

  @override
  String stepProgress(int current, int total) {
    return 'ステップ $current / $total';
  }

  @override
  String get completed => '完了';

  @override
  String get paused => '一時停止';

  @override
  String get running => '実行中';

  @override
  String get ready => '準備完了';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total ステップ';
  }

  @override
  String get waiting => '待機中';

  @override
  String secondsRemaining(Object seconds) {
    return '残り $seconds秒';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady => '次のステップの準備ができたら 続行 を押してください';

  @override
  String get error => 'エラー';

  @override
  String get macroCompleted => 'マクロ完了';

  @override
  String finishedIn(Object duration) {
    return '$durationで完了';
  }

  @override
  String get sequence => 'シーケンス';

  @override
  String waitMilliseconds(int ms) {
    return '${ms}ms待機';
  }

  @override
  String get runAgain => '再実行';

  @override
  String get startMacro => 'マクロ開始';

  @override
  String get continueAction => '続行';

  @override
  String get unnamedRemote => '無名のリモコン';

  @override
  String get enterMacroName => 'マクロ名を入力';

  @override
  String get addAtLeastOneStep => '少なくとも1ステップ追加してください';

  @override
  String get fixInvalidSteps => '無効なステップを修正してください';

  @override
  String get unknownCommand => '不明なコマンド';

  @override
  String get unnamedCommand => '無名のコマンド';

  @override
  String get iconCommand => 'アイコンコマンド';

  @override
  String get selectDelay => '待機時間を選択';

  @override
  String keepMilliseconds(int ms) {
    return '保持 ${ms}ms';
  }

  @override
  String get custom => 'カスタム';

  @override
  String get enterCustomDelayDuration => 'カスタム待機時間を入力';

  @override
  String millisecondsLong(int ms) {
    return '$msミリ秒';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds秒$plural';
  }

  @override
  String get customDelay => 'カスタム待機';

  @override
  String get delayMillisecondsLabel => '待機 ミリ秒';

  @override
  String get delayMillisecondsHint => 'e.g., 3000';

  @override
  String get recommendedDelayRange => '多くの機器では250から5000msを推奨';

  @override
  String get enterValidPositiveNumber => '有効な正の数を入力してください';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'リモコン';

  @override
  String get macroName => 'マクロ名';

  @override
  String get macroNameHint => '例 i-cybie 高度モード';

  @override
  String stepsTitleCount(int count) {
    return 'ステップ $count';
  }

  @override
  String get noStepsYet => 'まだステップがありません';

  @override
  String get addCommandsAndDelaysHint => '下にコマンドと待機を追加してシーケンスを組み立ててください';

  @override
  String get addStep => 'ステップを追加';

  @override
  String get reorderStepsHint =>
      'ヒント ハンドルをドラッグしてステップを並べ替えられます。ステップをタップすると編集できます。';

  @override
  String reorderStep(int index) {
    return 'ステップ$indexを並べ替え';
  }

  @override
  String get pressAndDragToChangeStepOrder => '長押ししてドラッグするとステップ順を変更できます';

  @override
  String deleteStep(int index) {
    return 'ステップ$indexを削除';
  }

  @override
  String get invalidStepTapToFix => '無効なステップです タップして修正してください';

  @override
  String get sendIrCommand => 'IRコマンドを送信';

  @override
  String get waitForUserConfirmation => 'Wait for user confirmation';

  @override
  String get notImplemented => '未実装';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'ワイド';

  @override
  String get iconButton => 'アイコンボタン';

  @override
  String get imageButton => '画像ボタン';

  @override
  String get noSignalInfo => '信号情報なし';

  @override
  String get proceed => '続行';

  @override
  String get discard => '破棄';

  @override
  String get idle => '待機';

  @override
  String get start => '開始';

  @override
  String get resume => '再開';

  @override
  String get pause => '一時停止';

  @override
  String get stopped => '停止済み';

  @override
  String get copy => 'コピー';

  @override
  String get send => '送信';

  @override
  String get step => 'ステップ';

  @override
  String get addToRemote => 'to リモコンを追加';

  @override
  String get noDescriptionAvailable => '説明はありません';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid => 'Kaseikyoベンダーは16進4桁で入力してください。';

  @override
  String get irFinderDatabaseNotReady => 'データベースの準備がまだできていません';

  @override
  String get irFinderSelectBrandFirst => '設定で先にブランドを選択してください';

  @override
  String get irFinderBruteforceUnavailable => 'このプロトコルでは総当たりはまだ使えません';

  @override
  String get irFinderInvalidPrefix => '無効な接頭辞です';

  @override
  String irFinderBrandValue(Object value) {
    return 'ブランド: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'モデル: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'キー: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'リモコン #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      '絞り込み済みで順序付け済みのDB結果内で 0始まりの番号を入力してください。';

  @override
  String get irFinderJumpCursorHelper =>
      'Enter a 0-based hex cursor within the brute-force space.';

  @override
  String get irFinderSetupTab => '設定';

  @override
  String get irFinderTestTab => 'テスト';

  @override
  String get irFinderResultsTab => '結果';

  @override
  String get irFinderContinueToTest => 'テストへ進む';

  @override
  String get irFinderKaseikyoVendorTitle => 'Kaseikyoベンダー';

  @override
  String get irFinderCustomVendorLabel => 'カスタムベンダー 16進4桁';

  @override
  String get irFinderBrowseDbCandidates => 'DB候補を参照…';

  @override
  String get irFinderEditSetup => '設定を編集';

  @override
  String get irFinderNoSavedHits =>
      '保存されたヒットはまだありません。テスト画面で デバイスが反応したら ヒットを保存 を押してください。';

  @override
  String get irFinderBackToTest => 'テストに戻る';

  @override
  String get irFinderLargeSearchSpaceTitle => '探索空間が大きすぎます';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'この総当たり空間は非常に大きいです $human 通り。IR Finderは最大試行回数とクールダウンを守りますが IR機器への連打に注意してください。\n\n推奨 まずデータベースモードを使うか 既知の接頭バイトを入れて空間を減らしてください。';
  }

  @override
  String get irFinderDatabaseSession => 'DBセッション';

  @override
  String get irFinderBruteforceSession => '総当たりセッション';

  @override
  String get irFinderResumeLastSession => '前回のセッションを再開';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'ブランド: $brand ・ モデル: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return '接頭辞: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return '進捗: $progress ・ 開始: $when';
  }

  @override
  String get irFinderApplyResume => '適用して再開';

  @override
  String get irFinderBruteforceMode => '総当たり';

  @override
  String get irFinderDatabaseAssistedMode => 'DB支援';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'プロトコル: $name';
  }

  @override
  String get irFinderProtocolLabel => 'IRプロトコル';

  @override
  String get irFinderProtocolHelper => 'エンコード方式を決め その結果 探索空間も決まります。';

  @override
  String get irFinderKnownPrefixLabel => '既知の接頭辞 16進バイト 任意';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'ペイロード長 $digits 桁';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'ペイロード長 $digits 桁 ・ 例: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'ペイロード長 $digits 桁 ・ 最大接頭辞: $bytesバイト';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'ペイロード長 $digits 桁 ・ 例: $example ・ 最大接頭辞: $bytesバイト';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return '例: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      '探索空間を減らすため 分かっている先頭バイトを入力してください。';

  @override
  String get irFinderDatabaseMode => 'データベース';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return '正規化済み接頭辞: $value';
  }

  @override
  String get irFinderNormalizedPrefix => '正規化済み接頭辞';

  @override
  String get irFinderBruteforceNotConfigured => 'このプロトコルの総当たりはまだ設定されていません。';

  @override
  String irFinderAllLimit(Object value) {
    return 'すべて $value';
  }

  @override
  String get irFinderTestControls => 'テスト制御';

  @override
  String irFinderPayloadLength(int digits) {
    return 'ペイロード長 $digits 桁。';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return '探索空間 $value 通り 接頭辞制約後。';
  }

  @override
  String get irFinderCooldownMs => 'クールダウン ms';

  @override
  String get irFinderMaxAttemptsPerRun => '最大試行回数 1実行あたり';

  @override
  String get irFinderTestAllCombinations => '全組み合わせを試す';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return '探索空間を使い切るまで実行します。今回の有効上限 $value';
  }

  @override
  String get irFinderAttempts => '試行回数';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'スライダ範囲 1から$max より大きい値は直接入力';
  }

  @override
  String irFinderMaxButton(int value) {
    return '最大\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return '今回の有効上限 $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'ヒント まずデータベースモードを使ってください。総当たりは既知の接頭辞 例 先頭1から4バイト がある場合に最適です。';

  @override
  String get irFinderDatabaseInitFailed => 'データベース初期化に失敗しました';

  @override
  String get irFinderPreparingDatabase => 'ローカルIRコードDBを準備中…';

  @override
  String get irFinderDatabaseAssistedSearch => 'DB支援検索';

  @override
  String get irFinderBrand => 'ブランド';

  @override
  String get irFinderSelectBrand => 'ブランドを選択';

  @override
  String get irFinderModelOptional => 'モデル 任意';

  @override
  String get irFinderSelectBrandFirstShort => '先にブランドを選択';

  @override
  String get irFinderSelectModelRecommended => 'モデルを選択 推奨';

  @override
  String get irFinderOnlySelectedProtocol => '選択したプロトコルのみ';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'キーを選択中のプロトコルに絞り込みます。無効にすると全プロトコルを見られます。';

  @override
  String get irFinderQuickWinsFirst => 'Quick wins first';

  @override
  String get irFinderQuickWinsFirstHint =>
      '深いキーより前に POWER MUTE VOL CH 系のキーを優先します。';

  @override
  String get irFinderMaxKeysPerRun => 'テストする最大キー数 1実行あたり';

  @override
  String get irFinderTesting => 'テスト中…';

  @override
  String get irFinderCooldown => 'クールダウン';

  @override
  String get irFinderEta => '残り時間';

  @override
  String get irFinderMode => 'モード';

  @override
  String get irFinderRetryLast => '最後を再試行';

  @override
  String get irFinderTrigger => '実行';

  @override
  String get irFinderJump => '移動…';

  @override
  String get irFinderSaveHit => 'ヒットを保存';

  @override
  String irFinderEtaSeconds(int seconds) {
    return '$seconds秒';
  }

  @override
  String irFinderEtaMinutesSeconds(int minutes, int seconds) {
    return '$minutes分 $seconds秒';
  }

  @override
  String irFinderEtaHoursMinutes(int hours, int minutes) {
    return '$hours時間 $minutes分';
  }

  @override
  String irFinderLastAttemptedCode(Object value) {
    return '最後に試したコード: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode => '最後に試したコードを見るにはテストを開始してください。';

  @override
  String irFinderFromDb(Object value) {
    return 'DB由来: $value';
  }

  @override
  String get irFinderFromBruteforce => '総当たり由来 プロトコルエンコーダ生成。';

  @override
  String irFinderSendError(Object error) {
    return '送信エラー: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'ソース: $value';
  }

  @override
  String get irFinderResultsNote =>
      '結果からすぐにテストとコピーができます。リモコンへの直接追加は今後さらに拡張できます。';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'DB候補を参照';

  @override
  String get irFinderFilterByLabelOrHex => 'ラベルまたは16進で絞り込み…';

  @override
  String get irFinderJumpHere => 'Jump here';

  @override
  String get irFinderSelectModel => 'モデルを選択';

  @override
  String get irFinderSearchBrands => 'ブランドを検索…';

  @override
  String get irFinderSearchModels => 'モデルを検索…';

  @override
  String get iconPickerTitle => 'アイコンを選択';

  @override
  String get iconPickerSearchHint => 'アイコンを検索...';

  @override
  String get iconPickerNoIconsFound => 'アイコンが見つかりません';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count個のアイコンが利用可能';
  }

  @override
  String get iconPickerCategoryAll => 'すべて';

  @override
  String get iconPickerCategoryMedia => 'メディア';

  @override
  String get iconPickerCategoryVolume => '音量';

  @override
  String get iconPickerCategoryNavigation => 'ナビ';

  @override
  String get iconPickerCategoryPower => '電源';

  @override
  String get iconPickerCategoryNumbers => '数字';

  @override
  String get iconPickerCategorySettings => '設定';

  @override
  String get iconPickerCategoryDisplay => '表示';

  @override
  String get iconPickerCategoryInput => '入力';

  @override
  String get iconPickerCategoryFavorite => 'お気に入り';

  @override
  String get universalPowerTitle => 'ユニバーサル電源';

  @override
  String get universalPowerRunTab => '実行';

  @override
  String get universalPowerUseResponsibly => '責任を持って使用';

  @override
  String get universalPowerConsentBody =>
      'ユニバーサル電源はIR電源コードを順に送信します。所有または管理するデバイスのみに使ってください。反応したらすぐ停止してください。';

  @override
  String get universalPowerConsentCheckbox => 'このデバイスを所有または管理しています';

  @override
  String get universalPowerSetupBody =>
      '選択したブランドの電源コードを順に送信します。デバイスが反応したらすぐ停止してください。';

  @override
  String universalPowerLastSent(Object value) {
    return '最後に送信: $value';
  }

  @override
  String get universalPowerNoCodesFound => '電源コードが見つかりません。検索範囲を広げてください。';

  @override
  String get universalPowerUnableToStart => '開始できません';

  @override
  String get universalPowerAllBrands => '全ブランド フィルタなし';

  @override
  String get universalPowerClearBrandFilter => 'ブランドフィルタを解除';

  @override
  String get universalPowerBroadenSearch => '必要なら検索を広げる';

  @override
  String get universalPowerBroadenSearchHint => '電源ラベルが見つからない場合は 他のキーも含めてください。';

  @override
  String get universalPowerAdditionalPatternsDepth => '追加パターン深度';

  @override
  String get universalPowerDepth1 => '優先のみ POWER OFF';

  @override
  String get universalPowerDepth2 => 'POWERの別名を含める';

  @override
  String get universalPowerDepth3 => '副次的な電源ラベルを含める';

  @override
  String get universalPowerDepth4 => 'すべてのラベルを含める 最低優先';

  @override
  String get universalPowerLoopUntilStopped => '停止までループ';

  @override
  String get universalPowerLoopUntilStoppedHint => '停止するまでキューを巡回し続けます。';

  @override
  String get universalPowerDelayBetweenCodes => 'コード間の待機';

  @override
  String get universalPowerStart => 'ユニバーサル電源を開始';

  @override
  String get universalPowerRunStatus => '実行状態';

  @override
  String universalPowerProgress(Object value) {
    return '進捗: $value';
  }

  @override
  String get universalPowerPausedInBackground => 'アプリがバックグラウンドに入ったため一時停止しました。';

  @override
  String get universalPowerSendOneCode => 'コードを1つ送信';

  @override
  String get universalPowerStopWhenDeviceResponds => 'デバイスが反応したらすぐ停止';

  @override
  String get iconNamePlay => '再生';

  @override
  String get iconNamePause => '一時停止';

  @override
  String get iconNameStop => '停止';

  @override
  String get iconNameFastForward => '早送り';

  @override
  String get iconNameRewind => '巻戻し';

  @override
  String get iconNameSkipNext => 'スキップ 次';

  @override
  String get iconNameSkipPrevious => 'スキップ 前';

  @override
  String get iconNameReplay => 'リプレイ';

  @override
  String get iconNameForward10S => '早送り 10s';

  @override
  String get iconNameForward30S => '早送り 30s';

  @override
  String get iconNameReplay10S => 'リプレイ 10s';

  @override
  String get iconNameReplay30S => 'リプレイ 30s';

  @override
  String get iconNameRecord => '録画';

  @override
  String get iconNameRecordAlt => '録画 Alt';

  @override
  String get iconNameEject => '取り出し';

  @override
  String get iconNameShuffle => 'シャッフル';

  @override
  String get iconNameRepeat => 'リピート';

  @override
  String get iconNameRepeatOne => 'リピート 1';

  @override
  String get iconNameVolumeUp => '音量 上';

  @override
  String get iconNameVolumeDown => '音量 下';

  @override
  String get iconNameVolumeOff => '音量 Off';

  @override
  String get iconNameMute => 'ミュート';

  @override
  String get iconNameSpeaker => 'スピーカー';

  @override
  String get iconNameSurroundSound => 'Surround Sound';

  @override
  String get iconNameEqualizer => 'Equalizer';

  @override
  String get iconNameAudio => '音声';

  @override
  String get iconNameMicrophone => 'マイク';

  @override
  String get iconNameMicOff => 'Mic Off';

  @override
  String get iconNameUp => '上';

  @override
  String get iconNameDown => '下';

  @override
  String get iconNameLeft => '左';

  @override
  String get iconNameRight => '右';

  @override
  String get iconNameArrowUp => '矢印 上';

  @override
  String get iconNameArrowDown => '矢印 下';

  @override
  String get iconNameArrowLeft => '矢印 左';

  @override
  String get iconNameArrowRight => '矢印 右';

  @override
  String get iconNameNavigation => 'ナビ';

  @override
  String get iconNameChevronLeft => 'シェブロン 左';

  @override
  String get iconNameChevronRight => 'シェブロン 右';

  @override
  String get iconNameExpandLess => 'Expand Less';

  @override
  String get iconNameExpandMore => 'さらに表示';

  @override
  String get iconNameCollapse => 'Collapse';

  @override
  String get iconNameExpand => 'Expand';

  @override
  String get iconNameCircleUp => '丸 上';

  @override
  String get iconNameCircleDown => '丸 下';

  @override
  String get iconNameCircleLeft => '丸 左';

  @override
  String get iconNameCircleRight => '丸 右';

  @override
  String get iconNameOkSelect => 'OK/Select';

  @override
  String get iconNameConfirm => 'Confirm';

  @override
  String get iconNameCancel => 'キャンセル';

  @override
  String get iconNameClose => '閉じる';

  @override
  String get iconNameHome => 'ホーム';

  @override
  String get iconNameReturn => 'Return';

  @override
  String get iconNameExit => '終了';

  @override
  String get iconNameUndo => '元に戻す';

  @override
  String get iconNameRedo => 'Redo';

  @override
  String get iconNamePower => '電源';

  @override
  String get iconNamePowerAlt => '電源 Alt';

  @override
  String get iconNamePowerOff => '電源 Off';

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
  String get iconNameOne => '1';

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
  String get iconNamePlus => 'プラス';

  @override
  String get iconNameMinus => 'マイナス';

  @override
  String get iconNameAddCircle => '丸を追加';

  @override
  String get iconNameRemoveCircle => '削除 丸';

  @override
  String get iconNameSettings => '設定';

  @override
  String get iconNameMenu => 'メニュー';

  @override
  String get iconNameMoreVertical => 'その他 縦';

  @override
  String get iconNameMoreHorizontal => 'その他 横';

  @override
  String get iconNameTune => 'Tune';

  @override
  String get iconNameRemoteSettings => 'リモコン 設定';

  @override
  String get iconNameInfo => '情報';

  @override
  String get iconNameInfoOutline => '情報 枠線';

  @override
  String get iconNameHelp => 'ヘルプ';

  @override
  String get iconNameHelpOutline => 'ヘルプ 枠線';

  @override
  String get iconNameList => '一覧';

  @override
  String get iconNameViewList => '一覧表示';

  @override
  String get iconNameViewGrid => 'グリッド表示';

  @override
  String get iconNameApps => 'Apps';

  @override
  String get iconNameWidgets => 'Widgets';

  @override
  String get iconNameTv => 'TV';

  @override
  String get iconNameMonitor => 'モニター';

  @override
  String get iconNameDesktop => 'デスクトップ';

  @override
  String get iconNameBrightnessHigh => '高輝度';

  @override
  String get iconNameBrightnessMedium => '中輝度';

  @override
  String get iconNameBrightnessLow => '明るさ Low';

  @override
  String get iconNameAutoBrightness => '自動 明るさ';

  @override
  String get iconNameLightMode => 'ライト モード';

  @override
  String get iconNameDarkMode => 'ダーク モード';

  @override
  String get iconNameContrast => 'Contrast';

  @override
  String get iconNameHdrOn => 'HDR On';

  @override
  String get iconNameHdrOff => 'HDR Off';

  @override
  String get iconNameAspectRatio => 'Aspect Ratio';

  @override
  String get iconNameCrop => '切り抜き';

  @override
  String get iconNameZoomIn => 'Zoom In';

  @override
  String get iconNameZoomOut => 'Zoom Out';

  @override
  String get iconNameFullscreen => '全画面';

  @override
  String get iconNameExitFullscreen => '終了 全画面';

  @override
  String get iconNameFitScreen => 'Fit Screen';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => '自由切り抜き';

  @override
  String get iconNameInput => '入力';

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
  String get iconNameMedia => 'メディア';

  @override
  String get iconNameMusicQueue => '音楽キュー';

  @override
  String get iconNameVideoLibrary => '動画ライブラリ';

  @override
  String get iconNamePhotoLibrary => '写真ライブラリ';

  @override
  String get iconNameComponent => 'Component';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => 'Composite';

  @override
  String get iconNameAntenna => 'Antenna';

  @override
  String get iconNameFavorite => 'お気に入り';

  @override
  String get iconNameFavoriteOutline => 'お気に入り 枠線';

  @override
  String get iconNameStar => 'Star';

  @override
  String get iconNameStarOutline => '星 枠線';

  @override
  String get iconNameBookmark => 'Bookmark';

  @override
  String get iconNameBookmarkOutline => 'ブックマーク 枠線';

  @override
  String get iconNameFlag => 'Flag';

  @override
  String get iconNameCheck => '確認';

  @override
  String get iconNameDone => '完了';

  @override
  String get iconNameDoneAll => '完了 All';

  @override
  String get iconNameSchedule => 'Schedule';

  @override
  String get iconNameTimer => 'タイマー';

  @override
  String get iconNameTime => '時間';

  @override
  String get iconNameAlarm => 'アラーム';

  @override
  String get iconNameNotifications => '通知';

  @override
  String get iconNameLock => 'ロック';

  @override
  String get iconNameUnlock => 'ロック解除';

  @override
  String get iconNameLight => '弱';

  @override
  String get iconNameLightOutline => 'ライト 枠線';

  @override
  String get iconNameWarmLight => '暖色 ライト';

  @override
  String get iconNameSunny => '晴れ';

  @override
  String get iconNameCloudy => '曇り';

  @override
  String get iconNameNight => '夜';

  @override
  String get iconNameFlare => 'フレア';

  @override
  String get iconNameGradient => 'グラデーション';

  @override
  String get iconNameInvertColors => '反転 色';

  @override
  String get iconNamePalette => 'パレット';

  @override
  String get iconNameColor => '色';

  @override
  String get iconNameTonality => '色調';

  @override
  String get iconNameSearch => '検索';

  @override
  String get iconNameRefresh => '更新';

  @override
  String get iconNameSync => 'Sync';

  @override
  String get iconNameUpdate => 'Update';

  @override
  String get iconNameDownload => 'Download';

  @override
  String get iconNameUpload => 'Upload';

  @override
  String get iconNameCloud => '雲';

  @override
  String get iconNameFolder => 'フォルダ';

  @override
  String get iconNameDelete => '削除';

  @override
  String get iconNameEdit => '編集';

  @override
  String get iconNameSave => '保存';

  @override
  String get iconNameShare => 'Share';

  @override
  String get iconNamePrint => 'Print';

  @override
  String get iconNameLanguage => '言語';

  @override
  String get iconNameTranslate => 'Translate';

  @override
  String get iconNameMicNone => 'Mic None';

  @override
  String get iconNameSubtitles => 'Subtitles';

  @override
  String get iconNameClosedCaption => 'Closed Caption';

  @override
  String get iconNameMusic => '音楽';

  @override
  String get iconNameMovie => 'Movie';

  @override
  String get iconNameTheater => 'Theater';

  @override
  String get iconNameLiveTv => 'Live TV';

  @override
  String get iconNameRadio => 'Radio';

  @override
  String get iconNameCamera => 'カメラ';

  @override
  String get iconNameVideoCamera => '動画 カメラ';

  @override
  String get iconNamePhotoCamera => '写真 カメラ';

  @override
  String get iconNameSlowMotion => 'Slow Motion';

  @override
  String get iconNameSpeed => 'Speed';

  @override
  String get iconNameVideoSettings => '動画 設定';

  @override
  String get iconNameAudioTrack => '音声トラック';

  @override
  String get iconNameGraphicEq => 'Graphic EQ';

  @override
  String get iconNameMusicVideo => '音楽 動画';

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
  String get iconNameHashFa => 'シャープ FA';

  @override
  String get iconNamePercentFa => 'パーセント FA';

  @override
  String get iconNameDivideFa => '除算 FA';

  @override
  String get iconNameMultiplyFa => '乗算 FA';

  @override
  String get iconNameEqualsFa => 'イコール FA';

  @override
  String get iconNameNotEqualFa => '不一致 FA';

  @override
  String get iconNameGreaterThanFa => '大なり FA';

  @override
  String get iconNameLessThanFa => '小なり FA';

  @override
  String get iconNameAsteriskFa => 'アスタリスク FA';

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
  String get iconNamePlayFa => '再生 FA';

  @override
  String get iconNamePauseFa => '一時停止 FA';

  @override
  String get iconNameStopFa => '停止 FA';

  @override
  String get iconNamePlayFaOutline => '再生 FA 枠線';

  @override
  String get iconNamePauseFaOutline => '一時停止 FA 枠線';

  @override
  String get iconNameStopFaOutline => '停止 FA 枠線';

  @override
  String get iconNameBackwardFa => 'Backward FA';

  @override
  String get iconNameForwardFa => '早送り FA';

  @override
  String get iconNamePreviousFa => '前 FA';

  @override
  String get iconNameNextFa => '次 FA';

  @override
  String get iconNameRewindFa => '巻戻し FA';

  @override
  String get iconNameFastForwardFa => '早送り FA';

  @override
  String get iconNameRepeatFa => 'リピート FA';

  @override
  String get iconNameShuffleFa => 'シャッフル FA';

  @override
  String get iconNameEjectFa => '取り出し FA';

  @override
  String get iconNameFilmFa => 'Film FA';

  @override
  String get iconNameVideoFa => '動画 FA';

  @override
  String get iconNameMusicFa => '音楽 FA';

  @override
  String get iconNameMicrophoneFa => 'マイク FA';

  @override
  String get iconNameCameraFa => 'カメラ FA';

  @override
  String get iconNameCameraRetroFa => 'レトロカメラ FA';

  @override
  String get iconNameVolumeHighFa => '音量大 FA';

  @override
  String get iconNameVolumeLowFa => '音量 Low FA';

  @override
  String get iconNameVolumeOffFa => '音量 Off FA';

  @override
  String get iconNameMuteFa => 'Mute FA';

  @override
  String get iconNameMicMuteFa => 'Mic Mute FA';

  @override
  String get iconNameHeadphonesFa => 'Headphones FA';

  @override
  String get iconNameSpeakerFa => 'スピーカー FA';

  @override
  String get iconNameUpFa => '上 FA';

  @override
  String get iconNameDownFa => '下 FA';

  @override
  String get iconNameLeftFa => '左 FA';

  @override
  String get iconNameRightFa => '右 FA';

  @override
  String get iconNameUpFaOutline => '上 FA 枠線';

  @override
  String get iconNameDownFaOutline => '下 FA 枠線';

  @override
  String get iconNameLeftFaOutline => '左 FA 枠線';

  @override
  String get iconNameRightFaOutline => '右 FA 枠線';

  @override
  String get iconNameArrowUpFa => '矢印 上 FA';

  @override
  String get iconNameArrowDownFa => '矢印 下 FA';

  @override
  String get iconNameArrowLeftFa => '矢印 左 FA';

  @override
  String get iconNameArrowRightFa => '矢印 右 FA';

  @override
  String get iconNameChevronUpFa => 'シェブロン 上 FA';

  @override
  String get iconNameChevronDownFa => 'シェブロン 下 FA';

  @override
  String get iconNameChevronLeftFa => 'シェブロン 左 FA';

  @override
  String get iconNameChevronRightFa => 'シェブロン 右 FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA 枠線';

  @override
  String get iconNameCheckFa => '確認 FA';

  @override
  String get iconNameCloseFa => '閉じる FA';

  @override
  String get iconNameCloseCircleFa => '閉じる 丸 FA';

  @override
  String get iconNameHomeFa => 'ホーム FA';

  @override
  String get iconNameUndoFa => 'Undo FA';

  @override
  String get iconNameRedoFa => 'Redo FA';

  @override
  String get iconNameRotateFa => 'Rotate FA';

  @override
  String get iconNameSearchFa => 'FAを検索';

  @override
  String get iconNameRefreshFa => 'Refresh FA';

  @override
  String get iconNamePowerOffFa => '電源 Off FA';

  @override
  String get iconNamePlugFa => 'Plug FA';

  @override
  String get iconNameToggleOnFa => 'Toggle On FA';

  @override
  String get iconNameToggleOffFa => 'Toggle Off FA';

  @override
  String get iconNameSettingsFa => '設定 FA';

  @override
  String get iconNameSettingsAltFa => '設定 Alt FA';

  @override
  String get iconNameMenuFa => 'メニュー FA';

  @override
  String get iconNameMoreFa => 'その他 FA';

  @override
  String get iconNameMoreVerticalFa => 'その他 縦 FA';

  @override
  String get iconNameInfoFa => '情報 FA';

  @override
  String get iconNameInfoFaOutline => '情報 FA 枠線';

  @override
  String get iconNameHelpFa => 'ヘルプ FA';

  @override
  String get iconNameHelpFaOutline => 'ヘルプ FA 枠線';

  @override
  String get iconNameListFa => '一覧 FA';

  @override
  String get iconNameGridFa => 'グリッド FA';

  @override
  String get iconNameSlidersFa => 'Sliders FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'モニター FA';

  @override
  String get iconNameDesktopFa => 'デスクトップ FA';

  @override
  String get iconNameBrightnessFa => '明るさ FA';

  @override
  String get iconNameNightModeFa => '夜 モード FA';

  @override
  String get iconNameLightFa => 'ライト FA';

  @override
  String get iconNameLightFaOutline => 'ライト FA 枠線';

  @override
  String get iconNameFlashFa => 'フラッシュ FA';

  @override
  String get iconNameFullscreenFa => '全画面 FA';

  @override
  String get iconNameExitFullscreenFa => '終了 全画面 FA';

  @override
  String get iconNameZoomInFa => 'Zoom In FA';

  @override
  String get iconNameZoomOutFa => 'Zoom Out FA';

  @override
  String get iconNameSubtitlesFa => 'Subtitles FA';

  @override
  String get iconNamePictureInPictureFa => 'Picture in Picture FA';

  @override
  String get iconNameColorFa => '色 FA';

  @override
  String get iconNamePaintFa => 'Paint FA';

  @override
  String get iconNameInputFa => '入力 FA';

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
  String get iconNameCloudFa => '雲 FA';

  @override
  String get iconNameStarFa => 'Star FA';

  @override
  String get iconNameStarFaOutline => '星 FA 枠線';

  @override
  String get iconNameHeartFa => 'Heart FA';

  @override
  String get iconNameHeartFaOutline => 'ハート FA 枠線';

  @override
  String get iconNameBookmarkFa => 'Bookmark FA';

  @override
  String get iconNameBookmarkFaOutline => 'ブックマーク FA 枠線';

  @override
  String get iconNameFlagFa => 'Flag FA';

  @override
  String get iconNameClockFa => 'Clock FA';

  @override
  String get iconNameClockFaOutline => '時計 FA 枠線';

  @override
  String get iconNameBellFa => 'Bell FA';

  @override
  String get iconNameBellFaOutline => 'ベル FA 枠線';

  @override
  String get iconNameTimerFa => 'タイマー FA';

  @override
  String get iconNameLockFa => 'ロック FA';

  @override
  String get iconNameUnlockFa => 'ロック解除 FA';

  @override
  String get iconNameGalleryFa => 'Gallery FA';

  @override
  String get iconNameImagesFa => '画像 FA';

  @override
  String get iconNameImageFa => '画像 FA';

  @override
  String get iconNameVideoFileFa => '動画 ファイル FA';

  @override
  String get iconNameAudioFileFa => '音声 ファイル FA';

  @override
  String get iconNamePlayOutlineFa => '再生 枠線 FA';

  @override
  String get iconNamePlaySimpleFa => '再生 シンプル FA';

  @override
  String get iconNamePauseSimpleFa => '一時停止 シンプル FA';

  @override
  String get iconNameStopSimpleFa => '停止 シンプル FA';

  @override
  String get iconNameRecordFa => '録画 FA';

  @override
  String get iconNameStopCircleFa => '停止 丸 FA';

  @override
  String get iconNameLoadingFa => 'Loading FA';

  @override
  String get iconNameTextFa => 'Text FA';

  @override
  String get iconNameTextSizeFa => 'Text Size FA';

  @override
  String get iconNameLanguageFa => '言語 FA';

  @override
  String get iconNameGlobeFa => 'Globe FA';

  @override
  String get iconNameSubtitlesAltFa => 'Subtitles Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => '字幕 代替 枠線 FA';

  @override
  String get iconNameChannelUpFa => 'チャンネル 上 FA';

  @override
  String get iconNameChannelDownFa => 'チャンネル 下 FA';

  @override
  String get iconNamePageUpFa => 'ページ上 FA';

  @override
  String get iconNamePageDownFa => 'ページ下 FA';

  @override
  String get iconNameGuideFa => 'Guide FA';

  @override
  String get iconNameGridViewFa => 'グリッド表示 FA';

  @override
  String get iconNameGridAltFa => 'グリッド Alt FA';

  @override
  String get iconNameScheduleFa => 'Schedule FA';

  @override
  String get iconNameCalendarFa => 'Calendar FA';

  @override
  String get iconNameRedButtonFa => 'Red ボタン FA';

  @override
  String get iconNameButtonOutlineFa => 'ボタン 枠線 FA';

  @override
  String get iconNameSquareButtonFa => '四角 ボタン FA';

  @override
  String get iconNameSquareOutlineFa => '四角 枠線 FA';

  @override
  String get iconNameDotCircleFa => 'Dot 丸 FA';

  @override
  String get iconNameToolsFa => 'ツール FA';

  @override
  String get iconNameScrewdriverFa => 'ドライバー FA';

  @override
  String get iconNameHammerFa => 'ハンマー FA';

  @override
  String get iconNameToolboxFa => '工具箱 FA';

  @override
  String get iconNameCogFa => '歯車 FA';

  @override
  String get iconNameAdjustFa => '調整 FA';

  @override
  String get iconNameFilterFa => 'フィルタ FA';

  @override
  String get iconNameSortDownFa => '並べ替え 下 FA';

  @override
  String get iconNameSortUpFa => '並べ替え 上 FA';

  @override
  String get iconNameSleepFa => 'スリープ FA';

  @override
  String get iconNameTimerStartFa => 'タイマー開始 FA';

  @override
  String get iconNameTimerHalfFa => 'タイマー半分 FA';

  @override
  String get iconNameTimerEndFa => 'タイマー End FA';

  @override
  String get iconNameStopwatchFa => 'Stopwatch FA';

  @override
  String get iconNameAlarmFa => 'アラーム FA';

  @override
  String get iconNameCropAltFa => '切り抜き Alt FA';

  @override
  String get iconNameCropFa => '切り抜き FA';

  @override
  String get iconNameSquareFullFa => '四角 塗りつぶし FA';

  @override
  String get iconNameFullscreenAltFa => '全画面 Alt FA';

  @override
  String get iconNameZoomPlusFa => 'ズーム プラス FA';

  @override
  String get iconNameZoomMinusFa => 'ズーム マイナス FA';

  @override
  String get iconNameMusicNoteFa => '音符 FA';

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
  String get iconNameChildModeFa => '子どもモード FA';

  @override
  String get iconNameCastFa => 'Cast FA';

  @override
  String get iconNameStreamFa => 'Stream FA';

  @override
  String get iconNameSignalFa => '信号 FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => '丸 矢印 上 FA';

  @override
  String get iconNameCircleArrowDownFa => '丸 矢印 下 FA';

  @override
  String get iconNameCircleArrowLeftFa => '丸 矢印 左 FA';

  @override
  String get iconNameCircleArrowRightFa => '丸 矢印 右 FA';

  @override
  String get iconNameLongArrowUpFa => '長い矢印 上 FA';

  @override
  String get iconNameLongArrowDownFa => '長い矢印 下 FA';

  @override
  String get iconNameLongArrowLeftFa => '長い矢印 左 FA';

  @override
  String get iconNameLongArrowRightFa => '長い矢印 右 FA';

  @override
  String get iconNamePlusFa => 'プラス FA';

  @override
  String get iconNameMinusFa => 'マイナス FA';

  @override
  String get iconNamePlusCircleFa => 'プラス 丸 FA';

  @override
  String get iconNameMinusCircleFa => 'マイナス 丸 FA';

  @override
  String get iconNamePlusSquareFa => 'プラス 四角 FA';

  @override
  String get iconNameMinusSquareFa => 'マイナス 四角 FA';

  @override
  String get iconNameTimesFa => 'Times FA';

  @override
  String get iconNameTimesCircleFa => '閉じる 丸 FA';

  @override
  String get iconNameBatteryFullFa => 'バッテリー満充電 FA';

  @override
  String get iconNameBattery34Fa => 'バッテリー 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'バッテリー半分 FA';

  @override
  String get iconNameBattery14Fa => 'バッテリー 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'バッテリー空 FA';

  @override
  String get iconNameChargingFa => '充電 FA';

  @override
  String get iconNameCloudSunFa => '雲 太陽 FA';

  @override
  String get iconNameCloudMoonFa => '雲 月 FA';

  @override
  String get iconNameRainFa => '雨 FA';

  @override
  String get iconNameSnowflakeFa => '雪 FA';

  @override
  String get iconNameFireFa => '炎 FA';

  @override
  String get iconNameTemperatureFa => '温度 FA';

  @override
  String get iconNameBoxFa => '箱 FA';

  @override
  String get iconNameGiftFa => 'ギフト FA';

  @override
  String get iconNameTrophyFa => 'トロフィー FA';

  @override
  String get iconNameCrownFa => '王冠 FA';

  @override
  String get iconNameGemFa => '宝石 FA';

  @override
  String get unknownLabel => '不明';

  @override
  String get selectedFilesLabel => '選択ファイル';

  @override
  String get folderNotFoundOrInaccessible => 'フォルダが見つからないかアクセスできません';

  @override
  String get importedRemoteDefaultName => '取り込みリモコン';

  @override
  String get demoRemoteName => 'デモリモコン';

  @override
  String get protocolFieldsInvalid =>
      '必須のプロトコル項目を埋め 周波数を設定する場合は15kから60kにしてください';

  @override
  String get unknownProtocolSelected => '不明なプロトコルが選択されました';
}
