// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => '로드 중…';

  @override
  String get unknownError => '알 수 없는 오류';

  @override
  String get failedToStart => '시작하지 못했습니다';

  @override
  String get retry => '다시 시도';

  @override
  String get quickTilePower => '전원';

  @override
  String get quickTileMute => '음소거';

  @override
  String get quickTileVolumeUp => '볼륨 +';

  @override
  String get quickTileVolumeDown => '볼륨 -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      '이 휴대폰에는 내장 IR 송신기가 없습니다. USB IR 동글이 감지되었지만 아직 권한이 없습니다.\n\nIR 송신을 사용하려면 USB 권한 프롬프트를 승인하세요.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      '이 휴대폰에는 내장 IR 송신기가 없습니다. USB IR 동글이 감지되었지만 USB 권한이 거부되었습니다.\n\nIR 송신을 사용하려면 권한을 다시 요청하고 프롬프트를 승인하세요.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      '이 휴대폰에는 내장 IR 송신기가 없습니다. USB IR 동글은 승인되었지만 아직 초기화되지 않았습니다.';

  @override
  String get homeUsbOpenFailedMessage =>
      '이 휴대폰에는 내장 IR 송신기가 없습니다. USB IR 동글이 감지되고 승인되었지만 초기화하지 못했습니다.\n\n동글을 다시 연결한 뒤 다시 시도하세요.';

  @override
  String get homeUsbReadyMessage =>
      '이 휴대폰에는 내장 IR 송신기가 없습니다. USB IR 동글이 연결되어 준비되었습니다.';

  @override
  String get homeUsbNoDeviceMessage =>
      '이 휴대폰에는 내장 IR 송신기가 없고 현재 지원되는 USB IR 동글도 연결되어 있지 않습니다.\n\n리모컨을 만들고 가져오고 관리할 수는 있지만 IR 신호를 보내려면 아래 옵션 중 하나가 필요합니다.';

  @override
  String get homeUsbOptionPlugIn => 'USB IR 동글 연결';

  @override
  String get homeUsbOptionReady => 'USB IR 동글 준비됨';

  @override
  String get homeUsbOptionPermissionRequired => 'USB 권한 필요';

  @override
  String get homeUsbOptionPermissionDenied => 'USB 권한 거부됨';

  @override
  String get homeUsbOptionPermissionGranted => 'USB 권한 승인됨';

  @override
  String get homeUsbOptionOpenFailed => 'USB 초기화 실패';

  @override
  String get homeHardwareBannerNoInternal =>
      '이 휴대폰에는 내장 IR이 없습니다. USB IR 동글을 연결하거나 설정에서 오디오 모드를 켜세요.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'USB 동글이 감지되었습니다. IR 전송을 위해 권한이 필요합니다.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'USB 권한이 거부되었습니다. 다시 요청해 IR 전송을 활성화하세요.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'USB 동글이 승인되었습니다. 초기화를 기다리는 중입니다.';

  @override
  String get homeHardwareBannerOpenFailed => 'USB 동글이 승인되었지만 초기화에 실패했습니다.';

  @override
  String get homeHardwareBannerReady => 'USB 준비됨.';

  @override
  String get homeHardwareRequiredTitle => 'IR 명령 전송에는 하드웨어가 필요합니다';

  @override
  String get homeUsbDongleRecommended => 'USB IR 동글(권장)';

  @override
  String get homeAudioAdapterAlternative => '오디오 IR 어댑터(대안)';

  @override
  String get homeAudioAdapterDescription =>
      '설정 → IR 송신기 → 오디오(LED 1개 / 2개). 오디오-IR 어댑터가 필요합니다.';

  @override
  String get close => '닫기';

  @override
  String get homeChooseTransmitter => '송신기 선택';

  @override
  String get openSettings => '설정 열기';

  @override
  String get homeUsbPermissionSentApprove =>
      'USB 권한 요청을 보냈습니다. USB를 사용하려면 프롬프트를 승인하세요.';

  @override
  String get homeUsbDongleNotDetected =>
      '지원되는 USB IR 동글이 감지되지 않았습니다. 연결한 뒤 다시 시도하세요.';

  @override
  String get homeUsbPermissionRequestFailed => 'USB 권한을 요청하지 못했습니다.';

  @override
  String get working => '작업 중…';

  @override
  String get requestUsbPermission => '요청 USB 권한';

  @override
  String get homeHardwareTip =>
      '팁: 지금도 리모컨을 만들고 정리할 수 있습니다. 하드웨어는 IR 송신 시에만 필요합니다.';

  @override
  String get homeNoIrTransmitterTitle => '사용 가능한 IR 송신기가 없습니다';

  @override
  String get homeHardwareRequiredBody =>
      'IR Blaster는 어떤 휴대폰에서도 리모컨을 만들고 관리할 수 있습니다. 하지만 실제로 적외선 명령을 보내려면 아래 하드웨어 옵션 중 하나가 필요합니다.';

  @override
  String get homeCanStillUseWithoutHardware =>
      '지금도 리모컨을 만들고, 가져오고, 정리할 수 있습니다.';

  @override
  String get homeWaysToUseIrBlaster => 'IR Blaster 사용 방법';

  @override
  String get homeBuiltInIrOptionTitle => 'IR 내장 휴대폰';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      '내장 IR 블래스터가 있는 지원 휴대폰에서 작동합니다. 이 휴대폰에는 해당 기능이 없습니다.';

  @override
  String get homeBuiltInIrUnavailable => '이 휴대폰에서는 사용할 수 없음';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => '3.5mm 오디오 어댑터';

  @override
  String get homeContinueWithoutHardware => '하드웨어 없이 계속';

  @override
  String get homeHowItWorks => '작동 방식';

  @override
  String get settingsNavLabel => '설정';

  @override
  String get dismiss => '닫기';

  @override
  String get remotesNavLabel => '리모컨';

  @override
  String get macrosNavLabel => '매크로';

  @override
  String get signalTesterNavLabel => '신호 테스터';

  @override
  String get settingsTitle => '설정';

  @override
  String get remoteNoIrEmitterTitle => '없음 IR 송신기';

  @override
  String get remoteNoIrEmitterMessage => '이 기기에는 IR 송신기가 없습니다';

  @override
  String get remoteNoIrEmitterNeedsEmitter => '이 앱은 IR 송신 기능이 필요합니다';

  @override
  String get remoteDismiss => '닫기';

  @override
  String get remoteClose => '닫기';

  @override
  String remoteFailedToSend(Object error) {
    return 'IR 전송 실패: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return '반복 시작 실패: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return '반복이 중지되었습니다(전송 실패): $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return '\"$title\" 반복 중입니다. 상단 바에서 중지를 탭하세요.';
  }

  @override
  String get remoteLoopStopped => '반복이 중지되었습니다.';

  @override
  String get remoteUpdatedNotFound => '리모컨이 저장 목록에서 업데이트되었지만 찾을 수 없습니다.';

  @override
  String remoteUpdatedNamed(Object name) {
    return '\"$name\" 업데이트됨.';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return '삭제 실패: $error';
  }

  @override
  String get remoteNotFoundSavedList => '리모컨을 저장 목록에서 찾을 수 없습니다.';

  @override
  String remoteDeletedNamed(Object name) {
    return '\"$name\" 삭제됨.';
  }

  @override
  String get buttonFallbackTitle => '버튼';

  @override
  String get imageFallbackTitle => '이미지';

  @override
  String get noBrowserAvailable => '사용 가능한 브라우저가 없습니다';

  @override
  String failedToOpen(Object error) {
    return '열지 못했습니다: $error';
  }

  @override
  String get cancel => '취소';

  @override
  String get settingsRestoreDemoTitle => '데모 리모컨을 복원할까요?';

  @override
  String get settingsRestoreDemoMessage =>
      '현재 리모컨이 내장 데모 리모컨으로 바뀝니다. 현재 목록을 유지하려면 백업을 권장합니다.';

  @override
  String get settingsRestoreDemoConfirm => '데모 복원';

  @override
  String get settingsDemoRemotesRestored => '데모 리모컨을 복원했습니다.';

  @override
  String get settingsDeleteAllRemotesTitle => '모든 리모컨을 삭제할까요?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      '이 기기의 모든 리모컨을 삭제합니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get settingsDeleteAllConfirm => '모두 삭제';

  @override
  String get settingsAllRemotesDeleted => '모든 리모컨을 삭제했습니다.';

  @override
  String get themeAuto => '자동 테마';

  @override
  String get themeLight => '라이트 테마';

  @override
  String get themeDark => '다크 테마';

  @override
  String get themeDescAuto => '기기 설정을 따름';

  @override
  String get themeDescLight => '항상 밝고 선명함';

  @override
  String get themeDescDark => '눈이 편안함';

  @override
  String get themeHintAuto => '기기 설정이 라이트 모드와 다크 모드 사이에서 바뀌면 테마도 자동으로 전환됩니다';

  @override
  String get themeHintLight => '주간 사용과 밝은 환경에 적합합니다';

  @override
  String get themeHintDark => '어두운 환경에서 눈의 피로를 줄이고 OLED 화면의 배터리를 절약합니다';

  @override
  String get supportDevelopmentTitle => '개발 지원';

  @override
  String get supportDevelopmentSubtitle =>
      'IR Blaster를 계속 유지하고 하드웨어 호환성을 개선합니다';

  @override
  String get supportDevelopmentBody =>
      '광고 없음, 추적 없음, 잠긴 기능 없음. 여러분의 지원은 프로토콜 작업, USB 동글 지원, 기기 간 호환성 개선에 사용됩니다.';

  @override
  String get donate => '후원';

  @override
  String get starRepo => '저장소에 별표';

  @override
  String get repositoryLinkCopied => '저장소 링크를 복사했습니다';

  @override
  String get supportPillLocalOnly => '로컬 전용';

  @override
  String get supportPillNoTracking => '추적 없음';

  @override
  String get supportPillHardwareAware => '하드웨어 인식';

  @override
  String get supportPillOpenSource => '오픈 소스';

  @override
  String get appearanceTitle => '화면 표시';

  @override
  String get appearanceSubtitle => '시각적 경험 맞춤 설정';

  @override
  String get localizationTitle => '현지화';

  @override
  String get localizationSubtitle => '앱 언어와 번역 동작';

  @override
  String localizationAutoUsing(Object language) {
    return '자동: $language 사용 중';
  }

  @override
  String get localizationAutoDescription => '가능한 경우 앱이 기기 언어를 따릅니다.';

  @override
  String get localizationManualDescription => '앱 언어가 수동으로 재정의되었습니다.';

  @override
  String get useSystemLanguageTitle => '시스템 언어 사용';

  @override
  String useSystemLanguageEnabled(Object language) {
    return '기기 언어 사용 중: $language';
  }

  @override
  String get useSystemLanguageDisabled => '기기 기본값 대신 아래에서 선택한 언어를 사용합니다.';

  @override
  String get chooseAppLanguage => '앱 언어 선택';

  @override
  String get languagePickerDisabledHint => '수동으로 언어를 선택하려면 시스템 언어 사용을 끄세요.';

  @override
  String get searchLanguages => '언어 검색';

  @override
  String get noLanguagesFound => '일치하는 언어가 없습니다';

  @override
  String get localizationHint =>
      '시스템 언어를 사용하면 앱은 기기 로캘을 따르고 번역이 없을 때는 영어로 대체됩니다. 앱 언어를 고정하려면 이를 끄세요.';

  @override
  String get appLanguageTitle => '앱 언어';

  @override
  String get appLanguageHint =>
      '자동은 기기 언어를 따릅니다. 앱에만 적용할 언어로 영어 또는 프랑스어를 선택할 수 있습니다.';

  @override
  String get languageAuto => '자동(시스템)';

  @override
  String get languageAutoDescription => '기기 언어를 자동으로 따르기';

  @override
  String get languageEnglish => '영어';

  @override
  String get languageEnglishDescription => '앱이 항상 영어를 사용하도록 강제';

  @override
  String get languageFrench => '프랑스어';

  @override
  String get languageFrenchDescription => '앱이 항상 프랑스어를 사용하도록 강제';

  @override
  String get languageAutoShort => '자동';

  @override
  String get languageEnglishShort => '영어';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => '동적 색상 사용';

  @override
  String get themeChoiceAuto => '자동';

  @override
  String get themeChoiceLight => '라이트';

  @override
  String get themeChoiceDark => '다크';

  @override
  String get irTransmitterTitle => 'IR 송신기';

  @override
  String get irTransmitterSubtitle => 'IR 명령을 보낼 하드웨어를 선택하세요';

  @override
  String get learningModeEntryTitle => '학습 모드';

  @override
  String get learningModeEntrySubtitle => '단계별로 물리적 리모컨의 버튼 캡처';

  @override
  String get learningModeTitle => '학습 모드';

  @override
  String get learningModeHeroTitle => '리모컨 버튼을 깔끔하게 익히기';

  @override
  String get learningModeHeroSubtitle =>
      '수신기를 설정하고, 원래 리모컨을 준비하고, 하나의 명령을 캡처한 다음, 리모컨에 저장하기 전에 검토하세요.';

  @override
  String get learningModeReadyBadge => '수신기 준비됨';

  @override
  String get learningModeNeedsPermissionBadge => 'USB 권한이 필요합니다';

  @override
  String get learningModeSetupBadge => '수신기 설정 필요';

  @override
  String get learningModeNoReceiverBadge => '학습 수신기 없음';

  @override
  String get learningModeCheckingBadge => '하드웨어 확인';

  @override
  String get learningModeFourStepFlow => '4단계 안내식 흐름';

  @override
  String get learningModeSaveAnywhereBadge => '저장하기 전에 검토하세요';

  @override
  String get learningModeGuideTitle => '캡처가 발생해야 하는 위치를 선택하세요.';

  @override
  String get learningModeStepHardwareShort => '하드웨어';

  @override
  String get learningModeStepPrepareShort => '준비하다';

  @override
  String get learningModeStepCaptureShort => '포착';

  @override
  String get learningModeStepReviewShort => '검토';

  @override
  String get learningModeStepHardwareTitle => '수신기 하드웨어 확인';

  @override
  String get learningModeStepHardwareSubtitle =>
      '시작하기 전에 호환되는 학습 수신기가 연결되어 있고 승인되었는지 확인하세요.';

  @override
  String get learningModeCurrentSenderLabel => '전류 송신기';

  @override
  String get learningModeReceiverStatusLabel => '학습상태';

  @override
  String get learningModeCheckingHardwareBody =>
      '사용 가능한 송신기 및 USB 수신기 상태를 확인합니다.';

  @override
  String get learningModeHardwareReadyBody =>
      'USB IR 동글이 연결되어 초기화됩니다. 캡처 배선이 연결되면 학습 흐름을 시작하기에 적합한 장소입니다.';

  @override
  String get learningModeHardwarePermissionBody =>
      'USB 동글이 있지만 Android 권한이 여전히 이를 차단하고 있습니다. 학습하기 전에 송신기 섹션에서 USB 권한을 부여하세요.';

  @override
  String get learningModeHardwareSetupBody =>
      '동글이 부분적으로 감지되었지만 학습을 안정적으로 시작하려면 여전히 설정하거나 다시 연결해야 합니다.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      '현재 호환 가능한 수신기 하드웨어가 없습니다. 학습 모드는 수신 기능이 있는 지원되는 외부 동글용입니다.';

  @override
  String get learningModeRefreshHardware => '하드웨어 상태 새로 고침';

  @override
  String get learningModeHardwareTipTitle => '최고의 배치';

  @override
  String get learningModeHardwareTipBody =>
      '학습 모드는 하드웨어 가용성에 따라 달라지며 리모컨을 보내는 것보다 덜 자주 사용되기 때문에 IR 송신기 아래에 있습니다.';

  @override
  String get learningModeStepPrepareTitle => '원래 리모콘을 준비하세요';

  @override
  String get learningModeStepPrepareSubtitle =>
      '무엇을 배우고 있는지 결정한 다음 원래 리모컨을 수신기 가까이에 안정되게 유지하십시오.';

  @override
  String get learningModeButtonNameLabel => '버튼 이름';

  @override
  String get learningModeButtonNameHint => '예: HDMI 1, 전원, 메뉴';

  @override
  String get learningModeSinglePress => '한 번 누르기';

  @override
  String get learningModeHoldButton => '보류 버튼';

  @override
  String get learningModePreparationChecklistTitle => '캡처하기 전에';

  @override
  String get learningModePreparationItemDistance =>
      '원래 리모콘을 수신기에서 약 2~5cm 떨어진 곳에 두십시오.';

  @override
  String get learningModePreparationItemOneButton =>
      '한 번에 하나의 버튼을 익히고 먼저 짧고 깔끔하게 누르는 방법을 사용하세요.';

  @override
  String get learningModePreparationItemStill =>
      '시끄럽거나 부분적으로 캡처되지 않도록 두 장치를 안정되게 유지하십시오.';

  @override
  String get learningModeStepCaptureTitle => '신호를 포착하세요';

  @override
  String get learningModeStepCaptureSubtitle => '단일 명령을 듣고 검토하기 전에 결과를 잠급니다.';

  @override
  String get learningModeCaptureReadyTitle => '들을 준비가 되었습니다';

  @override
  String get learningModeCaptureReadyBody =>
      '하드웨어 상태가 양호해 보입니다. 캡처 백엔드는 다음 단계에 연결됩니다.';

  @override
  String get learningModeCaptureBlockedTitle => '하드웨어가 아직 준비되지 않았습니다.';

  @override
  String get learningModeCaptureBlockedBody =>
      '지금도 흐름을 검토할 수 있지만 캡처는 수신자가 준비될 때까지 기다려야 합니다.';

  @override
  String get learningModeStartListening => '듣기 시작';

  @override
  String get learningModeCaptureStubTitle => '캡처 백엔드가 다음 단계';

  @override
  String get learningModeCaptureStubBody =>
      '이 화면은 먼저 완전히 스캐폴딩되므로 최종 캡처 흐름이 나중에 연결되는 대신 실제 하드웨어 상태에 연결될 수 있습니다.';

  @override
  String get learningModeCaptureStubMessage =>
      '학습 캡처가 아직 연결되지 않았습니다. 이 화면은 먼저 전체 흐름을 스캐폴딩합니다.';

  @override
  String get learningModeUnnamedCapture => '이름 없는 캡처';

  @override
  String get learningModeStatusCheckingTitle => '수신기 확인 중';

  @override
  String get learningModeStatusNoReceiverTitle => '수신기가 준비되지 않았습니다.';

  @override
  String get learningModeStatusPermissionTitle => 'USB 권한이 필요합니다';

  @override
  String get learningModeStatusSetupTitle => '수신기 설정 필요';

  @override
  String get learningModeStatusReadyTitle => '학습 준비';

  @override
  String get learningModeStatusListeningTitle => '신호 듣기';

  @override
  String get learningModeStatusCapturedTitle => '신호 캡처';

  @override
  String get learningModeStatusReadyBody =>
      '버튼에 이름을 지정하고 원래 리모콘을 수신기에 대고 준비가 되면 듣기 시작하세요.';

  @override
  String get learningModeStatusListeningBody =>
      '이제 원래의 리모컨 버튼을 누르세요. 캡처가 연결되면 이 상태는 다음 깨끗한 신호에 고정됩니다.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return '$buttonName에 대해 학습된 신호 미리보기가 준비되었습니다. 재생하고 작동하는지 확인한 다음 라이브러리에 저장하세요.';
  }

  @override
  String get learningModeConnectReceiverTitle => '호환되는 학습 동글을 연결하세요';

  @override
  String get learningModeConnectReceiverBody =>
      '학습 모드는 IR을 수신할 수 있는 외부 하드웨어에 따라 다릅니다. 수신기가 감지되고 승인되면 이 페이지는 직접 청취, 테스트 및 저장 흐름이 됩니다.';

  @override
  String get learningModeListenCardTitle => '버튼 하나 듣기';

  @override
  String get learningModeListenCardBody =>
      '원하는 경우 먼저 라벨을 설정한 다음 청취를 시작하고 원래 리모컨의 버튼을 누르세요.';

  @override
  String get learningModeReadyToListenTitle => '들을 준비가 되었습니다';

  @override
  String get learningModeReadyToListenBody =>
      '이것이 주요 캡처 표면입니다. 원래 리모콘이 조준되고 안정된 경우에만 청취를 시작하십시오.';

  @override
  String get learningModeListeningNowTitle => '지금 듣고 있어요';

  @override
  String get learningModeListeningNowBody =>
      '원래의 리모컨 버튼을 한 번 누르세요. 실제 캡처 백엔드가 연결되기 전에 미리 보기 캡처를 사용하여 나머지 스캐폴드를 통해 이동합니다.';

  @override
  String get learningModePreviewCaptureAction => '캡처된 신호 미리보기';

  @override
  String get learningModeCapturedSummary => '학습된 신호 미리보기';

  @override
  String get learningModeResultActionsTitle => '테스트 및 저장';

  @override
  String get learningModeResultActionsBody =>
      '학습된 신호를 재생하고 대상 장치가 응답하는지 확인한 다음 재사용 가능한 버튼으로 저장합니다.';

  @override
  String get learningModeReplayAction => '다시 하다';

  @override
  String get learningModeReplayStubMessage =>
      '재생이 아직 연결되지 않았습니다. 이는 최종 학습, 테스트 및 저장 흐름을 위한 UI 스캐폴드입니다.';

  @override
  String get learningModeSaveStubMessage =>
      '저장이 아직 연결되지 않았습니다. 다음 단계는 이 화면을 Create Button 및 기존 리모컨에 연결하는 것입니다.';

  @override
  String get learningModeLearnAnotherAction => '다른 버튼 알아보기';

  @override
  String get learningModeStepReviewTitle => '검토 및 저장';

  @override
  String get learningModeStepReviewSubtitle =>
      '학습한 내용을 확인한 다음 원격 라이브러리에서 해당 내용을 저장할 위치를 선택하세요.';

  @override
  String get learningModeSaveToExistingRemote => '기존 리모콘';

  @override
  String get learningModeCreateNewRemote => '새로운 리모컨';

  @override
  String get learningModeProtocolPreviewTitle => '프로토콜 미리보기';

  @override
  String get learningModeProtocolPreviewBody =>
      '수신기가 깨끗한 버튼 누르기를 캡처하면 디코딩된 프로토콜 세부 정보가 여기에 표시됩니다.';

  @override
  String get learningModeRawPreviewTitle => '원시 대체';

  @override
  String get learningModeRawPreviewBody =>
      '디코딩이 완료되지 않은 경우 원시 타이밍 캡처를 여기에서 계속 검토하고 저장할 수 있습니다.';

  @override
  String get learningModeSaveCapture => '캡처 저장';

  @override
  String get learningModeReviewTipTitle => '다음엔 이게 어디로 갈지';

  @override
  String get learningModeReviewTipBody =>
      '다음 구현 단계에서는 이 검토 패널을 Create Button 및 기존 리모컨에 연결하여 학습된 신호가 라이브러리에 직접 드롭되도록 해야 합니다.';

  @override
  String get learningModeFinishPreview => '미리보기 완료';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => '상호작용';

  @override
  String get interactionSubtitle => '터치 피드백과 리모컨 레이아웃';

  @override
  String get hapticFeedbackTitle => '햅틱 피드백';

  @override
  String get hapticFeedbackSubtitle => '탭과 동작 시 진동';

  @override
  String get forceInAppVibrationTitle => '앱 내 진동 강제 사용';

  @override
  String get forceInAppVibrationSubtitle => '시스템 터치 피드백이 꺼져 있어도 진동기를 직접 사용합니다';

  @override
  String get forceInAppVibrationWarning =>
      '고급 옵션입니다. Android 터치 피드백이 전역으로 꺼져 있어도 앱이 진동할 수 있습니다.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => '강도';

  @override
  String get intensityLight => '라이트';

  @override
  String get intensityMedium => '중간';

  @override
  String get intensityStrong => '강함';

  @override
  String get flipRemoteDefaultTitle => '기본으로 리모컨 보기 뒤집기';

  @override
  String get flipRemoteDefaultSubtitle =>
      '리모컨 화면을 180° 회전된 상태로 엽니다(하단 장착 USB 동글용).';

  @override
  String get remoteViewFlipped => '리모컨 보기가 뒤집힌 상태로 열립니다.';

  @override
  String get remoteViewNormal => '리모컨 보기가 정상으로 열립니다.';

  @override
  String get backupTitle => '백업';

  @override
  String get backupSubtitle => '리모컨과 매크로 가져오기/내보내기';

  @override
  String get importBackup => '백업 가져오기';

  @override
  String get importBackupSubtitle =>
      '리모컨/매크로 백업 또는 Flipper Zero, LIRC, IRPLUS 파일 가져오기';

  @override
  String get bulkImportFolder => '폴더 대량 가져오기';

  @override
  String get bulkImportFolderSubtitle => '폴더에서 여러 리모컨 가져오기';

  @override
  String get exportBackup => '백업 내보내기';

  @override
  String get exportBackupSubtitle => '리모컨과 매크로를 하나의 JSON 파일로 Downloads에 저장';

  @override
  String get restoreDemoRemotes => '데모 리모컨 복원';

  @override
  String get restoreDemoRemotesSubtitle => '현재 리모컨을 내장 데모로 교체';

  @override
  String get deleteAllRemotes => '모든 리모컨 삭제';

  @override
  String get deleteAllRemotesSubtitle => '이 기기의 모든 리모컨 제거';

  @override
  String get backupTip =>
      '팁: 큰 편집 전에 백업을 내보내세요. 가져오기는 전체 백업, 리모컨만 있는 레거시 JSON 백업, Flipper Zero .ir 파일을 지원합니다.';

  @override
  String get aboutTitle => '정보';

  @override
  String get aboutSubtitle => '앱 정보와 오픈 소스 세부정보';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return '버전 $version';
  }

  @override
  String get sourceCode => '소스 코드';

  @override
  String get viewOnGitHub => 'GitHub에서 보기';

  @override
  String get repositoryUrlCopied => '저장소 URL을 복사했습니다';

  @override
  String get reportIssue => '문제 신고';

  @override
  String get reportIssueSubtitle => '버그 신고와 기능 요청';

  @override
  String get issuesUrlCopied => 'Issues URL을 복사했습니다';

  @override
  String get license => '라이선스';

  @override
  String get openSourceLicense => '오픈 소스 라이선스';

  @override
  String get licenseUrlCopied => '라이선스 URL을 복사했습니다';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => '웹사이트 방문';

  @override
  String get companyUrlCopied => '회사 URL을 복사했습니다';

  @override
  String get licenses => '라이선스';

  @override
  String get openSourceLicenses => '오픈 소스 라이선스';

  @override
  String byCreator(Object creator) {
    return '에 의해 $creator';
  }

  @override
  String get deviceControlsTitle => '기기 제어';

  @override
  String get deviceControlsSubtitle => '시스템 제어 페이지에 즐겨찾기 버튼 표시';

  @override
  String get manageFavorites => '즐겨찾기 관리';

  @override
  String get manageFavoritesSubtitle => '기기 제어에 표시할 버튼 선택';

  @override
  String get quickSettingsTitle => '빠른 설정';

  @override
  String get quickSettingsSubtitle => '전원과 볼륨 바로가기를 위한 타일 추가';

  @override
  String get configureTiles => '타일 구성';

  @override
  String get configureTilesSubtitle => '타일을 리모컨 버튼에 매핑';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle => '소유한 기기의 전원 코드를 순환';

  @override
  String get openTvKill => 'TVKill 열기';

  @override
  String get openTvKillSubtitle => '전원 코드를 순환합니다(소유한 기기에서만 사용)';

  @override
  String get failedToLoadTransmitterSettings => '송신기 설정을 불러오지 못했습니다.';

  @override
  String get usbStatusReady => 'USB 동글이 연결되어 IR 송신 준비가 되었습니다.';

  @override
  String get usbStatusPermissionRequired =>
      'USB 동글이 감지되었습니다. USB 권한을 요청하고 시스템 프롬프트를 승인하세요.';

  @override
  String get usbStatusPermissionDenied =>
      '연결된 동글의 USB 권한이 거부되었습니다. 다시 요청하고 프롬프트를 승인하세요.';

  @override
  String get usbStatusPermissionGranted =>
      'USB 권한이 승인되었습니다. IR을 보내려면 동글을 먼저 초기화해야 합니다.';

  @override
  String get usbStatusOpenFailed =>
      'USB 권한은 승인되었지만 동글을 초기화하지 못했습니다. 다시 연결한 뒤 다시 시도하세요.';

  @override
  String get usbStatusNoDevice => '지원되는 USB IR 동글이 감지되지 않았습니다.';

  @override
  String get usbSelectPermissionRequired =>
      'USB 동글이 감지되었지만 승인되지 않았습니다. \"USB 권한 요청\"을 탭하세요.';

  @override
  String get usbSelectPermissionDenied =>
      'USB 권한이 거부되었습니다. \"USB 권한 요청\"을 탭하고 프롬프트를 승인하세요.';

  @override
  String get usbSelectPermissionGranted =>
      'USB 권한은 승인되었지만 동글이 아직 초기화되지 않았습니다. 다시 연결해 보세요.';

  @override
  String get usbSelectOpenFailed =>
      'USB 권한은 승인되었지만 동글을 초기화하지 못했습니다. 다시 연결한 뒤 다시 시도하세요.';

  @override
  String get usbSelectNoDevice =>
      '지원되는 USB IR 동글이 감지되지 않았습니다. 연결한 다음 \"USB 권한 요청\"을 탭하세요.';

  @override
  String get usbSelectReady => 'USB 동글이 준비되었습니다.';

  @override
  String get autoSwitchEnabledMessage =>
      '자동 전환 활성화됨: 연결 시 USB를 사용하고, 아니면 내장을 사용합니다.';

  @override
  String get autoSwitchDisabledMessage => '자동 전환 비활성화됨: 송신기 선택이 이제 수동입니다.';

  @override
  String get failedToUpdateAutoSwitch => '자동 전환 설정을 업데이트하지 못했습니다.';

  @override
  String get failedToSwitchTransmitter => '송신기를 전환하지 못했습니다.';

  @override
  String get deviceHasNoInternalIr => '이 기기에는 내장 IR 송신기가 없습니다.';

  @override
  String get audioModeEnabledMessage =>
      '오디오 모드가 활성화되었습니다. 최대 미디어 볼륨과 오디오-IR LED 어댑터를 사용하세요.';

  @override
  String get usbPermissionRequestSent => 'USB 권한 요청을 보냈습니다.';

  @override
  String get usbPermissionRequestSentApprove =>
      'USB 권한 요청을 보냈습니다. USB를 사용하려면 프롬프트를 승인하세요.';

  @override
  String get usbAlreadyReady => 'USB 동글은 이미 초기화되었고 준비되었습니다.';

  @override
  String get failedToRequestUsbPermission => 'USB 권한을 요청하지 못했습니다.';

  @override
  String get transmitterHelpInternal => '휴대폰의 내장 IR 송신기를 사용해 명령을 보냅니다.';

  @override
  String get transmitterHelpUsb => 'USB IR 동글을 사용해 명령을 보냅니다(권한 필요).';

  @override
  String get transmitterHelpAudio1 =>
      '오디오 출력(모노)을 사용합니다. 오디오-IR LED 어댑터와 높은 미디어 볼륨이 필요합니다.';

  @override
  String get transmitterHelpAudio2 =>
      '오디오 출력(스테레오)을 사용합니다. 호환 어댑터에서 LED 구동을 개선하기 위해 두 채널을 사용합니다.';

  @override
  String get transmitterInternal => '내장 IR';

  @override
  String get transmitterUsb => 'USB IR 동글';

  @override
  String get transmitterAudio1 => '오디오 (1 LED)';

  @override
  String get transmitterAudio2 => '오디오 (LED 2개)';

  @override
  String get failedToLoadTransmitterCapabilities => '송신기 기능을 불러오지 못했습니다.';

  @override
  String get selectedTransmitter => '선택된 송신기';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • 활성: $active';
  }

  @override
  String get refresh => '새로고침';

  @override
  String get autoSwitchTitle => '자동 전환';

  @override
  String get autoSwitchDisabledWhileAudio => '오디오 모드 사용 중에는 비활성화됩니다';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal => '연결되면 USB, 아니면 내장을 사용';

  @override
  String get unavailableOnThisDevice => '이 기기에서는 사용할 수 없음';

  @override
  String get openOnUsbAttachTitle => 'USB 연결 시 열기';

  @override
  String get openOnUsbAttachSubtitle =>
      '지원되는 USB IR 동글이 연결되면 Android가 앱 열기를 제안할 수 있습니다.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      '지원되는 USB 동글이 연결되면 IR Blaster 열기를 제안합니다.';

  @override
  String get openOnUsbAttachDisabledMessage => 'USB 연결 시 열기를 제안하지 않습니다.';

  @override
  String get failedToUpdateSetting => '설정을 업데이트하지 못했습니다.';

  @override
  String get unnamedButton => '이름 없는 버튼';

  @override
  String get iconFallback => '아이콘';

  @override
  String get remoteListReorderHint => '순서 변경 모드: 카드를 길게 누르고 드래그해 이동하세요.';

  @override
  String get deleteRemoteTitle => '삭제 리모컨?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\"이(가) 영구적으로 삭제됩니다. 이 작업은 되돌릴 수 없습니다.';
  }

  @override
  String get delete => '삭제';

  @override
  String get addToDeviceControlsTitle => '기기 제어에 추가?';

  @override
  String get addToDeviceControlsDescription => '시스템 기기 제어에서 빠르게 접근합니다.';

  @override
  String get skip => '건너뛰기';

  @override
  String get add => '추가';

  @override
  String get addedToDeviceControls => '기기 제어에 추가됨.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return '\"$name\"을(를) 삭제했습니다. 이 작업은 되돌릴 수 없습니다.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count 버튼(의) · $layout';
  }

  @override
  String get layoutComfort => '편안함';

  @override
  String get layoutCompact => '컴팩트';

  @override
  String get open => '열기';

  @override
  String get useThisRemote => '사용 리모컨';

  @override
  String get edit => '편집';

  @override
  String get editRemoteSubtitle => '이름 변경 및 버튼 편집';

  @override
  String get thisCannotBeUndone => '이 작업은 되돌릴 수 없습니다';

  @override
  String get searchRemotes => '검색 리모컨';

  @override
  String get reorderRemotes => '리모컨 순서 변경';

  @override
  String get addRemote => '추가 리모컨';

  @override
  String get more => '더보기';

  @override
  String get reorderMode => '순서 변경 모드';

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
  String get noRemotesYet => '아직 리모컨이 없습니다';

  @override
  String get noRemotesDescription => '생성 리모컨 시작 IR 송신 코드.';

  @override
  String get noRemotesNextStep => '다음 단계: 리모컨 추가를 탭한 뒤 첫 버튼을 추가하세요.';

  @override
  String get actions => '동작';

  @override
  String get macrosTitle => '매크로';

  @override
  String get help => '도움말';

  @override
  String get createMacro => '생성 매크로';

  @override
  String get timedMacrosTitle => '시간 지정 매크로';

  @override
  String get timedMacrosSubtitle => '정확한 타이밍으로 IR 명령 시퀀스를 자동화';

  @override
  String get timedMacrosNextStep =>
      '다음 단계: 첫 매크로 만들기를 탭하고 리모컨을 고른 뒤 명령과 지연을 추가하세요.';

  @override
  String get macroFeatureToysTitle => '인터랙티브 장난감에 적합';

  @override
  String get macroFeatureToysDescription =>
      'i-cybie 로봇 강아지, i-sobot 로봇처럼 명령 사이에 동작 처리 시간이 필요한 장치를 제어합니다.';

  @override
  String get macroFeatureTimingTitle => '정밀 타이밍 제어';

  @override
  String get macroFeatureTimingDescription =>
      '명령 사이에 지연을 추가해(250ms부터 사용자 지정 시간까지) 기기가 다음 동작 전에 반응할 시간을 줍니다.';

  @override
  String get macroFeatureManualTitle => '수동 계속 단계';

  @override
  String get macroFeatureManualDescription =>
      '애니메이션 길이가 일정하지 않거나 시각적 확인이 필요할 때 실행을 일시정지하고 확인을 기다립니다.';

  @override
  String get exampleUseCase => '사용 예';

  @override
  String get macroExampleText =>
      'i-cybie 고급 모드:\n1. \"Mode\" 명령 보내기\n2. 1000ms 대기(장난감 처리)\n3. \"Action 1\" 보내기\n4. 1000ms 대기\n5. \"Action 2\" 보내기\n…이후 자동 계속!';

  @override
  String get createFirstMacro => '첫 매크로 만들기';

  @override
  String get noRemote => '없음 리모컨';

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
  String get aboutTimedMacros => '시간 지정 매크로 정보';

  @override
  String get aboutTimedMacrosDescription =>
      '시간 지정 매크로를 사용하면 각 단계 사이에 정확한 지연을 두고 IR 명령 시퀀스를 자동화할 수 있습니다.';

  @override
  String get sendCommand => '명령 전송';

  @override
  String get sendCommandDescription => '리모컨의 IR 명령을 전송합니다.';

  @override
  String get delay => '지연';

  @override
  String get delayDescription => '다음 단계 전 지정한 시간(예: 1000ms)만큼 기다립니다.';

  @override
  String get manualContinue => '수동 계속';

  @override
  String get manualContinueDescription =>
      '계속을 탭할 때까지 실행을 멈춥니다(길이가 일정하지 않은 애니메이션에 유용).';

  @override
  String get gotIt => '확인';

  @override
  String get failedToSaveMacros => '매크로를 저장하지 못했습니다.';

  @override
  String deletedMacroNamed(Object name) {
    return '\"$name\" 삭제됨.';
  }

  @override
  String get undo => '실행 취소';

  @override
  String get failedToRestoreMacro => '매크로를 복원하지 못했습니다.';

  @override
  String get deleteMacroTitle => '매크로를 삭제할까요?';

  @override
  String get deleteMacroMessage => '다음 스낵바에서 실행 취소할 수 있습니다.';

  @override
  String get noRemotesAvailable => '사용 가능한 리모컨이 없습니다.';

  @override
  String remoteButtonCountSummary(int count) {
    return '버튼 $count개';
  }

  @override
  String get remoteOrientationFlippedTooltip => '방향: 뒤집힘(탭하여 정상)';

  @override
  String get remoteOrientationNormalTooltip => '방향: 정상(탭하여 뒤집기)';

  @override
  String get stopLoop => '반복 중지';

  @override
  String get reorderButtons => '버튼 순서 변경';

  @override
  String get remoteReorderHint => '순서 변경 모드: 버튼을 길게 누르고 드래그해 이동하세요.';

  @override
  String get manageRemote => '리모컨 관리';

  @override
  String get remoteNoButtons => '리모컨에 버튼이 없습니다';

  @override
  String get remoteNoButtonsDescription => '\"리모컨 편집\"을 사용해 버튼을 추가하거나 설정하세요.';

  @override
  String get editRemote => '리모컨 편집';

  @override
  String get editRemoteActionsSubtitle => '이름 변경, 순서 변경 및 버튼 편집';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return '\"$name\" 업데이트됨.';
  }

  @override
  String buttonAddedNamed(Object name) {
    return '\"$name\" 추가됨.';
  }

  @override
  String get buttonDuplicated => '버튼이 복제되었습니다.';

  @override
  String get loopRunningForButton => '이 버튼은 반복 실행 중입니다.';

  @override
  String get loopTip => '팁: 반복을 사용하면 중지할 때까지 계속 실행됩니다.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => '코드를 복사했습니다.';

  @override
  String get copyCode => '코드 복사';

  @override
  String get startLoop => '반복 시작';

  @override
  String get editButtonSubtitle => '레이블, 코드, 프로토콜, 주파수 수정';

  @override
  String get newButton => '새 버튼';

  @override
  String get newButtonSubtitle => '새 버튼을 만든 뒤 하나를 추가하세요';

  @override
  String get duplicate => '복제';

  @override
  String get duplicateButtonSubtitle => '이 버튼의 복사본 만들기';

  @override
  String get removeFromDeviceControls => '기기 제어에서 제거';

  @override
  String get addToDeviceControls => '기기 제어에 추가';

  @override
  String get deviceControlsButtonSubtitle => '시스템 기기 제어에 이 버튼 표시';

  @override
  String get removedFromDeviceControls => '기기 제어에서 제거됨.';

  @override
  String get pinQuickTile => '빠른 타일 즐겨찾기에 고정';

  @override
  String get unpinQuickTile => '빠른 타일 즐겨찾기에서 해제';

  @override
  String get quickTileButtonSubtitle => '빠른 타일 선택기의 상단에 이 버튼 표시';

  @override
  String get removedFromQuickTileFavorites => '빠른 타일 즐겨찾기에서 제거됨.';

  @override
  String get pinnedToQuickTileFavorites => '빠른 타일 즐겨찾기에 고정됨.';

  @override
  String get duplicateAndEdit => '복제 후 편집';

  @override
  String get duplicateAndEditSubtitle => '복사본을 만들고 바로 편집';

  @override
  String get done => '완료';

  @override
  String get run => '실행';

  @override
  String get untitledRemote => '제목 없는 리모컨';

  @override
  String get createRemoteTitle => '생성 리모컨';

  @override
  String get editRemoteTitle => '리모컨 편집';

  @override
  String get removeButtonTitle => '제거 버튼?';

  @override
  String get imageButtonRemovedMessage => '이 이미지 버튼이 제거됩니다.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\"이(가) 제거됩니다.';
  }

  @override
  String get remove => '제거';

  @override
  String importedButtonCount(int count) {
    return '버튼 $count개를 가져왔습니다.';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return '기존 리모컨에서 버튼 $count개를 가져왔습니다.';
  }

  @override
  String get editButtonSettingsSubtitle => '레이블, 신호 및 고급 설정 변경';

  @override
  String get createButtonCopySubtitle => '이 버튼의 복사본 만들기';

  @override
  String get duplicateAndEditButtonSubtitle => '복사본을 만들고 바로 편집';

  @override
  String get undoAvailableInNextSnackbar => '다음 스낵바에서 실행 취소할 수 있습니다';

  @override
  String get buttonRemoved => '버튼이 제거되었습니다.';

  @override
  String get remoteNameCannotBeEmpty => '리모컨 이름은 비워 둘 수 없습니다.';

  @override
  String get saveRemote => '저장 리모컨';

  @override
  String get remoteName => '리모컨 이름';

  @override
  String get remoteNameHint => '예: TV, Air Conditioner, LED Strip';

  @override
  String get remoteNameHelper => '이 이름이 리모컨 목록에 표시됩니다.';

  @override
  String get layoutStyle => '레이아웃 스타일';

  @override
  String get layoutWideDescription => '와이드: 추가 정보가 있는 2열 버튼(권장).';

  @override
  String get layoutCompactDescription => '컴팩트: 아이콘/텍스트만 있는 클래식 4× 격자.';

  @override
  String get importFromRemotes => '가져오기 에서 리모컨';

  @override
  String get importFromDatabase => '가져오기 에서 DB';

  @override
  String get addButton => '추가 버튼';

  @override
  String get noButtonsYet => '없음 버튼 아직';

  @override
  String get createRemoteEmptyStateDescription =>
      '첫 버튼을 추가한 뒤 길게 눌러 편집/제거 옵션을 여세요.';

  @override
  String get createButtonTitle => '생성 버튼';

  @override
  String get editButtonTitle => '편집 버튼';

  @override
  String failedToLoadProtocols(Object error) {
    return '프로토콜을 불러오지 못했습니다: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return '데이터베이스 키를 불러오지 못했습니다: $error';
  }

  @override
  String get presetPower => '전원';

  @override
  String get presetVolume => '볼륨';

  @override
  String get presetChannel => '채널';

  @override
  String get presetNavigation => '탐색';

  @override
  String get all => '전체';

  @override
  String get completeRequiredFieldsToSave => '저장하려면 필수 항목을 모두 완료하세요';

  @override
  String get buttonLabelStepTitle => '버튼 레이블';

  @override
  String get buttonLabelStepSubtitle => '이미지나 아이콘을 선택하거나 텍스트 레이블을 입력하세요.';

  @override
  String get buttonColorStepTitle => '버튼 색상';

  @override
  String get buttonColorStepSubtitle => '이 버튼의 배경색을 선택하세요.';

  @override
  String get selectColor => '색상 선택:';

  @override
  String get noImageSelected => '이미지를 선택하지 않음';

  @override
  String get gallery => '갤러리';

  @override
  String get builtIn => '내장';

  @override
  String get removeImage => '이미지 제거';

  @override
  String get requiredSelectImageOrSwitch =>
      '필수: 이미지를 선택하거나 아이콘을 고르거나 텍스트로 전환하세요.';

  @override
  String get iconSelected => '아이콘 선택됨';

  @override
  String get noIconSelected => '아이콘을 선택하지 않음';

  @override
  String get chooseIcon => '선택 아이콘';

  @override
  String get removeIcon => '아이콘 제거';

  @override
  String get requiredSelectIconOrSwitch => '필수: 아이콘을 선택하거나 이미지/텍스트로 전환하세요.';

  @override
  String get buttonText => '버튼 텍스트';

  @override
  String get buttonTextHint => '예:, 전원, 볼륨 +, HDMI 1';

  @override
  String get buttonTextHelper => '이 텍스트가 버튼에 표시됩니다.';

  @override
  String get requiredEnterButtonLabel => '필수: 버튼 레이블을 입력하세요.';

  @override
  String get defaultColorName => '기본';

  @override
  String get newRemoteCreatedFromLastHit =>
      '마지막 적중 결과로 새 리모컨을 버튼 1개와 함께 만들었습니다.';

  @override
  String get selectRemote => '선택 리모컨';

  @override
  String remoteNumber(Object id) {
    return '리모컨 #$id';
  }

  @override
  String get newRemoteCreated => '새 리모컨을 만들었습니다.';

  @override
  String get failedToCreateRemote => '리모컨을 만들지 못했습니다.';

  @override
  String get newRemoteEllipsis => '새 리모컨…';

  @override
  String addedToRemoteNamed(Object name) {
    return '$name에 추가됨.';
  }

  @override
  String get failedToAddToRemote => '추가 리모컨하지 못했습니다.';

  @override
  String get newRemoteDefaultName => '새 리모컨';

  @override
  String jumpedToOffsetPaused(int offset) {
    return '오프셋 $offset(으)로 이동했습니다. 일시정지됨 — 재개하려면 누르세요.';
  }

  @override
  String get sent => '전송됨.';

  @override
  String failedToSend(Object error) {
    return '전송하지 못했습니다: $error';
  }

  @override
  String get copiedProtocolCode => '복사됨(프로토콜:코드).';

  @override
  String get savedToResults => '결과에 저장했습니다.';

  @override
  String invalidCodeForProtocol(Object error) {
    return '잘못된 코드 프로토콜: $error';
  }

  @override
  String get copiedCurrentCandidate => '현재 후보를 복사했습니다.';

  @override
  String get jumpToOffset => '오프셋으로 이동';

  @override
  String get jumpToBruteCursor => '브루트 커서로 이동';

  @override
  String get jump => '이동';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return '커서 0x$cursor(으)로 이동했습니다. 일시정지됨 — 재개하려면 누르세요.';
  }

  @override
  String get irSignalTester => 'IR 신호 테스터';

  @override
  String get stop => '중지';

  @override
  String get selectButton => '선택 버튼';

  @override
  String get buttonNotFoundInRemotes => '버튼 않음 찾을 수 없음 리모컨.';

  @override
  String sentNamed(Object name) {
    return '\"$name\" 전송됨.';
  }

  @override
  String sendFailed(Object error) {
    return '전송 실패: $error';
  }

  @override
  String get noFavoritesYet => '없음 즐겨찾기 아직';

  @override
  String get deviceControlsEmptyHint => '리모컨 버튼을 길게 누른 뒤 “기기 제어에 추가”를 선택하세요.';

  @override
  String get sendTest => '테스트 전송';

  @override
  String get testSendCompleted => '테스트 전송 완료.';

  @override
  String testSendFailed(Object error) {
    return '테스트 전송 실패: $error';
  }

  @override
  String removedNamed(Object name) {
    return '제거됨 \"$name\".';
  }

  @override
  String get brand => '브랜드';

  @override
  String get model => '모델';

  @override
  String get selectBrand => '브랜드 선택';

  @override
  String get searchBrand => '검색 브랜드…';

  @override
  String get selectModel => '모델 선택';

  @override
  String get searchModel => '검색 모델…';

  @override
  String get unnamedKey => '이름 없음 키';

  @override
  String get unknown => '알 수 없음';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => '검색 명령';

  @override
  String get noMatchingCommands => '없음 일치하는 명령';

  @override
  String get quickTileFavoritesTitle => '빠른 타일 즐겨찾기';

  @override
  String changeMappingForTile(Object tileLabel) {
    return '$tileLabel 타일의 매핑 변경';
  }

  @override
  String get pickDifferentButton => '다른 버튼 선택';

  @override
  String get browseAllRemotesEllipsis => '찾아보기 모든 리모컨…';

  @override
  String get invalidMacroFileFormat => '잘못된 매크로 파일 형식입니다.';

  @override
  String get failedToParseMacroFile => '매크로 파일을 구문 분석하지 못했습니다.';

  @override
  String get deviceCodeLabel => '기기 코드';

  @override
  String get commandLabel => '명령';

  @override
  String get editButtonCodeTitle => '편집 코드 버튼';

  @override
  String get thisRemoteHasNoButtons => '이 리모컨 있음 없음 버튼.';

  @override
  String get selectCommand => '선택 명령';

  @override
  String get databaseModeAutofillHint =>
      '데이터베이스 모드는 2단계(브랜드 + 모델 + 프로토콜)를 자동으로 채웁니다. 키를 가져온 뒤에는 수동에서 세부 조정할 수 있습니다.';

  @override
  String get test => '테스트';

  @override
  String get allSelectedButtonsWereDuplicates => '선택한 버튼이 모두 중복이었습니다.';

  @override
  String get noButtonsImported => '가져온 버튼이 없습니다.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return '버튼 $addedCount개를 가져왔습니다. 중복 $skippedCount개는 건너뛰었습니다.';
  }

  @override
  String get importAllMatchingTitle => '가져오기 모든 일치하는 버튼?';

  @override
  String get noMatchingKeysFound => '없음 일치하는 키 찾을 수 없음.';

  @override
  String importAllMatchingMessage(int count) {
    return '현재 데이터베이스 선택에서 일치하는 키를 최대 $count개까지 가져옵니다.';
  }

  @override
  String get importAll => '가져오기 모든';

  @override
  String get importingButtons => '버튼 가져오는 중…';

  @override
  String get allMatchingButtonsWereDuplicates => '일치하는 버튼이 모두 중복이었습니다.';

  @override
  String get quickPresets => '빠른 프리셋';

  @override
  String get selectDeviceFirst => '선택 기기 첫';

  @override
  String get searchByLabelOrHex => '검색 에 의해 레이블 또는 16진수';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return '선택: $preset 프리셋 키 세부 조정';
  }

  @override
  String get selectBrandModelProtocolFirst => '선택 브랜드, 모델, 및 프로토콜 첫.';

  @override
  String get importFromDatabaseTitle => '가져오기 에서 데이터베이스';

  @override
  String get importFromDatabaseSubtitle =>
      '기기를 선택하고 일치하는 키를 불러온 뒤 선택한 버튼을 가져오세요.';

  @override
  String get deviceAndFilters => '기기 & 필터';

  @override
  String loadedCount(int count) {
    return '$count개 불러옴';
  }

  @override
  String get hideFilters => '필터 숨기기';

  @override
  String get showFilters => '표시 필터';

  @override
  String get noProtocolFoundForBrandModel => '없음 프로토콜 찾을 수 없음 브랜드 및 모델.';

  @override
  String get protocolAutoDetected => '프로토콜';

  @override
  String get protocolAutoDetectedHelper =>
      '데이터베이스에서 자동 감지되었습니다. 가져오기 전에 변경할 수 있습니다.';

  @override
  String get selectBrandModelToLoadKeys => '선택 브랜드, 모델, 및 프로토콜 불러오기 키.';

  @override
  String get noKeysFound => '없음 키 찾을 수 없음.';

  @override
  String noKeysFoundForSearch(Object query) {
    return '없음 키 찾을 수 없음 \"$query\".';
  }

  @override
  String get skipDuplicates => '중복 건너뛰기';

  @override
  String get skipDuplicatesSubtitle => '리모컨에 이미 있는 버튼은 가져오지 않습니다.';

  @override
  String get importSelected => '가져오기 선택됨';

  @override
  String get noMacrosToExport => '없음 매크로 내보내기.';

  @override
  String get macrosExportedToDownloads => '매크로를 Downloads로 내보냈습니다.';

  @override
  String get failedToExportMacros => '내보내기 매크로하지 못했습니다.';

  @override
  String get failedToReadFile => '파일을 읽지 못했습니다.';

  @override
  String get importFromExistingRemotesTitle => '기존 리모컨에서 가져오기';

  @override
  String selectedCount(int count) {
    return '$count개 선택됨';
  }

  @override
  String get noOtherRemotesWithButtons => '버튼이 있는 다른 리모컨을 찾지 못했습니다.';

  @override
  String get sourceRemote => '소스 리모컨';

  @override
  String get searchButtons => '검색 버튼';

  @override
  String get searchButtonsHint => '전원, 볼륨, 음소거...';

  @override
  String get selectVisible => '선택 보이는';

  @override
  String get clearVisible => '지우기 보이는';

  @override
  String protocolNamed(Object name) {
    return '프로토콜: $name';
  }

  @override
  String get rawSignal => '원시 신호';

  @override
  String get legacyCode => '레거시 코드';

  @override
  String importCount(int count) {
    return '$count개 가져오기';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      '저장소 권한이 거부되었습니다(일부 구형 Android 기기에서 필요).';

  @override
  String get backupExportedToDownloads => '백업을 Downloads로 내보냈습니다.';

  @override
  String failedToExport(Object error) {
    return '내보내지 못했습니다: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return '레거시 JSON 백업에서 리모컨 $count개를 가져왔습니다. 매크로는 변경되지 않았습니다.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      '가져오기 실패: 백업의 \"remotes\"는 존재할 경우 JSON 목록이어야 합니다.';

  @override
  String get importFailedMacrosMustBeList =>
      '가져오기 실패: 백업의 \"macros\"는 존재할 경우 JSON 목록이어야 합니다.';

  @override
  String get importFailedInvalidBackupFormat =>
      '가져오기 실패: 잘못된 백업 형식입니다(레거시 List 또는 remotes/macros가 있는 Map 필요).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return '백업에서 리모컨 $remoteCount개를 가져왔습니다. 매크로는 변경되지 않았습니다.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return '백업에서 리모컨 $remoteCount개와 매크로 $macroCount개를 가져왔습니다.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      '가져오기 실패: 없음 유효한 버튼 찾을 수 없음 .IR 파일.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Flipper .ir에서 리모컨 1개를 가져왔습니다. 매크로는 변경되지 않았습니다.';

  @override
  String get importFailedInvalidIrplus =>
      '가져오기 실패: 잘못된 irplus 파일입니다(유효한 버튼 없음).';

  @override
  String get importedOneRemoteFromIrplus =>
      'irplus에서 리모컨 1개를 가져왔습니다. 매크로는 변경되지 않았습니다.';

  @override
  String get importFailedInvalidLirc =>
      '가져오기 실패: 잘못된 LIRC 파일입니다(유효한 코드/원시 코드 없음).';

  @override
  String get importedOneRemoteFromLirc =>
      'LIRC config에서 리모컨 1개를 가져왔습니다. 매크로는 변경되지 않았습니다.';

  @override
  String get unsupportedFileTypeSelected => '지원되지 않는 파일 형식을 선택했습니다.';

  @override
  String get importFailedInvalidUnreadableFile =>
      '가져오기 실패: 잘못되었거나 읽을 수 없는 파일입니다.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      '대량 가져오기 완료: 없음 지원되는 파일 찾을 수 없음 폴더.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return '대량 가져오기 완료: 가져온 리모컨이 없습니다. 파일 $skippedCount개를 건너뛰었습니다.';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return '대량 가져오기 완료: 지원되는 파일 $supportedCount개에서 리모컨 $importedCount개를 가져왔습니다. 파일 $skippedCount개는 건너뛰었습니다.';
  }

  @override
  String get storagePermissionDenied => '저장소 권한이 거부되었습니다.';

  @override
  String get bulkImportFailedReadFolder => '대량 가져오기 실패: 폴더 내용을 읽을 수 없습니다.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return '대량 가져오기 완료: 없음 지원되는 파일 찾을 수 없음 ($sourceLabel).';
  }

  @override
  String get clearAction => '지우기';

  @override
  String get saveAction => '저장';

  @override
  String buttonsTitleCount(int count) {
    return '버튼 ($count)';
  }

  @override
  String get invalidStepEncountered => '잘못된 단계를 발견했습니다';

  @override
  String failedToSendNamed(Object name) {
    return '전송하지 못했습니다: $name';
  }

  @override
  String get buttonNotFound => '버튼을 찾을 수 없음';

  @override
  String buttonNotFoundNamed(Object name) {
    return '버튼을 찾을 수 없음: $name';
  }

  @override
  String get unknownButton => '알 수 없음 버튼';

  @override
  String durationSecondsShort(int seconds) {
    return '$seconds초';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '$minutes분 $seconds초';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '$hours시간 $minutes분';
  }

  @override
  String get orientationFlippedTooltip => '방향: 뒤집힘(탭하여 정상)';

  @override
  String get orientationNormalTooltip => '방향: 정상(탭하여 뒤집기)';

  @override
  String get noSteps => '없음 단계';

  @override
  String stepProgress(int current, int total) {
    return '단계 $current/$total';
  }

  @override
  String get completed => '완료됨';

  @override
  String get paused => '일시정지됨';

  @override
  String get running => '실행 중';

  @override
  String get ready => '준비됨';

  @override
  String stepsProgress(int current, int total) {
    return '$current/$total 단계';
  }

  @override
  String get waiting => '대기 중';

  @override
  String secondsRemaining(Object seconds) {
    return '$seconds초 남음';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady => '탭 계속 때 준비됨 다음 단계';

  @override
  String get error => '오류';

  @override
  String get macroCompleted => '매크로 완료됨';

  @override
  String finishedIn(Object duration) {
    return '$duration만에 완료';
  }

  @override
  String get sequence => '시퀀스';

  @override
  String waitMilliseconds(int ms) {
    return '대기 ${ms}ms';
  }

  @override
  String get runAgain => '다시 실행';

  @override
  String get startMacro => '시작 매크로';

  @override
  String get continueAction => '계속';

  @override
  String get unnamedRemote => '이름 없음 리모컨';

  @override
  String get enterMacroName => '입력 매크로 이름';

  @override
  String get addAtLeastOneStep => '최소 한 단계를 추가하세요';

  @override
  String get fixInvalidSteps => '잘못된 단계 수정';

  @override
  String get unknownCommand => '알 수 없음 명령';

  @override
  String get unnamedCommand => '이름 없음 명령';

  @override
  String get iconCommand => '아이콘 명령';

  @override
  String get selectDelay => '선택 지연';

  @override
  String keepMilliseconds(int ms) {
    return '유지: ${ms}ms';
  }

  @override
  String get custom => '사용자 지정';

  @override
  String get enterCustomDelayDuration => '사용자 지정 지연 시간을 입력하세요';

  @override
  String millisecondsLong(int ms) {
    return '$ms밀리초';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds초$plural';
  }

  @override
  String get customDelay => '사용자 지정 지연';

  @override
  String get delayMillisecondsLabel => '지연(밀리초)';

  @override
  String get delayMillisecondsHint => '예:, 3000';

  @override
  String get recommendedDelayRange => '권장: 대부분 기기에서 250-5000ms';

  @override
  String get enterValidPositiveNumber => '유효한 양수를 입력하세요';

  @override
  String get ok => 'OK';

  @override
  String get remote => '리모컨';

  @override
  String get macroName => '매크로 이름';

  @override
  String get macroNameHint => '예: i-cybie Advanced Mode';

  @override
  String stepsTitleCount(int count) {
    return '단계 ($count)';
  }

  @override
  String get noStepsYet => '없음 단계 아직';

  @override
  String get addCommandsAndDelaysHint => '시퀀스를 만들려면 아래에 명령과 지연을 추가하세요';

  @override
  String get addStep => '추가 단계';

  @override
  String get reorderStepsHint => '팁: 드래그 핸들로 단계 순서를 바꾸세요. 단계를 탭해 편집할 수도 있습니다';

  @override
  String reorderStep(int index) {
    return '단계 $index 순서 변경';
  }

  @override
  String get pressAndDragToChangeStepOrder => '단계 순서를 바꾸려면 길게 누르고 드래그하세요';

  @override
  String deleteStep(int index) {
    return '삭제 단계 $index';
  }

  @override
  String get invalidStepTapToFix => '잘못된 단계 — 탭하여 수정';

  @override
  String get sendIrCommand => 'IR 명령 전송';

  @override
  String get waitForUserConfirmation => '사용자 확인 대기';

  @override
  String get notImplemented => '아직 구현되지 않음';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => '와이드';

  @override
  String get iconButton => '아이콘 버튼';

  @override
  String get imageButton => '이미지 버튼';

  @override
  String get noSignalInfo => '신호 정보 없음';

  @override
  String get proceed => '계속';

  @override
  String get discard => '버리기';

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
  String get idle => '대기 중';

  @override
  String get start => '시작';

  @override
  String get resume => '재개';

  @override
  String get pause => '일시정지';

  @override
  String get stopped => '중지됨';

  @override
  String get copy => '복사';

  @override
  String get send => '전송';

  @override
  String get step => '단계';

  @override
  String get addToRemote => '추가 리모컨';

  @override
  String get noDescriptionAvailable => '설명이 없습니다.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'Kaseikyo 공급업체 값은 정확히 4자리 16진수여야 합니다.';

  @override
  String get irFinderDatabaseNotReady => '데이터베이스 않음 준비됨 아직.';

  @override
  String get irFinderSelectBrandFirst => '먼저 브랜드를 선택해 설정하세요.';

  @override
  String get irFinderBruteforceUnavailable => '브루트포스 않음 사용 가능 프로토콜 아직.';

  @override
  String get irFinderInvalidPrefix => '잘못된 접두사.';

  @override
  String irFinderBrandValue(Object value) {
    return '브랜드: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return '모델: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return '키: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return '리모컨 #$value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      '필터되고 정렬된 데이터베이스 결과 내 0부터 시작하는 인덱스를 입력하세요.';

  @override
  String get irFinderJumpCursorHelper => '브루트포스 공간 내 0부터 시작하는 16진수 커서를 입력하세요.';

  @override
  String get irFinderSetupTab => '설정';

  @override
  String get irFinderTestTab => '테스트';

  @override
  String get irFinderResultsTab => '결과';

  @override
  String get irFinderContinueToTest => '계속 테스트';

  @override
  String get irFinderKaseikyoVendorTitle => 'Kaseikyo 공급업체';

  @override
  String get irFinderCustomVendorLabel => '사용자 지정 공급업체(4자리 16진수)';

  @override
  String get irFinderBrowseDbCandidates => 'DB 후보 찾아보기…';

  @override
  String get irFinderEditSetup => '설정 편집';

  @override
  String get irFinderNoSavedHits =>
      '아직 저장된 적중이 없습니다. 테스트 페이지에서 기기가 반응할 때 \"적중 저장\"을 누르세요.';

  @override
  String get irFinderBackToTest => '테스트로 돌아가기';

  @override
  String get irFinderLargeSearchSpaceTitle => '큰 검색 공간';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return '이 브루트포스 공간은 매우 큽니다($human개 가능성). IR Finder는 최대 시도 횟수와 쿨다운을 지키지만 IR 기기를 과도하게 스팸하지 않도록 주의하세요.\n\n권장: 먼저 데이터베이스 모드를 사용하고, 가능하면 알려진 접두 바이트를 입력해 범위를 줄이세요.';
  }

  @override
  String get irFinderDatabaseSession => '데이터베이스 세션';

  @override
  String get irFinderBruteforceSession => '브루트포스 세션';

  @override
  String get irFinderResumeLastSession => '재개 마지막 세션';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return '브랜드: $brand · 모델: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return '접두사: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return '진행률: $progress · 시작: $when';
  }

  @override
  String get irFinderApplyResume => '적용 및 재개';

  @override
  String get irFinderBruteforceMode => '브루트포스';

  @override
  String get irFinderDatabaseAssistedMode => '데이터베이스 보조';

  @override
  String irFinderProtocolTitle(Object name) {
    return '프로토콜: $name';
  }

  @override
  String get irFinderProtocolLabel => 'IR 프로토콜';

  @override
  String get irFinderProtocolHelper => '인코딩을 제어하므로 검색 공간에도 영향을 줍니다.';

  @override
  String get irFinderKnownPrefixLabel => '알려진 접두사(16진수 바이트, 선택)';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return '페이로드: $digits 16진수 자리(의)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return '페이로드: $digits 16진수 자리(의) · 예: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return '페이로드: $digits 16진수 자리(의) · 최대 접두사: $bytes 바이트(의)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return '페이로드: 16진수 $digits자리 · 예: $example · 최대 접두사: $bytes바이트';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return '예: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      '검색 공간을 줄이기 위해 알고 있는 첫 바이트를 입력하세요.';

  @override
  String get irFinderDatabaseMode => '데이터베이스';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return '정규화된 접두사: $value';
  }

  @override
  String get irFinderNormalizedPrefix => '정규화된 접두사';

  @override
  String get irFinderBruteforceNotConfigured =>
      '이 프로토콜에는 브루트포스가 아직 구성되지 않았습니다.';

  @override
  String irFinderAllLimit(Object value) {
    return '전체 ($value)';
  }

  @override
  String get irFinderTestControls => '테스트 제어';

  @override
  String irFinderPayloadLength(int digits) {
    return '페이로드 길이: 16진수 $digits자리.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return '검색 공간: $value개 가능성(접두사 제약 반영 후).';
  }

  @override
  String get irFinderCooldownMs => '쿨다운(ms)';

  @override
  String get irFinderMaxAttemptsPerRun => '최대 시도 횟수(한 번 실행당)';

  @override
  String get irFinderTestAllCombinations => '모든 조합 테스트';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return '검색 공간이 소진될 때까지 실행합니다. 유효 제한: $value';
  }

  @override
  String get irFinderAttempts => '시도 횟수';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return '슬라이더 범위: 1–$max(더 큰 값은 직접 입력)';
  }

  @override
  String irFinderMaxButton(int value) {
    return '최대 $value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return '이번 실행의 유효 제한: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      '팁: 먼저 데이터베이스 모드를 사용하세요. 브루트포스는 알려진 접두사(예: 처음 1~4바이트)가 있을 때 가장 좋습니다.';

  @override
  String get irFinderDatabaseInitFailed => '데이터베이스 초기화 실패.';

  @override
  String get irFinderPreparingDatabase => '로컬 IR 코드 데이터베이스 준비 중…';

  @override
  String get irFinderDatabaseAssistedSearch => '데이터베이스 보조 검색';

  @override
  String get irFinderBrand => '브랜드';

  @override
  String get irFinderSelectBrand => '브랜드 선택';

  @override
  String get irFinderModelOptional => '모델 (선택)';

  @override
  String get irFinderSelectBrandFirstShort => '선택 브랜드 첫';

  @override
  String get irFinderSelectModelRecommended => '선택 모델 (권장)';

  @override
  String get irFinderOnlySelectedProtocol => '선택한 프로토콜만';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      '키를 선택한 프로토콜로만 필터링합니다. 모든 프로토콜을 보려면 끄세요.';

  @override
  String get irFinderQuickWinsFirst => '빠른 후보 우선';

  @override
  String get irFinderQuickWinsFirstHint =>
      '깊은 키보다 먼저 POWER, MUTE, VOL, CH 스타일 키를 우선합니다.';

  @override
  String get irFinderMaxKeysPerRun => '최대 테스트 키 수(한 번 실행당)';

  @override
  String get irFinderTesting => '테스트 중…';

  @override
  String get irFinderCooldown => '쿨다운';

  @override
  String get irFinderEta => '예상 시간';

  @override
  String get irFinderMode => 'Mode';

  @override
  String get irFinderRetryLast => '마지막 다시 시도';

  @override
  String get irFinderTrigger => '트리거';

  @override
  String get irFinderJump => '이동…';

  @override
  String get irFinderSaveHit => '적중 저장';

  @override
  String irFinderEtaSeconds(int seconds) {
    return '$seconds초';
  }

  @override
  String irFinderEtaMinutesSeconds(int minutes, int seconds) {
    return '$minutes분 $seconds초';
  }

  @override
  String irFinderEtaHoursMinutes(int hours, int minutes) {
    return '$hours시간 $minutes분';
  }

  @override
  String irFinderLastAttemptedCode(Object value) {
    return '마지막 시도 코드: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode => '마지막 시도 코드를 보려면 테스트를 시작하세요.';

  @override
  String irFinderFromDb(Object value) {
    return 'DB 출처: $value';
  }

  @override
  String get irFinderFromBruteforce => '브루트포스 출처(프로토콜 인코더로 생성).';

  @override
  String irFinderSendError(Object error) {
    return '전송 오류: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return '소스: $value';
  }

  @override
  String get irFinderResultsNote =>
      '결과는 바로 테스트와 복사를 지원합니다. 리모컨에 직접 추가하는 통합은 편집기 흐름에서 더 확장할 수 있습니다.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'DB 후보 찾아보기';

  @override
  String get irFinderFilterByLabelOrHex => '레이블 또는 16진수로 필터…';

  @override
  String get irFinderJumpHere => '여기로 이동';

  @override
  String get irFinderSelectModel => '모델 선택';

  @override
  String get irFinderSearchBrands => '브랜드 검색…';

  @override
  String get irFinderSearchModels => '모델 검색…';

  @override
  String get iconPickerTitle => '선택 아이콘';

  @override
  String get iconPickerSearchHint => '검색 아이콘...';

  @override
  String get iconPickerNoIconsFound => '없음 아이콘 찾을 수 없음';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count 아이콘 사용 가능';
  }

  @override
  String get iconPickerCategoryAll => '전체';

  @override
  String get iconPickerCategoryMedia => '미디어';

  @override
  String get iconPickerCategoryVolume => '볼륨';

  @override
  String get iconPickerCategoryNavigation => '탐색';

  @override
  String get iconPickerCategoryPower => '전원';

  @override
  String get iconPickerCategoryNumbers => '숫자';

  @override
  String get iconPickerCategorySettings => '설정';

  @override
  String get iconPickerCategoryDisplay => '디스플레이';

  @override
  String get iconPickerCategoryInput => '입력';

  @override
  String get iconPickerCategoryFavorite => '즐겨찾기';

  @override
  String get universalPowerTitle => '범용 전원';

  @override
  String get universalPowerRunTab => '실행';

  @override
  String get universalPowerUseResponsibly => '책임 있게 사용';

  @override
  String get universalPowerConsentBody =>
      '범용 전원은 IR 전원 코드를 순환합니다. 소유하거나 제어하는 기기에서만 사용하세요. 기기가 반응하면 즉시 중지하세요.';

  @override
  String get universalPowerConsentCheckbox => '나는 이 기기를 소유하거나 제어합니다';

  @override
  String get universalPowerSetupBody =>
      '선택한 브랜드의 전원 코드를 순환합니다. 기기가 반응하면 즉시 중지하세요.';

  @override
  String universalPowerLastSent(Object value) {
    return '마지막 전송: $value';
  }

  @override
  String get universalPowerNoCodesFound => '전원 코드를 찾지 못했습니다. 검색 범위를 넓혀 보세요.';

  @override
  String get universalPowerUnableToStart => '시작할 수 없습니다.';

  @override
  String get universalPowerAllBrands => '모든 브랜드(필터 없음)';

  @override
  String get universalPowerClearBrandFilter => '브랜드 필터 지우기';

  @override
  String get universalPowerBroadenSearch => '필요하면 검색 범위 넓히기';

  @override
  String get universalPowerBroadenSearchHint => '전원 레이블이 없으면 다른 키도 포함하세요.';

  @override
  String get universalPowerAdditionalPatternsDepth => '추가 패턴 깊이';

  @override
  String get universalPowerDepth1 => '우선순위만: POWER/OFF';

  @override
  String get universalPowerDepth2 => 'POWER 별칭 포함';

  @override
  String get universalPowerDepth3 => '보조 전원 레이블 포함';

  @override
  String get universalPowerDepth4 => '모든 레이블 포함(가장 낮은 우선순위)';

  @override
  String get universalPowerLoopUntilStopped => '반복 까지 중지됨';

  @override
  String get universalPowerLoopUntilStoppedHint => '중지할 때까지 대기열을 계속 순환합니다';

  @override
  String get universalPowerDelayBetweenCodes => '코드 사이 지연';

  @override
  String get universalPowerStart => '시작 범용 전원';

  @override
  String get universalPowerRunStatus => '실행 상태';

  @override
  String universalPowerProgress(Object value) {
    return '진행률: $value';
  }

  @override
  String get universalPowerPausedInBackground => '앱이 백그라운드로 가서 일시정지되었습니다.';

  @override
  String get universalPowerSendOneCode => '전송 하나 코드';

  @override
  String get universalPowerStopWhenDeviceResponds => '기기가 반응하면 즉시 중지하세요.';

  @override
  String get iconNamePlay => '재생';

  @override
  String get iconNamePause => '일시정지';

  @override
  String get iconNameStop => '중지';

  @override
  String get iconNameFastForward => '빨리감기';

  @override
  String get iconNameRewind => '되감기';

  @override
  String get iconNameSkipNext => '다음으로 건너뛰기';

  @override
  String get iconNameSkipPrevious => '이전으로 건너뛰기';

  @override
  String get iconNameReplay => '다시 재생';

  @override
  String get iconNameForward10S => '10초 앞으로';

  @override
  String get iconNameForward30S => '30초 앞으로';

  @override
  String get iconNameReplay10S => '10초 되감기';

  @override
  String get iconNameReplay30S => '30초 되감기';

  @override
  String get iconNameRecord => '녹화';

  @override
  String get iconNameRecordAlt => '녹화 대체';

  @override
  String get iconNameEject => '꺼내기';

  @override
  String get iconNameShuffle => '셔플';

  @override
  String get iconNameRepeat => '반복';

  @override
  String get iconNameRepeatOne => '한 곡 반복';

  @override
  String get iconNameVolumeUp => '볼륨 올리기';

  @override
  String get iconNameVolumeDown => '볼륨 내리기';

  @override
  String get iconNameVolumeOff => '볼륨 끔';

  @override
  String get iconNameMute => '음소거';

  @override
  String get iconNameSpeaker => '스피커';

  @override
  String get iconNameSurroundSound => '서라운드 사운드';

  @override
  String get iconNameEqualizer => '이퀄라이저';

  @override
  String get iconNameAudio => '오디오';

  @override
  String get iconNameMicrophone => '마이크';

  @override
  String get iconNameMicOff => '마이크 끔';

  @override
  String get iconNameUp => '위';

  @override
  String get iconNameDown => '아래';

  @override
  String get iconNameLeft => '왼쪽';

  @override
  String get iconNameRight => '오른쪽';

  @override
  String get iconNameArrowUp => '위 화살표';

  @override
  String get iconNameArrowDown => '아래 화살표';

  @override
  String get iconNameArrowLeft => '왼쪽 화살표';

  @override
  String get iconNameArrowRight => '오른쪽 화살표';

  @override
  String get iconNameNavigation => '탐색';

  @override
  String get iconNameChevronLeft => '왼쪽 셰브런';

  @override
  String get iconNameChevronRight => '오른쪽 셰브런';

  @override
  String get iconNameExpandLess => '접기';

  @override
  String get iconNameExpandMore => '더 펼치기';

  @override
  String get iconNameCollapse => '접기';

  @override
  String get iconNameExpand => '펼치기';

  @override
  String get iconNameCircleUp => '원형 위';

  @override
  String get iconNameCircleDown => '원형 아래';

  @override
  String get iconNameCircleLeft => '원형 왼쪽';

  @override
  String get iconNameCircleRight => '원형 오른쪽';

  @override
  String get iconNameOkSelect => '확인/선택';

  @override
  String get iconNameConfirm => '확인';

  @override
  String get iconNameCancel => '취소';

  @override
  String get iconNameClose => '닫기';

  @override
  String get iconNameHome => '홈';

  @override
  String get iconNameReturn => '돌아가기';

  @override
  String get iconNameExit => '종료';

  @override
  String get iconNameUndo => '실행 취소';

  @override
  String get iconNameRedo => '다시 실행';

  @override
  String get iconNamePower => '전원';

  @override
  String get iconNamePowerAlt => '전원 대체';

  @override
  String get iconNamePowerOff => '전원 끄기';

  @override
  String get iconNameOn => '켜짐';

  @override
  String get iconNameOff => '꺼짐';

  @override
  String get iconNameToggleOn => '켜기 토글';

  @override
  String get iconNameToggleOff => '끄기 토글';

  @override
  String get iconNameRestart => '재시작';

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
  String get iconNameOne => '하나';

  @override
  String get iconNameTwo => '둘';

  @override
  String get iconNameThree => '셋';

  @override
  String get iconNameFour => '넷';

  @override
  String get iconNameFive => '다섯';

  @override
  String get iconNameSix => '여섯';

  @override
  String get iconNamePlus => '플러스';

  @override
  String get iconNameMinus => '마이너스';

  @override
  String get iconNameAddCircle => '추가 원형';

  @override
  String get iconNameRemoveCircle => '제거 원형';

  @override
  String get iconNameSettings => '설정';

  @override
  String get iconNameMenu => '메뉴';

  @override
  String get iconNameMoreVertical => '더보기 세로';

  @override
  String get iconNameMoreHorizontal => '더보기 가로';

  @override
  String get iconNameTune => '조정';

  @override
  String get iconNameRemoteSettings => '리모컨 설정';

  @override
  String get iconNameInfo => '정보';

  @override
  String get iconNameInfoOutline => '정보 윤곽선';

  @override
  String get iconNameHelp => '도움말';

  @override
  String get iconNameHelpOutline => '도움말 윤곽선';

  @override
  String get iconNameList => '목록';

  @override
  String get iconNameViewList => '목록 보기';

  @override
  String get iconNameViewGrid => '격자 보기';

  @override
  String get iconNameApps => '앱';

  @override
  String get iconNameWidgets => '위젯';

  @override
  String get iconNameTv => 'TV';

  @override
  String get iconNameMonitor => '모니터';

  @override
  String get iconNameDesktop => '데스크톱';

  @override
  String get iconNameBrightnessHigh => '밝기 높음';

  @override
  String get iconNameBrightnessMedium => '밝기 중간';

  @override
  String get iconNameBrightnessLow => '밝기 낮음';

  @override
  String get iconNameAutoBrightness => '자동 밝기';

  @override
  String get iconNameLightMode => '라이트 모드';

  @override
  String get iconNameDarkMode => '다크 모드';

  @override
  String get iconNameContrast => '대비';

  @override
  String get iconNameHdrOn => 'HDR 켜기';

  @override
  String get iconNameHdrOff => 'HDR 끄기';

  @override
  String get iconNameAspectRatio => '화면 비율';

  @override
  String get iconNameCrop => '자르기';

  @override
  String get iconNameZoomIn => '확대';

  @override
  String get iconNameZoomOut => '축소';

  @override
  String get iconNameFullscreen => '전체 화면';

  @override
  String get iconNameExitFullscreen => '전체 화면 종료';

  @override
  String get iconNameFitScreen => '화면 맞춤';

  @override
  String get iconNamePip => 'PIP';

  @override
  String get iconNameCropFree => '자유 자르기';

  @override
  String get iconNameInput => '입력';

  @override
  String get iconNameCable => '케이블';

  @override
  String get iconNameCast => '캐스트';

  @override
  String get iconNameCastConnected => '캐스트 연결됨';

  @override
  String get iconNameScreenShare => '화면 공유';

  @override
  String get iconNameBluetooth => '블루투스';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => '라우터';

  @override
  String get iconNameMemory => '메모리';

  @override
  String get iconNameGameConsole => '게임 콘솔';

  @override
  String get iconNameGaming => '게이밍';

  @override
  String get iconNameMedia => '미디어';

  @override
  String get iconNameMusicQueue => '음악 대기열';

  @override
  String get iconNameVideoLibrary => '비디오 라이브러리';

  @override
  String get iconNamePhotoLibrary => '사진 라이브러리';

  @override
  String get iconNameComponent => '컴포넌트';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => '컴포지트';

  @override
  String get iconNameAntenna => '안테나';

  @override
  String get iconNameFavorite => '즐겨찾기';

  @override
  String get iconNameFavoriteOutline => '즐겨찾기 윤곽선';

  @override
  String get iconNameStar => '별';

  @override
  String get iconNameStarOutline => '별 윤곽선';

  @override
  String get iconNameBookmark => '북마크';

  @override
  String get iconNameBookmarkOutline => '북마크 윤곽선';

  @override
  String get iconNameFlag => '플래그';

  @override
  String get iconNameCheck => '확인';

  @override
  String get iconNameDone => '완료';

  @override
  String get iconNameDoneAll => '모두 완료';

  @override
  String get iconNameSchedule => '일정';

  @override
  String get iconNameTimer => '타이머';

  @override
  String get iconNameTime => '시간';

  @override
  String get iconNameAlarm => '알람';

  @override
  String get iconNameNotifications => '알림';

  @override
  String get iconNameLock => '잠금';

  @override
  String get iconNameUnlock => '잠금 해제';

  @override
  String get iconNameLight => '라이트';

  @override
  String get iconNameLightOutline => '라이트 윤곽선';

  @override
  String get iconNameWarmLight => '따뜻한 조명';

  @override
  String get iconNameSunny => '맑음';

  @override
  String get iconNameCloudy => '흐림';

  @override
  String get iconNameNight => '밤';

  @override
  String get iconNameFlare => '플레어';

  @override
  String get iconNameGradient => '그라데이션';

  @override
  String get iconNameInvertColors => '색 반전';

  @override
  String get iconNamePalette => '팔레트';

  @override
  String get iconNameColor => '색상';

  @override
  String get iconNameTonality => '톤';

  @override
  String get iconNameSearch => '검색';

  @override
  String get iconNameRefresh => '새로고침';

  @override
  String get iconNameSync => '동기화';

  @override
  String get iconNameUpdate => '업데이트';

  @override
  String get iconNameDownload => '다운로드';

  @override
  String get iconNameUpload => '업로드';

  @override
  String get iconNameCloud => '클라우드';

  @override
  String get iconNameFolder => '폴더';

  @override
  String get iconNameDelete => '삭제';

  @override
  String get iconNameEdit => '편집';

  @override
  String get iconNameSave => '저장';

  @override
  String get iconNameShare => '공유';

  @override
  String get iconNamePrint => '인쇄';

  @override
  String get iconNameLanguage => '언어';

  @override
  String get iconNameTranslate => '번역';

  @override
  String get iconNameMicNone => '마이크 없음';

  @override
  String get iconNameSubtitles => '자막';

  @override
  String get iconNameClosedCaption => '폐쇄 자막';

  @override
  String get iconNameMusic => '음악';

  @override
  String get iconNameMovie => '영화';

  @override
  String get iconNameTheater => '극장';

  @override
  String get iconNameLiveTv => '라이브 TV';

  @override
  String get iconNameRadio => '라디오';

  @override
  String get iconNameCamera => '카메라';

  @override
  String get iconNameVideoCamera => '비디오 카메라';

  @override
  String get iconNamePhotoCamera => '사진 카메라';

  @override
  String get iconNameSlowMotion => '슬로 모션';

  @override
  String get iconNameSpeed => '속도';

  @override
  String get iconNameVideoSettings => '비디오 설정';

  @override
  String get iconNameAudioTrack => '오디오 트랙';

  @override
  String get iconNameGraphicEq => '그래픽 EQ';

  @override
  String get iconNameMusicVideo => '뮤직 비디오';

  @override
  String get iconNamePlaylist => '재생목록';

  @override
  String get iconNameQueue => '대기열';

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
  String get iconNameHashFa => '해시 # FA';

  @override
  String get iconNamePercentFa => '퍼센트 % FA';

  @override
  String get iconNameDivideFa => '나누기 ÷ FA';

  @override
  String get iconNameMultiplyFa => '곱하기 × FA';

  @override
  String get iconNameEqualsFa => '같음 = FA';

  @override
  String get iconNameNotEqualFa => '같지 않음 ≠ FA';

  @override
  String get iconNameGreaterThanFa => '보다 큼 > FA';

  @override
  String get iconNameLessThanFa => '보다 작음 < FA';

  @override
  String get iconNameAsteriskFa => '별표 * FA';

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
  String get iconNamePlayFa => '재생 FA';

  @override
  String get iconNamePauseFa => '일시정지 FA';

  @override
  String get iconNameStopFa => '중지 FA';

  @override
  String get iconNamePlayFaOutline => '재생 FA 윤곽선';

  @override
  String get iconNamePauseFaOutline => '일시정지 FA 윤곽선';

  @override
  String get iconNameStopFaOutline => '중지 FA 윤곽선';

  @override
  String get iconNameBackwardFa => '뒤로 FA';

  @override
  String get iconNameForwardFa => '앞으로 FA';

  @override
  String get iconNamePreviousFa => '이전 FA';

  @override
  String get iconNameNextFa => '다음 FA';

  @override
  String get iconNameRewindFa => '되감기 FA';

  @override
  String get iconNameFastForwardFa => '빨리감기 FA';

  @override
  String get iconNameRepeatFa => '반복 FA';

  @override
  String get iconNameShuffleFa => '셔플 FA';

  @override
  String get iconNameEjectFa => '꺼내기 FA';

  @override
  String get iconNameFilmFa => '필름 FA';

  @override
  String get iconNameVideoFa => '비디오 FA';

  @override
  String get iconNameMusicFa => '음악 FA';

  @override
  String get iconNameMicrophoneFa => '마이크 FA';

  @override
  String get iconNameCameraFa => '카메라 FA';

  @override
  String get iconNameCameraRetroFa => '카메라 레트로 FA';

  @override
  String get iconNameVolumeHighFa => '볼륨 높음 FA';

  @override
  String get iconNameVolumeLowFa => '볼륨 낮음 FA';

  @override
  String get iconNameVolumeOffFa => '볼륨 끔 FA';

  @override
  String get iconNameMuteFa => '음소거 FA';

  @override
  String get iconNameMicMuteFa => '마이크 음소거 FA';

  @override
  String get iconNameHeadphonesFa => '헤드폰 FA';

  @override
  String get iconNameSpeakerFa => '스피커 FA';

  @override
  String get iconNameUpFa => '위 FA';

  @override
  String get iconNameDownFa => '아래 FA';

  @override
  String get iconNameLeftFa => '왼쪽 FA';

  @override
  String get iconNameRightFa => '오른쪽 FA';

  @override
  String get iconNameUpFaOutline => '위 FA 윤곽선';

  @override
  String get iconNameDownFaOutline => '아래 FA 윤곽선';

  @override
  String get iconNameLeftFaOutline => '왼쪽 FA 윤곽선';

  @override
  String get iconNameRightFaOutline => '오른쪽 FA 윤곽선';

  @override
  String get iconNameArrowUpFa => '위 화살표 FA';

  @override
  String get iconNameArrowDownFa => '아래 화살표 FA';

  @override
  String get iconNameArrowLeftFa => '왼쪽 화살표 FA';

  @override
  String get iconNameArrowRightFa => '오른쪽 화살표 FA';

  @override
  String get iconNameChevronUpFa => '위 셰브런 FA';

  @override
  String get iconNameChevronDownFa => '아래 셰브런 FA';

  @override
  String get iconNameChevronLeftFa => '왼쪽 셰브런 FA';

  @override
  String get iconNameChevronRightFa => '오른쪽 셰브런 FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA 윤곽선';

  @override
  String get iconNameCheckFa => '확인 FA';

  @override
  String get iconNameCloseFa => '닫기 FA';

  @override
  String get iconNameCloseCircleFa => '닫기 원형 FA';

  @override
  String get iconNameHomeFa => '홈 FA';

  @override
  String get iconNameUndoFa => '실행 취소 FA';

  @override
  String get iconNameRedoFa => '다시 실행 FA';

  @override
  String get iconNameRotateFa => '회전 FA';

  @override
  String get iconNameSearchFa => '검색 FA';

  @override
  String get iconNameRefreshFa => '새로고침 FA';

  @override
  String get iconNamePowerOffFa => '전원 끄기 FA';

  @override
  String get iconNamePlugFa => '플러그 FA';

  @override
  String get iconNameToggleOnFa => '켜기 토글 FA';

  @override
  String get iconNameToggleOffFa => '끄기 토글 FA';

  @override
  String get iconNameSettingsFa => '설정 FA';

  @override
  String get iconNameSettingsAltFa => '설정 대체 FA';

  @override
  String get iconNameMenuFa => '메뉴 FA';

  @override
  String get iconNameMoreFa => '더보기 FA';

  @override
  String get iconNameMoreVerticalFa => '더보기 세로 FA';

  @override
  String get iconNameInfoFa => '정보 FA';

  @override
  String get iconNameInfoFaOutline => '정보 FA 윤곽선';

  @override
  String get iconNameHelpFa => '도움말 FA';

  @override
  String get iconNameHelpFaOutline => '도움말 FA 윤곽선';

  @override
  String get iconNameListFa => '목록 FA';

  @override
  String get iconNameGridFa => '격자 FA';

  @override
  String get iconNameSlidersFa => '슬라이더 FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => '모니터 FA';

  @override
  String get iconNameDesktopFa => '데스크톱 FA';

  @override
  String get iconNameBrightnessFa => '밝기 FA';

  @override
  String get iconNameNightModeFa => '밤 Mode FA';

  @override
  String get iconNameLightFa => '라이트 FA';

  @override
  String get iconNameLightFaOutline => '라이트 FA 윤곽선';

  @override
  String get iconNameFlashFa => '플래시 FA';

  @override
  String get iconNameFullscreenFa => '전체 화면 FA';

  @override
  String get iconNameExitFullscreenFa => '전체 화면 종료 FA';

  @override
  String get iconNameZoomInFa => '확대 FA';

  @override
  String get iconNameZoomOutFa => '축소 FA';

  @override
  String get iconNameSubtitlesFa => '자막 FA';

  @override
  String get iconNamePictureInPictureFa => '그림 그림 FA';

  @override
  String get iconNameColorFa => '색상 FA';

  @override
  String get iconNamePaintFa => '그리기 FA';

  @override
  String get iconNameInputFa => '입력 FA';

  @override
  String get iconNameWifiFa => 'WiFi FA';

  @override
  String get iconNameBluetoothFa => '블루투스 FA';

  @override
  String get iconNameUsbFa => 'USB FA';

  @override
  String get iconNameEthernetFa => '이더넷 FA';

  @override
  String get iconNameGamepadFa => '게임패드 FA';

  @override
  String get iconNameBroadcastFa => '방송 FA';

  @override
  String get iconNameSatelliteFa => '위성 FA';

  @override
  String get iconNameAntennaFa => '안테나 FA';

  @override
  String get iconNameNetworkFa => '네트워크 FA';

  @override
  String get iconNameCloudFa => '클라우드 FA';

  @override
  String get iconNameStarFa => '별 FA';

  @override
  String get iconNameStarFaOutline => '별 FA 윤곽선';

  @override
  String get iconNameHeartFa => '하트 FA';

  @override
  String get iconNameHeartFaOutline => '하트 FA 윤곽선';

  @override
  String get iconNameBookmarkFa => '북마크 FA';

  @override
  String get iconNameBookmarkFaOutline => '북마크 FA 윤곽선';

  @override
  String get iconNameFlagFa => '플래그 FA';

  @override
  String get iconNameClockFa => '시계 FA';

  @override
  String get iconNameClockFaOutline => '시계 FA 윤곽선';

  @override
  String get iconNameBellFa => '벨 FA';

  @override
  String get iconNameBellFaOutline => '벨 FA 윤곽선';

  @override
  String get iconNameTimerFa => '타이머 FA';

  @override
  String get iconNameLockFa => '잠금 FA';

  @override
  String get iconNameUnlockFa => '잠금 해제 FA';

  @override
  String get iconNameGalleryFa => '갤러리 FA';

  @override
  String get iconNameImagesFa => '이미지 FA';

  @override
  String get iconNameImageFa => '이미지 FA';

  @override
  String get iconNameVideoFileFa => '비디오 파일 FA';

  @override
  String get iconNameAudioFileFa => '오디오 파일 FA';

  @override
  String get iconNamePlayOutlineFa => '재생 윤곽선 FA';

  @override
  String get iconNamePlaySimpleFa => '재생 단순 FA';

  @override
  String get iconNamePauseSimpleFa => '일시정지 단순 FA';

  @override
  String get iconNameStopSimpleFa => '중지 단순 FA';

  @override
  String get iconNameRecordFa => '녹화 FA';

  @override
  String get iconNameStopCircleFa => '중지 원형 FA';

  @override
  String get iconNameLoadingFa => '로딩 FA';

  @override
  String get iconNameTextFa => '텍스트 FA';

  @override
  String get iconNameTextSizeFa => '텍스트 크기 FA';

  @override
  String get iconNameLanguageFa => '언어 FA';

  @override
  String get iconNameGlobeFa => '지구 FA';

  @override
  String get iconNameSubtitlesAltFa => '자막 대체 FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => '자막 대체 윤곽선 FA';

  @override
  String get iconNameChannelUpFa => '채널 위 FA';

  @override
  String get iconNameChannelDownFa => '채널 아래 FA';

  @override
  String get iconNamePageUpFa => '페이지 위 FA';

  @override
  String get iconNamePageDownFa => '페이지 아래 FA';

  @override
  String get iconNameGuideFa => '가이드 FA';

  @override
  String get iconNameGridViewFa => '격자 보기 FA';

  @override
  String get iconNameGridAltFa => '격자 대체 FA';

  @override
  String get iconNameScheduleFa => '일정 FA';

  @override
  String get iconNameCalendarFa => '캘린더 FA';

  @override
  String get iconNameRedButtonFa => '빨강 버튼 FA';

  @override
  String get iconNameButtonOutlineFa => '버튼 윤곽선 FA';

  @override
  String get iconNameSquareButtonFa => '사각형 버튼 FA';

  @override
  String get iconNameSquareOutlineFa => '사각형 윤곽선 FA';

  @override
  String get iconNameDotCircleFa => '점 원형 FA';

  @override
  String get iconNameToolsFa => '도구 FA';

  @override
  String get iconNameScrewdriverFa => '드라이버 FA';

  @override
  String get iconNameHammerFa => '망치 FA';

  @override
  String get iconNameToolboxFa => '도구상자 FA';

  @override
  String get iconNameCogFa => '톱니 FA';

  @override
  String get iconNameAdjustFa => '조정 FA';

  @override
  String get iconNameFilterFa => '필터 FA';

  @override
  String get iconNameSortDownFa => '정렬 아래 FA';

  @override
  String get iconNameSortUpFa => '정렬 위 FA';

  @override
  String get iconNameSleepFa => '절전 FA';

  @override
  String get iconNameTimerStartFa => '타이머 시작 FA';

  @override
  String get iconNameTimerHalfFa => '타이머 절반 FA';

  @override
  String get iconNameTimerEndFa => '타이머 끝 FA';

  @override
  String get iconNameStopwatchFa => '스톱워치 FA';

  @override
  String get iconNameAlarmFa => '알람 FA';

  @override
  String get iconNameCropAltFa => '자르기 대체 FA';

  @override
  String get iconNameCropFa => '자르기 FA';

  @override
  String get iconNameSquareFullFa => '사각형 가득 찬 FA';

  @override
  String get iconNameFullscreenAltFa => '전체 화면 대체 FA';

  @override
  String get iconNameZoomPlusFa => '줌 플러스 FA';

  @override
  String get iconNameZoomMinusFa => '줌 마이너스 FA';

  @override
  String get iconNameMusicNoteFa => '음악 노트 FA';

  @override
  String get iconNameCdFa => 'CD FA';

  @override
  String get iconNameVinylFa => '바이닐 FA';

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
  String get iconNameCastFa => '캐스트 FA';

  @override
  String get iconNameStreamFa => 'Stream FA';

  @override
  String get iconNameSignalFa => '신호 FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => '원형 위 화살표 FA';

  @override
  String get iconNameCircleArrowDownFa => '원형 아래 화살표 FA';

  @override
  String get iconNameCircleArrowLeftFa => '원형 왼쪽 화살표 FA';

  @override
  String get iconNameCircleArrowRightFa => '원형 오른쪽 화살표 FA';

  @override
  String get iconNameLongArrowUpFa => 'Long 위 화살표 FA';

  @override
  String get iconNameLongArrowDownFa => 'Long 아래 화살표 FA';

  @override
  String get iconNameLongArrowLeftFa => 'Long 왼쪽 화살표 FA';

  @override
  String get iconNameLongArrowRightFa => 'Long 오른쪽 화살표 FA';

  @override
  String get iconNamePlusFa => '플러스 FA';

  @override
  String get iconNameMinusFa => '마이너스 FA';

  @override
  String get iconNamePlusCircleFa => '플러스 원형 FA';

  @override
  String get iconNameMinusCircleFa => '마이너스 원형 FA';

  @override
  String get iconNamePlusSquareFa => '플러스 사각형 FA';

  @override
  String get iconNameMinusSquareFa => '마이너스 사각형 FA';

  @override
  String get iconNameTimesFa => 'Times FA';

  @override
  String get iconNameTimesCircleFa => 'Times 원형 FA';

  @override
  String get iconNameBatteryFullFa => '배터리 가득 찬 FA';

  @override
  String get iconNameBattery34Fa => '배터리 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => '배터리 절반 FA';

  @override
  String get iconNameBattery14Fa => '배터리 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => '배터리 Empty FA';

  @override
  String get iconNameChargingFa => 'Charging FA';

  @override
  String get iconNameCloudSunFa => '클라우드 Sun FA';

  @override
  String get iconNameCloudMoonFa => '클라우드 Moon FA';

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
  String get unknownLabel => '알 수 없음';

  @override
  String get selectedFilesLabel => '선택한 파일';

  @override
  String get folderNotFoundOrInaccessible => '폴더 않음 찾을 수 없음 또는 inaccessible.';

  @override
  String get importedRemoteDefaultName => 'ImportedRemote';

  @override
  String get demoRemoteName => '데모 리모컨';

  @override
  String get protocolFieldsInvalid =>
      'Fill 필수 프로토콜 fields 및 ensure frequency 15k–60k if set.';

  @override
  String get unknownProtocolSelected => '알 수 없는 프로토콜이 선택되었습니다.';

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
  String get learningModeCaptureFailed => '학습 캡처에 실패했습니다.';

  @override
  String get learningModeReplaySent => '학습된 신호가 재생되었습니다.';

  @override
  String get learningModeReplayFailed => '학습된 신호를 재생할 수 없습니다.';

  @override
  String get learningModeNoRemotesAvailable => '아직 저장된 리모컨이 없습니다.';

  @override
  String get learningModeChooseRemoteTitle => '리모컨을 선택하세요';

  @override
  String get learningModeNewRemoteTitle => '새 리모컨 만들기';

  @override
  String get learningModeSaveSuccess => '학습된 버튼이 저장되었습니다.';

  @override
  String get learningModeSaveFailed => '학습된 버튼을 저장할 수 없습니다.';

  @override
  String get remoteSetupIntro => '먼저 이름과 레이아웃을 선택하세요. 버튼은 나중에 추가할 수 있습니다.';

  @override
  String get startWithDefault => '기본값으로 시작';

  @override
  String get browseGithubStore => 'GitHub 스토어 보기';

  @override
  String get addFirstButton => '첫 버튼 추가';

  @override
  String get moreWaysToStart => '다른 시작 방법';

  @override
  String get unsavedRemoteSetupChangesMessage => '새 리모컨 설정을 버리고 이 화면을 나가시겠습니까?';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      '리모컨 변경사항을 버리고 이 화면을 나가시겠습니까?';

  @override
  String get firstButtonAdded => '첫 버튼을 추가했습니다.';

  @override
  String get iconColorTitle => '아이콘 색상';

  @override
  String get iconColorHelper => '버튼 배경 위에서도 잘 보이는 심볼 색상을 선택하세요.';

  @override
  String get colorRed => '빨강';

  @override
  String get colorPink => '분홍';

  @override
  String get colorPurple => '보라';

  @override
  String get colorDeepPurple => '진보라';

  @override
  String get colorIndigo => '인디고';

  @override
  String get colorBlue => '파랑';

  @override
  String get colorLightBlue => '하늘색';

  @override
  String get colorCyan => '시안';

  @override
  String get colorTeal => '청록';

  @override
  String get colorGreen => '초록';

  @override
  String get colorLightGreen => '연두';

  @override
  String get colorLime => '라임';

  @override
  String get colorYellow => '노랑';

  @override
  String get colorAmber => '호박색';

  @override
  String get colorOrange => '주황';

  @override
  String get colorDeepOrange => '진주황';

  @override
  String get colorBrown => '갈색';

  @override
  String get colorGrey => '회색';

  @override
  String get colorBlueGrey => '청회색';

  @override
  String get colorBlack => '검정';

  @override
  String get colorWhite => '흰색';

  @override
  String buttonColorSemantics(Object colorName) {
    return '버튼 색상 $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return '버튼 색상 $colorName, 선택됨';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return '아이콘 색상 $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return '아이콘 색상 $colorName, 선택됨';
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
