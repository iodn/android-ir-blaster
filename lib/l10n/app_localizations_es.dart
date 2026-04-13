// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Cargando…';

  @override
  String get unknownError => 'Error desconocido';

  @override
  String get failedToStart => 'No se pudo iniciar';

  @override
  String get retry => 'Reintentar';

  @override
  String get quickTilePower => 'Enc.';

  @override
  String get quickTileMute => 'Sil.';

  @override
  String get quickTileVolumeUp => 'Vol +';

  @override
  String get quickTileVolumeDown => 'Vol -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Este teléfono no tiene IR integrado. Se detectó un dongle IR USB, pero aún no tiene permiso.\n\nAcepta el aviso USB para activar el envío IR.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'Este teléfono no tiene IR integrado. Se detectó un dongle IR USB, pero se negó el permiso USB.\n\nPídelo otra vez y acepta el aviso para activar IR.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'Este teléfono no tiene IR integrado. El dongle IR USB está autorizado, pero aún no se inicializa.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Este teléfono no tiene IR integrado. El dongle IR USB fue detectado y autorizado, pero no pudo iniciarse.\n\nReconéctalo e inténtalo otra vez.';

  @override
  String get homeUsbReadyMessage => 'Este teléfono no tiene IR integrado.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Este teléfono no tiene IR integrado y no hay un dongle IR USB compatible conectado.\n\nAún puedes crear, importar y gestionar mandos, pero para emitir IR necesitas una opción de abajo.';

  @override
  String get homeUsbOptionPlugIn =>
      'Conecta un dongle IR USB compatible y acepta el permiso.';

  @override
  String get homeUsbOptionReady => 'Listo para usar.';

  @override
  String get homeUsbOptionPermissionRequired => 'Conectado. Falta permiso.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Permiso denegado. Pídelo otra vez.';

  @override
  String get homeUsbOptionPermissionGranted => 'Autorizado. Iniciando dongle.';

  @override
  String get homeUsbOptionOpenFailed => 'Autorizado, pero falló el inicio.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Este teléfono no tiene IR integrado. Conecta un dongle IR USB o activa el modo Audio en Ajustes.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Dongle USB detectado. Se requiere permiso para enviar IR.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Se negó el permiso USB. Pídelo otra vez para enviar IR.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Dongle USB autorizado. Esperando inicio.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Dongle USB autorizado, pero falló el inicio.';

  @override
  String get homeHardwareBannerReady => 'USB está listo.';

  @override
  String get homeHardwareRequiredTitle =>
      'Se requiere hardware IR para enviar comandos';

  @override
  String get homeUsbDongleRecommended => 'Dongle IR USB (recomendado)';

  @override
  String get homeAudioAdapterAlternative =>
      'Adaptador IR por audio (alternativa)';

  @override
  String get homeAudioAdapterDescription =>
      'Ajustes → Emisor IR → Audio (1 LED / 2 LED). Requiere un adaptador de audio a IR.';

  @override
  String get close => 'Cerrar';

  @override
  String get homeChooseTransmitter => 'Elige un emisor';

  @override
  String get openSettings => 'Abrir Ajustes';

  @override
  String get homeUsbPermissionSentApprove =>
      'Solicitud de permiso USB enviada. Acepta el aviso para activar USB.';

  @override
  String get homeUsbDongleNotDetected =>
      'No se detectó un dongle IR USB compatible. Conéctalo e inténtalo otra vez.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'No se pudo pedir el permiso USB.';

  @override
  String get working => 'Procesando…';

  @override
  String get requestUsbPermission => 'Pedir permiso USB';

  @override
  String get homeHardwareTip =>
      'Consejo: aún puedes crear y ordenar mandos. El hardware solo se necesita al transmitir.';

  @override
  String get homeNoIrTransmitterTitle => 'No hay emisor IR disponible';

  @override
  String get homeHardwareRequiredBody =>
      'IR Blaster puede crear y gestionar mandos en cualquier teléfono. Para enviar comandos por infrarrojos, tu dispositivo necesita una de las opciones de hardware de abajo.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Aún puedes crear, importar y organizar mandos ahora mismo.';

  @override
  String get homeWaysToUseIrBlaster => 'Formas de usar IR Blaster';

  @override
  String get homeBuiltInIrOptionTitle => 'Teléfono con IR integrado';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Funciona en teléfonos compatibles con emisor IR integrado. Este teléfono no incluye uno.';

  @override
  String get homeBuiltInIrUnavailable => 'No disponible en este teléfono';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'Adaptador de audio de 3,5 mm';

  @override
  String get homeContinueWithoutHardware => 'Continuar sin hardware';

  @override
  String get homeHowItWorks => 'Cómo funciona';

  @override
  String get settingsNavLabel => 'Ajustes';

  @override
  String get dismiss => 'Descartar';

  @override
  String get remotesNavLabel => 'Mandos';

  @override
  String get macrosNavLabel => 'Macros';

  @override
  String get signalTesterNavLabel => 'Probador IR';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get remoteNoIrEmitterTitle => 'Sin emisor IR';

  @override
  String get remoteNoIrEmitterMessage => 'Este dispositivo no tiene emisor IR';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Esta app necesita un emisor IR para funcionar';

  @override
  String get remoteDismiss => 'Descartar';

  @override
  String get remoteClose => 'Cerrar';

  @override
  String remoteFailedToSend(Object error) {
    return 'No se pudo enviar IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'No se pudo iniciar el bucle: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Bucle detenido, envío fallido: $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Repitiendo \"$title\". Toca Detener arriba para parar.';
  }

  @override
  String get remoteLoopStopped => 'Bucle detenido.';

  @override
  String get remoteUpdatedNotFound =>
      'El mando se actualizó en pantalla. No se encontró en la lista guardada.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Se actualizó \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Falló el borrado: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'No se encontró el mando en la lista guardada.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Se eliminó \"$name\".';
  }

  @override
  String get buttonFallbackTitle => 'Botón';

  @override
  String get imageFallbackTitle => 'Imagen';

  @override
  String get noBrowserAvailable => 'No hay navegador disponible';

  @override
  String failedToOpen(Object error) {
    return 'No se pudo abrir: $error';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get settingsRestoreDemoTitle => '¿Restaurar mandos demo?';

  @override
  String get settingsRestoreDemoMessage =>
      'Esto reemplazará tus mandos actuales por los mandos demo integrados. Se recomienda una copia si quieres conservar la lista actual.';

  @override
  String get settingsRestoreDemoConfirm => 'Restaurar demo';

  @override
  String get settingsDemoRemotesRestored => 'Mandos demo restaurados.';

  @override
  String get settingsDeleteAllRemotesTitle => '¿Eliminar todos los mandos?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'This removes every mando from this dispositivo. This action can’t be undone.';

  @override
  String get settingsDeleteAllConfirm => 'Eliminar todo';

  @override
  String get settingsAllRemotesDeleted => 'Todos los mandos eliminados.';

  @override
  String get themeAuto => 'Tema auto';

  @override
  String get themeLight => 'Tema claro';

  @override
  String get themeDark => 'Tema oscuro';

  @override
  String get themeDescAuto => 'Sigue los ajustes del dispositivo';

  @override
  String get themeDescLight => 'Siempre claro y nítido';

  @override
  String get themeDescDark => 'Descansa la vista';

  @override
  String get themeHintAuto =>
      'El tema cambia solo cuando alternas entre modo claro y oscuro en el dispositivo';

  @override
  String get themeHintLight =>
      'Perfecto para usar de día y en sitios bien iluminados';

  @override
  String get themeHintDark =>
      'Reduce la fatiga visual con poca luz y ahorra batería en pantallas OLED';

  @override
  String get supportDevelopmentTitle => 'Apoyar desarrollo';

  @override
  String get supportDevelopmentSubtitle =>
      'Ayuda a mantener IR Blaster y su compatibilidad de hardware';

  @override
  String get supportDevelopmentBody =>
      'Sin anuncios, sin rastreo ni funciones bloqueadas. Tu apoyo financia protocolos, soporte USB y mejor compatibilidad entre dispositivos.';

  @override
  String get donate => 'Donar';

  @override
  String get starRepo => 'Dar estrella';

  @override
  String get repositoryLinkCopied => 'Enlace del repositorio copiado';

  @override
  String get supportPillLocalOnly => 'Solo local';

  @override
  String get supportPillNoTracking => 'Sin rastreo';

  @override
  String get supportPillHardwareAware => 'Consciente del hardware';

  @override
  String get supportPillOpenSource => 'Código abierto';

  @override
  String get appearanceTitle => 'Apariencia';

  @override
  String get appearanceSubtitle => 'Personaliza la experiencia visual';

  @override
  String get localizationTitle => 'Idioma';

  @override
  String get localizationSubtitle =>
      'Idioma de la app y comportamiento de traducción';

  @override
  String localizationAutoUsing(Object language) {
    return 'Auto: usando $language';
  }

  @override
  String get localizationAutoDescription =>
      'La app sigue el idioma del dispositivo cuando es posible.';

  @override
  String get localizationManualDescription =>
      'El idioma de la app se ha fijado manualmente.';

  @override
  String get useSystemLanguageTitle => 'Usar idioma del sistema';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Siguiendo el idioma del dispositivo: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Usa el idioma elegido abajo en lugar del predeterminado del dispositivo.';

  @override
  String get chooseAppLanguage => 'Elegir idioma de la app';

  @override
  String get languagePickerDisabledHint =>
      'Desactiva el idioma del sistema para elegir uno manualmente.';

  @override
  String get searchLanguages => 'Buscar idiomas';

  @override
  String get noLanguagesFound => 'No hay idiomas coincidentes';

  @override
  String get localizationHint =>
      'Si el idioma del sistema está activo, la app sigue la configuración regional del dispositivo y usa inglés si falta una traducción. Desactívalo para fijar un idioma.';

  @override
  String get appLanguageTitle => 'Idioma de la app';

  @override
  String get appLanguageHint =>
      'Auto sigue el idioma del dispositivo. Elige aquí inglés o francés para forzarlo solo en la app.';

  @override
  String get languageAuto => 'Auto (sistema)';

  @override
  String get languageAutoDescription =>
      'Seguir el idioma del dispositivo automáticamente';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get languageEnglishDescription =>
      'Forzar que la app use siempre inglés';

  @override
  String get languageFrench => 'Francés';

  @override
  String get languageFrenchDescription =>
      'Forzar que la app use siempre francés';

  @override
  String get languageAutoShort => 'Auto';

  @override
  String get languageEnglishShort => 'Inglés';

  @override
  String get languageFrenchShort => 'Francés';

  @override
  String get useDynamicColors => 'Usar colores dinámicos';

  @override
  String get themeChoiceAuto => 'Auto';

  @override
  String get themeChoiceLight => 'Claro';

  @override
  String get themeChoiceDark => 'Oscuro';

  @override
  String get irTransmitterTitle => 'Emisor IR';

  @override
  String get irTransmitterSubtitle => 'Elige qué hardware envía comandos IR';

  @override
  String get learningModeEntryTitle => 'Modo de aprendizaje';

  @override
  String get learningModeEntrySubtitle =>
      'Capturar un botón desde un mando físico paso a paso';

  @override
  String get learningModeTitle => 'Modo de aprendizaje';

  @override
  String get learningModeHeroTitle => 'Aprenda un botón remoto limpiamente';

  @override
  String get learningModeHeroSubtitle =>
      'Configure su receptor, prepare el control remoto original, capture un comando y luego revíselo antes de guardarlo en un control remoto.';

  @override
  String get learningModeReadyBadge => 'Receptor listo';

  @override
  String get learningModeNeedsPermissionBadge => 'Se necesita permiso USB';

  @override
  String get learningModeSetupBadge => 'Se necesita configuración del receptor';

  @override
  String get learningModeNoReceiverBadge => 'Sin receptor de aprendizaje';

  @override
  String get learningModeCheckingBadge => 'Comprobando hardware';

  @override
  String get learningModeFourStepFlow => 'Flujo guiado de 4 pasos';

  @override
  String get learningModeSaveAnywhereBadge => 'Revisar antes de guardar';

  @override
  String get learningModeGuideTitle =>
      'Continúe donde debería ocurrir la captura';

  @override
  String get learningModeStepHardwareShort => 'Hardware';

  @override
  String get learningModeStepPrepareShort => 'Preparar';

  @override
  String get learningModeStepCaptureShort => 'Captura';

  @override
  String get learningModeStepReviewShort => 'Revisar';

  @override
  String get learningModeStepHardwareTitle =>
      'Verifique el hardware del receptor';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Asegúrese de que un receptor de aprendizaje compatible esté conectado y autorizado antes de comenzar.';

  @override
  String get learningModeCurrentSenderLabel => 'Transmisor de corriente';

  @override
  String get learningModeReceiverStatusLabel => 'Estado de aprendizaje';

  @override
  String get learningModeCheckingHardwareBody =>
      'Comprobación del estado del transmisor disponible y del receptor USB.';

  @override
  String get learningModeHardwareReadyBody =>
      'Se conecta e inicializa una llave USB IR. Este es el lugar adecuado para iniciar el flujo de aprendizaje una vez conectado el cableado de captura.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Hay una llave USB, pero el permiso de Android aún la bloquea. Conceda permiso USB en la sección del transmisor antes de aprender.';

  @override
  String get learningModeHardwareSetupBody =>
      'Se detecta parcialmente un dongle, pero aún es necesario configurarlo o reconectarlo antes de que el aprendizaje pueda comenzar de manera confiable.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Actualmente no hay hardware receptor compatible disponible. El modo de aprendizaje está pensado para dongles externos compatibles con capacidad de recepción.';

  @override
  String get learningModeRefreshHardware => 'Actualizar el estado del hardware';

  @override
  String get learningModeHardwareTipTitle => 'Mejor ubicación';

  @override
  String get learningModeHardwareTipBody =>
      'El modo de aprendizaje se encuentra bajo el transmisor de infrarrojos porque depende de la disponibilidad del hardware y se usa con menos frecuencia que el envío de controles remotos.';

  @override
  String get learningModeStepPrepareTitle =>
      'Prepare el control remoto original';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Decida lo que está aprendiendo y luego mantenga el control remoto original fijo y cerca del receptor.';

  @override
  String get learningModeButtonNameLabel => 'Nombre del botón';

  @override
  String get learningModeButtonNameHint =>
      'Por ejemplo: HDMI 1, Encendido, Menú';

  @override
  String get learningModeSinglePress => 'Pulsación única';

  @override
  String get learningModeHoldButton => 'botón de retención';

  @override
  String get learningModePreparationChecklistTitle => 'antes de capturar';

  @override
  String get learningModePreparationItemDistance =>
      'Mantenga el mando a distancia original a una distancia aproximada de 2 a 5 cm del receptor.';

  @override
  String get learningModePreparationItemOneButton =>
      'Aprenda un botón a la vez y presione primero de manera breve y limpia.';

  @override
  String get learningModePreparationItemStill =>
      'Mantenga ambos dispositivos fijos para evitar capturas parciales o ruidosas.';

  @override
  String get learningModeStepCaptureTitle => 'Captura la señal';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Escuche un solo comando y luego bloquee el resultado antes de revisarlo.';

  @override
  String get learningModeCaptureReadyTitle => 'Listo para escuchar';

  @override
  String get learningModeCaptureReadyBody =>
      'El estado de su hardware se ve bien. El backend de captura se conectará a este paso a continuación.';

  @override
  String get learningModeCaptureBlockedTitle => 'Hardware aún no listo';

  @override
  String get learningModeCaptureBlockedBody =>
      'Aún puedes revisar el flujo ahora, pero la captura debe esperar hasta que el receptor esté listo.';

  @override
  String get learningModeStartListening => 'Empezar a escuchar';

  @override
  String get learningModeCaptureStubTitle =>
      'El backend de captura es el siguiente';

  @override
  String get learningModeCaptureStubBody =>
      'Esta pantalla está completamente estructurada primero para que el flujo de captura final pueda conectarse a estados reales del hardware en lugar de incorporarse más tarde.';

  @override
  String get learningModeCaptureStubMessage =>
      'La captura de aprendizaje aún no está conectada. Esta pantalla estructura primero el flujo completo.';

  @override
  String get learningModeUnnamedCapture => 'Captura sin nombre';

  @override
  String get learningModeStatusCheckingTitle => 'Comprobando el receptor';

  @override
  String get learningModeStatusNoReceiverTitle => 'El receptor no está listo';

  @override
  String get learningModeStatusPermissionTitle => 'Se requiere permiso USB';

  @override
  String get learningModeStatusSetupTitle =>
      'El receptor necesita configuración';

  @override
  String get learningModeStatusReadyTitle => 'Listo para aprender';

  @override
  String get learningModeStatusListeningTitle => 'Escuchando una señal';

  @override
  String get learningModeStatusCapturedTitle => 'Señal capturada';

  @override
  String get learningModeStatusReadyBody =>
      'Asigne un nombre al botón, apunte el control remoto original al receptor y comience a escuchar cuando esté listo.';

  @override
  String get learningModeStatusListeningBody =>
      'Presione el botón del control remoto original ahora. Una vez conectada la captura, este estado se fijará en la siguiente señal limpia.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Una vista previa de la señal aprendida está lista para $buttonName. Vuelve a reproducirlo, confirma que funciona y luego guárdalo en tu biblioteca.';
  }

  @override
  String get learningModeConnectReceiverTitle =>
      'Conecte un dongle de aprendizaje compatible';

  @override
  String get learningModeConnectReceiverBody =>
      'El modo de aprendizaje depende del hardware externo que puede recibir IR. Una vez que se detecta y autoriza al receptor, esta página se convierte en un flujo directo de escucha, prueba y guardado.';

  @override
  String get learningModeListenCardTitle => 'Escuche un botón';

  @override
  String get learningModeListenCardBody =>
      'Primero configure una etiqueta si lo desea, luego comience a escuchar y presione el botón en el control remoto original.';

  @override
  String get learningModeReadyToListenTitle => 'Listo para escuchar';

  @override
  String get learningModeReadyToListenBody =>
      'Esta es la principal superficie de captura. Comience a escuchar solo cuando el control remoto original esté apuntado y fijo.';

  @override
  String get learningModeListeningNowTitle => 'Escuchando ahora';

  @override
  String get learningModeListeningNowBody =>
      'Presione el botón del control remoto original una vez. Utilice la captura de vista previa para moverse por el resto del andamio antes de conectar el backend de captura real.';

  @override
  String get learningModePreviewCaptureAction =>
      'Vista previa de la señal capturada';

  @override
  String get learningModeCapturedSummary =>
      'Vista previa de la señal aprendida';

  @override
  String get learningModeResultActionsTitle => 'Probar y guardar';

  @override
  String get learningModeResultActionsBody =>
      'Vuelva a reproducir la señal aprendida, verifique que el dispositivo de destino responda y luego guárdela como un botón reutilizable.';

  @override
  String get learningModeReplayAction => 'Repetición';

  @override
  String get learningModeReplayStubMessage =>
      'La repetición aún no está conectada. Esta es la estructura de la interfaz de usuario para el flujo final de aprendizaje, prueba y guardado.';

  @override
  String get learningModeSaveStubMessage =>
      'Save aún no está conectado. El siguiente paso es conectar esta pantalla al botón Crear y a los controles remotos existentes.';

  @override
  String get learningModeLearnAnotherAction => 'Aprende otro botón';

  @override
  String get learningModeStepReviewTitle => 'Revisar y guardar';

  @override
  String get learningModeStepReviewSubtitle =>
      'Confirme lo aprendido y luego elija dónde debería ubicarse en su biblioteca remota.';

  @override
  String get learningModeSaveToExistingRemote => 'Control remoto existente';

  @override
  String get learningModeCreateNewRemote => 'Nuevo control remoto';

  @override
  String get learningModeProtocolPreviewTitle => 'Vista previa del protocolo';

  @override
  String get learningModeProtocolPreviewBody =>
      'Los detalles del protocolo decodificado aparecerán aquí una vez que el receptor capture una pulsación limpia del botón.';

  @override
  String get learningModeRawPreviewTitle => 'Respaldo crudo';

  @override
  String get learningModeRawPreviewBody =>
      'Si la decodificación está incompleta, la captura de tiempo sin procesar aún estará disponible aquí para revisarla y guardarla.';

  @override
  String get learningModeSaveCapture => 'Guardar captura';

  @override
  String get learningModeReviewTipTitle => '¿Adónde irá esto después?';

  @override
  String get learningModeReviewTipBody =>
      'El siguiente paso de implementación debe conectar este panel de revisión al botón Crear y a los controles remotos existentes para que la señal aprendida llegue directamente a su biblioteca.';

  @override
  String get learningModeFinishPreview => 'Finalizar vista previa';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interacción';

  @override
  String get interactionSubtitle => 'Respuesta táctil y diseño del mando';

  @override
  String get hapticFeedbackTitle => 'Respuesta háptica';

  @override
  String get hapticFeedbackSubtitle => 'Vibrar al tocar y al ejecutar acciones';

  @override
  String get forceInAppVibrationTitle => 'Forzar vibración en la app';

  @override
  String get forceInAppVibrationSubtitle =>
      'Usar el vibrador directamente aunque la respuesta táctil del sistema esté desactivada';

  @override
  String get forceInAppVibrationWarning =>
      'Opción avanzada. La app puede vibrar aunque la respuesta táctil de Android esté desactivada globalmente.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'Android system vibration is disabled. Force in-app vibration cannot override it on this device.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'This device reports no vibrator hardware, so in-app vibration cannot work.';

  @override
  String get intensity => 'Intensidad';

  @override
  String get intensityLight => 'Claro';

  @override
  String get intensityMedium => 'Media';

  @override
  String get intensityStrong => 'Fuerte';

  @override
  String get flipRemoteDefaultTitle => 'Invertir vista del mando por defecto';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Abre las pantallas del mando giradas 180° (para dongles USB montados abajo).';

  @override
  String get remoteViewFlipped => 'La vista del mando se abrirá invertida.';

  @override
  String get remoteViewNormal => 'La vista del mando se abrirá normal.';

  @override
  String get backupTitle => 'Copia';

  @override
  String get backupSubtitle => 'Importar/exportar mandos y macros';

  @override
  String get importBackup => 'Importar copia';

  @override
  String get importBackupSubtitle =>
      'Importa copia de mandos/macros o archivos de Flipper Zero, LIRC o IRPLUS';

  @override
  String get bulkImportFolder => 'Importar carpeta';

  @override
  String get bulkImportFolderSubtitle =>
      'Importar varios mandos desde una carpeta';

  @override
  String get exportBackup => 'Exportar copia';

  @override
  String get exportBackupSubtitle =>
      'Guardar mandos + macros como un JSON en Descargas';

  @override
  String get restoreDemoRemotes => 'Restaurar mandos demo';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Reemplazar los mandos actuales por la demo integrada';

  @override
  String get deleteAllRemotes => 'Eliminar todos los mandos';

  @override
  String get deleteAllRemotesSubtitle =>
      'Eliminar todos los mandos de este dispositivo';

  @override
  String get backupTip =>
      'Consejo: exporta una copia antes de grandes cambios. La importación admite copias completas, copias JSON antiguas de mandos y archivos .ir de Flipper Zero.';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get aboutSubtitle =>
      'Información de la app y detalles de código abierto';

  @override
  String aboutAppNameWithCreator(Object creator) {
    return 'IR Blaster - $creator';
  }

  @override
  String versionLabel(Object version) {
    return 'Versión $version';
  }

  @override
  String get sourceCode => 'Código fuente';

  @override
  String get viewOnGitHub => 'Ver en GitHub';

  @override
  String get repositoryUrlCopied => 'URL del repositorio copiada';

  @override
  String get reportIssue => 'Reportar problema';

  @override
  String get reportIssueSubtitle => 'Errores y solicitudes de funciones';

  @override
  String get issuesUrlCopied => 'URL de issues copiada';

  @override
  String get license => 'Licencia';

  @override
  String get openSourceLicense => 'Licencia de código abierto';

  @override
  String get licenseUrlCopied => 'URL de la licencia copiada';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Visitar nuestro sitio web';

  @override
  String get companyUrlCopied => 'URL de la empresa copiada';

  @override
  String get licenses => 'Licencias';

  @override
  String get openSourceLicenses => 'Licencias de código abierto';

  @override
  String byCreator(Object creator) {
    return 'por $creator';
  }

  @override
  String get deviceControlsTitle => 'Controles del dispositivo';

  @override
  String get deviceControlsSubtitle =>
      'Mostrar botones favoritos en la página de controles del sistema';

  @override
  String get manageFavorites => 'Gestionar favoritos';

  @override
  String get manageFavoritesSubtitle =>
      'Elige qué botones aparecen en controles del dispositivo';

  @override
  String get quickSettingsTitle => 'Ajustes rápidos';

  @override
  String get quickSettingsSubtitle =>
      'Añade mosaicos para accesos de encendido y volumen';

  @override
  String get configureTiles => 'Configurar mosaicos';

  @override
  String get configureTilesSubtitle => 'Asignar mosaicos a botones del mando';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Ciclo universal de encendido para dispositivos propios';

  @override
  String get openTvKill => 'Abrir TVKill';

  @override
  String get openTvKillSubtitle =>
      'Ciclar códigos de encendido (úsalo solo en dispositivos propios)';

  @override
  String get failedToLoadTransmitterSettings =>
      'No se pudieron cargar los ajustes del emisor.';

  @override
  String get usbStatusReady =>
      'El dongle USB está conectado y listo para enviar IR.';

  @override
  String get usbStatusPermissionRequired =>
      'Dongle USB detectado. Pide permiso USB y acepta el aviso del sistema.';

  @override
  String get usbStatusPermissionDenied =>
      'Se negó el permiso USB para el dongle conectado. Pídelo otra vez y acepta el aviso.';

  @override
  String get usbStatusPermissionGranted =>
      'El permiso USB fue concedido. El dongle aún debe iniciarse antes de poder enviar IR.';

  @override
  String get usbStatusOpenFailed =>
      'El permiso USB fue concedido, pero no se pudo iniciar el dongle. Reconéctalo e inténtalo otra vez.';

  @override
  String get usbStatusNoDevice => 'No se detectó un dongle IR USB compatible.';

  @override
  String get usbSelectPermissionRequired =>
      'Se detectó un dongle USB, pero no está autorizado. Toca \"Pedir permiso USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'Se negó el permiso USB. Toca \"Pedir permiso USB\" y acepta el aviso.';

  @override
  String get usbSelectPermissionGranted =>
      'El permiso USB fue concedido, pero el dongle aún no se ha iniciado. Prueba a reconectarlo.';

  @override
  String get usbSelectOpenFailed =>
      'El permiso USB fue concedido, pero no se pudo iniciar el dongle. Reconéctalo e inténtalo otra vez.';

  @override
  String get usbSelectNoDevice =>
      'No supported USB IR dongle detected. Plug it in, then tap \"Request USB permiso\".';

  @override
  String get usbSelectReady => 'El dongle USB está listo.';

  @override
  String get autoSwitchEnabledMessage =>
      'Cambio automático activado: usa USB si está conectado; si no, Interno.';

  @override
  String get autoSwitchDisabledMessage =>
      'Cambio automático desactivado: la selección del emisor ahora es manual.';

  @override
  String get failedToUpdateAutoSwitch =>
      'No se pudo actualizar el ajuste de cambio automático.';

  @override
  String get failedToSwitchTransmitter => 'No se pudo cambiar el emisor.';

  @override
  String get deviceHasNoInternalIr =>
      'Este dispositivo no tiene emisor IR integrado.';

  @override
  String get audioModeEnabledMessage =>
      'Modo audio activado. Usa el volumen multimedia al máximo y un adaptador LED de audio a IR.';

  @override
  String get usbPermissionRequestSent => 'Solicitud de permiso USB enviada.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Solicitud de permiso USB enviada. Acepta el aviso para activar USB.';

  @override
  String get usbAlreadyReady => 'El dongle USB ya está iniciado y listo.';

  @override
  String get failedToRequestUsbPermission => 'No se pudo pedir el permiso USB.';

  @override
  String get transmitterHelpInternal =>
      'Usa el emisor IR integrado del teléfono para enviar comandos.';

  @override
  String get transmitterHelpUsb =>
      'Usa un dongle IR USB (requiere permiso) para enviar comandos.';

  @override
  String get transmitterHelpAudio1 =>
      'Usa la salida de audio (mono). Requiere un adaptador LED de audio a IR y volumen multimedia alto.';

  @override
  String get transmitterHelpAudio2 =>
      'Usa la salida de audio (estéreo). Usa dos canales para un mejor control LED con adaptadores compatibles.';

  @override
  String get transmitterInternal => 'IR interno';

  @override
  String get transmitterUsb => 'Dongle IR USB';

  @override
  String get transmitterAudio1 => 'Audio (1 LED)';

  @override
  String get transmitterAudio2 => 'Audio (2 LED)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'No se pudieron cargar las capacidades del emisor.';

  @override
  String get selectedTransmitter => 'Emisor seleccionado';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Activo: $active';
  }

  @override
  String get refresh => 'Actualizar';

  @override
  String get autoSwitchTitle => 'Cambio auto';

  @override
  String get autoSwitchDisabledWhileAudio => 'Desactivado al usar modo Audio';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Usa USB si está conectado; si no, Interno';

  @override
  String get unavailableOnThisDevice => 'No disponible en este dispositivo';

  @override
  String get openOnUsbAttachTitle => 'Abrir al conectar USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'Android puede sugerir abrir la app cuando se conecta un dongle IR USB compatible.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Sugerirá abrir IR Blaster al conectar un dongle USB compatible.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'No sugerirá abrir al conectar USB.';

  @override
  String get failedToUpdateSetting => 'No se pudo actualizar el ajuste.';

  @override
  String get unnamedButton => 'Botón sin nombre';

  @override
  String get iconFallback => 'Icono';

  @override
  String get remoteListReorderHint =>
      'Modo reordenar: mantén pulsado y arrastra una tarjeta para moverla.';

  @override
  String get deleteRemoteTitle => '¿Eliminar mando?';

  @override
  String deleteRemoteMessage(Object name) {
    return '\"$name\" se eliminará permanentemente. Esta acción no se puede deshacer.';
  }

  @override
  String get delete => 'Eliminar';

  @override
  String get addToDeviceControlsTitle => '¿Añadir a Controles del dispositivo?';

  @override
  String get addToDeviceControlsDescription =>
      'Acceso rápido en los controles del sistema.';

  @override
  String get skip => 'Omitir';

  @override
  String get add => 'Añadir';

  @override
  String get addedToDeviceControls => 'Añadido a Controles del dispositivo.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Se eliminó \"$name\". Esta acción no se puede deshacer.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    return '$count botón(es) · $layout';
  }

  @override
  String get layoutComfort => 'Cómodo';

  @override
  String get layoutCompact => 'Compacto';

  @override
  String get open => 'Abrir';

  @override
  String get useThisRemote => 'Usar este mando';

  @override
  String get edit => 'Editar';

  @override
  String get editRemoteSubtitle => 'Renombrar y editar botones';

  @override
  String get thisCannotBeUndone => 'Esto no se puede deshacer';

  @override
  String get searchRemotes => 'Buscar mandos';

  @override
  String get reorderRemotes => 'Reordenar mandos';

  @override
  String get addRemote => 'Añadir mando';

  @override
  String get more => 'Más';

  @override
  String get reorderMode => 'Modo reordenar';

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
  String get noRemotesYet => 'Aún no hay mandos';

  @override
  String get noRemotesDescription =>
      'Crea un mando para empezar a enviar códigos IR.';

  @override
  String get noRemotesNextStep =>
      'Siguiente paso: toca Añadir mando y luego añade tus primeros botones.';

  @override
  String get actions => 'Acciones';

  @override
  String get macrosTitle => 'Macros';

  @override
  String get help => 'Ayuda';

  @override
  String get createMacro => 'Crear macro';

  @override
  String get timedMacrosTitle => 'Macros temporizadas';

  @override
  String get timedMacrosSubtitle =>
      'Automatiza secuencias de comandos IR con temporización precisa';

  @override
  String get timedMacrosNextStep =>
      'Siguiente paso: toca Crear tu primera macro, elige un mando y añade comandos y pausas.';

  @override
  String get macroFeatureToysTitle => 'Perfecto para juguetes interactivos';

  @override
  String get macroFeatureToysDescription =>
      'Controla dispositivos como perros robot i-cybie, robots i-sobot y otros juguetes que necesitan tiempo entre comandos para procesar acciones.';

  @override
  String get macroFeatureTimingTitle => 'Control preciso del tiempo';

  @override
  String get macroFeatureTimingDescription =>
      'Añade pausas entre comandos (de 250 ms a duraciones personalizadas) para que tu dispositivo responda antes de la siguiente acción.';

  @override
  String get macroFeatureManualTitle => 'Pasos con continuación manual';

  @override
  String get macroFeatureManualDescription =>
      'Pausa la ejecución y espera tu confirmación cuando la animación varía o necesitas confirmación visual.';

  @override
  String get exampleUseCase => 'Ejemplo de uso';

  @override
  String get macroExampleText =>
      'Modo avanzado de i-cybie:\n1. Enviar comando \"Mode\"\n2. Esperar 1000 ms (el juguete procesa)\n3. Enviar \"Action 1\"\n4. Esperar 1000 ms\n5. Enviar \"Action 2\"\n…y así sucesivamente de forma automática.';

  @override
  String get createFirstMacro => 'Crea tu primera macro';

  @override
  String get noRemote => 'Sin mando';

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
  String get aboutTimedMacros => 'Sobre las macros temporizadas';

  @override
  String get aboutTimedMacrosDescription =>
      'Las macros temporizadas te permiten automatizar secuencias de comandos IR con pausas precisas entre pasos.';

  @override
  String get sendCommand => 'Enviar comando';

  @override
  String get sendCommandDescription => 'Transmite un comando IR de tu mando.';

  @override
  String get delay => 'Pausa';

  @override
  String get delayDescription =>
      'Espera una duración indicada (p. ej. 1000 ms) antes del siguiente paso.';

  @override
  String get manualContinue => 'Continuación manual';

  @override
  String get manualContinueDescription =>
      'Pausa la ejecución hasta que toques Continuar (útil para animaciones de duración variable).';

  @override
  String get gotIt => 'Entendido';

  @override
  String get failedToSaveMacros => 'No se pudieron guardar las macros.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Se eliminó \"$name\".';
  }

  @override
  String get undo => 'Deshacer';

  @override
  String get failedToRestoreMacro => 'No se pudo restaurar la macro.';

  @override
  String get deleteMacroTitle => '¿Eliminar macro?';

  @override
  String get deleteMacroMessage =>
      'Puedes deshacer esto desde el próximo mensaje.';

  @override
  String get noRemotesAvailable => 'No hay mandos disponibles.';

  @override
  String remoteButtonCountSummary(int count) {
    return '$count botón(es)';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Orientación: invertida (toca para normal)';

  @override
  String get remoteOrientationNormalTooltip =>
      'Orientación: normal (toca para invertir)';

  @override
  String get stopLoop => 'Detener bucle';

  @override
  String get reorderButtons => 'Reordenar botones';

  @override
  String get remoteReorderHint =>
      'Modo reordenar: mantén pulsado y arrastra un botón para moverlo.';

  @override
  String get manageRemote => 'Gestionar mando';

  @override
  String get remoteNoButtons => 'No hay botones en este mando';

  @override
  String get remoteNoButtonsDescription =>
      'Usa \"Editar mando\" para añadir o configurar botones.';

  @override
  String get editRemote => 'Editar mando';

  @override
  String get editRemoteActionsSubtitle =>
      'Renombrar, reordenar y editar botones';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Se actualizó \"$name\".';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Se añadió \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Botón duplicado.';

  @override
  String get loopRunningForButton => 'El bucle está activo para este botón.';

  @override
  String get loopTip => 'Consejo: usa Bucle para repetir hasta detenerlo.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Código copiado.';

  @override
  String get copyCode => 'Copiar código';

  @override
  String get startLoop => 'Iniciar bucle';

  @override
  String get editButtonSubtitle =>
      'Modificar etiqueta, código, protocolo y frecuencia';

  @override
  String get newButton => 'Nuevo botón';

  @override
  String get newButtonSubtitle => 'Crear un nuevo botón después de este';

  @override
  String get duplicate => 'Duplicar';

  @override
  String get duplicateButtonSubtitle => 'Crear una copia de este botón';

  @override
  String get removeFromDeviceControls => 'Quitar de Controles del dispositivo';

  @override
  String get addToDeviceControls => 'Añadir a Controles del dispositivo';

  @override
  String get deviceControlsButtonSubtitle =>
      'Muestra este botón en los controles del dispositivo del sistema';

  @override
  String get removedFromDeviceControls =>
      'Quitado de Controles del dispositivo.';

  @override
  String get pinQuickTile => 'Fijar en favoritos de mosaicos';

  @override
  String get unpinQuickTile => 'Quitar de favoritos de mosaicos';

  @override
  String get quickTileButtonSubtitle =>
      'Muestra este botón arriba del selector de mosaicos';

  @override
  String get removedFromQuickTileFavorites =>
      'Quitado de favoritos de mosaicos.';

  @override
  String get pinnedToQuickTileFavorites => 'Fijado en favoritos de mosaicos.';

  @override
  String get duplicateAndEdit => 'Duplicar y editar';

  @override
  String get duplicateAndEditSubtitle =>
      'Crear una copia y editarla al instante';

  @override
  String get done => 'Listo';

  @override
  String get run => 'Ejecutar';

  @override
  String get untitledRemote => 'Mando sin título';

  @override
  String get createRemoteTitle => 'Crear mando';

  @override
  String get editRemoteTitle => 'Editar mando';

  @override
  String get removeButtonTitle => '¿Quitar botón?';

  @override
  String get imageButtonRemovedMessage => 'Este botón de imagen se eliminará.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return 'Se eliminará \"$name\".';
  }

  @override
  String get remove => 'Quitar';

  @override
  String importedButtonCount(int count) {
    return 'Se importaron $count botón(es).';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Se importaron $count botón(es) desde mandos existentes.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Cambiar etiqueta, señal y ajustes avanzados';

  @override
  String get createButtonCopySubtitle => 'Crear una copia de este botón';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Crear una copia y editarla al instante';

  @override
  String get undoAvailableInNextSnackbar =>
      'Puedes deshacerlo desde el próximo mensaje';

  @override
  String get buttonRemoved => 'Botón quitado.';

  @override
  String get remoteNameCannotBeEmpty =>
      'El nombre del mando no puede estar vacío.';

  @override
  String get saveRemote => 'Guardar mando';

  @override
  String get remoteName => 'Nombre del mando';

  @override
  String get remoteNameHint => 'p. ej., TV, aire acondicionado, tira LED';

  @override
  String get remoteNameHelper => 'Este nombre aparece en tu lista de mandos.';

  @override
  String get layoutStyle => 'Estilo de diseño';

  @override
  String get layoutWideDescription =>
      'Ancho: botones de 2 columnas con detalles extra (recomendado).';

  @override
  String get layoutCompactDescription =>
      'Compacto: cuadrícula clásica 4× (solo iconos/texto).';

  @override
  String get importFromRemotes => 'Importar desde mandos';

  @override
  String get importFromDatabase => 'Importar de BD';

  @override
  String get addButton => 'Añadir botón';

  @override
  String get noButtonsYet => 'Aún no hay botones';

  @override
  String get createRemoteEmptyStateDescription =>
      'Añade tu primer botón y luego mantén pulsado para editar o quitar.';

  @override
  String get createButtonTitle => 'Crear botón';

  @override
  String get editButtonTitle => 'Editar botón';

  @override
  String failedToLoadProtocols(Object error) {
    return 'No se pudieron cargar los protocolos: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'No se pudieron cargar las teclas de la base de datos: $error';
  }

  @override
  String get presetPower => 'Enc.';

  @override
  String get presetVolume => 'Volumen';

  @override
  String get presetChannel => 'Canal';

  @override
  String get presetNavigation => 'Navegación';

  @override
  String get all => 'Todo';

  @override
  String get completeRequiredFieldsToSave =>
      'Completa los campos obligatorios para guardar';

  @override
  String get buttonLabelStepTitle => 'Etiqueta del botón';

  @override
  String get buttonLabelStepSubtitle =>
      'Elige una imagen, un icono o escribe una etiqueta.';

  @override
  String get buttonColorStepTitle => 'Color del botón';

  @override
  String get buttonColorStepSubtitle =>
      'Elige un color de fondo para este botón.';

  @override
  String get selectColor => 'Selecciona color:';

  @override
  String get noImageSelected => 'No hay imagen seleccionada';

  @override
  String get gallery => 'Galería';

  @override
  String get builtIn => 'Integrado';

  @override
  String get removeImage => 'Quitar imagen';

  @override
  String get requiredSelectImageOrSwitch =>
      'Obligatorio: selecciona una imagen, elige un icono o cambia a Texto.';

  @override
  String get iconSelected => 'Icono seleccionado';

  @override
  String get noIconSelected => 'No hay icono seleccionado';

  @override
  String get chooseIcon => 'Elegir icono';

  @override
  String get removeIcon => 'Quitar icono';

  @override
  String get requiredSelectIconOrSwitch =>
      'Obligatorio: selecciona un icono o cambia a Imagen/Texto.';

  @override
  String get buttonText => 'Texto del botón';

  @override
  String get buttonTextHint => 'p. ej., Enc., Volumen +, HDMI 1';

  @override
  String get buttonTextHelper => 'Este texto aparecerá en el botón.';

  @override
  String get requiredEnterButtonLabel => 'Obligatorio: introduce una etiqueta.';

  @override
  String get defaultColorName => 'Predeterminado';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Se creó un mando nuevo con un botón del último acierto.';

  @override
  String get selectRemote => 'Seleccionar mando';

  @override
  String remoteNumber(Object id) {
    return 'Mando n.º $id';
  }

  @override
  String get newRemoteCreated => 'Mando nuevo creado.';

  @override
  String get failedToCreateRemote => 'No se pudo crear el mando.';

  @override
  String get newRemoteEllipsis => 'Nuevo mando…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Añadido a $name.';
  }

  @override
  String get failedToAddToRemote => 'No se pudo añadir al mando.';

  @override
  String get newRemoteDefaultName => 'Nuevo mando';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Saltó al desplazamiento $offset. En pausa, pulsa Reanudar para seguir.';
  }

  @override
  String get sent => 'Enviado.';

  @override
  String failedToSend(Object error) {
    return 'No se pudo enviar: $error';
  }

  @override
  String get copiedProtocolCode => 'Copiado (protocolo:código).';

  @override
  String get savedToResults => 'Guardado en Resultados.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Código no válido para el protocolo: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Candidato actual copiado.';

  @override
  String get jumpToOffset => 'Saltar al desplazamiento';

  @override
  String get jumpToBruteCursor => 'Saltar al cursor de fuerza bruta';

  @override
  String get jump => 'Saltar';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Saltó al cursor 0x$cursor. En pausa, pulsa Reanudar para seguir.';
  }

  @override
  String get irSignalTester => 'Probador de señal IR';

  @override
  String get stop => 'Detener';

  @override
  String get selectButton => 'Seleccionar botón';

  @override
  String get buttonNotFoundInRemotes =>
      'No se encontró el botón en los mandos.';

  @override
  String sentNamed(Object name) {
    return 'Se envió \"$name\".';
  }

  @override
  String sendFailed(Object error) {
    return 'Envío fallido: $error';
  }

  @override
  String get noFavoritesYet => 'Aún no hay favoritos';

  @override
  String get deviceControlsEmptyHint =>
      'Mantén pulsado un botón del mando y selecciona “Añadir a Controles del dispositivo”.';

  @override
  String get sendTest => 'Enviar prueba';

  @override
  String get testSendCompleted => 'Prueba de envío completada.';

  @override
  String testSendFailed(Object error) {
    return 'La prueba de envío falló: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Se quitó \"$name\".';
  }

  @override
  String get brand => 'Marca';

  @override
  String get model => 'Modelo';

  @override
  String get selectBrand => 'Seleccionar marca';

  @override
  String get searchBrand => 'Buscar marca…';

  @override
  String get selectModel => 'Seleccionar modelo';

  @override
  String get searchModel => 'Buscar modelo…';

  @override
  String get unnamedKey => 'Tecla sin nombre';

  @override
  String get unknown => 'Desconocido';

  @override
  String get emDash => '-';

  @override
  String get searchCommands => 'Buscar comandos';

  @override
  String get noMatchingCommands => 'No hay comandos coincidentes';

  @override
  String get quickTileFavoritesTitle => 'Favoritos de mosaicos';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Cambiar asignación del mosaico $tileLabel';
  }

  @override
  String get pickDifferentButton => 'Elige un botón distinto';

  @override
  String get browseAllRemotesEllipsis => 'Explorar todos los mandos…';

  @override
  String get invalidMacroFileFormat => 'Formato de archivo de macro no válido.';

  @override
  String get failedToParseMacroFile =>
      'No se pudo analizar el archivo de macro.';

  @override
  String get deviceCodeLabel => 'Código de dispositivo';

  @override
  String get commandLabel => 'Comando';

  @override
  String get editButtonCodeTitle => 'Editar código del botón';

  @override
  String get thisRemoteHasNoButtons => 'Este mando no tiene botones.';

  @override
  String get selectCommand => 'Seleccionar comando';

  @override
  String get databaseModeAutofillHint =>
      'El modo Base de datos completa el Paso 2 por ti (marca + modelo + protocolo). Tras importar una tecla, puedes ajustar todo en Manual.';

  @override
  String get test => 'Probar';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Todos los botones elegidos eran duplicados.';

  @override
  String get noButtonsImported => 'No se importó ningún botón.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Se importaron $addedCount botón(es). Se omitieron $skippedCount duplicado(s).';
  }

  @override
  String get importAllMatchingTitle =>
      '¿Importar todos los botones coincidentes?';

  @override
  String get noMatchingKeysFound => 'No se encontraron teclas coincidentes.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Esto importará hasta $count teclas coincidentes de la selección actual de la base de datos.';
  }

  @override
  String get importAll => 'Importar todo';

  @override
  String get importingButtons => 'Importando botones…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Todos los botones coincidentes eran duplicados.';

  @override
  String get quickPresets => 'Ajustes rápidos';

  @override
  String get selectDeviceFirst => 'Selecciona primero un dispositivo';

  @override
  String get searchByLabelOrHex => 'Buscar por etiqueta o hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Opcional: afina las teclas predefinidas de $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Selecciona primero marca, modelo y protocolo.';

  @override
  String get importFromDatabaseTitle => 'Importar de la base de datos';

  @override
  String get importFromDatabaseSubtitle =>
      'Elige un dispositivo, carga las teclas coincidentes y luego importa los botones seleccionados.';

  @override
  String get deviceAndFilters => 'Dispositivo y filtros';

  @override
  String loadedCount(int count) {
    return '$count cargados';
  }

  @override
  String get hideFilters => 'Ocultar filtros';

  @override
  String get showFilters => 'Mostrar filtros';

  @override
  String get noProtocolFoundForBrandModel =>
      'No se encontró un protocolo para esta marca y modelo.';

  @override
  String get protocolAutoDetected => 'Protocolo';

  @override
  String get protocolAutoDetectedHelper =>
      'Detectado automáticamente desde la base de datos. Puedes cambiarlo antes de importar.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Selecciona una marca, modelo y protocolo para cargar teclas.';

  @override
  String get noKeysFound => 'No se encontraron teclas.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'No se encontraron teclas para “$query”.';
  }

  @override
  String get skipDuplicates => 'Omitir duplicados';

  @override
  String get skipDuplicatesSubtitle =>
      'No importes botones que ya existan en este mando.';

  @override
  String get importSelected => 'Importar seleccionados';

  @override
  String get noMacrosToExport => 'No hay macros para exportar.';

  @override
  String get macrosExportedToDownloads => 'Macros exportadas a Descargas.';

  @override
  String get failedToExportMacros => 'No se pudieron exportar las macros.';

  @override
  String get failedToReadFile => 'No se pudo leer el archivo.';

  @override
  String get importFromExistingRemotesTitle =>
      'Importar desde mandos existentes';

  @override
  String selectedCount(int count) {
    return '$count seleccionados';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'No se encontraron otros mandos con botones.';

  @override
  String get sourceRemote => 'Mando origen';

  @override
  String get searchButtons => 'Buscar botones';

  @override
  String get searchButtonsHint => 'Enc., Volumen, Silencio...';

  @override
  String get selectVisible => 'Seleccionar visibles';

  @override
  String get clearVisible => 'Limpiar visibles';

  @override
  String protocolNamed(Object name) {
    return 'Protocolo: $name';
  }

  @override
  String get rawSignal => 'Bruto';

  @override
  String get legacyCode => 'Código antiguo';

  @override
  String importCount(int count) {
    return 'Importar $count';
  }

  @override
  String get storagePermissionDeniedLegacy =>
      'Permiso de almacenamiento denegado (necesario en algunos Android antiguos).';

  @override
  String get backupExportedToDownloads => 'Copia exportada a Descargas.';

  @override
  String failedToExport(Object error) {
    return 'No se pudo exportar: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Se importaron $count mandos de una copia JSON antigua. Las macros no cambiaron.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Importación fallida: \"remotes\" debe ser una lista JSON si existe.';

  @override
  String get importFailedMacrosMustBeList =>
      'Importación fallida: \"macros\" debe ser una lista JSON si existe.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Importación fallida: formato de copia no válido (se esperaba una List antigua o un Map con remotes/macros).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Se importaron $remoteCount mandos de la copia. Las macros no cambiaron.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Se importaron $remoteCount mandos y $macroCount macros de la copia.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Importación fallida: no se encontraron botones válidos en el archivo .ir.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Se importó 1 mando desde Flipper .ir. Las macros no cambiaron.';

  @override
  String get importFailedInvalidIrplus =>
      'Importación fallida: archivo irplus no válido (no se encontraron botones válidos).';

  @override
  String get importedOneRemoteFromIrplus =>
      'Se importó 1 mando desde irplus. Las macros no cambiaron.';

  @override
  String get importFailedInvalidLirc =>
      'Importación fallida: archivo LIRC no válido (no se encontraron códigos válidos/brutos).';

  @override
  String get importedOneRemoteFromLirc =>
      'Se importó 1 mando desde una config LIRC. Las macros no cambiaron.';

  @override
  String get unsupportedFileTypeSelected =>
      'Se seleccionó un tipo de archivo no compatible.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Importación fallida: archivo no válido o ilegible.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Importación masiva completada: no se encontraron archivos compatibles en la carpeta.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Importación masiva completada: no se importaron mandos. Se omitieron $skippedCount archivo(s).';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Importación masiva completada: se importaron $importedCount mando(s) de $supportedCount archivo(s) compatible(s). Se omitieron $skippedCount archivo(s).';
  }

  @override
  String get storagePermissionDenied => 'Permiso de almacenamiento denegado.';

  @override
  String get bulkImportFailedReadFolder =>
      'Importación masiva fallida: no se pudo leer el contenido de la carpeta.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Importación masiva completada: no se encontraron archivos compatibles ($sourceLabel).';
  }

  @override
  String get clearAction => 'Limpiar';

  @override
  String get saveAction => 'Guardar';

  @override
  String buttonsTitleCount(int count) {
    return 'Botones ($count)';
  }

  @override
  String get invalidStepEncountered => 'Se encontró un paso no válido';

  @override
  String failedToSendNamed(Object name) {
    return 'No se pudo enviar: $name';
  }

  @override
  String get buttonNotFound => 'Botón no encontrado';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Botón no encontrado: $name';
  }

  @override
  String get unknownButton => 'Botón desconocido';

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
      'Orientación: invertida (toca para normal)';

  @override
  String get orientationNormalTooltip =>
      'Orientación: normal (toca para invertir)';

  @override
  String get noSteps => 'Sin pasos';

  @override
  String stepProgress(int current, int total) {
    return 'Paso $current / $total';
  }

  @override
  String get completed => 'Completado';

  @override
  String get paused => 'En pausa';

  @override
  String get running => 'En curso';

  @override
  String get ready => 'Listo';

  @override
  String stepsProgress(int current, int total) {
    return '$current / $total pasos';
  }

  @override
  String get waiting => 'Esperando';

  @override
  String secondsRemaining(Object seconds) {
    return 'Quedan ${seconds}s';
  }

  @override
  String millisecondsShort(int ms) {
    return '${ms}ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Toca Continuar cuando estés listo para el siguiente paso';

  @override
  String get error => 'Error';

  @override
  String get macroCompleted => 'Macro Completado';

  @override
  String finishedIn(Object duration) {
    return 'Terminado en $duration';
  }

  @override
  String get sequence => 'Secuencia';

  @override
  String waitMilliseconds(int ms) {
    return 'Esperar ${ms}ms';
  }

  @override
  String get runAgain => 'Ejecutar de nuevo';

  @override
  String get startMacro => 'Iniciar Macro';

  @override
  String get continueAction => 'Continuar';

  @override
  String get unnamedRemote => 'Unnamed Mando';

  @override
  String get enterMacroName => 'Introduce un nombre para la macro';

  @override
  String get addAtLeastOneStep => 'Añade al menos un paso';

  @override
  String get fixInvalidSteps => 'Corrige los pasos no válidos';

  @override
  String get unknownCommand => 'Desconocido Command';

  @override
  String get unnamedCommand => 'Comando sin nombre';

  @override
  String get iconCommand => 'Comando de icono';

  @override
  String get selectDelay => 'Seleccionar Delay';

  @override
  String keepMilliseconds(int ms) {
    return 'Mantener: ${ms}ms';
  }

  @override
  String get custom => 'Personalizado';

  @override
  String get enterCustomDelayDuration =>
      'Introduce una duración personalizada de pausa';

  @override
  String millisecondsLong(int ms) {
    return '$ms milisegundos';
  }

  @override
  String secondsLong(Object seconds, Object plural) {
    return '$seconds segundo$plural';
  }

  @override
  String get customDelay => 'Pausa personalizada';

  @override
  String get delayMillisecondsLabel => 'Pausa (milisegundos)';

  @override
  String get delayMillisecondsHint => 'p. ej., 3000';

  @override
  String get recommendedDelayRange =>
      'Recommended: 250-5000ms for most dispositivos';

  @override
  String get enterValidPositiveNumber => 'Introduce un número positivo válido';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Mando';

  @override
  String get macroName => 'Nombre de la macro';

  @override
  String get macroNameHint => 'e.g., i-cybie Advanced Modo';

  @override
  String stepsTitleCount(int count) {
    return 'Pasos ($count)';
  }

  @override
  String get noStepsYet => 'Aún no hay pasos';

  @override
  String get addCommandsAndDelaysHint =>
      'Añade abajo comandos y pausas para crear tu secuencia';

  @override
  String get addStep => 'Añadir paso';

  @override
  String get reorderStepsHint =>
      'Consejo: arrastra el asa para reordenar pasos. Toca un paso para editarlo.';

  @override
  String reorderStep(int index) {
    return 'Reordenar paso $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Mantén pulsado y arrastra para cambiar el orden de los pasos';

  @override
  String deleteStep(int index) {
    return 'Eliminar paso $index';
  }

  @override
  String get invalidStepTapToFix => 'Paso no válido - toca para corregir';

  @override
  String get sendIrCommand => 'Enviar comando IR';

  @override
  String get waitForUserConfirmation => 'Esperar confirmación del usuario';

  @override
  String get notImplemented => 'No implementado';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Ancho';

  @override
  String get iconButton => 'Icon botón';

  @override
  String get imageButton => 'Image botón';

  @override
  String get noSignalInfo => 'Sin info de señal';

  @override
  String get proceed => 'Continuar';

  @override
  String get discard => 'Descartar';

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
  String get idle => 'Inactivo';

  @override
  String get start => 'Iniciar';

  @override
  String get resume => 'Reanudar';

  @override
  String get pause => 'Pausa';

  @override
  String get stopped => 'Detenido';

  @override
  String get copy => 'Copiar';

  @override
  String get send => 'Enviar';

  @override
  String get step => 'Paso';

  @override
  String get addToRemote => 'Añadir al mando';

  @override
  String get noDescriptionAvailable => 'No hay descripción disponible.';

  @override
  String get notAvailableSymbol => '-';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'El proveedor Kaseikyo debe tener exactamente 4 dígitos hex.';

  @override
  String get irFinderDatabaseNotReady => 'La base de datos aún no está lista.';

  @override
  String get irFinderSelectBrandFirst =>
      'Selecciona primero una marca en Configuración.';

  @override
  String get irFinderBruteforceUnavailable =>
      'La fuerza bruta aún no está disponible para este protocolo.';

  @override
  String get irFinderInvalidPrefix => 'Prefijo no válido.';

  @override
  String irFinderBrandValue(Object value) {
    return 'Marca: $value';
  }

  @override
  String irFinderModelValue(Object value) {
    return 'Modelo: $value';
  }

  @override
  String irFinderKeyValue(Object value) {
    return 'Tecla: $value';
  }

  @override
  String irFinderRemoteNumber(Object value) {
    return 'Mando n.º $value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Introduce un índice base 0 dentro de los resultados filtrados y ordenados.';

  @override
  String get irFinderJumpCursorHelper =>
      'Introduce un cursor hex base 0 dentro del espacio de fuerza bruta.';

  @override
  String get irFinderSetupTab => 'Configuración';

  @override
  String get irFinderTestTab => 'Probar';

  @override
  String get irFinderResultsTab => 'Resultados';

  @override
  String get irFinderContinueToTest => 'Continuar a Prueba';

  @override
  String get irFinderKaseikyoVendorTitle => 'Proveedor Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'Proveedor personalizado (4 hex)';

  @override
  String get irFinderBrowseDbCandidates => 'Explorar candidatos de BD…';

  @override
  String get irFinderEditSetup => 'Editar configuración';

  @override
  String get irFinderNoSavedHits =>
      'Aún no hay aciertos guardados. En la página Prueba, pulsa \"Guardar acierto\" cuando el dispositivo responda.';

  @override
  String get irFinderBackToTest => 'Volver a Prueba';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Espacio de búsqueda grande';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Este espacio de fuerza bruta es muy grande ($human posibilidades). IR Finder respetará tus intentos máximos y la espera, pero evita saturar dispositivos IR.\n\nRecomendación: usa primero el modo Base de datos y/o introduce bytes de prefijo conocidos para reducir el espacio.';
  }

  @override
  String get irFinderDatabaseSession => 'Sesión de base de datos';

  @override
  String get irFinderBruteforceSession => 'Sesión de fuerza bruta';

  @override
  String get irFinderResumeLastSession => 'Reanudar última sesión';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Marca: $brand · Modelo: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Prefijo: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Progreso: $progress · Inicio: $when';
  }

  @override
  String get irFinderApplyResume => 'Aplicar y reanudar';

  @override
  String get irFinderBruteforceMode => 'Fuerza bruta';

  @override
  String get irFinderDatabaseAssistedMode => 'Asistido por BD';

  @override
  String irFinderProtocolTitle(Object name) {
    return 'Protocolo: $name';
  }

  @override
  String get irFinderProtocolLabel => 'Protocolo IR';

  @override
  String get irFinderProtocolHelper =>
      'Controla la codificación y por tanto el espacio de búsqueda.';

  @override
  String get irFinderKnownPrefixLabel =>
      'Prefijo conocido (bytes hex, opcional)';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Carga: $digits dígito(s) hex';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Carga: $digits dígito(s) hex · Ejemplo: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Carga: $digits dígito(s) hex · Prefijo máx.: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Carga: $digits dígito(s) hex · Ejemplo: $example · Prefijo máx.: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Ejemplo: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Introduce los primeros bytes conocidos para reducir el espacio de búsqueda.';

  @override
  String get irFinderDatabaseMode => 'Base de datos';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Prefijo normalizado: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Prefijo normalizado';

  @override
  String get irFinderBruteforceNotConfigured =>
      'La fuerza bruta aún no está configurada para este protocolo.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Todo ($value)';
  }

  @override
  String get irFinderTestControls => 'Controles de prueba';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Longitud de carga: $digits dígito(s) hex.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Espacio de búsqueda: $value posibilidades (tras las restricciones del prefijo).';
  }

  @override
  String get irFinderCooldownMs => 'Espera (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Intentos máx. (por ejecución)';

  @override
  String get irFinderTestAllCombinations => 'Probar todas las combinaciones';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Se ejecuta hasta agotar el espacio de búsqueda. Límite efectivo: $value';
  }

  @override
  String get irFinderAttempts => 'Intentos';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Rango del deslizador: 1–$max (escribe cualquier número para valores mayores)';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Máx.\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Límite efectivo en esta ejecución: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Consejo: usa primero el modo Base de datos; la fuerza bruta va mejor con un prefijo conocido (por ejemplo, los primeros 1–4 bytes).';

  @override
  String get irFinderDatabaseInitFailed =>
      'Falló la inicialización de la base de datos.';

  @override
  String get irFinderPreparingDatabase =>
      'Preparando base local de códigos IR…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Búsqueda asistida por BD';

  @override
  String get irFinderBrand => 'Marca';

  @override
  String get irFinderSelectBrand => 'Seleccionar marca';

  @override
  String get irFinderModelOptional => 'Modelo (opcional)';

  @override
  String get irFinderSelectBrandFirstShort => 'Selecciona primero una marca';

  @override
  String get irFinderSelectModelRecommended =>
      'Selecciona un modelo (recomendado)';

  @override
  String get irFinderOnlySelectedProtocol => 'Solo protocolo seleccionado';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Filtra las teclas al protocolo elegido. Desactívalo para ver todos los protocolos.';

  @override
  String get irFinderQuickWinsFirst => 'Aciertos rápidos primero';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Prioriza teclas tipo POWER, MUTE, VOL y CH antes que otras más profundas.';

  @override
  String get irFinderMaxKeysPerRun => 'Teclas máx. a probar (por ejecución)';

  @override
  String get irFinderTesting => 'Probando…';

  @override
  String get irFinderCooldown => 'Espera';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'Modo';

  @override
  String get irFinderRetryLast => 'Reintentar la última';

  @override
  String get irFinderTrigger => 'Disparar';

  @override
  String get irFinderJump => 'Saltar…';

  @override
  String get irFinderSaveHit => 'Guardar acierto';

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
    return 'Último código probado: $value';
  }

  @override
  String get irFinderStartTestingToSeeLastCode =>
      'Empieza la prueba para ver el último código intentado.';

  @override
  String irFinderFromDb(Object value) {
    return 'De BD: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'De fuerza bruta (generado por el codificador de protocolo).';

  @override
  String irFinderSendError(Object error) {
    return 'Error de envío: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Origen: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Los resultados permiten Probar y Copiar al instante. La integración directa para añadir al mando puede ampliarse luego en el editor.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Explorar candidatos de BD';

  @override
  String get irFinderFilterByLabelOrHex => 'Filtrar por etiqueta o hex…';

  @override
  String get irFinderJumpHere => 'Saltar aquí';

  @override
  String get irFinderSelectModel => 'Seleccionar modelo';

  @override
  String get irFinderSearchBrands => 'Buscar marcas…';

  @override
  String get irFinderSearchModels => 'Buscar modelos…';

  @override
  String get iconPickerTitle => 'Seleccionar icono';

  @override
  String get iconPickerSearchHint => 'Buscar iconos...';

  @override
  String get iconPickerNoIconsFound => 'No se encontraron iconos';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count iconos disponibles';
  }

  @override
  String get iconPickerCategoryAll => 'Todo';

  @override
  String get iconPickerCategoryMedia => 'Medios';

  @override
  String get iconPickerCategoryVolume => 'Volumen';

  @override
  String get iconPickerCategoryNavigation => 'Navegación';

  @override
  String get iconPickerCategoryPower => 'Enc.';

  @override
  String get iconPickerCategoryNumbers => 'Números';

  @override
  String get iconPickerCategorySettings => 'Ajustes';

  @override
  String get iconPickerCategoryDisplay => 'Pantalla';

  @override
  String get iconPickerCategoryInput => 'Entrada';

  @override
  String get iconPickerCategoryFavorite => 'Favorito';

  @override
  String get universalPowerTitle => 'Encendido universal';

  @override
  String get universalPowerRunTab => 'Ejecutar';

  @override
  String get universalPowerUseResponsibly => 'Úsalo con responsabilidad';

  @override
  String get universalPowerConsentBody =>
      'Encendido universal cicla códigos IR de encendido. Úsalo solo en dispositivos que posees o controlas. Deténlo en cuanto el dispositivo responda.';

  @override
  String get universalPowerConsentCheckbox => 'Poseo o controlo el dispositivo';

  @override
  String get universalPowerSetupBody =>
      'Cicla códigos de encendido para la marca elegida. Deténlo en cuanto el dispositivo responda.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Último enviado: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'No se encontraron códigos de encendido. Intenta ampliar la búsqueda.';

  @override
  String get universalPowerUnableToStart => 'No se pudo iniciar.';

  @override
  String get universalPowerAllBrands => 'Todas las marcas (sin filtro)';

  @override
  String get universalPowerClearBrandFilter => 'Limpiar filtro de marca';

  @override
  String get universalPowerBroadenSearch => 'Amplía la búsqueda si hace falta';

  @override
  String get universalPowerBroadenSearchHint =>
      'Si no se encuentran etiquetas de encendido, incluye otras teclas.';

  @override
  String get universalPowerAdditionalPatternsDepth =>
      'Profundidad de patrones extra';

  @override
  String get universalPowerDepth1 => 'Solo prioridad: POWER/OFF';

  @override
  String get universalPowerDepth2 => 'Incluir alias de POWER';

  @override
  String get universalPowerDepth3 =>
      'Incluir etiquetas secundarias de encendido';

  @override
  String get universalPowerDepth4 =>
      'Incluir todas las etiquetas (menor prioridad)';

  @override
  String get universalPowerLoopUntilStopped => 'Repetir hasta detener';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Sigue ciclando la cola hasta que la detengas.';

  @override
  String get universalPowerDelayBetweenCodes => 'Pausa entre códigos';

  @override
  String get universalPowerStart => 'Iniciar Encendido universal';

  @override
  String get universalPowerRunStatus => 'Estado de ejecución';

  @override
  String universalPowerProgress(Object value) {
    return 'Progreso: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'En pausa porque la app pasó a segundo plano.';

  @override
  String get universalPowerSendOneCode => 'Enviar un código';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Deténlo en cuanto el dispositivo responda.';

  @override
  String get iconNamePlay => 'Reproducir';

  @override
  String get iconNamePause => 'Pausa';

  @override
  String get iconNameStop => 'Detener';

  @override
  String get iconNameFastForward => 'Avance rápido';

  @override
  String get iconNameRewind => 'Rebobinar';

  @override
  String get iconNameSkipNext => 'Siguiente';

  @override
  String get iconNameSkipPrevious => 'Anterior';

  @override
  String get iconNameReplay => 'Repetir';

  @override
  String get iconNameForward10S => 'Adelante 10s';

  @override
  String get iconNameForward30S => 'Adelante 30s';

  @override
  String get iconNameReplay10S => 'Repetir 10s';

  @override
  String get iconNameReplay30S => 'Repetir 30s';

  @override
  String get iconNameRecord => 'Grabar';

  @override
  String get iconNameRecordAlt => 'Grabar Alt';

  @override
  String get iconNameEject => 'Expulsar';

  @override
  String get iconNameShuffle => 'Aleatorio';

  @override
  String get iconNameRepeat => 'Repetir';

  @override
  String get iconNameRepeatOne => 'Repetir una';

  @override
  String get iconNameVolumeUp => 'Volumen Arriba';

  @override
  String get iconNameVolumeDown => 'Volumen Abajo';

  @override
  String get iconNameVolumeOff => 'Volumen Apagado';

  @override
  String get iconNameMute => 'Sil.';

  @override
  String get iconNameSpeaker => 'Altavoz';

  @override
  String get iconNameSurroundSound => 'Envolvente Sonido';

  @override
  String get iconNameEqualizer => 'Ecualizador';

  @override
  String get iconNameAudio => 'Audio';

  @override
  String get iconNameMicrophone => 'Micrófono';

  @override
  String get iconNameMicOff => 'Mic Apagado';

  @override
  String get iconNameUp => 'Arriba';

  @override
  String get iconNameDown => 'Abajo';

  @override
  String get iconNameLeft => 'Izquierda';

  @override
  String get iconNameRight => 'Derecha';

  @override
  String get iconNameArrowUp => 'Flecha Arriba';

  @override
  String get iconNameArrowDown => 'Flecha Abajo';

  @override
  String get iconNameArrowLeft => 'Flecha Izquierda';

  @override
  String get iconNameArrowRight => 'Flecha Derecha';

  @override
  String get iconNameNavigation => 'Navegación';

  @override
  String get iconNameChevronLeft => 'Chevron Izquierda';

  @override
  String get iconNameChevronRight => 'Chevron Derecha';

  @override
  String get iconNameExpandLess => 'Expandir Menos';

  @override
  String get iconNameExpandMore => 'Expandir Más';

  @override
  String get iconNameCollapse => 'Contraer';

  @override
  String get iconNameExpand => 'Expandir';

  @override
  String get iconNameCircleUp => 'Círculo Arriba';

  @override
  String get iconNameCircleDown => 'Círculo Abajo';

  @override
  String get iconNameCircleLeft => 'Círculo Izquierda';

  @override
  String get iconNameCircleRight => 'Círculo Derecha';

  @override
  String get iconNameOkSelect => 'OK/Seleccionar';

  @override
  String get iconNameConfirm => 'Confirmar';

  @override
  String get iconNameCancel => 'Cancelar';

  @override
  String get iconNameClose => 'Cerrar';

  @override
  String get iconNameHome => 'Inicio';

  @override
  String get iconNameReturn => 'Volver';

  @override
  String get iconNameExit => 'Salir';

  @override
  String get iconNameUndo => 'Deshacer';

  @override
  String get iconNameRedo => 'Rehacer';

  @override
  String get iconNamePower => 'Enc.';

  @override
  String get iconNamePowerAlt => 'Encendido Alt';

  @override
  String get iconNamePowerOff => 'Power Apagado';

  @override
  String get iconNameOn => 'Encendido';

  @override
  String get iconNameOff => 'Apagado';

  @override
  String get iconNameToggleOn => 'Alternar encendido';

  @override
  String get iconNameToggleOff => 'Alternar apagado';

  @override
  String get iconNameRestart => 'Reiniciar';

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
  String get iconNameOne => 'Una';

  @override
  String get iconNameTwo => 'Dos';

  @override
  String get iconNameThree => 'Tres';

  @override
  String get iconNameFour => 'Cuatro';

  @override
  String get iconNameFive => 'Cinco';

  @override
  String get iconNameSix => 'Seis';

  @override
  String get iconNamePlus => 'Más';

  @override
  String get iconNameMinus => 'Menos';

  @override
  String get iconNameAddCircle => 'Añadir círculo';

  @override
  String get iconNameRemoveCircle => 'Remove Círculo';

  @override
  String get iconNameSettings => 'Ajustes';

  @override
  String get iconNameMenu => 'Menú';

  @override
  String get iconNameMoreVertical => 'Más Vertical';

  @override
  String get iconNameMoreHorizontal => 'Más Horizontal';

  @override
  String get iconNameTune => 'Ajuste';

  @override
  String get iconNameRemoteSettings => 'Mando Ajustes';

  @override
  String get iconNameInfo => 'Información';

  @override
  String get iconNameInfoOutline => 'Información contorno';

  @override
  String get iconNameHelp => 'Ayuda';

  @override
  String get iconNameHelpOutline => 'Ayuda Contorno';

  @override
  String get iconNameList => 'Lista';

  @override
  String get iconNameViewList => 'Vista List';

  @override
  String get iconNameViewGrid => 'Vista Cuadrícula';

  @override
  String get iconNameApps => 'Apps';

  @override
  String get iconNameWidgets => 'Widgets';

  @override
  String get iconNameTv => 'TV';

  @override
  String get iconNameMonitor => 'Monitor';

  @override
  String get iconNameDesktop => 'Escritorio';

  @override
  String get iconNameBrightnessHigh => 'Brillo alto';

  @override
  String get iconNameBrightnessMedium => 'Brillo medio';

  @override
  String get iconNameBrightnessLow => 'Brillo bajo';

  @override
  String get iconNameAutoBrightness => 'Brillo automático';

  @override
  String get iconNameLightMode => 'Luz Modo';

  @override
  String get iconNameDarkMode => 'Dark Modo';

  @override
  String get iconNameContrast => 'Contraste';

  @override
  String get iconNameHdrOn => 'HDR encendido';

  @override
  String get iconNameHdrOff => 'HDR Apagado';

  @override
  String get iconNameAspectRatio => 'Relación de aspecto';

  @override
  String get iconNameCrop => 'Recortar';

  @override
  String get iconNameZoomIn => 'Acercar';

  @override
  String get iconNameZoomOut => 'Alejar';

  @override
  String get iconNameFullscreen => 'Pantalla completa';

  @override
  String get iconNameExitFullscreen => 'Exit Pantalla completa';

  @override
  String get iconNameFitScreen => 'Ajustar pantalla';

  @override
  String get iconNamePip => 'PiP';

  @override
  String get iconNameCropFree => 'Recortar Free';

  @override
  String get iconNameInput => 'Entrada';

  @override
  String get iconNameCable => 'Cable';

  @override
  String get iconNameCast => 'Transmitir';

  @override
  String get iconNameCastConnected => 'Transmitir Connected';

  @override
  String get iconNameScreenShare => 'Screen Compartir';

  @override
  String get iconNameBluetooth => 'Bluetooth';

  @override
  String get iconNameWifi => 'WiFi';

  @override
  String get iconNameRouter => 'Router';

  @override
  String get iconNameMemory => 'Memoria';

  @override
  String get iconNameGameConsole => 'Consola de juegos';

  @override
  String get iconNameGaming => 'Juegos';

  @override
  String get iconNameMedia => 'Medios';

  @override
  String get iconNameMusicQueue => 'Música Cola';

  @override
  String get iconNameVideoLibrary => 'Biblioteca de video';

  @override
  String get iconNamePhotoLibrary => 'Foto Library';

  @override
  String get iconNameComponent => 'Componente';

  @override
  String get iconNameHdmi => 'HDMI';

  @override
  String get iconNameComposite => 'Compuesto';

  @override
  String get iconNameAntenna => 'Antena';

  @override
  String get iconNameFavorite => 'Favorito';

  @override
  String get iconNameFavoriteOutline => 'Favorito Contorno';

  @override
  String get iconNameStar => 'Estrella';

  @override
  String get iconNameStarOutline => 'Estrella contorno';

  @override
  String get iconNameBookmark => 'Marcador';

  @override
  String get iconNameBookmarkOutline => 'Marcador contorno';

  @override
  String get iconNameFlag => 'Bandera';

  @override
  String get iconNameCheck => 'Marca';

  @override
  String get iconNameDone => 'Listo';

  @override
  String get iconNameDoneAll => 'Hecho Todo';

  @override
  String get iconNameSchedule => 'Programación';

  @override
  String get iconNameTimer => 'Temporizador';

  @override
  String get iconNameTime => 'Tiempo';

  @override
  String get iconNameAlarm => 'Alarma';

  @override
  String get iconNameNotifications => 'Notificaciones';

  @override
  String get iconNameLock => 'Bloqueo';

  @override
  String get iconNameUnlock => 'Desbloquear';

  @override
  String get iconNameLight => 'Claro';

  @override
  String get iconNameLightOutline => 'Luz Contorno';

  @override
  String get iconNameWarmLight => 'Cálida Luz';

  @override
  String get iconNameSunny => 'Soleado';

  @override
  String get iconNameCloudy => 'Nublado';

  @override
  String get iconNameNight => 'Noche';

  @override
  String get iconNameFlare => 'Destello';

  @override
  String get iconNameGradient => 'Degradado';

  @override
  String get iconNameInvertColors => 'Invertir Colores';

  @override
  String get iconNamePalette => 'Paleta';

  @override
  String get iconNameColor => 'Color';

  @override
  String get iconNameTonality => 'Tonalidad';

  @override
  String get iconNameSearch => 'Buscar';

  @override
  String get iconNameRefresh => 'Actualizar';

  @override
  String get iconNameSync => 'Sincronizar';

  @override
  String get iconNameUpdate => 'Actualizar';

  @override
  String get iconNameDownload => 'Descargar';

  @override
  String get iconNameUpload => 'Subir';

  @override
  String get iconNameCloud => 'Nube';

  @override
  String get iconNameFolder => 'Carpeta';

  @override
  String get iconNameDelete => 'Eliminar';

  @override
  String get iconNameEdit => 'Editar';

  @override
  String get iconNameSave => 'Guardar';

  @override
  String get iconNameShare => 'Compartir';

  @override
  String get iconNamePrint => 'Imprimir';

  @override
  String get iconNameLanguage => 'Idioma';

  @override
  String get iconNameTranslate => 'Traducir';

  @override
  String get iconNameMicNone => 'Mic Ninguno';

  @override
  String get iconNameSubtitles => 'Subtítulos';

  @override
  String get iconNameClosedCaption => 'Subtítulos cerrados';

  @override
  String get iconNameMusic => 'Música';

  @override
  String get iconNameMovie => 'Película';

  @override
  String get iconNameTheater => 'Teatro';

  @override
  String get iconNameLiveTv => 'En vivo TV';

  @override
  String get iconNameRadio => 'Radio';

  @override
  String get iconNameCamera => 'Cámara';

  @override
  String get iconNameVideoCamera => 'Video Cámara';

  @override
  String get iconNamePhotoCamera => 'Foto Cámara';

  @override
  String get iconNameSlowMotion => 'Lento Movimiento';

  @override
  String get iconNameSpeed => 'Velocidad';

  @override
  String get iconNameVideoSettings => 'Video Ajustes';

  @override
  String get iconNameAudioTrack => 'Pista de audio';

  @override
  String get iconNameGraphicEq => 'Gráfico EQ';

  @override
  String get iconNameMusicVideo => 'Música Video';

  @override
  String get iconNamePlaylist => 'Lista';

  @override
  String get iconNameQueue => 'Cola';

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
  String get iconNamePercentFa => 'Porcentaje % FA';

  @override
  String get iconNameDivideFa => 'Dividir ÷ FA';

  @override
  String get iconNameMultiplyFa => 'Multiplicar × FA';

  @override
  String get iconNameEqualsFa => 'Igual = FA';

  @override
  String get iconNameNotEqualFa => 'Distinto ≠ FA';

  @override
  String get iconNameGreaterThanFa => 'Mayor que > FA';

  @override
  String get iconNameLessThanFa => 'Menos Than < FA';

  @override
  String get iconNameAsteriskFa => 'Asterisco * FA';

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
  String get iconNamePlayFa => 'Reproducir FA';

  @override
  String get iconNamePauseFa => 'Pausa FA';

  @override
  String get iconNameStopFa => 'Detener FA';

  @override
  String get iconNamePlayFaOutline => 'Reproducir FA Contorno';

  @override
  String get iconNamePauseFaOutline => 'Pausa FA Contorno';

  @override
  String get iconNameStopFaOutline => 'Detener FA Contorno';

  @override
  String get iconNameBackwardFa => 'Atrás FA';

  @override
  String get iconNameForwardFa => 'Adelante FA';

  @override
  String get iconNamePreviousFa => 'Anterior FA';

  @override
  String get iconNameNextFa => 'Siguiente FA';

  @override
  String get iconNameRewindFa => 'Rebobinar FA';

  @override
  String get iconNameFastForwardFa => 'Avance rápido FA';

  @override
  String get iconNameRepeatFa => 'Repetir FA';

  @override
  String get iconNameShuffleFa => 'Aleatorio FA';

  @override
  String get iconNameEjectFa => 'Expulsar FA';

  @override
  String get iconNameFilmFa => 'Película FA';

  @override
  String get iconNameVideoFa => 'Video FA';

  @override
  String get iconNameMusicFa => 'Música FA';

  @override
  String get iconNameMicrophoneFa => 'Micrófono FA';

  @override
  String get iconNameCameraFa => 'Cámara FA';

  @override
  String get iconNameCameraRetroFa => 'Cámara Retro FA';

  @override
  String get iconNameVolumeHighFa => 'Volumen alto FA';

  @override
  String get iconNameVolumeLowFa => 'Volumen bajo FA';

  @override
  String get iconNameVolumeOffFa => 'Volumen Apagado FA';

  @override
  String get iconNameMuteFa => 'Silencio FA';

  @override
  String get iconNameMicMuteFa => 'Mic silenciado FA';

  @override
  String get iconNameHeadphonesFa => 'Auriculares FA';

  @override
  String get iconNameSpeakerFa => 'Altavoz FA';

  @override
  String get iconNameUpFa => 'Arriba FA';

  @override
  String get iconNameDownFa => 'Abajo FA';

  @override
  String get iconNameLeftFa => 'Izquierda FA';

  @override
  String get iconNameRightFa => 'Derecha FA';

  @override
  String get iconNameUpFaOutline => 'Arriba FA Contorno';

  @override
  String get iconNameDownFaOutline => 'Abajo FA Contorno';

  @override
  String get iconNameLeftFaOutline => 'Izquierda FA Contorno';

  @override
  String get iconNameRightFaOutline => 'Derecha FA Contorno';

  @override
  String get iconNameArrowUpFa => 'Flecha Arriba FA';

  @override
  String get iconNameArrowDownFa => 'Flecha Abajo FA';

  @override
  String get iconNameArrowLeftFa => 'Flecha Izquierda FA';

  @override
  String get iconNameArrowRightFa => 'Flecha Derecha FA';

  @override
  String get iconNameChevronUpFa => 'Chevron Arriba FA';

  @override
  String get iconNameChevronDownFa => 'Chevron Abajo FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron Izquierda FA';

  @override
  String get iconNameChevronRightFa => 'Chevron Derecha FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Contorno';

  @override
  String get iconNameCheckFa => 'Marca FA';

  @override
  String get iconNameCloseFa => 'Cerrar FA';

  @override
  String get iconNameCloseCircleFa => 'Close Círculo FA';

  @override
  String get iconNameHomeFa => 'Inicio FA';

  @override
  String get iconNameUndoFa => 'Deshacer FA';

  @override
  String get iconNameRedoFa => 'Rehacer FA';

  @override
  String get iconNameRotateFa => 'Girar FA';

  @override
  String get iconNameSearchFa => 'Buscar FA';

  @override
  String get iconNameRefreshFa => 'Actualizar FA';

  @override
  String get iconNamePowerOffFa => 'Power Apagado FA';

  @override
  String get iconNamePlugFa => 'Enchufe FA';

  @override
  String get iconNameToggleOnFa => 'Alternar encendido FA';

  @override
  String get iconNameToggleOffFa => 'Alternar apagado FA';

  @override
  String get iconNameSettingsFa => 'Ajustes FA';

  @override
  String get iconNameSettingsAltFa => 'Ajustes Alt FA';

  @override
  String get iconNameMenuFa => 'Menú FA';

  @override
  String get iconNameMoreFa => 'Más FA';

  @override
  String get iconNameMoreVerticalFa => 'Más Vertical FA';

  @override
  String get iconNameInfoFa => 'Información FA';

  @override
  String get iconNameInfoFaOutline => 'Información FA contorno';

  @override
  String get iconNameHelpFa => 'Ayuda FA';

  @override
  String get iconNameHelpFaOutline => 'Ayuda FA Contorno';

  @override
  String get iconNameListFa => 'Lista FA';

  @override
  String get iconNameGridFa => 'Cuadrícula FA';

  @override
  String get iconNameSlidersFa => 'Deslizadores FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'Monitor FA';

  @override
  String get iconNameDesktopFa => 'Escritorio FA';

  @override
  String get iconNameBrightnessFa => 'Brillo FA';

  @override
  String get iconNameNightModeFa => 'Noche Modo FA';

  @override
  String get iconNameLightFa => 'Luz FA';

  @override
  String get iconNameLightFaOutline => 'Luz FA Contorno';

  @override
  String get iconNameFlashFa => 'Flash FA';

  @override
  String get iconNameFullscreenFa => 'Pantalla completa FA';

  @override
  String get iconNameExitFullscreenFa => 'Exit Pantalla completa FA';

  @override
  String get iconNameZoomInFa => 'Acercar FA';

  @override
  String get iconNameZoomOutFa => 'Alejar FA';

  @override
  String get iconNameSubtitlesFa => 'Subtítulos FA';

  @override
  String get iconNamePictureInPictureFa => 'Imagen en imagen FA';

  @override
  String get iconNameColorFa => 'Color FA';

  @override
  String get iconNamePaintFa => 'Pintura FA';

  @override
  String get iconNameInputFa => 'Entrada FA';

  @override
  String get iconNameWifiFa => 'WiFi FA';

  @override
  String get iconNameBluetoothFa => 'Bluetooth FA';

  @override
  String get iconNameUsbFa => 'USB FA';

  @override
  String get iconNameEthernetFa => 'Ethernet FA';

  @override
  String get iconNameGamepadFa => 'Mando FA';

  @override
  String get iconNameBroadcastFa => 'Emisión FA';

  @override
  String get iconNameSatelliteFa => 'Satellite FA';

  @override
  String get iconNameAntennaFa => 'Antenna FA';

  @override
  String get iconNameNetworkFa => 'Red FA';

  @override
  String get iconNameCloudFa => 'Nube FA';

  @override
  String get iconNameStarFa => 'Estrella FA';

  @override
  String get iconNameStarFaOutline => 'Estrella FA contorno';

  @override
  String get iconNameHeartFa => 'Corazón FA';

  @override
  String get iconNameHeartFaOutline => 'Heart FA Contorno';

  @override
  String get iconNameBookmarkFa => 'Marcador FA';

  @override
  String get iconNameBookmarkFaOutline => 'Marcador FA contorno';

  @override
  String get iconNameFlagFa => 'Bandera FA';

  @override
  String get iconNameClockFa => 'Reloj FA';

  @override
  String get iconNameClockFaOutline => 'Clock FA Contorno';

  @override
  String get iconNameBellFa => 'Campana FA';

  @override
  String get iconNameBellFaOutline => 'Bell FA Contorno';

  @override
  String get iconNameTimerFa => 'Temporizador FA';

  @override
  String get iconNameLockFa => 'Bloqueo FA';

  @override
  String get iconNameUnlockFa => 'Desbloquear FA';

  @override
  String get iconNameGalleryFa => 'Galería FA';

  @override
  String get iconNameImagesFa => 'Imágenes FA';

  @override
  String get iconNameImageFa => 'Imagen FA';

  @override
  String get iconNameVideoFileFa => 'Archivo de video FA';

  @override
  String get iconNameAudioFileFa => 'Archivo de audio FA';

  @override
  String get iconNamePlayOutlineFa => 'Reproducir Contorno FA';

  @override
  String get iconNamePlaySimpleFa => 'Reproducir simple FA';

  @override
  String get iconNamePauseSimpleFa => 'Pausa simple FA';

  @override
  String get iconNameStopSimpleFa => 'Detener simple FA';

  @override
  String get iconNameRecordFa => 'Grabar FA';

  @override
  String get iconNameStopCircleFa => 'Detener Círculo FA';

  @override
  String get iconNameLoadingFa => 'Cargando FA';

  @override
  String get iconNameTextFa => 'Texto FA';

  @override
  String get iconNameTextSizeFa => 'Texto Tamaño FA';

  @override
  String get iconNameLanguageFa => 'Idioma FA';

  @override
  String get iconNameGlobeFa => 'Globo FA';

  @override
  String get iconNameSubtitlesAltFa => 'Subtítulos Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Subtítulos Alt Contorno FA';

  @override
  String get iconNameChannelUpFa => 'Canal Arriba FA';

  @override
  String get iconNameChannelDownFa => 'Canal Abajo FA';

  @override
  String get iconNamePageUpFa => 'Página Arriba FA';

  @override
  String get iconNamePageDownFa => 'Página Abajo FA';

  @override
  String get iconNameGuideFa => 'Guía FA';

  @override
  String get iconNameGridViewFa => 'Cuadrícula Vista FA';

  @override
  String get iconNameGridAltFa => 'Cuadrícula Alt FA';

  @override
  String get iconNameScheduleFa => 'Programación FA';

  @override
  String get iconNameCalendarFa => 'Calendario FA';

  @override
  String get iconNameRedButtonFa => 'Rojo Botón FA';

  @override
  String get iconNameButtonOutlineFa => 'Botón Contorno FA';

  @override
  String get iconNameSquareButtonFa => 'Cuadrado Botón FA';

  @override
  String get iconNameSquareOutlineFa => 'Cuadrado Contorno FA';

  @override
  String get iconNameDotCircleFa => 'Punto Círculo FA';

  @override
  String get iconNameToolsFa => 'Herramientas FA';

  @override
  String get iconNameScrewdriverFa => 'Destornillador FA';

  @override
  String get iconNameHammerFa => 'Martillo FA';

  @override
  String get iconNameToolboxFa => 'Caja de herramientas FA';

  @override
  String get iconNameCogFa => 'Engrane FA';

  @override
  String get iconNameAdjustFa => 'Ajustar FA';

  @override
  String get iconNameFilterFa => 'Filtro FA';

  @override
  String get iconNameSortDownFa => 'Ordenar Abajo FA';

  @override
  String get iconNameSortUpFa => 'Ordenar Arriba FA';

  @override
  String get iconNameSleepFa => 'Reposo FA';

  @override
  String get iconNameTimerStartFa => 'Temporizador Iniciar FA';

  @override
  String get iconNameTimerHalfFa => 'Temporizador Mitad FA';

  @override
  String get iconNameTimerEndFa => 'Temporizador Fin FA';

  @override
  String get iconNameStopwatchFa => 'Cronómetro FA';

  @override
  String get iconNameAlarmFa => 'Alarma FA';

  @override
  String get iconNameCropAltFa => 'Recortar Alt FA';

  @override
  String get iconNameCropFa => 'Recortar FA';

  @override
  String get iconNameSquareFullFa => 'Cuadrado Completo FA';

  @override
  String get iconNameFullscreenAltFa => 'Pantalla completa Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Zoom Más FA';

  @override
  String get iconNameZoomMinusFa => 'Zoom Menos FA';

  @override
  String get iconNameMusicNoteFa => 'Música Nota FA';

  @override
  String get iconNameCdFa => 'CD FA';

  @override
  String get iconNameVinylFa => 'Vinilo FA';

  @override
  String get iconNameRssFa => 'RSS FA';

  @override
  String get iconNameMagicFa => 'Mágico FA';

  @override
  String get iconNameFingerprintFa => 'Huella FA';

  @override
  String get iconNameUserFa => 'Usuario FA';

  @override
  String get iconNameUsersFa => 'Usuarios FA';

  @override
  String get iconNameChildModeFa => 'Niño Modo FA';

  @override
  String get iconNameCastFa => 'Transmitir FA';

  @override
  String get iconNameStreamFa => 'Flujo FA';

  @override
  String get iconNameSignalFa => 'Señal FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => 'Círculo Flecha Arriba FA';

  @override
  String get iconNameCircleArrowDownFa => 'Círculo Flecha Abajo FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Círculo Flecha Izquierda FA';

  @override
  String get iconNameCircleArrowRightFa => 'Círculo Flecha Derecha FA';

  @override
  String get iconNameLongArrowUpFa => 'Largo Flecha Arriba FA';

  @override
  String get iconNameLongArrowDownFa => 'Largo Flecha Abajo FA';

  @override
  String get iconNameLongArrowLeftFa => 'Largo Flecha Izquierda FA';

  @override
  String get iconNameLongArrowRightFa => 'Largo Flecha Derecha FA';

  @override
  String get iconNamePlusFa => 'Más FA';

  @override
  String get iconNameMinusFa => 'Menos FA';

  @override
  String get iconNamePlusCircleFa => 'Más Círculo FA';

  @override
  String get iconNameMinusCircleFa => 'Menos Círculo FA';

  @override
  String get iconNamePlusSquareFa => 'Más Cuadrado FA';

  @override
  String get iconNameMinusSquareFa => 'Menos Cuadrado FA';

  @override
  String get iconNameTimesFa => 'Veces FA';

  @override
  String get iconNameTimesCircleFa => 'Veces Círculo FA';

  @override
  String get iconNameBatteryFullFa => 'Batería Completo FA';

  @override
  String get iconNameBattery34Fa => 'Batería 3/4 FA';

  @override
  String get iconNameBatteryHalfFa => 'Batería Mitad FA';

  @override
  String get iconNameBattery14Fa => 'Batería 1/4 FA';

  @override
  String get iconNameBatteryEmptyFa => 'Batería Empty FA';

  @override
  String get iconNameChargingFa => 'Cargando FA';

  @override
  String get iconNameCloudSunFa => 'Nube Sol FA';

  @override
  String get iconNameCloudMoonFa => 'Nube Luna FA';

  @override
  String get iconNameRainFa => 'Lluvia FA';

  @override
  String get iconNameSnowflakeFa => 'Copo FA';

  @override
  String get iconNameFireFa => 'Fuego FA';

  @override
  String get iconNameTemperatureFa => 'Temperatura FA';

  @override
  String get iconNameBoxFa => 'Caja FA';

  @override
  String get iconNameGiftFa => 'Regalo FA';

  @override
  String get iconNameTrophyFa => 'Trofeo FA';

  @override
  String get iconNameCrownFa => 'Corona FA';

  @override
  String get iconNameGemFa => 'Gema FA';

  @override
  String get unknownLabel => 'Desconocido';

  @override
  String get selectedFilesLabel => 'archivo(s) seleccionado(s)';

  @override
  String get folderNotFoundOrInaccessible =>
      'Carpeta no encontrada o inaccesible.';

  @override
  String get importedRemoteDefaultName => 'MandoImportado';

  @override
  String get demoRemoteName => 'Mando demo';

  @override
  String get protocolFieldsInvalid =>
      'Rellena los campos obligatorios del protocolo y asegúrate de que la frecuencia sea 15k–60k si se define.';

  @override
  String get unknownProtocolSelected =>
      'Se seleccionó un protocolo desconocido.';

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
  String get learningModeCaptureFailed => 'La captura de aprendizaje falló.';

  @override
  String get learningModeReplaySent => 'Se reproduce la señal aprendida.';

  @override
  String get learningModeReplayFailed =>
      'La señal aprendida no se pudo reproducir.';

  @override
  String get learningModeNoRemotesAvailable =>
      'Aún no hay controles remotos guardados.';

  @override
  String get learningModeChooseRemoteTitle => 'Elige un control remoto';

  @override
  String get learningModeNewRemoteTitle => 'Crear un nuevo control remoto';

  @override
  String get learningModeSaveSuccess => 'Botón aprendido guardado.';

  @override
  String get learningModeSaveFailed => 'El botón aprendido no se pudo guardar.';

  @override
  String get remoteSetupIntro =>
      'Elige primero un nombre y un diseño. Podrás añadir botones después.';

  @override
  String get startWithDefault => 'Empezar con los valores predeterminados';

  @override
  String get browseGithubStore => 'Explorar GitHub Store';

  @override
  String get addFirstButton => 'Añadir primer botón';

  @override
  String get moreWaysToStart => 'Más formas de empezar';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      '¿Descartar esta nueva configuración del mando y salir de esta pantalla?';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      '¿Descartar los cambios del mando y salir de esta pantalla?';

  @override
  String get firstButtonAdded => 'Primer botón añadido.';

  @override
  String get iconColorTitle => 'Color del icono';

  @override
  String get iconColorHelper =>
      'Elige un color para el símbolo que siga siendo visible sobre el fondo del botón.';

  @override
  String get colorRed => 'Rojo';

  @override
  String get colorPink => 'Rosa';

  @override
  String get colorPurple => 'Morado';

  @override
  String get colorDeepPurple => 'Morado oscuro';

  @override
  String get colorIndigo => 'Índigo';

  @override
  String get colorBlue => 'Azul';

  @override
  String get colorLightBlue => 'Azul claro';

  @override
  String get colorCyan => 'Cian';

  @override
  String get colorTeal => 'Verde azulado';

  @override
  String get colorGreen => 'Verde';

  @override
  String get colorLightGreen => 'Verde claro';

  @override
  String get colorLime => 'Lima';

  @override
  String get colorYellow => 'Amarillo';

  @override
  String get colorAmber => 'Ámbar';

  @override
  String get colorOrange => 'Naranja';

  @override
  String get colorDeepOrange => 'Naranja oscuro';

  @override
  String get colorBrown => 'Marrón';

  @override
  String get colorGrey => 'Gris';

  @override
  String get colorBlueGrey => 'Gris azulado';

  @override
  String get colorBlack => 'Negro';

  @override
  String get colorWhite => 'Blanco';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Color del botón $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Color del botón $colorName, seleccionado';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Color del icono $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Color del icono $colorName, seleccionado';
  }
}
