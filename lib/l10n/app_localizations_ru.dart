// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Загрузка…';

  @override
  String get unknownError => 'Неизвестная ошибка';

  @override
  String get failedToStart => 'Не удалось запустить';

  @override
  String get retry => 'Повтор';

  @override
  String get quickTilePower => 'Питание';

  @override
  String get quickTileMute => 'Без звука';

  @override
  String get quickTileVolumeUp => 'Громк. +';

  @override
  String get quickTileVolumeDown => 'Громк. -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'В этом телефоне нет встроенного ИК-передатчика. USB ИК-адаптер найден, но доступ ещё не выдан.\n\nРазрешите USB-доступ, чтобы отправлять ИК.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'В этом телефоне нет встроенного ИК-передатчика. USB ИК-адаптер найден, но доступ к USB отклонён.\n\nЗапросите доступ снова и подтвердите его, чтобы отправлять ИК.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'В этом телефоне нет встроенного ИК-передатчика. USB ИК-адаптер авторизован, но ещё не инициализирован.';

  @override
  String get homeUsbOpenFailedMessage =>
      'В этом телефоне нет встроенного ИК-передатчика. USB ИК-адаптер найден и авторизован, но не удалось его инициализировать.\n\nПереподключите адаптер и попробуйте снова.';

  @override
  String get homeUsbReadyMessage =>
      'В этом телефоне нет встроенного ИК-передатчика.';

  @override
  String get homeUsbNoDeviceMessage =>
      'В этом телефоне нет встроенного ИК-передатчика, и сейчас не подключён поддерживаемый USB ИК-адаптер.\n\nВы всё ещё можете создавать, импортировать и управлять пультами, но для отправки ИК-сигналов нужен один из вариантов ниже.';

  @override
  String get homeUsbOptionPlugIn =>
      'Подключите поддерживаемый USB ИК-адаптер и разрешите доступ.';

  @override
  String get homeUsbOptionReady => 'Готов к работе.';

  @override
  String get homeUsbOptionPermissionRequired => 'Подключено. Нужен доступ.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Доступ отклонён. Запросите снова.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Авторизовано. Идёт инициализация.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Авторизовано, но инициализация не удалась.';

  @override
  String get homeHardwareBannerNoInternal =>
      'В телефоне нет встроенного ИК. Подключите USB ИК-адаптер или включите режим Аудио в настройках.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'USB-адаптер найден. Для отправки ИК нужен доступ.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Доступ USB отклонён. Запросите его снова для отправки ИК.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'USB-адаптер авторизован. Ожидание инициализации.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'USB-адаптер авторизован, но инициализация не удалась.';

  @override
  String get homeHardwareBannerReady => 'USB готов.';

  @override
  String get homeHardwareRequiredTitle =>
      'Для отправки команд нужно ИК-оборудование';

  @override
  String get homeUsbDongleRecommended => 'USB ИК-адаптер, рекомендуется';

  @override
  String get homeAudioAdapterAlternative => 'Аудио ИК-адаптер, альтернатива';

  @override
  String get homeAudioAdapterDescription =>
      'Настройки → ИК-передатчик → Аудио (1 LED / 2 LED). Требуется аудио-ИК адаптер.';

  @override
  String get close => 'Закрыть';

  @override
  String get homeChooseTransmitter => 'Выберите передатчик';

  @override
  String get openSettings => 'Открыть настройки';

  @override
  String get homeUsbPermissionSentApprove =>
      'Запрос доступа USB отправлен. Подтвердите его, чтобы включить USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'Поддерживаемый USB ИК-адаптер не найден. Подключите его и попробуйте снова.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Не удалось запросить доступ USB.';

  @override
  String get working => 'Выполняется…';

  @override
  String get requestUsbPermission => 'Запросить доступ USB';

  @override
  String get homeHardwareTip =>
      'Подсказка: вы уже можете создавать и упорядочивать пульты. Оборудование нужно только для передачи.';

  @override
  String get homeNoIrTransmitterTitle => 'Нет ИК-передатчика';

  @override
  String get settingsNavLabel => 'Настройки';

  @override
  String get dismiss => 'Закрыть';

  @override
  String get remotesNavLabel => 'Пульты';

  @override
  String get macrosNavLabel => 'Макросы';

  @override
  String get signalTesterNavLabel => 'Тестер сигнала';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get remoteNoIrEmitterTitle => 'Нет ИК-передатчика';

  @override
  String get remoteNoIrEmitterMessage =>
      'На этом устройстве нет ИК-передатчика';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Для работы приложению нужен ИК-передатчик';

  @override
  String get remoteDismiss => 'Закрыть';

  @override
  String get remoteClose => 'Закрыть';

  @override
  String remoteFailedToSend(Object error) {
    return 'Не удалось отправить ИК: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Не удалось запустить цикл: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Цикл остановлен, ошибка отправки: $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Цикл \"$title\". Нажмите Стоп сверху, чтобы остановить.';
  }

  @override
  String get remoteLoopStopped => 'Цикл остановлен.';

  @override
  String get remoteUpdatedNotFound =>
      'Пульт обновлён на экране. В сохранённом списке он не найден.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Обновлено \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Не удалось удалить: $error';
  }

  @override
  String get remoteNotFoundSavedList => 'Пульт не найден в сохранённом списке.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Удалено \"$name\".';
  }

  @override
  String get buttonFallbackTitle => 'Кнопка';

  @override
  String get imageFallbackTitle => 'Изобр.';

  @override
  String get noBrowserAvailable => 'Браузер недоступен';

  @override
  String failedToOpen(Object error) {
    return 'Не удалось открыть: $error';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get settingsRestoreDemoTitle => 'Восстановить демо-пульты?';

  @override
  String get settingsRestoreDemoMessage =>
      'Это заменит текущие пульты встроенными демо-пультами. Если хотите сохранить текущий список, лучше сначала сделать копию.';

  @override
  String get settingsRestoreDemoConfirm => 'Восстановить демо';

  @override
  String get settingsDemoRemotesRestored => 'Демо-пульты восстановлены.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Удалить все пульты?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Это удалит все пульты с устройства. Действие нельзя отменить.';

  @override
  String get settingsDeleteAllConfirm => 'Удалить всё';

  @override
  String get settingsAllRemotesDeleted => 'Все пульты удалены.';

  @override
  String get themeAuto => 'Автотема';

  @override
  String get themeLight => 'Светлая тема';

  @override
  String get themeDark => 'Тёмная тема';

  @override
  String get themeDescAuto => 'Следует настройкам устройства';

  @override
  String get themeDescLight => 'Всегда светло и ясно';

  @override
  String get themeDescDark => 'Комфортно для глаз';

  @override
  String get themeHintAuto =>
      'Тема автоматически меняется при переключении устройства между светлым и тёмным режимом';

  @override
  String get themeHintLight =>
      'Идеально для дневного света и хорошо освещённых мест';

  @override
  String get themeHintDark =>
      'Снижает нагрузку на глаза при слабом свете и экономит батарею на OLED';

  @override
  String get supportDevelopmentTitle => 'Поддержать разработку';

  @override
  String get supportDevelopmentSubtitle =>
      'Помогите поддерживать IR Blaster и совместимость с оборудованием';

  @override
  String get supportDevelopmentBody =>
      'Без рекламы, без трекинга, без закрытых функций. Ваша поддержка идёт на работу с протоколами, поддержку USB-адаптеров и лучшую совместимость устройств.';

  @override
  String get donate => 'Поддержать';

  @override
  String get starRepo => 'Поставить звезду';

  @override
  String get repositoryLinkCopied => 'Ссылка на репозиторий скопирована';

  @override
  String get supportPillLocalOnly => 'Только локально';

  @override
  String get supportPillNoTracking => 'Без трекинга';

  @override
  String get supportPillHardwareAware => 'С учётом железа';

  @override
  String get supportPillOpenSource => 'Open source';

  @override
  String get appearanceTitle => 'Внешний вид';

  @override
  String get appearanceSubtitle => 'Настройте внешний вид приложения';

  @override
  String get localizationTitle => 'Локализация';

  @override
  String get localizationSubtitle => 'Язык приложения и поведение перевода';

  @override
  String localizationAutoUsing(Object language) {
    return 'Авто: $language';
  }

  @override
  String get localizationAutoDescription =>
      'Приложение использует язык устройства, если возможно.';

  @override
  String get localizationManualDescription => 'Язык приложения задан вручную.';

  @override
  String get useSystemLanguageTitle => 'Язык системы';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Используется язык устройства: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Использовать язык, выбранный ниже, вместо языка устройства.';

  @override
  String get chooseAppLanguage => 'Выберите язык';

  @override
  String get languagePickerDisabledHint =>
      'Отключите системный язык, чтобы выбрать язык вручную.';

  @override
  String get searchLanguages => 'Поиск языков';

  @override
  String get noLanguagesFound => 'Нет совпадений';

  @override
  String get localizationHint =>
      'Когда включён системный язык, приложение следует локали устройства и откатывается к английскому, если перевода нет. Выключите это, чтобы зафиксировать конкретный язык.';

  @override
  String get appLanguageTitle => 'Язык приложения';

  @override
  String get appLanguageHint =>
      'По умолчанию используется язык устройства. Здесь можно принудительно выбрать только English или Français для приложения.';

  @override
  String get languageAuto => 'Авто (система)';

  @override
  String get languageAutoDescription =>
      'Автоматически использовать язык устройства';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageEnglishDescription => 'Всегда использовать English';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageFrenchDescription => 'Всегда использовать Français';

  @override
  String get languageAutoShort => 'Авто';

  @override
  String get languageEnglishShort => 'English';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'Динамические цвета';

  @override
  String get themeChoiceAuto => 'Авто';

  @override
  String get themeChoiceLight => 'Светлая';

  @override
  String get themeChoiceDark => 'Тёмная';

  @override
  String get irTransmitterTitle => 'ИК-передатчик';

  @override
  String get irTransmitterSubtitle =>
      'Выберите, какое оборудование отправляет ИК-команды';

  @override
  String get interactionTitle => 'Взаимодействие';

  @override
  String get interactionSubtitle => 'Отклик на касания и раскладка пульта';

  @override
  String get hapticFeedbackTitle => 'Тактильный отклик';

  @override
  String get hapticFeedbackSubtitle => 'Вибрация при нажатиях и действиях';

  @override
  String get intensity => 'Интенсивность';

  @override
  String get intensityLight => 'Светлая';

  @override
  String get intensityMedium => 'Средняя';

  @override
  String get intensityStrong => 'Сильная';

  @override
  String get flipRemoteDefaultTitle => 'По умолчанию переворачивать пульт';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Открывать экран пульта, повернув его на 180°, для USB-адаптеров снизу.';

  @override
  String get remoteViewFlipped => 'Экран пульта будет открыт перевёрнутым.';

  @override
  String get remoteViewNormal => 'Экран пульта будет открыт обычно.';

  @override
  String get backupTitle => 'Резервная копия';

  @override
  String get backupSubtitle => 'Импорт и экспорт пультов и макросов';

  @override
  String get importBackup => 'Импорт копии';

  @override
  String get importBackupSubtitle =>
      'Импортируйте копию пультов и макросов или файлы Flipper Zero, LIRC или IRPLUS';

  @override
  String get bulkImportFolder => 'Массовый импорт папки';

  @override
  String get bulkImportFolderSubtitle =>
      'Импортировать несколько пультов из папки';

  @override
  String get exportBackup => 'Экспорт копии';

  @override
  String get exportBackupSubtitle =>
      'Сохранить пульты и макросы как один JSON-файл в Downloads';

  @override
  String get restoreDemoRemotes => 'Восст. демо-пульты';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Заменить текущие пульты встроенными демо';

  @override
  String get deleteAllRemotes => 'Удалить все пульты';

  @override
  String get deleteAllRemotesSubtitle => 'Удалить все пульты с устройства';

  @override
  String get backupTip =>
      'Подсказка: экспортируйте копию перед большими изменениями. Импорт поддерживает полные копии, старые JSON-копии только с пультами и файлы Flipper Zero .ir.';

  @override
  String get aboutTitle => 'О приложении';

  @override
  String get aboutSubtitle => 'Информация о приложении и деталях open source';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Версия $version';
  }

  @override
  String get sourceCode => 'Исходный код';

  @override
  String get viewOnGitHub => 'Открыть на GitHub';

  @override
  String get repositoryUrlCopied => 'URL репозитория скопирован';

  @override
  String get reportIssue => 'Сообщить о проблеме';

  @override
  String get reportIssueSubtitle => 'Баг-репорты и запросы функций';

  @override
  String get issuesUrlCopied => 'URL задач скопирован';

  @override
  String get license => 'Лицензия';

  @override
  String get openSourceLicense => 'Лицензия open source';

  @override
  String get licenseUrlCopied => 'URL лицензии скопирован';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Открыть сайт';

  @override
  String get companyUrlCopied => 'URL компании скопирован';

  @override
  String get licenses => 'Лицензии';

  @override
  String get openSourceLicenses => 'Лицензии open source';

  @override
  String byCreator(Object creator) {
    return 'от $creator';
  }

  @override
  String get deviceControlsTitle => 'Упр. устройством';

  @override
  String get deviceControlsSubtitle =>
      'Показывать избранные кнопки на странице системного управления устройством';

  @override
  String get manageFavorites => 'Избранное';

  @override
  String get manageFavoritesSubtitle =>
      'Выберите кнопки, которые будут показаны в управлении устройством';

  @override
  String get quickSettingsTitle => 'Быстрые настройки';

  @override
  String get quickSettingsSubtitle => 'Добавить плитки для питания и громкости';

  @override
  String get configureTiles => 'Настроить плитки';

  @override
  String get configureTilesSubtitle => 'Привязать плитки к кнопкам пульта';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Перебор универсальных кодов питания для своих устройств';

  @override
  String get openTvKill => 'Открыть TVKill';

  @override
  String get openTvKillSubtitle =>
      'Перебор кодов питания, только для своих устройств';

  @override
  String get failedToLoadTransmitterSettings =>
      'Не удалось загрузить настройки передатчика.';

  @override
  String get usbStatusReady => 'USB-адаптер подключён и готов отправлять ИК.';

  @override
  String get usbStatusPermissionRequired =>
      'USB-адаптер найден. Запросите доступ USB и подтвердите системное окно.';

  @override
  String get usbStatusPermissionDenied =>
      'Доступ USB для подключённого адаптера отклонён. Запросите снова и подтвердите окно.';

  @override
  String get usbStatusPermissionGranted =>
      'Доступ USB выдан. Перед отправкой ИК адаптер ещё нужно инициализировать.';

  @override
  String get usbStatusOpenFailed =>
      'Доступ USB выдан, но адаптер не удалось инициализировать. Переподключите его и попробуйте снова.';

  @override
  String get usbStatusNoDevice => 'Поддерживаемый USB ИК-адаптер не найден.';

  @override
  String get usbSelectPermissionRequired =>
      'USB-адаптер найден, но не авторизован. Нажмите \"Запросить доступ USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'Доступ USB отклонён. Нажмите \"Запросить доступ USB\" и подтвердите окно.';

  @override
  String get usbSelectPermissionGranted =>
      'Доступ USB выдан, но адаптер ещё не инициализирован. Попробуйте переподключить его.';

  @override
  String get usbSelectOpenFailed =>
      'Доступ USB выдан, но адаптер не удалось инициализировать. Переподключите его и попробуйте снова.';

  @override
  String get usbSelectNoDevice =>
      'Поддерживаемый USB ИК-адаптер не найден. Подключите его, затем нажмите \"Запросить доступ USB\".';

  @override
  String get usbSelectReady => 'USB-адаптер готов.';

  @override
  String get autoSwitchEnabledMessage =>
      'Автопереключение включено: использует USB при подключении, иначе встроенный.';

  @override
  String get autoSwitchDisabledMessage =>
      'Автопереключение выключено: выбор передатчика теперь ручной.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Не удалось обновить автопереключение.';

  @override
  String get failedToSwitchTransmitter => 'Не удалось переключить передатчик.';

  @override
  String get deviceHasNoInternalIr =>
      'На этом устройстве нет встроенного ИК-передатчика.';

  @override
  String get audioModeEnabledMessage =>
      'Режим Аудио включён. Используйте максимальную громкость медиа и аудио-ИК LED адаптер.';

  @override
  String get usbPermissionRequestSent => 'Запрос доступа USB отправлен.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Запрос доступа USB отправлен. Подтвердите его, чтобы включить USB.';

  @override
  String get usbAlreadyReady => 'USB-адаптер уже инициализирован и готов.';

  @override
  String get failedToRequestUsbPermission => 'Не удалось запросить доступ USB.';

  @override
  String get transmitterHelpInternal =>
      'Используйте встроенный ИК-передатчик телефона для отправки команд.';

  @override
  String get transmitterHelpUsb =>
      'Используйте USB ИК-адаптер, чтобы отправлять команды. Требуется разрешение.';

  @override
  String get transmitterHelpAudio1 =>
      'Используйте аудиовыход, mono. Нужен аудио-ИК LED адаптер и высокая громкость медиа.';

  @override
  String get transmitterHelpAudio2 =>
      'Используйте аудиовыход, stereo. Два канала дают лучшее управление LED на совместимых адаптерах.';

  @override
  String get transmitterInternal => 'Встроенный ИК';

  @override
  String get transmitterUsb => 'USB ИК-адаптер';

  @override
  String get transmitterAudio1 => 'Аудио (1 LED)';

  @override
  String get transmitterAudio2 => 'Аудио (2 LED)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Не удалось загрузить возможности передатчика.';

  @override
  String get selectedTransmitter => 'Выбранный передатчик';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Активен: $active';
  }

  @override
  String get refresh => 'Обновить';

  @override
  String get autoSwitchTitle => 'Автопереключение';

  @override
  String get autoSwitchDisabledWhileAudio =>
      'Отключено при использовании режима Аудио';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Использует USB при подключении, иначе встроенный';

  @override
  String get unavailableOnThisDevice => 'Недоступно на этом устройстве';

  @override
  String get openOnUsbAttachTitle => 'Открывать при подключении USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android может предложить открыть приложение при подключении поддерживаемого USB ИК-адаптера.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'При подключении поддерживаемого USB-адаптера будет предлагаться открыть IR Blaster.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Предложение открыть приложение при подключении USB отключено.';

  @override
  String get failedToUpdateSetting => 'Не удалось обновить настройку.';

  @override
  String get unnamedButton => 'Безымянная кнопка';

  @override
  String get iconFallback => 'Иконка';

  @override
  String get remoteListReorderHint =>
      'Режим сортировки: зажмите и перетащите карточку.';

  @override
  String get deleteRemoteTitle => 'Удалить пульт?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" будет удалён навсегда. Действие нельзя отменить.';
  }

  @override
  String get delete => 'Удалить';

  @override
  String get addToDeviceControlsTitle => 'Добавить в управление устройством?';

  @override
  String get addToDeviceControlsDescription =>
      'Быстрый доступ в системном управлении устройством.';

  @override
  String get skip => 'Пропустить';

  @override
  String get add => 'Добавить';

  @override
  String get addedToDeviceControls => 'Добавлено в управление устройством.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Удалено \"$name\". Это действие нельзя отменить.';
  }

  @override
  String remoteLayoutSummary(Object count, Object layout) {
    return '$count кноп. · $layout';
  }

  @override
  String get layoutComfort => 'Комфорт';

  @override
  String get layoutCompact => 'Компактный';

  @override
  String get open => 'Открыть';

  @override
  String get useThisRemote => 'Использовать пульт';

  @override
  String get edit => 'Изменить';

  @override
  String get editRemoteSubtitle => 'Переименовать и изменить кнопки';

  @override
  String get thisCannotBeUndone => 'Это нельзя отменить';

  @override
  String get searchRemotes => 'Поиск пультов';

  @override
  String get reorderRemotes => 'Изменить порядок пультов';

  @override
  String get addRemote => 'Добавить пульт';

  @override
  String get more => 'Ещё';

  @override
  String get reorderMode => 'Режим сортировки';

  @override
  String remoteButtonCount(Object count, Object plural) {
    return '$count кнопк$plural';
  }

  @override
  String get noRemotesYet => 'Пультов пока нет';

  @override
  String get noRemotesDescription =>
      'Создайте пульт, чтобы начать отправлять ИК-коды.';

  @override
  String get noRemotesNextStep =>
      'Что дальше: нажмите Добавить пульт, затем добавьте первые кнопки.';

  @override
  String get actions => 'Actions';

  @override
  String get macrosTitle => 'Макросы';

  @override
  String get help => 'Помощь';

  @override
  String get createMacro => 'Создать макрос';

  @override
  String get timedMacrosTitle => 'Макросы с таймингом';

  @override
  String get timedMacrosSubtitle =>
      'Автоматизируйте последовательности ИК-команд с точным таймингом';

  @override
  String get timedMacrosNextStep =>
      'Что дальше: нажмите \"Создать первый макрос\", выберите пульт, затем добавьте команды и задержки.';

  @override
  String get macroFeatureToysTitle => 'Идеально для интерактивных игрушек';

  @override
  String get macroFeatureToysDescription =>
      'Управляйте устройствами вроде робособак i-cybie, роботов i-sobot и других игрушек, которым нужно время между командами для обработки действий.';

  @override
  String get macroFeatureTimingTitle => 'Точный контроль тайминга';

  @override
  String get macroFeatureTimingDescription =>
      'Добавляйте задержки между командами, от 250 мс до произвольной длины, чтобы устройство успевало ответить перед следующим шагом.';

  @override
  String get macroFeatureManualTitle => 'Шаги с ручным продолжением';

  @override
  String get macroFeatureManualDescription =>
      'Приостанавливает выполнение и ждёт подтверждения, когда длина анимации меняется или нужен визуальный контроль.';

  @override
  String get exampleUseCase => 'Пример использования';

  @override
  String get macroExampleText =>
      'Режим i-cybie Advanced:\n1. Отправить команду \"Mode\"\n2. Ждать 1000 мс, игрушка обрабатывает\n3. Отправить \"Action 1\"\n4. Ждать 1000 мс\n5. Отправить \"Action 2\"\n…и так далее автоматически!';

  @override
  String get createFirstMacro => 'Создать первый макрос';

  @override
  String get noRemote => 'Нет пульта';

  @override
  String macroStepCount(Object count, Object plural) {
    return '$count шаг$plural';
  }

  @override
  String get aboutTimedMacros => 'О макросах с таймингом';

  @override
  String get aboutTimedMacrosDescription =>
      'Макросы с таймингом позволяют автоматизировать последовательности ИК-команд с точными задержками между шагами.';

  @override
  String get sendCommand => 'Отправить команду';

  @override
  String get sendCommandDescription => 'Отправляет ИК-команду с вашего пульта.';

  @override
  String get delay => 'Задержка';

  @override
  String get delayDescription =>
      'Ждёт указанное время, например 1000 мс, перед следующим шагом.';

  @override
  String get manualContinue => 'Ручное продолжение';

  @override
  String get manualContinueDescription =>
      'Приостанавливает выполнение до нажатия Продолжить. Полезно для анимаций переменной длины.';

  @override
  String get gotIt => 'Понятно';

  @override
  String get failedToSaveMacros => 'Не удалось сохранить макросы.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Удалено \"$name\".';
  }

  @override
  String get undo => 'Отменить';

  @override
  String get failedToRestoreMacro => 'Не удалось восстановить макрос.';

  @override
  String get deleteMacroTitle => 'Удалить макрос?';

  @override
  String get deleteMacroMessage =>
      'Это можно отменить из следующего уведомления.';

  @override
  String get noRemotesAvailable => 'Нет доступных пультов.';

  @override
  String remoteButtonCountSummary(Object count) {
    return '$count кноп.';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Ориентация: перевёрнута, нажмите для норм.';

  @override
  String get remoteOrientationNormalTooltip =>
      'Ориентация: обычная, нажмите для переворота';

  @override
  String get stopLoop => 'Остановить цикл';

  @override
  String get reorderButtons => 'Изменить порядок кнопок';

  @override
  String get remoteReorderHint =>
      'Режим сортировки: зажмите и перетащите кнопку.';

  @override
  String get manageRemote => 'Управление пультом';

  @override
  String get remoteNoButtons => 'В этом пульте нет кнопок';

  @override
  String get remoteNoButtonsDescription =>
      'Используйте \"Изм. пульт\", чтобы добавить или настроить кнопки.';

  @override
  String get editRemote => 'Изм. пульт';

  @override
  String get editRemoteActionsSubtitle =>
      'Переименовать, сортировать и изменить кнопки';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Обновлено \"$name\".';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Добавлено \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Кнопка продублирована.';

  @override
  String get loopRunningForButton => 'Для этой кнопки запущен цикл.';

  @override
  String get loopTip =>
      'Подсказка: используйте Цикл для повторения до остановки.';

  @override
  String get codeCopied => 'Код скопирован.';

  @override
  String get copyCode => 'Копировать код';

  @override
  String get startLoop => 'Запустить цикл';

  @override
  String get editButtonSubtitle => 'Изменить метку, код, протокол, частоту';

  @override
  String get newButton => 'Новая кнопка';

  @override
  String get newButtonSubtitle => 'Создать новую кнопку после этой';

  @override
  String get duplicate => 'Дублировать';

  @override
  String get duplicateButtonSubtitle => 'Создать копию этой кнопки';

  @override
  String get removeFromDeviceControls => 'Убрать из управления';

  @override
  String get addToDeviceControls => 'Добавить в управление';

  @override
  String get deviceControlsButtonSubtitle =>
      'Показывает эту кнопку в системном управлении устройством';

  @override
  String get removedFromDeviceControls => 'Удалено из управления устройством.';

  @override
  String get pinQuickTile => 'Закрепить в быстрых плитках';

  @override
  String get unpinQuickTile => 'Открепить из быстрых плиток';

  @override
  String get quickTileButtonSubtitle =>
      'Показывает эту кнопку вверху выбора быстрых плиток';

  @override
  String get removedFromQuickTileFavorites =>
      'Удалено из избранных быстрых плиток.';

  @override
  String get pinnedToQuickTileFavorites =>
      'Закреплено в избранных быстрых плитках.';

  @override
  String get duplicateAndEdit => 'Дублировать и изм.';

  @override
  String get duplicateAndEditSubtitle => 'Создать копию и сразу изменить';

  @override
  String get done => 'Готово';

  @override
  String get run => 'Запуск';

  @override
  String get untitledRemote => 'Пульт без названия';

  @override
  String get createRemoteTitle => 'Создать пульт';

  @override
  String get editRemoteTitle => 'Изменить пульт';

  @override
  String get removeButtonTitle => 'Удалить кнопку?';

  @override
  String get imageButtonRemovedMessage =>
      'Эта кнопка с изображением будет удалена.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" будет удалено.';
  }

  @override
  String get remove => 'Удалить';

  @override
  String importedButtonCount(int count) {
    return 'Импортировано кнопок: $count.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Импортировано кнопок из существующих пультов: $count.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Изменить метку, сигнал и доп. настройки';

  @override
  String get createButtonCopySubtitle => 'Создать копию этой кнопки';

  @override
  String get duplicateAndEditButtonSubtitle => 'Создать копию и сразу изменить';

  @override
  String get undoAvailableInNextSnackbar =>
      'Можно отменить из следующего уведомления';

  @override
  String get buttonRemoved => 'Кнопка удалена.';

  @override
  String get remoteNameCannotBeEmpty => 'Имя пульта не может быть пустым.';

  @override
  String get saveRemote => 'Сохранить пульт';

  @override
  String get remoteName => 'Имя пульта';

  @override
  String get remoteNameHint => 'напр., TV, кондиционер, LED лента';

  @override
  String get remoteNameHelper => 'Это имя отображается в списке пультов.';

  @override
  String get layoutStyle => 'Стиль раскладки';

  @override
  String get layoutWideDescription =>
      'Широкий: кнопки в 2 колонки с доп. деталями, рекомендуется.';

  @override
  String get layoutCompactDescription =>
      'Компактный: классическая сетка 4×, только иконки или текст.';

  @override
  String get importFromRemotes => 'Импорт из пультов';

  @override
  String get importFromDatabase => 'Импорт из БД';

  @override
  String get addButton => 'Добавить кнопку';

  @override
  String get noButtonsYet => 'Кнопок пока нет';

  @override
  String get createRemoteEmptyStateDescription =>
      'Добавьте первую кнопку, затем зажмите её для изменения или удаления.';

  @override
  String get createButtonTitle => 'Создать кнопку';

  @override
  String get editButtonTitle => 'Изменить кнопку';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Не удалось загрузить протоколы: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Не удалось загрузить ключи базы: $error';
  }

  @override
  String get presetPower => 'Питание';

  @override
  String get presetVolume => 'Громкость';

  @override
  String get presetChannel => 'Канал';

  @override
  String get presetNavigation => 'Навигация';

  @override
  String get all => 'Все';

  @override
  String get completeRequiredFieldsToSave =>
      'Заполните обязательные поля для сохранения';

  @override
  String get buttonLabelStepTitle => '1) Метка кнопки';

  @override
  String get buttonLabelStepSubtitle =>
      'Выберите изображение, иконку или введите текстовую метку.';

  @override
  String get buttonColorStepTitle => '2) Цвет кнопки, необяз.';

  @override
  String get buttonColorStepSubtitle => 'Выберите цвет фона для этой кнопки.';

  @override
  String get selectColor => 'Выберите цвет:';

  @override
  String get noImageSelected => 'Изображение не выбрано';

  @override
  String get gallery => 'Галерея';

  @override
  String get builtIn => 'Встроенный';

  @override
  String get removeImage => 'Удалить изображение';

  @override
  String get requiredSelectImageOrSwitch =>
      'Обязательно: выберите изображение, иконку или переключитесь на Текст.';

  @override
  String get iconSelected => 'Иконка выбрана';

  @override
  String get noIconSelected => 'Иконка не выбрана';

  @override
  String get chooseIcon => 'Выбрать иконку';

  @override
  String get removeIcon => 'Удалить иконку';

  @override
  String get requiredSelectIconOrSwitch =>
      'Обязательно: выберите иконку или переключитесь на Изображение или Текст.';

  @override
  String get buttonText => 'Текст кнопки';

  @override
  String get buttonTextHint => 'напр., Питание, Громкость +, HDMI 1';

  @override
  String get buttonTextHelper => 'Этот текст будет показан на кнопке.';

  @override
  String get requiredEnterButtonLabel => 'Обязательно: введите метку кнопки.';

  @override
  String get defaultColorName => 'По умолчанию';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Создан новый пульт с одной кнопкой из последнего попадания.';

  @override
  String get selectRemote => 'Выберите пульт';

  @override
  String remoteNumber(Object id) {
    return 'Пульт #$id';
  }

  @override
  String get newRemoteCreated => 'Новый пульт создан.';

  @override
  String get failedToCreateRemote => 'Не удалось создать пульт.';

  @override
  String get newRemoteEllipsis => 'Новый пульт…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Добавлено в $name.';
  }

  @override
  String get failedToAddToRemote => 'Не удалось добавить в пульт.';

  @override
  String get newRemoteDefaultName => 'Новый пульт';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Переход к смещению $offset. Пауза, нажмите Продолжить.';
  }

  @override
  String get sent => 'Отправлено.';

  @override
  String failedToSend(Object error) {
    return 'Не удалось отправить: $error';
  }

  @override
  String get copiedProtocolCode => 'Скопировано, протокол:код.';

  @override
  String get savedToResults => 'Сохранено в результаты.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Неверный код для протокола: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Текущий кандидат скопирован.';

  @override
  String get jumpToOffset => 'Перейти к смещению';

  @override
  String get jumpToBruteCursor => 'Перейти к brute курсору';

  @override
  String get jump => 'Переход';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Переход к курсору 0x$cursor. Пауза, нажмите Продолжить.';
  }

  @override
  String get irSignalTester => 'Тестер ИК-сигнала';

  @override
  String get stop => 'Стоп';

  @override
  String get selectButton => 'Выберите кнопку';

  @override
  String get buttonNotFoundInRemotes => 'Кнопка не найдена в пультах.';

  @override
  String sentNamed(Object name) {
    return 'Отправлено \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'Ошибка отправки: $error';
  }

  @override
  String get noFavoritesYet => 'Избранного пока нет';

  @override
  String get deviceControlsEmptyHint =>
      'Зажмите кнопку пульта и выберите \"Добавить в управление устройством\".';

  @override
  String get sendTest => 'Отправить тест';

  @override
  String get testSendCompleted => 'Тестовая отправка завершена.';

  @override
  String testSendFailed(Object error) {
    return 'Тестовая отправка не удалась: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Удалено \"$name\".';
  }

  @override
  String get brand => 'Бренд';

  @override
  String get model => 'Модель';

  @override
  String get selectBrand => 'Выберите бренд';

  @override
  String get searchBrand => 'Поиск бренда…';

  @override
  String get selectModel => 'Выберите модель';

  @override
  String get searchModel => 'Поиск модели…';

  @override
  String get unnamedKey => 'Безымянный ключ';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'Поиск команд';

  @override
  String get noMatchingCommands => 'Совпадающих команд нет';

  @override
  String get quickTileFavoritesTitle => 'Избр. быстрых плиток';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Изменить назначение для плитки $tileLabel';
  }

  @override
  String get pickDifferentButton => 'Выберите другую кнопку';

  @override
  String get browseAllRemotesEllipsis => 'Просмотреть все пульты…';

  @override
  String get invalidMacroFileFormat => 'Неверный формат файла макроса.';

  @override
  String get failedToParseMacroFile => 'Не удалось разобрать файл макроса.';

  @override
  String get deviceCodeLabel => 'Код устройства';

  @override
  String get commandLabel => 'Команда';

  @override
  String get editButtonCodeTitle => 'Изменить код кнопки';

  @override
  String get thisRemoteHasNoButtons => 'В этом пульте нет кнопок.';

  @override
  String get selectCommand => 'Выберите команду';

  @override
  String get databaseModeAutofillHint =>
      'Режим База автоматически заполняет шаг 2, бренд, модель и протокол. После импорта ключа можно донастроить всё вручную.';

  @override
  String get test => 'Тест';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Все выбранные кнопки были дубликатами.';

  @override
  String get noButtonsImported => 'Кнопки не импортированы.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Импортировано кнопок: $addedCount. Пропущено дубликатов: $skippedCount.';
  }

  @override
  String get importAllMatchingTitle => 'Импортировать все подходящие кнопки?';

  @override
  String get noMatchingKeysFound => 'Подходящие ключи не найдены.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Будет импортировано до $count подходящих ключей из текущего выбора базы.';
  }

  @override
  String get importAll => 'Импортировать всё';

  @override
  String get importingButtons => 'Импорт кнопок…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Все подходящие кнопки были дубликатами.';

  @override
  String get quickPresets => 'Быстрые пресеты';

  @override
  String get selectDeviceFirst => 'Сначала выберите устройство';

  @override
  String get searchByLabelOrHex => 'Поиск по метке или hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Необяз.: уточните ключи пресета $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Сначала выберите бренд, модель и протокол.';

  @override
  String get importFromDatabaseTitle => 'Импорт из базы';

  @override
  String get importFromDatabaseSubtitle =>
      'Выберите устройство, загрузите подходящие ключи и импортируйте выбранные кнопки.';

  @override
  String get deviceAndFilters => 'Устройство и фильтры';

  @override
  String loadedCount(int count) {
    return 'Загружено: $count';
  }

  @override
  String get hideFilters => 'Скрыть фильтры';

  @override
  String get showFilters => 'Показать фильтры';

  @override
  String get noProtocolFoundForBrandModel =>
      'Для этого бренда и модели протокол не найден.';

  @override
  String get protocolAutoDetected => 'Протокол';

  @override
  String get protocolAutoDetectedHelper =>
      'Автоматически определён из базы. Его можно изменить перед импортом.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Выберите бренд, модель и протокол, чтобы загрузить ключи.';

  @override
  String get noKeysFound => 'Ключи не найдены.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Ключи для “$query” не найдены.';
  }

  @override
  String get skipDuplicates => 'Пропускать дубликаты';

  @override
  String get skipDuplicatesSubtitle =>
      'Не импортировать кнопки, которые уже есть в этом пульте.';

  @override
  String get importSelected => 'Импортировать выбранное';

  @override
  String get noMacrosToExport => 'Нет макросов для экспорта.';

  @override
  String get macrosExportedToDownloads => 'Макросы экспортированы в Downloads.';

  @override
  String get failedToExportMacros => 'Не удалось экспортировать макросы.';

  @override
  String get failedToReadFile => 'Не удалось прочитать файл.';

  @override
  String get importFromExistingRemotesTitle => 'Импорт из существующих пультов';

  @override
  String selectedCount(int count) {
    return 'Выбрано: $count';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Другие пульты с кнопками не найдены.';

  @override
  String get sourceRemote => 'Исходный пульт';

  @override
  String get searchButtons => 'Поиск кнопок';

  @override
  String get searchButtonsHint => 'Питание, Громкость, Без звука...';

  @override
  String get selectVisible => 'Выбрать видимое';

  @override
  String get clearVisible => 'Очистить видимое';

  @override
  String protocolNamed(Object name) {
    return 'Протокол: $name';
  }

  @override
  String get rawSignal => 'Сырой';

  @override
  String get legacyCode => 'Старый код';

  @override
  String importCount(int count) {
    return 'Импорт $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Доступ к хранилищу отклонён, нужен на некоторых старых Android-устройствах.';

  @override
  String get backupExportedToDownloads => 'Копия экспортирована в Downloads.';

  @override
  String failedToExport(Object error) {
    return 'Не удалось экспортировать: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Импортировано пультов из старой JSON-копии: $count. Макросы не менялись.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Импорт не удался: backup \"remotes\" должен быть JSON-списком, если он присутствует.';

  @override
  String get importFailedMacrosMustBeList =>
      'Импорт не удался: backup \"macros\" должен быть JSON-списком, если он присутствует.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Импорт не удался: неверный формат backup, ожидался старый List или Map с remotes/macros.';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Импортировано пультов из копии: $remoteCount. Макросы не менялись.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Импортировано пультов: $remoteCount и макросов: $macroCount.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Импорт не удался: в файле .ir не найдено корректных кнопок.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Импортирован 1 пульт из Flipper .ir. Макросы не менялись.';

  @override
  String get importFailedInvalidIrplus =>
      'Импорт не удался: неверный файл irplus, корректные кнопки не найдены.';

  @override
  String get importedOneRemoteFromIrplus =>
      'Импортирован 1 пульт из irplus. Макросы не менялись.';

  @override
  String get importFailedInvalidLirc =>
      'Импорт не удался: неверный файл LIRC, корректные коды или raw-коды не найдены.';

  @override
  String get importedOneRemoteFromLirc =>
      'Импортирован 1 пульт из конфигурации LIRC. Макросы не менялись.';

  @override
  String get unsupportedFileTypeSelected =>
      'Выбран неподдерживаемый тип файла.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Импорт не удался: файл повреждён или нечитаем.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Массовый импорт завершён: поддерживаемых файлов в папке не найдено.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Массовый импорт завершён: пульты не импортированы. Пропущено файлов: $skippedCount.';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Массовый импорт завершён: импортировано пультов: $importedCount из поддерживаемых файлов: $supportedCount. Пропущено файлов: $skippedCount.';
  }

  @override
  String get storagePermissionDenied => 'Доступ к хранилищу отклонён.';

  @override
  String get bulkImportFailedReadFolder =>
      'Массовый импорт не удался: не удалось прочитать содержимое папки.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Массовый импорт завершён: поддерживаемых файлов не найдено, $sourceLabel.';
  }

  @override
  String get clearAction => 'Очистить';

  @override
  String get saveAction => 'Сохранить';

  @override
  String buttonsTitleCount(int count) {
    return 'Кнопки, $count';
  }

  @override
  String get invalidStepEncountered => 'Найден неверный шаг';

  @override
  String failedToSendNamed(Object name) {
    return 'Не удалось отправить: $name';
  }

  @override
  String get buttonNotFound => 'Кнопка не найдена';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Кнопка не найдена: $name';
  }

  @override
  String get unknownButton => 'Неизвестная кнопка';

  @override
  String durationSecondsShort(int seconds) {
    return '$secondsс';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '$minutesм $secondsс';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '$hoursч $minutesм';
  }

  @override
  String get orientationFlippedTooltip =>
      'Ориентация: перевёрнута, нажмите для норм.';

  @override
  String get orientationNormalTooltip =>
      'Ориентация: обычная, нажмите для переворота';

  @override
  String get noSteps => 'Нет шагов';

  @override
  String stepProgress(int current, int total) {
    return 'Шаг $current / $total';
  }

  @override
  String get completed => 'Готово';

  @override
  String get paused => 'Пауза';

  @override
  String get running => 'Выполняется';

  @override
  String get ready => 'Готово';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total шагов';
  }

  @override
  String get waiting => 'Ожидание';

  @override
  String secondsRemaining(Object seconds) {
    return 'Осталось $secondsс';
  }

  @override
  String millisecondsShort(int ms) {
    return '$msмс';
  }

  @override
  String get tapContinueWhenReady =>
      'Нажмите Продолжить, когда будете готовы к следующему шагу';

  @override
  String get error => 'Ошибка';

  @override
  String get macroCompleted => 'Макрос завершён';

  @override
  String finishedIn(Object duration) {
    return 'Завершено за $duration';
  }

  @override
  String get sequence => 'Последовательность';

  @override
  String waitMilliseconds(int ms) {
    return 'Ждать $msмс';
  }

  @override
  String get runAgain => 'Запустить снова';

  @override
  String get startMacro => 'Запустить макрос';

  @override
  String get continueAction => 'Продолжить';

  @override
  String get unnamedRemote => 'Безымянный пульт';

  @override
  String get enterMacroName => 'Введите имя макроса';

  @override
  String get addAtLeastOneStep => 'Добавьте хотя бы один шаг';

  @override
  String get fixInvalidSteps => 'Исправьте неверные шаги';

  @override
  String get unknownCommand => 'Неизвестная команда';

  @override
  String get unnamedCommand => 'Безымянная команда';

  @override
  String get iconCommand => 'Иконка Команда';

  @override
  String get selectDelay => 'Выбрать задержку';

  @override
  String keepMilliseconds(int ms) {
    return 'Оставить: $msмс';
  }

  @override
  String get custom => 'Свое';

  @override
  String get enterCustomDelayDuration => 'Введите свою длительность задержки';

  @override
  String millisecondsLong(int ms) {
    return '$ms миллисек.';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds сек$plural';
  }

  @override
  String get customDelay => 'Своя задержка';

  @override
  String get delayMillisecondsLabel => 'Задержка, мс';

  @override
  String get delayMillisecondsHint => 'напр., 3000';

  @override
  String get recommendedDelayRange =>
      'Рекомендуется: 250-5000 мс для большинства устройств';

  @override
  String get enterValidPositiveNumber =>
      'Введите корректное положительное число';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Пульт';

  @override
  String get macroName => 'Имя макроса';

  @override
  String get macroNameHint => 'напр., i-cybie Advanced Mode';

  @override
  String stepsTitleCount(int count) {
    return 'Шаги, $count';
  }

  @override
  String get noStepsYet => 'Шагов пока нет';

  @override
  String get addCommandsAndDelaysHint =>
      'Ниже добавьте команды и задержки, чтобы собрать последовательность';

  @override
  String get addStep => 'Добавить шаг';

  @override
  String get reorderStepsHint =>
      'Подсказка: перетаскивайте ручку, чтобы менять порядок шагов. Нажмите на шаг, чтобы изменить его.';

  @override
  String reorderStep(int index) {
    return 'Переставить шаг $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Зажмите и перетащите, чтобы изменить порядок шагов';

  @override
  String deleteStep(int index) {
    return 'Удалить шаг $index';
  }

  @override
  String get invalidStepTapToFix => 'Неверный шаг, нажмите для исправления';

  @override
  String get sendIrCommand => 'Отправить ИК-команду';

  @override
  String get waitForUserConfirmation => 'Ждать подтверждения пользователя';

  @override
  String get notImplemented => 'Не реализовано';

  @override
  String frequencyKhz(int value) {
    return '$value кГц';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Широкий';

  @override
  String get iconButton => 'Иконка кнопка';

  @override
  String get imageButton => 'Кнопка с изображением';

  @override
  String get noSignalInfo => 'Нет данных сигнала';

  @override
  String get proceed => 'Продолжить';

  @override
  String get discard => 'Отменить';

  @override
  String get idle => 'Ожидание';

  @override
  String get start => 'Старт';

  @override
  String get resume => 'Продолжить';

  @override
  String get pause => 'Пауза';

  @override
  String get stopped => 'Остановлено';

  @override
  String get copy => 'Копировать';

  @override
  String get send => 'Отправить';

  @override
  String get step => 'Шаг';

  @override
  String get addToRemote => 'Добавить в пульт';

  @override
  String get noDescriptionAvailable => 'Описание недоступно.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Vendor Kaseikyo должен состоять ровно из 4 hex-цифр.';

  @override
  String get irFinderDatabaseNotReady => 'База данных ещё не готова.';

  @override
  String get irFinderSelectBrandFirst => 'Сначала выберите бренд в настройке.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute-force для этого протокола пока недоступен.';

  @override
  String get irFinderInvalidPrefix => 'Неверный префикс.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Бренд: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Модель: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Клавиша: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Пульт #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Введите индекс с 0 в отфильтрованных и отсортированных результатах базы.';

  @override
  String get irFinderJumpCursorHelper =>
      'Введите hex-курсор с 0 в пространстве brute-force.';

  @override
  String get irFinderSetupTab => 'Настройка';

  @override
  String get irFinderTestTab => 'Тест';

  @override
  String get irFinderResultsTab => 'Результаты';

  @override
  String get irFinderContinueToTest => 'Перейти к тесту';

  @override
  String get irFinderKaseikyoVendorTitle => 'Vendor Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'Свой vendor, 4 hex';

  @override
  String get irFinderBrowseDbCandidates => 'Просмотреть кандидатов БД…';

  @override
  String get irFinderEditSetup => 'Изм. настройку';

  @override
  String get irFinderNoSavedHits =>
      'Сохранённых попаданий пока нет. На странице Тест нажмите \"Сохранить\", когда устройство ответит.';

  @override
  String get irFinderBackToTest => 'Назад к тесту';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Большое пространство поиска';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Это пространство brute-force очень велико, $human вариантов. IR Finder всё равно будет соблюдать лимит попыток и паузу, но не спамьте ИК-устройства.\n\nРекомендуется: сначала использовать режим База и, или, ввести известные байты префикса, чтобы сузить поиск.';
  }

  @override
  String get irFinderDatabaseSession => 'Сессия БД';

  @override
  String get irFinderBruteforceSession => 'Brute-force сессия';

  @override
  String get irFinderResumeLastSession => 'Продолжить последнюю сессию';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Бренд: $brand · Модель: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Префикс: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Прогресс: $progress · Начато: $when';
  }

  @override
  String get irFinderApplyResume => 'Применить и продолжить';

  @override
  String get irFinderBruteforceMode => 'Brute-force';

  @override
  String get irFinderDatabaseAssistedMode => 'С помощью БД';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Протокол: $name';
  }

  @override
  String get irFinderProtocolLabel => 'ИК-протокол';

  @override
  String get irFinderProtocolHelper =>
      'Управляет кодированием и, соответственно, пространством поиска.';

  @override
  String get irFinderKnownPrefixLabel =>
      'Известный префикс, hex-байты, необяз.';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Payload: $digits hex-цифр';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Payload: $digits hex-цифр · Пример: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Payload: $digits hex-цифр · Макс. префикс: $bytes байт';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Payload: $digits hex-цифр · Пример: $example · Макс. префикс: $bytes байт';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Пример: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Введите известные первые байты, чтобы сузить поиск.';

  @override
  String get irFinderDatabaseMode => 'База';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Нормализ. префикс: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Нормализ. префикс';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Brute-force для этого протокола пока не настроен.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Все, $value';
  }

  @override
  String get irFinderTestControls => 'Управление тестом';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Длина payload: $digits hex-цифр.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Пространство поиска: $value вариантов, после ограничений префикса.';
  }

  @override
  String get irFinderCooldownMs => 'Пауза, мс';

  @override
  String get irFinderMaxAttemptsPerRun => 'Макс. попыток за запуск';

  @override
  String get irFinderTestAllCombinations => 'Тестировать все комбинации';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Работает, пока пространство поиска не исчерпается. Эффективный лимит: $value';
  }

  @override
  String get irFinderAttempts => 'Попытки';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Диапазон ползунка: 1–$max, для больших значений введите число';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Макс\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Эффективный лимит этого запуска: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Подсказка: сначала используйте режим База; brute-force лучше работает с известным префиксом, например первыми 1–4 байтами.';

  @override
  String get irFinderDatabaseInitFailed => 'Не удалось инициализировать БД.';

  @override
  String get irFinderPreparingDatabase => 'Подготовка локальной базы ИК-кодов…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Поиск с помощью БД';

  @override
  String get irFinderBrand => 'Бренд';

  @override
  String get irFinderSelectBrand => 'Выберите бренд';

  @override
  String get irFinderModelOptional => 'Модель, необяз.';

  @override
  String get irFinderSelectBrandFirstShort => 'Сначала выберите бренд';

  @override
  String get irFinderSelectModelRecommended => 'Выберите модель, рекомендуется';

  @override
  String get irFinderOnlySelectedProtocol => 'Только выбранный протокол';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Фильтрует ключи по выбранному протоколу. Выключите, чтобы просматривать все протоколы.';

  @override
  String get irFinderQuickWinsFirst => 'Сначала быстрые попадания';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Сначала даёт приоритет ключам типа POWER, MUTE, VOL и CH, а уже потом более глубоким.';

  @override
  String get irFinderMaxKeysPerRun => 'Макс. ключей за запуск';

  @override
  String get irFinderTesting => 'Тестирование…';

  @override
  String get irFinderCooldown => 'Пауза';

  @override
  String get irFinderEta => 'Осталось';

  @override
  String get irFinderMode => 'Режим';

  @override
  String get irFinderRetryLast => 'Повторить последний';

  @override
  String get irFinderTrigger => 'Запуск';

  @override
  String get irFinderJump => 'Переход…';

  @override
  String get irFinderSaveHit => 'Сохранить';

  @override
  String irFinderEtaSeconds(int seconds) {
    return '$secondsс';
  }

  @override
  String irFinderEtaMinutesSeconds(int minutes, int seconds) {
    return '$minutesм $secondsс';
  }

  @override
  String irFinderEtaHoursMinutes(int hours, int minutes) {
    return '$hoursч $minutesм';
  }

  @override
  String irFinderLastAttemptedCode(Object value) {
    return 'Последний код: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Начните тест, чтобы увидеть последний отправленный код.';

  @override
  String irFinderFromDb(Object value) {
    return 'Из БД: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'Из brute-force, сгенерировано кодировщиком протокола.';

  @override
  String irFinderSendError(Object error) {
    return 'Ошибка отправки: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Источник: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Результаты можно сразу тестировать и копировать. Прямое добавление в пульт можно расширить позже в редакторе.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Просмотр кандидатов БД';

  @override
  String get irFinderFilterByLabelOrHex => 'Фильтр по метке или hex…';

  @override
  String get irFinderJumpHere => 'Перейти сюда';

  @override
  String get irFinderSelectModel => 'Выберите модель';

  @override
  String get irFinderSearchBrands => 'Поиск брендов…';

  @override
  String get irFinderSearchModels => 'Поиск моделей…';

  @override
  String get iconPickerTitle => 'Выбрать Иконка';

  @override
  String get iconPickerSearchHint => 'Поиск иконок...';

  @override
  String get iconPickerNoIconsFound => 'Иконки не найдены';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count иконок доступно';
  }

  @override
  String get iconPickerCategoryAll => 'Все';

  @override
  String get iconPickerCategoryMedia => 'Медиа';

  @override
  String get iconPickerCategoryVolume => 'Громкость';

  @override
  String get iconPickerCategoryNavigation => 'Навигация';

  @override
  String get iconPickerCategoryPower => 'Питание';

  @override
  String get iconPickerCategoryNumbers => 'Цифры';

  @override
  String get iconPickerCategorySettings => 'Настройки';

  @override
  String get iconPickerCategoryDisplay => 'Экран';

  @override
  String get iconPickerCategoryInput => 'Ввод';

  @override
  String get iconPickerCategoryFavorite => 'Избранное';

  @override
  String get universalPowerTitle => 'Универсальное питание';

  @override
  String get universalPowerRunTab => 'Запуск';

  @override
  String get universalPowerUseResponsibly => 'Используйте ответственно';

  @override
  String get universalPowerConsentBody =>
      'Универсальное питание перебирает ИК-коды питания. Используйте его только на устройствах, которыми владеете или управляете. Остановите сразу, как только устройство ответит.';

  @override
  String get universalPowerConsentCheckbox =>
      'Я владею устройством или управляю им';

  @override
  String get universalPowerSetupBody =>
      'Перебирает коды питания для выбранного бренда. Остановите, как только устройство ответит.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Последнее отправленное: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Коды питания не найдены. Попробуйте расширить поиск.';

  @override
  String get universalPowerUnableToStart => 'Не удалось запустить.';

  @override
  String get universalPowerAllBrands => 'Все бренды, без фильтра';

  @override
  String get universalPowerClearBrandFilter => 'Очистить фильтр бренда';

  @override
  String get universalPowerBroadenSearch => 'При необходимости расширьте поиск';

  @override
  String get universalPowerBroadenSearchHint =>
      'Если метки питания не найдены, включите другие ключи.';

  @override
  String get universalPowerAdditionalPatternsDepth => 'Глубина доп. паттернов';

  @override
  String get universalPowerDepth1 => 'Только приоритет: POWER/OFF';

  @override
  String get universalPowerDepth2 => 'Включить алиасы POWER';

  @override
  String get universalPowerDepth3 => 'Включить вторичные метки питания';

  @override
  String get universalPowerDepth4 => 'Включить все метки, низший приоритет';

  @override
  String get universalPowerLoopUntilStopped => 'Цикл до остановки';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Продолжает крутить очередь, пока вы не остановите.';

  @override
  String get universalPowerDelayBetweenCodes => 'Задержка между кодами';

  @override
  String get universalPowerStart => 'Запустить универсальное питание';

  @override
  String get universalPowerRunStatus => 'Статус запуска';

  @override
  String universalPowerProgress(Object value) {
    return 'Прогресс: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Приостановлено, так как приложение ушло в фон.';

  @override
  String get universalPowerSendOneCode => 'Отправить один код';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Остановить, как только устройство ответит.';

  @override
  String get iconNamePlay => 'Пуск';

  @override
  String get iconNamePause => 'Пауза';

  @override
  String get iconNameStop => 'Стоп';

  @override
  String get iconNameFastForward => 'Быстро вперёд';

  @override
  String get iconNameRewind => 'назад';

  @override
  String get iconNameSkipNext => 'След.';

  @override
  String get iconNameSkipPrevious => 'Пред.';

  @override
  String get iconNameReplay => 'Повтор';

  @override
  String get iconNameForward10S => 'Вперёд 10с';

  @override
  String get iconNameForward30S => 'Вперёд 30с';

  @override
  String get iconNameReplay10S => 'Повтор 10с';

  @override
  String get iconNameReplay30S => 'Повтор 30с';

  @override
  String get iconNameRecord => 'Запись';

  @override
  String get iconNameRecordAlt => 'Запись альт.';

  @override
  String get iconNameEject => 'Извлечь';

  @override
  String get iconNameShuffle => 'Случайно';

  @override
  String get iconNameRepeat => 'Повтор';

  @override
  String get iconNameRepeatOne => 'Повтор один';

  @override
  String get iconNameVolumeUp => 'Громкость +';

  @override
  String get iconNameVolumeDown => 'Громкость -';

  @override
  String get iconNameVolumeOff => 'Громкость выкл';

  @override
  String get iconNameMute => 'Без звука';

  @override
  String get iconNameSpeaker => 'Динамик';

  @override
  String get iconNameSurroundSound => 'Объёмный звук';

  @override
  String get iconNameEqualizer => 'Эквалайзер';

  @override
  String get iconNameAudio => 'Аудио';

  @override
  String get iconNameMicrophone => 'Микрофон';

  @override
  String get iconNameMicOff => 'Микр. выкл';

  @override
  String get iconNameUp => 'вверх';

  @override
  String get iconNameDown => 'вниз';

  @override
  String get iconNameLeft => 'влево';

  @override
  String get iconNameRight => 'вправо';

  @override
  String get iconNameArrowUp => 'Стрелка вверх';

  @override
  String get iconNameArrowDown => 'Стрелка вниз';

  @override
  String get iconNameArrowLeft => 'Стрелка влево';

  @override
  String get iconNameArrowRight => 'Стрелка вправо';

  @override
  String get iconNameNavigation => 'Навигация';

  @override
  String get iconNameChevronLeft => 'Шеврон влево';

  @override
  String get iconNameChevronRight => 'Шеврон вправо';

  @override
  String get iconNameExpandLess => 'Свернуть';

  @override
  String get iconNameExpandMore => 'Развернуть';

  @override
  String get iconNameCollapse => 'Свернуть';

  @override
  String get iconNameExpand => 'Развернуть';

  @override
  String get iconNameCircleUp => 'Круг вверх';

  @override
  String get iconNameCircleDown => 'Круг вниз';

  @override
  String get iconNameCircleLeft => 'Круг влево';

  @override
  String get iconNameCircleRight => 'Круг вправо';

  @override
  String get iconNameOkSelect => 'OK/Выбор';

  @override
  String get iconNameConfirm => 'Подтв.';

  @override
  String get iconNameCancel => 'Отмена';

  @override
  String get iconNameClose => 'Закрыть';

  @override
  String get iconNameHome => 'Домой';

  @override
  String get iconNameReturn => 'Назад';

  @override
  String get iconNameExit => 'Выход';

  @override
  String get iconNameUndo => 'Отменить';

  @override
  String get iconNameRedo => 'Повторить';

  @override
  String get iconNamePower => 'Питание';

  @override
  String get iconNamePowerAlt => 'Питание альт.';

  @override
  String get iconNamePowerOff => 'Питание выкл';

  @override
  String get iconNameOn => 'вкл';

  @override
  String get iconNameOff => 'выкл';

  @override
  String get iconNameToggleOn => 'Перекл. вкл';

  @override
  String get iconNameToggleOff => 'Перекл. выкл';

  @override
  String get iconNameRestart => 'Перезапуск';

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
  String get iconNameOne => 'один';

  @override
  String get iconNameTwo => 'Два';

  @override
  String get iconNameThree => 'Три';

  @override
  String get iconNameFour => 'Четыре';

  @override
  String get iconNameFive => 'Пять';

  @override
  String get iconNameSix => 'Шесть';

  @override
  String get iconNamePlus => 'плюс';

  @override
  String get iconNameMinus => 'минус';

  @override
  String get iconNameAddCircle => 'Добавить Круг';

  @override
  String get iconNameRemoveCircle => 'Убрать Круг';

  @override
  String get iconNameSettings => 'Настройки';

  @override
  String get iconNameMenu => 'Меню';

  @override
  String get iconNameMoreVertical => 'больше верт.';

  @override
  String get iconNameMoreHorizontal => 'больше гориз.';

  @override
  String get iconNameTune => 'Настройка';

  @override
  String get iconNameRemoteSettings => 'Пульт Настройки';

  @override
  String get iconNameInfo => 'Инфо';

  @override
  String get iconNameInfoOutline => 'Инфо контур';

  @override
  String get iconNameHelp => 'Помощь';

  @override
  String get iconNameHelpOutline => 'Помощь контур';

  @override
  String get iconNameList => 'Список';

  @override
  String get iconNameViewList => 'Вид Список';

  @override
  String get iconNameViewGrid => 'Вид Сетка';

  @override
  String get iconNameApps => 'Приложения';

  @override
  String get iconNameWidgets => 'Виджеты';

  @override
  String get iconNameTv => 'TV';

  @override
  String get iconNameMonitor => 'Монитор';

  @override
  String get iconNameDesktop => 'Раб. стол';

  @override
  String get iconNameBrightnessHigh => 'Высокая яркость';

  @override
  String get iconNameBrightnessMedium => 'Средняя яркость';

  @override
  String get iconNameBrightnessLow => 'Низкая яркость';

  @override
  String get iconNameAutoBrightness => 'Автояркость';

  @override
  String get iconNameLightMode => 'Светлый режим';

  @override
  String get iconNameDarkMode => 'Тёмный Режим';

  @override
  String get iconNameContrast => 'Контраст';

  @override
  String get iconNameHdrOn => 'HDR вкл';

  @override
  String get iconNameHdrOff => 'HDR выкл';

  @override
  String get iconNameAspectRatio => 'Соотношение сторон';

  @override
  String get iconNameCrop => 'Обрезка';

  @override
  String get iconNameZoomIn => 'Увеличить';

  @override
  String get iconNameZoomOut => 'Уменьшить';

  @override
  String get iconNameFullscreen => 'Полный экран';

  @override
  String get iconNameExitFullscreen => 'Выход Полный экран';

  @override
  String get iconNameFitScreen => 'Вписать Экран';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'Обрезка Своб.';

  @override
  String get iconNameInput => 'Ввод';

  @override
  String get iconNameCable => 'Кабель';

  @override
  String get iconNameCast => 'Трансляция';

  @override
  String get iconNameCastConnected => 'Трансляция подкл.';

  @override
  String get iconNameScreenShare => 'Экран Поделиться';

  @override
  String get iconNameBluetooth => 'Bluetooth';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => 'Роутер';

  @override
  String get iconNameMemory => 'Память';

  @override
  String get iconNameGameConsole => 'Игра Консоль';

  @override
  String get iconNameGaming => 'Игровой';

  @override
  String get iconNameMedia => 'Медиа';

  @override
  String get iconNameMusicQueue => 'Музыка Очередь';

  @override
  String get iconNameVideoLibrary => 'Видео Библиотека';

  @override
  String get iconNamePhotoLibrary => 'Фото Библиотека';

  @override
  String get iconNameComponent => 'Компонент';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => 'Composite';

  @override
  String get iconNameAntenna => 'Антенна';

  @override
  String get iconNameFavorite => 'Избранное';

  @override
  String get iconNameFavoriteOutline => 'Избранное контур';

  @override
  String get iconNameStar => 'Звезда';

  @override
  String get iconNameStarOutline => 'Звезда контур';

  @override
  String get iconNameBookmark => 'Закладка';

  @override
  String get iconNameBookmarkOutline => 'Закладка контур';

  @override
  String get iconNameFlag => 'Флаг';

  @override
  String get iconNameCheck => 'Галочка';

  @override
  String get iconNameDone => 'Готово';

  @override
  String get iconNameDoneAll => 'Готово Все';

  @override
  String get iconNameSchedule => 'Расписание';

  @override
  String get iconNameTimer => 'Таймер';

  @override
  String get iconNameTime => 'Время';

  @override
  String get iconNameAlarm => 'Будильник';

  @override
  String get iconNameNotifications => 'Уведомления';

  @override
  String get iconNameLock => 'Замок';

  @override
  String get iconNameUnlock => 'Разблок.';

  @override
  String get iconNameLight => 'Свет';

  @override
  String get iconNameLightOutline => 'Свет контур';

  @override
  String get iconNameWarmLight => 'Тёплый свет';

  @override
  String get iconNameSunny => 'Солнце';

  @override
  String get iconNameCloudy => 'Облачно';

  @override
  String get iconNameNight => 'Ночь';

  @override
  String get iconNameFlare => 'Блик';

  @override
  String get iconNameGradient => 'Градиент';

  @override
  String get iconNameInvertColors => 'Инверсия цветов';

  @override
  String get iconNamePalette => 'Палитра';

  @override
  String get iconNameColor => 'Цвет';

  @override
  String get iconNameTonality => 'Тональность';

  @override
  String get iconNameSearch => 'Поиск';

  @override
  String get iconNameRefresh => 'Обновить';

  @override
  String get iconNameSync => 'Синхр.';

  @override
  String get iconNameUpdate => 'Обновить';

  @override
  String get iconNameDownload => 'Скачать';

  @override
  String get iconNameUpload => 'Загрузить';

  @override
  String get iconNameCloud => 'Облако';

  @override
  String get iconNameFolder => 'Папка';

  @override
  String get iconNameDelete => 'Удалить';

  @override
  String get iconNameEdit => 'Изменить';

  @override
  String get iconNameSave => 'Сохранить';

  @override
  String get iconNameShare => 'Поделиться';

  @override
  String get iconNamePrint => 'Печать';

  @override
  String get iconNameLanguage => 'Язык';

  @override
  String get iconNameTranslate => 'Перевод';

  @override
  String get iconNameMicNone => 'Микр. нет';

  @override
  String get iconNameSubtitles => 'Субтитры';

  @override
  String get iconNameClosedCaption => 'Субтитры';

  @override
  String get iconNameMusic => 'Музыка';

  @override
  String get iconNameMovie => 'Фильм';

  @override
  String get iconNameTheater => 'Кинотеатр';

  @override
  String get iconNameLiveTv => 'Live TV';

  @override
  String get iconNameRadio => 'Радио';

  @override
  String get iconNameCamera => 'Камера';

  @override
  String get iconNameVideoCamera => 'Видео Камера';

  @override
  String get iconNamePhotoCamera => 'Фото Камера';

  @override
  String get iconNameSlowMotion => 'Замедление';

  @override
  String get iconNameSpeed => 'Скорость';

  @override
  String get iconNameVideoSettings => 'Видео Настройки';

  @override
  String get iconNameAudioTrack => 'Аудиотрек';

  @override
  String get iconNameGraphicEq => 'Графический EQ';

  @override
  String get iconNameMusicVideo => 'Музыка Видео';

  @override
  String get iconNamePlaylist => 'Плейлист';

  @override
  String get iconNameQueue => 'Очередь';

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
  String get iconNameHashFa => 'Решётка # FA';

  @override
  String get iconNamePercentFa => 'Процент % FA';

  @override
  String get iconNameDivideFa => 'Деление ÷ FA';

  @override
  String get iconNameMultiplyFa => 'Умножение × FA';

  @override
  String get iconNameEqualsFa => 'Равно = FA';

  @override
  String get iconNameNotEqualFa => 'Не равно ≠ FA';

  @override
  String get iconNameGreaterThanFa => 'Больше чем > FA';

  @override
  String get iconNameLessThanFa => 'меньше чем < FA';

  @override
  String get iconNameAsteriskFa => 'Звёздочка * FA';

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
  String get iconNamePlayFa => 'Пуск FA';

  @override
  String get iconNamePauseFa => 'Пауза FA';

  @override
  String get iconNameStopFa => 'Стоп FA';

  @override
  String get iconNamePlayFaOutline => 'Пуск FA контур';

  @override
  String get iconNamePauseFaOutline => 'Пауза FA контур';

  @override
  String get iconNameStopFaOutline => 'Стоп FA контур';

  @override
  String get iconNameBackwardFa => 'Назад FA';

  @override
  String get iconNameForwardFa => 'вперёд FA';

  @override
  String get iconNamePreviousFa => 'Пред. FA';

  @override
  String get iconNameNextFa => 'След. FA';

  @override
  String get iconNameRewindFa => 'назад FA';

  @override
  String get iconNameFastForwardFa => 'Быстро вперёд FA';

  @override
  String get iconNameRepeatFa => 'Повтор FA';

  @override
  String get iconNameShuffleFa => 'Случайно FA';

  @override
  String get iconNameEjectFa => 'Извлечь FA';

  @override
  String get iconNameFilmFa => 'Фильм FA';

  @override
  String get iconNameVideoFa => 'Видео FA';

  @override
  String get iconNameMusicFa => 'Музыка FA';

  @override
  String get iconNameMicrophoneFa => 'Микрофон FA';

  @override
  String get iconNameCameraFa => 'Камера FA';

  @override
  String get iconNameCameraRetroFa => 'Камера ретро FA';

  @override
  String get iconNameVolumeHighFa => 'Громкость Высокая FA';

  @override
  String get iconNameVolumeLowFa => 'Громкость Низкая FA';

  @override
  String get iconNameVolumeOffFa => 'Громкость выкл FA';

  @override
  String get iconNameMuteFa => 'Без звука FA';

  @override
  String get iconNameMicMuteFa => 'Микр. Без звука FA';

  @override
  String get iconNameHeadphonesFa => 'Наушники FA';

  @override
  String get iconNameSpeakerFa => 'Динамик FA';

  @override
  String get iconNameUpFa => 'вверх FA';

  @override
  String get iconNameDownFa => 'вниз FA';

  @override
  String get iconNameLeftFa => 'влево FA';

  @override
  String get iconNameRightFa => 'вправо FA';

  @override
  String get iconNameUpFaOutline => 'вверх FA контур';

  @override
  String get iconNameDownFaOutline => 'вниз FA контур';

  @override
  String get iconNameLeftFaOutline => 'влево FA контур';

  @override
  String get iconNameRightFaOutline => 'вправо FA контур';

  @override
  String get iconNameArrowUpFa => 'Стрелка вверх FA';

  @override
  String get iconNameArrowDownFa => 'Стрелка вниз FA';

  @override
  String get iconNameArrowLeftFa => 'Стрелка влево FA';

  @override
  String get iconNameArrowRightFa => 'Стрелка вправо FA';

  @override
  String get iconNameChevronUpFa => 'Шеврон вверх FA';

  @override
  String get iconNameChevronDownFa => 'Шеврон вниз FA';

  @override
  String get iconNameChevronLeftFa => 'Шеврон влево FA';

  @override
  String get iconNameChevronRightFa => 'Шеврон вправо FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA контур';

  @override
  String get iconNameCheckFa => 'Галочка FA';

  @override
  String get iconNameCloseFa => 'Закрыть FA';

  @override
  String get iconNameCloseCircleFa => 'Закрыть Круг FA';

  @override
  String get iconNameHomeFa => 'Домой FA';

  @override
  String get iconNameUndoFa => 'Отменить FA';

  @override
  String get iconNameRedoFa => 'Повторить FA';

  @override
  String get iconNameRotateFa => 'Повернуть FA';

  @override
  String get iconNameSearchFa => 'Поиск FA';

  @override
  String get iconNameRefreshFa => 'Обновить FA';

  @override
  String get iconNamePowerOffFa => 'Питание выкл FA';

  @override
  String get iconNamePlugFa => 'Штекер FA';

  @override
  String get iconNameToggleOnFa => 'Перекл. вкл FA';

  @override
  String get iconNameToggleOffFa => 'Перекл. выкл FA';

  @override
  String get iconNameSettingsFa => 'Настройки FA';

  @override
  String get iconNameSettingsAltFa => 'Настройки альт. FA';

  @override
  String get iconNameMenuFa => 'Меню FA';

  @override
  String get iconNameMoreFa => 'больше FA';

  @override
  String get iconNameMoreVerticalFa => 'больше верт. FA';

  @override
  String get iconNameInfoFa => 'Инфо FA';

  @override
  String get iconNameInfoFaOutline => 'Инфо FA контур';

  @override
  String get iconNameHelpFa => 'Помощь FA';

  @override
  String get iconNameHelpFaOutline => 'Помощь FA контур';

  @override
  String get iconNameListFa => 'Список FA';

  @override
  String get iconNameGridFa => 'Сетка FA';

  @override
  String get iconNameSlidersFa => 'Ползунки FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'Монитор FA';

  @override
  String get iconNameDesktopFa => 'Раб. стол FA';

  @override
  String get iconNameBrightnessFa => 'Яркость FA';

  @override
  String get iconNameNightModeFa => 'Ночь Режим FA';

  @override
  String get iconNameLightFa => 'Свет FA';

  @override
  String get iconNameLightFaOutline => 'Свет FA контур';

  @override
  String get iconNameFlashFa => 'Вспышка FA';

  @override
  String get iconNameFullscreenFa => 'Полный экран FA';

  @override
  String get iconNameExitFullscreenFa => 'Выход Полный экран FA';

  @override
  String get iconNameZoomInFa => 'Увеличить FA';

  @override
  String get iconNameZoomOutFa => 'Уменьшить FA';

  @override
  String get iconNameSubtitlesFa => 'Субтитры FA';

  @override
  String get iconNamePictureInPictureFa => 'Картинка в картинке FA';

  @override
  String get iconNameColorFa => 'Цвет FA';

  @override
  String get iconNamePaintFa => 'Краска FA';

  @override
  String get iconNameInputFa => 'Ввод FA';

  @override
  String get iconNameWifiFa => 'WiFi FA';

  @override
  String get iconNameBluetoothFa => 'Bluetooth FA';

  @override
  String get iconNameUsbFa => 'USB FA';

  @override
  String get iconNameEthernetFa => 'Ethernet FA';

  @override
  String get iconNameGamepadFa => 'Геймпад FA';

  @override
  String get iconNameBroadcastFa => 'Эфир FA';

  @override
  String get iconNameSatelliteFa => 'Спутник FA';

  @override
  String get iconNameAntennaFa => 'Антенна FA';

  @override
  String get iconNameNetworkFa => 'Сеть FA';

  @override
  String get iconNameCloudFa => 'Облако FA';

  @override
  String get iconNameStarFa => 'Звезда FA';

  @override
  String get iconNameStarFaOutline => 'Звезда FA контур';

  @override
  String get iconNameHeartFa => 'Сердце FA';

  @override
  String get iconNameHeartFaOutline => 'Сердце FA контур';

  @override
  String get iconNameBookmarkFa => 'Закладка FA';

  @override
  String get iconNameBookmarkFaOutline => 'Закладка FA контур';

  @override
  String get iconNameFlagFa => 'Флаг FA';

  @override
  String get iconNameClockFa => 'Часы FA';

  @override
  String get iconNameClockFaOutline => 'Часы FA контур';

  @override
  String get iconNameBellFa => 'Колокол FA';

  @override
  String get iconNameBellFaOutline => 'Колокол FA контур';

  @override
  String get iconNameTimerFa => 'Таймер FA';

  @override
  String get iconNameLockFa => 'Замок FA';

  @override
  String get iconNameUnlockFa => 'Разблок. FA';

  @override
  String get iconNameGalleryFa => 'Галерея FA';

  @override
  String get iconNameImagesFa => 'Изображения FA';

  @override
  String get iconNameImageFa => 'Изображение FA';

  @override
  String get iconNameVideoFileFa => 'Видео Файл FA';

  @override
  String get iconNameAudioFileFa => 'Аудио Файл FA';

  @override
  String get iconNamePlayOutlineFa => 'Пуск контур FA';

  @override
  String get iconNamePlaySimpleFa => 'Пуск Простой FA';

  @override
  String get iconNamePauseSimpleFa => 'Пауза Простой FA';

  @override
  String get iconNameStopSimpleFa => 'Стоп Простой FA';

  @override
  String get iconNameRecordFa => 'Запись FA';

  @override
  String get iconNameStopCircleFa => 'Стоп Круг FA';

  @override
  String get iconNameLoadingFa => 'Загрузка FA';

  @override
  String get iconNameTextFa => 'Текст FA';

  @override
  String get iconNameTextSizeFa => 'Размер текста FA';

  @override
  String get iconNameLanguageFa => 'Язык FA';

  @override
  String get iconNameGlobeFa => 'Глобус FA';

  @override
  String get iconNameSubtitlesAltFa => 'Субтитры альт. FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Субтитры альт. контур FA';

  @override
  String get iconNameChannelUpFa => 'Канал вверх FA';

  @override
  String get iconNameChannelDownFa => 'Канал вниз FA';

  @override
  String get iconNamePageUpFa => 'Страница вверх FA';

  @override
  String get iconNamePageDownFa => 'Страница вниз FA';

  @override
  String get iconNameGuideFa => 'Гид FA';

  @override
  String get iconNameGridViewFa => 'Сетка Вид FA';

  @override
  String get iconNameGridAltFa => 'Сетка альт. FA';

  @override
  String get iconNameScheduleFa => 'Расписание FA';

  @override
  String get iconNameCalendarFa => 'Календарь FA';

  @override
  String get iconNameRedButtonFa => 'Красная Кнопка FA';

  @override
  String get iconNameButtonOutlineFa => 'Кнопка контур FA';

  @override
  String get iconNameSquareButtonFa => 'Квадрат Кнопка FA';

  @override
  String get iconNameSquareOutlineFa => 'Квадрат контур FA';

  @override
  String get iconNameDotCircleFa => 'Точка круг FA';

  @override
  String get iconNameToolsFa => 'Инструменты FA';

  @override
  String get iconNameScrewdriverFa => 'Отвёртка FA';

  @override
  String get iconNameHammerFa => 'Молоток FA';

  @override
  String get iconNameToolboxFa => 'Ящик FA';

  @override
  String get iconNameCogFa => 'Шестерня FA';

  @override
  String get iconNameAdjustFa => 'Настройка FA';

  @override
  String get iconNameFilterFa => 'Фильтр FA';

  @override
  String get iconNameSortDownFa => 'Сортировка вниз FA';

  @override
  String get iconNameSortUpFa => 'Сортировка вверх FA';

  @override
  String get iconNameSleepFa => 'Сон FA';

  @override
  String get iconNameTimerStartFa => 'Таймер старт FA';

  @override
  String get iconNameTimerHalfFa => 'Таймер половина FA';

  @override
  String get iconNameTimerEndFa => 'Таймер конец FA';

  @override
  String get iconNameStopwatchFa => 'Секундомер FA';

  @override
  String get iconNameAlarmFa => 'Будильник FA';

  @override
  String get iconNameCropAltFa => 'Обрезка альт. FA';

  @override
  String get iconNameCropFa => 'Обрезка FA';

  @override
  String get iconNameSquareFullFa => 'Квадрат Полная FA';

  @override
  String get iconNameFullscreenAltFa => 'Полный экран альт. FA';

  @override
  String get iconNameZoomPlusFa => 'Масштаб плюс FA';

  @override
  String get iconNameZoomMinusFa => 'Масштаб минус FA';

  @override
  String get iconNameMusicNoteFa => 'Музыка Нота FA';

  @override
  String get iconNameCdFa => 'CD FA';

  @override
  String get iconNameVinylFa => 'Винил FA';

  @override
  String get iconNameRssFa => 'RSS FA';

  @override
  String get iconNameMagicFa => 'Магия FA';

  @override
  String get iconNameFingerprintFa => 'Отпечаток FA';

  @override
  String get iconNameUserFa => 'Пользователь FA';

  @override
  String get iconNameUsersFa => 'Пользователи FA';

  @override
  String get iconNameChildModeFa => 'Детский Режим FA';

  @override
  String get iconNameCastFa => 'Трансляция FA';

  @override
  String get iconNameStreamFa => 'Поток FA';

  @override
  String get iconNameSignalFa => 'Сигнал FA';

  @override
  String get iconNameFeedFa => 'Лента FA';

  @override
  String get iconNameCircleArrowUpFa => 'Круг Стрелка вверх FA';

  @override
  String get iconNameCircleArrowDownFa => 'Круг Стрелка вниз FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Круг Стрелка влево FA';

  @override
  String get iconNameCircleArrowRightFa => 'Круг Стрелка вправо FA';

  @override
  String get iconNameLongArrowUpFa => 'Длинная Стрелка вверх FA';

  @override
  String get iconNameLongArrowDownFa => 'Длинная Стрелка вниз FA';

  @override
  String get iconNameLongArrowLeftFa => 'Длинная Стрелка влево FA';

  @override
  String get iconNameLongArrowRightFa => 'Длинная Стрелка вправо FA';

  @override
  String get iconNamePlusFa => 'плюс FA';

  @override
  String get iconNameMinusFa => 'минус FA';

  @override
  String get iconNamePlusCircleFa => 'плюс Круг FA';

  @override
  String get iconNameMinusCircleFa => 'минус Круг FA';

  @override
  String get iconNamePlusSquareFa => 'плюс Квадрат FA';

  @override
  String get iconNameMinusSquareFa => 'минус Квадрат FA';

  @override
  String get iconNameTimesFa => '× FA';

  @override
  String get iconNameTimesCircleFa => '× Круг FA';

  @override
  String get iconNameBatteryFullFa => 'Батарея Полная FA';

  @override
  String get iconNameBattery34Fa => 'Батарея 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'Батарея Половина FA';

  @override
  String get iconNameBattery14Fa => 'Батарея 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'Батарея Пустая FA';

  @override
  String get iconNameChargingFa => 'Зарядка FA';

  @override
  String get iconNameCloudSunFa => 'Облако Солнце FA';

  @override
  String get iconNameCloudMoonFa => 'Облако Луна FA';

  @override
  String get iconNameRainFa => 'Дождь FA';

  @override
  String get iconNameSnowflakeFa => 'Снежинка FA';

  @override
  String get iconNameFireFa => 'Огонь FA';

  @override
  String get iconNameTemperatureFa => 'Температура FA';

  @override
  String get iconNameBoxFa => 'Блок FA';

  @override
  String get iconNameGiftFa => 'Подарок FA';

  @override
  String get iconNameTrophyFa => 'Трофей FA';

  @override
  String get iconNameCrownFa => 'Корона FA';

  @override
  String get iconNameGemFa => 'Самоцвет FA';

  @override
  String get unknownLabel => 'Неизвестно';

  @override
  String get selectedFilesLabel => 'выбранных файлов';

  @override
  String get folderNotFoundOrInaccessible => 'Папка не найдена или недоступна.';

  @override
  String get importedRemoteDefaultName => 'Импортированный пульт';

  @override
  String get demoRemoteName => 'Демо-пульт';

  @override
  String get protocolFieldsInvalid =>
      'Заполните обязательные поля протокола и убедитесь, что частота, если задана, находится в диапазоне 15–60 кГц.';

  @override
  String get unknownProtocolSelected => 'Выбран неизвестный протокол.';
}
