// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'กำลังโหลด…';

  @override
  String get unknownError => 'ข้อผิดพลาดที่ไม่ทราบสาเหตุ';

  @override
  String get failedToStart => 'เริ่มไม่สำเร็จ';

  @override
  String get retry => 'ลองอีกครั้ง';

  @override
  String get quickTilePower => 'Power';

  @override
  String get quickTileMute => 'ปิดเสียง';

  @override
  String get quickTileVolumeUp => 'Vol +';

  @override
  String get quickTileVolumeDown => 'Vol -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'โทรศัพท์นี้ไม่มี IR ในตัว ตรวจพบดองเกิล IR USB แต่ยังไม่ได้รับสิทธิ์\n\nอนุมัติสิทธิ์ USB เพื่อเปิดการส่ง IR';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'โทรศัพท์นี้ไม่มี IR ในตัว ตรวจพบดองเกิล IR USB แต่สิทธิ์ USB ถูกปฏิเสธ\n\nขอสิทธิ์อีกครั้งและอนุมัติเพื่อเปิดการส่ง IR';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'โทรศัพท์นี้ไม่มี IR ในตัว ดองเกิล IR USB ได้รับสิทธิ์แล้ว แต่ยังไม่เริ่มต้น';

  @override
  String get homeUsbOpenFailedMessage =>
      'โทรศัพท์นี้ไม่มี IR ในตัว ตรวจพบและอนุญาตดองเกิล IR USB แล้ว แต่เริ่มต้นไม่สำเร็จ\n\nถอดเสียบใหม่แล้วลองอีกครั้ง';

  @override
  String get homeUsbReadyMessage => 'โทรศัพท์นี้ไม่มี IR ในตัว';

  @override
  String get homeUsbNoDeviceMessage =>
      'โทรศัพท์นี้ไม่มี IR ในตัว และยังไม่มีดองเกิล IR USB ที่รองรับเชื่อมต่ออยู่\n\nคุณยังสร้าง นำเข้า และจัดการรีโมตได้ แต่หากต้องการส่งสัญญาณ IR ต้องใช้ตัวเลือกด้านล่างอย่างใดอย่างหนึ่ง';

  @override
  String get homeUsbOptionPlugIn =>
      'เสียบดองเกิล IR USB ที่รองรับ แล้วอนุมัติสิทธิ์';

  @override
  String get homeUsbOptionReady => 'พร้อมใช้';

  @override
  String get homeUsbOptionPermissionRequired => 'เสียบแล้ว ต้องการสิทธิ์';

  @override
  String get homeUsbOptionPermissionDenied => 'สิทธิ์ถูกปฏิเสธ ขอใหม่อีกครั้ง';

  @override
  String get homeUsbOptionPermissionGranted =>
      'อนุญาตแล้ว กำลังเริ่มต้นดองเกิล';

  @override
  String get homeUsbOptionOpenFailed => 'อนุญาตแล้ว แต่เริ่มต้นไม่สำเร็จ';

  @override
  String get homeHardwareBannerNoInternal =>
      'โทรศัพท์นี้ไม่มี IR ในตัว เชื่อมต่อดองเกิล IR USB หรือเปิดโหมดเสียงใน การตั้งค่า';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'ตรวจพบดองเกิล USB ต้องการสิทธิ์เพื่อส่ง IR';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'สิทธิ์ USB ถูกปฏิเสธ ขออีกครั้งเพื่อส่ง IR';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'ดองเกิล USB ได้รับสิทธิ์แล้ว รอการเริ่มต้น';

  @override
  String get homeHardwareBannerOpenFailed =>
      'ดองเกิล USB ได้รับสิทธิ์แล้ว แต่เริ่มต้นไม่สำเร็จ';

  @override
  String get homeHardwareBannerReady => 'USB พร้อมแล้ว';

  @override
  String get homeHardwareRequiredTitle => 'ต้องมีฮาร์ดแวร์ IR เพื่อส่งคำสั่ง';

  @override
  String get homeUsbDongleRecommended => 'ดองเกิล IR USB แนะนำ';

  @override
  String get homeAudioAdapterAlternative => 'อะแดปเตอร์ IR เสียง ทางเลือก';

  @override
  String get homeAudioAdapterDescription =>
      'การตั้งค่า → ตัวส่ง IR → เสียง 1 LED / 2 LED ต้องใช้อะแดปเตอร์แปลงเสียงเป็น IR';

  @override
  String get close => 'ปิด';

  @override
  String get homeChooseTransmitter => 'เลือกตัวส่ง';

  @override
  String get openSettings => 'เปิดการตั้งค่า';

  @override
  String get homeUsbPermissionSentApprove =>
      'ส่งคำขอสิทธิ์ USB แล้ว อนุมัติหน้าต่างแจ้งเพื่อเปิด USB';

  @override
  String get homeUsbDongleNotDetected =>
      'ไม่พบดองเกิล IR USB ที่รองรับ เสียบอุปกรณ์แล้วลองอีกครั้ง';

  @override
  String get homeUsbPermissionRequestFailed => 'ขอสิทธิ์ USB ไม่สำเร็จ';

  @override
  String get working => 'กำลังทำงาน…';

  @override
  String get requestUsbPermission => 'ขอสิทธิ์ USB';

  @override
  String get homeHardwareTip =>
      'เคล็ดลับ คุณยังสร้างและจัดรีโมตได้ตอนนี้ ฮาร์ดแวร์จำเป็นเฉพาะตอนส่งเท่านั้น';

  @override
  String get homeNoIrTransmitterTitle => 'ไม่มีตัวส่ง IR';

  @override
  String get homeHardwareRequiredBody =>
      'IR Blaster สามารถสร้างและจัดการรีโมตได้บนโทรศัพท์ทุกรุ่น แต่หากต้องการส่งคำสั่งอินฟราเรดจริง อุปกรณ์ของคุณต้องมีฮาร์ดแวร์อย่างใดอย่างหนึ่งด้านล่างนี้';

  @override
  String get homeCanStillUseWithoutHardware =>
      'ตอนนี้คุณยังสร้าง นำเข้า และจัดระเบียบรีโมตได้อยู่';

  @override
  String get homeWaysToUseIrBlaster => 'วิธีใช้งาน IR Blaster';

  @override
  String get homeBuiltInIrOptionTitle => 'โทรศัพท์ที่มี IR ในตัว';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'ใช้งานได้กับโทรศัพท์ที่รองรับและมีตัวส่ง IR ในตัว โทรศัพท์เครื่องนี้ไม่มี';

  @override
  String get homeBuiltInIrUnavailable => 'ไม่พร้อมใช้งานบนโทรศัพท์เครื่องนี้';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'อะแดปเตอร์เสียง 3.5 มม.';

  @override
  String get homeContinueWithoutHardware => 'ใช้งานต่อโดยไม่มีฮาร์ดแวร์';

  @override
  String get homeHowItWorks => 'วิธีการทำงาน';

  @override
  String get settingsNavLabel => 'การตั้งค่า';

  @override
  String get dismiss => 'ปิด';

  @override
  String get remotesNavLabel => 'รีโมต';

  @override
  String get macrosNavLabel => 'แมโคร';

  @override
  String get signalTesterNavLabel => 'สัญญาณ Tester';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get remoteNoIrEmitterTitle => 'ไม่มีตัวส่ง IR';

  @override
  String get remoteNoIrEmitterMessage => 'อุปกรณ์นี้ไม่มีตัวส่ง IR';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'แอปนี้ต้องใช้ตัวส่ง IR จึงจะทำงานได้';

  @override
  String get remoteDismiss => 'ปิด';

  @override
  String get remoteClose => 'ปิด';

  @override
  String remoteFailedToSend(Object error) {
    return 'ไม่สำเร็จ เพื่อส่ง IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'เริ่มลูปไม่สำเร็จ: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'ลูปหยุดแล้ว การส่งไม่สำเร็จ: $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'กำลังวน \"$title\" แตะ Stop ที่แถบบนเพื่อหยุด';
  }

  @override
  String get remoteLoopStopped => 'หยุดลูปแล้ว';

  @override
  String get remoteUpdatedNotFound =>
      'อัปเดตรีโมตบนหน้าจอแล้ว แต่ไม่พบในรายการที่บันทึกไว้';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'อัปเดต \"$name\" แล้ว';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'ลบไม่สำเร็จ: $error';
  }

  @override
  String get remoteNotFoundSavedList => 'รีโมต not found in ที่บันทึกไว้ list.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'ลบ \"$name\" แล้ว';
  }

  @override
  String get buttonFallbackTitle => 'ปุ่ม';

  @override
  String get imageFallbackTitle => 'Image';

  @override
  String get noBrowserAvailable => 'ไม่มี browser พร้อมใช้';

  @override
  String failedToOpen(Object error) {
    return 'เปิดไม่สำเร็จ: $error';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get settingsRestoreDemoTitle => 'กู้คืนรีโมตตัวอย่าง';

  @override
  String get settingsRestoreDemoMessage =>
      'การดำเนินการนี้จะแทนที่รีโมตปัจจุบันของคุณด้วยรีโมตตัวอย่างในแอป แนะนำให้สำรองข้อมูลหากต้องการเก็บรายการปัจจุบันไว้';

  @override
  String get settingsRestoreDemoConfirm => 'กู้คืนตัวอย่าง';

  @override
  String get settingsDemoRemotesRestored => 'กู้คืนรีโมตตัวอย่างแล้ว';

  @override
  String get settingsDeleteAllRemotesTitle => 'ลบรีโมตทั้งหมด';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'การดำเนินการนี้จะลบรีโมตทั้งหมดออกจากอุปกรณ์นี้ และไม่สามารถยกเลิกได้';

  @override
  String get settingsDeleteAllConfirm => 'ลบทั้งหมด';

  @override
  String get settingsAllRemotesDeleted => 'ลบรีโมตทั้งหมดแล้ว';

  @override
  String get themeAuto => 'ธีมอัตโนมัติ';

  @override
  String get themeLight => 'ธีมสว่าง';

  @override
  String get themeDark => 'ธีมมืด';

  @override
  String get themeDescAuto => 'ตามการตั้งค่าอุปกรณ์ของคุณ';

  @override
  String get themeDescLight => 'สว่างและชัดเจนเสมอ';

  @override
  String get themeDescDark => 'สบายตา';

  @override
  String get themeHintAuto =>
      'ธีมจะสลับอัตโนมัติตามการตั้งค่าโหมดสว่างและมืดของอุปกรณ์';

  @override
  String get themeHintLight => 'เหมาะสำหรับการใช้งานตอนกลางวันและสภาพแสงดี';

  @override
  String get themeHintDark =>
      'ช่วยลดอาการล้าตาในที่แสงน้อยและประหยัดแบตบนจอ OLED';

  @override
  String get supportDevelopmentTitle => 'สนับสนุนการพัฒนา';

  @override
  String get supportDevelopmentSubtitle =>
      'ช่วยให้ IR Blaster ได้รับการดูแลและรองรับฮาร์ดแวร์ต่อไป';

  @override
  String get supportDevelopmentBody =>
      'ไม่มีโฆษณา ไม่ติดตาม ไม่มีฟีเจอร์ล็อก. การสนับสนุนของคุณช่วยงานโปรโตคอล การรองรับดองเกิล USB และความเข้ากันได้ที่ดีขึ้นในหลายอุปกรณ์';

  @override
  String get donate => 'Donate';

  @override
  String get starRepo => 'ติดดาวรีโป';

  @override
  String get repositoryLinkCopied => 'คัดลอกลิงก์รีโปแล้ว';

  @override
  String get supportPillLocalOnly => 'ทำงานในเครื่อง';

  @override
  String get supportPillNoTracking => 'ไม่ติดตาม';

  @override
  String get supportPillHardwareAware => 'รู้จักฮาร์ดแวร์';

  @override
  String get supportPillOpenSource => 'โอเพนซอร์ส';

  @override
  String get appearanceTitle => 'ลักษณะการแสดงผล';

  @override
  String get appearanceSubtitle => 'ปรับแต่งประสบการณ์การมองเห็นของคุณ';

  @override
  String get localizationTitle => 'ในเครื่องization';

  @override
  String get localizationSubtitle => 'ภาษาของแอปและพฤติกรรมการแปล';

  @override
  String localizationAutoUsing(Object language) {
    return 'อัตโนมัติ: ใช้ $language';
  }

  @override
  String get localizationAutoDescription =>
      'แอปจะใช้ภาษาของอุปกรณ์เมื่อเป็นไปได้';

  @override
  String get localizationManualDescription => 'ภาษาของแอปถูกกำหนดเอง';

  @override
  String get useSystemLanguageTitle => 'ใช้ภาษาระบบ';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Following your อุปกรณ์ ภาษา: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'ใช้ภาษาที่เลือกด้านล่างแทนค่าเริ่มต้นของอุปกรณ์';

  @override
  String get chooseAppLanguage => 'เลือก app ภาษา';

  @override
  String get languagePickerDisabledHint => 'ปิดภาษาระบบเพื่อเลือกภาษาเอง';

  @override
  String get searchLanguages => 'ค้นหาภาษา';

  @override
  String get noLanguagesFound => 'ไม่มี matching ภาษาs';

  @override
  String get localizationHint =>
      'เมื่อเปิดภาษาระบบ แอปจะใช้โลแคลของอุปกรณ์และกลับไปใช้อังกฤษหากยังไม่มีคำแปล ปิดตัวเลือกนี้เพื่อบังคับใช้ภาษาใดภาษาหนึ่ง';

  @override
  String get appLanguageTitle => 'App ภาษา';

  @override
  String get appLanguageHint =>
      'โหมดอัตโนมัติจะใช้ภาษาของอุปกรณ์ เลือก English หรือ French ที่นี่เพื่อบังคับใช้เฉพาะในแอป';

  @override
  String get languageAuto => 'อัตโนมัติ ตามระบบ';

  @override
  String get languageAutoDescription => 'ใช้ภาษาของอุปกรณ์โดยอัตโนมัติ';

  @override
  String get languageEnglish => 'อังกฤษ';

  @override
  String get languageEnglishDescription => 'บังคับให้แอปใช้อังกฤษเสมอ';

  @override
  String get languageFrench => 'ฝรั่งเศส';

  @override
  String get languageFrenchDescription => 'บังคับให้แอปใช้ฝรั่งเศสเสมอ';

  @override
  String get languageAutoShort => 'อัตโนมัติ';

  @override
  String get languageEnglishShort => 'อังกฤษ';

  @override
  String get languageFrenchShort => 'Français';

  @override
  String get useDynamicColors => 'ใช้สีแบบไดนามิก';

  @override
  String get themeChoiceAuto => 'อัตโนมัติ';

  @override
  String get themeChoiceLight => 'สว่าง';

  @override
  String get themeChoiceDark => 'มืด';

  @override
  String get irTransmitterTitle => 'ตัวส่ง IR';

  @override
  String get irTransmitterSubtitle => 'เลือกวิธีส่งสัญญาณ IR';

  @override
  String get learningModeEntryTitle => 'โหมดการเรียนรู้';

  @override
  String get learningModeEntrySubtitle =>
      'จับปุ่มจากระยะไกลทางกายภาพทีละขั้นตอน';

  @override
  String get learningModeTitle => 'โหมดการเรียนรู้';

  @override
  String get learningModeHeroTitle => 'เรียนรู้ปุ่มรีโมทได้อย่างหมดจด';

  @override
  String get learningModeHeroSubtitle =>
      'ตั้งค่าเครื่องรับของคุณ เตรียมรีโมทเดิม จับหนึ่งคำสั่ง จากนั้นตรวจสอบก่อนที่จะบันทึกลงในรีโมท';

  @override
  String get learningModeReadyBadge => 'ผู้รับพร้อม';

  @override
  String get learningModeNeedsPermissionBadge =>
      'จำเป็นต้องได้รับอนุญาตจาก USB';

  @override
  String get learningModeSetupBadge => 'จำเป็นต้องตั้งค่าตัวรับ';

  @override
  String get learningModeNoReceiverBadge => 'ไม่มีตัวรับการเรียนรู้';

  @override
  String get learningModeCheckingBadge => 'กำลังตรวจสอบฮาร์ดแวร์';

  @override
  String get learningModeFourStepFlow => 'โฟลว์แนะนำ 4 ขั้นตอน';

  @override
  String get learningModeSaveAnywhereBadge => 'ตรวจสอบก่อนบันทึก';

  @override
  String get learningModeGuideTitle => 'เลือกจุดที่ควรจะเกิดการจับกุม';

  @override
  String get learningModeStepHardwareShort => 'ฮาร์ดแวร์';

  @override
  String get learningModeStepPrepareShort => 'เตรียมตัว';

  @override
  String get learningModeStepCaptureShort => 'การจับกุม';

  @override
  String get learningModeStepReviewShort => 'ทบทวน';

  @override
  String get learningModeStepHardwareTitle => 'ตรวจสอบฮาร์ดแวร์ตัวรับ';

  @override
  String get learningModeStepHardwareSubtitle =>
      'ตรวจสอบให้แน่ใจว่าได้แนบเครื่องรับการเรียนรู้ที่เข้ากันได้และได้รับอนุญาตก่อนเริ่มต้น';

  @override
  String get learningModeCurrentSenderLabel => 'เครื่องส่งสัญญาณปัจจุบัน';

  @override
  String get learningModeReceiverStatusLabel => 'สถานะการเรียนรู้';

  @override
  String get learningModeCheckingHardwareBody =>
      'กำลังตรวจสอบสถานะเครื่องส่งและตัวรับสัญญาณ USB ที่มีอยู่';

  @override
  String get learningModeHardwareReadyBody =>
      'มีการเชื่อมต่อและเริ่มต้นดองเกิล USB IR แล้ว นี่เป็นสถานที่ที่เหมาะสมในการเริ่มต้นขั้นตอนการเรียนรู้เมื่อเชื่อมต่อสายไฟดักจับแล้ว';

  @override
  String get learningModeHardwarePermissionBody =>
      'มีดองเกิล USB อยู่ แต่สิทธิ์ของ Android ยังคงบล็อกอยู่ ให้สิทธิ์ USB ในส่วนเครื่องส่งสัญญาณก่อนที่จะเรียนรู้';

  @override
  String get learningModeHardwareSetupBody =>
      'ตรวจพบดองเกิลเพียงบางส่วน แต่ยังต้องมีการตั้งค่าหรือเชื่อมต่อใหม่ก่อนที่จะเริ่มการเรียนรู้ได้อย่างน่าเชื่อถือ';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'ขณะนี้ไม่มีฮาร์ดแวร์ตัวรับที่เข้ากันได้ โหมดการเรียนรู้มีไว้สำหรับดองเกิลภายนอกที่รองรับพร้อมความสามารถในการรับ';

  @override
  String get learningModeRefreshHardware => 'รีเฟรชสถานะฮาร์ดแวร์';

  @override
  String get learningModeHardwareTipTitle => 'ตำแหน่งที่ดีที่สุด';

  @override
  String get learningModeHardwareTipBody =>
      'โหมดการเรียนรู้อยู่ภายใต้เครื่องส่งสัญญาณ IR เนื่องจากขึ้นอยู่กับความพร้อมของฮาร์ดแวร์และมีการใช้งานน้อยกว่าการส่งรีโมท';

  @override
  String get learningModeStepPrepareTitle => 'เตรียมรีโมทเดิม';

  @override
  String get learningModeStepPrepareSubtitle =>
      'ตัดสินใจว่าคุณกำลังเรียนรู้อะไร จากนั้นให้ถือรีโมทเดิมให้นิ่งและอยู่ใกล้กับเครื่องรับ';

  @override
  String get learningModeButtonNameLabel => 'ชื่อปุ่ม';

  @override
  String get learningModeButtonNameHint =>
      'ตัวอย่างเช่น: HDMI 1, เปิด/ปิด, เมนู';

  @override
  String get learningModeSinglePress => 'กดครั้งเดียว';

  @override
  String get learningModeHoldButton => 'ปุ่มค้างไว้';

  @override
  String get learningModePreparationChecklistTitle => 'ก่อนที่คุณจะจับ';

  @override
  String get learningModePreparationItemDistance =>
      'ให้รีโมทเดิมอยู่ห่างจากตัวรับประมาณ 2 ถึง 5 ซม.';

  @override
  String get learningModePreparationItemOneButton =>
      'เรียนรู้ทีละปุ่มและใช้การกดสั้นๆ ที่สะอาดก่อน';

  @override
  String get learningModePreparationItemStill =>
      'วางอุปกรณ์ทั้งสองให้นิ่งเพื่อหลีกเลี่ยงการจับภาพที่มีเสียงดังหรือบางส่วน';

  @override
  String get learningModeStepCaptureTitle => 'จับสัญญาณ';

  @override
  String get learningModeStepCaptureSubtitle =>
      'ฟังคำสั่งเดียว จากนั้นล็อคผลลัพธ์ก่อนที่จะตรวจสอบ';

  @override
  String get learningModeCaptureReadyTitle => 'พร้อมรับฟัง';

  @override
  String get learningModeCaptureReadyBody =>
      'สถานะฮาร์ดแวร์ของคุณดูดี แบ็กเอนด์การจับภาพจะเสียบเข้ากับขั้นตอนนี้ต่อไป';

  @override
  String get learningModeCaptureBlockedTitle => 'ฮาร์ดแวร์ยังไม่พร้อม';

  @override
  String get learningModeCaptureBlockedBody =>
      'คุณยังคงสามารถตรวจสอบโฟลว์ได้ในขณะนี้ แต่การจับภาพควรรอจนกว่าผู้รับจะพร้อม';

  @override
  String get learningModeStartListening => 'เริ่มฟัง';

  @override
  String get learningModeCaptureStubTitle => 'จับภาพแบ็กเอนด์มาต่อไป';

  @override
  String get learningModeCaptureStubBody =>
      'หน้าจอนี้จะถูกยึดโดยสมบูรณ์ก่อน ดังนั้นขั้นตอนการจับภาพขั้นสุดท้ายจึงสามารถเสียบเข้ากับสถานะฮาร์ดแวร์จริงได้ แทนที่จะถูกยึดในภายหลัง';

  @override
  String get learningModeCaptureStubMessage =>
      'การจับการเรียนรู้ยังไม่ได้มีสาย หน้าจอนี้จะรองรับโฟลว์ทั้งหมดก่อน';

  @override
  String get learningModeUnnamedCapture => 'การจับที่ไม่มีชื่อ';

  @override
  String get learningModeStatusCheckingTitle => 'กำลังตรวจสอบผู้รับ';

  @override
  String get learningModeStatusNoReceiverTitle => 'ผู้รับไม่พร้อม';

  @override
  String get learningModeStatusPermissionTitle => 'ต้องได้รับอนุญาตจาก USB';

  @override
  String get learningModeStatusSetupTitle => 'ตัวรับสัญญาณจำเป็นต้องตั้งค่า';

  @override
  String get learningModeStatusReadyTitle => 'พร้อมเรียนรู้';

  @override
  String get learningModeStatusListeningTitle => 'กำลังฟังสัญญาณ';

  @override
  String get learningModeStatusCapturedTitle => 'จับสัญญาณแล้ว';

  @override
  String get learningModeStatusReadyBody =>
      'ตั้งชื่อปุ่ม ชี้รีโมทเดิมไปที่เครื่องรับ และเริ่มฟังเมื่อคุณพร้อม';

  @override
  String get learningModeStatusListeningBody =>
      'กดปุ่มรีโมทเดิมได้เลย เมื่อการจับถูกต่อสาย สถานะนี้จะล็อคเข้าสู่สัญญาณสะอาดถัดไป';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'การแสดงตัวอย่างสัญญาณที่เรียนรู้พร้อมแล้วสำหรับ $buttonName เล่นซ้ำ ยืนยันว่าใช้งานได้ แล้วบันทึกลงในห้องสมุดของคุณ';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'เชื่อมต่อดองเกิลการเรียนรู้ที่เข้ากันได้';

  @override
  String get learningModeConnectReceiverBody =>
      'โหมดการเรียนรู้ขึ้นอยู่กับฮาร์ดแวร์ภายนอกที่สามารถรับ IR ได้ เมื่อตรวจพบและอนุญาตผู้รับแล้ว หน้านี้จะกลายเป็นขั้นตอนการฟัง ทดสอบ และบันทึกโดยตรง';

  @override
  String get learningModeListenCardTitle => 'ฟังเพียงปุ่มเดียว';

  @override
  String get learningModeListenCardBody =>
      'ตั้งป้ายกำกับก่อนหากต้องการ จากนั้นเริ่มฟังแล้วกดปุ่มบนรีโมทเดิม';

  @override
  String get learningModeReadyToListenTitle => 'พร้อมรับฟัง';

  @override
  String get learningModeReadyToListenBody =>
      'นี่คือพื้นผิวการจับหลัก เริ่มฟังเฉพาะเมื่อรีโมทเดิมเล็งและมั่นคงเท่านั้น';

  @override
  String get learningModeListeningNowTitle => 'กำลังฟังอยู่ครับ';

  @override
  String get learningModeListeningNowBody =>
      'กดปุ่มรีโมทเดิมหนึ่งครั้ง ใช้การจับภาพตัวอย่างเพื่อเลื่อนผ่านส่วนที่เหลือของโครงก่อนที่จะต่อสายแบ็กเอนด์การจับภาพจริง';

  @override
  String get learningModePreviewCaptureAction => 'ดูตัวอย่างสัญญาณที่จับได้';

  @override
  String get learningModeCapturedSummary => 'เรียนรู้ตัวอย่างสัญญาณ';

  @override
  String get learningModeResultActionsTitle => 'ทดสอบและบันทึก';

  @override
  String get learningModeResultActionsBody =>
      'เล่นซ้ำสัญญาณที่เรียนรู้ ตรวจสอบอุปกรณ์เป้าหมายตอบสนอง จากนั้นบันทึกเป็นปุ่มที่ใช้ซ้ำได้';

  @override
  String get learningModeReplayAction => 'เล่นซ้ำ';

  @override
  String get learningModeReplayStubMessage =>
      'รีเพลย์ยังไม่ได้ต่อสาย นี่คือโครงสร้าง UI สำหรับขั้นตอนการเรียนรู้ ทดสอบ และบันทึกขั้นสุดท้าย';

  @override
  String get learningModeSaveStubMessage =>
      'บันทึกยังไม่ได้ต่อสาย ขั้นตอนต่อไปคือการเชื่อมต่อหน้าจอนี้กับปุ่มสร้างและรีโมทที่มีอยู่';

  @override
  String get learningModeLearnAnotherAction => 'เรียนรู้ปุ่มอื่น';

  @override
  String get learningModeStepReviewTitle => 'ตรวจสอบและบันทึก';

  @override
  String get learningModeStepReviewSubtitle =>
      'ยืนยันสิ่งที่เรียนรู้ จากนั้นเลือกตำแหน่งที่ควรอยู่ในห้องสมุดระยะไกลของคุณ';

  @override
  String get learningModeSaveToExistingRemote => 'ระยะไกลที่มีอยู่';

  @override
  String get learningModeCreateNewRemote => 'รีโมทใหม่';

  @override
  String get learningModeProtocolPreviewTitle => 'การแสดงตัวอย่างโปรโตคอล';

  @override
  String get learningModeProtocolPreviewBody =>
      'รายละเอียดโปรโตคอลที่ถอดรหัสจะปรากฏที่นี่เมื่อผู้รับจับการกดปุ่มที่สะอาด';

  @override
  String get learningModeRawPreviewTitle => 'ทางเลือกดิบ';

  @override
  String get learningModeRawPreviewBody =>
      'หากการถอดรหัสไม่สมบูรณ์ การจับจังหวะแบบ Raw จะยังคงมีอยู่ที่นี่เพื่อตรวจสอบและบันทึก';

  @override
  String get learningModeSaveCapture => 'บันทึกการจับภาพ';

  @override
  String get learningModeReviewTipTitle => 'เรื่องนี้จะไปไหนต่อ.';

  @override
  String get learningModeReviewTipBody =>
      'ขั้นตอนการใช้งานถัดไปควรเชื่อมต่อแผงตรวจสอบนี้กับปุ่มสร้างและรีโมทที่มีอยู่ เพื่อให้สัญญาณที่เรียนรู้ส่งไปยังไลบรารีของคุณโดยตรง';

  @override
  String get learningModeFinishPreview => 'ดูตัวอย่างให้เสร็จสิ้น';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'การโต้ตอบ';

  @override
  String get interactionSubtitle => 'การตอบสนองเมื่อแตะและเลย์เอาต์รีโมต';

  @override
  String get hapticFeedbackTitle => 'การสั่นตอบสนอง';

  @override
  String get hapticFeedbackSubtitle => 'สั่นเมื่อแตะและเมื่อทำงาน';

  @override
  String get forceInAppVibrationTitle => 'บังคับการสั่นในแอป';

  @override
  String get forceInAppVibrationSubtitle =>
      'ใช้ตัวสั่นโดยตรงแม้ว่าการตอบสนองการสัมผัสของระบบจะปิดอยู่';

  @override
  String get forceInAppVibrationWarning =>
      'ตัวเลือกขั้นสูง แอปอาจสั่นได้แม้ว่าการตอบสนองการสัมผัสของ Android จะถูกปิดไว้ทั้งระบบ';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'ความเข้ม';

  @override
  String get intensityLight => 'สว่าง';

  @override
  String get intensityMedium => 'Medium';

  @override
  String get intensityStrong => 'Strong';

  @override
  String get flipRemoteDefaultTitle => 'พลิกมุมมองรีโมตเป็นค่าเริ่มต้น';

  @override
  String get flipRemoteDefaultSubtitle =>
      'เปิด รีโมต screens rotated 180° (for bottom-mounted USB dongles).';

  @override
  String get remoteViewFlipped => 'มุมมองรีโมตจะเปิดแบบกลับด้าน';

  @override
  String get remoteViewNormal => 'มุมมองรีโมตจะเปิดแบบปกติ';

  @override
  String get backupTitle => 'สำรองข้อมูล';

  @override
  String get backupSubtitle => 'นำเข้าและส่งออกรีโมตกับแมโคร';

  @override
  String get importBackup => 'นำเข้าข้อมูลสำรอง';

  @override
  String get importBackupSubtitle =>
      'นำเข้าข้อมูลสำรองรีโมตและแมโคร หรือไฟล์ Flipper Zero, LIRC หรือ IRPLUS';

  @override
  String get bulkImportFolder => 'Bulk import โฟลเดอร์';

  @override
  String get bulkImportFolderSubtitle =>
      'นำเข้า multiple รีโมต from a โฟลเดอร์';

  @override
  String get exportBackup => 'ส่งออก backup';

  @override
  String get exportBackupSubtitle =>
      'Save รีโมต + แมโครs as one JSON ไฟล์ to ดาวน์โหลด';

  @override
  String get restoreDemoRemotes => 'กู้คืนตัวอย่าง รีโมต';

  @override
  String get restoreDemoRemotesSubtitle =>
      'แทนที่รีโมตปัจจุบันด้วยรีโมตตัวอย่างในแอป';

  @override
  String get deleteAllRemotes => 'ลบรีโมตทั้งหมด';

  @override
  String get deleteAllRemotesSubtitle => 'ลบรีโมตทั้งหมดออกจากอุปกรณ์นี้';

  @override
  String get backupTip =>
      'Tip: export a backup before large edits. นำเข้า supports full backups, legacy รีโมต-เท่านั้น JSON backups, and Flipper Zero.ir ไฟล์s.';

  @override
  String get aboutTitle => 'เกี่ยวกับ';

  @override
  String get aboutSubtitle => 'ข้อมูลแอปและรายละเอียดโอเพนซอร์ส';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Bล่าสุดer - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'เวอร์ชัน $version';
  }

  @override
  String get sourceCode => 'ซอร์สโค้ด';

  @override
  String get viewOnGitHub => 'ดูบน GitHub';

  @override
  String get repositoryUrlCopied => 'คัดลอก URL รีโปแล้ว';

  @override
  String get reportIssue => 'รายงานปัญหา';

  @override
  String get reportIssueSubtitle => 'รายงานบั๊กและคำขอฟีเจอร์';

  @override
  String get issuesUrlCopied => 'คัดลอก URL ของ Issues แล้ว';

  @override
  String get license => 'สัญญาอนุญาต';

  @override
  String get openSourceLicense => 'สัญญาอนุญาตโอเพนซอร์ส';

  @override
  String get licenseUrlCopied => 'คัดลอก URL สัญญาอนุญาตแล้ว';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'เยี่ยมชมเว็บไซต์ของเรา';

  @override
  String get companyUrlCopied => 'คัดลอก URL บริษัทแล้ว';

  @override
  String get licenses => 'สัญญาอนุญาต';

  @override
  String get openSourceLicenses => 'สัญญาอนุญาตโอเพนซอร์ส';

  @override
  String byCreator(Object creator) {
    return 'โดย $creator';
  }

  @override
  String get deviceControlsTitle => 'การควบคุมอุปกรณ์';

  @override
  String get deviceControlsSubtitle => 'แสดงปุ่มโปรดในหน้าควบคุมของระบบ';

  @override
  String get manageFavorites => 'จัดการรายการโปรด';

  @override
  String get manageFavoritesSubtitle =>
      'เลือกว่าปุ่มใดจะแสดงในการควบคุมอุปกรณ์';

  @override
  String get quickSettingsTitle => 'การตั้งค่าด่วน';

  @override
  String get quickSettingsSubtitle =>
      'เพิ่มไทล์สำหรับทางลัดปุ่มเปิดปิดและเสียง';

  @override
  String get configureTiles => 'ตั้งค่าไทล์';

  @override
  String get configureTilesSubtitle => 'แมปไทล์กับปุ่มบนรีโมต';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle => 'วนโค้ดพลังงานสำหรับอุปกรณ์ที่คุณเป็นเจ้าของ';

  @override
  String get openTvKill => 'เปิด TVKill';

  @override
  String get openTvKillSubtitle =>
      'วนโค้ดพลังงาน ใช้กับอุปกรณ์ที่คุณเป็นเจ้าของเท่านั้น';

  @override
  String get failedToLoadTransmitterSettings =>
      'ไม่สำเร็จในการload ตัวส่ง settings.';

  @override
  String get usbStatusReady => 'USB dongle is connected and พร้อม เพื่อส่ง IR.';

  @override
  String get usbStatusPermissionRequired =>
      'USB dongle detected. Request USB สิทธิ์ and approve the ระบบ prompt.';

  @override
  String get usbStatusPermissionDenied =>
      'สิทธิ์ USB ถูกปฏิเสธ for the attached dongle. ขออีกครั้ง and approve the prompt.';

  @override
  String get usbStatusPermissionGranted =>
      'USB ได้รับสิทธิ์แล้ว. The dongle still needs to be initialized before it can send IR.';

  @override
  String get usbStatusOpenFailed =>
      'USB ได้รับสิทธิ์แล้ว, but the dongle could not be initialized. ถอดเสียบใหม่แล้วลองอีกครั้ง.';

  @override
  String get usbStatusNoDevice => 'ไม่พบดองเกิล IR USB ที่รองรับ.';

  @override
  String get usbSelectPermissionRequired =>
      'USB dongle detected but not authorized. แตะ \"ขอสิทธิ์ USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'สิทธิ์ USB ถูกปฏิเสธ. แตะ \"ขอสิทธิ์ USB\" and approve the prompt.';

  @override
  String get usbSelectPermissionGranted =>
      'USB ได้รับสิทธิ์แล้ว, but the dongle is not initialized yet. Try reconnecting it.';

  @override
  String get usbSelectOpenFailed =>
      'USB ได้รับสิทธิ์แล้ว, but the dongle could not be initialized. ถอดเสียบใหม่แล้วลองอีกครั้ง.';

  @override
  String get usbSelectNoDevice =>
      'ไม่พบดองเกิล IR USB ที่รองรับ. เสียบอุปกรณ์ แล้วแตะ \"ขอสิทธิ์ USB\".';

  @override
  String get usbSelectReady => 'ดองเกิล USB พร้อมแล้ว.';

  @override
  String get autoSwitchEnabledMessage =>
      'เปิดสลับอัตโนมัติ: ใช้ USB เมื่อเชื่อมต่อ มิฉะนั้นใช้ภายใน';

  @override
  String get autoSwitchDisabledMessage =>
      'ปิดสลับอัตโนมัติ: ตอนนี้เลือกตัวส่งเอง';

  @override
  String get failedToUpdateAutoSwitch =>
      'อัปเดตการตั้งค่าสลับอัตโนมัติไม่สำเร็จ';

  @override
  String get failedToSwitchTransmitter => 'ไม่สำเร็จในการswitch ตัวส่ง.';

  @override
  String get deviceHasNoInternalIr => 'อุปกรณ์นี้ไม่มีตัวส่ง IR ในตัว';

  @override
  String get audioModeEnabledMessage =>
      'โหมดเสียง enabled. Use max media volume and an audio-to-IR LED adapter.';

  @override
  String get usbPermissionRequestSent => 'ส่งคำขอสิทธิ์ USB แล้ว.';

  @override
  String get usbPermissionRequestSentApprove =>
      'ส่งคำขอสิทธิ์ USB แล้ว. อนุมัติหน้าต่างแจ้ง to enable USB.';

  @override
  String get usbAlreadyReady => 'USB dongle is alพร้อม initialized and พร้อม.';

  @override
  String get failedToRequestUsbPermission =>
      'ไม่สำเร็จในการrequest USB สิทธิ์.';

  @override
  String get transmitterHelpInternal =>
      'ใช้ตัวส่ง IR ในตัวของโทรศัพท์เพื่อส่งคำสั่ง';

  @override
  String get transmitterHelpUsb =>
      'ใช้ดองเกิล IR USB ต้องมีสิทธิ์ เพื่อส่งคำสั่ง';

  @override
  String get transmitterHelpAudio1 =>
      'ใช้เอาต์พุตเสียง แบบโมโน ต้องมีอะแดปเตอร์เสียงเป็น IR และเร่งเสียงสื่อสูง';

  @override
  String get transmitterHelpAudio2 =>
      'ใช้เอาต์พุตเสียง แบบสเตอริโอ ใช้สองช่องสัญญาณเพื่อขับ LED ได้ดีขึ้นกับอะแดปเตอร์ที่รองรับ';

  @override
  String get transmitterInternal => 'IR ในตัว';

  @override
  String get transmitterUsb => 'ดองเกิล IR USB';

  @override
  String get transmitterAudio1 => 'เสียง 1 LED';

  @override
  String get transmitterAudio2 => 'เสียง 2 LED';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'ไม่สำเร็จในการload ตัวส่ง capabilities.';

  @override
  String get selectedTransmitter => 'ตัวส่งที่เลือก';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • ใช้งานอยู่: $active';
  }

  @override
  String get refresh => 'รีเฟรช';

  @override
  String get autoSwitchTitle => 'สลับอัตโนมัติ';

  @override
  String get autoSwitchDisabledWhileAudio => 'ปิดใช้งานขณะใช้โหมดเสียง';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'ใช้ USB เมื่อเชื่อมต่อ มิฉะนั้นใช้ภายใน';

  @override
  String get unavailableOnThisDevice => 'Unพร้อมใช้ on this อุปกรณ์';

  @override
  String get openOnUsbAttachTitle => 'เปิดเมื่อเสียบ USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android may suggest opening the app when a ที่รองรับ ดองเกิล IR USB is connected.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'จะแนะนำให้เปิด IR Bล่าสุดer เมื่อเสียบดองเกิล USB ที่รองรับ';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'จะไม่แนะนำให้เปิดเมื่อเสียบ USB';

  @override
  String get failedToUpdateSetting => 'ไม่สำเร็จในการupdate setting.';

  @override
  String get unnamedButton => 'ปุ่มไม่มีชื่อ';

  @override
  String get iconFallback => 'Icon';

  @override
  String get remoteListReorderHint =>
      'โหมดจัดลำดับ: กดค้างและลากการ์ดเพื่อย้าย';

  @override
  String get deleteRemoteTitle => 'ลบรีโมต';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" จะถูกลบถาวร และไม่สามารถยกเลิกได้';
  }

  @override
  String get delete => 'ลบ';

  @override
  String get addToDeviceControlsTitle => 'เพิ่มในการควบคุมอุปกรณ์';

  @override
  String get addToDeviceControlsDescription =>
      'เข้าถึงได้เร็วในการควบคุมอุปกรณ์ของระบบ';

  @override
  String get skip => 'Skip';

  @override
  String get add => 'เพิ่ม';

  @override
  String get addedToDeviceControls => 'เพิ่มในการควบคุมอุปกรณ์แล้ว';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'ลบ \"$name\" แล้ว การกระทำนี้ยกเลิกไม่ได้';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count ปุ่ม · $layout';
  }

  @override
  String get layoutComfort => 'สบายตา';

  @override
  String get layoutCompact => 'กะทัดรัด';

  @override
  String get open => 'เปิด';

  @override
  String get useThisRemote => 'ใช้รีโมตนี้';

  @override
  String get edit => 'แก้ไข';

  @override
  String get editRemoteSubtitle => 'เปลี่ยนชื่อและแก้ไขปุ่ม';

  @override
  String get thisCannotBeUndone => 'ไม่สามารถยกเลิกได้';

  @override
  String get searchRemotes => 'ค้นหารีโมต';

  @override
  String get reorderRemotes => 'จัดลำดับรีโมต';

  @override
  String get addRemote => 'เพิ่มรีโมต';

  @override
  String get more => 'More';

  @override
  String get reorderMode => 'โหมดจัดลำดับ';

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
  String get noRemotesYet => 'ยังไม่มีรีโมต';

  @override
  String get noRemotesDescription =>
      'สร้าง a remote to start sending IR codes.';

  @override
  String get noRemotesNextStep =>
      'What ถัดไป: tap เพิ่มรีโมต, then add your ก่อน ปุ่มs.';

  @override
  String get actions => 'การทำงาน';

  @override
  String get macrosTitle => 'แมโคร';

  @override
  String get help => 'Help';

  @override
  String get createMacro => 'สร้างแมโคร';

  @override
  String get timedMacrosTitle => 'Timed แมโครs';

  @override
  String get timedMacrosSubtitle =>
      'Automate sequences of IR commands with precise timing';

  @override
  String get timedMacrosNextStep =>
      'ขั้นต่อไป แตะ สร้างแมโครแรกของคุณ เลือกรีโมต แล้วเพิ่มคำสั่งและช่วงหน่วง';

  @override
  String get macroFeatureToysTitle => 'เหมาะสำหรับของเล่นแบบโต้ตอบ';

  @override
  String get macroFeatureToysDescription =>
      'Control อุปกรณ์s like i-cybie robot dogs, i-sobot robots, and other toys that need time between commands to process actions.';

  @override
  String get macroFeatureTimingTitle => 'ควบคุมเวลาได้แม่นยำ';

  @override
  String get macroFeatureTimingDescription =>
      'เพิ่มช่วงหน่วงระหว่างคำสั่ง ตั้งแต่ 250ms ถึงค่าที่กำหนดเอง เพื่อให้อุปกรณ์มีเวลาตอบสนองก่อนการทำงานถัดไป';

  @override
  String get macroFeatureManualTitle => 'ขั้นตอนทำต่อด้วยตนเอง';

  @override
  String get macroFeatureManualDescription =>
      'หยุดการทำงานและรอการยืนยันจากคุณเมื่อความยาวแอนิเมชันไม่แน่นอนหรือเมื่อคุณต้องการดูผลลัพธ์';

  @override
  String get exampleUseCase => 'ตัวอย่างการใช้งาน';

  @override
  String get macroExampleText =>
      'i-cybie Advanced Mode:\n1. Send \"Mode\" command\n2. Wait 1000ms (toy processes)\n3. Send \"Action 1\"\n4. Wait 1000ms\n5. Send \"Action 2\"\n…and so on automatically!';

  @override
  String get createFirstMacro => 'สร้างแมโครแรกของคุณ';

  @override
  String get noRemote => 'ไม่มีรีโมต';

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
  String get aboutTimedMacros => 'เกี่ยวกับแมโครตั้งเวลา';

  @override
  String get aboutTimedMacrosDescription =>
      'แมโครตั้งเวลาช่วยให้คุณทำลำดับคำสั่ง IR อัตโนมัติด้วยการหน่วงเวลาที่แม่นยำในแต่ละขั้น';

  @override
  String get sendCommand => 'ส่งคำสั่ง';

  @override
  String get sendCommandDescription =>
      'Transmits an IR command from your remote.';

  @override
  String get delay => 'หน่วงเวลา';

  @override
  String get delayDescription => 'รอตามเวลาที่กำหนด เช่น 1000ms ก่อนขั้นถัดไป';

  @override
  String get manualContinue => 'ทำต่อด้วยตนเอง';

  @override
  String get manualContinueDescription =>
      'หยุดการทำงานไว้จนกว่าคุณจะแตะ ทำต่อ เหมาะกับแอนิเมชันที่ความยาวไม่คงที่';

  @override
  String get gotIt => 'Got it';

  @override
  String get failedToSaveMacros => 'ไม่สำเร็จในการบันทึก แมโครs.';

  @override
  String deletedMacroNamed(Object name) {
    return 'ลบ \"$name\" แล้ว';
  }

  @override
  String get undo => 'Undo';

  @override
  String get failedToRestoreMacro => 'ไม่สำเร็จในการrestore แมโคร.';

  @override
  String get deleteMacroTitle => 'ลบแมโคร';

  @override
  String get deleteMacroMessage => 'คุณยกเลิกได้จาก snackbar ถัดไป';

  @override
  String get noRemotesAvailable => 'ไม่มีรีโมต';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count ปุ่ม';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'การวางแนว: กลับด้าน แตะเพื่อกลับปกติ';

  @override
  String get remoteOrientationNormalTooltip =>
      'การวางแนว: ปกติ แตะเพื่อกลับด้าน';

  @override
  String get stopLoop => 'หยุด loop';

  @override
  String get reorderButtons => 'จัดลำดับปุ่ม';

  @override
  String get remoteReorderHint => 'โหมดจัดลำดับ: กดค้างและลากปุ่มเพื่อย้าย';

  @override
  String get manageRemote => 'จัดการรีโมต';

  @override
  String get remoteNoButtons => 'ไม่มีปุ่มในรีโมตนี้';

  @override
  String get remoteNoButtonsDescription =>
      'ใช้ แก้ไขรีโมต เพื่อเพิ่มหรือตั้งค่าปุ่ม';

  @override
  String get editRemote => 'แก้ไข remote';

  @override
  String get editRemoteActionsSubtitle => 'เปลี่ยนชื่อ จัดลำดับ และแก้ไขปุ่ม';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'อัปเดต \"$name\" แล้ว';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'เพิ่ม \"$name\" แล้ว';
  }

  @override
  String get buttonDuplicated => 'ทำซ้ำปุ่มแล้ว';

  @override
  String get loopRunningForButton => 'กำลังวนลูปสำหรับปุ่มนี้';

  @override
  String get loopTip => 'เคล็ดลับ ใช้ลูปเพื่อทำซ้ำจนกว่าคุณจะหยุด';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'คัดลอกโค้ดแล้ว';

  @override
  String get copyCode => 'คัดลอกโค้ด';

  @override
  String get startLoop => 'เริ่ม loop';

  @override
  String get editButtonSubtitle => 'แก้ไขชื่อ โค้ด โปรโตคอล และความถี่';

  @override
  String get newButton => 'New ปุ่ม';

  @override
  String get newButtonSubtitle => 'สร้างปุ่มใหม่ต่อจากปุ่มนี้';

  @override
  String get duplicate => 'ทำซ้ำ';

  @override
  String get duplicateButtonSubtitle => 'สร้างสำเนาของปุ่มนี้';

  @override
  String get removeFromDeviceControls => 'นำออกจากการควบคุมอุปกรณ์';

  @override
  String get addToDeviceControls => 'เพิ่ม to อุปกรณ์ Controls';

  @override
  String get deviceControlsButtonSubtitle =>
      'แสดงปุ่มนี้ในการควบคุมอุปกรณ์ของระบบ';

  @override
  String get removedFromDeviceControls => 'นำออกแล้ว from อุปกรณ์ Controls.';

  @override
  String get pinQuickTile => 'ปักหมุดไปยังรายการโปรดไทล์ด่วน';

  @override
  String get unpinQuickTile => 'เอาออกจากรายการโปรดไทล์ด่วน';

  @override
  String get quickTileButtonSubtitle => 'แสดงปุ่มนี้ด้านบนของตัวเลือกไทล์ด่วน';

  @override
  String get removedFromQuickTileFavorites => 'นำออกจากรายการโปรดไทล์ด่วนแล้ว';

  @override
  String get pinnedToQuickTileFavorites => 'ปักหมุดไว้ในรายการโปรดไทล์ด่วนแล้ว';

  @override
  String get duplicateAndEdit => 'ทำซ้ำและแก้ไข';

  @override
  String get duplicateAndEditSubtitle => 'สร้างสำเนาและแก้ไขทันที';

  @override
  String get done => 'Done';

  @override
  String get run => 'ทำงาน';

  @override
  String get untitledRemote => 'รีโมตไม่มีชื่อ';

  @override
  String get createRemoteTitle => 'สร้างรีโมต';

  @override
  String get editRemoteTitle => 'แก้ไข remote';

  @override
  String get removeButtonTitle => 'นำปุ่มออก';

  @override
  String get imageButtonRemovedMessage => 'ปุ่มรูปภาพนี้จะถูกลบ';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" จะถูกลบ';
  }

  @override
  String get remove => 'นำออก';

  @override
  String importedButtonCount(int count) {
    return 'นำเข้า $count ปุ่มแล้ว';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'นำเข้า $count ปุ่มจากรีโมตที่มีอยู่แล้ว';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'เปลี่ยนชื่อ สัญญาณ และการตั้งค่าขั้นสูง';

  @override
  String get createButtonCopySubtitle => 'สร้างสำเนาของปุ่มนี้';

  @override
  String get duplicateAndEditButtonSubtitle => 'สร้างสำเนาและแก้ไขทันที';

  @override
  String get undoAvailableInNextSnackbar => 'คุณยกเลิกได้จาก snackbar ถัดไป';

  @override
  String get buttonRemoved => 'ลบปุ่มแล้ว';

  @override
  String get remoteNameCannotBeEmpty => 'ชื่อรีโมตห้ามว่าง';

  @override
  String get saveRemote => 'บันทึกรีโมต';

  @override
  String get remoteName => 'รีโมต name';

  @override
  String get remoteNameHint => 'e.g., TV, Air Conditioner, LED Strip';

  @override
  String get remoteNameHelper => 'ชื่อนี้จะแสดงในรายการรีโมตของคุณ';

  @override
  String get layoutStyle => 'รูปแบบเลย์เอาต์';

  @override
  String get layoutWideDescription =>
      'กว้าง: ปุ่ม 2 คอลัมน์พร้อมรายละเอียดเพิ่ม แนะนำ';

  @override
  String get layoutCompactDescription =>
      'กะทัดรัด: กริด 4× แบบคลาสสิก ไอคอนและข้อความเท่านั้น';

  @override
  String get importFromRemotes => 'นำเข้าจากรีโมต';

  @override
  String get importFromDatabase => 'นำเข้าจากฐานข้อมูล';

  @override
  String get addButton => 'เพิ่มปุ่ม';

  @override
  String get noButtonsYet => 'ยังไม่มีปุ่ม';

  @override
  String get createRemoteEmptyStateDescription =>
      'เพิ่มปุ่มแรกของคุณ แล้วกดค้างเพื่อแก้ไขหรือลบ';

  @override
  String get createButtonTitle => 'สร้างปุ่ม';

  @override
  String get editButtonTitle => 'แก้ไข ปุ่ม';

  @override
  String failedToLoadProtocols(Object error) {
    return 'โหลดโปรโตคอลไม่สำเร็จ: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'โหลดคีย์ฐานข้อมูลไม่สำเร็จ: $error';
  }

  @override
  String get presetPower => 'Power';

  @override
  String get presetVolume => 'Volume';

  @override
  String get presetChannel => 'ช่อง';

  @override
  String get presetNavigation => 'นำทาง';

  @override
  String get all => 'All';

  @override
  String get completeRequiredFieldsToSave =>
      'กรอกข้อมูลที่จำเป็นให้ครบเพื่อบันทึก';

  @override
  String get buttonLabelStepTitle => 'ป้ายชื่อปุ่ม';

  @override
  String get buttonLabelStepSubtitle =>
      'เลือกรูปภาพ ไอคอน หรือพิมพ์ข้อความป้ายชื่อ';

  @override
  String get buttonColorStepTitle => 'สีปุ่ม';

  @override
  String get buttonColorStepSubtitle => 'เลือกสีพื้นหลังสำหรับปุ่มนี้';

  @override
  String get selectColor => 'เลือกสี:';

  @override
  String get noImageSelected => 'ยังไม่เลือกรูปภาพ';

  @override
  String get gallery => 'แกลเลอรี';

  @override
  String get builtIn => 'ในแอป';

  @override
  String get removeImage => 'ลบรูปภาพ';

  @override
  String get requiredSelectImageOrSwitch =>
      'จำเป็น: เลือกรูปภาพ เลือกไอคอน หรือสลับไปใช้ข้อความ';

  @override
  String get iconSelected => 'เลือกไอคอนแล้ว';

  @override
  String get noIconSelected => 'ยังไม่เลือกไอคอน';

  @override
  String get chooseIcon => 'เลือก Icon';

  @override
  String get removeIcon => 'ลบไอคอน';

  @override
  String get requiredSelectIconOrSwitch =>
      'จำเป็น: เลือกไอคอนหรือสลับไปใช้รูปภาพหรือข้อความ';

  @override
  String get buttonText => 'ข้อความปุ่ม';

  @override
  String get buttonTextHint => 'e.g., Power, Volume +, HDMI 1';

  @override
  String get buttonTextHelper => 'ข้อความนี้จะแสดงบนปุ่ม';

  @override
  String get requiredEnterButtonLabel => 'จำเป็น: ใส่ป้ายชื่อปุ่ม';

  @override
  String get defaultColorName => 'ค่าเริ่มต้น';

  @override
  String get newRemoteCreatedFromLastHit =>
      'สร้างรีโมตใหม่พร้อม 1 ปุ่มจากผลล่าสุดแล้ว';

  @override
  String get selectRemote => 'เลือกรีโมต';

  @override
  String remoteNumber(Object id) {
    return 'รีโมต #$id';
  }

  @override
  String get newRemoteCreated => 'สร้างรีโมตใหม่แล้ว';

  @override
  String get failedToCreateRemote => 'ไม่สำเร็จในการcreate remote.';

  @override
  String get newRemoteEllipsis => 'รีโมตใหม่…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'เพิ่มไปยัง $name แล้ว';
  }

  @override
  String get failedToAddToRemote => 'ไม่สำเร็จในการadd to remote.';

  @override
  String get newRemoteDefaultName => 'New รีโมต';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'ข้ามไปยังออฟเซ็ต $offset แล้ว หยุดชั่วคราว กด ทำต่อ เพื่อไปต่อ';
  }

  @override
  String get sent => 'Sent.';

  @override
  String failedToSend(Object error) {
    return 'ส่งไม่สำเร็จ: $error';
  }

  @override
  String get copiedProtocolCode => 'Copied (โปรโตคอล:code).';

  @override
  String get savedToResults => 'Saved to ผลลัพธ์s.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'โค้ดไม่ถูกต้องสำหรับโปรโตคอล: $error';
  }

  @override
  String get copiedCurrentCandidate => 'คัดลอกตัวเลือกปัจจุบันแล้ว';

  @override
  String get jumpToOffset => 'ข้ามไปยังออฟเซ็ต';

  @override
  String get jumpToBruteCursor => 'ข้ามไปยังเคอร์เซอร์เดาสุ่ม';

  @override
  String get jump => 'Jump';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'ข้ามไปยังเคอร์เซอร์ 0x$cursor แล้ว หยุดชั่วคราว กด ทำต่อ เพื่อไปต่อ';
  }

  @override
  String get irSignalTester => 'ตัวทดสอบสัญญาณ IR';

  @override
  String get stop => 'หยุด';

  @override
  String get selectButton => 'เลือกปุ่ม';

  @override
  String get buttonNotFoundInRemotes => 'ไม่พบปุ่มในรีโมต';

  @override
  String sentNamed(Object name) {
    return 'ส่ง \"$name\" แล้ว';
  }

  @override
  String sendFailed(Object error) {
    return 'ส่งไม่สำเร็จ: $error';
  }

  @override
  String get noFavoritesYet => 'ยังไม่มีรายการโปรด';

  @override
  String get deviceControlsEmptyHint =>
      'กดปุ่มบนรีโมตค้าง แล้วเลือก Add to Device Controls';

  @override
  String get sendTest => 'ส่งทดสอบ';

  @override
  String get testSendCompleted => 'ส่งทดสอบเสร็จแล้ว';

  @override
  String testSendFailed(Object error) {
    return 'ส่งทดสอบไม่สำเร็จ: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'นำออกแล้ว \"$name\".';
  }

  @override
  String get brand => 'ยี่ห้อ';

  @override
  String get model => 'รุ่น';

  @override
  String get selectBrand => 'เลือกยี่ห้อ';

  @override
  String get searchBrand => 'ค้นหา ยี่ห้อ…';

  @override
  String get selectModel => 'เลือกรุ่น';

  @override
  String get searchModel => 'ค้นหา รุ่น…';

  @override
  String get unnamedKey => 'คีย์ไม่มีชื่อ';

  @override
  String get unknown => 'ไม่ทราบ';

  @override
  String get emDash => '—';

  @override
  String get searchCommands => 'ค้นหาคำสั่ง';

  @override
  String get noMatchingCommands => 'ไม่พบคำสั่งที่ตรงกัน';

  @override
  String get quickTileFavoritesTitle => 'รายการโปรดไทล์ด่วน';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'เปลี่ยนการแมปสำหรับไทล์ $tileLabel';
  }

  @override
  String get pickDifferentButton => 'เลือกปุ่มอื่น';

  @override
  String get browseAllRemotesEllipsis => 'ดูรีโมตทั้งหมด…';

  @override
  String get invalidMacroFileFormat => 'Invalid แมโคร ไฟล์ format.';

  @override
  String get failedToParseMacroFile => 'ไม่สำเร็จในการparse แมโคร ไฟล์.';

  @override
  String get deviceCodeLabel => 'รหัสอุปกรณ์';

  @override
  String get commandLabel => 'คำสั่ง';

  @override
  String get editButtonCodeTitle => 'แก้ไขโค้ดของปุ่ม';

  @override
  String get thisRemoteHasNoButtons => 'รีโมตนี้ไม่มีปุ่ม';

  @override
  String get selectCommand => 'เลือกคำสั่ง';

  @override
  String get databaseModeAutofillHint =>
      'โหมดฐานข้อมูลจะกรอกขั้นตอนที่ 2 ให้อัตโนมัติ ยี่ห้อ รุ่น และโปรโตคอล หลังนำเข้าคีย์แล้ว คุณยังปรับทุกอย่างได้ในโหมด Manual';

  @override
  String get test => 'ทดสอบ';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'ปุ่มที่เลือกทั้งหมดเป็นรายการซ้ำ';

  @override
  String get noButtonsImported => 'ไม่มีปุ่มที่นำเข้า';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'นำเข้า $addedCount ปุ่ม ข้ามรายการซ้ำ $skippedCount รายการ';
  }

  @override
  String get importAllMatchingTitle => 'นำเข้าปุ่มที่ตรงกันทั้งหมด';

  @override
  String get noMatchingKeysFound => 'ไม่พบคีย์ที่ตรงกัน';

  @override
  String importAllMatchingMessage(int count) {
    return 'การดำเนินการนี้จะนำเข้าคีย์ที่ตรงกันได้สูงสุด $count รายการจากตัวเลือกฐานข้อมูลปัจจุบัน';
  }

  @override
  String get importAll => 'นำเข้าทั้งหมด';

  @override
  String get importingButtons => 'กำลังนำเข้าปุ่ม…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'ปุ่มที่ตรงกันทั้งหมดเป็นรายการซ้ำ';

  @override
  String get quickPresets => 'พรีเซ็ตด่วน';

  @override
  String get selectDeviceFirst => 'เลือกอุปกรณ์ก่อน';

  @override
  String get searchByLabelOrHex => 'ค้นหาตามชื่อหรือเลขฐานสิบหก';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'ไม่บังคับ: ปรับคีย์พรีเซ็ต $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'เลือก ยี่ห้อ, รุ่น, and โปรโตคอล ก่อน.';

  @override
  String get importFromDatabaseTitle => 'นำเข้าจากฐานข้อมูล';

  @override
  String get importFromDatabaseSubtitle =>
      'เลือกอุปกรณ์ โหลดคีย์ที่ตรงกัน แล้วนำเข้าปุ่มที่เลือก';

  @override
  String get deviceAndFilters => 'อุปกรณ์และตัวกรอง';

  @override
  String loadedCount(int count) {
    return 'โหลดแล้ว $count';
  }

  @override
  String get hideFilters => 'ซ่อนตัวกรอง';

  @override
  String get showFilters => 'แสดงตัวกรอง';

  @override
  String get noProtocolFoundForBrandModel =>
      'ไม่พบโปรโตคอลสำหรับยี่ห้อและรุ่นนี้';

  @override
  String get protocolAutoDetected => 'โปรโตคอล';

  @override
  String get protocolAutoDetectedHelper =>
      'ตรวจพบจากฐานข้อมูลอัตโนมัติ คุณเปลี่ยนได้ก่อนนำเข้า';

  @override
  String get selectBrandModelToLoadKeys =>
      'เลือก a ยี่ห้อ, รุ่น, and โปรโตคอล to load คีย์.';

  @override
  String get noKeysFound => 'ไม่พบคีย์';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'ไม่พบคีย์สำหรับ “$query”';
  }

  @override
  String get skipDuplicates => 'ข้ามรายการซ้ำ';

  @override
  String get skipDuplicatesSubtitle => 'ไม่นำเข้าปุ่มที่มีอยู่แล้วในรีโมตนี้';

  @override
  String get importSelected => 'นำเข้าที่เลือก';

  @override
  String get noMacrosToExport => 'ไม่มีแมโครให้ส่งออก';

  @override
  String get macrosExportedToDownloads => 'แมโครs exported to ดาวน์โหลด.';

  @override
  String get failedToExportMacros => 'ไม่สำเร็จในการexport แมโครs.';

  @override
  String get failedToReadFile => 'ไม่สำเร็จในการread ไฟล์.';

  @override
  String get importFromExistingRemotesTitle => 'นำเข้าจากรีโมตที่มีอยู่';

  @override
  String selectedCount(int count) {
    return 'เลือกแล้ว $count';
  }

  @override
  String get noOtherRemotesWithButtons => 'ไม่มี other รีโมต with ปุ่มs found.';

  @override
  String get sourceRemote => 'รีโมตต้นทาง';

  @override
  String get searchButtons => 'ค้นหาปุ่ม';

  @override
  String get searchButtonsHint => 'Power, Volume, Mute...';

  @override
  String get selectVisible => 'เลือกที่แสดง';

  @override
  String get clearVisible => 'ล้างที่มองเห็น';

  @override
  String protocolNamed(Object name) {
    return 'โปรโตคอล: $name';
  }

  @override
  String get rawSignal => 'Raw';

  @override
  String get legacyCode => 'โค้ดแบบเก่า';

  @override
  String importCount(int count) {
    return 'นำเข้า $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'สิทธิ์พื้นที่เก็บข้อมูลถูกปฏิเสธ จำเป็นในอุปกรณ์ Android รุ่นเก่าบางรุ่น';

  @override
  String get backupExportedToDownloads =>
      'ส่งออกข้อมูลสำรองไปยัง Downloads แล้ว';

  @override
  String failedToExport(Object error) {
    return 'ส่งออกไม่สำเร็จ: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'นำเข้ารีโมต $count รายการจากข้อมูลสำรอง JSON แบบเก่า แมโครไม่เปลี่ยน';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'นำเข้าไม่สำเร็จ ค่า backup \"remotes\" ต้องเป็นรายการ JSON เมื่อมีอยู่';

  @override
  String get importFailedMacrosMustBeList =>
      'นำเข้าไม่สำเร็จ ค่า backup \"macros\" ต้องเป็นรายการ JSON เมื่อมีอยู่';

  @override
  String get importFailedInvalidBackupFormat =>
      'นำเข้าไม่สำเร็จ รูปแบบข้อมูลสำรองไม่ถูกต้อง คาดว่าเป็น List แบบเก่าหรือ Map ที่มี remotes และ macros';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'นำเข้ารีโมต $remoteCount รายการจากข้อมูลสำรอง แมโครไม่เปลี่ยน';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'นำเข้ารีโมต $remoteCount รายการ และแมโคร $macroCount รายการจากข้อมูลสำรอง';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'นำเข้าไม่สำเร็จ: no valid ปุ่มs found in.ir ไฟล์.';

  @override
  String get importedOneRemoteFromFlipper =>
      'นำเข้ารีโมต 1 รายการจาก Flipper .ir แมโครไม่เปลี่ยน';

  @override
  String get importFailedInvalidIrplus =>
      'นำเข้าไม่สำเร็จ: invalid irplus ไฟล์ (no valid ปุ่มs found).';

  @override
  String get importedOneRemoteFromIrplus =>
      'นำเข้ารีโมต 1 รายการจาก irplus แมโครไม่เปลี่ยน';

  @override
  String get importFailedInvalidLirc =>
      'นำเข้าไม่สำเร็จ: invalid LIRC ไฟล์ (no valid codes/raw codes found).';

  @override
  String get importedOneRemoteFromLirc =>
      'นำเข้ารีโมต 1 รายการจากไฟล์ LIRC แมโครไม่เปลี่ยน';

  @override
  String get unsupportedFileTypeSelected => 'Unที่รองรับ ไฟล์ type selected.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'นำเข้าไม่สำเร็จ: invalid or unreadable ไฟล์.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Bulk import complete: no ที่รองรับ ไฟล์s found in โฟลเดอร์.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'นำเข้าจำนวนมากเสร็จแล้ว แต่ไม่มีรีโมตถูกนำเข้า ข้ามไฟล์ $skippedCount ไฟล์';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'นำเข้าจำนวนมากเสร็จแล้ว นำเข้ารีโมต $importedCount รายการจากไฟล์ที่รองรับ $supportedCount ไฟล์ ข้าม $skippedCount ไฟล์';
  }

  @override
  String get storagePermissionDenied => 'สิทธิ์พื้นที่เก็บข้อมูลถูกปฏิเสธ';

  @override
  String get bulkImportFailedReadFolder =>
      'นำเข้าจำนวนมากไม่สำเร็จ ไม่สามารถอ่านเนื้อหาโฟลเดอร์ได้';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'นำเข้าจำนวนมากเสร็จแล้ว ไม่พบไฟล์ที่รองรับ $sourceLabel';
  }

  @override
  String get clearAction => 'Clear';

  @override
  String get saveAction => 'Save';

  @override
  String buttonsTitleCount(int count) {
    return 'ปุ่ม $count';
  }

  @override
  String get invalidStepEncountered => 'พบขั้นตอนที่ไม่ถูกต้อง';

  @override
  String failedToSendNamed(Object name) {
    return 'ส่งไม่สำเร็จ: $name';
  }

  @override
  String get buttonNotFound => 'ไม่พบปุ่ม';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'ไม่พบปุ่ม: $name';
  }

  @override
  String get unknownButton => 'ปุ่มที่ไม่ทราบ';

  @override
  String durationSecondsShort(int seconds) {
    return '$secondsว';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '$minutesน $secondsว';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '$hoursชม $minutesน';
  }

  @override
  String get orientationFlippedTooltip =>
      'การวางแนว: กลับด้าน แตะเพื่อกลับปกติ';

  @override
  String get orientationNormalTooltip => 'การวางแนว: ปกติ แตะเพื่อกลับด้าน';

  @override
  String get noSteps => 'ไม่มีขั้นตอน';

  @override
  String stepProgress(int current, int total) {
    return 'Step $current / $total';
  }

  @override
  String get completed => 'เสร็จสิ้น';

  @override
  String get paused => 'หยุดชั่วคราวd';

  @override
  String get running => 'ทำงานning';

  @override
  String get ready => 'พร้อม';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total ขั้นตอน';
  }

  @override
  String get waiting => 'กำลังรอ';

  @override
  String secondsRemaining(Object seconds) {
    return 'เหลืออีก $secondsว';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady => 'แตะ ทำต่อ เมื่อพร้อมสำหรับขั้นตอนถัดไป';

  @override
  String get error => 'Error';

  @override
  String get macroCompleted => 'แมโครเสร็จสิ้น';

  @override
  String finishedIn(Object duration) {
    return 'เสร็จใน $duration';
  }

  @override
  String get sequence => 'ลำดับ';

  @override
  String waitMilliseconds(int ms) {
    return 'รอ ${ms}ms';
  }

  @override
  String get runAgain => 'ทำงาน Again';

  @override
  String get startMacro => 'เริ่ม แมโคร';

  @override
  String get continueAction => 'ทำต่อ';

  @override
  String get unnamedRemote => 'รีโมตไม่มีชื่อ';

  @override
  String get enterMacroName => 'ใส่ชื่อแมโคร';

  @override
  String get addAtLeastOneStep => 'เพิ่มอย่างน้อยหนึ่งขั้นตอน';

  @override
  String get fixInvalidSteps => 'แก้ไขขั้นตอนที่ไม่ถูกต้อง';

  @override
  String get unknownCommand => 'คำสั่งที่ไม่ทราบ';

  @override
  String get unnamedCommand => 'คำสั่งไม่มีชื่อ';

  @override
  String get iconCommand => 'คำสั่งไอคอน';

  @override
  String get selectDelay => 'เลือกระยะหน่วง';

  @override
  String keepMilliseconds(int ms) {
    return 'คงไว้ ${ms}ms';
  }

  @override
  String get custom => 'Custom';

  @override
  String get enterCustomDelayDuration => 'ใส่ระยะเวลาหน่วงแบบกำหนดเอง';

  @override
  String millisecondsLong(int ms) {
    return '$ms มิลลิวินาที';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds วินาที$plural';
  }

  @override
  String get customDelay => 'หน่วงเวลาแบบกำหนดเอง';

  @override
  String get delayMillisecondsLabel => 'หน่วงเวลา มิลลิวินาที';

  @override
  String get delayMillisecondsHint => 'เช่น 3000';

  @override
  String get recommendedDelayRange =>
      'Recommended: 250-5000ms for most อุปกรณ์s';

  @override
  String get enterValidPositiveNumber => 'โปรดใส่ตัวเลขบวกที่ถูกต้อง';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'รีโมต';

  @override
  String get macroName => 'ชื่อแมโคร';

  @override
  String get macroNameHint => 'เช่น i-cybie Advanced Mode';

  @override
  String stepsTitleCount(int count) {
    return 'ขั้นตอน $count';
  }

  @override
  String get noStepsYet => 'ยังไม่มีขั้นตอน';

  @override
  String get addCommandsAndDelaysHint =>
      'เพิ่มคำสั่งและช่วงหน่วงด้านล่างเพื่อสร้างลำดับของคุณ';

  @override
  String get addStep => 'เพิ่มขั้นตอน';

  @override
  String get reorderStepsHint =>
      'เคล็ดลับ: ลากที่จับเพื่อจัดลำดับขั้นตอน แตะขั้นตอนเพื่อแก้ไข';

  @override
  String reorderStep(int index) {
    return 'จัดลำดับขั้นตอน $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'กดและลากเพื่อเปลี่ยนลำดับขั้นตอน';

  @override
  String deleteStep(int index) {
    return 'ลบขั้นตอน $index';
  }

  @override
  String get invalidStepTapToFix => 'ขั้นตอนไม่ถูกต้อง แตะเพื่อแก้ไข';

  @override
  String get sendIrCommand => 'ส่งคำสั่ง IR';

  @override
  String get waitForUserConfirmation => 'รอการยืนยันจากผู้ใช้';

  @override
  String get notImplemented => 'ยังไม่รองรับ';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'กว้าง';

  @override
  String get iconButton => 'ปุ่มไอคอน';

  @override
  String get imageButton => 'ปุ่มรูปภาพ';

  @override
  String get noSignalInfo => 'ไม่มีข้อมูลสัญญาณ';

  @override
  String get proceed => 'ดำเนินการต่อ';

  @override
  String get discard => 'ละทิ้ง';

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
  String get start => 'เริ่ม';

  @override
  String get resume => 'Resume';

  @override
  String get pause => 'หยุดชั่วคราว';

  @override
  String get stopped => 'หยุดped';

  @override
  String get copy => 'Copy';

  @override
  String get send => 'ส่ง';

  @override
  String get step => 'Step';

  @override
  String get addToRemote => 'เพิ่มไปยังรีโมต';

  @override
  String get noDescriptionAvailable => 'ไม่มี description พร้อมใช้.';

  @override
  String get notAvailableSymbol => '—';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'ผู้ขาย Kaseikyo ต้องมีเลขฐานสิบหก 4 หลักพอดี';

  @override
  String get irFinderDatabaseNotReady => 'ฐานข้อมูลยังไม่พร้อม';

  @override
  String get irFinderSelectBrandFirst => 'เลือกยี่ห้อก่อนในหน้าตั้งค่า';

  @override
  String get irFinderBruteforceUnavailable =>
      'ยังไม่รองรับการเดาสุ่มทั้งหมดสำหรับโปรโตคอลนี้';

  @override
  String get irFinderInvalidPrefix => 'พรีฟิกซ์ไม่ถูกต้อง';

  @override
  String irFinderBrandValue(Object value) {
    return 'ยี่ห้อ: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'รุ่น: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'คีย์: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'รีโมต # $value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'ใส่อินเด็กซ์เริ่มที่ 0 ภายในผลฐานข้อมูลที่กรองและจัดลำดับแล้ว';

  @override
  String get irFinderJumpCursorHelper =>
      'ใส่เคอร์เซอร์เลขฐานสิบหกเริ่มที่ 0 ภายในพื้นที่เดาสุ่มทั้งหมด';

  @override
  String get irFinderSetupTab => 'ตั้งค่า';

  @override
  String get irFinderTestTab => 'ทดสอบ';

  @override
  String get irFinderResultsTab => 'ผลลัพธ์';

  @override
  String get irFinderContinueToTest => 'ไปที่ทดสอบ';

  @override
  String get irFinderKaseikyoVendorTitle => 'Kaseikyo Vendor';

  @override
  String get irFinderCustomVendorLabel => 'ผู้ขายกำหนดเอง 4 hex';

  @override
  String get irFinderBrowseDbCandidates => 'ดูรายการผู้สมัครจากฐานข้อมูล…';

  @override
  String get irFinderEditSetup => 'แก้ไข Setup';

  @override
  String get irFinderNoSavedHits =>
      'ยังไม่มีผลที่บันทึกไว้ ในหน้าทดสอบ ให้กด \"บันทึกที่ตรง\" เมื่ออุปกรณ์ตอบสนอง';

  @override
  String get irFinderBackToTest => 'กลับไปทดสอบ';

  @override
  String get irFinderLargeSearchSpaceTitle => 'พื้นที่ค้นหาขนาดใหญ่';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'This brute-force space is very large ($human possibilities). IR Finder will still respect your max จำนวนครั้ง and ช่วงพัก, but be mindful of spamming IR อุปกรณ์s.\n\nRecommendation: use ฐานข้อมูล mode ก่อน, and/or enter known prefix bytes to reduce the space.';
  }

  @override
  String get irFinderDatabaseSession => 'เซสชันฐานข้อมูล';

  @override
  String get irFinderBruteforceSession => 'เซสชันเดาสุ่มทั้งหมด';

  @override
  String get irFinderResumeLastSession => 'ทำต่อจากเซสชันล่าสุด';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'ยี่ห้อ: $brand · รุ่น: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'พรีฟิกซ์: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'ความคืบหน้า: $progress · เริ่มเมื่อ: $when';
  }

  @override
  String get irFinderApplyResume => 'ใช้และทำต่อ';

  @override
  String get irFinderBruteforceMode => 'เดาสุ่มทั้งหมด';

  @override
  String get irFinderDatabaseAssistedMode => 'ช่วยด้วยฐานข้อมูล';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'โปรโตคอล: $name';
  }

  @override
  String get irFinderProtocolLabel => 'โปรโตคอล IR';

  @override
  String get irFinderProtocolHelper =>
      'ควบคุมการเข้ารหัสและส่งผลต่อพื้นที่ค้นหา';

  @override
  String get irFinderKnownPrefixLabel =>
      'พรีฟิกซ์ที่ทราบ ไบต์ฐานสิบหก ไม่บังคับ';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'เพย์โหลด: $digits หลักฐานสิบหก';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'เพย์โหลด: $digits หลักฐานสิบหก · ตัวอย่าง: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'เพย์โหลด: $digits หลักฐานสิบหก · พรีฟิกซ์สูงสุด: $bytes ไบต์';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'เพย์โหลด: $digits หลักฐานสิบหก · ตัวอย่าง: $example · พรีฟิกซ์สูงสุด: $bytes ไบต์';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'ตัวอย่าง: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'ใส่ไบต์แรกที่ทราบเพื่อจำกัดพื้นที่ค้นหา';

  @override
  String get irFinderDatabaseMode => 'ฐานข้อมูล';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'พรีฟิกซ์ที่ทำให้เป็นมาตรฐาน: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'พรีฟิกซ์ที่ทำให้เป็นมาตรฐาน';

  @override
  String get irFinderBruteforceNotConfigured =>
      'ยังไม่ได้ตั้งค่าการเดาสุ่มทั้งหมดสำหรับโปรโตคอลนี้';

  @override
  String irFinderAllLimit(Object value) {
    return 'ทั้งหมด ($value)';
  }

  @override
  String get irFinderTestControls => 'การควบคุมการทดสอบ';

  @override
  String irFinderPayloadLength(int digits) {
    return 'ความยาวเพย์โหลด: $digits หลักฐานสิบหก';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'พื้นที่ค้นหา: $value ความเป็นไปได้ หลังใช้เงื่อนไขพรีฟิกซ์';
  }

  @override
  String get irFinderCooldownMs => 'ช่วงพัก มิลลิวินาที';

  @override
  String get irFinderMaxAttemptsPerRun => 'จำนวนครั้งสูงสุด ต่อรอบ';

  @override
  String get irFinderTestAllCombinations => 'ทดสอบทุกชุดผสม';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'ทำงานต่อจนกว่าพื้นที่ค้นหาจะหมด ขีดจำกัดที่ใช้จริง: $value';
  }

  @override
  String get irFinderAttempts => 'จำนวนครั้ง';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'ช่วงสไลด์: 1–$max พิมพ์ตัวเลขใดก็ได้สำหรับค่าที่มากกว่า';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'สูงสุด\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'ขีดจำกัดที่ใช้จริงรอบนี้: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'เคล็ดลับ: ใช้โหมดฐานข้อมูลก่อน การเดาสุ่มทั้งหมดเหมาะที่สุดเมื่อรู้พรีฟิกซ์ เช่น 1–4 ไบต์แรก';

  @override
  String get irFinderDatabaseInitFailed => 'ฐานข้อมูล เริ่มต้นไม่สำเร็จ.';

  @override
  String get irFinderPreparingDatabase =>
      'กำลังเตรียมฐานข้อมูลโค้ด IR ในเครื่อง…';

  @override
  String get irFinderDatabaseAssistedSearch => 'ช่วยด้วยฐานข้อมูล search';

  @override
  String get irFinderBrand => 'ยี่ห้อ';

  @override
  String get irFinderSelectBrand => 'เลือกยี่ห้อ';

  @override
  String get irFinderModelOptional => 'รุ่น ไม่บังคับ';

  @override
  String get irFinderSelectBrandFirstShort => 'เลือก a ยี่ห้อ ก่อน';

  @override
  String get irFinderSelectModelRecommended => 'เลือกรุ่น แนะนำ';

  @override
  String get irFinderOnlySelectedProtocol => 'เฉพาะโปรโตคอลที่เลือก';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'กรองคีย์ให้เหลือเฉพาะโปรโตคอลที่เลือก ปิดตัวเลือกนี้เพื่อดูทุกโปรโตคอล';

  @override
  String get irFinderQuickWinsFirst => 'เริ่มจากตัวที่มีโอกาสสำเร็จก่อน';

  @override
  String get irFinderQuickWinsFirstHint =>
      'ให้ความสำคัญกับคีย์แบบ POWER MUTE VOL และ CH ก่อนคีย์เชิงลึก';

  @override
  String get irFinderMaxKeysPerRun => 'จำนวนคีย์สูงสุดที่จะทดสอบ ต่อรอบ';

  @override
  String get irFinderTesting => 'กำลังทดสอบ…';

  @override
  String get irFinderCooldown => 'ช่วงพัก';

  @override
  String get irFinderEta => 'เวลาโดยประมาณ';

  @override
  String get irFinderMode => 'โหมด';

  @override
  String get irFinderRetryLast => 'ลองล่าสุดอีกครั้ง';

  @override
  String get irFinderTrigger => 'ทริกเกอร์';

  @override
  String get irFinderJump => 'ข้ามไป…';

  @override
  String get irFinderSaveHit => 'บันทึกที่ตรง';

  @override
  String irFinderEtaSeconds(int seconds) {
    return '$secondsว';
  }

  @override
  String irFinderEtaMinutesSeconds(int minutes, int seconds) {
    return '$minutesน $secondsว';
  }

  @override
  String irFinderEtaHoursMinutes(int hours, int minutes) {
    return '$hoursชม $minutesน';
  }

  @override
  String irFinderLastAttemptedCode(Object value) {
    return 'โค้ดล่าสุดที่ลอง: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'เริ่มทดสอบเพื่อดูโค้ดล่าสุดที่ลอง';

  @override
  String irFinderFromDb(Object value) {
    return 'จากฐานข้อมูล: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'จากการเดาสุ่มทั้งหมด สร้างโดยตัวเข้ารหัสโปรโตคอล';

  @override
  String irFinderSendError(Object error) {
    return 'ส่งผิดพลาด: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'แหล่งที่มา: $value';
  }

  @override
  String get irFinderResultsNote =>
      'ผลลัพธ์รองรับการทดสอบและคัดลอกได้ทันที การเพิ่มลงรีโมตโดยตรงยังขยายต่อได้ในขั้นตอนแก้ไข';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'ดูรายการผู้สมัครจากฐานข้อมูล';

  @override
  String get irFinderFilterByLabelOrHex => 'กรองตามชื่อหรือเลขฐานสิบหก…';

  @override
  String get irFinderJumpHere => 'ข้ามมาที่นี่';

  @override
  String get irFinderSelectModel => 'เลือกรุ่น';

  @override
  String get irFinderSearchBrands => 'ค้นหายี่ห้อ…';

  @override
  String get irFinderSearchModels => 'ค้นหารุ่น…';

  @override
  String get iconPickerTitle => 'เลือก Icon';

  @override
  String get iconPickerSearchHint => 'ค้นหา icons...';

  @override
  String get iconPickerNoIconsFound => 'ไม่พบไอคอน';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count icons พร้อมใช้';
  }

  @override
  String get iconPickerCategoryAll => 'All';

  @override
  String get iconPickerCategoryMedia => 'Media';

  @override
  String get iconPickerCategoryVolume => 'Volume';

  @override
  String get iconPickerCategoryNavigation => 'การนำทาง';

  @override
  String get iconPickerCategoryPower => 'Power';

  @override
  String get iconPickerCategoryNumbers => 'ตัวเลข';

  @override
  String get iconPickerCategorySettings => 'การตั้งค่า';

  @override
  String get iconPickerCategoryDisplay => 'จอภาพ';

  @override
  String get iconPickerCategoryInput => 'Input';

  @override
  String get iconPickerCategoryFavorite => 'รายการโปรด';

  @override
  String get universalPowerTitle => 'Universal Power';

  @override
  String get universalPowerRunTab => 'เริ่ม';

  @override
  String get universalPowerUseResponsibly => 'ใช้อย่างรับผิดชอบ';

  @override
  String get universalPowerConsentBody =>
      'Universal Power cycles IR power codes. Use it เท่านั้น on อุปกรณ์s you own or control. หยุด as soon as the อุปกรณ์ responds.';

  @override
  String get universalPowerConsentCheckbox =>
      'ฉันเป็นเจ้าของหรือควบคุมอุปกรณ์นี้';

  @override
  String get universalPowerSetupBody =>
      'วนโค้ดพลังงานสำหรับยี่ห้อที่เลือก หยุดทันทีเมื่ออุปกรณ์ตอบสนอง';

  @override
  String universalPowerLastSent(Object value) {
    return 'ส่งล่าสุด: $value';
  }

  @override
  String get universalPowerNoCodesFound => 'ไม่พบโค้ดพลังงาน ลองขยายการค้นหา';

  @override
  String get universalPowerUnableToStart => 'เริ่มไม่ได้';

  @override
  String get universalPowerAllBrands => 'ทุกยี่ห้อ ไม่มีตัวกรอง';

  @override
  String get universalPowerClearBrandFilter => 'ล้างตัวกรองยี่ห้อ';

  @override
  String get universalPowerBroadenSearch => 'ขยายการค้นหาเมื่อจำเป็น';

  @override
  String get universalPowerBroadenSearchHint =>
      'หากไม่พบป้ายกำกับพลังงาน ให้รวมคีย์อื่นด้วย';

  @override
  String get universalPowerAdditionalPatternsDepth => 'ระดับรูปแบบเพิ่มเติม';

  @override
  String get universalPowerDepth1 => 'เฉพาะลำดับความสำคัญ POWER/OFF';

  @override
  String get universalPowerDepth2 => 'รวมชื่อแทนของ POWER';

  @override
  String get universalPowerDepth3 => 'รวมป้ายชื่อพลังงานรอง';

  @override
  String get universalPowerDepth4 => 'รวมทุกป้ายชื่อ ลำดับต่ำสุด';

  @override
  String get universalPowerLoopUntilStopped => 'วนจนกว่าจะหยุด';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'จะวนคิวต่อไปจนกว่าคุณจะหยุด';

  @override
  String get universalPowerDelayBetweenCodes => 'หน่วงเวลาระหว่างโค้ด';

  @override
  String get universalPowerStart => 'เริ่ม Universal Power';

  @override
  String get universalPowerRunStatus => 'สถานะการทำงาน';

  @override
  String universalPowerProgress(Object value) {
    return 'ความคืบหน้า: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'หยุดชั่วคราวเพราะแอปอยู่เบื้องหลัง';

  @override
  String get universalPowerSendOneCode => 'ส่งหนึ่งโค้ด';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'หยุดทันทีเมื่ออุปกรณ์ตอบสนอง';

  @override
  String get iconNamePlay => 'เล่น';

  @override
  String get iconNamePause => 'หยุดชั่วคราว';

  @override
  String get iconNameStop => 'หยุด';

  @override
  String get iconNameFastForward => 'กรอไปข้างหน้า';

  @override
  String get iconNameRewind => 'กรอกลับ';

  @override
  String get iconNameSkipNext => 'ข้ามถัดไป';

  @override
  String get iconNameSkipPrevious => 'ข้ามก่อนหน้า';

  @override
  String get iconNameReplay => 'เล่นซ้ำ';

  @override
  String get iconNameForward10S => 'ไปข้างหน้า 10s';

  @override
  String get iconNameForward30S => 'ไปข้างหน้า 30s';

  @override
  String get iconNameReplay10S => 'เล่นซ้ำ 10s';

  @override
  String get iconNameReplay30S => 'เล่นซ้ำ 30s';

  @override
  String get iconNameRecord => 'บันทึก';

  @override
  String get iconNameRecordAlt => 'บันทึก Alt';

  @override
  String get iconNameEject => 'Eject';

  @override
  String get iconNameShuffle => 'สุ่ม';

  @override
  String get iconNameRepeat => 'ซ้ำ';

  @override
  String get iconNameRepeatOne => 'ซ้ำ หนึ่ง';

  @override
  String get iconNameVolumeUp => 'เพิ่มเสียง';

  @override
  String get iconNameVolumeDown => 'ลดเสียง';

  @override
  String get iconNameVolumeOff => 'ปิดเสียงออก';

  @override
  String get iconNameMute => 'Mute';

  @override
  String get iconNameSpeaker => 'ลำโพง';

  @override
  String get iconNameSurroundSound => 'เสียงรอบทิศ';

  @override
  String get iconNameEqualizer => 'อีควอไลเซอร์';

  @override
  String get iconNameAudio => 'เสียง';

  @override
  String get iconNameMicrophone => 'ไมค์';

  @override
  String get iconNameMicOff => 'ไมค์ ปิด';

  @override
  String get iconNameUp => 'ขึ้น';

  @override
  String get iconNameDown => 'ลง';

  @override
  String get iconNameLeft => 'ซ้าย';

  @override
  String get iconNameRight => 'ขวา';

  @override
  String get iconNameArrowUp => 'ลูกศรขึ้น';

  @override
  String get iconNameArrowDown => 'ลูกศรลง';

  @override
  String get iconNameArrowLeft => 'ลูกศรซ้าย';

  @override
  String get iconNameArrowRight => 'ลูกศรขวา';

  @override
  String get iconNameNavigation => 'นำทาง';

  @override
  String get iconNameChevronLeft => 'เชฟรอนซ้าย';

  @override
  String get iconNameChevronRight => 'เชฟรอนขวา';

  @override
  String get iconNameExpandLess => 'ย่อน้อยลง';

  @override
  String get iconNameExpandMore => 'ขยายเพิ่ม';

  @override
  String get iconNameCollapse => 'ย่อ';

  @override
  String get iconNameExpand => 'ขยาย';

  @override
  String get iconNameCircleUp => 'วงกลมขึ้น';

  @override
  String get iconNameCircleDown => 'วงกลมลง';

  @override
  String get iconNameCircleLeft => 'วงกลมซ้าย';

  @override
  String get iconNameCircleRight => 'วงกลมขวา';

  @override
  String get iconNameOkSelect => 'ตกลง/เลือก';

  @override
  String get iconNameConfirm => 'ยืนยัน';

  @override
  String get iconNameCancel => 'ยกเลิก';

  @override
  String get iconNameClose => 'ปิด';

  @override
  String get iconNameHome => 'หน้าแรก';

  @override
  String get iconNameReturn => 'ย้อนกลับ';

  @override
  String get iconNameExit => 'ออก';

  @override
  String get iconNameUndo => 'เลิกทำ';

  @override
  String get iconNameRedo => 'ทำซ้ำ';

  @override
  String get iconNamePower => 'Power';

  @override
  String get iconNamePowerAlt => 'Power Alt';

  @override
  String get iconNamePowerOff => 'ปิดเครื่อง';

  @override
  String get iconNameOn => 'เปิด';

  @override
  String get iconNameOff => 'ปิด';

  @override
  String get iconNameToggleOn => 'สลับเปิด';

  @override
  String get iconNameToggleOff => 'สลับปิด';

  @override
  String get iconNameRestart => 'เริ่มใหม่';

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
  String get iconNameOne => 'หนึ่ง';

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
  String get iconNamePlus => 'บวก';

  @override
  String get iconNameMinus => 'ลบ';

  @override
  String get iconNameAddCircle => 'เพิ่มวงกลม';

  @override
  String get iconNameRemoveCircle => 'ลบวงกลม';

  @override
  String get iconNameSettings => 'ตั้งค่า';

  @override
  String get iconNameMenu => 'เมนู';

  @override
  String get iconNameMoreVertical => 'เพิ่มเติม แนวตั้ง';

  @override
  String get iconNameMoreHorizontal => 'เพิ่มเติม แนวนอน';

  @override
  String get iconNameTune => 'ปรับจูน';

  @override
  String get iconNameRemoteSettings => 'ตั้งค่ารีโมต';

  @override
  String get iconNameInfo => 'ข้อมูล';

  @override
  String get iconNameInfoOutline => 'ข้อมูลเส้นขอบ';

  @override
  String get iconNameHelp => 'ช่วยเหลือ';

  @override
  String get iconNameHelpOutline => 'ช่วยเหลือเส้นขอบ';

  @override
  String get iconNameList => 'รายการ';

  @override
  String get iconNameViewList => 'มุมมองรายการ';

  @override
  String get iconNameViewGrid => 'มุมมองตาราง';

  @override
  String get iconNameApps => 'แอป';

  @override
  String get iconNameWidgets => 'วิดเจ็ต';

  @override
  String get iconNameTv => 'TV';

  @override
  String get iconNameMonitor => 'จอภาพ';

  @override
  String get iconNameDesktop => 'เดสก์ท็อป';

  @override
  String get iconNameBrightnessHigh => 'ความสว่างสูง';

  @override
  String get iconNameBrightnessMedium => 'ความสว่างกลาง';

  @override
  String get iconNameBrightnessLow => 'ความสว่างต่ำ';

  @override
  String get iconNameAutoBrightness => 'ความสว่างอัตโนมัติ';

  @override
  String get iconNameLightMode => 'โหมดสว่าง';

  @override
  String get iconNameDarkMode => 'โหมดมืด';

  @override
  String get iconNameContrast => 'คอนทราสต์';

  @override
  String get iconNameHdrOn => 'HDR เปิด';

  @override
  String get iconNameHdrOff => 'HDR ปิด';

  @override
  String get iconNameAspectRatio => 'อัตราส่วนภาพ';

  @override
  String get iconNameCrop => 'Crop';

  @override
  String get iconNameZoomIn => 'ซูมเข้า';

  @override
  String get iconNameZoomOut => 'ซูมออก';

  @override
  String get iconNameFullscreen => 'เต็มจอ';

  @override
  String get iconNameExitFullscreen => 'ออกเต็มจอ';

  @override
  String get iconNameFitScreen => 'พอดีหน้าจอ';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'ครอปอิสระ';

  @override
  String get iconNameInput => 'อินพุต';

  @override
  String get iconNameCable => 'สายเคเบิล';

  @override
  String get iconNameCast => 'แคสต์';

  @override
  String get iconNameCastConnected => 'แคสต์เชื่อมต่อ';

  @override
  String get iconNameScreenShare => 'แชร์หน้าจอ';

  @override
  String get iconNameBluetooth => 'Bluetooth';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => 'เราเตอร์';

  @override
  String get iconNameMemory => 'หน่วยความจำ';

  @override
  String get iconNameGameConsole => 'เครื่องเกม';

  @override
  String get iconNameGaming => 'เกม';

  @override
  String get iconNameMedia => 'สื่อ';

  @override
  String get iconNameMusicQueue => 'คิวเพลง';

  @override
  String get iconNameVideoLibrary => 'คลังวิดีโอ';

  @override
  String get iconNamePhotoLibrary => 'คลังรูปภาพ';

  @override
  String get iconNameComponent => 'คอมโพเนนต์';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => 'คอมโพสิต';

  @override
  String get iconNameAntenna => 'เสาอากาศ';

  @override
  String get iconNameFavorite => 'รายการโปรด';

  @override
  String get iconNameFavoriteOutline => 'รายการโปรดเส้นขอบ';

  @override
  String get iconNameStar => 'ดาว';

  @override
  String get iconNameStarOutline => 'ดาวเส้นขอบ';

  @override
  String get iconNameBookmark => 'ที่คั่นหน้า';

  @override
  String get iconNameBookmarkOutline => 'ที่คั่นหน้าเส้นขอบ';

  @override
  String get iconNameFlag => 'ธง';

  @override
  String get iconNameCheck => 'เช็ก';

  @override
  String get iconNameDone => 'เสร็จ';

  @override
  String get iconNameDoneAll => 'เสร็จทั้งหมด';

  @override
  String get iconNameSchedule => 'กำหนดเวลา';

  @override
  String get iconNameTimer => 'ตัวตั้งเวลา';

  @override
  String get iconNameTime => 'เวลา';

  @override
  String get iconNameAlarm => 'ปลุก';

  @override
  String get iconNameNotifications => 'การแจ้งเตือน';

  @override
  String get iconNameLock => 'ล็อก';

  @override
  String get iconNameUnlock => 'ปลดล็อก';

  @override
  String get iconNameLight => 'แสง';

  @override
  String get iconNameLightOutline => 'แสง เส้นขอบ';

  @override
  String get iconNameWarmLight => 'แสงอุ่น';

  @override
  String get iconNameSunny => 'แดด';

  @override
  String get iconNameCloudy => 'เมฆ';

  @override
  String get iconNameNight => 'กลางคืน';

  @override
  String get iconNameFlare => 'แฟลร์';

  @override
  String get iconNameGradient => 'ไล่สี';

  @override
  String get iconNameInvertColors => 'สลับสี';

  @override
  String get iconNamePalette => 'พาเลต';

  @override
  String get iconNameColor => 'สี';

  @override
  String get iconNameTonality => 'โทนสี';

  @override
  String get iconNameSearch => 'ค้นหา';

  @override
  String get iconNameRefresh => 'รีเฟรช';

  @override
  String get iconNameSync => 'ซิงก์';

  @override
  String get iconNameUpdate => 'อัปเดต';

  @override
  String get iconNameDownload => 'ดาวน์โหลด';

  @override
  String get iconNameUpload => 'อัปโหลด';

  @override
  String get iconNameCloud => 'คลาวด์';

  @override
  String get iconNameFolder => 'โฟลเดอร์';

  @override
  String get iconNameDelete => 'ลบ';

  @override
  String get iconNameEdit => 'แก้ไข';

  @override
  String get iconNameSave => 'บันทึก';

  @override
  String get iconNameShare => 'แชร์';

  @override
  String get iconNamePrint => 'พิมพ์';

  @override
  String get iconNameLanguage => 'ภาษา';

  @override
  String get iconNameTranslate => 'แปล';

  @override
  String get iconNameMicNone => 'ไมค์ None';

  @override
  String get iconNameSubtitles => 'คำบรรยาย';

  @override
  String get iconNameClosedCaption => 'คำบรรยายปิด';

  @override
  String get iconNameMusic => 'เพลง';

  @override
  String get iconNameMovie => 'ภาพยนตร์';

  @override
  String get iconNameTheater => 'โรงภาพยนตร์';

  @override
  String get iconNameLiveTv => 'สด TV';

  @override
  String get iconNameRadio => 'วิทยุ';

  @override
  String get iconNameCamera => 'กล้อง';

  @override
  String get iconNameVideoCamera => 'กล้องวิดีโอ';

  @override
  String get iconNamePhotoCamera => 'กล้องถ่ายภาพ';

  @override
  String get iconNameSlowMotion => 'สโลว์โมชั่น';

  @override
  String get iconNameSpeed => 'ความเร็ว';

  @override
  String get iconNameVideoSettings => 'ตั้งค่าวิดีโอ';

  @override
  String get iconNameAudioTrack => 'แทร็กเสียง';

  @override
  String get iconNameGraphicEq => 'กราฟิก EQ';

  @override
  String get iconNameMusicVideo => 'มิวสิกวิดีโอ';

  @override
  String get iconNamePlaylist => 'เพลย์ลิสต์';

  @override
  String get iconNameQueue => 'คิว';

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
  String get iconNameHashFa => 'แฮช # FA';

  @override
  String get iconNamePercentFa => 'เปอร์เซ็นต์ % FA';

  @override
  String get iconNameDivideFa => 'หาร ÷ FA';

  @override
  String get iconNameMultiplyFa => 'คูณ × FA';

  @override
  String get iconNameEqualsFa => 'เท่ากับ = FA';

  @override
  String get iconNameNotEqualFa => 'ไม่ เท่ากัน ≠ FA';

  @override
  String get iconNameGreaterThanFa => 'มากกว่า กว่า > FA';

  @override
  String get iconNameLessThanFa => 'น้อยกว่า กว่า < FA';

  @override
  String get iconNameAsteriskFa => 'ดอกจัน * FA';

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
  String get iconNamePlayFa => 'เล่น FA';

  @override
  String get iconNamePauseFa => 'หยุดชั่วคราว FA';

  @override
  String get iconNameStopFa => 'หยุด FA';

  @override
  String get iconNamePlayFaOutline => 'เล่น FA Outline';

  @override
  String get iconNamePauseFaOutline => 'หยุดชั่วคราว FA Outline';

  @override
  String get iconNameStopFaOutline => 'หยุด FA Outline';

  @override
  String get iconNameBackwardFa => 'ย้อนกลับ FA';

  @override
  String get iconNameForwardFa => 'ไปข้างหน้า FA';

  @override
  String get iconNamePreviousFa => 'ก่อนหน้า FA';

  @override
  String get iconNameNextFa => 'ถัดไป FA';

  @override
  String get iconNameRewindFa => 'กรอกลับ FA';

  @override
  String get iconNameFastForwardFa => 'กรอไปข้างหน้า FA';

  @override
  String get iconNameRepeatFa => 'ซ้ำ FA';

  @override
  String get iconNameShuffleFa => 'สุ่ม FA';

  @override
  String get iconNameEjectFa => 'Eject FA';

  @override
  String get iconNameFilmFa => 'ฟิล์ม FA';

  @override
  String get iconNameVideoFa => 'Video FA';

  @override
  String get iconNameMusicFa => 'เพลง FA';

  @override
  String get iconNameMicrophoneFa => 'ไมค์ FA';

  @override
  String get iconNameCameraFa => 'กล้อง FA';

  @override
  String get iconNameCameraRetroFa => 'กล้อง Retro FA';

  @override
  String get iconNameVolumeHighFa => 'Volume High FA';

  @override
  String get iconNameVolumeLowFa => 'Volume Low FA';

  @override
  String get iconNameVolumeOffFa => 'ปิดเสียงออก FA';

  @override
  String get iconNameMuteFa => 'Mute FA';

  @override
  String get iconNameMicMuteFa => 'ไมค์ Mute FA';

  @override
  String get iconNameHeadphonesFa => 'หูฟัง FA';

  @override
  String get iconNameSpeakerFa => 'ลำโพง FA';

  @override
  String get iconNameUpFa => 'ขึ้น FA';

  @override
  String get iconNameDownFa => 'ลง FA';

  @override
  String get iconNameLeftFa => 'ซ้าย FA';

  @override
  String get iconNameRightFa => 'ขวา FA';

  @override
  String get iconNameUpFaOutline => 'ขึ้น FA Outline';

  @override
  String get iconNameDownFaOutline => 'ลง FA Outline';

  @override
  String get iconNameLeftFaOutline => 'ซ้าย FA Outline';

  @override
  String get iconNameRightFaOutline => 'ขวา FA Outline';

  @override
  String get iconNameArrowUpFa => 'ลูกศรขึ้น FA';

  @override
  String get iconNameArrowDownFa => 'ลูกศรลง FA';

  @override
  String get iconNameArrowLeftFa => 'ลูกศรซ้าย FA';

  @override
  String get iconNameArrowRightFa => 'ลูกศรขวา FA';

  @override
  String get iconNameChevronUpFa => 'เชฟรอน ขึ้น FA';

  @override
  String get iconNameChevronDownFa => 'เชฟรอน ลง FA';

  @override
  String get iconNameChevronLeftFa => 'เชฟรอนซ้าย FA';

  @override
  String get iconNameChevronRightFa => 'เชฟรอนขวา FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Outline';

  @override
  String get iconNameCheckFa => 'เช็ก FA';

  @override
  String get iconNameCloseFa => 'ปิด FA';

  @override
  String get iconNameCloseCircleFa => 'ปิด Circle FA';

  @override
  String get iconNameHomeFa => 'หน้าแรก FA';

  @override
  String get iconNameUndoFa => 'เลิกทำ FA';

  @override
  String get iconNameRedoFa => 'ทำซ้ำ FA';

  @override
  String get iconNameRotateFa => 'Rotate FA';

  @override
  String get iconNameSearchFa => 'ค้นหา FA';

  @override
  String get iconNameRefreshFa => 'รีเฟรช FA';

  @override
  String get iconNamePowerOffFa => 'ปิดเครื่อง FA';

  @override
  String get iconNamePlugFa => 'Plug FA';

  @override
  String get iconNameToggleOnFa => 'สลับเปิด FA';

  @override
  String get iconNameToggleOffFa => 'สลับปิด FA';

  @override
  String get iconNameSettingsFa => 'ตั้งค่า FA';

  @override
  String get iconNameSettingsAltFa => 'ตั้งค่า Alt FA';

  @override
  String get iconNameMenuFa => 'เมนู FA';

  @override
  String get iconNameMoreFa => 'เพิ่มเติม FA';

  @override
  String get iconNameMoreVerticalFa => 'เพิ่มเติม แนวตั้ง FA';

  @override
  String get iconNameInfoFa => 'ข้อมูล FA';

  @override
  String get iconNameInfoFaOutline => 'ข้อมูล FA Outline';

  @override
  String get iconNameHelpFa => 'ช่วยเหลือ FA';

  @override
  String get iconNameHelpFaOutline => 'ช่วยเหลือ FA Outline';

  @override
  String get iconNameListFa => 'รายการ FA';

  @override
  String get iconNameGridFa => 'ตาราง FA';

  @override
  String get iconNameSlidersFa => 'สไลเดอร์ FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'จอภาพ FA';

  @override
  String get iconNameDesktopFa => 'เดสก์ท็อป FA';

  @override
  String get iconNameBrightnessFa => 'ความสว่าง FA';

  @override
  String get iconNameNightModeFa => 'กลางคืน Mode FA';

  @override
  String get iconNameLightFa => 'แสง FA';

  @override
  String get iconNameLightFaOutline => 'แสง FA Outline';

  @override
  String get iconNameFlashFa => 'แฟลช FA';

  @override
  String get iconNameFullscreenFa => 'เต็มจอ FA';

  @override
  String get iconNameExitFullscreenFa => 'ออกเต็มจอ FA';

  @override
  String get iconNameZoomInFa => 'ซูมเข้า FA';

  @override
  String get iconNameZoomOutFa => 'ซูมออก FA';

  @override
  String get iconNameSubtitlesFa => 'คำบรรยาย FA';

  @override
  String get iconNamePictureInPictureFa => 'ภาพซ้อนภาพ FA';

  @override
  String get iconNameColorFa => 'สี FA';

  @override
  String get iconNamePaintFa => 'Paint FA';

  @override
  String get iconNameInputFa => 'อินพุต FA';

  @override
  String get iconNameWifiFa => 'WiFi FA';

  @override
  String get iconNameBluetoothFa => 'Bluetooth FA';

  @override
  String get iconNameUsbFa => 'USB FA';

  @override
  String get iconNameEthernetFa => 'Ethernet FA';

  @override
  String get iconNameGamepadFa => 'เกมแพด FA';

  @override
  String get iconNameBroadcastFa => 'กระจายสัญญาณ FA';

  @override
  String get iconNameSatelliteFa => 'ดาวเทียม FA';

  @override
  String get iconNameAntennaFa => 'เสาอากาศ FA';

  @override
  String get iconNameNetworkFa => 'เครือข่าย FA';

  @override
  String get iconNameCloudFa => 'คลาวด์ FA';

  @override
  String get iconNameStarFa => 'ดาว FA';

  @override
  String get iconNameStarFaOutline => 'ดาว FA Outline';

  @override
  String get iconNameHeartFa => 'หัวใจ FA';

  @override
  String get iconNameHeartFaOutline => 'หัวใจ FA Outline';

  @override
  String get iconNameBookmarkFa => 'ที่คั่นหน้า FA';

  @override
  String get iconNameBookmarkFaOutline => 'ที่คั่นหน้า FA Outline';

  @override
  String get iconNameFlagFa => 'ธง FA';

  @override
  String get iconNameClockFa => 'Clock FA';

  @override
  String get iconNameClockFaOutline => 'Clock FA Outline';

  @override
  String get iconNameBellFa => 'กระดิ่ง FA';

  @override
  String get iconNameBellFaOutline => 'กระดิ่ง FA Outline';

  @override
  String get iconNameTimerFa => 'ตัวตั้งเวลา FA';

  @override
  String get iconNameLockFa => 'ล็อก FA';

  @override
  String get iconNameUnlockFa => 'ปลดล็อก FA';

  @override
  String get iconNameGalleryFa => 'แกลเลอรี FA';

  @override
  String get iconNameImagesFa => 'รูปภาพ FA';

  @override
  String get iconNameImageFa => 'ภาพ FA';

  @override
  String get iconNameVideoFileFa => 'Video ไฟล์ FA';

  @override
  String get iconNameAudioFileFa => 'เสียง ไฟล์ FA';

  @override
  String get iconNamePlayOutlineFa => 'เล่น เส้นขอบ FA';

  @override
  String get iconNamePlaySimpleFa => 'เล่น แบบง่าย FA';

  @override
  String get iconNamePauseSimpleFa => 'หยุดชั่วคราว แบบง่าย FA';

  @override
  String get iconNameStopSimpleFa => 'หยุด แบบง่าย FA';

  @override
  String get iconNameRecordFa => 'บันทึก FA';

  @override
  String get iconNameStopCircleFa => 'หยุด Circle FA';

  @override
  String get iconNameLoadingFa => 'Loading FA';

  @override
  String get iconNameTextFa => 'ข้อความ FA';

  @override
  String get iconNameTextSizeFa => 'ข้อความ Size FA';

  @override
  String get iconNameLanguageFa => 'ภาษา FA';

  @override
  String get iconNameGlobeFa => 'โลก FA';

  @override
  String get iconNameSubtitlesAltFa => 'คำบรรยาย Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'คำบรรยาย Alt เส้นขอบ FA';

  @override
  String get iconNameChannelUpFa => 'Channel ขึ้น FA';

  @override
  String get iconNameChannelDownFa => 'Channel ลง FA';

  @override
  String get iconNamePageUpFa => 'เลื่อนหน้าขึ้น FA';

  @override
  String get iconNamePageDownFa => 'เลื่อนหน้าลง FA';

  @override
  String get iconNameGuideFa => 'คู่มือ FA';

  @override
  String get iconNameGridViewFa => 'ตาราง View FA';

  @override
  String get iconNameGridAltFa => 'ตาราง Alt FA';

  @override
  String get iconNameScheduleFa => 'กำหนดเวลา FA';

  @override
  String get iconNameCalendarFa => 'ปฏิทิน FA';

  @override
  String get iconNameRedButtonFa => 'แดง Button FA';

  @override
  String get iconNameButtonOutlineFa => 'Button เส้นขอบ FA';

  @override
  String get iconNameSquareButtonFa => 'สี่เหลี่ยม Button FA';

  @override
  String get iconNameSquareOutlineFa => 'สี่เหลี่ยม เส้นขอบ FA';

  @override
  String get iconNameDotCircleFa => 'จุด Circle FA';

  @override
  String get iconNameToolsFa => 'เครื่องมือ FA';

  @override
  String get iconNameScrewdriverFa => 'ไขควง FA';

  @override
  String get iconNameHammerFa => 'ค้อน FA';

  @override
  String get iconNameToolboxFa => 'กล่องเครื่องมือ FA';

  @override
  String get iconNameCogFa => 'เฟือง FA';

  @override
  String get iconNameAdjustFa => 'ปรับ FA';

  @override
  String get iconNameFilterFa => 'ตัวกรอง FA';

  @override
  String get iconNameSortDownFa => 'เรียง ลง FA';

  @override
  String get iconNameSortUpFa => 'เรียง ขึ้น FA';

  @override
  String get iconNameSleepFa => 'สลีป FA';

  @override
  String get iconNameTimerStartFa => 'ตัวตั้งเวลา Start FA';

  @override
  String get iconNameTimerHalfFa => 'ตัวตั้งเวลา Half FA';

  @override
  String get iconNameTimerEndFa => 'ตัวตั้งเวลา End FA';

  @override
  String get iconNameStopwatchFa => 'จับเวลา FA';

  @override
  String get iconNameAlarmFa => 'ปลุก FA';

  @override
  String get iconNameCropAltFa => 'Crop Alt FA';

  @override
  String get iconNameCropFa => 'Crop FA';

  @override
  String get iconNameSquareFullFa => 'สี่เหลี่ยม Full FA';

  @override
  String get iconNameFullscreenAltFa => 'เต็มจอ Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Zoom บวก FA';

  @override
  String get iconNameZoomMinusFa => 'Zoom ลบ FA';

  @override
  String get iconNameMusicNoteFa => 'เพลง Note FA';

  @override
  String get iconNameCdFa => 'CD FA';

  @override
  String get iconNameVinylFa => 'แผ่นเสียง FA';

  @override
  String get iconNameRssFa => 'RSS FA';

  @override
  String get iconNameMagicFa => 'เวทมนตร์ FA';

  @override
  String get iconNameFingerprintFa => 'ลายนิ้วมือ FA';

  @override
  String get iconNameUserFa => 'ผู้ใช้ FA';

  @override
  String get iconNameUsersFa => 'ผู้ใช้หลายคน FA';

  @override
  String get iconNameChildModeFa => 'เด็ก Mode FA';

  @override
  String get iconNameCastFa => 'แคสต์ FA';

  @override
  String get iconNameStreamFa => 'สตรีม FA';

  @override
  String get iconNameSignalFa => 'สัญญาณ FA';

  @override
  String get iconNameFeedFa => 'ฟีด FA';

  @override
  String get iconNameCircleArrowUpFa => 'Circle ลูกศรขึ้น FA';

  @override
  String get iconNameCircleArrowDownFa => 'Circle ลูกศรลง FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Circle ลูกศรซ้าย FA';

  @override
  String get iconNameCircleArrowRightFa => 'Circle ลูกศรขวา FA';

  @override
  String get iconNameLongArrowUpFa => 'Long ลูกศรขึ้น FA';

  @override
  String get iconNameLongArrowDownFa => 'Long ลูกศรลง FA';

  @override
  String get iconNameLongArrowLeftFa => 'Long ลูกศรซ้าย FA';

  @override
  String get iconNameLongArrowRightFa => 'Long ลูกศรขวา FA';

  @override
  String get iconNamePlusFa => 'บวก FA';

  @override
  String get iconNameMinusFa => 'ลบ FA';

  @override
  String get iconNamePlusCircleFa => 'บวก Circle FA';

  @override
  String get iconNameMinusCircleFa => 'ลบ Circle FA';

  @override
  String get iconNamePlusSquareFa => 'บวก สี่เหลี่ยม FA';

  @override
  String get iconNameMinusSquareFa => 'ลบ สี่เหลี่ยม FA';

  @override
  String get iconNameTimesFa => 'Times FA';

  @override
  String get iconNameTimesCircleFa => 'Times Circle FA';

  @override
  String get iconNameBatteryFullFa => 'แบตเต็ม FA';

  @override
  String get iconNameBattery34Fa => 'แบต 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'แบตครึ่ง FA';

  @override
  String get iconNameBattery14Fa => 'แบต 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'แบตหมด FA';

  @override
  String get iconNameChargingFa => 'ชาร์จ FA';

  @override
  String get iconNameCloudSunFa => 'เมฆกับแดด FA';

  @override
  String get iconNameCloudMoonFa => 'เมฆกับจันทร์ FA';

  @override
  String get iconNameRainFa => 'ฝน FA';

  @override
  String get iconNameSnowflakeFa => 'เกล็ดหิมะ FA';

  @override
  String get iconNameFireFa => 'ไฟ FA';

  @override
  String get iconNameTemperatureFa => 'อุณหภูมิ FA';

  @override
  String get iconNameBoxFa => 'กล่อง FA';

  @override
  String get iconNameGiftFa => 'ของขวัญ FA';

  @override
  String get iconNameTrophyFa => 'ถ้วยรางวัล FA';

  @override
  String get iconNameCrownFa => 'มงกุฎ FA';

  @override
  String get iconNameGemFa => 'อัญมณี FA';

  @override
  String get unknownLabel => 'ไม่ทราบ';

  @override
  String get selectedFilesLabel => 'ไฟล์ที่เลือก';

  @override
  String get folderNotFoundOrInaccessible =>
      'ไม่พบโฟลเดอร์หรือไม่สามารถเข้าถึงได้';

  @override
  String get importedRemoteDefaultName => 'นำเข้าแล้วรีโมต';

  @override
  String get demoRemoteName => 'Demo รีโมต';

  @override
  String get protocolFieldsInvalid =>
      'Fill required โปรโตคอล fields and ensure ความถี่ is 15k–60k if set.';

  @override
  String get unknownProtocolSelected => 'เลือกโปรโตคอลที่ไม่ทราบ';

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
  String get learningModeCaptureFailed => 'การเรียนรู้การจับล้มเหลว';

  @override
  String get learningModeReplaySent => 'เรียนรู้สัญญาณเล่นซ้ำ';

  @override
  String get learningModeReplayFailed => 'ไม่สามารถเล่นซ้ำสัญญาณที่เรียนรู้ได้';

  @override
  String get learningModeNoRemotesAvailable => 'ยังไม่มีรีโมตที่บันทึกไว้';

  @override
  String get learningModeChooseRemoteTitle => 'เลือกรีโมท';

  @override
  String get learningModeNewRemoteTitle => 'สร้างรีโมทใหม่';

  @override
  String get learningModeSaveSuccess => 'บันทึกปุ่มเรียนรู้แล้ว';

  @override
  String get learningModeSaveFailed => 'ไม่สามารถบันทึกปุ่มเรียนรู้ได้';

  @override
  String get remoteSetupIntro =>
      'เลือกชื่อและเลย์เอาต์ก่อน แล้วค่อยเพิ่มปุ่มภายหลัง';

  @override
  String get startWithDefault => 'เริ่มด้วยค่าเริ่มต้น';

  @override
  String get browseGithubStore => 'เปิด GitHub Store';

  @override
  String get addFirstButton => 'เพิ่มปุ่มแรก';

  @override
  String get moreWaysToStart => 'วิธีเริ่มต้นเพิ่มเติม';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'ละทิ้งการตั้งค่ารีโมตใหม่นี้และออกจากหน้านี้หรือไม่?';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'ละทิ้งการเปลี่ยนแปลงของรีโมตและออกจากหน้านี้หรือไม่?';

  @override
  String get firstButtonAdded => 'เพิ่มปุ่มแรกแล้ว';

  @override
  String get iconColorTitle => 'สีไอคอน';

  @override
  String get iconColorHelper =>
      'เลือกสีสัญลักษณ์ที่ยังมองเห็นได้ชัดบนพื้นหลังปุ่ม';

  @override
  String get colorRed => 'แดง';

  @override
  String get colorPink => 'ชมพู';

  @override
  String get colorPurple => 'ม่วง';

  @override
  String get colorDeepPurple => 'ม่วงเข้ม';

  @override
  String get colorIndigo => 'คราม';

  @override
  String get colorBlue => 'น้ำเงิน';

  @override
  String get colorLightBlue => 'ฟ้าอ่อน';

  @override
  String get colorCyan => 'ไซแอน';

  @override
  String get colorTeal => 'เขียวน้ำทะเล';

  @override
  String get colorGreen => 'เขียว';

  @override
  String get colorLightGreen => 'เขียวอ่อน';

  @override
  String get colorLime => 'ไลม์';

  @override
  String get colorYellow => 'เหลือง';

  @override
  String get colorAmber => 'อำพัน';

  @override
  String get colorOrange => 'ส้ม';

  @override
  String get colorDeepOrange => 'ส้มเข้ม';

  @override
  String get colorBrown => 'น้ำตาล';

  @override
  String get colorGrey => 'เทา';

  @override
  String get colorBlueGrey => 'เทาอมฟ้า';

  @override
  String get colorBlack => 'ดำ';

  @override
  String get colorWhite => 'ขาว';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'สีปุ่ม $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'สีปุ่ม $colorName, เลือกอยู่';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'สีไอคอน $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'สีไอคอน $colorName, เลือกอยู่';
  }
}
