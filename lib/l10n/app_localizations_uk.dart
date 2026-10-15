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
      'Виявлено ІЧ USB-адаптер. Надайте доступ до USB, щоб надсилати команди.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'Доступ до USB відхилено. Повторно запитайте дозвіл і надайте доступ, щоб надсилати команди.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'Доступ до USB надано, але адаптер ще не готовий.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Не вдалося з’єднатися з USB-адаптером, хоча доступ надано. Від’єднайте його, під’єднайте знову й повторіть спробу.';

  @override
  String get homeUsbReadyMessage => 'ІЧ USB-адаптер готовий.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Цей телефон не має вбудованого ІЧ-передавача, і жоден сумісний ІЧ USB-адаптер не під’єднано.';

  @override
  String get homeUsbOptionPlugIn =>
      'Під’єднайте сумісний ІЧ USB-адаптер і надайте доступ.';

  @override
  String get homeUsbOptionReady => 'Готово до надсилання.';

  @override
  String get homeUsbOptionPermissionRequired =>
      'Під’єднано. Надайте доступ до USB.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Доступ відхилено. Запитайте дозвіл ще раз.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Доступ надано. Очікування адаптера.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Помилка з’єднання. Під’єднайте адаптер знову.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Немає вбудованого ІЧ-передавача. Використовуйте сумісний ІЧ USB-адаптер або ІЧ-аксесуар з аудіопідключенням.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Під’єднано. Надайте доступ до USB.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Доступ відхилено. Запитайте дозвіл ще раз.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Доступ надано. Очікування адаптера.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Помилка з’єднання. Під’єднайте адаптер знову.';

  @override
  String get homeHardwareBannerReady => 'Готово до надсилання.';

  @override
  String get homeHardwareRequiredTitle => 'Потрібен ІЧ-передавач';

  @override
  String get homeUsbDongleRecommended => 'ІЧ USB-адаптер (рекомендовано)';

  @override
  String get homeAudioAdapterAlternative => 'ІЧ-адаптер через аудіо';

  @override
  String get homeAudioAdapterDescription =>
      'Потрібен ІЧ-адаптер з аудіопідключенням. У налаштуваннях виберіть Аудіо (1 або 2 світлодіоди) і збільште гучність медіа.';

  @override
  String get close => 'Закрити';

  @override
  String get homeChooseTransmitter => 'Вибрати передавач';

  @override
  String get openSettings => 'Відкрити налаштування';

  @override
  String get homeUsbPermissionSentApprove =>
      'Дозвіл запитано. Надайте доступ до USB у вікні Android.';

  @override
  String get homeUsbDongleNotDetected =>
      'Сумісний ІЧ USB-адаптер не знайдено. Під’єднайте його й спробуйте ще раз.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Не вдалося запитати доступ до USB. Спробуйте ще раз.';

  @override
  String get working => 'Виконується…';

  @override
  String get requestUsbPermission => 'Запитати доступ до USB';

  @override
  String get homeHardwareTip =>
      'Ви вже можете налаштувати свої пульти. ІЧ-передавач потрібен лише для надсилання команд.';

  @override
  String get homeNoIrTransmitterTitle => 'Немає доступного ІЧ-передавача';

  @override
  String get homeHardwareRequiredBody =>
      'Ви можете створювати й упорядковувати пульти без ІЧ-передавача. Щоб керувати пристроєм, скористайтеся одним із варіантів нижче.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Ви й далі можете створювати, імпортувати й упорядковувати пульти.';

  @override
  String get homeWaysToUseIrBlaster => 'Варіанти обладнання';

  @override
  String get homeBuiltInIrOptionTitle => 'Вбудований ІЧ-передавач';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Деякі телефони мають вбудований ІЧ-передавач. У цьому телефоні його немає.';

  @override
  String get homeBuiltInIrUnavailable => 'Немає в цьому телефоні';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'ІЧ-адаптер з аудіопідключенням';

  @override
  String get homeContinueWithoutHardware => 'Продовжити без надсилання';

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
  String get signalTesterNavLabel => 'Тестер сигналу';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get remoteNoIrEmitterTitle => 'ІЧ-передавач недоступний';

  @override
  String get remoteNoIrEmitterMessage =>
      'Не знайдено ІЧ-передавача, який можна використати.';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Для надсилання сигналів потрібен вбудований ІЧ-передавач або сумісний зовнішній передавач.';

  @override
  String get remoteDismiss => 'Продовжити перегляд';

  @override
  String get remoteClose => 'Закрити програму';

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
    return 'Цикл зупинено (не вдалося надіслати): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Цикл \"$title\". Натисніть «Зупинити» на верхній панелі, щоб зупинити.';
  }

  @override
  String get remoteLoopStopped => 'Цикл зупинено.';

  @override
  String get remoteUpdatedNotFound =>
      'Пульт оновлено на екрані. Його не знайдено в збереженому списку.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Оновлено \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Не вдалося видалити пульт: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'Цей пульт не знайдено в списку збережених пультів.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Пульт «$name» видалено.';
  }

  @override
  String get buttonFallbackTitle => 'Кнопка';

  @override
  String get imageFallbackTitle => 'Зображення';

  @override
  String get noBrowserAvailable => 'Браузер недоступний';

  @override
  String failedToOpen(Object error) {
    return 'Не вдалося відкрити: $error';
  }

  @override
  String get cancel => 'Скасувати';

  @override
  String get settingsRestoreDemoTitle => 'Відновити демонстраційні пульти?';

  @override
  String get settingsRestoreDemoMessage =>
      'Усі поточні пульти буде замінено прикладами із застосунку. Якщо хочете зберегти свої пульти, спочатку створіть резервну копію.';

  @override
  String get settingsRestoreDemoConfirm => 'Відновити приклади';

  @override
  String get settingsDemoRemotesRestored => 'Демо пульти відновлені.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Видалити всі пульти?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Усі пульти, збережені на цьому пристрої, буде видалено. Цю дію не можна скасувати.';

  @override
  String get settingsDeleteAllConfirm => 'Видалити всі';

  @override
  String get settingsAllRemotesDeleted => 'Усі пульти видалено.';

  @override
  String get themeAuto => 'Автотема';

  @override
  String get themeLight => 'Світла тема';

  @override
  String get themeDark => 'Темна тема';

  @override
  String get themeDescAuto => 'Дотримується налаштувань вашого пристрою';

  @override
  String get themeDescLight => 'Завжди яскраво і чітко';

  @override
  String get themeDescDark => 'Легкий для очей';

  @override
  String get themeHintAuto =>
      'Тема автоматично перемикається, коли ви змінюєте налаштування пристрою між світлим і темним режимами';

  @override
  String get themeHintLight =>
      'Ідеально підходить для денного використання та добре освітлених місць';

  @override
  String get themeHintDark =>
      'Зменшує напругу очей в умовах слабкого освітлення та економить батарею на OLED-екранах';

  @override
  String get supportDevelopmentTitle => 'Підтримати розробку';

  @override
  String get supportDevelopmentSubtitle =>
      'Допоможіть підтримувати IR Blaster і сумісність з обладнанням';

  @override
  String get supportDevelopmentBody =>
      'Ні реклами, ні відстеження, ні заблокованих функцій. Ваша підтримка фінансує роботу протоколу, підтримку USB-адаптера та кращу сумісність між пристроями.';

  @override
  String get donate => 'Підтримати';

  @override
  String get starRepo => 'Позначити репозиторій зіркою';

  @override
  String get repositoryLinkCopied => 'Посилання на репозиторій скопійовано';

  @override
  String get supportPillLocalOnly => 'Лише локально';

  @override
  String get supportPillNoTracking => 'Немає відстеження';

  @override
  String get supportPillHardwareAware => 'З урахуванням обладнання';

  @override
  String get supportPillOpenSource => 'Відкритий код';

  @override
  String get appearanceTitle => 'Зовнішній вигляд';

  @override
  String get appearanceSubtitle => 'Налаштуйте свій візуальний досвід';

  @override
  String get localizationTitle => 'Локалізація';

  @override
  String get localizationSubtitle => 'Мова програми та поведінка перекладу';

  @override
  String localizationAutoUsing(Object language) {
    return 'Авто: використовується $language';
  }

  @override
  String get localizationAutoDescription =>
      'Застосунок використовує мову пристрою, якщо це можливо.';

  @override
  String get localizationManualDescription => 'Мову застосунку вибрано вручну.';

  @override
  String get useSystemLanguageTitle => 'Використовувати системну мову';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Мова вашого пристрою: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Використовуйте мову, вибрану нижче, замість стандартної для пристрою.';

  @override
  String get chooseAppLanguage => 'Виберіть мову програми';

  @override
  String get languagePickerDisabledHint =>
      'Вимкніть системну мову, щоб вибрати мову вручну.';

  @override
  String get searchLanguages => 'Пошук мов';

  @override
  String get noLanguagesFound => 'Немає відповідних мов';

  @override
  String get localizationHint =>
      'Коли системну мову ввімкнено, застосунок використовує локаль пристрою та повертається до англійської, якщо переклад недоступний. Вимкніть цю опцію, щоб вибрати конкретну мову.';

  @override
  String get appLanguageTitle => 'Мова програми';

  @override
  String get appLanguageHint =>
      'Автоматично відповідає мові вашого пристрою. Виберіть тут англійську або французьку, щоб замінити її лише для програми.';

  @override
  String get languageAuto => 'Авто (система)';

  @override
  String get languageAutoDescription =>
      'Автоматично використовувати мову пристрою';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageEnglishDescription =>
      'Завжди використовувати англійську мову';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageFrenchDescription =>
      'Завжди використовувати французьку мову';

  @override
  String get languageAutoShort => 'Авто';

  @override
  String get languageEnglishShort => 'English';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'Використовуйте динамічні кольори';

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
  String get learningModeEntryTitle => 'Навчання';

  @override
  String get learningModeEntrySubtitle =>
      'Скопіюйте ІЧ-сигнал кнопки з пульта.';

  @override
  String get learningModeTitle => 'Навчання';

  @override
  String get learningModeHeroTitle => 'Навчити кнопку пульта';

  @override
  String get learningModeHeroSubtitle =>
      'Налаштуйте приймач, підготуйте оригінальний пульт, запишіть одну команду, а потім перегляньте її, перш ніж зберегти на пульті.';

  @override
  String get learningModeReadyBadge => 'Приймач готовий';

  @override
  String get learningModeNeedsPermissionBadge => 'Потрібен дозвіл USB';

  @override
  String get learningModeSetupBadge => 'Потрібне налаштування приймача';

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
      'Підберіть там, де має відбутися захоплення';

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
      'Перевірка передавача й ІЧ-приймача.';

  @override
  String get learningModeHardwareReadyBody =>
      'USB ІЧ-адаптер під’єднано та ініціалізовано. Це правильне місце для початку процесу навчання після підключення проводки захоплення.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Дозвольте доступ до USB-адаптера, а потім почніть навчання.';

  @override
  String get learningModeHardwareSetupBody =>
      'Приймач не готовий. Перевірте налаштування або підключіть його знову й повторіть спробу.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Підключіть сумісний ІЧ-приймач, щоб копіювати сигнали з пульта.';

  @override
  String get learningModeRefreshHardware => 'Перевірити приймач';

  @override
  String get learningModeHardwareTipTitle => 'Найкраще розміщення';

  @override
  String get learningModeHardwareTipBody =>
      'Режим навчання живе під ІЧ-передавачем, оскільки він залежить від доступності апаратного забезпечення та використовується рідше, ніж надсилання пультів.';

  @override
  String get learningModeStepPrepareTitle => 'Підготуйте оригінальний пульт';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Вирішіть, що ви вивчаєте, а потім тримайте оригінальний пульт непорушно та близько до приймача.';

  @override
  String get learningModeButtonNameLabel => 'Назва кнопки';

  @override
  String get learningModeButtonNameHint => 'Наприклад: Живлення, HDMI 1, Меню';

  @override
  String get learningModeSinglePress => 'Одноразове натискання';

  @override
  String get learningModeHoldButton => 'Кнопка утримання';

  @override
  String get learningModePreparationChecklistTitle => 'Перед захопленням';

  @override
  String get learningModePreparationItemDistance =>
      'Тримайте оригінальний пульт на відстані приблизно 2–5 см від приймача.';

  @override
  String get learningModePreparationItemOneButton =>
      'Вивчайте одну кнопку за раз і використовуйте коротке, чисте натискання спочатку.';

  @override
  String get learningModePreparationItemStill =>
      'Тримайте обидва пристрої нерухомо, щоб уникнути шумних або часткових зйомок.';

  @override
  String get learningModeStepCaptureTitle => 'Захопити сигнал';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Прослухайте одну команду, а потім заблокуйте результат перед його переглядом.';

  @override
  String get learningModeCaptureReadyTitle => 'Готовий слухати';

  @override
  String get learningModeCaptureReadyBody =>
      'Обладнання готове. Тепер можна розпочати захоплення ІЧ-сигналу.';

  @override
  String get learningModeCaptureBlockedTitle => 'Обладнання ще не готове';

  @override
  String get learningModeCaptureBlockedBody =>
      'Ви все ще можете переглянути потік зараз, але захоплення має зачекати, доки приймач не буде готовий.';

  @override
  String get learningModeStartListening => 'Почати приймання';

  @override
  String get learningModeCaptureStubTitle => 'На черзі — бекенд Capture';

  @override
  String get learningModeCaptureStubBody =>
      'Цей екран спочатку повністю створено, тому остаточний потік захоплення може підключитися до реальних станів апаратного забезпечення, а не прикручуватися пізніше.';

  @override
  String get learningModeCaptureStubMessage =>
      'Навчальний запис ще не підключено. Цей екран спочатку створює весь потік.';

  @override
  String get learningModeUnnamedCapture => 'Сигнал без назви';

  @override
  String get learningModeStatusCheckingTitle => 'Перевірка приймача';

  @override
  String get learningModeStatusNoReceiverTitle => 'Приймач не готовий';

  @override
  String get learningModeStatusPermissionTitle => 'Потрібен дозвіл USB';

  @override
  String get learningModeStatusSetupTitle => 'Налаштуйте приймач';

  @override
  String get learningModeStatusReadyTitle => 'Готово до навчання';

  @override
  String get learningModeStatusListeningTitle => 'Очікування сигналу';

  @override
  String get learningModeStatusCapturedTitle => 'Сигнал отримано';

  @override
  String get learningModeStatusReadyBody =>
      'Назвіть кнопку, направте оригінальний пульт на приймач і почніть слухати, коли будете готові.';

  @override
  String get learningModeStatusListeningBody =>
      'Спрямуйте оригінальний пульт на приймач і натисніть кнопку один раз.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Отримано сигнал для $buttonName. Надішліть його знову, щоб перевірити реакцію пристрою, а потім збережіть.';
  }

  @override
  String get learningModeConnectReceiverTitle => 'Підключіть ІЧ-приймач';

  @override
  String get learningModeConnectReceiverBody =>
      'Режим навчання залежить від зовнішнього обладнання, яке може приймати інфрачервоне випромінювання. Після виявлення та авторизації одержувача ця сторінка стає потоком прямого прослуховування, тестування та збереження.';

  @override
  String get learningModeListenCardTitle => 'Слухайте одну кнопку';

  @override
  String get learningModeListenCardBody =>
      'Якщо хочете, спочатку встановіть мітку, а потім почніть слухати й натисніть кнопку на оригінальному пульті.';

  @override
  String get learningModeReadyToListenTitle => 'Готово до приймання';

  @override
  String get learningModeReadyToListenBody =>
      'Спрямуйте оригінальний пульт на приймач, а потім почніть приймання сигналу.';

  @override
  String get learningModeListeningNowTitle => 'Очікування сигналу';

  @override
  String get learningModeListeningNowBody =>
      'Один раз натисніть кнопку на оригінальному пульті та тримайте його спрямованим на приймач.';

  @override
  String get learningModePreviewCaptureAction =>
      'Попередній перегляд захопленого сигналу';

  @override
  String get learningModeCapturedSummary => 'Отриманий сигнал';

  @override
  String get learningModeResultActionsTitle => 'Перевірка й збереження';

  @override
  String get learningModeResultActionsBody =>
      'Перш ніж зберегти кнопку, надішліть сигнал знову й переконайтеся, що пристрій реагує.';

  @override
  String get learningModeReplayAction => 'Надіслати знову';

  @override
  String get learningModeReplayStubMessage =>
      'Повтор ще не підключений. Це каркас інтерфейсу користувача для остаточного процесу вивчення, тестування та збереження.';

  @override
  String get learningModeSaveStubMessage =>
      'Зберегти ще не підключено. Наступним кроком буде підключення цього екрана до кнопки «Створити» та наявних пультів.';

  @override
  String get learningModeLearnAnotherAction => 'Навчити ще одну кнопку';

  @override
  String get learningModeStepReviewTitle => 'Перегляньте та збережіть';

  @override
  String get learningModeStepReviewSubtitle =>
      'Підтвердьте те, що було вивчено, а потім виберіть, де воно має зберігатися у вашій бібліотеці пультів.';

  @override
  String get learningModeSaveToExistingRemote => 'Збережений пульт';

  @override
  String get learningModeCreateNewRemote => 'Новий пульт';

  @override
  String get learningModeProtocolPreviewTitle => 'Дані протоколу';

  @override
  String get learningModeProtocolPreviewBody =>
      'Розшифровані відомості про протокол з’являться тут, коли приймач зафіксує чисте натискання кнопки.';

  @override
  String get learningModeRawPreviewTitle => 'Необроблені дані';

  @override
  String get learningModeRawPreviewBody =>
      'Якщо декодування не завершено, необроблений запис часу все ще буде доступний тут для перегляду та збереження.';

  @override
  String get learningModeSaveCapture => 'Зберегти сигнал';

  @override
  String get learningModeReviewTipTitle => 'Куди це піде далі';

  @override
  String get learningModeReviewTipBody =>
      'На наступному етапі впровадження слід підключити цю панель перегляду до кнопки «Створити» та наявних пультів, щоб отриманий сигнал потрапляв безпосередньо у вашу бібліотеку.';

  @override
  String get learningModeFinishPreview => 'Завершити попередній перегляд';

  @override
  String get backAction => 'Назад';

  @override
  String get interactionTitle => 'Поведінка застосунку';

  @override
  String get interactionSubtitle =>
      'Налаштуйте запуск, відгук на дотик і відображення пультів.';

  @override
  String get autoOpenLastRemoteTitle => 'Відкривати останній пульт';

  @override
  String get autoOpenLastRemoteSubtitle =>
      'Під час запуску застосунку відкривати останній використаний пульт. Якщо він недоступний, показувати список пультів.';

  @override
  String get hapticFeedbackTitle => 'Вібровідгук';

  @override
  String get hapticFeedbackSubtitle => 'Вібрація під час натискань і дій';

  @override
  String get forceInAppVibrationTitle => 'Примусова вібрація';

  @override
  String get forceInAppVibrationSubtitle =>
      'Використовуйте вібратор безпосередньо, навіть якщо зворотний зв’язок системи від дотику вимкнено';

  @override
  String get forceInAppVibrationWarning =>
      'Розширений варіант. Це може змусити програму вібрувати, навіть якщо сенсорний зворотній зв’язок Android вимкнено глобально.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Вібрацію вимкнено в налаштуваннях Android. На вашому пристрої застосунок не може обійти це налаштування.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'Вібромотор не виявлено. Вібрація в застосунку недоступна.';

  @override
  String get intensity => 'Сила вібрації';

  @override
  String get intensityLight => 'Слабка';

  @override
  String get intensityMedium => 'Середня';

  @override
  String get intensityStrong => 'Сильна';

  @override
  String get remoteButtonMetadataTitle => 'Показувати дані сигналу';

  @override
  String get remoteButtonMetadataSubtitle =>
      'Показувати протокол, код і частоту на кнопках пульта.';

  @override
  String get remoteButtonMetadataShown => 'Дані сигналу показано.';

  @override
  String get remoteButtonMetadataHidden => 'Дані сигналу приховано.';

  @override
  String get flipRemoteDefaultTitle => 'Повертати пульти на 180°';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Відкривати екрани пультів із поворотом на 180°. Зручно для USB-адаптерів, підключених знизу телефона.';

  @override
  String get remoteViewFlipped =>
      'Пульти відкриватимуться з поворотом на 180°.';

  @override
  String get remoteViewNormal =>
      'Пульти відкриватимуться у звичайній орієнтації.';

  @override
  String get backupTitle => 'Резервне копіювання';

  @override
  String get backupSubtitle => 'Збереження та імпорт пультів і макросів';

  @override
  String get importBackup => 'Імпорт із файлу';

  @override
  String get importBackupSubtitle =>
      'Імпортуйте резервну копію пультів і макросів або файли Flipper Zero, LIRC чи IRPLUS.';

  @override
  String get bulkImportFolder => 'Імпорт кількох пультів';

  @override
  String get bulkImportFolderSubtitle =>
      'Додайте пульти з кількох файлів за один раз.';

  @override
  String get exportBackup => 'Зберегти резервну копію';

  @override
  String get exportBackupSubtitle =>
      'Збережіть пульти й макроси разом в одному JSON-файлі.';

  @override
  String get restoreDemoRemotes => 'Відновити демонстраційні пульти';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Замінити поточні пульти прикладами із застосунку.';

  @override
  String get deleteAllRemotes => 'Видалити всі пульти';

  @override
  String get deleteAllRemotesSubtitle =>
      'Видалити всі пульти, збережені на цьому пристрої.';

  @override
  String get backupTip =>
      'Перед значними змінами збережіть резервну копію. Можна імпортувати як повні копії, так і старі JSON-копії, що містять лише пульти.';

  @override
  String get aboutTitle => 'про';

  @override
  String get aboutSubtitle =>
      'Інформація про програму та деталі з відкритого коду';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'ІЧ-бластер - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Версія $version';
  }

  @override
  String get sourceCode => 'Вихідний код';

  @override
  String get viewOnGitHub => 'Переглянути на GitHub';

  @override
  String get repositoryUrlCopied => 'URL-адресу сховища скопійовано';

  @override
  String get reportIssue => 'Повідомити про проблему';

  @override
  String get reportIssueSubtitle => 'Звіти про помилки та запити щодо функцій';

  @override
  String get issuesUrlCopied => 'URL-адресу проблеми скопійовано';

  @override
  String get license => 'Ліцензія';

  @override
  String get openSourceLicense => 'Ліцензія з відкритим кодом';

  @override
  String get licenseUrlCopied => 'URL-адресу ліцензії скопійовано';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Відвідайте наш сайт';

  @override
  String get companyUrlCopied => 'URL-адресу компанії скопійовано';

  @override
  String get licenses => 'Ліцензії';

  @override
  String get openSourceLicenses => 'Ліцензії з відкритим кодом';

  @override
  String byCreator(Object creator) {
    return 'від $creator';
  }

  @override
  String get deviceControlsTitle => 'Елементи керування пристроєм';

  @override
  String get deviceControlsSubtitle =>
      'Показати улюблені кнопки на сторінці елементів керування системою';

  @override
  String get manageFavorites => 'Керуйте вибраним';

  @override
  String get manageFavoritesSubtitle =>
      'Виберіть, які кнопки відображатимуться в елементах керування пристроєм';

  @override
  String get quickSettingsTitle => 'Швидкі налаштування';

  @override
  String get quickSettingsSubtitle =>
      'Додайте плитки для ярликів живлення та гучності';

  @override
  String get configureTiles => 'Налаштувати плитки';

  @override
  String get configureTilesSubtitle =>
      'Призначте кнопки пульта плиткам швидких налаштувань';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Універсальне відключення живлення для власних пристроїв';

  @override
  String get openTvKill => 'Відкрийте TVKill';

  @override
  String get openTvKillSubtitle =>
      'Перемикайте коди живлення (використовуйте лише на своїх пристроях)';

  @override
  String get failedToLoadTransmitterSettings =>
      'Не вдалося завантажити налаштування передавача.';

  @override
  String get usbStatusReady =>
      'USB-адаптер підключено та готовий до надсилання ІЧ-команд.';

  @override
  String get usbStatusPermissionRequired =>
      'Виявлено USB-адаптер. Надішліть запит на дозвіл USB і підтвердьте системний запит.';

  @override
  String get usbStatusPermissionDenied =>
      'Відмовлено в дозволі USB для під’єднаного ключа. Надішліть запит ще раз і підтвердьте запит.';

  @override
  String get usbStatusPermissionGranted =>
      'Дозвіл USB надано. Ключ все ще потрібно ініціалізувати, перш ніж він зможе надсилати ІЧ-команди.';

  @override
  String get usbStatusOpenFailed =>
      'Дозвіл USB надано, але ключ не вдалося ініціалізувати. Повторно підключіть його та повторіть спробу.';

  @override
  String get usbStatusNoDevice => 'Не виявлено підтримуваного USB ІЧ-адаптера.';

  @override
  String get usbSelectPermissionRequired =>
      'USB-адаптер виявлено, але не авторизовано. Натисніть «Запросити дозвіл USB».';

  @override
  String get usbSelectPermissionDenied =>
      'У дозволі USB відмовлено. Торкніться «Запитувати дозвіл USB» і підтвердьте запит.';

  @override
  String get usbSelectPermissionGranted =>
      'Дозвіл USB надано, але ключ ще не ініціалізовано. Спробуйте повторно підключити його.';

  @override
  String get usbSelectOpenFailed =>
      'Дозвіл USB надано, але ключ не вдалося ініціалізувати. Повторно підключіть його та повторіть спробу.';

  @override
  String get usbSelectNoDevice =>
      'Не виявлено підтримуваного USB ІЧ-адаптера. Підключіть його, а потім натисніть «Запитувати дозвіл USB».';

  @override
  String get usbSelectReady => 'USB ключ готовий.';

  @override
  String get autoSwitchEnabledMessage =>
      'Автоматичне перемикання ввімкнено: під час підключення використовується USB, інакше внутрішній.';

  @override
  String get autoSwitchDisabledMessage =>
      'Автоматичне перемикання вимкнено: вибір передавача тепер ручний.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Не вдалося оновити налаштування автоматичного перемикання.';

  @override
  String get failedToSwitchTransmitter => 'Не вдалося перемкнути передавач.';

  @override
  String get deviceHasNoInternalIr =>
      'Цей пристрій не має вбудованого ІЧ-випромінювача.';

  @override
  String get audioModeEnabledMessage =>
      'Аудіорежим увімкнено. Використовуйте максимальний об’єм медіа та світлодіодний адаптер аудіо-ІЧ.';

  @override
  String get usbPermissionRequestSent => 'Запит на дозвіл USB надіслано.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Запит на дозвіл USB надіслано. Підтвердьте системний запит, щоб увімкнути USB.';

  @override
  String get usbAlreadyReady =>
      'USB-адаптер уже ініціалізовано й готово до роботи.';

  @override
  String get failedToRequestUsbPermission => 'Не вдалося запитати дозвіл USB.';

  @override
  String get transmitterHelpInternal =>
      'Використовуйте вбудований ІЧ-випромінювач телефону для надсилання команд.';

  @override
  String get transmitterHelpUsb =>
      'Для надсилання команд використовуйте USB ІЧ-адаптер (потрібен дозвіл).';

  @override
  String get transmitterHelpAudio1 =>
      'Використовуйте аудіовихід (моно). Потрібен світлодіодний адаптер аудіо-інфрачервоний світлодіод і велика гучність медіа.';

  @override
  String get transmitterHelpAudio2 =>
      'Використовуйте аудіовихід (стерео). Використовує два канали для покращеного керування світлодіодами за допомогою сумісних адаптерів.';

  @override
  String get transmitterInternal => 'Внутрішній ІЧ';

  @override
  String get transmitterUsb => 'USB ІЧ-адаптер';

  @override
  String get transmitterAudio1 => 'Аудіо (1 світлодіод)';

  @override
  String get transmitterAudio2 => 'Аудіо (2 світлодіоди)';

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
      'Вимкнено під час використання режиму аудіо';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Використовує USB під час підключення, інакше внутрішній';

  @override
  String get unavailableOnThisDevice => 'Недоступно на цьому пристрої';

  @override
  String get openOnUsbAttachTitle => 'Відкрити на USB-приєднанні';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android може запропонувати відкрити програму, коли під’єднано підтримуваний USB ІЧ-адаптер.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Буде запропоновано відкрити IR Blaster, коли під’єднано підтримуваний USB-адаптер.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Не пропонуватиму відкривати через USB-під’єднання.';

  @override
  String get failedToUpdateSetting => 'Не вдалося оновити налаштування.';

  @override
  String get unnamedButton => 'Кнопка без назви';

  @override
  String get iconFallback => 'значок';

  @override
  String get remoteListReorderHint =>
      'Натисніть і утримуйте пульт, а потім перетягніть його на нове місце.';

  @override
  String get deleteRemoteTitle => 'Видалити пульт?';

  @override
  String deleteRemoteMessage(Object name) {
    return 'Пульт «$name» буде видалено назавжди. Цю дію неможливо скасувати.';
  }

  @override
  String get delete => 'Видалити';

  @override
  String get addToDeviceControlsTitle =>
      'Додати до елементів керування пристроєм?';

  @override
  String get addToDeviceControlsDescription =>
      'Швидкий доступ до елементів управління пристроєм системи.';

  @override
  String get skip => 'Пропустити';

  @override
  String get add => 'додати';

  @override
  String get addedToDeviceControls =>
      'Додано до елементів керування пристроєм.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Пульт «$name» видалено. Цю дію неможливо скасувати.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кнопки',
      many: '$count кнопок',
      few: '$count кнопки',
      one: '$count кнопка',
    );
    return '$_temp0 · $layout';
  }

  @override
  String get layoutComfort => 'Широке';

  @override
  String get layoutCompact => 'Компактне';

  @override
  String get open => 'відкритий';

  @override
  String get useThisRemote => 'Використовуйте цей пульт';

  @override
  String get edit => 'Редагувати';

  @override
  String get editRemoteSubtitle => 'Кнопки перейменування та редагування';

  @override
  String get thisCannotBeUndone => 'Цю дію неможливо скасувати';

  @override
  String get searchRemotes => 'Пошук пультів';

  @override
  String get reorderRemotes => 'Змінити порядок пультів';

  @override
  String get addRemote => 'Додати пульт';

  @override
  String get more => 'більше';

  @override
  String get reorderMode => 'Режим зміни порядку';

  @override
  String remoteButtonCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кнопки',
      many: '$count кнопок',
      few: '$count кнопки',
      one: '$count кнопка',
    );
    return '$_temp0';
  }

  @override
  String get noRemotesYet => 'Пультів ще немає';

  @override
  String get noRemotesDescription =>
      'Створіть пульт для надсилання ІЧ-сигналів.';

  @override
  String get noRemotesNextStep => 'Спочатку додайте пульт, а потім кнопки.';

  @override
  String get actions => 'Дії';

  @override
  String get macrosTitle => 'Макроси';

  @override
  String get help => 'Довідка';

  @override
  String get createMacro => 'Створити макрос';

  @override
  String get timedMacrosTitle => 'Макроси';

  @override
  String get timedMacrosSubtitle =>
      'Виконуйте ІЧ-команди послідовно з паузами між кроками.';

  @override
  String get timedMacrosNextStep =>
      'Виберіть пульт, а потім додайте команди й паузи, щоб створити перший макрос.';

  @override
  String get macroFeatureToysTitle => 'Для іграшок з ІЧ-керуванням';

  @override
  String get macroFeatureToysDescription =>
      'Дайте іграшці завершити дію, перш ніж надсилати наступну команду.';

  @override
  String get macroFeatureTimingTitle => 'Налаштування пауз';

  @override
  String get macroFeatureTimingDescription =>
      'Задайте паузи між командами, щоб пристрій устигав реагувати.';

  @override
  String get macroFeatureManualTitle => 'Чекати підтвердження';

  @override
  String get macroFeatureManualDescription =>
      'Чекає на натискання «Продовжити» перед переходом до наступного кроку.';

  @override
  String get exampleUseCase => 'Приклад';

  @override
  String get macroExampleText =>
      '1. Надішліть першу команду\n2. Зачекайте одну секунду\n3. Надішліть наступну команду';

  @override
  String get createFirstMacro => 'Створити перший макрос';

  @override
  String get noRemote => 'Немає пульта';

  @override
  String macroCopyName(String name) {
    return '$name (копія)';
  }

  @override
  String macroStepCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кроків',
      many: '$count кроків',
      few: '$count кроки',
      one: '$count крок',
    );
    return '$_temp0';
  }

  @override
  String get aboutTimedMacros => 'Про макроси';

  @override
  String get aboutTimedMacrosDescription =>
      'Виконуйте ІЧ-команди послідовно з паузами між кроками.';

  @override
  String get sendCommand => 'Надіслати команду';

  @override
  String get sendCommandDescription =>
      'Надсилає ІЧ-сигнал збереженої кнопки пульта.';

  @override
  String get delay => 'Час очікування';

  @override
  String get delayDescription =>
      'Чекає заданий час перед переходом до наступного кроку.';

  @override
  String get manualContinue => 'Чекати підтвердження';

  @override
  String get manualContinueDescription =>
      'Чекає на натискання «Продовжити» перед переходом до наступного кроку.';

  @override
  String get gotIt => 'Зрозуміло';

  @override
  String get failedToSaveMacros => 'Не вдалося зберегти макроси.';

  @override
  String deletedMacroNamed(Object name) {
    return '«$name» видалено.';
  }

  @override
  String get undo => 'Скасувати';

  @override
  String get failedToRestoreMacro => 'Не вдалося відновити макрос.';

  @override
  String get deleteMacroTitle => 'Видалити макрос?';

  @override
  String get deleteMacroMessage =>
      'Після видалення натисніть «Скасувати» в повідомленні, що з’явиться, щоб відновити макрос.';

  @override
  String get noRemotesAvailable => 'Немає доступних пультів.';

  @override
  String remoteButtonCountSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кнопки',
      many: '$count кнопок',
      few: '$count кнопки',
      one: '$count кнопка',
    );
    return '$_temp0';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Відновити початкову орієнтацію';

  @override
  String get remoteOrientationNormalTooltip => 'Повернути пульт на 180°';

  @override
  String get stopLoop => 'Зупинити повторення';

  @override
  String get reorderButtons => 'Змінити порядок кнопок';

  @override
  String get remoteReorderHint =>
      'Натисніть і утримуйте кнопку, а потім перетягніть її на нове місце.';

  @override
  String get manageRemote => 'Керувати пультом';

  @override
  String get remoteNoButtons => 'Ще немає кнопок';

  @override
  String get remoteNoButtonsDescription =>
      'Відредагуйте цей пульт, щоб додати або налаштувати кнопки.';

  @override
  String get editRemote => 'Редагувати пульт';

  @override
  String get editRemoteActionsSubtitle =>
      'Перейменувати пульт, розташувати й редагувати кнопки';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Кнопку «$name» оновлено.';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Додано \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Кнопка дублюється.';

  @override
  String get loopRunningForButton => 'Для цієї кнопки виконується цикл.';

  @override
  String get loopTip =>
      'Порада: використовуйте цикл, щоб повторювати, доки ви не зупините його.';

  @override
  String get loopingBadge => 'Зациклення';

  @override
  String get codeCopied => 'Код скопійовано.';

  @override
  String get copyCode => 'Скопіюйте код';

  @override
  String get startLoop => 'Почати цикл';

  @override
  String get editButtonSubtitle => 'Змінити підпис, кольори або ІЧ-сигнал';

  @override
  String get newButton => 'Нова кнопка';

  @override
  String get newButtonSubtitle => 'Створити ще одну кнопку для цього пульта';

  @override
  String get duplicate => 'Дублювати';

  @override
  String get duplicateButtonSubtitle => 'Створити копію цієї кнопки';

  @override
  String get removeFromDeviceControls =>
      'Видалити з елементів керування пристроєм';

  @override
  String get addToDeviceControls => 'Додати до елементів керування пристроєм';

  @override
  String get deviceControlsButtonSubtitle =>
      'Використовувати цю кнопку в керуванні пристроями Android';

  @override
  String get removedFromDeviceControls =>
      'Видалено з елементів керування пристроєм.';

  @override
  String get pinQuickTile => 'Закріпити в обраному для швидких плиток';

  @override
  String get unpinQuickTile => 'Відкріпити з обраного для швидких плиток';

  @override
  String get quickTileButtonSubtitle =>
      'Обране показується першим під час налаштування плитки швидких налаштувань';

  @override
  String get removedFromQuickTileFavorites =>
      'Видалено з вибраного Quick Tile.';

  @override
  String get pinnedToQuickTileFavorites => 'Закріплено у вибраному Quick Tile.';

  @override
  String get duplicateAndEdit => 'Дублювати й редагувати';

  @override
  String get duplicateAndEditSubtitle =>
      'Створити копію й одразу її відредагувати';

  @override
  String get done => 'Готово';

  @override
  String get run => 'Запустити';

  @override
  String get untitledRemote => 'Пульт без назви';

  @override
  String get createRemoteTitle => 'Створити пульт';

  @override
  String get editRemoteTitle => 'Редагувати пульт';

  @override
  String get removeButtonTitle => 'Видалити кнопку?';

  @override
  String get imageButtonRemovedMessage => 'Цю кнопку буде видалено з пульта.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return 'Кнопку «$name» буде видалено з пульта.';
  }

  @override
  String get remove => 'Видалити';

  @override
  String importedButtonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Імпортовано $count кнопки.',
      many: 'Імпортовано $count кнопок.',
      few: 'Імпортовано $count кнопки.',
      one: 'Імпортовано $count кнопку.',
    );
    return '$_temp0';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Імпортовано $count кнопки зі збережених пультів.',
      many: 'Імпортовано $count кнопок зі збережених пультів.',
      few: 'Імпортовано $count кнопки зі збережених пультів.',
      one: 'Імпортовано $count кнопку зі збережених пультів.',
    );
    return '$_temp0';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Змінити підпис, кольори або ІЧ-сигнал';

  @override
  String get createButtonCopySubtitle => 'Створити копію цієї кнопки';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Створити копію й одразу її відредагувати';

  @override
  String get undoAvailableInNextSnackbar =>
      'Після видалення кнопки натисніть «Скасувати» в повідомленні, що з’явиться.';

  @override
  String get buttonRemoved => 'Кнопку видалено.';

  @override
  String get remoteNameCannotBeEmpty => 'Введіть назву пульта.';

  @override
  String get saveRemote => 'Зберегти пульт';

  @override
  String get remoteName => 'Назва пульта';

  @override
  String get remoteNameHint => 'Наприклад, телевізор або кондиціонер';

  @override
  String get remoteNameHelper => 'Ця назва відображатиметься у списку пультів.';

  @override
  String get layoutStyle => 'Розташування кнопок';

  @override
  String get layoutWideDescription =>
      'Два стовпці кнопок із додатковою інформацією.';

  @override
  String get layoutCompactDescription =>
      'Чотири стовпці кнопок зі значками або текстом.';

  @override
  String get importFromRemotes => 'Імпорт із пультів';

  @override
  String get importFromDatabase => 'Імпорт із бази даних';

  @override
  String get addButton => 'Додати кнопку';

  @override
  String get noButtonsYet => 'Кнопок ще немає';

  @override
  String get createRemoteEmptyStateDescription =>
      'Знайдіть кнопки в базі даних, імпортуйте їх з іншого пульта або створіть власні.';

  @override
  String get createButtonTitle => 'Створити кнопку';

  @override
  String get editButtonTitle => 'Кнопка редагування';

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
  String get presetVolume => 'Обсяг';

  @override
  String get presetChannel => 'Канал';

  @override
  String get presetNavigation => 'Навігація';

  @override
  String get all => 'все';

  @override
  String get completeRequiredFieldsToSave =>
      'Заповніть необхідні поля для збереження';

  @override
  String get buttonLabelStepTitle => 'Мітка кнопки';

  @override
  String get buttonLabelStepSubtitle =>
      'Виберіть зображення, значок або введіть текстову мітку.';

  @override
  String get buttonColorStepTitle => 'Колір кнопки';

  @override
  String get buttonColorStepSubtitle => 'Виберіть колір фону для цієї кнопки.';

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
      'Необхідно: виберіть зображення, виберіть піктограму або перейдіть до Тексту.';

  @override
  String get iconSelected => 'Значок вибрано';

  @override
  String get noIconSelected => 'Значок не вибрано';

  @override
  String get chooseIcon => 'Виберіть значок';

  @override
  String get removeIcon => 'Видалити значок';

  @override
  String get requiredSelectIconOrSwitch =>
      'Необхідно: виберіть піктограму або перейдіть до зображення/тексту.';

  @override
  String get buttonText => 'Текст кнопки';

  @override
  String get buttonTextHint => 'наприклад, живлення, гучність +, HDMI 1';

  @override
  String get buttonTextHelper => 'Цей текст з’явиться на кнопці.';

  @override
  String get requiredEnterButtonLabel => 'Обов’язково: введіть назву кнопки.';

  @override
  String get defaultColorName => 'За замовчуванням';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Новий пульт, створений однією кнопкою з останнього удару.';

  @override
  String get selectRemote => 'Виберіть пульт';

  @override
  String remoteNumber(Object id) {
    return 'Пульт #$id';
  }

  @override
  String get newRemoteCreated => 'Створено новий пульт.';

  @override
  String get failedToCreateRemote => 'Не вдалося створити пульт.';

  @override
  String get newRemoteEllipsis => 'Новий пульт…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Додано до $name.';
  }

  @override
  String get failedToAddToRemote => 'Не вдалося додати на пульт.';

  @override
  String get newRemoteDefaultName => 'Новий пульт';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Перейшов до зсуву $offset. Призупинено - натисніть Відновити, щоб продовжити.';
  }

  @override
  String get sent => 'Надіслано.';

  @override
  String failedToSend(Object error) {
    return 'Не вдалося надіслати: $error';
  }

  @override
  String get copiedProtocolCode => 'Скопійовано (протокол:код).';

  @override
  String get savedToResults => 'Збережено в результатах.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Недійсний код для протоколу: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Скопійовано поточного кандидата.';

  @override
  String get jumpToOffset => 'Перейти до зміщення';

  @override
  String get jumpToBruteCursor => 'Перехід до грубого курсору';

  @override
  String get jump => 'Стрибок';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Перейшов до курсору 0x$cursor. Призупинено - натисніть Відновити, щоб продовжити.';
  }

  @override
  String get irSignalTester => 'Тестер ІЧ-сигналу';

  @override
  String get stop => 'Стоп';

  @override
  String get selectButton => 'Виберіть кнопку';

  @override
  String get buttonNotFoundInRemotes =>
      'Кнопку не знайдено в збережених пультах.';

  @override
  String sentNamed(Object name) {
    return 'Команду «$name» надіслано.';
  }

  @override
  String sendFailed(Object error) {
    return 'Не вдалося надіслати: $error';
  }

  @override
  String get noFavoritesYet => 'Вибраних ще немає';

  @override
  String get deviceControlsEmptyHint =>
      'Утримуйте кнопку пульта та виберіть «Додати до елементів керування пристроєм».';

  @override
  String get sendTest => 'Надіслати тест';

  @override
  String get testSendCompleted => 'Тестове надсилання завершено.';

  @override
  String testSendFailed(Object error) {
    return 'Помилка тестового надсилання: $error';
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
  String get searchBrand => 'Шукати бренд…';

  @override
  String get selectModel => 'Виберіть модель';

  @override
  String get searchModel => 'Пошук моделі…';

  @override
  String get unnamedKey => 'Безіменний ключ';

  @override
  String get unknown => 'Невідомий';

  @override
  String get emDash => '-';

  @override
  String get searchCommands => 'Пошук команд';

  @override
  String get noMatchingCommands => 'Команд не знайдено';

  @override
  String get quickTileFavoritesTitle => 'Обрані кнопки';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Змінити кнопку плитки «$tileLabel»';
  }

  @override
  String get pickDifferentButton => 'Виберіть іншу кнопку';

  @override
  String get browseAllRemotesEllipsis => 'Переглянути пульти';

  @override
  String get invalidMacroFileFormat => 'Недійсний формат файлу макросу.';

  @override
  String get failedToParseMacroFile =>
      'Не вдалося проаналізувати файл макросу.';

  @override
  String get deviceCodeLabel => 'Код пристрою';

  @override
  String get commandLabel => 'Команда';

  @override
  String get editButtonCodeTitle => 'Редагувати код кнопки';

  @override
  String get thisRemoteHasNoButtons => 'На цьому пульті немає кнопок.';

  @override
  String get selectCommand => 'Виберіть команду';

  @override
  String get databaseModeAutofillHint =>
      'Режим бази даних автоматично заповнює крок 2 для вас (бренд + модель + протокол). Після імпортування ключа ви можете вдосконалити будь-що вручну.';

  @override
  String get test => 'Тест';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Усі вибрані кнопки були дублікатами.';

  @override
  String get noButtonsImported => 'Кнопки не імпортовано.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    String _temp0 = intl.Intl.pluralLogic(
      addedCount,
      locale: localeName,
      other: 'Імпортовано $addedCount кнопки.',
      many: 'Імпортовано $addedCount кнопок.',
      few: 'Імпортовано $addedCount кнопки.',
      one: 'Імпортовано $addedCount кнопку.',
    );
    String _temp1 = intl.Intl.pluralLogic(
      skippedCount,
      locale: localeName,
      other: '$skippedCount дубліката',
      many: '$skippedCount дублікатів',
      few: '$skippedCount дублікати',
      one: '$skippedCount дублікат',
    );
    return '$_temp0 Пропущено $_temp1.';
  }

  @override
  String get importAllMatchingTitle => 'Імпортувати всі відповідні кнопки?';

  @override
  String get noMatchingKeysFound => 'Не знайдено відповідних ключів.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Це імпортує до $count відповідних ключів із поточного вибору бази даних.';
  }

  @override
  String get importAll => 'Імпортувати все';

  @override
  String get importingButtons => 'Імпорт кнопок…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Усі відповідні кнопки були дублікатами.';

  @override
  String get quickPresets => 'Швидкі налаштування';

  @override
  String get selectDeviceFirst => 'Спочатку виберіть пристрій';

  @override
  String get searchByLabelOrHex => 'Пошук за міткою або шістнадцятковим';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Додатково: уточніть попередньо встановлені клавіші $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Спочатку виберіть бренд, модель і протокол.';

  @override
  String get importFromDatabaseTitle => 'Імпорт з бази даних';

  @override
  String get importFromDatabaseSubtitle =>
      'Знайдіть свій пристрій, виберіть потрібні кнопки та імпортуйте їх.';

  @override
  String get deviceAndFilters => 'Пристрій і фільтри';

  @override
  String loadedCount(int count) {
    return '$count завантажено';
  }

  @override
  String get hideFilters => 'Сховати фільтри';

  @override
  String get showFilters => 'Показати фільтри';

  @override
  String get noProtocolFoundForBrandModel =>
      'Для цієї марки та моделі протокол не знайдено.';

  @override
  String get protocolAutoDetected => 'Протокол';

  @override
  String get protocolAutoDetectedHelper =>
      'Автоматично визначено з бази даних. Ви можете змінити його перед імпортом.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Виберіть бренд, модель і протокол для завантаження ключів.';

  @override
  String get noKeysFound => 'Ключі не знайдено.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Не знайдено ключів для “$query”.';
  }

  @override
  String get skipDuplicates => 'Пропустити дублікати';

  @override
  String get skipDuplicatesSubtitle =>
      'Не імпортуйте кнопки, які вже існують на цьому пульті.';

  @override
  String get importSelected => 'Вибрано імпорт';

  @override
  String get noMacrosToExport => 'Немає макросів для експорту.';

  @override
  String get macrosExportedToDownloads => 'Макроси збережено.';

  @override
  String get failedToExportMacros => 'Не вдалося експортувати макроси.';

  @override
  String get failedToReadFile => 'Не вдалося прочитати файл.';

  @override
  String get importFromExistingRemotesTitle => 'Імпортувати з наявних пультів';

  @override
  String selectedCount(int count) {
    return 'Вибрано $count';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Інших пультів з кнопками не знайдено.';

  @override
  String get sourceRemote => 'Пульт-джерело';

  @override
  String get searchButtons => 'Кнопки пошуку';

  @override
  String get searchButtonsHint => 'Живлення, гучність, вимкнення звуку...';

  @override
  String get selectVisible => 'Виберіть видимий';

  @override
  String get clearVisible => 'Ясно видно';

  @override
  String protocolNamed(Object name) {
    return 'Протокол: $name';
  }

  @override
  String get rawSignal => 'Сирий';

  @override
  String get legacyCode => 'Застарілий код';

  @override
  String importCount(int count) {
    return 'Імпортувати $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'У дозволі на зберігання відмовлено (потрібен на деяких старіших пристроях Android).';

  @override
  String get backupExportedToDownloads => 'Резервну копію збережено.';

  @override
  String failedToExport(Object error) {
    return 'Не вдалося експортувати: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Імпортовано $count пульта із застарілої резервної копії JSON. Макроси не змінено.',
      many:
          'Імпортовано $count пультів із застарілої резервної копії JSON. Макроси не змінено.',
      few:
          'Імпортовано $count пульти із застарілої резервної копії JSON. Макроси не змінено.',
      one:
          'Імпортовано $count пульт із застарілої резервної копії JSON. Макроси не змінено.',
    );
    return '$_temp0';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Не вдалося імпортувати: неправильний формат списку пультів у резервній копії.';

  @override
  String get importFailedMacrosMustBeList =>
      'Не вдалося імпортувати: неправильний формат списку макросів у резервній копії.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Не вдалося імпортувати: цей формат резервної копії не підтримується.';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    String _temp0 = intl.Intl.pluralLogic(
      remoteCount,
      locale: localeName,
      other:
          'Імпортовано $remoteCount пульта з резервної копії. Макроси не змінено.',
      many:
          'Імпортовано $remoteCount пультів із резервної копії. Макроси не змінено.',
      few:
          'Імпортовано $remoteCount пульти з резервної копії. Макроси не змінено.',
      one:
          'Імпортовано $remoteCount пульт із резервної копії. Макроси не змінено.',
    );
    return '$_temp0';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    String _temp0 = intl.Intl.pluralLogic(
      remoteCount,
      locale: localeName,
      other: '$remoteCount пульта',
      many: '$remoteCount пультів',
      few: '$remoteCount пульти',
      one: '$remoteCount пульт',
    );
    String _temp1 = intl.Intl.pluralLogic(
      macroCount,
      locale: localeName,
      other: '$macroCount макросу імпортовано',
      many: '$macroCount макросів імпортовано',
      few: '$macroCount макроси імпортовано',
      one: '$macroCount макрос імпортовано',
    );
    return '$_temp0 і $_temp1 з резервної копії.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Не вдалося імпортувати: у файлі .ir немає придатних кнопок.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Імпортовано 1 пульт із файлу Flipper .ir. Макроси не змінено.';

  @override
  String get importFailedInvalidIrplus =>
      'Не вдалося імпортувати: у файлі IRPLUS немає придатних кнопок.';

  @override
  String get importedOneRemoteFromIrplus =>
      'Імпортовано 1 пульт із файлу IRPLUS. Макроси не змінено.';

  @override
  String get importFailedInvalidLirc =>
      'Не вдалося імпортувати: у файлі LIRC немає придатних ІЧ-кодів.';

  @override
  String get importedOneRemoteFromLirc =>
      'Імпортовано 1 пульт із файлу LIRC. Макроси не змінено.';

  @override
  String get unsupportedFileTypeSelected => 'Цей тип файлу не підтримується.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Не вдалося імпортувати: файл некоректний або його неможливо прочитати.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Масовий імпорт завершено: у папці не знайдено підтримуваних файлів.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Масовий імпорт завершено: пульти не імпортовано. Пропущено файл(и) $skippedCount.';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Масове імпортування завершено: імпортовано пульт(и) $importedCount із підтримуваних файлів(ів) $supportedCount. Пропущено файл(и) $skippedCount.';
  }

  @override
  String get storagePermissionDenied => 'У дозволі на зберігання відмовлено.';

  @override
  String get bulkImportFailedReadFolder =>
      'Помилка масового імпорту: неможливо прочитати вміст папки.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Масове імпортування завершено: підтримуваних файлів не знайдено ($sourceLabel).';
  }

  @override
  String get clearAction => 'Очистити';

  @override
  String get saveAction => 'Зберегти';

  @override
  String buttonsTitleCount(int count) {
    return 'Кнопки ($count)';
  }

  @override
  String get invalidStepEncountered =>
      'У цьому макросі є некоректний крок. Виправте його перед повторним запуском.';

  @override
  String failedToSendNamed(Object name) {
    return 'Не вдалося надіслати: $name';
  }

  @override
  String get buttonNotFound => 'Кнопку не знайдено';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Кнопку не знайдено: $name';
  }

  @override
  String get unknownButton => 'Невідома кнопка';

  @override
  String durationSecondsShort(int seconds) {
    return '$seconds с';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '$minutes хв $seconds с';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '$hours год $minutes хв';
  }

  @override
  String get orientationFlippedTooltip =>
      'Орієнтація: перевернуто (натисніть до нормального)';

  @override
  String get orientationNormalTooltip =>
      'Орієнтація: нормальна (торкніться, щоб перевернути)';

  @override
  String get noSteps => 'Немає кроків';

  @override
  String stepProgress(int current, int total) {
    return 'Крок $current із $total';
  }

  @override
  String get completed => 'Виконано';

  @override
  String get paused => 'Призупинено';

  @override
  String get running => 'Виконується';

  @override
  String get ready => 'Готово';

  @override
  String stepsProgress(int current, int total) {
    return 'Кроки: $current / $total';
  }

  @override
  String get waiting => 'Очікування';

  @override
  String secondsRemaining(num seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
            locale: localeName, decimalDigits: 1);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Залишилося: $secondsString с';
  }

  @override
  String millisecondsShort(int ms) {
    return '$ms мс';
  }

  @override
  String get tapContinueWhenReady =>
      'Торкніться «Продовжити», коли будете готові до наступного кроку.';

  @override
  String get error => 'Помилка';

  @override
  String get macroCompleted => 'Макрос завершено';

  @override
  String finishedIn(Object duration) {
    return 'Завершено за $duration';
  }

  @override
  String get sequence => 'Кроки';

  @override
  String waitMilliseconds(int ms) {
    return 'Зачекати $ms мс';
  }

  @override
  String get runAgain => 'Запустити знову';

  @override
  String get startMacro => 'Запустити макрос';

  @override
  String get continueAction => 'Продовжити';

  @override
  String get unnamedRemote => 'Пульт без назви';

  @override
  String get enterMacroName => 'Введіть назву макросу.';

  @override
  String get addAtLeastOneStep => 'Додайте хоча б один крок.';

  @override
  String get fixInvalidSteps => 'Виправте некоректні кроки перед збереженням.';

  @override
  String get unknownCommand => 'Невідома команда';

  @override
  String get unnamedCommand => 'Команда без назви';

  @override
  String get iconCommand => 'Кнопка зі значком';

  @override
  String get selectDelay => 'Виберіть час очікування';

  @override
  String keepMilliseconds(int ms) {
    return 'Залишити $ms мс';
  }

  @override
  String get custom => 'Власний';

  @override
  String get enterCustomDelayDuration => 'Введіть інший час очікування';

  @override
  String millisecondsLong(int ms) {
    String _temp0 = intl.Intl.pluralLogic(
      ms,
      locale: localeName,
      other: '$ms мілісекунди',
      many: '$ms мілісекунд',
      few: '$ms мілісекунди',
      one: '$ms мілісекунда',
    );
    return '$_temp0';
  }

  @override
  String secondsLong(num seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$secondsString секунди',
      many: '$secondsString секунд',
      few: '$secondsString секунди',
      one: '$secondsString секунда',
    );
    return '$_temp0';
  }

  @override
  String get customDelay => 'Власний час очікування';

  @override
  String get delayMillisecondsLabel => 'Очікування (мс)';

  @override
  String get delayMillisecondsHint => '3000';

  @override
  String get recommendedDelayRange =>
      '1000 мілісекунд = 1 секунда. Дайте пристрою достатньо часу на реакцію.';

  @override
  String get enterValidPositiveNumber => 'Введіть ціле число більше нуля.';

  @override
  String get ok => 'добре';

  @override
  String get remote => 'Пульт';

  @override
  String get macroName => 'Назва макросу';

  @override
  String get macroNameHint => 'наприклад, Кіновечір';

  @override
  String stepsTitleCount(int count) {
    return 'Кроки ($count)';
  }

  @override
  String get noStepsYet => 'Кроків ще немає';

  @override
  String get addCommandsAndDelaysHint =>
      'Додайте команди, час очікування або паузи для підтвердження. Кроки виконуються в показаному порядку.';

  @override
  String get addStep => 'Додати крок';

  @override
  String get reorderStepsHint =>
      'Перетягніть крок за значок, щоб змінити порядок. Торкніться кроку, щоб відредагувати його.';

  @override
  String reorderStep(int index) {
    return 'Перемістити крок $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Натисніть і перетягніть, щоб перемістити крок';

  @override
  String deleteStep(int index) {
    return 'Видалити крок $index';
  }

  @override
  String get invalidStepTapToFix =>
      'Некоректний крок. Торкніться, щоб виправити.';

  @override
  String get sendIrCommand => 'Надіслати ІЧ-команду';

  @override
  String get waitForUserConfirmation =>
      'Призупиняє макрос, доки ви не продовжите його виконання.';

  @override
  String get notImplemented => 'Не реалізовано';

  @override
  String frequencyKhz(int value) {
    return '$value кГц';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Широке';

  @override
  String get iconButton => 'Значок кнопки';

  @override
  String get imageButton => 'Кнопка зображення';

  @override
  String get noSignalInfo => 'Немає інформації про сигнал';

  @override
  String get proceed => 'Продовжуйте';

  @override
  String get discard => 'Відкинути';

  @override
  String get continueEditing => 'Редагувати далі';

  @override
  String get unsavedChangesTitle => 'Незбережені зміни';

  @override
  String get unsavedMacroChangesMessage =>
      'Відкинути зміни цього макросу? Їх не буде збережено.';

  @override
  String get stopMacroBeforeLeaving =>
      'Зупиніть макрос, перш ніж залишити цей екран.';

  @override
  String get stopTestingBeforeLeaving =>
      'Припиніть тестування, перш ніж залишити цей екран.';

  @override
  String get idle => 'Бездіяльність';

  @override
  String get start => 'старт';

  @override
  String get resume => 'Резюме';

  @override
  String get pause => 'Пауза';

  @override
  String get stopped => 'Зупинився';

  @override
  String get copy => 'Копіювати';

  @override
  String get send => 'Надіслати';

  @override
  String get step => 'Крок';

  @override
  String get addToRemote => 'Додати на пульт';

  @override
  String get noDescriptionAvailable => 'Немає опису.';

  @override
  String get notAvailableSymbol => '-';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Постачальник Kaseikyo має містити рівно 4 шістнадцяткові цифри.';

  @override
  String get irFinderDatabaseNotReady => 'База даних ще не готова.';

  @override
  String get irFinderSelectBrandFirst =>
      'Спочатку виберіть бренд у налаштуваннях.';

  @override
  String get irFinderBruteforceUnavailable =>
      'Brute-force ще не доступний для цього протоколу.';

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
    return 'Ключ: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Пульт #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Введіть індекс на основі 0 у відфільтрованих упорядкованих результатах бази даних.';

  @override
  String get irFinderJumpCursorHelper =>
      'Введіть шістнадцятковий курсор від нуля в область підбору.';

  @override
  String get irFinderSetupTab => 'Налаштування';

  @override
  String get irFinderTestTab => 'Тест';

  @override
  String get irFinderResultsTab => 'Результати';

  @override
  String get irFinderContinueToTest => 'Продовжуйте тестувати';

  @override
  String get irFinderKaseikyoVendorTitle => 'Продавець Kaseikyo';

  @override
  String get irFinderCustomVendorLabel =>
      'Спеціальний постачальник (4 шістнадцяткові)';

  @override
  String get irFinderBrowseDbCandidates => 'Перегляд кандидатів БД…';

  @override
  String get irFinderEditSetup => 'Редагувати налаштування';

  @override
  String get irFinderNoSavedHits =>
      'Ще немає збережених звернень. На тестовій сторінці натисніть «Зберегти звернення», коли пристрій відповість.';

  @override
  String get irFinderBackToTest => 'Назад до тесту';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Великий простір пошуку';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Цей простір грубої сили дуже великий (можливості $human). ІЧ-шукач все одно поважатиме ваші максимальні спроби та час відновлення, але пам’ятайте про спам із ІЧ-пристроїв.\n\nРекомендація: спочатку використовуйте режим бази даних і/або введіть відомі байти префікса, щоб зменшити простір.';
  }

  @override
  String get irFinderDatabaseSession => 'Сеанс бази даних';

  @override
  String get irFinderBruteforceSession => 'Сеанс грубої сили';

  @override
  String get irFinderResumeLastSession => 'Відновити останній сеанс';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Бренд: $brand · Модель: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Префікс: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Прогрес: $progress · Розпочато: $when';
  }

  @override
  String get irFinderApplyResume => 'Подати заявку та відновити';

  @override
  String get irFinderBruteforceMode => 'Груба сила';

  @override
  String get irFinderDatabaseAssistedMode => 'За допомогою бази даних';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Протокол: $name';
  }

  @override
  String get irFinderProtocolLabel => 'ІЧ-протокол';

  @override
  String get irFinderProtocolHelper =>
      'Керує кодуванням і, отже, простором пошуку.';

  @override
  String get irFinderKnownPrefixLabel =>
      'Відомий префікс (шістнадцяткові байти, необов’язково)';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Корисне навантаження: $digits шістнадцяткові цифри';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Корисне навантаження: $digits шістнадцяткові цифри · Приклад: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Корисне навантаження: $digits шістнадцяткова цифра(и) · Макс. префікс: $bytes байт(и)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Корисне навантаження: $digits шістнадцяткова цифра(и) · Приклад: $example · Макс. префікс: $bytes байт(и)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Приклад: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Введіть будь-які відомі перші байти, щоб зменшити простір пошуку.';

  @override
  String get irFinderDatabaseMode => 'База даних';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Нормований префікс: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Нормований префікс';

  @override
  String get irFinderBruteforceNotConfigured =>
      'Brute-force ще не налаштовано для цього протоколу.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Усі ($value)';
  }

  @override
  String get irFinderTestControls => 'Тестовий контроль';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Довжина корисного навантаження: $digits шістнадцяткова цифра(и).';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Простір пошуку: можливості $value (після обмежень префікса).';
  }

  @override
  String get irFinderCooldownMs => 'Перезарядка (мс)';

  @override
  String get irFinderMaxAttemptsPerRun =>
      'Максимальна кількість спроб (за пробіжку)';

  @override
  String get irFinderTestAllCombinations => 'Перевірте всі комбінації';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Працює, доки не буде вичерпано простір пошуку. Ефективний ліміт: $value';
  }

  @override
  String get irFinderAttempts => 'Спроби';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Діапазон повзунка: 1–$max (введіть будь-яке число для більших значень)';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Макс\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Ефективний ліміт цього запуску: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Порада: спочатку використовуйте режим бази даних; brute-force найкраще з відомим префіксом (наприклад, перші 1–4 байти).';

  @override
  String get irFinderDatabaseInitFailed => 'Помилка ініціалізації бази даних.';

  @override
  String get irFinderPreparingDatabase =>
      'Підготовка локальної бази даних ІЧ-кодів…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Пошук за допомогою бази даних';

  @override
  String get irFinderBrand => 'Бренд';

  @override
  String get irFinderSelectBrand => 'Виберіть бренд';

  @override
  String get irFinderModelOptional => 'Модель (необов\'язково)';

  @override
  String get irFinderSelectBrandFirstShort => 'Спочатку виберіть бренд';

  @override
  String get irFinderSelectModelRecommended =>
      'Виберіть модель (рекомендовано)';

  @override
  String get irFinderOnlySelectedProtocol => 'Лише обраний протокол';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Фільтрує ключі до вибраного протоколу. Вимкніть його, щоб переглянути всі протоколи.';

  @override
  String get irFinderQuickWinsFirst => 'Швидкий перемагає першим';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Надає перевагу клавішам POWER, MUTE, VOL і CH перед більш глибокими клавішами.';

  @override
  String get irFinderMaxKeysPerRun =>
      'Максимальна кількість ключів для тестування (за запуск)';

  @override
  String get irFinderTesting => 'Тестування…';

  @override
  String get irFinderCooldown => 'Кулдаун';

  @override
  String get irFinderEta => 'Залишилося';

  @override
  String get irFinderMode => 'Режим';

  @override
  String get irFinderRetryLast => 'Повторіть останню';

  @override
  String get irFinderTrigger => 'Тригер';

  @override
  String get irFinderJump => 'Стрибок…';

  @override
  String get irFinderSaveHit => 'Зберегти удар';

  @override
  String irFinderEtaSeconds(int seconds) {
    return '$seconds с';
  }

  @override
  String irFinderEtaMinutesSeconds(int minutes, int seconds) {
    return '$minutes хв $seconds с';
  }

  @override
  String irFinderEtaHoursMinutes(int hours, int minutes) {
    return '$hours год $minutes хв';
  }

  @override
  String irFinderLastAttemptedCode(Object value) {
    return 'Код останньої спроби: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Почніть тестування, щоб побачити останній спробований код.';

  @override
  String irFinderFromDb(Object value) {
    return 'З БД: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'З грубої сили (генерується кодувальником протоколу).';

  @override
  String irFinderSendError(Object error) {
    return 'Помилка надсилання: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Джерело: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Результати підтримують тестування та копіювання негайно. Інтеграцію прямого додавання до пульта можна розширити далі в процесі редактора.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Перегляньте кандидати БД';

  @override
  String get irFinderFilterByLabelOrHex =>
      'Фільтрувати за міткою або шістнадцятковим…';

  @override
  String get irFinderJumpHere => 'Стрибай сюди';

  @override
  String get irFinderSelectModel => 'Виберіть модель';

  @override
  String get irFinderSearchBrands => 'Пошук брендів…';

  @override
  String get irFinderSearchModels => 'Пошук моделей…';

  @override
  String get iconPickerTitle => 'Виберіть значок';

  @override
  String get iconPickerSearchHint => 'Значки пошуку...';

  @override
  String get iconPickerNoIconsFound => 'Значок не знайдено';

  @override
  String iconPickerIconsAvailable(int count) {
    return 'Доступні значки $count';
  }

  @override
  String get iconPickerCategoryAll => 'все';

  @override
  String get iconPickerCategoryMedia => 'ЗМІ';

  @override
  String get iconPickerCategoryVolume => 'Обсяг';

  @override
  String get iconPickerCategoryNavigation => 'Навігація';

  @override
  String get iconPickerCategoryPower => 'Живлення';

  @override
  String get iconPickerCategoryNumbers => 'Числа';

  @override
  String get iconPickerCategorySettings => 'Налаштування';

  @override
  String get iconPickerCategoryDisplay => 'Дисплей';

  @override
  String get iconPickerCategoryInput => 'Введення';

  @override
  String get iconPickerCategoryFavorite => 'улюблений';

  @override
  String get universalPowerTitle => 'Універсальна сила';

  @override
  String get universalPowerRunTab => 'бігти';

  @override
  String get universalPowerUseResponsibly => 'Використовуйте відповідально';

  @override
  String get universalPowerConsentBody =>
      'Універсальні цикли живлення ІЧ-коди живлення. Використовуйте його лише на пристроях, якими володієте чи керуєте. Зупиніть, як тільки пристрій відреагує.';

  @override
  String get universalPowerConsentCheckbox => 'Я володію або керую пристроєм';

  @override
  String get universalPowerSetupBody =>
      'Циклує коди живлення для вибраного бренду. Зупиніть, як тільки пристрій відреагує.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Востаннє надіслано: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Не знайдено кодів живлення. Спробуйте розширити пошук.';

  @override
  String get universalPowerUnableToStart => 'Неможливо запустити.';

  @override
  String get universalPowerAllBrands => 'Усі марки (без фільтра)';

  @override
  String get universalPowerClearBrandFilter => 'Очистити фільтр бренду';

  @override
  String get universalPowerBroadenSearch => 'За потреби розширте пошук';

  @override
  String get universalPowerBroadenSearchHint =>
      'Якщо ярлики живлення не знайдені, додайте інші ключі.';

  @override
  String get universalPowerAdditionalPatternsDepth =>
      'Додаткова глибина візерунків';

  @override
  String get universalPowerDepth1 => 'Лише пріоритет: ЖИВЛЕННЯ/ВИМК';

  @override
  String get universalPowerDepth2 => 'Додайте псевдоніми POWER';

  @override
  String get universalPowerDepth3 => 'Додайте вторинні мітки живлення';

  @override
  String get universalPowerDepth4 => 'Включити всі мітки (найнижчий пріоритет)';

  @override
  String get universalPowerLoopUntilStopped => 'Цикл до зупинки';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Продовжує чергувати чергу, доки ви її не зупините.';

  @override
  String get universalPowerDelayBetweenCodes => 'Затримка між кодами';

  @override
  String get universalPowerStart => 'Запустіть Universal Power';

  @override
  String get universalPowerRunStatus => 'Статус запуску';

  @override
  String universalPowerProgress(Object value) {
    return 'Прогрес: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Призупинено, оскільки програма працювала у фоновому режимі.';

  @override
  String get universalPowerSendOneCode => 'Надішліть один код';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Зупиніть, як тільки пристрій відреагує.';

  @override
  String get iconNamePlay => 'грати';

  @override
  String get iconNamePause => 'Пауза';

  @override
  String get iconNameStop => 'Стоп';

  @override
  String get iconNameFastForward => 'Перемотування вперед';

  @override
  String get iconNameRewind => 'Перемотати назад';

  @override
  String get iconNameSkipNext => 'Пропустити далі';

  @override
  String get iconNameSkipPrevious => 'Пропустити попередній';

  @override
  String get iconNameReplay => 'Повтор';

  @override
  String get iconNameForward10S => 'Вперед 10с';

  @override
  String get iconNameForward30S => 'Вперед 30с';

  @override
  String get iconNameReplay10S => 'Повторити 10 секунд';

  @override
  String get iconNameReplay30S => 'Повтор 30-х років';

  @override
  String get iconNameRecord => 'запис';

  @override
  String get iconNameRecordAlt => 'Запис Alt';

  @override
  String get iconNameEject => 'Витягнути';

  @override
  String get iconNameShuffle => 'Перетасувати';

  @override
  String get iconNameRepeat => 'Повторіть';

  @override
  String get iconNameRepeatOne => 'Повторіть один';

  @override
  String get iconNameVolumeUp => 'Збільшення гучності';

  @override
  String get iconNameVolumeDown => 'Зменшення гучності';

  @override
  String get iconNameVolumeOff => 'Вимкнення гучності';

  @override
  String get iconNameMute => 'Вимкнути звук';

  @override
  String get iconNameSpeaker => 'Спікер';

  @override
  String get iconNameSurroundSound => 'Об\'ємний звук';

  @override
  String get iconNameEqualizer => 'Еквалайзер';

  @override
  String get iconNameAudio => 'Аудіо';

  @override
  String get iconNameMicrophone => 'мікрофон';

  @override
  String get iconNameMicOff => 'Мікрофон вимкнено';

  @override
  String get iconNameUp => 'вгору';

  @override
  String get iconNameDown => 'вниз';

  @override
  String get iconNameLeft => 'Ліворуч';

  @override
  String get iconNameRight => 'правильно';

  @override
  String get iconNameArrowUp => 'Стрілка вгору';

  @override
  String get iconNameArrowDown => 'Стрілка вниз';

  @override
  String get iconNameArrowLeft => 'Стрілка вліво';

  @override
  String get iconNameArrowRight => 'Стрілка вправо';

  @override
  String get iconNameNavigation => 'Навігація';

  @override
  String get iconNameChevronLeft => 'Шеврон ліворуч';

  @override
  String get iconNameChevronRight => 'Шеврон справа';

  @override
  String get iconNameExpandLess => 'Розгорнути менше';

  @override
  String get iconNameExpandMore => 'Розгорнути Більше';

  @override
  String get iconNameCollapse => 'Згорнути';

  @override
  String get iconNameExpand => 'Розгорнути';

  @override
  String get iconNameCircleUp => 'Круг вгору';

  @override
  String get iconNameCircleDown => 'Круг вниз';

  @override
  String get iconNameCircleLeft => 'Круг ліворуч';

  @override
  String get iconNameCircleRight => 'Круг Праворуч';

  @override
  String get iconNameOkSelect => 'OK/Вибрати';

  @override
  String get iconNameConfirm => 'Підтвердити';

  @override
  String get iconNameCancel => 'Скасувати';

  @override
  String get iconNameClose => 'Закрити';

  @override
  String get iconNameHome => 'додому';

  @override
  String get iconNameReturn => 'Повернення';

  @override
  String get iconNameExit => 'Вихід';

  @override
  String get iconNameUndo => 'Скасувати';

  @override
  String get iconNameRedo => 'Повторити';

  @override
  String get iconNamePower => 'Живлення';

  @override
  String get iconNamePowerAlt => 'Живлення, альтернативна';

  @override
  String get iconNamePowerOff => 'Вимкнення';

  @override
  String get iconNameOn => 'Увімкнено';

  @override
  String get iconNameOff => 'Вимкнено';

  @override
  String get iconNameToggleOn => 'Увімкнути';

  @override
  String get iconNameToggleOff => 'Вимкнути';

  @override
  String get iconNameRestart => 'Перезапустіть';

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
  String get iconNameOne => 'Один';

  @override
  String get iconNameTwo => 'Два';

  @override
  String get iconNameThree => 'три';

  @override
  String get iconNameFour => 'чотири';

  @override
  String get iconNameFive => 'П\'ять';

  @override
  String get iconNameSix => 'Шість';

  @override
  String get iconNamePlus => 'плюс';

  @override
  String get iconNameMinus => 'Мінус';

  @override
  String get iconNameAddCircle => 'Додати коло';

  @override
  String get iconNameRemoveCircle => 'Видалити коло';

  @override
  String get iconNameSettings => 'Налаштування';

  @override
  String get iconNameMenu => 'Меню';

  @override
  String get iconNameMoreVertical => 'Більш вертикально';

  @override
  String get iconNameMoreHorizontal => 'Більше горизонтально';

  @override
  String get iconNameTune => 'Налаштувати';

  @override
  String get iconNameRemoteSettings => 'Налаштування пульта';

  @override
  String get iconNameInfo => 'Інформація';

  @override
  String get iconNameInfoOutline => 'Конспект інформації';

  @override
  String get iconNameHelp => 'Довідка';

  @override
  String get iconNameHelpOutline => 'План довідки';

  @override
  String get iconNameList => 'Список';

  @override
  String get iconNameViewList => 'Переглянути список';

  @override
  String get iconNameViewGrid => 'Перегляд сітки';

  @override
  String get iconNameApps => 'програми';

  @override
  String get iconNameWidgets => 'Віджети';

  @override
  String get iconNameTv => 'телевізор';

  @override
  String get iconNameMonitor => 'Монітор';

  @override
  String get iconNameDesktop => 'Робочий стіл';

  @override
  String get iconNameBrightnessHigh => 'Висока яскравість';

  @override
  String get iconNameBrightnessMedium => 'Яскравість Середня';

  @override
  String get iconNameBrightnessLow => 'Низька яскравість';

  @override
  String get iconNameAutoBrightness => 'Автоматична яскравість';

  @override
  String get iconNameLightMode => 'Світловий режим';

  @override
  String get iconNameDarkMode => 'Темний режим';

  @override
  String get iconNameContrast => 'Контраст';

  @override
  String get iconNameHdrOn => 'HDR увімкнено';

  @override
  String get iconNameHdrOff => 'HDR вимкнено';

  @override
  String get iconNameAspectRatio => 'Співвідношення сторін';

  @override
  String get iconNameCrop => 'кадрування';

  @override
  String get iconNameZoomIn => 'Збільшити';

  @override
  String get iconNameZoomOut => 'Зменшити';

  @override
  String get iconNameFullscreen => 'Повний екран';

  @override
  String get iconNameExitFullscreen => 'Вийти з повноекранного режиму';

  @override
  String get iconNameFitScreen => 'За розміром екрана';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'Обрізати безкоштовно';

  @override
  String get iconNameInput => 'Введення';

  @override
  String get iconNameCable => 'Кабель';

  @override
  String get iconNameCast => 'акторський склад';

  @override
  String get iconNameCastConnected => 'Трансляцію підключено';

  @override
  String get iconNameScreenShare => 'Поділитися екраном';

  @override
  String get iconNameBluetooth => 'Bluetooth';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => 'Маршрутизатор';

  @override
  String get iconNameMemory => 'Пам\'ять';

  @override
  String get iconNameGameConsole => 'Ігрова консоль';

  @override
  String get iconNameGaming => 'Ігри';

  @override
  String get iconNameMedia => 'ЗМІ';

  @override
  String get iconNameMusicQueue => 'Музична черга';

  @override
  String get iconNameVideoLibrary => 'Відеотека';

  @override
  String get iconNamePhotoLibrary => 'Бібліотека фотографій';

  @override
  String get iconNameComponent => 'компонент';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => 'Композитний';

  @override
  String get iconNameAntenna => 'антена';

  @override
  String get iconNameFavorite => 'улюблений';

  @override
  String get iconNameFavoriteOutline => 'Улюблений план';

  @override
  String get iconNameStar => 'зірка';

  @override
  String get iconNameStarOutline => 'Контур зірки';

  @override
  String get iconNameBookmark => 'Закладка';

  @override
  String get iconNameBookmarkOutline => 'Контур закладки';

  @override
  String get iconNameFlag => 'Прапор';

  @override
  String get iconNameCheck => 'Перевірте';

  @override
  String get iconNameDone => 'Готово';

  @override
  String get iconNameDoneAll => 'Готово все';

  @override
  String get iconNameSchedule => 'розклад';

  @override
  String get iconNameTimer => 'Таймер';

  @override
  String get iconNameTime => 'час';

  @override
  String get iconNameAlarm => 'сигналізація';

  @override
  String get iconNameNotifications => 'Сповіщення';

  @override
  String get iconNameLock => 'Замок';

  @override
  String get iconNameUnlock => 'Розблокувати';

  @override
  String get iconNameLight => 'світло';

  @override
  String get iconNameLightOutline => 'Легкий контур';

  @override
  String get iconNameWarmLight => 'Тепле світло';

  @override
  String get iconNameSunny => 'Сонячно';

  @override
  String get iconNameCloudy => 'Хмарно';

  @override
  String get iconNameNight => 'ніч';

  @override
  String get iconNameFlare => 'Відблиск';

  @override
  String get iconNameGradient => 'Градієнт';

  @override
  String get iconNameInvertColors => 'Інвертувати кольори';

  @override
  String get iconNamePalette => 'Палітра';

  @override
  String get iconNameColor => 'Колір';

  @override
  String get iconNameTonality => 'Тональність';

  @override
  String get iconNameSearch => 'Пошук';

  @override
  String get iconNameRefresh => 'Оновити';

  @override
  String get iconNameSync => 'Синхронізувати';

  @override
  String get iconNameUpdate => 'Оновлення';

  @override
  String get iconNameDownload => 'Завантажити';

  @override
  String get iconNameUpload => 'Завантажити';

  @override
  String get iconNameCloud => 'Хмара';

  @override
  String get iconNameFolder => 'Папка';

  @override
  String get iconNameDelete => 'Видалити';

  @override
  String get iconNameEdit => 'Редагувати';

  @override
  String get iconNameSave => 'зберегти';

  @override
  String get iconNameShare => 'Поділіться';

  @override
  String get iconNamePrint => 'Роздрукувати';

  @override
  String get iconNameLanguage => 'Мова';

  @override
  String get iconNameTranslate => 'Перекласти';

  @override
  String get iconNameMicNone => 'Мікрофон Немає';

  @override
  String get iconNameSubtitles => 'Субтитри';

  @override
  String get iconNameClosedCaption => 'Субтитри';

  @override
  String get iconNameMusic => 'музика';

  @override
  String get iconNameMovie => 'фільм';

  @override
  String get iconNameTheater => 'Театр';

  @override
  String get iconNameLiveTv => 'Пряме телебачення';

  @override
  String get iconNameRadio => 'радіо';

  @override
  String get iconNameCamera => 'Камера';

  @override
  String get iconNameVideoCamera => 'Відеокамера';

  @override
  String get iconNamePhotoCamera => 'Фотоапарат';

  @override
  String get iconNameSlowMotion => 'Повільний рух';

  @override
  String get iconNameSpeed => 'швидкість';

  @override
  String get iconNameVideoSettings => 'Налаштування відео';

  @override
  String get iconNameAudioTrack => 'Аудіодоріжка';

  @override
  String get iconNameGraphicEq => 'Графічний еквалайзер';

  @override
  String get iconNameMusicVideo => 'Музичне відео';

  @override
  String get iconNamePlaylist => 'Список відтворення';

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
  String get iconNameHashFa => 'Хеш # FA';

  @override
  String get iconNamePercentFa => 'Відсоток % FA';

  @override
  String get iconNameDivideFa => 'Ділення ÷ FA';

  @override
  String get iconNameMultiplyFa => 'Множення × FA';

  @override
  String get iconNameEqualsFa => 'Дорівнює = FA';

  @override
  String get iconNameNotEqualFa => 'Не дорівнює ≠ FA';

  @override
  String get iconNameGreaterThanFa => 'Більше ніж > FA';

  @override
  String get iconNameLessThanFa => 'Менше < FA';

  @override
  String get iconNameAsteriskFa => 'Зірочка * FA';

  @override
  String get iconNameAFa => 'FA';

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
  String get iconNamePlayFa => 'Грати в FA';

  @override
  String get iconNamePauseFa => 'Пауза FA';

  @override
  String get iconNameStopFa => 'Зупинити FA';

  @override
  String get iconNamePlayFaOutline => 'Грати в FA Outline';

  @override
  String get iconNamePauseFaOutline => 'Призупинити схему FA';

  @override
  String get iconNameStopFaOutline => 'Зупинити FA Outline';

  @override
  String get iconNameBackwardFa => 'Назад FA';

  @override
  String get iconNameForwardFa => 'Нападник FA';

  @override
  String get iconNamePreviousFa => 'Попередній FA';

  @override
  String get iconNameNextFa => 'Наступний FA';

  @override
  String get iconNameRewindFa => 'Перемотати FA';

  @override
  String get iconNameFastForwardFa => 'Перемотування вперед FA';

  @override
  String get iconNameRepeatFa => 'Повторіть FA';

  @override
  String get iconNameShuffleFa => 'Перетасувати FA';

  @override
  String get iconNameEjectFa => 'Викинути FA';

  @override
  String get iconNameFilmFa => 'Фільм FA';

  @override
  String get iconNameVideoFa => 'Відео FA';

  @override
  String get iconNameMusicFa => 'Музика FA';

  @override
  String get iconNameMicrophoneFa => 'Мікрофон FA';

  @override
  String get iconNameCameraFa => 'Камера FA';

  @override
  String get iconNameCameraRetroFa => 'Камера ретро FA';

  @override
  String get iconNameVolumeHighFa => 'Високий об\'єм FA';

  @override
  String get iconNameVolumeLowFa => 'Низька гучність FA';

  @override
  String get iconNameVolumeOffFa => 'Вимкнення гучності FA';

  @override
  String get iconNameMuteFa => 'Вимкнути FA';

  @override
  String get iconNameMicMuteFa => 'Вимкнення мікрофона FA';

  @override
  String get iconNameHeadphonesFa => 'Навушники FA';

  @override
  String get iconNameSpeakerFa => 'Доповідач Ф.А';

  @override
  String get iconNameUpFa => 'Вгору FA';

  @override
  String get iconNameDownFa => 'Вниз FA';

  @override
  String get iconNameLeftFa => 'Ліворуч FA';

  @override
  String get iconNameRightFa => 'Справа FA';

  @override
  String get iconNameUpFaOutline => 'Вгору FA Схема';

  @override
  String get iconNameDownFaOutline => 'Вниз, контур FA';

  @override
  String get iconNameLeftFaOutline => 'Лівий контур FA';

  @override
  String get iconNameRightFaOutline => 'Правий контур FA';

  @override
  String get iconNameArrowUpFa => 'Стрілка вгору FA';

  @override
  String get iconNameArrowDownFa => 'Стрілка вниз FA';

  @override
  String get iconNameArrowLeftFa => 'Стрілка вліво FA';

  @override
  String get iconNameArrowRightFa => 'Стрілка вправо FA';

  @override
  String get iconNameChevronUpFa => 'Шеврон угору FA';

  @override
  String get iconNameChevronDownFa => 'Шеврон униз FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron лівий FA';

  @override
  String get iconNameChevronRightFa => 'Шеврон праворуч FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Схема';

  @override
  String get iconNameCheckFa => 'Перевірте FA';

  @override
  String get iconNameCloseFa => 'Закрити FA';

  @override
  String get iconNameCloseCircleFa => 'Замкнути коло FA';

  @override
  String get iconNameHomeFa => 'Головна FA';

  @override
  String get iconNameUndoFa => 'Скасувати FA';

  @override
  String get iconNameRedoFa => 'Повторити FA';

  @override
  String get iconNameRotateFa => 'Обертати FA';

  @override
  String get iconNameSearchFa => 'Пошук FA';

  @override
  String get iconNameRefreshFa => 'Оновити FA';

  @override
  String get iconNamePowerOffFa => 'Вимкнення FA';

  @override
  String get iconNamePlugFa => 'Вилка FA';

  @override
  String get iconNameToggleOnFa => 'Увімкнути FA';

  @override
  String get iconNameToggleOffFa => 'Вимкніть FA';

  @override
  String get iconNameSettingsFa => 'Налаштування FA';

  @override
  String get iconNameSettingsAltFa => 'Налаштування Alt FA';

  @override
  String get iconNameMenuFa => 'Меню FA';

  @override
  String get iconNameMoreFa => 'Більше FA';

  @override
  String get iconNameMoreVerticalFa => 'Більш вертикальний FA';

  @override
  String get iconNameInfoFa => 'Інформація FA';

  @override
  String get iconNameInfoFaOutline => 'Інформація FA Схема';

  @override
  String get iconNameHelpFa => 'Довідка FA';

  @override
  String get iconNameHelpFaOutline => 'Довідка FA Схема';

  @override
  String get iconNameListFa => 'Список FA';

  @override
  String get iconNameGridFa => 'Сітка FA';

  @override
  String get iconNameSlidersFa => 'Повзунки FA';

  @override
  String get iconNameTvFa => 'ТБ FA';

  @override
  String get iconNameMonitorFa => 'Монітор FA';

  @override
  String get iconNameDesktopFa => 'Настільний FA';

  @override
  String get iconNameBrightnessFa => 'Яскравість FA';

  @override
  String get iconNameNightModeFa => 'Нічний режим FA';

  @override
  String get iconNameLightFa => 'Світло FA';

  @override
  String get iconNameLightFaOutline => 'Світло, контур FA';

  @override
  String get iconNameFlashFa => 'Спалах FA';

  @override
  String get iconNameFullscreenFa => 'Повноекранний FA';

  @override
  String get iconNameExitFullscreenFa => 'Вийти з повноекранного режиму FA';

  @override
  String get iconNameZoomInFa => 'Збільшити FA';

  @override
  String get iconNameZoomOutFa => 'Зменшити FA';

  @override
  String get iconNameSubtitlesFa => 'Субтитри FA';

  @override
  String get iconNamePictureInPictureFa => 'Картинка в картинці FA';

  @override
  String get iconNameColorFa => 'Колір FA';

  @override
  String get iconNamePaintFa => 'Фарба FA';

  @override
  String get iconNameInputFa => 'Вхід FA';

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
  String get iconNameBroadcastFa => 'Трансляція FA';

  @override
  String get iconNameSatelliteFa => 'Супутник FA';

  @override
  String get iconNameAntennaFa => 'Антена FA';

  @override
  String get iconNameNetworkFa => 'Мережа FA';

  @override
  String get iconNameCloudFa => 'Хмара FA';

  @override
  String get iconNameStarFa => 'Зірка FA';

  @override
  String get iconNameStarFaOutline => 'Контур Star FA';

  @override
  String get iconNameHeartFa => 'Серце FA';

  @override
  String get iconNameHeartFaOutline => 'Серце FA контур';

  @override
  String get iconNameBookmarkFa => 'Закладка FA';

  @override
  String get iconNameBookmarkFaOutline => 'Закладка FA Outline';

  @override
  String get iconNameFlagFa => 'Прапор FA';

  @override
  String get iconNameClockFa => 'Годинник FA';

  @override
  String get iconNameClockFaOutline => 'Годинник FA Контур';

  @override
  String get iconNameBellFa => 'Дзвоник Ф.А';

  @override
  String get iconNameBellFaOutline => 'Белл Ф.А. План';

  @override
  String get iconNameTimerFa => 'Таймер FA';

  @override
  String get iconNameLockFa => 'Замок FA';

  @override
  String get iconNameUnlockFa => 'Розблокувати FA';

  @override
  String get iconNameGalleryFa => 'Галерея FA';

  @override
  String get iconNameImagesFa => 'Зображення FA';

  @override
  String get iconNameImageFa => 'Зображення FA';

  @override
  String get iconNameVideoFileFa => 'Відеофайл FA';

  @override
  String get iconNameAudioFileFa => 'Аудіофайл FA';

  @override
  String get iconNamePlayOutlineFa => 'Грати в Outline FA';

  @override
  String get iconNamePlaySimpleFa => 'Грати в Simple FA';

  @override
  String get iconNamePauseSimpleFa => 'Пауза Проста FA';

  @override
  String get iconNameStopSimpleFa => 'Проста зупинка FA';

  @override
  String get iconNameRecordFa => 'Запис FA';

  @override
  String get iconNameStopCircleFa => 'Стоп Круг FA';

  @override
  String get iconNameLoadingFa => 'Завантаження FA';

  @override
  String get iconNameTextFa => 'Текст FA';

  @override
  String get iconNameTextSizeFa => 'Розмір тексту FA';

  @override
  String get iconNameLanguageFa => 'Мова Ф.А';

  @override
  String get iconNameGlobeFa => 'Глобус Ф.А';

  @override
  String get iconNameSubtitlesAltFa => 'Субтитри Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Субтитри Alt Outline FA';

  @override
  String get iconNameChannelUpFa => 'Канал угору FA';

  @override
  String get iconNameChannelDownFa => 'Канал униз FA';

  @override
  String get iconNamePageUpFa => 'Сторінка вгору FA';

  @override
  String get iconNamePageDownFa => 'Сторінка вниз FA';

  @override
  String get iconNameGuideFa => 'Керівництво Ф.А';

  @override
  String get iconNameGridViewFa => 'Перегляд сітки FA';

  @override
  String get iconNameGridAltFa => 'Сітка Alt FA';

  @override
  String get iconNameScheduleFa => 'Розклад FA';

  @override
  String get iconNameCalendarFa => 'Календар FA';

  @override
  String get iconNameRedButtonFa => 'Червона кнопка FA';

  @override
  String get iconNameButtonOutlineFa => 'Контур кнопки FA';

  @override
  String get iconNameSquareButtonFa => 'Квадратна кнопка FA';

  @override
  String get iconNameSquareOutlineFa => 'Квадратний контур FA';

  @override
  String get iconNameDotCircleFa => 'Крапка Круг FA';

  @override
  String get iconNameToolsFa => 'Інструменти FA';

  @override
  String get iconNameScrewdriverFa => 'Викрутка FA';

  @override
  String get iconNameHammerFa => 'Молот Ф.А';

  @override
  String get iconNameToolboxFa => 'Набір інструментів FA';

  @override
  String get iconNameCogFa => 'Гвинтик FA';

  @override
  String get iconNameAdjustFa => 'Відрегулюйте FA';

  @override
  String get iconNameFilterFa => 'Фільтр FA';

  @override
  String get iconNameSortDownFa => 'Сортувати вниз FA';

  @override
  String get iconNameSortUpFa => 'Сортувати FA';

  @override
  String get iconNameSleepFa => 'Сон FA';

  @override
  String get iconNameTimerStartFa => 'Таймер Пуск FA';

  @override
  String get iconNameTimerHalfFa => 'Таймер Half FA';

  @override
  String get iconNameTimerEndFa => 'Таймер завершення FA';

  @override
  String get iconNameStopwatchFa => 'Секундомір FA';

  @override
  String get iconNameAlarmFa => 'Сигналізація FA';

  @override
  String get iconNameCropAltFa => 'Обрізання, альтернативна FA';

  @override
  String get iconNameCropFa => 'Обробка FA';

  @override
  String get iconNameSquareFullFa => 'Квадратний повний FA';

  @override
  String get iconNameFullscreenAltFa => 'Повний екран Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Збільшення FA';

  @override
  String get iconNameZoomMinusFa => 'Zoom Мінус FA';

  @override
  String get iconNameMusicNoteFa => 'Нота FA';

  @override
  String get iconNameCdFa => 'CD FA';

  @override
  String get iconNameVinylFa => 'Вініл FA';

  @override
  String get iconNameRssFa => 'RSS FA';

  @override
  String get iconNameMagicFa => 'Магія FA';

  @override
  String get iconNameFingerprintFa => 'Відбиток пальця FA';

  @override
  String get iconNameUserFa => 'Користувач FA';

  @override
  String get iconNameUsersFa => 'Користувачі FA';

  @override
  String get iconNameChildModeFa => 'Дитячий режим FA';

  @override
  String get iconNameCastFa => 'У ролях FA';

  @override
  String get iconNameStreamFa => 'Потік FA';

  @override
  String get iconNameSignalFa => 'Сигнал FA';

  @override
  String get iconNameFeedFa => 'Годувати FA';

  @override
  String get iconNameCircleArrowUpFa => 'Круг зі стрілкою вгору FA';

  @override
  String get iconNameCircleArrowDownFa => 'Круг зі стрілкою вниз FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Круг зі стрілкою вліво FA';

  @override
  String get iconNameCircleArrowRightFa => 'Круг зі стрілкою вправо FA';

  @override
  String get iconNameLongArrowUpFa => 'Довга стрілка вгору FA';

  @override
  String get iconNameLongArrowDownFa => 'Довга стрілка вниз FA';

  @override
  String get iconNameLongArrowLeftFa => 'Довга стрілка вліво FA';

  @override
  String get iconNameLongArrowRightFa => 'Довга стрілка вправо FA';

  @override
  String get iconNamePlusFa => 'Плюс FA';

  @override
  String get iconNameMinusFa => 'Мінус FA';

  @override
  String get iconNamePlusCircleFa => 'Плюс Круг FA';

  @override
  String get iconNameMinusCircleFa => 'Мінус Круг FA';

  @override
  String get iconNamePlusSquareFa => 'Плюс Квадрат FA';

  @override
  String get iconNameMinusSquareFa => 'Мінус квадрат FA';

  @override
  String get iconNameTimesFa => 'Хрестик FA';

  @override
  String get iconNameTimesCircleFa => 'Хрестик у колі FA';

  @override
  String get iconNameBatteryFullFa => 'Акумулятор Повний FA';

  @override
  String get iconNameBattery34Fa => 'Акумулятор 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'Акумулятор половини FA';

  @override
  String get iconNameBattery14Fa => 'Акумулятор 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'Порожня батарея FA';

  @override
  String get iconNameChargingFa => 'Зарядка FA';

  @override
  String get iconNameCloudSunFa => 'Сонце за хмарою FA';

  @override
  String get iconNameCloudMoonFa => 'Місяць за хмарою FA';

  @override
  String get iconNameRainFa => 'Дощ FA';

  @override
  String get iconNameSnowflakeFa => 'Сніжинка Ф.А';

  @override
  String get iconNameFireFa => 'Вогонь FA';

  @override
  String get iconNameTemperatureFa => 'Температура FA';

  @override
  String get iconNameBoxFa => 'Коробка FA';

  @override
  String get iconNameGiftFa => 'Подарунок FA';

  @override
  String get iconNameTrophyFa => 'Трофей FA';

  @override
  String get iconNameCrownFa => 'Корона FA';

  @override
  String get iconNameGemFa => 'Коштовність FA';

  @override
  String get unknownLabel => 'Невідомий';

  @override
  String get selectedFilesLabel => 'вибрані файли';

  @override
  String get folderNotFoundOrInaccessible =>
      'Папка не знайдена або недоступна.';

  @override
  String get importedRemoteDefaultName => 'Імпортований пульт';

  @override
  String get demoRemoteName => 'Демонстраційний пульт';

  @override
  String get protocolFieldsInvalid =>
      'Заповніть необхідні поля протоколу та переконайтеся, що частота становить 15–60 тисяч, якщо встановлено.';

  @override
  String get unknownProtocolSelected => 'Вибрано невідомий протокол.';

  @override
  String get continueSectionTitle => 'Продовжити';

  @override
  String get continueSectionSubtitle =>
      'Продовжуйте з того місця, де зупинилися.';

  @override
  String get continueLastRemoteTitle => 'Останній пульт';

  @override
  String get continueLastMacroTitle => 'Останній макрос';

  @override
  String get continueLastIrFinderHitTitle =>
      'Останнє попадання в інфрачервоний шукач';

  @override
  String get continueTargetUnavailable => 'Цей елемент більше недоступний.';

  @override
  String get continueUniversalPowerAllBrands => 'Всі бренди';

  @override
  String get untitledMacro => 'Макрос без назви';

  @override
  String get pinnedRemotesTitle => 'Прикріплені пульти';

  @override
  String get pinnedRemotesSubtitle =>
      'Тримайте найважливіші пульти одним дотиком.';

  @override
  String get recentlyUsedRemotesTitle => 'Нещодавно використаний';

  @override
  String get recentlyUsedRemotesSubtitle =>
      'Поверніться до пультів, які ви нещодавно відкривали.';

  @override
  String get pinnedRemoteLabel => 'Закріплено';

  @override
  String get pinRemote => 'Закріпити пульт';

  @override
  String get unpinRemote => 'Відкріпити пульт';

  @override
  String get pinRemoteSubtitle =>
      'Розмістіть цей пульт угорі для швидкого доступу.';

  @override
  String get remoteAddedToPinned => 'Пульт закріплено.';

  @override
  String get remoteRemovedFromPinned => 'Пульт відкріплено.';

  @override
  String get homeDeviceControlsTitle => 'Швидке керування';

  @override
  String get homeDeviceControlsSubtitle =>
      'Живлення, вимкнення звуку та гучність без відкриття пульта.';

  @override
  String get homeDeviceControlsEmptySubtitle =>
      'Налаштуйте кнопки живлення, вимкнення звуку та гучності в керуванні пристроєм.';

  @override
  String get showDeviceControlsOnHome =>
      'Показувати швидке керування на головному екрані';

  @override
  String get showDeviceControlsOnHomeSubtitle =>
      'Показувати компактний рядок живлення, вимкнення звуку та гучності на головному екрані.';

  @override
  String get homeDeviceControlsShown =>
      'Швидке керування показано в застосунку.';

  @override
  String get homeDeviceControlsHidden =>
      'Швидке керування приховано в застосунку.';

  @override
  String get power => 'Живлення';

  @override
  String get mute => 'Вимкнути звук';

  @override
  String get volumeUp => 'Гучн. +';

  @override
  String get volumeDown => 'Гучн. -';

  @override
  String get manage => 'Керувати';

  @override
  String get hide => 'Сховати';

  @override
  String get lastActionTitle => 'Остання дія';

  @override
  String lastActionSent(String title) {
    return 'Надіслано $title';
  }

  @override
  String lastActionSentTo(String remoteName, String title) {
    return 'Надіслано $remoteName -> $title';
  }

  @override
  String get repeatAction => 'Повторіть';

  @override
  String get globalSearchTitle => 'Шукайте все';

  @override
  String get globalSearchNoResults => 'Нічого не знайдено.';

  @override
  String get globalSearchTypeRemote => 'Пульт';

  @override
  String get globalSearchTypeButton => 'Кнопка';

  @override
  String get globalSearchTypeMacro => 'Макрос';

  @override
  String get learningModeCaptureFailed => 'Не вдалося прийняти сигнал.';

  @override
  String get learningModeReplaySent => 'Сигнал надіслано.';

  @override
  String get learningModeReplayFailed =>
      'Не вдалося надіслати записаний сигнал.';

  @override
  String get learningModeNoRemotesAvailable => 'Збережених пультів ще немає.';

  @override
  String get learningModeChooseRemoteTitle => 'Виберіть пульт';

  @override
  String get learningModeNewRemoteTitle => 'Створити пульт';

  @override
  String get learningModeSaveSuccess => 'Кнопку збережено.';

  @override
  String get learningModeSaveFailed => 'Не вдалося зберегти кнопку.';

  @override
  String get remoteSetupIntro =>
      'Назвіть пульт і виберіть розташування кнопок. На наступному кроці додайте кнопки.';

  @override
  String get startWithDefault => 'Стандартна назва';

  @override
  String get browseGithubStore => 'Знайти на GitHub';

  @override
  String get addFirstButton => 'Додати першу кнопку';

  @override
  String get moreWaysToStart => 'Інші способи додати кнопки';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Скасувати налаштування нового пульта? Зміни не буде збережено.';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Відкинути зміни цього пульта? Їх не буде збережено.';

  @override
  String get firstButtonAdded => 'Додано першу кнопку.';

  @override
  String get iconColorTitle => 'Колір значка';

  @override
  String get iconColorHelper =>
      'Виберіть колір символу, який залишатиметься видимим на фоні кнопки.';

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
  String get colorLightBlue => 'Світло-блакитний';

  @override
  String get colorCyan => 'Бірюзовий';

  @override
  String get colorTeal => 'Чирок';

  @override
  String get colorGreen => 'Зелений';

  @override
  String get colorLightGreen => 'світло-зелений';

  @override
  String get colorLime => 'Лаймовий';

  @override
  String get colorYellow => 'Жовтий';

  @override
  String get colorAmber => 'Бурштин';

  @override
  String get colorOrange => 'Помаранчевий';

  @override
  String get colorDeepOrange => 'Темно-помаранчевий';

  @override
  String get colorBrown => 'Коричневий';

  @override
  String get colorGrey => 'Сірий';

  @override
  String get colorBlueGrey => 'Синій сірий';

  @override
  String get colorBlack => 'чорний';

  @override
  String get colorWhite => 'Білий';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Колір кнопки $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Вибраний колір кнопки $colorName';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Колір значка $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Вибраний колір значка $colorName';
  }

  @override
  String get irWaveformTitle => 'ІЧ сигнал';

  @override
  String irWaveformPulseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count імпульсу',
      many: '$count імпульсів',
      few: '$count імпульси',
      one: '$count імпульс',
    );
    return '$_temp0';
  }

  @override
  String irWaveformGapLabel(String duration) {
    return 'Розрив $duration';
  }

  @override
  String irWaveformDurationCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count тривалості',
      many: '$count тривалостей',
      few: '$count тривалості',
      one: '$count тривалість',
    );
    return '$_temp0';
  }

  @override
  String get irWaveformActiveHint =>
      'Високий означає, що носій ІЧ-світлодіода активний; низький означає тишу.';

  @override
  String get irWaveformOnLabel => 'УВІМКНЕНО';

  @override
  String get irWaveformOffLabel => 'ВИМКНЕНО';

  @override
  String get quickSettingsTilesTitle => 'Плитки швидких налаштувань';

  @override
  String get quickSettingsPowerTile => 'Плитка живлення';

  @override
  String get quickSettingsMuteTile => 'Плитка вимкнення звуку';

  @override
  String get quickSettingsVolumeUpTile => 'Плитка гучність +';

  @override
  String get quickSettingsVolumeDownTile => 'Плитка гучність -';

  @override
  String get quickSettingsNoTilesConfigured => 'Плитки не налаштовано';

  @override
  String get quickSettingsEmptyHint =>
      'Наступний крок: виберіть команду принаймні для однієї плитки, а потім додайте плитку в меню редагування швидких налаштувань Android.';

  @override
  String get quickSettingsSetPowerTile => 'Налаштувати плитку живлення';

  @override
  String get quickSettingsConfiguredHint =>
      'Виберіть, яку кнопку надсилає кожна плитка. Додайте плитки в меню редагування швидких налаштувань Android.';

  @override
  String get quickSettingsNotSet => 'Не налаштовано';

  @override
  String quickSettingsTileMappingSummary(String title, String subtitle) {
    return '$title · $subtitle';
  }

  @override
  String get quickSettingsPickButtonTooltip => 'Вибрати кнопку';

  @override
  String get quickSettingsClearTooltip => 'Очистити';

  @override
  String get homeWidgetUnsupportedLauncher =>
      'Додайте віджет IR Blaster через меню віджетів на головному екрані телефона.';

  @override
  String get homeWidgetButtonUnsupported =>
      'Цю кнопку не можна додати на головний екран як віджет.';

  @override
  String get homeWidgetRequestSent =>
      'Запит на додавання віджета надіслано. Підтвердьте його на головному екрані, якщо з’явиться запит.';

  @override
  String get homeWidgetRequestRejected =>
      'Не вдалося надіслати запит на додавання віджета. Спробуйте додати його з головного екрана.';

  @override
  String homeWidgetSetupFailed(String error) {
    return 'Не вдалося налаштувати віджет: $error';
  }

  @override
  String get addHomeWidget => 'Додати віджет на головний екран';

  @override
  String get addHomeWidgetSubtitle =>
      'Розмістіть цю кнопку на головному екрані.';

  @override
  String buttonInfoType(String type) {
    return 'Тип: $type';
  }

  @override
  String get buttonInfoCodeRaw => 'Код: сирий сигнал';

  @override
  String buttonInfoCode(String code) {
    return 'Код: $code';
  }

  @override
  String get buttonInfoNoCode => 'НЕМАЄ КОДУ';

  @override
  String buttonInfoFrequency(String frequency) {
    return 'Частота: $frequency';
  }

  @override
  String get frequencyHzLabel => 'Частота (Гц)';

  @override
  String get carrierFrequencyHelper => 'Несуча частота, наприклад 38000';

  @override
  String get requiredFrequencyHelper => 'Обов’язково. Приклад: 38000';

  @override
  String get validFrequencyError => 'Введіть допустиму частоту (15k-60k).';

  @override
  String get resetToDefaultFrequency => 'Скинути до 38000';

  @override
  String get rawDataLabel => 'Сирі дані';

  @override
  String get rawDataHelper =>
      'Цілі числа, розділені пробілами, напр. 9000 4500 560 560 ...';

  @override
  String get rawDataInvalid =>
      'Сирі дані мають бути цілими числами, розділеними пробілами або новими рядками.';

  @override
  String get rawDataSafeguard =>
      'Захист: недійсні токени блокуються, щоб не зберегти шаблон, який неможливо надіслати.';

  @override
  String get protocolLabel => 'Протокол';

  @override
  String get protocolEncodingHelper =>
      'Кодування реалізовано лише для протоколів, позначених як реалізовані.';

  @override
  String get protocolFrequencyHelper =>
      'Необов’язково. Якщо порожньо, використовується стандартна частота протоколу, якщо доступна.';

  @override
  String get rawSignalInvalidWithFrequency =>
      'Сирі дані мають бути цілими числами, розділеними пробілами або новими рядками, а частота має бути 15k-60k.';

  @override
  String get necTimingsNumeric => 'Усі таймінги NEC мають бути числовими.';

  @override
  String get frequencyRangeError => 'Частота має бути 15k-60k Гц.';

  @override
  String get pasteTooltip => 'Вставити';

  @override
  String get clearTooltip => 'Очистити';

  @override
  String irFinderResumeMask(Object value) {
    return 'Маска: $value';
  }

  @override
  String get irFinderKnownMaskLabel => 'Відома маска коду (необов’язково)';

  @override
  String get irFinderKnownMaskHint => '00FFXXFF, FFXXFF або 0xA1XX';

  @override
  String irFinderKnownMaskHelper(int digits, Object example) {
    return 'Корисне навантаження з $digits цифр. Використовуйте X для невідомих цифр; пропущені кінцеві цифри стануть X. Приклад: $example';
  }

  @override
  String get irFinderKnownMaskInvalidCharacters =>
      'Використовуйте лише шістнадцяткові цифри, X, пробіли, двокрапки, дефіси або підкреслення.';

  @override
  String irFinderKnownMaskTooLong(int digits) {
    return 'Маска довша за $digits-значне навантаження цього протоколу.';
  }

  @override
  String irFinderNormalizedMaskValue(Object value) {
    return 'Нормалізована маска: $value';
  }

  @override
  String get irFinderNormalizedMask => 'Нормалізована маска';

  @override
  String get irFinderNormalizedMaskAllUnknown => 'Усі цифри невідомі';

  @override
  String get irFinderSearchOrder => 'Порядок пошуку';

  @override
  String get irFinderSmartOrder => 'Розумний';

  @override
  String get irFinderSequentialOrder => 'Послідовний';

  @override
  String get irFinderSmartOrderHint =>
      'З урахуванням протоколу: спочатку перевіряє типові малі значення, потім розподіляє поля команд і пристроїв, пропускаючи невикористані біти.';

  @override
  String get irFinderSequentialOrderHint =>
      'Режим сумісності: перевіряє підстановні цифри за зростанням шістнадцяткового значення.';

  @override
  String irFinderSmartMeaningfulBits(int bits) {
    return 'Розумний режим змінює $bits значущих бітів для цієї маски.';
  }

  @override
  String get irFinderBruteforceMaskTip =>
      'Порада: замініть кожну невідому цифру на X. Відомі цифри в будь-якій позиції значно скорочують пошук.';

  @override
  String get automationBroadcastsTitle =>
      'Дозволити широкомовні команди автоматизації';

  @override
  String get automationBroadcastsSubtitle =>
      'Будь-який установлений застосунок зможе надсилати ІЧ-команди через вбудований передавач, USB або аудіовихід, навіть коли цей застосунок закрито. Для USB потрібен попередній дозвіл. Для аудіовиходу потрібні ІЧ-адаптер і підвищена гучність медіа.';

  @override
  String get automationSettingsError =>
      'Не вдалося завантажити або зберегти налаштування автоматизації. Спробуйте ще раз.';

  @override
  String get settingsHardwareTitle => 'ІЧ-обладнання та навчання';

  @override
  String get settingsHardwareSubtitle =>
      'Вибір випромінювача, керування USB і навчання сигналів';

  @override
  String get settingsAppearanceSubtitle => 'Тема, кольори та мова застосунку';

  @override
  String get settingsInteractionSubtitle =>
      'Запуск, вібрація, відображення пультів і автоматизація';

  @override
  String get settingsToolsTitle => 'Інструменти та ярлики';

  @override
  String get settingsToolsSubtitle =>
      'Керування пристроями, швидкі налаштування, магазин GitHub і універсальне живлення';

  @override
  String get layoutCustom => 'Власне';

  @override
  String get layoutCustomDescription =>
      'Виберіть кількість стовпців і форму кнопок. Порожні місця можна додати в редакторі.';

  @override
  String get layoutColumns => 'Кнопок у рядку';

  @override
  String get layoutShape => 'Форма кнопок';

  @override
  String get layoutCircle => 'Коло';

  @override
  String get layoutRoundedSquare => 'Заокруглений квадрат';

  @override
  String get layoutRectangle => 'Прямокутник';

  @override
  String get layoutReflowHint =>
      'Коли змінюється кількість стовпців, сітка перебудовується. Якщо вона ширша за екран, гортайте вбік.';

  @override
  String get layoutUpdated => 'Макет оновлено';

  @override
  String get layoutArrange => 'Розмістити кнопки';

  @override
  String get layoutAddRow => 'Додати порожній рядок';

  @override
  String get layoutArrangeHint =>
      'Утримуйте й перетягніть кнопку або торкніться її, а потім нового місця. Якщо там уже є кнопка, вони поміняються місцями.';

  @override
  String get layoutEmptyHint =>
      'Торкніться порожнього місця, щоб додати кнопку, або кнопки, щоб її змінити. Утримуйте кнопку для інших дій.';

  @override
  String layoutCell(int row, int column) {
    return 'Рядок $row, стовпець $column';
  }

  @override
  String get dbBrandSearchHelp =>
      'Спочатку виберіть марку, наприклад Sony або TCL, а потім модель пристрою чи пульта.';

  @override
  String get dbModelSearchHelp =>
      'Шукайте модель, зазначену на пристрої чи пульті. Пробіли та дефіси можуть відрізнятися.';

  @override
  String get irFinderDatabaseSearchHint =>
      'Почніть із вибору марки в режимі бази даних, щоб перевірити відомі коди без повторів. Розумний перебір визначає пріоритет варіантів, але не виявляє реакцію пристрою. Збережіть знайдений код, коли побачите відгук.';

  @override
  String get irFinderClearSearchToJump =>
      'Очистьте пошук, щоб перейти до позиції тестування.';

  @override
  String get crashReportTitle => 'Минулого разу сталася помилка';

  @override
  String get crashReportExplanation =>
      'Локальний звіт містить технічні відомості про застосунок, пристрій і помилку. Нічого не надсилається автоматично. Перед поширенням перевірте наявність конфіденційних даних. Поширення зберігає звіт; «Не надсилати» видаляє його; «Не зараз» залишає до наступного запуску.';

  @override
  String get crashReportDetails => 'Переглянути звіт';

  @override
  String get crashReportShare => 'Поділитися звітом';

  @override
  String get crashReportEmail => 'Написати в підтримку';

  @override
  String get crashReportCopied => 'Звіт скопійовано.';

  @override
  String get crashReportDontSend => 'Не надсилати';

  @override
  String get crashReportNotNow => 'Не зараз';

  @override
  String get crashReportActionFailed =>
      'Не вдалося виконати дію. Звіт збережено. Спробуйте скопіювати його або поділитися ним.';

  @override
  String get shareTitle => 'Поділитися й отримати';

  @override
  String get shareReceive => 'Отримати';

  @override
  String get shareScan => 'Сканувати QR-код';

  @override
  String get shareOpenFile => 'Відкрити отриманий файл';

  @override
  String get shareSelect => 'Виберіть, чим поділитися';

  @override
  String get shareSend => 'Передати на інший пристрій';

  @override
  String get shareQr => 'Показати QR-код';

  @override
  String get shareQrHint =>
      'На іншому телефоні відкрийте IR Blaster > Пульти > Поділитися й отримати > Сканувати QR-код.';

  @override
  String get shareTooLarge =>
      'Забагато даних для читабельного QR-коду. Скористайтеся передаванням на інший пристрій.';

  @override
  String get sharePreview => 'Перевірити отримані дані';

  @override
  String get sharePrivacy =>
      'Обліковий запис і сервер не потрібні. Нічого не надсилається й не випромінюється автоматично. Пристрою-одержувачу потрібен сумісний ІЧ-передавач.';

  @override
  String get shareHardwareWarning =>
      'Деякі вивчені сигнали потребують початкового обладнання й можуть не працювати на іншому пристрої.';

  @override
  String get shareMacroInfo =>
      'Макроси містять пов’язані пульти та кнопки. Імпорт створює копії; нічого не перезаписується й не запускається автоматично.';

  @override
  String get shareAdd => 'Додати копії';

  @override
  String get shareAdded => 'Отримані дані додано.';

  @override
  String get shareDestination => 'Додати кнопку до';

  @override
  String get shareCamera =>
      'Дозвольте доступ до камери для сканування QR-кодів або відкрийте отриманий файл.';

  @override
  String get shareInvalid =>
      'Ці дані пошкоджені, завеликі або використовують непідтримувану версію.';

  @override
  String get sharePrepareFailed =>
      'Не вдалося підготувати дані. Перевірте відсутні зображення, кнопки макросів або розмір добірки.';

  @override
  String get shareFailed =>
      'Не вдалося завершити передавання чи збереження. Наявні елементи не замінено.';

  @override
  String get updatesTitle => 'Оновлення застосунку';

  @override
  String get updatesAutomatic => 'Автоматична перевірка оновлень';

  @override
  String get updatesPrivacyGithub =>
      'Типово вимкнено. Якщо ввімкнути, застосунок звертатиметься до GitHub раз на день під час використання. Автоматичного завантаження немає.';

  @override
  String get updatesPrivacyPlay =>
      'Типово вимкнено. Якщо ввімкнути, застосунок звертатиметься до Google Play раз на день під час використання. Автоматичного завантаження немає.';

  @override
  String get updatesUnknown => 'Невідоме';

  @override
  String get updatesChooseSource => 'Виберіть джерело оновлень';

  @override
  String get updatesCheck => 'Перевірити зараз';

  @override
  String get updatesNever => 'Перевірка ще не виконувалася';

  @override
  String updatesLastChecked(String date) {
    return 'Остання перевірка: $date';
  }

  @override
  String updatesAvailable(String version) {
    return 'Нова версія: $version';
  }

  @override
  String get updatesCurrent => 'Новішої версії не знайдено.';

  @override
  String get updatesFailed =>
      'Не вдалося оновити. Перевірте з’єднання та спробуйте ще раз. Несумісні APK блокуються; дані застосунку не видаляються.';

  @override
  String get updatesFdroidNote =>
      'Версія може з’явитися на GitHub раніше, ніж F-Droid її збере. Оновлюйте через F-Droid, щоб зберегти сумісний підпис і свої дані.';

  @override
  String get updatesOpenFdroid => 'Відкрити F-Droid';

  @override
  String get updatesOpenPlay => 'Відкрити Google Play';

  @override
  String get updatesDownload => 'Завантажити оновлення';

  @override
  String get updatesInstall => 'Установити оновлення';

  @override
  String get updatesAllowInstall => 'Дозволити встановлення';

  @override
  String get updatesInstallHint =>
      'Android може попросити дозвіл на встановлення з цього застосунку. Потім поверніться сюди та натисніть «Установити оновлення». Пульти й макроси буде збережено.';

  @override
  String get updatesReady => 'Оновлення завантажено й готове до встановлення.';

  @override
  String get updatesNoAsset =>
      'Для цього пристрою немає перевіреного APK. Перегляньте примітки до випуску.';

  @override
  String get updatesReleaseNotes => 'Примітки до випуску';

  @override
  String updatesChannel(String source) {
    return 'Джерело оновлень: $source';
  }

  @override
  String updatesDownloadConfirm(String size) {
    return 'Завантажити $size МБ із GitHub? Для встановлення потрібне ваше підтвердження.';
  }

  @override
  String get learningModeIncompleteSignal =>
      'Сигнал, схоже, неповний. Піднесіть пульт ближче й спробуйте ще раз.';

  @override
  String get learningModeUseUsb => 'Використати USB-адаптер';

  @override
  String get learningModeSwitchedUsb => 'Вибрано USB-адаптер.';

  @override
  String learningModeSwitchUsbFailed(String error) {
    return 'Не вдалося перемкнутися на USB-адаптер: $error';
  }

  @override
  String get learningModeAudioUnavailableTitle =>
      'Навчання через аудіо недоступне';

  @override
  String get learningModeAudioUnavailableBody =>
      'ІЧ-аксесуари з аудіопідключенням можуть надсилати команди, але не запам’ятовувати сигнали в цьому застосунку. Скористайтеся сумісним приймачем із функцією навчання.';

  @override
  String learningModeBuiltInReceiver(String brand) {
    return 'Вбудований ІЧ-приймач $brand';
  }

  @override
  String get learningModeUsbReceiver => 'USB-приймач із навчанням';

  @override
  String learningModeDefaultRemoteName(String buttonName) {
    return 'Пульт $buttonName';
  }

  @override
  String get learningModeSupportedReceivers =>
      'Використовуйте приймач, який підтримує цей застосунок:\n• Сумісний ІЧ USB-адаптер Tiqiaa, ZaZa або ElkSmart\n• Підтримуваний телефон Huawei / Honor з ІЧ-приймачем\n• Підтримуваний телефон LG з UEI Quickset\n\nНе всі моделі підтримують навчання.';

  @override
  String learningModeCapturedWith(String device) {
    return 'Сигнал отримано через $device';
  }

  @override
  String get learningModeLgReplayRestriction =>
      'Щоб надіслати цей сигнал, потрібен той самий телефон LG, яким його записали.';

  @override
  String learningModeTimingCount(int count) {
    return 'Записані інтервали: $count';
  }

  @override
  String get learningModeUnknownCarrier => 'Несуча частота невідома';

  @override
  String learningModeByteCount(int count) {
    return 'Байти: $count';
  }

  @override
  String get githubImportComplete => 'Імпорт завершено';

  @override
  String get githubImportNextStep =>
      'Відкрийте пульт або продовжте пошук на GitHub.';

  @override
  String githubImportRemoteCount(int count) {
    return 'Імпортовано пультів: $count.';
  }

  @override
  String get githubImportOpenRemote => 'Відкрити пульт';

  @override
  String get githubImportContinueBrowsing => 'Продовжити пошук';

  @override
  String get githubFilePreview => 'Перегляд файлу';

  @override
  String get githubWrapLines => 'Переносити довгі рядки';

  @override
  String get githubUnwrapLines => 'Вимкнути перенесення рядків';

  @override
  String get githubImportNewRemote => 'Імпортувати як новий пульт';

  @override
  String get githubImportNewRemotes => 'Імпортувати як нові пульти';

  @override
  String get githubImportIntoRemote => 'Додати кнопки до збереженого пульта';
}
