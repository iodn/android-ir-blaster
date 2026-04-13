// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Завантаження…';

  @override
  String get unknownError => 'Невідома помилка';

  @override
  String get failedToStart => 'Не вдалося запустити';

  @override
  String get retry => 'Повторити';

  @override
  String get quickTilePower => 'Живлення';

  @override
  String get quickTileMute => 'Без звуку';

  @override
  String get quickTileVolumeUp => 'Гучн. +';

  @override
  String get quickTileVolumeDown => 'Гучн. -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'У цьому телефоні немає вбудованого ІЧ-передавача. USB ІЧ-адаптер знайдено, але дозвіл ще не надано.\n\nНадайте USB-дозвіл, щоб надсилати ІЧ.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'У цьому телефоні немає вбудованого ІЧ-передавача. USB ІЧ-адаптер знайдено, але в USB-дозволі відмовлено.\n\nЗапитайте дозвіл знову і підтвердьте запит, щоб надсилати ІЧ.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'У цьому телефоні немає вбудованого ІЧ-передавача. USB ІЧ-адаптер дозволено, але його ще не ініціалізовано.';

  @override
  String get homeUsbOpenFailedMessage =>
      'У цьому телефоні немає вбудованого ІЧ-передавача. USB ІЧ-адаптер знайдено та дозволено, але його не вдалося ініціалізувати.\n\nПерепідключіть адаптер і спробуйте знову.';

  @override
  String get homeUsbReadyMessage =>
      'У цьому телефоні немає вбудованого ІЧ-передавача.';

  @override
  String get homeUsbNoDeviceMessage =>
      'У цьому телефоні немає вбудованого ІЧ-передавача, і зараз не підключено жодного підтримуваного USB ІЧ-адаптера.\n\nВи все ще можете створювати, імпортувати й керувати пультами, але для передавання ІЧ-сигналів потрібен один із варіантів нижче.';

  @override
  String get homeUsbOptionPlugIn =>
      'Підключіть підтримуваний USB ІЧ-адаптер, а потім надайте дозвіл.';

  @override
  String get homeUsbOptionReady => 'Готово до використання.';

  @override
  String get homeUsbOptionPermissionRequired => 'Підключено. Потрібен дозвіл.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'У дозволі відмовлено. Запитайте знову.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Дозволено. Ініціалізація адаптера.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Авторизовано, але инициализация не удалась.';

  @override
  String get homeHardwareBannerNoInternal =>
      'В телефоні немає встроенного ІЧ. Підключіть USB ІЧ-адаптер або включите режим Аудіо в настройках.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'USB-адаптер знайдено. Для отправки ІЧ потрібен дозвіл.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Дозвіл USB відхилено. Запитайте його знову для отправки ІЧ.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'USB-адаптер авторизован. Ожидание инициализации.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'USB-адаптер авторизован, але инициализация не удалась.';

  @override
  String get homeHardwareBannerReady => 'USB готов.';

  @override
  String get homeHardwareRequiredTitle =>
      'Для отправки команд потрібно ІЧ-обладнання';

  @override
  String get homeUsbDongleRecommended => 'USB ІЧ-адаптер, рекомендуется';

  @override
  String get homeAudioAdapterAlternative => 'Аудіо ІЧ-адаптер, альтернатива';

  @override
  String get homeAudioAdapterDescription =>
      'Налаштування → ІЧ-передавач → Аудіо (1 LED / 2 LED). Потрібен аудіо-ІЧ адаптер.';

  @override
  String get close => 'Закрити';

  @override
  String get homeChooseTransmitter => 'Виберіть передавач';

  @override
  String get openSettings => 'Відкрити налаштування';

  @override
  String get homeUsbPermissionSentApprove =>
      'Запит дозволу USB отправлен. Підтвердьте його, щоб увімкнути USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'Підтримуваний USB ІЧ-адаптер не знайдено. Підключіть його і попробуйте знову.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Не вдалося запросить дозвіл USB.';

  @override
  String get working => 'Виконується…';

  @override
  String get requestUsbPermission => 'Запросить дозвіл USB';

  @override
  String get homeHardwareTip =>
      'Підказка: ви вже можете створювати і упорядковувати пульти. Обладнання потрібно лише для передавання.';

  @override
  String get homeNoIrTransmitterTitle => 'Немає ІЧ-передавача';

  @override
  String get homeHardwareRequiredBody =>
      'IR Blaster може створювати й керувати пультами на будь-якому телефоні. Але для фактичного надсилання інфрачервоних команд пристрою потрібен один із наведених нижче варіантів обладнання.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Ви вже можете створювати, імпортувати й упорядковувати пульти просто зараз.';

  @override
  String get homeWaysToUseIrBlaster => 'Як користуватися IR Blaster';

  @override
  String get homeBuiltInIrOptionTitle => 'Телефон із вбудованим IR';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Працює на підтримуваних телефонах із вбудованим IR-передавачем. У цьому телефоні його немає.';

  @override
  String get homeBuiltInIrUnavailable => 'Недоступно на цьому телефоні';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'Аудіоадаптер 3,5 мм';

  @override
  String get homeContinueWithoutHardware => 'Продовжити без обладнання';

  @override
  String get homeHowItWorks => 'Як це працює';

  @override
  String get settingsNavLabel => 'Налаштування';

  @override
  String get dismiss => 'Закрити';

  @override
  String get remotesNavLabel => 'Пульти';

  @override
  String get macrosNavLabel => 'Макроси';

  @override
  String get signalTesterNavLabel => 'Тестер сигнала';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get remoteNoIrEmitterTitle => 'Немає ІЧ-передавача';

  @override
  String get remoteNoIrEmitterMessage =>
      'На цьому пристрої немає ІЧ-передавача';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Для роботи застосунку потрібен ІЧ-передавач';

  @override
  String get remoteDismiss => 'Закрити';

  @override
  String get remoteClose => 'Закрити';

  @override
  String remoteFailedToSend(Object error) {
    return 'Не вдалося надіслати ІЧ: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Не вдалося запустити цикл: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Цикл зупинено (надсилання не вдалося): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Цикл \"$title\". Натисніть Стоп зверху, щоб зупинити.';
  }

  @override
  String get remoteLoopStopped => 'Цикл зупинено.';

  @override
  String get remoteUpdatedNotFound =>
      'Пульт оновлено на екрані. В збереженому списку он не знайдено.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Оновлено \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Не вдалося видалити: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'Пульт не знайдено в збереженому списку.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Видалено \"$name\".';
  }

  @override
  String get buttonFallbackTitle => 'Кнопка';

  @override
  String get imageFallbackTitle => 'Изобр.';

  @override
  String get noBrowserAvailable => 'Браузер недоступен';

  @override
  String failedToOpen(Object error) {
    return 'Не вдалося відкрити: $error';
  }

  @override
  String get cancel => 'Скасування';

  @override
  String get settingsRestoreDemoTitle => 'Відновити демо-пульти?';

  @override
  String get settingsRestoreDemoMessage =>
      'Це замінить поточні пульти вбудованими демо-пультами. Якщо хочете зберегти текущий список, краще спочатку зробити копію.';

  @override
  String get settingsRestoreDemoConfirm => 'Відновити демо';

  @override
  String get settingsDemoRemotesRestored => 'Демо-пульти відновлено.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Видалити все пульти?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Це видалить все пульти з пристрою. Дію не можна скасувати.';

  @override
  String get settingsDeleteAllConfirm => 'Видалити усе';

  @override
  String get settingsAllRemotesDeleted => 'Все пульти видалено.';

  @override
  String get themeAuto => 'Автотема';

  @override
  String get themeLight => 'Світла тема';

  @override
  String get themeDark => 'Темна тема';

  @override
  String get themeDescAuto => 'Слідує настройкам пристрою';

  @override
  String get themeDescLight => 'Завжди светло і ясно';

  @override
  String get themeDescDark => 'Комфортно для глаз';

  @override
  String get themeHintAuto =>
      'Тема автоматично змінюється при перемиканні пристрою між світлим і темним режимом';

  @override
  String get themeHintLight =>
      'Идеально для денного світла і добре освітлених місць';

  @override
  String get themeHintDark =>
      'Снижает навантаження на очі при слабкому свете і економить батарею на OLED';

  @override
  String get supportDevelopmentTitle => 'Поддержать разработку';

  @override
  String get supportDevelopmentSubtitle =>
      'Помогите поддерживать IR Blaster і сумісність з обладнанням';

  @override
  String get supportDevelopmentBody =>
      'Без реклами, Без трекинга, Без закритих функцій. Ваша підтримка йде на роботу з протоколами, підтримку USB-адаптерів і кращу сумісність пристроїв.';

  @override
  String get donate => 'Поддержать';

  @override
  String get starRepo => 'Поставить звезду';

  @override
  String get repositoryLinkCopied => 'Посилання на репозиторій скопійовано';

  @override
  String get supportPillLocalOnly => 'Лише локально';

  @override
  String get supportPillNoTracking => 'Без трекинга';

  @override
  String get supportPillHardwareAware => 'З урахуванням железа';

  @override
  String get supportPillOpenSource => 'Open source';

  @override
  String get appearanceTitle => 'Внешний вид';

  @override
  String get appearanceSubtitle => 'Настройте внешний вид приложения';

  @override
  String get localizationTitle => 'Локализация';

  @override
  String get localizationSubtitle => 'Мова приложения і поведение перекладу';

  @override
  String localizationAutoUsing(Object language) {
    return 'Авто: використовується $language';
  }

  @override
  String get localizationAutoDescription =>
      'Застосунок використовує мова пристрою, якщо можливо.';

  @override
  String get localizationManualDescription => 'Мова приложения задан вручную.';

  @override
  String get useSystemLanguageTitle => 'Мова системи';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Використовується мова пристрою: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Використовувати мова, вибраний нижче, замість мови пристрою.';

  @override
  String get chooseAppLanguage => 'Виберіть мова';

  @override
  String get languagePickerDisabledHint =>
      'Отключите системна мова, щоб вибрати мова вручную.';

  @override
  String get searchLanguages => 'Пошук мов';

  @override
  String get noLanguagesFound => 'Немає совпадений';

  @override
  String get localizationHint =>
      'Коли увімкнено системна мова, приложение слідує локалі пристрою і відкочується к англійської, якщо перекладу немає. Вимкніть це, щоб зафіксувати конкретну мова.';

  @override
  String get appLanguageTitle => 'Мова приложения';

  @override
  String get appLanguageHint =>
      'За умолчанию використовується мова пристрою. Здесь можна принудительно вибрати лише English або Français для приложения.';

  @override
  String get languageAuto => 'Авто (система)';

  @override
  String get languageAutoDescription =>
      'Автоматично використовувати мова пристрою';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageEnglishDescription => 'Завжди використовувати English';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageFrenchDescription => 'Завжди використовувати Français';

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
  String get themeChoiceLight => 'Світла';

  @override
  String get themeChoiceDark => 'Темна';

  @override
  String get irTransmitterTitle => 'ІЧ-передавач';

  @override
  String get irTransmitterSubtitle =>
      'Виберіть, яке обладнання надсилає ІЧ-команди';

  @override
  String get learningModeEntryTitle => 'Режим навчання';

  @override
  String get learningModeEntrySubtitle =>
      'Крок за кроком зніміть кнопку з фізичного пульта дистанційного керування';

  @override
  String get learningModeTitle => 'Режим навчання';

  @override
  String get learningModeHeroTitle => 'Вивчіть кнопку дистанційного керування';

  @override
  String get learningModeHeroSubtitle =>
      'Налаштуйте приймач, підготуйте оригінальний пульт дистанційного керування, запишіть одну команду, а потім перегляньте її, перш ніж зберегти на пульті дистанційного керування.';

  @override
  String get learningModeReadyBadge => 'Приймач готовий';

  @override
  String get learningModeNeedsPermissionBadge => 'Потрібен дозвіл USB';

  @override
  String get learningModeSetupBadge => 'Необхідно налаштувати приймач';

  @override
  String get learningModeNoReceiverBadge => 'Немає приймача навчання';

  @override
  String get learningModeCheckingBadge => 'Перевірка обладнання';

  @override
  String get learningModeFourStepFlow => '4-кроковий керований потік';

  @override
  String get learningModeSaveAnywhereBadge => 'Перегляньте перед збереженням';

  @override
  String get learningModeGuideTitle =>
      'Підніміть там, де має відбутися захоплення';

  @override
  String get learningModeStepHardwareShort => 'Обладнання';

  @override
  String get learningModeStepPrepareShort => 'Приготуйте';

  @override
  String get learningModeStepCaptureShort => 'захоплення';

  @override
  String get learningModeStepReviewShort => 'огляд';

  @override
  String get learningModeStepHardwareTitle => 'Перевірте обладнання приймача';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Перед початком перевірте, чи під’єднано та авторизовано сумісний навчальний приймач.';

  @override
  String get learningModeCurrentSenderLabel => 'Передавач струму';

  @override
  String get learningModeReceiverStatusLabel => 'Статус навчання';

  @override
  String get learningModeCheckingHardwareBody =>
      'Перевірка доступного стану передавача та приймача USB.';

  @override
  String get learningModeHardwareReadyBody =>
      'ІЧ-ключ USB під’єднано та ініціалізовано. Це правильне місце для початку процесу навчання після підключення проводки захоплення.';

  @override
  String get learningModeHardwarePermissionBody =>
      'USB-ключ є, але дозвіл Android усе ще блокує його. Надайте дозвіл USB у розділі передавача перед навчанням.';

  @override
  String get learningModeHardwareSetupBody =>
      'Ключ частково виявлено, але його все одно потрібно налаштувати або повторно підключити, перш ніж розпочнеться надійне навчання.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Наразі немає сумісного апаратного забезпечення приймача. Режим навчання призначений для підтримуваних зовнішніх ключів із можливістю отримання.';

  @override
  String get learningModeRefreshHardware => 'Оновити стан обладнання';

  @override
  String get learningModeHardwareTipTitle => 'Найкраще розміщення';

  @override
  String get learningModeHardwareTipBody =>
      'Режим навчання живе під ІЧ-передавачем, оскільки він залежить від доступності обладнання та використовується рідше, ніж надсилання пультів.';

  @override
  String get learningModeStepPrepareTitle => 'Підготуйте оригінальний пульт';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Вирішіть, що ви вивчаєте, а потім тримайте оригінальний пульт дистанційного керування непорушно та близько до приймача.';

  @override
  String get learningModeButtonNameLabel => 'Назва кнопки';

  @override
  String get learningModeButtonNameHint => 'Наприклад: HDMI 1, живлення, меню';

  @override
  String get learningModeSinglePress => 'Одноразове натискання';

  @override
  String get learningModeHoldButton => 'Кнопка утримання';

  @override
  String get learningModePreparationChecklistTitle => 'Перед захопленням';

  @override
  String get learningModePreparationItemDistance =>
      'Тримайте оригінальний пульт дистанційного керування на відстані приблизно 2–5 см від приймача.';

  @override
  String get learningModePreparationItemOneButton =>
      'Вивчайте одну кнопку за раз і використовуйте коротке, чисте натискання спочатку.';

  @override
  String get learningModePreparationItemStill =>
      'Тримайте обидва пристрої нерухомо, щоб уникнути шумних або часткових зйомок.';

  @override
  String get learningModeStepCaptureTitle => 'Захоплення сигналу';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Прослухайте одну команду, а потім заблокуйте результат перед його переглядом.';

  @override
  String get learningModeCaptureReadyTitle => 'Готовий слухати';

  @override
  String get learningModeCaptureReadyBody =>
      'Ваш апаратний стан виглядає добре. Сервер захоплення буде підключено до цього кроку.';

  @override
  String get learningModeCaptureBlockedTitle => 'Обладнання ще не готове';

  @override
  String get learningModeCaptureBlockedBody =>
      'Ви все ще можете переглянути потік зараз, але захоплення має зачекати, доки приймач не буде готовий.';

  @override
  String get learningModeStartListening => 'Почніть слухати';

  @override
  String get learningModeCaptureStubTitle => 'На черзі — бекенд Capture';

  @override
  String get learningModeCaptureStubBody =>
      'Цей екран спочатку повністю створено, тому остаточний процес захоплення може підключатися до реальних апаратних станів, а не прикручуватися пізніше.';

  @override
  String get learningModeCaptureStubMessage =>
      'Навчальний запис ще не підключено. Цей екран спочатку створює весь потік.';

  @override
  String get learningModeUnnamedCapture => 'Зйомка без назви';

  @override
  String get learningModeStatusCheckingTitle => 'Перевірка приймача';

  @override
  String get learningModeStatusNoReceiverTitle => 'Приймач не готовий';

  @override
  String get learningModeStatusPermissionTitle => 'Потрібен дозвіл USB';

  @override
  String get learningModeStatusSetupTitle => 'Приймач потребує налаштування';

  @override
  String get learningModeStatusReadyTitle => 'Готовий вчитися';

  @override
  String get learningModeStatusListeningTitle => 'Прослуховування сигналу';

  @override
  String get learningModeStatusCapturedTitle => 'Сигнал зафіксовано';

  @override
  String get learningModeStatusReadyBody =>
      'Назвіть кнопку, направте оригінальний пульт на приймач і почніть слухати, коли будете готові.';

  @override
  String get learningModeStatusListeningBody =>
      'Натисніть оригінальну кнопку дистанційного керування. Після підключення зйомки цей стан зафіксує наступний чистий сигнал.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Попередній перегляд отриманого сигналу готовий для $buttonName. Повторіть його, переконайтеся, що він працює, а потім збережіть його у своїй бібліотеці.';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'Підключіть сумісний навчальний ключ';

  @override
  String get learningModeConnectReceiverBody =>
      'Режим навчання залежить від зовнішнього обладнання, яке може приймати ІЧ-протоки. Після виявлення та авторизації одержувача ця сторінка стає потоком прямого прослуховування, тестування та збереження.';

  @override
  String get learningModeListenCardTitle => 'Слухайте одну кнопку';

  @override
  String get learningModeListenCardBody =>
      'Спершу встановіть мітку, якщо хочете, потім почніть слухати й натисніть кнопку на оригінальному пульті.';

  @override
  String get learningModeReadyToListenTitle => 'Готовий слухати';

  @override
  String get learningModeReadyToListenBody =>
      'Це основна поверхня захоплення. Починайте прослуховувати лише тоді, коли оригінальний пульт дистанційного керування спрямований і стабільний.';

  @override
  String get learningModeListeningNowTitle => 'Зараз слухаю';

  @override
  String get learningModeListeningNowBody =>
      'Натисніть оригінальну кнопку дистанційного керування один раз. Використовуйте захоплення попереднього перегляду, щоб перейти до решти каркаса перед тим, як буде підключено справжній сервер захоплення.';

  @override
  String get learningModePreviewCaptureAction =>
      'Попередній перегляд захопленого сигналу';

  @override
  String get learningModeCapturedSummary =>
      'Вивчений попередній перегляд сигналу';

  @override
  String get learningModeResultActionsTitle => 'Перевірте та збережіть';

  @override
  String get learningModeResultActionsBody =>
      'Повторно відтворіть отриманий сигнал, переконайтеся, що цільовий пристрій відповідає, а потім збережіть його як кнопку для багаторазового використання.';

  @override
  String get learningModeReplayAction => 'Повтор';

  @override
  String get learningModeReplayStubMessage =>
      'Повтор ще не підключений. Це каркас інтерфейсу користувача для остаточного процесу вивчення, тестування та збереження.';

  @override
  String get learningModeSaveStubMessage =>
      'Збереження ще не підключено. Наступним кроком буде підключення цього екрана до кнопки «Створити» та наявних пультів дистанційного керування.';

  @override
  String get learningModeLearnAnotherAction => 'Дізнайтеся іншу кнопку';

  @override
  String get learningModeStepReviewTitle => 'Перегляньте та збережіть';

  @override
  String get learningModeStepReviewSubtitle =>
      'Підтвердьте те, що було вивчено, а потім виберіть, де воно має зберігатися у вашій віддаленій бібліотеці.';

  @override
  String get learningModeSaveToExistingRemote => 'Наявний пульт';

  @override
  String get learningModeCreateNewRemote => 'Новий пульт';

  @override
  String get learningModeProtocolPreviewTitle =>
      'Попередній перегляд протоколу';

  @override
  String get learningModeProtocolPreviewBody =>
      'Розшифровані відомості про протокол з’являться тут, коли приймач зафіксує чисте натискання кнопки.';

  @override
  String get learningModeRawPreviewTitle => 'Необроблений запасний варіант';

  @override
  String get learningModeRawPreviewBody =>
      'Якщо декодування не завершено, необроблений запис часу все ще буде доступний тут для перегляду та збереження.';

  @override
  String get learningModeSaveCapture => 'Зберегти знімок';

  @override
  String get learningModeReviewTipTitle => 'Куди це піде далі';

  @override
  String get learningModeReviewTipBody =>
      'На наступному етапі впровадження слід підключити цю панель перегляду до кнопки «Створити» та наявних пультів дистанційного керування, щоб отриманий сигнал потрапляв безпосередньо у вашу бібліотеку.';

  @override
  String get learningModeFinishPreview => 'Завершити попередній перегляд';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Взаимодействие';

  @override
  String get interactionSubtitle => 'Отклик на касания і раскладка пульта';

  @override
  String get hapticFeedbackTitle => 'Тактильний відгук';

  @override
  String get hapticFeedbackSubtitle => 'Вибрация при нажатиях і действиях';

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
  String get intensity => 'Интенсивность';

  @override
  String get intensityLight => 'Світла';

  @override
  String get intensityMedium => 'Средняя';

  @override
  String get intensityStrong => 'Сильная';

  @override
  String get flipRemoteDefaultTitle => 'За умолчанию переворачивать пульт';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Відкривати екран пульта, повернув його на 180°, для USB-адаптерів снизу.';

  @override
  String get remoteViewFlipped => 'Екран пульта буде відкрито перевернутим.';

  @override
  String get remoteViewNormal => 'Екран пульта буде відкрито звичайно.';

  @override
  String get backupTitle => 'Резервна копія';

  @override
  String get backupSubtitle => 'Імпорт і експорт пультів і макросів';

  @override
  String get importBackup => 'Імпорт копии';

  @override
  String get importBackupSubtitle =>
      'Импортируйте копію пультів і макросів або файли Flipper Zero, LIRC або IRPLUS';

  @override
  String get bulkImportFolder => 'Масовий імпорт папки';

  @override
  String get bulkImportFolderSubtitle =>
      'Імпортувати несколько пультів з папки';

  @override
  String get exportBackup => 'Експорт копии';

  @override
  String get exportBackupSubtitle =>
      'Зберегти пульти і макроси як один JSON-файл в Downloads';

  @override
  String get restoreDemoRemotes => 'Віднов. демо-пульти';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Заменить поточні пульти вбудованими демо';

  @override
  String get deleteAllRemotes => 'Видалити все пульти';

  @override
  String get deleteAllRemotesSubtitle => 'Видалити все пульти з пристрою';

  @override
  String get backupTip =>
      'Підказка: Експортуйте копію перед великими змінами. Імпорт підтримує повні копии, старі JSON-копии лише з пультами і файли Flipper Zero .ir.';

  @override
  String get aboutTitle => 'О програму';

  @override
  String get aboutSubtitle => 'Информация о програму і деталях open source';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Версія $version';
  }

  @override
  String get sourceCode => 'Вихідний код';

  @override
  String get viewOnGitHub => 'Відкрити на GitHub';

  @override
  String get repositoryUrlCopied => 'URL репозитория скопирован';

  @override
  String get reportIssue => 'Сообщить о проблеме';

  @override
  String get reportIssueSubtitle => 'Баг-репорти і запити функцій';

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
  String get visitWebsite => 'Відкрити сайт';

  @override
  String get companyUrlCopied => 'URL компании скопирован';

  @override
  String get licenses => 'Лицензии';

  @override
  String get openSourceLicenses => 'Лицензии open source';

  @override
  String byCreator(Object creator) {
    return 'від $creator';
  }

  @override
  String get deviceControlsTitle => 'Упр. пристроєм';

  @override
  String get deviceControlsSubtitle =>
      'Показувати обрані кнопки на сторінці системного керування пристроєм';

  @override
  String get manageFavorites => 'Избранное';

  @override
  String get manageFavoritesSubtitle =>
      'Виберіть кнопки, які будуть покизані в керуванні пристроєм';

  @override
  String get quickSettingsTitle => 'Швидкі налаштування';

  @override
  String get quickSettingsSubtitle => 'Додати плитки для живлення і громкости';

  @override
  String get configureTiles => 'Настроить плитки';

  @override
  String get configureTilesSubtitle => 'Привязать плитки к кнопкам пульта';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Перебір універсальних кодів живлення для своїх пристроїв';

  @override
  String get openTvKill => 'Відкрити TVKill';

  @override
  String get openTvKillSubtitle =>
      'Перебір кодів живлення, лише для своїх пристроїв';

  @override
  String get failedToLoadTransmitterSettings =>
      'Не вдалося завантажити налаштування передавача.';

  @override
  String get usbStatusReady => 'USB-адаптер підключено і готов надсилати ІЧ.';

  @override
  String get usbStatusPermissionRequired =>
      'USB-адаптер знайдено. Запитайте дозвіл USB і підтвердьте системное вікно.';

  @override
  String get usbStatusPermissionDenied =>
      'Дозвіл USB для підключеного адаптера відхилено. Запитайте знову і підтвердьте вікно.';

  @override
  String get usbStatusPermissionGranted =>
      'Дозвіл USB надано. Перед надсиланням ІЧ адаптер ще потрібно ініціалізувати.';

  @override
  String get usbStatusOpenFailed =>
      'Дозвіл USB надано, але адаптер не удалось ініціалізувати. Перепідключіть його і попробуйте знову.';

  @override
  String get usbStatusNoDevice => 'Підтримуваний USB ІЧ-адаптер не знайдено.';

  @override
  String get usbSelectPermissionRequired =>
      'USB-адаптер знайдено, але не авторизован. Натисніть \"Запросить дозвіл USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'Дозвіл USB відхилено. Натисніть \"Запросить дозвіл USB\" і підтвердьте вікно.';

  @override
  String get usbSelectPermissionGranted =>
      'Дозвіл USB надано, але адаптер ще не инициализирован. Попробуйте переподключить його.';

  @override
  String get usbSelectOpenFailed =>
      'Дозвіл USB надано, але адаптер не удалось ініціалізувати. Перепідключіть його і попробуйте знову.';

  @override
  String get usbSelectNoDevice =>
      'Підтримуваний USB ІЧ-адаптер не знайдено. Підключіть його, затем Натисніть \"Запросить дозвіл USB\".';

  @override
  String get usbSelectReady => 'USB-адаптер готов.';

  @override
  String get autoSwitchEnabledMessage =>
      'Автоперемикання увімкнено: використовує USB при підключенні, інакше вбудований.';

  @override
  String get autoSwitchDisabledMessage =>
      'Автоперемикання вимкнено: вибір передавача тепер ручний.';

  @override
  String get failedToUpdateAutoSwitch => 'Не вдалося оновити автоперемикання.';

  @override
  String get failedToSwitchTransmitter => 'Не вдалося перемкнути передавач.';

  @override
  String get deviceHasNoInternalIr =>
      'На цьому пристрої немає встроенного ІЧ-передавача.';

  @override
  String get audioModeEnabledMessage =>
      'Режим Аудіо увімкнено. Використовуйте максимальну гучність медіа і аудіо-ІЧ LED адаптер.';

  @override
  String get usbPermissionRequestSent => 'Запит дозволу USB отправлен.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Запит дозволу USB отправлен. Підтвердьте його, щоб увімкнути USB.';

  @override
  String get usbAlreadyReady => 'USB-адаптер вже инициализирован і готов.';

  @override
  String get failedToRequestUsbPermission => 'Не вдалося запросить дозвіл USB.';

  @override
  String get transmitterHelpInternal =>
      'Використовуйте вбудований ІЧ-передавач телефону для отправки команд.';

  @override
  String get transmitterHelpUsb =>
      'Використовуйте USB ІЧ-адаптер, щоб надсилати команди. Потрібен разрешение.';

  @override
  String get transmitterHelpAudio1 =>
      'Використовуйте аудіовихід, mono. Потрібен аудіо-ІЧ LED адаптер і висока гучність медіа.';

  @override
  String get transmitterHelpAudio2 =>
      'Використовуйте аудіовихід, stereo. Два канали дають краще управление LED на сумісних адаптерах.';

  @override
  String get transmitterInternal => 'Вбудований ІЧ';

  @override
  String get transmitterUsb => 'USB ІЧ-адаптер';

  @override
  String get transmitterAudio1 => 'Аудіо (1 LED)';

  @override
  String get transmitterAudio2 => 'Аудіо (2 LED)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Не вдалося завантажити можливості передавача.';

  @override
  String get selectedTransmitter => 'Вибраний передавач';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Активний: $active';
  }

  @override
  String get refresh => 'Оновити';

  @override
  String get autoSwitchTitle => 'Автоперемикання';

  @override
  String get autoSwitchDisabledWhileAudio =>
      'Отключено при использовании режима Аудіо';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Использует USB при підключенні, інакше вбудований';

  @override
  String get unavailableOnThisDevice => 'Недоступно на цьому пристрої';

  @override
  String get openOnUsbAttachTitle => 'Відкривати при підключенні USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android может предложить відкрити приложение при підключенні поддерживаемого USB ІЧ-адаптера.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'При подключении поддерживаемого USB-адаптера буде предлагаться відкрити IR Blaster.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Предложение відкрити приложение при підключенні USB отключено.';

  @override
  String get failedToUpdateSetting => 'Не вдалося оновити настройку.';

  @override
  String get unnamedButton => 'Безіменна кнопка';

  @override
  String get iconFallback => 'Иконка';

  @override
  String get remoteListReorderHint =>
      'Режим сортировки: зажмите і перетащите карточку.';

  @override
  String get deleteRemoteTitle => 'Видалити пульт?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" буде видалено назавжди. Дію не можна скасувати.';
  }

  @override
  String get delete => 'Видалити';

  @override
  String get addToDeviceControlsTitle => 'Додати в управление пристроєм?';

  @override
  String get addToDeviceControlsDescription =>
      'Швидкий дозвіл в системному керуванні пристроєм.';

  @override
  String get skip => 'Пропустить';

  @override
  String get add => 'Додати';

  @override
  String get addedToDeviceControls => 'Додано в управление пристроєм.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Видалено \"$name\". Дію не можна скасувати.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count кнопок · $layout';
  }

  @override
  String get layoutComfort => 'Комфорт';

  @override
  String get layoutCompact => 'Компактний';

  @override
  String get open => 'Відкрити';

  @override
  String get useThisRemote => 'Використовувати пульт';

  @override
  String get edit => 'Изменить';

  @override
  String get editRemoteSubtitle => 'Переименовать і змінити кнопки';

  @override
  String get thisCannotBeUndone => 'Це не можна скасувати';

  @override
  String get searchRemotes => 'Пошук пультів';

  @override
  String get reorderRemotes => 'Изменить порядок пультів';

  @override
  String get addRemote => 'Додати пульт';

  @override
  String get more => 'Ще';

  @override
  String get reorderMode => 'Режим сортировки';

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
  String get noRemotesYet => 'Пультів поки немає';

  @override
  String get noRemotesDescription =>
      'Створіть пульт, щоб почати надсилати ІЧ-коди.';

  @override
  String get noRemotesNextStep =>
      'Что дальше: Натисніть Додати пульт, затем добавьте перші кнопки.';

  @override
  String get actions => 'Actions';

  @override
  String get macrosTitle => 'Макроси';

  @override
  String get help => 'Помощь';

  @override
  String get createMacro => 'Створити макрос';

  @override
  String get timedMacrosTitle => 'Макроси з таймингом';

  @override
  String get timedMacrosSubtitle =>
      'Автоматизируйте последовательности ІЧ-команд з точним таймингом';

  @override
  String get timedMacrosNextStep =>
      'Что дальше: Натисніть \"Створити перший макрос\", Виберіть пульт, затем добавьте команди і затримки.';

  @override
  String get macroFeatureToysTitle => 'Идеально для інтерактивних игрушек';

  @override
  String get macroFeatureToysDescription =>
      'Управляйте устройствами вроде робособак i-cybie, роботов i-sobot і других игрушек, яким потрібно час між командами для обработки действий.';

  @override
  String get macroFeatureTimingTitle => 'Точний контроль таймінгу';

  @override
  String get macroFeatureTimingDescription =>
      'Добавляйте затримки між командами, від 250 мс до довільної довжини, щоб пристрій встигало відповістьь перед наступним шагом.';

  @override
  String get macroFeatureManualTitle => 'Шаги з ручним продолжением';

  @override
  String get macroFeatureManualDescription =>
      'Приостанавливает виконання і чекає подтверждения, коли длина анимации змінюється або потрібен візуальний контроль.';

  @override
  String get exampleUseCase => 'Пример использования';

  @override
  String get macroExampleText =>
      'Режим i-cybie Advanced:\n1. Надіслати команду \"Mode\"\n2. Ждать 1000 мс, игрушка обробляє\n3. Надіслати \"Action 1\"\n4. Ждать 1000 мс\n5. Надіслати \"Action 2\"\n…і так далее автоматично!';

  @override
  String get createFirstMacro => 'Створити перший макрос';

  @override
  String get noRemote => 'Немає пульта';

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
  String get aboutTimedMacros => 'О макросах з таймингом';

  @override
  String get aboutTimedMacrosDescription =>
      'Макроси з таймингом позволяют автоматизировать последовательности ІЧ-команд з точними задержками між шагами.';

  @override
  String get sendCommand => 'Надіслати команду';

  @override
  String get sendCommandDescription => 'Отправляет ІЧ-команду з вашого пульта.';

  @override
  String get delay => 'Задержка';

  @override
  String get delayDescription =>
      'Чекає вказаний час, наприклад 1000 мс, перед наступним шагом.';

  @override
  String get manualContinue => 'Ручное продолжение';

  @override
  String get manualContinueDescription =>
      'Приостанавливает виконання до нажатия Продолжить. Полезно для анимаций переменной довжини.';

  @override
  String get gotIt => 'Понятно';

  @override
  String get failedToSaveMacros => 'Не вдалося зберегти макроси.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Видалено \"$name\".';
  }

  @override
  String get undo => 'Скасувати';

  @override
  String get failedToRestoreMacro => 'Не вдалося відновити макрос.';

  @override
  String get deleteMacroTitle => 'Видалити макрос?';

  @override
  String get deleteMacroMessage =>
      'Це можна скасувати з следующего уведомления.';

  @override
  String get noRemotesAvailable => 'Немає доступних пультів.';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count кнопок';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Ориентация: перевернута, Натисніть для норм.';

  @override
  String get remoteOrientationNormalTooltip =>
      'Ориентация: звичайна, Натисніть для переворота';

  @override
  String get stopLoop => 'Зупинити цикл';

  @override
  String get reorderButtons => 'Изменить порядок кнопок';

  @override
  String get remoteReorderHint =>
      'Режим сортировки: зажмите і перетащите кнопку.';

  @override
  String get manageRemote => 'Управление пультом';

  @override
  String get remoteNoButtons => 'В цьому пульте немає кнопок';

  @override
  String get remoteNoButtonsDescription =>
      'Використовуйте \"Изм. пульт\", щоб додати або настроить кнопки.';

  @override
  String get editRemote => 'Изм. пульт';

  @override
  String get editRemoteActionsSubtitle =>
      'Переименовать, сортировать і змінити кнопки';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Оновлено \"$name\".';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Додано \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Кнопка продублирована.';

  @override
  String get loopRunningForButton => 'Для цій кнопки запущен цикл.';

  @override
  String get loopTip =>
      'Підказка: використовуйте Цикл для повторения до остановки.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Код скопирован.';

  @override
  String get copyCode => 'Копіювати код';

  @override
  String get startLoop => 'Запустити цикл';

  @override
  String get editButtonSubtitle => 'Изменить метку, код, протокол, частоту';

  @override
  String get newButton => 'Новая кнопка';

  @override
  String get newButtonSubtitle => 'Створити новую кнопку после цій';

  @override
  String get duplicate => 'Дублировать';

  @override
  String get duplicateButtonSubtitle => 'Створити копію цій кнопки';

  @override
  String get removeFromDeviceControls => 'Убрать з керування';

  @override
  String get addToDeviceControls => 'Додати в управление';

  @override
  String get deviceControlsButtonSubtitle =>
      'Показує цю кнопку в системному керуванні пристроєм';

  @override
  String get removedFromDeviceControls => 'Видалено з керування пристроєм.';

  @override
  String get pinQuickTile => 'Закрепить в швидких плитках';

  @override
  String get unpinQuickTile => 'Открепить з швидких плиток';

  @override
  String get quickTileButtonSubtitle =>
      'Показує цю кнопку вгорі вибору швидких плиток';

  @override
  String get removedFromQuickTileFavorites =>
      'Видалено з обраних швидких плиток.';

  @override
  String get pinnedToQuickTileFavorites =>
      'Закреплено в обраних швидких плитках.';

  @override
  String get duplicateAndEdit => 'Дублировать і изм.';

  @override
  String get duplicateAndEditSubtitle => 'Створити копію і відразу змінити';

  @override
  String get done => 'Готово';

  @override
  String get run => 'Запуск';

  @override
  String get untitledRemote => 'Пульт Без названия';

  @override
  String get createRemoteTitle => 'Створити пульт';

  @override
  String get editRemoteTitle => 'Изменить пульт';

  @override
  String get removeButtonTitle => 'Видалити кнопку?';

  @override
  String get imageButtonRemovedMessage =>
      'Ця кнопка з изображением буде видалено.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" буде видалено.';
  }

  @override
  String get remove => 'Видалити';

  @override
  String importedButtonCount(int count) {
    return 'Імпортовано $count кнопок.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Імпортовано $count кнопок з наявних пультів.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Изменить метку, сигнал і доп. налаштування';

  @override
  String get createButtonCopySubtitle => 'Створити копію цій кнопки';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Створити копію і відразу змінити';

  @override
  String get undoAvailableInNextSnackbar =>
      'Можна скасувати з следующего уведомления';

  @override
  String get buttonRemoved => 'Кнопка видалено.';

  @override
  String get remoteNameCannotBeEmpty => 'Ім\'я пульта не может бть порожнім.';

  @override
  String get saveRemote => 'Зберегти пульт';

  @override
  String get remoteName => 'Ім\'я пульта';

  @override
  String get remoteNameHint => 'напр., TV, кондиционер, LED лента';

  @override
  String get remoteNameHelper => 'Це ім\'я отображается в списку пультів.';

  @override
  String get layoutStyle => 'Стиль раскладки';

  @override
  String get layoutWideDescription =>
      'Широкий: кнопки в 2 колонки з доп. деталями, рекомендуется.';

  @override
  String get layoutCompactDescription =>
      'Компактний: классическая сітка 4×, лише иконки або текст.';

  @override
  String get importFromRemotes => 'Імпорт з пультів';

  @override
  String get importFromDatabase => 'Імпорт з БД';

  @override
  String get addButton => 'Додати кнопку';

  @override
  String get noButtonsYet => 'Кнопок поки немає';

  @override
  String get createRemoteEmptyStateDescription =>
      'Добавьте первую кнопку, затем зажмите її для изменения або удаления.';

  @override
  String get createButtonTitle => 'Створити кнопку';

  @override
  String get editButtonTitle => 'Изменить кнопку';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Не вдалося завантажити протоколи: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Не вдалося завантажити ключі бази даних: $error';
  }

  @override
  String get presetPower => 'Живлення';

  @override
  String get presetVolume => 'Гучність';

  @override
  String get presetChannel => 'Канал';

  @override
  String get presetNavigation => 'Навигация';

  @override
  String get all => 'Все';

  @override
  String get completeRequiredFieldsToSave =>
      'Заполните обов\'язкові поля для сохранения';

  @override
  String get buttonLabelStepTitle => 'Мітка кнопки';

  @override
  String get buttonLabelStepSubtitle =>
      'Виберіть зображення, иконку або введите текстовую метку.';

  @override
  String get buttonColorStepTitle => 'Колір кнопки';

  @override
  String get buttonColorStepSubtitle => 'Виберіть колір фона для цій кнопки.';

  @override
  String get selectColor => 'Виберіть колір:';

  @override
  String get noImageSelected => 'Зображення не вибрано';

  @override
  String get gallery => 'Галерея';

  @override
  String get builtIn => 'Вбудований';

  @override
  String get removeImage => 'Видалити зображення';

  @override
  String get requiredSelectImageOrSwitch =>
      'Обязательно: Виберіть зображення, иконку або переключитесь на Текст.';

  @override
  String get iconSelected => 'Иконка вибрана';

  @override
  String get noIconSelected => 'Иконка не вибрана';

  @override
  String get chooseIcon => 'Вибрати иконку';

  @override
  String get removeIcon => 'Видалити иконку';

  @override
  String get requiredSelectIconOrSwitch =>
      'Обязательно: Виберіть иконку або переключитесь на Зображення або Текст.';

  @override
  String get buttonText => 'Текст кнопки';

  @override
  String get buttonTextHint => 'напр., Живлення, Гучність +, HDMI 1';

  @override
  String get buttonTextHelper => 'Цей текст буде покизан на кнопке.';

  @override
  String get requiredEnterButtonLabel => 'Обязательно: введите метку кнопки.';

  @override
  String get defaultColorName => 'Типовий';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Створено новий пульт з одной кнопкой з последнего попадания.';

  @override
  String get selectRemote => 'Виберіть пульт';

  @override
  String remoteNumber(Object id) {
    return 'Пульт #$id';
  }

  @override
  String get newRemoteCreated => 'Новий пульт створено.';

  @override
  String get failedToCreateRemote => 'Не вдалося створити пульт.';

  @override
  String get newRemoteEllipsis => 'Новий пульт…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Додано до $name.';
  }

  @override
  String get failedToAddToRemote => 'Не вдалося додати в пульт.';

  @override
  String get newRemoteDefaultName => 'Новий пульт';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Переход к смещению $offset. Пауза, Натисніть Продолжить.';
  }

  @override
  String get sent => 'Надіслано.';

  @override
  String failedToSend(Object error) {
    return 'Не вдалося надіслати: $error';
  }

  @override
  String get copiedProtocolCode => 'Скопійовано, протокол:код.';

  @override
  String get savedToResults => 'Збережено в результати.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Недійсний код для протокола: $error';
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
    return 'Переход к курсору 0x$cursor. Пауза, Натисніть Продолжить.';
  }

  @override
  String get irSignalTester => 'Тестер ІЧ-сигнала';

  @override
  String get stop => 'Стоп';

  @override
  String get selectButton => 'Виберіть кнопку';

  @override
  String get buttonNotFoundInRemotes => 'Кнопка не знайдено в пультах.';

  @override
  String sentNamed(Object name) {
    return 'Надіслано \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'Помилка отправки: $error';
  }

  @override
  String get noFavoritesYet => 'Избранного поки немає';

  @override
  String get deviceControlsEmptyHint =>
      'Зажмите кнопку пульта і Виберіть \"Додати в управление пристроєм\".';

  @override
  String get sendTest => 'Надіслати тест';

  @override
  String get testSendCompleted => 'Тестовая надсилання завершена.';

  @override
  String testSendFailed(Object error) {
    return 'Тестовая надсилання не удалась: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Видалено \"$name\".';
  }

  @override
  String get brand => 'Бренд';

  @override
  String get model => 'Модель';

  @override
  String get selectBrand => 'Виберіть бренд';

  @override
  String get searchBrand => 'Пошук бренда…';

  @override
  String get selectModel => 'Виберіть модель';

  @override
  String get searchModel => 'Пошук модели…';

  @override
  String get unnamedKey => 'Безіменний ключ';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'Пошук команд';

  @override
  String get noMatchingCommands => 'Совпадающих команд немає';

  @override
  String get quickTileFavoritesTitle => 'Избр. швидких плиток';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Изменить назначение для плитки $tileLabel';
  }

  @override
  String get pickDifferentButton => 'Виберіть другую кнопку';

  @override
  String get browseAllRemotesEllipsis => 'Переглянути все пульти…';

  @override
  String get invalidMacroFileFormat => 'Недійсний формат файла макроса.';

  @override
  String get failedToParseMacroFile => 'Не вдалося разобрать файл макроса.';

  @override
  String get deviceCodeLabel => 'Код пристрою';

  @override
  String get commandLabel => 'Команда';

  @override
  String get editButtonCodeTitle => 'Изменить код кнопки';

  @override
  String get thisRemoteHasNoButtons => 'В цьому пульте немає кнопок.';

  @override
  String get selectCommand => 'Виберіть команду';

  @override
  String get databaseModeAutofillHint =>
      'Режим База автоматично заполняет крок 2, бренд, модель і протокол. После импорта ключа можна донастроить усе вручную.';

  @override
  String get test => 'Тест';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Все вибрані кнопки були дублікатами.';

  @override
  String get noButtonsImported => 'Кнопки не імпортовано.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Імпортовано кнопок: $addedCount. Пропущено дубликатов: $skippedCount.';
  }

  @override
  String get importAllMatchingTitle => 'Імпортувати все відповідні кнопки?';

  @override
  String get noMatchingKeysFound => 'Подходящие ключи не знайдено.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Буде імпортовано до $count подходящих ключей з текущего вибору бази.';
  }

  @override
  String get importAll => 'Імпортувати усе';

  @override
  String get importingButtons => 'Імпорт кнопок…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Все відповідні кнопки були дублікатами.';

  @override
  String get quickPresets => 'Швидкі пресети';

  @override
  String get selectDeviceFirst => 'Сначала Виберіть пристрій';

  @override
  String get searchByLabelOrHex => 'Пошук за метке або hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Необяз.: уточните ключи пресета $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Сначала Виберіть бренд, модель і протокол.';

  @override
  String get importFromDatabaseTitle => 'Імпорт з бази';

  @override
  String get importFromDatabaseSubtitle =>
      'Виберіть пристрій, загрузите відповідні ключи і импортируйте вибрані кнопки.';

  @override
  String get deviceAndFilters => 'Пристрій і фільтри';

  @override
  String loadedCount(int count) {
    return 'Загружено: $count';
  }

  @override
  String get hideFilters => 'Приховати фільтри';

  @override
  String get showFilters => 'Показати фільтри';

  @override
  String get noProtocolFoundForBrandModel =>
      'Для цього бренда і модели протокол не знайдено.';

  @override
  String get protocolAutoDetected => 'Протокол';

  @override
  String get protocolAutoDetectedHelper =>
      'Автоматично визначено з бази. Його можна змінити перед импортом.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Виберіть бренд, модель і протокол, щоб завантажити ключи.';

  @override
  String get noKeysFound => 'Ключи не знайдено.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Ключи для “$query” не знайдено.';
  }

  @override
  String get skipDuplicates => 'Пропускать дублікати';

  @override
  String get skipDuplicatesSubtitle =>
      'Не імпортувати кнопки, які вже есть в цьому пульте.';

  @override
  String get importSelected => 'Імпортувати вибране';

  @override
  String get noMacrosToExport => 'Немає макросів для експорту.';

  @override
  String get macrosExportedToDownloads => 'Макроси експортовано в Downloads.';

  @override
  String get failedToExportMacros => 'Не вдалося експортувати макроси.';

  @override
  String get failedToReadFile => 'Не вдалося прочитать файл.';

  @override
  String get importFromExistingRemotesTitle => 'Імпорт з существующих пультів';

  @override
  String selectedCount(int count) {
    return 'Вибрано: $count';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Другие пульти з кнопками не знайдено.';

  @override
  String get sourceRemote => 'Вихідний пульт';

  @override
  String get searchButtons => 'Пошук кнопок';

  @override
  String get searchButtonsHint => 'Живлення, Гучність, Без звуку...';

  @override
  String get selectVisible => 'Вибрати видимое';

  @override
  String get clearVisible => 'Очистить видимое';

  @override
  String protocolNamed(Object name) {
    return 'Протокол: $name';
  }

  @override
  String get rawSignal => 'Сирий';

  @override
  String get legacyCode => 'Старий код';

  @override
  String importCount(int count) {
    return 'Імпорт $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Дозвіл к хранилищу відхилено, потрібен на деяких старих Android-пристроях.';

  @override
  String get backupExportedToDownloads => 'Копія експортовано в Downloads.';

  @override
  String failedToExport(Object error) {
    return 'Не вдалося експортувати: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Імпортовано пультів з старой JSON-копии: $count. Макроси не менялись.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Імпорт не вдався: backup \"remotes\" должен бть JSON-списком, якщо он присутствует.';

  @override
  String get importFailedMacrosMustBeList =>
      'Імпорт не вдався: backup \"macros\" должен бть JSON-списком, якщо он присутствует.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Імпорт не вдався: недійсний формат backup, ожидался старий List або Map з remotes/macros.';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Імпортовано пультів з копии: $remoteCount. Макроси не менялись.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Імпортовано пультів: $remoteCount і макросів: $macroCount.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Імпорт не вдався: в файле .ir не знайдено коректних кнопок.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Импортирован 1 пульт з Flipper .ir. Макроси не менялись.';

  @override
  String get importFailedInvalidIrplus =>
      'Імпорт не вдався: недійсний файл irplus, коректні кнопки не знайдено.';

  @override
  String get importedOneRemoteFromIrplus =>
      'Импортирован 1 пульт з irplus. Макроси не менялись.';

  @override
  String get importFailedInvalidLirc =>
      'Імпорт не вдався: недійсний файл LIRC, коректні коди або raw-коди не знайдено.';

  @override
  String get importedOneRemoteFromLirc =>
      'Импортирован 1 пульт з конфигурации LIRC. Макроси не менялись.';

  @override
  String get unsupportedFileTypeSelected =>
      'Вибрано непідтримуваний тип файла.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Імпорт не вдався: файл пошкоджено або нечитаем.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Масовий імпорт завершено: підтримуваних файлів в папке не знайдено.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Масовий імпорт завершено: пульти не імпортовано. Пропущено файлів: $skippedCount.';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Масовий імпорт завершено: імпортовано пультів: $importedCount з підтримуваних файлів: $supportedCount. Пропущено файлів: $skippedCount.';
  }

  @override
  String get storagePermissionDenied => 'Дозвіл к хранилищу відхилено.';

  @override
  String get bulkImportFailedReadFolder =>
      'Масовий імпорт не вдався: не удалось прочитать содержимое папки.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Масовий імпорт завершено: підтримуваних файлів не знайдено, $sourceLabel.';
  }

  @override
  String get clearAction => 'Очистить';

  @override
  String get saveAction => 'Зберегти';

  @override
  String buttonsTitleCount(int count) {
    return 'Кнопки, $count';
  }

  @override
  String get invalidStepEncountered => 'Знайдено недійсний крок';

  @override
  String failedToSendNamed(Object name) {
    return 'Не вдалося надіслати: $name';
  }

  @override
  String get buttonNotFound => 'Кнопка не знайдено';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Кнопка не знайдено: $name';
  }

  @override
  String get unknownButton => 'Невідома кнопка';

  @override
  String durationSecondsShort(int seconds) {
    return '$secondsз';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '$minutesм $secondsз';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '$hoursч $minutesм';
  }

  @override
  String get orientationFlippedTooltip =>
      'Ориентация: перевернута, Натисніть для норм.';

  @override
  String get orientationNormalTooltip =>
      'Ориентация: звичайна, Натисніть для переворота';

  @override
  String get noSteps => 'Немає кроків';

  @override
  String stepProgress(int current, int total) {
    return 'Крок $current / $total';
  }

  @override
  String get completed => 'Готово';

  @override
  String get paused => 'Пауза';

  @override
  String get running => 'Виконується';

  @override
  String get ready => 'Готово';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total кроків';
  }

  @override
  String get waiting => 'Ожидание';

  @override
  String secondsRemaining(Object seconds) {
    return 'Осталось $secondsз';
  }

  @override
  String millisecondsShort(int ms) {
    return '$msмс';
  }

  @override
  String get tapContinueWhenReady =>
      'Натисніть Продолжить, коли будете готові к следующему шагу';

  @override
  String get error => 'Помилка';

  @override
  String get macroCompleted => 'Макрос завершено';

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
  String get runAgain => 'Запустити знову';

  @override
  String get startMacro => 'Запустити макрос';

  @override
  String get continueAction => 'Продолжить';

  @override
  String get unnamedRemote => 'Безіменний пульт';

  @override
  String get enterMacroName => 'Введите ім\'я макроса';

  @override
  String get addAtLeastOneStep => 'Добавьте хотя б один крок';

  @override
  String get fixInvalidSteps => 'Исправьте недійсні шаги';

  @override
  String get unknownCommand => 'Невідома команда';

  @override
  String get unnamedCommand => 'Безіменна команда';

  @override
  String get iconCommand => 'Иконка Команда';

  @override
  String get selectDelay => 'Вибрати задержку';

  @override
  String keepMilliseconds(int ms) {
    return 'Оставить: $msмс';
  }

  @override
  String get custom => 'Свое';

  @override
  String get enterCustomDelayDuration => 'Введите свою длительность затримки';

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
      'Рекомендуется: 250-5000 мс для большинства пристроїв';

  @override
  String get enterValidPositiveNumber =>
      'Введите корректное положительное число';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Пульт';

  @override
  String get macroName => 'Ім\'я макроса';

  @override
  String get macroNameHint => 'напр., i-cybie Advanced Mode';

  @override
  String stepsTitleCount(int count) {
    return 'Шаги, $count';
  }

  @override
  String get noStepsYet => 'Кроків поки немає';

  @override
  String get addCommandsAndDelaysHint =>
      'Нижче добавьте команди і затримки, щоб зібрати последовательность';

  @override
  String get addStep => 'Додати крок';

  @override
  String get reorderStepsHint =>
      'Підказка: перетаскивайте ручку, щоб менять порядок кроків. Натисніть на крок, щоб змінити його.';

  @override
  String reorderStep(int index) {
    return 'Переставить крок $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Зажмите і перетащите, щоб змінити порядок кроків';

  @override
  String deleteStep(int index) {
    return 'Видалити крок $index';
  }

  @override
  String get invalidStepTapToFix => 'Недійсний крок, Натисніть для исправления';

  @override
  String get sendIrCommand => 'Надіслати ІЧ-команду';

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
  String get imageButton => 'Кнопка з изображением';

  @override
  String get noSignalInfo => 'Немає даних сигнала';

  @override
  String get proceed => 'Продолжить';

  @override
  String get discard => 'Скасувати';

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
  String get idle => 'Ожидание';

  @override
  String get start => 'Старт';

  @override
  String get resume => 'Продолжить';

  @override
  String get pause => 'Пауза';

  @override
  String get stopped => 'Зупинено';

  @override
  String get copy => 'Копіювати';

  @override
  String get send => 'Надіслати';

  @override
  String get step => 'Крок';

  @override
  String get addToRemote => 'Додати в пульт';

  @override
  String get noDescriptionAvailable => 'Описание недоступно.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Vendor Kaseikyo должен состоять ровно з 4 hex-цифр.';

  @override
  String get irFinderDatabaseNotReady => 'База даних ще не готова.';

  @override
  String get irFinderSelectBrandFirst => 'Сначала Виберіть бренд в настройке.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute-force для цього протокола поки недоступен.';

  @override
  String get irFinderInvalidPrefix => 'Недійсний префікс.';

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
      'Введите индекс з 0 в відфільтрованих і відсортованих результатах бази.';

  @override
  String get irFinderJumpCursorHelper =>
      'Введите hex-курсор з 0 в пространстве brute-force.';

  @override
  String get irFinderSetupTab => 'Настройка';

  @override
  String get irFinderTestTab => 'Тест';

  @override
  String get irFinderResultsTab => 'Результати';

  @override
  String get irFinderContinueToTest => 'Перейти к тесту';

  @override
  String get irFinderKaseikyoVendorTitle => 'Vendor Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'Свой vendor, 4 hex';

  @override
  String get irFinderBrowseDbCandidates => 'Переглянути кандидатов БД…';

  @override
  String get irFinderEditSetup => 'Изм. настройку';

  @override
  String get irFinderNoSavedHits =>
      'Збережених збігів поки немає. На сторінці Тест Натисніть \"Зберегти\", коли пристрій відповість.';

  @override
  String get irFinderBackToTest => 'Назад к тесту';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Великий простір пошуку';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Це пространство brute-force очень велико, $human вариантов. IR Finder усе равно буде соблюдать ліміт спроб і паузу, але не спамьте ІЧ-устройства.\n\nРекомендуется: спочатку використовувати режим База і, або, ввести відомі байти префікса, щоб сузить Пошук.';
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
  String get irFinderApplyResume => 'Применить і продолжить';

  @override
  String get irFinderBruteforceMode => 'Brute-force';

  @override
  String get irFinderDatabaseAssistedMode => 'З помощью БД';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Протокол: $name';
  }

  @override
  String get irFinderProtocolLabel => 'ІЧ-протокол';

  @override
  String get irFinderProtocolHelper =>
      'Управляет кодированием і, соответственно, пространством поиска.';

  @override
  String get irFinderKnownPrefixLabel => 'Відомий префікс, hex-байти, необов.';

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
    return 'Payload: $digits hex-цифр · Макс. префікс: $bytes байт';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Payload: $digits hex-цифр · Пример: $example · Макс. префікс: $bytes байт';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Пример: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Введите відомі перші байти, щоб сузить Пошук.';

  @override
  String get irFinderDatabaseMode => 'База';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Нормализ. префікс: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Нормализ. префікс';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Brute-force для цього протокола поки не настроен.';

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
    return 'Пространство поиска: $value вариантов, после ограничений префікса.';
  }

  @override
  String get irFinderCooldownMs => 'Пауза, мс';

  @override
  String get irFinderMaxAttemptsPerRun => 'Макс. спроб за запуск';

  @override
  String get irFinderTestAllCombinations => 'Тестувати все комбинации';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Працює, поки простір пошуку не вичерпається. Ефективний ліміт: $value';
  }

  @override
  String get irFinderAttempts => 'Спроби';

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
    return 'Ефективний ліміт цього запуска: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Підказка: спочатку використовуйте режим База; brute-force краще працює з відомим префіксом, наприклад першими 1–4 байтами.';

  @override
  String get irFinderDatabaseInitFailed => 'Не вдалося ініціалізувати БД.';

  @override
  String get irFinderPreparingDatabase => 'Подготовка локальной бази ІЧ-кодів…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Пошук з помощью БД';

  @override
  String get irFinderBrand => 'Бренд';

  @override
  String get irFinderSelectBrand => 'Виберіть бренд';

  @override
  String get irFinderModelOptional => 'Модель, необов.';

  @override
  String get irFinderSelectBrandFirstShort => 'Сначала Виберіть бренд';

  @override
  String get irFinderSelectModelRecommended => 'Виберіть модель, рекомендуется';

  @override
  String get irFinderOnlySelectedProtocol => 'Лише вибраний протокол';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Фільтрує ключи за вибраному протоколу. Вимкніть, щоб переглядати все протоколи.';

  @override
  String get irFinderQuickWinsFirst => 'Сначала швидкі попадания';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Сначала дає пріоритет ключам типа POWER, MUTE, VOL і CH, а вже потом более глубоким.';

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
  String get irFinderRetryLast => 'Повторити последний';

  @override
  String get irFinderTrigger => 'Запуск';

  @override
  String get irFinderJump => 'Переход…';

  @override
  String get irFinderSaveHit => 'Зберегти';

  @override
  String irFinderEtaSeconds(int seconds) {
    return '$secondsз';
  }

  @override
  String irFinderEtaMinutesSeconds(int minutes, int seconds) {
    return '$minutesм $secondsз';
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
      'Начните тест, щоб увидеть последний надісланий код.';

  @override
  String irFinderFromDb(Object value) {
    return 'З БД: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'З brute-force, сгенерировано кодировщиком протокола.';

  @override
  String irFinderSendError(Object error) {
    return 'Помилка отправки: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Источник: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Результати можна відразу тестировать і копіювати. Прямое добавление в пульт можна расширить позже в редакторе.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Просмотр кандидатов БД';

  @override
  String get irFinderFilterByLabelOrHex => 'Фильтр за метке або hex…';

  @override
  String get irFinderJumpHere => 'Перейти сюда';

  @override
  String get irFinderSelectModel => 'Виберіть модель';

  @override
  String get irFinderSearchBrands => 'Пошук брендов…';

  @override
  String get irFinderSearchModels => 'Пошук моделей…';

  @override
  String get iconPickerTitle => 'Вибрати Иконка';

  @override
  String get iconPickerSearchHint => 'Пошук иконок...';

  @override
  String get iconPickerNoIconsFound => 'Иконки не знайдено';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count иконок доступно';
  }

  @override
  String get iconPickerCategoryAll => 'Все';

  @override
  String get iconPickerCategoryMedia => 'Медиа';

  @override
  String get iconPickerCategoryVolume => 'Гучність';

  @override
  String get iconPickerCategoryNavigation => 'Навигация';

  @override
  String get iconPickerCategoryPower => 'Живлення';

  @override
  String get iconPickerCategoryNumbers => 'Цифри';

  @override
  String get iconPickerCategorySettings => 'Налаштування';

  @override
  String get iconPickerCategoryDisplay => 'Екран';

  @override
  String get iconPickerCategoryInput => 'Ввод';

  @override
  String get iconPickerCategoryFavorite => 'Избранное';

  @override
  String get universalPowerTitle => 'Універсальне Живлення';

  @override
  String get universalPowerRunTab => 'Запуск';

  @override
  String get universalPowerUseResponsibly => 'Використовуйте ответственно';

  @override
  String get universalPowerConsentBody =>
      'Універсальне Живлення перебирает ІЧ-коди живлення. Використовуйте його лише на пристроях, якими володієте або керуєте. Зупиніть відразу, як лише пристрій відповість.';

  @override
  String get universalPowerConsentCheckbox =>
      'Я владею пристроєм або управляю им';

  @override
  String get universalPowerSetupBody =>
      'Перебирает коди живлення для вибраного бренда. Зупиніть, як лише пристрій відповість.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Последнее отправленное: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Коди живлення не знайдено. Попробуйте расширить Пошук.';

  @override
  String get universalPowerUnableToStart => 'Не вдалося запустити.';

  @override
  String get universalPowerAllBrands => 'Все бренди, Без фільтра';

  @override
  String get universalPowerClearBrandFilter => 'Очистить фильтр бренда';

  @override
  String get universalPowerBroadenSearch => 'При необходимости расширьте Пошук';

  @override
  String get universalPowerBroadenSearchHint =>
      'Якщо метки живлення не знайдено, включите другие ключи.';

  @override
  String get universalPowerAdditionalPatternsDepth => 'Глубина доп. паттернов';

  @override
  String get universalPowerDepth1 => 'Лише пріоритет: POWER/OFF';

  @override
  String get universalPowerDepth2 => 'Включить аліаси POWER';

  @override
  String get universalPowerDepth3 => 'Включить вторинні метки живлення';

  @override
  String get universalPowerDepth4 => 'Включить все метки, нижчий пріоритет';

  @override
  String get universalPowerLoopUntilStopped => 'Цикл до остановки';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Продолжает крутить очередь, поки ви не остановите.';

  @override
  String get universalPowerDelayBetweenCodes => 'Задержка між кодами';

  @override
  String get universalPowerStart => 'Запустити универсальное Живлення';

  @override
  String get universalPowerRunStatus => 'Статус запуска';

  @override
  String universalPowerProgress(Object value) {
    return 'Прогресс: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Приостановлено, так як приложение ушло в фон.';

  @override
  String get universalPowerSendOneCode => 'Надіслати один код';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Зупинити, як лише пристрій відповість.';

  @override
  String get iconNamePlay => 'Пуск';

  @override
  String get iconNamePause => 'Пауза';

  @override
  String get iconNameStop => 'Стоп';

  @override
  String get iconNameFastForward => 'Швидко вперед';

  @override
  String get iconNameRewind => 'назад';

  @override
  String get iconNameSkipNext => 'След.';

  @override
  String get iconNameSkipPrevious => 'Пред.';

  @override
  String get iconNameReplay => 'Повтор';

  @override
  String get iconNameForward10S => 'Вперед 10с';

  @override
  String get iconNameForward30S => 'Вперед 30с';

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
  String get iconNameVolumeUp => 'Гучність +';

  @override
  String get iconNameVolumeDown => 'Гучність -';

  @override
  String get iconNameVolumeOff => 'Гучність вимк';

  @override
  String get iconNameMute => 'Без звуку';

  @override
  String get iconNameSpeaker => 'Динамик';

  @override
  String get iconNameSurroundSound => 'Об\'ємний звук';

  @override
  String get iconNameEqualizer => 'Еквалайзер';

  @override
  String get iconNameAudio => 'Аудіо';

  @override
  String get iconNameMicrophone => 'Микрофон';

  @override
  String get iconNameMicOff => 'Микр. вимк';

  @override
  String get iconNameUp => 'вгору';

  @override
  String get iconNameDown => 'вниз';

  @override
  String get iconNameLeft => 'ліворуч';

  @override
  String get iconNameRight => 'праворуч';

  @override
  String get iconNameArrowUp => 'Стрілка вгору';

  @override
  String get iconNameArrowDown => 'Стрілка вниз';

  @override
  String get iconNameArrowLeft => 'Стрілка ліворуч';

  @override
  String get iconNameArrowRight => 'Стрілка праворуч';

  @override
  String get iconNameNavigation => 'Навигация';

  @override
  String get iconNameChevronLeft => 'Шеврон ліворуч';

  @override
  String get iconNameChevronRight => 'Шеврон праворуч';

  @override
  String get iconNameExpandLess => 'Свернуть';

  @override
  String get iconNameExpandMore => 'Развернуть';

  @override
  String get iconNameCollapse => 'Свернуть';

  @override
  String get iconNameExpand => 'Развернуть';

  @override
  String get iconNameCircleUp => 'Коло вгору';

  @override
  String get iconNameCircleDown => 'Коло вниз';

  @override
  String get iconNameCircleLeft => 'Коло ліворуч';

  @override
  String get iconNameCircleRight => 'Коло праворуч';

  @override
  String get iconNameOkSelect => 'OK/Вибір';

  @override
  String get iconNameConfirm => 'Подтв.';

  @override
  String get iconNameCancel => 'Скасування';

  @override
  String get iconNameClose => 'Закрити';

  @override
  String get iconNameHome => 'Додому';

  @override
  String get iconNameReturn => 'Назад';

  @override
  String get iconNameExit => 'Вихід';

  @override
  String get iconNameUndo => 'Скасувати';

  @override
  String get iconNameRedo => 'Повторити';

  @override
  String get iconNamePower => 'Живлення';

  @override
  String get iconNamePowerAlt => 'Живлення альт.';

  @override
  String get iconNamePowerOff => 'Живлення вимк';

  @override
  String get iconNameOn => 'увімк';

  @override
  String get iconNameOff => 'вимк';

  @override
  String get iconNameToggleOn => 'Перекл. увімк';

  @override
  String get iconNameToggleOff => 'Перекл. вимк';

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
  String get iconNameFour => 'Чотири';

  @override
  String get iconNameFive => 'Пять';

  @override
  String get iconNameSix => 'Шесть';

  @override
  String get iconNamePlus => 'плюс';

  @override
  String get iconNameMinus => 'минус';

  @override
  String get iconNameAddCircle => 'Додати Коло';

  @override
  String get iconNameRemoveCircle => 'Убрать Коло';

  @override
  String get iconNameSettings => 'Налаштування';

  @override
  String get iconNameMenu => 'Меню';

  @override
  String get iconNameMoreVertical => 'больше верт.';

  @override
  String get iconNameMoreHorizontal => 'больше гориз.';

  @override
  String get iconNameTune => 'Настройка';

  @override
  String get iconNameRemoteSettings => 'Пульт Налаштування';

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
  String get iconNameViewGrid => 'Вид Сітка';

  @override
  String get iconNameApps => 'Приложения';

  @override
  String get iconNameWidgets => 'Віджети';

  @override
  String get iconNameTv => 'TV';

  @override
  String get iconNameMonitor => 'Монитор';

  @override
  String get iconNameDesktop => 'Раб. стол';

  @override
  String get iconNameBrightnessHigh => 'Висока яркость';

  @override
  String get iconNameBrightnessMedium => 'Средняя яркость';

  @override
  String get iconNameBrightnessLow => 'Низкая яркость';

  @override
  String get iconNameAutoBrightness => 'Автояркость';

  @override
  String get iconNameLightMode => 'Світлий режим';

  @override
  String get iconNameDarkMode => 'Темний Режим';

  @override
  String get iconNameContrast => 'Контраст';

  @override
  String get iconNameHdrOn => 'HDR увімк';

  @override
  String get iconNameHdrOff => 'HDR вимк';

  @override
  String get iconNameAspectRatio => 'Соотношение сторон';

  @override
  String get iconNameCrop => 'Обрезка';

  @override
  String get iconNameZoomIn => 'Увеличить';

  @override
  String get iconNameZoomOut => 'Уменьшить';

  @override
  String get iconNameFullscreen => 'Повний екран';

  @override
  String get iconNameExitFullscreen => 'Вихід Повний екран';

  @override
  String get iconNameFitScreen => 'Вписать Екран';

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
  String get iconNameScreenShare => 'Екран Поделиться';

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
  String get iconNameMusicQueue => 'Музика Черга';

  @override
  String get iconNameVideoLibrary => 'Відео Библиотека';

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
  String get iconNameStar => 'Зірка';

  @override
  String get iconNameStarOutline => 'Зірка контур';

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
  String get iconNameDoneAll => 'Готово все';

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
  String get iconNameWarmLight => 'Теплий свет';

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
  String get iconNameColor => 'Колір';

  @override
  String get iconNameTonality => 'Тональность';

  @override
  String get iconNameSearch => 'Пошук';

  @override
  String get iconNameRefresh => 'Оновити';

  @override
  String get iconNameSync => 'Синхр.';

  @override
  String get iconNameUpdate => 'Оновити';

  @override
  String get iconNameDownload => 'Скачать';

  @override
  String get iconNameUpload => 'Завантажити';

  @override
  String get iconNameCloud => 'Облако';

  @override
  String get iconNameFolder => 'Папка';

  @override
  String get iconNameDelete => 'Видалити';

  @override
  String get iconNameEdit => 'Изменить';

  @override
  String get iconNameSave => 'Зберегти';

  @override
  String get iconNameShare => 'Поделиться';

  @override
  String get iconNamePrint => 'Печать';

  @override
  String get iconNameLanguage => 'Мова';

  @override
  String get iconNameTranslate => 'Перевод';

  @override
  String get iconNameMicNone => 'Микр. немає';

  @override
  String get iconNameSubtitles => 'Субтитри';

  @override
  String get iconNameClosedCaption => 'Субтитри';

  @override
  String get iconNameMusic => 'Музика';

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
  String get iconNameVideoCamera => 'Відео Камера';

  @override
  String get iconNamePhotoCamera => 'Фото Камера';

  @override
  String get iconNameSlowMotion => 'Замедление';

  @override
  String get iconNameSpeed => 'Скорость';

  @override
  String get iconNameVideoSettings => 'Відео Налаштування';

  @override
  String get iconNameAudioTrack => 'Аудіотрек';

  @override
  String get iconNameGraphicEq => 'Графический EQ';

  @override
  String get iconNameMusicVideo => 'Музика Відео';

  @override
  String get iconNamePlaylist => 'Плейлист';

  @override
  String get iconNameQueue => 'Черга';

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
  String get iconNameHashFa => 'Решітка # FA';

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
  String get iconNameAsteriskFa => 'Зірочка * FA';

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
  String get iconNameForwardFa => 'вперед FA';

  @override
  String get iconNamePreviousFa => 'Пред. FA';

  @override
  String get iconNameNextFa => 'След. FA';

  @override
  String get iconNameRewindFa => 'назад FA';

  @override
  String get iconNameFastForwardFa => 'Швидко вперед FA';

  @override
  String get iconNameRepeatFa => 'Повтор FA';

  @override
  String get iconNameShuffleFa => 'Случайно FA';

  @override
  String get iconNameEjectFa => 'Извлечь FA';

  @override
  String get iconNameFilmFa => 'Фильм FA';

  @override
  String get iconNameVideoFa => 'Відео FA';

  @override
  String get iconNameMusicFa => 'Музика FA';

  @override
  String get iconNameMicrophoneFa => 'Микрофон FA';

  @override
  String get iconNameCameraFa => 'Камера FA';

  @override
  String get iconNameCameraRetroFa => 'Камера ретро FA';

  @override
  String get iconNameVolumeHighFa => 'Гучність Висока FA';

  @override
  String get iconNameVolumeLowFa => 'Гучність Низкая FA';

  @override
  String get iconNameVolumeOffFa => 'Гучність вимк FA';

  @override
  String get iconNameMuteFa => 'Без звуку FA';

  @override
  String get iconNameMicMuteFa => 'Микр. Без звуку FA';

  @override
  String get iconNameHeadphonesFa => 'Наушники FA';

  @override
  String get iconNameSpeakerFa => 'Динамик FA';

  @override
  String get iconNameUpFa => 'вгору FA';

  @override
  String get iconNameDownFa => 'вниз FA';

  @override
  String get iconNameLeftFa => 'ліворуч FA';

  @override
  String get iconNameRightFa => 'праворуч FA';

  @override
  String get iconNameUpFaOutline => 'вгору FA контур';

  @override
  String get iconNameDownFaOutline => 'вниз FA контур';

  @override
  String get iconNameLeftFaOutline => 'ліворуч FA контур';

  @override
  String get iconNameRightFaOutline => 'праворуч FA контур';

  @override
  String get iconNameArrowUpFa => 'Стрілка вгору FA';

  @override
  String get iconNameArrowDownFa => 'Стрілка вниз FA';

  @override
  String get iconNameArrowLeftFa => 'Стрілка ліворуч FA';

  @override
  String get iconNameArrowRightFa => 'Стрілка праворуч FA';

  @override
  String get iconNameChevronUpFa => 'Шеврон вгору FA';

  @override
  String get iconNameChevronDownFa => 'Шеврон вниз FA';

  @override
  String get iconNameChevronLeftFa => 'Шеврон ліворуч FA';

  @override
  String get iconNameChevronRightFa => 'Шеврон праворуч FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA контур';

  @override
  String get iconNameCheckFa => 'Галочка FA';

  @override
  String get iconNameCloseFa => 'Закрити FA';

  @override
  String get iconNameCloseCircleFa => 'Закрити Коло FA';

  @override
  String get iconNameHomeFa => 'Додому FA';

  @override
  String get iconNameUndoFa => 'Скасувати FA';

  @override
  String get iconNameRedoFa => 'Повторити FA';

  @override
  String get iconNameRotateFa => 'Повернуть FA';

  @override
  String get iconNameSearchFa => 'Пошук FA';

  @override
  String get iconNameRefreshFa => 'Оновити FA';

  @override
  String get iconNamePowerOffFa => 'Живлення вимк FA';

  @override
  String get iconNamePlugFa => 'Штекер FA';

  @override
  String get iconNameToggleOnFa => 'Перекл. увімк FA';

  @override
  String get iconNameToggleOffFa => 'Перекл. вимк FA';

  @override
  String get iconNameSettingsFa => 'Налаштування FA';

  @override
  String get iconNameSettingsAltFa => 'Налаштування альт. FA';

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
  String get iconNameGridFa => 'Сітка FA';

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
  String get iconNameFlashFa => 'Спалах FA';

  @override
  String get iconNameFullscreenFa => 'Повний екран FA';

  @override
  String get iconNameExitFullscreenFa => 'Вихід Повний екран FA';

  @override
  String get iconNameZoomInFa => 'Увеличить FA';

  @override
  String get iconNameZoomOutFa => 'Уменьшить FA';

  @override
  String get iconNameSubtitlesFa => 'Субтитри FA';

  @override
  String get iconNamePictureInPictureFa => 'Картинка в картинке FA';

  @override
  String get iconNameColorFa => 'Колір FA';

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
  String get iconNameBroadcastFa => 'Ефір FA';

  @override
  String get iconNameSatelliteFa => 'Спутник FA';

  @override
  String get iconNameAntennaFa => 'Антенна FA';

  @override
  String get iconNameNetworkFa => 'Сеть FA';

  @override
  String get iconNameCloudFa => 'Облако FA';

  @override
  String get iconNameStarFa => 'Зірка FA';

  @override
  String get iconNameStarFaOutline => 'Зірка FA контур';

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
  String get iconNameClockFa => 'Годинник FA';

  @override
  String get iconNameClockFaOutline => 'Годинник FA контур';

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
  String get iconNameImageFa => 'Зображення FA';

  @override
  String get iconNameVideoFileFa => 'Відео Файл FA';

  @override
  String get iconNameAudioFileFa => 'Аудіо Файл FA';

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
  String get iconNameStopCircleFa => 'Стоп Коло FA';

  @override
  String get iconNameLoadingFa => 'Завантаження FA';

  @override
  String get iconNameTextFa => 'Текст FA';

  @override
  String get iconNameTextSizeFa => 'Размер текста FA';

  @override
  String get iconNameLanguageFa => 'Мова FA';

  @override
  String get iconNameGlobeFa => 'Глобус FA';

  @override
  String get iconNameSubtitlesAltFa => 'Субтитри альт. FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Субтитри альт. контур FA';

  @override
  String get iconNameChannelUpFa => 'Канал вгору FA';

  @override
  String get iconNameChannelDownFa => 'Канал вниз FA';

  @override
  String get iconNamePageUpFa => 'Страница вгору FA';

  @override
  String get iconNamePageDownFa => 'Страница вниз FA';

  @override
  String get iconNameGuideFa => 'Гид FA';

  @override
  String get iconNameGridViewFa => 'Сітка Вид FA';

  @override
  String get iconNameGridAltFa => 'Сітка альт. FA';

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
  String get iconNameDotCircleFa => 'Точка коло FA';

  @override
  String get iconNameToolsFa => 'Інструменти FA';

  @override
  String get iconNameScrewdriverFa => 'Викрутка FA';

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
  String get iconNameSortUpFa => 'Сортировка вгору FA';

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
  String get iconNameFullscreenAltFa => 'Повний екран альт. FA';

  @override
  String get iconNameZoomPlusFa => 'Масштаб плюс FA';

  @override
  String get iconNameZoomMinusFa => 'Масштаб минус FA';

  @override
  String get iconNameMusicNoteFa => 'Музика Нота FA';

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
  String get iconNameCircleArrowUpFa => 'Коло Стрілка вгору FA';

  @override
  String get iconNameCircleArrowDownFa => 'Коло Стрілка вниз FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Коло Стрілка ліворуч FA';

  @override
  String get iconNameCircleArrowRightFa => 'Коло Стрілка праворуч FA';

  @override
  String get iconNameLongArrowUpFa => 'Длинная Стрілка вгору FA';

  @override
  String get iconNameLongArrowDownFa => 'Длинная Стрілка вниз FA';

  @override
  String get iconNameLongArrowLeftFa => 'Длинная Стрілка ліворуч FA';

  @override
  String get iconNameLongArrowRightFa => 'Длинная Стрілка праворуч FA';

  @override
  String get iconNamePlusFa => 'плюс FA';

  @override
  String get iconNameMinusFa => 'минус FA';

  @override
  String get iconNamePlusCircleFa => 'плюс Коло FA';

  @override
  String get iconNameMinusCircleFa => 'минус Коло FA';

  @override
  String get iconNamePlusSquareFa => 'плюс Квадрат FA';

  @override
  String get iconNameMinusSquareFa => 'минус Квадрат FA';

  @override
  String get iconNameTimesFa => '× FA';

  @override
  String get iconNameTimesCircleFa => '× Коло FA';

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
  String get selectedFilesLabel => 'вибраних файлів';

  @override
  String get folderNotFoundOrInaccessible =>
      'Папка не знайдено або недоступна.';

  @override
  String get importedRemoteDefaultName => 'Імпортований пульт';

  @override
  String get demoRemoteName => 'Демо-пульт';

  @override
  String get protocolFieldsInvalid =>
      'Заполните обов\'язкові поля протокола і убедитесь, что частота, якщо задана, находится в диапазоне 15–60 кГц.';

  @override
  String get unknownProtocolSelected => 'Вибрано невідомий протокол.';

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
  String get learningModeCaptureFailed => 'Помилка запису.';

  @override
  String get learningModeReplaySent => 'Відтворено вивчений сигнал.';

  @override
  String get learningModeReplayFailed =>
      'Неможливо відтворити отриманий сигнал.';

  @override
  String get learningModeNoRemotesAvailable => 'Ще немає збережених пультів.';

  @override
  String get learningModeChooseRemoteTitle => 'Виберіть пульт';

  @override
  String get learningModeNewRemoteTitle => 'Створіть новий пульт';

  @override
  String get learningModeSaveSuccess => 'Вивчену кнопку збережено.';

  @override
  String get learningModeSaveFailed => 'Не вдалося зберегти вивчену кнопку.';

  @override
  String get remoteSetupIntro =>
      'Спочатку виберіть назву та макет. Кнопки можна додати пізніше.';

  @override
  String get startWithDefault => 'Почати з типових параметрів';

  @override
  String get browseGithubStore => 'Відкрити GitHub Store';

  @override
  String get addFirstButton => 'Додати першу кнопку';

  @override
  String get moreWaysToStart => 'Інші способи почати';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Відхилити налаштування нового пульта й залишити цей екран?';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Відхилити зміни пульта й залишити цей екран?';

  @override
  String get firstButtonAdded => 'Першу кнопку додано.';

  @override
  String get iconColorTitle => 'Колір значка';

  @override
  String get iconColorHelper =>
      'Виберіть колір символу, який залишатиметься помітним на тлі кнопки.';

  @override
  String get colorRed => 'Червоний';

  @override
  String get colorPink => 'Рожевий';

  @override
  String get colorPurple => 'Фіолетовий';

  @override
  String get colorDeepPurple => 'Темно-фіолетовий';

  @override
  String get colorIndigo => 'Індиго';

  @override
  String get colorBlue => 'Синій';

  @override
  String get colorLightBlue => 'Блакитний';

  @override
  String get colorCyan => 'Ціан';

  @override
  String get colorTeal => 'Бірюзовий';

  @override
  String get colorGreen => 'Зелений';

  @override
  String get colorLightGreen => 'Світло-зелений';

  @override
  String get colorLime => 'Лаймовий';

  @override
  String get colorYellow => 'Жовтий';

  @override
  String get colorAmber => 'Бурштиновий';

  @override
  String get colorOrange => 'Помаранчевий';

  @override
  String get colorDeepOrange => 'Темно-помаранчевий';

  @override
  String get colorBrown => 'Коричневий';

  @override
  String get colorGrey => 'Сірий';

  @override
  String get colorBlueGrey => 'Сіро-синій';

  @override
  String get colorBlack => 'Чорний';

  @override
  String get colorWhite => 'Білий';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Колір кнопки $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Колір кнопки $colorName, вибрано';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Колір значка $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Колір значка $colorName, вибрано';
  }
}
