// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'A carregar…';

  @override
  String get unknownError => 'Erro desconhecido';

  @override
  String get failedToStart => 'Falha ao iniciar';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get quickTilePower => 'Ligar/desligar';

  @override
  String get quickTileMute => 'Silenciar';

  @override
  String get quickTileVolumeUp => 'Vol +';

  @override
  String get quickTileVolumeDown => 'Vol -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Adaptador IR USB detetado. Autorize o acesso USB para enviar comandos.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'O acesso USB foi negado. Volte a pedir permissão e autorize o acesso para enviar comandos.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'O acesso USB está autorizado, mas o adaptador ainda não está pronto.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Não foi possível ligar ao adaptador USB, apesar de o acesso estar autorizado. Desligue-o, volte a ligá-lo e tente novamente.';

  @override
  String get homeUsbReadyMessage => 'Adaptador IR USB pronto.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Este telemóvel não tem emissor IR integrado e não está ligado nenhum adaptador IR USB compatível.';

  @override
  String get homeUsbOptionPlugIn =>
      'Ligue um adaptador IR USB compatível e autorize o acesso.';

  @override
  String get homeUsbOptionReady => 'Pronto para enviar.';

  @override
  String get homeUsbOptionPermissionRequired =>
      'Ligado. Autorize o acesso USB.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Acesso negado. Volte a pedir permissão.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Acesso autorizado. A aguardar o adaptador.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Falha na ligação. Volte a ligar o adaptador.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Sem emissor IR integrado. Utilize um adaptador IR USB compatível ou um acessório de áudio para IR.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Ligado. Autorize o acesso USB.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Acesso negado. Volte a pedir permissão.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Acesso autorizado. A aguardar o adaptador.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Falha na ligação. Volte a ligar o adaptador.';

  @override
  String get homeHardwareBannerReady => 'Pronto para enviar.';

  @override
  String get homeHardwareRequiredTitle => 'É necessário um emissor IR';

  @override
  String get homeUsbDongleRecommended => 'Adaptador IR USB (recomendado)';

  @override
  String get homeAudioAdapterAlternative => 'Adaptador IR por áudio';

  @override
  String get homeAudioAdapterDescription =>
      'Requer um adaptador de áudio para IR. Nas definições, escolha Áudio (1 ou 2 LEDs) e aumente o volume multimédia.';

  @override
  String get close => 'Fechar';

  @override
  String get homeChooseTransmitter => 'Escolher emissor';

  @override
  String get openSettings => 'Abrir Definições';

  @override
  String get homeUsbPermissionSentApprove =>
      'Permissão pedida. Autorize o acesso USB na janela do Android.';

  @override
  String get homeUsbDongleNotDetected =>
      'Não foi encontrado um adaptador IR USB compatível. Ligue-o e tente novamente.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Não foi possível pedir acesso USB. Tente novamente.';

  @override
  String get working => 'A processar…';

  @override
  String get requestUsbPermission => 'Pedir acesso USB';

  @override
  String get homeHardwareTip =>
      'Pode preparar os seus comandos agora. Só precisa de um emissor IR para enviar sinais.';

  @override
  String get homeNoIrTransmitterTitle => 'Nenhum emissor IR disponível';

  @override
  String get homeHardwareRequiredBody =>
      'Pode criar e organizar comandos sem um emissor IR. Para controlar um aparelho, utilize uma das opções abaixo.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Pode continuar a criar, importar e organizar comandos.';

  @override
  String get homeWaysToUseIrBlaster => 'Opções de equipamento';

  @override
  String get homeBuiltInIrOptionTitle => 'Emissor IR integrado';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Alguns telemóveis têm um emissor IR integrado. Este telemóvel não tem.';

  @override
  String get homeBuiltInIrUnavailable => 'Não integrado neste telemóvel';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'Adaptador de áudio para IR';

  @override
  String get homeContinueWithoutHardware => 'Continuar sem enviar';

  @override
  String get homeHowItWorks => 'Como funciona';

  @override
  String get settingsNavLabel => 'Definições';

  @override
  String get dismiss => 'Descartar';

  @override
  String get remotesNavLabel => 'Comandos';

  @override
  String get macrosNavLabel => 'Macros';

  @override
  String get signalTesterNavLabel => 'Probador IR';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get remoteNoIrEmitterTitle => 'Emissor IR indisponível';

  @override
  String get remoteNoIrEmitterMessage =>
      'Não foi detetado nenhum emissor IR utilizável.';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Para enviar sinais, precisa de um emissor IR integrado ou de um emissor externo compatível.';

  @override
  String get remoteDismiss => 'Continuar a explorar';

  @override
  String get remoteClose => 'Fechar aplicação';

  @override
  String remoteFailedToSend(Object error) {
    return 'Falha ao enviar IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Não foi possível iniciar o ciclo: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Ciclo parado, envio falhado: $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'A repetir \"$title\". Toque em Parar acima para parar.';
  }

  @override
  String get remoteLoopStopped => 'Ciclo detenido.';

  @override
  String get remoteUpdatedNotFound =>
      'O comando foi atualizado no ecrã. Não foi encontrado na lista guardada.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Foi atualizado \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Não foi possível eliminar o comando: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'Este comando não foi encontrado na lista de comandos guardados.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Comando «$name» eliminado.';
  }

  @override
  String get buttonFallbackTitle => 'Botão';

  @override
  String get imageFallbackTitle => 'Imagem';

  @override
  String get noBrowserAvailable => 'Nenhum navegador disponível';

  @override
  String failedToOpen(Object error) {
    return 'Não foi possível abrir: $error';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get settingsRestoreDemoTitle => 'Restaurar comandos de demonstração?';

  @override
  String get settingsRestoreDemoMessage =>
      'Isto vai substituir os seus comandos atuais pelos comandos de demonstração integrados. Recomenda-se exportar uma cópia se quiser manter a lista atual.';

  @override
  String get settingsRestoreDemoConfirm => 'Restaurar demo';

  @override
  String get settingsDemoRemotesRestored =>
      'Comandos de demonstração restaurados.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Eliminar todos os comandos?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Isto remove todos os comandos deste dispositivo. Esta ação não pode ser anulada.';

  @override
  String get settingsDeleteAllConfirm => 'Eliminar tudo';

  @override
  String get settingsAllRemotesDeleted => 'Todos os comandos foram eliminados.';

  @override
  String get themeAuto => 'Tema auto';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeDescAuto => 'Segue as definições do dispositivo';

  @override
  String get themeDescLight => 'Sempre claro e nítido';

  @override
  String get themeDescDark => 'Descansa a vista';

  @override
  String get themeHintAuto =>
      'O tema muda apenas quando alterna entre modo claro e escuro no dispositivo';

  @override
  String get themeHintLight =>
      'Perfeito para usar de dia e em locais bem iluminados';

  @override
  String get themeHintDark =>
      'Reduz a fadiga visual com pouca luz e poupa bateria em ecrãs OLED';

  @override
  String get supportDevelopmentTitle => 'Apoyar desarrollo';

  @override
  String get supportDevelopmentSubtitle =>
      'Ajuda a manter o IR Blaster e a sua compatibilidade de hardware';

  @override
  String get supportDevelopmentBody =>
      'Sem anúncios, sem rastreio nem funções bloqueadas. O seu apoio financia protocolos, suporte USB e melhor compatibilidade entre dispositivos.';

  @override
  String get donate => 'Donar';

  @override
  String get starRepo => 'Dar estrella';

  @override
  String get repositoryLinkCopied => 'Enlace do repositorio copiado';

  @override
  String get supportPillLocalOnly => 'Apenas local';

  @override
  String get supportPillNoTracking => 'Sem rastreio';

  @override
  String get supportPillHardwareAware => 'Consciente do hardware';

  @override
  String get supportPillOpenSource => 'Código aberto';

  @override
  String get appearanceTitle => 'Apariencia';

  @override
  String get appearanceSubtitle => 'Personalize a experiência visual';

  @override
  String get localizationTitle => 'Idioma';

  @override
  String get localizationSubtitle =>
      'Idioma da app e comportamento da tradução';

  @override
  String localizationAutoUsing(Object language) {
    return 'Auto: usando $language';
  }

  @override
  String get localizationAutoDescription =>
      'A app segue o idioma do dispositivo quando possível.';

  @override
  String get localizationManualDescription =>
      'O idioma da app foi definido manualmente.';

  @override
  String get useSystemLanguageTitle => 'Usar idioma do sistema';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'A seguir o idioma do dispositivo: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Usa o idioma escolhido abaixo em vez do predefinido do dispositivo.';

  @override
  String get chooseAppLanguage => 'Escolher idioma da app';

  @override
  String get languagePickerDisabledHint =>
      'Desative o idioma do sistema para escolher um manualmente.';

  @override
  String get searchLanguages => 'Pesquisar idiomas';

  @override
  String get noLanguagesFound => 'Nenhum idioma correspondente';

  @override
  String get localizationHint =>
      'Se o idioma do sistema estiver ativo, a app segue a configuração regional do dispositivo e usa inglês se faltar uma tradução. Desative-o para fixar um idioma.';

  @override
  String get appLanguageTitle => 'Idioma da app';

  @override
  String get appLanguageHint =>
      'Auto segue o idioma do dispositivo. Escolha aqui inglês ou francês para forçá-lo apenas na app.';

  @override
  String get languageAuto => 'Auto (sistema)';

  @override
  String get languageAutoDescription =>
      'Seguir o idioma do dispositivo automaticamente';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageEnglishDescription => 'Forçar a app a usar sempre inglês';

  @override
  String get languageFrench => 'Francês';

  @override
  String get languageFrenchDescription => 'Forçar a app a usar sempre francês';

  @override
  String get languageAutoShort => 'Auto';

  @override
  String get languageEnglishShort => 'Inglês';

  @override
  String get languageFrenchShort => 'Francês';

  @override
  String get useDynamicColors => 'Usar cores dinâmicas';

  @override
  String get themeChoiceAuto => 'Auto';

  @override
  String get themeChoiceLight => 'Claro';

  @override
  String get themeChoiceDark => 'Escuro';

  @override
  String get irTransmitterTitle => 'Emissor IR';

  @override
  String get irTransmitterSubtitle => 'Escolha que hardware envia comandos IR';

  @override
  String get learningModeEntryTitle => 'Aprendizagem IR';

  @override
  String get learningModeEntrySubtitle =>
      'Copie o sinal IR de um botão do comando.';

  @override
  String get learningModeTitle => 'Aprendizagem IR';

  @override
  String get learningModeHeroTitle => 'Aprenda um botão remoto de forma limpa';

  @override
  String get learningModeHeroSubtitle =>
      'Configure seu receptor, prepare o controle remoto original, capture um comando e revise-o antes de salvá-lo em um controle remoto.';

  @override
  String get learningModeReadyBadge => 'Receptor pronto';

  @override
  String get learningModeNeedsPermissionBadge => 'Permissão USB necessária';

  @override
  String get learningModeSetupBadge => 'Configuração do receptor necessária';

  @override
  String get learningModeNoReceiverBadge => 'Nenhum receptor de aprendizagem';

  @override
  String get learningModeCheckingBadge => 'Verificando hardware';

  @override
  String get learningModeFourStepFlow => 'Fluxo guiado em 4 etapas';

  @override
  String get learningModeSaveAnywhereBadge => 'Revise antes de salvar';

  @override
  String get learningModeGuideTitle => 'Escolha onde a captura deve acontecer';

  @override
  String get learningModeStepHardwareShort => 'Hardware';

  @override
  String get learningModeStepPrepareShort => 'Preparar';

  @override
  String get learningModeStepCaptureShort => 'Capturar';

  @override
  String get learningModeStepReviewShort => 'Análise';

  @override
  String get learningModeStepHardwareTitle =>
      'Verifique o hardware do receptor';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Certifique-se de que um receptor de aprendizagem compatível esteja conectado e autorizado antes de começar.';

  @override
  String get learningModeCurrentSenderLabel => 'Transmissor atual';

  @override
  String get learningModeReceiverStatusLabel => 'Status de aprendizagem';

  @override
  String get learningModeCheckingHardwareBody =>
      'A verificar o emissor e o recetor IR.';

  @override
  String get learningModeHardwareReadyBody =>
      'Um dongle USB IR é conectado e inicializado. Este é o lugar certo para iniciar o fluxo de aprendizagem assim que a fiação de captura estiver conectada.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Permita o acesso ao adaptador USB para iniciar a aprendizagem.';

  @override
  String get learningModeHardwareSetupBody =>
      'O recetor não está pronto. Verifique a configuração ou volte a ligá-lo e tente novamente.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Ligue um recetor IR compatível para aprender sinais.';

  @override
  String get learningModeRefreshHardware => 'Verificar recetor';

  @override
  String get learningModeHardwareTipTitle => 'Melhor colocação';

  @override
  String get learningModeHardwareTipBody =>
      'O Modo de Aprendizagem reside no Transmissor IR porque depende da disponibilidade do hardware e é usado com menos frequência do que o envio de controles remotos.';

  @override
  String get learningModeStepPrepareTitle =>
      'Prepare o controle remoto original';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Decida o que você está aprendendo e mantenha o controle remoto original estável e próximo ao receptor.';

  @override
  String get learningModeButtonNameLabel => 'Nome do botão';

  @override
  String get learningModeButtonNameHint =>
      'Por exemplo: Ligar/Desligar, HDMI 1, Menu';

  @override
  String get learningModeSinglePress => 'Pressão única';

  @override
  String get learningModeHoldButton => 'Botão segurar';

  @override
  String get learningModePreparationChecklistTitle => 'Antes de capturar';

  @override
  String get learningModePreparationItemDistance =>
      'Mantenha o controle remoto original a cerca de 2 a 5 cm do receptor.';

  @override
  String get learningModePreparationItemOneButton =>
      'Aprenda um botão de cada vez e use primeiro um toque curto e limpo.';

  @override
  String get learningModePreparationItemStill =>
      'Mantenha ambos os dispositivos estáveis ​​para evitar capturas ruidosas ou parciais.';

  @override
  String get learningModeStepCaptureTitle => 'Capture o sinal';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Ouça um único comando e bloqueie o resultado antes de revisá-lo.';

  @override
  String get learningModeCaptureReadyTitle => 'Pronto para ouvir';

  @override
  String get learningModeCaptureReadyBody =>
      'O estado do seu hardware parece bom. O back-end de captura será conectado a esta etapa a seguir.';

  @override
  String get learningModeCaptureBlockedTitle =>
      'Hardware ainda não está pronto';

  @override
  String get learningModeCaptureBlockedBody =>
      'Você ainda pode revisar o fluxo agora, mas a captura deverá aguardar até que o receptor esteja pronto.';

  @override
  String get learningModeStartListening => 'Receber sinal';

  @override
  String get learningModeCaptureStubTitle =>
      'O back-end de captura vem a seguir';

  @override
  String get learningModeCaptureStubBody =>
      'Essa tela é totalmente estruturada primeiro para que o fluxo de captura final possa ser conectado aos estados reais do hardware, em vez de ser anexado posteriormente.';

  @override
  String get learningModeCaptureStubMessage =>
      'A captura de aprendizagem ainda não está conectada. Esta tela estrutura o fluxo completo primeiro.';

  @override
  String get learningModeUnnamedCapture => 'Sinal sem nome';

  @override
  String get learningModeStatusCheckingTitle => 'A verificar o recetor';

  @override
  String get learningModeStatusNoReceiverTitle => 'Recetor não preparado';

  @override
  String get learningModeStatusPermissionTitle => 'É necessária permissão USB';

  @override
  String get learningModeStatusSetupTitle => 'Configure o recetor';

  @override
  String get learningModeStatusReadyTitle => 'Pronto para aprender';

  @override
  String get learningModeStatusListeningTitle => 'À espera do sinal';

  @override
  String get learningModeStatusCapturedTitle => 'Sinal capturado';

  @override
  String get learningModeStatusReadyBody =>
      'Dê um nome ao botão, aponte o controle remoto original para o receptor e comece a ouvir quando estiver pronto.';

  @override
  String get learningModeStatusListeningBody =>
      'Aponte o comando original para o recetor e prima o botão uma vez.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Sinal capturado para $buttonName. Reenvie-o para confirmar que o aparelho responde e depois guarde-o.';
  }

  @override
  String get learningModeConnectReceiverTitle => 'Ligar um recetor IR';

  @override
  String get learningModeConnectReceiverBody =>
      'O modo de aprendizagem depende do hardware externo que pode receber IR. Depois que o receptor for detectado e autorizado, esta página se tornará um fluxo direto de escuta, teste e salvamento.';

  @override
  String get learningModeListenCardTitle => 'Ouça um botão';

  @override
  String get learningModeListenCardBody =>
      'Defina primeiro um rótulo, se desejar, depois comece a ouvir e pressione o botão no controle remoto original.';

  @override
  String get learningModeReadyToListenTitle => 'Pronto para receber';

  @override
  String get learningModeReadyToListenBody =>
      'Aponte o comando original para o recetor e inicie a captura.';

  @override
  String get learningModeListeningNowTitle => 'À espera do sinal';

  @override
  String get learningModeListeningNowBody =>
      'Pressione o botão do controle remoto original uma vez. Use a captura de visualização para percorrer o resto do andaime antes que o back-end de captura real seja conectado.';

  @override
  String get learningModePreviewCaptureAction => 'Visualizar sinal capturado';

  @override
  String get learningModeCapturedSummary => 'Sinal capturado';

  @override
  String get learningModeResultActionsTitle => 'Testar e guardar';

  @override
  String get learningModeResultActionsBody =>
      'Reenvie o sinal e confirme que o aparelho responde antes de guardar o botão.';

  @override
  String get learningModeReplayAction => 'Reenviar';

  @override
  String get learningModeReplayStubMessage =>
      'O replay ainda não está conectado. Esta é a estrutura da UI para o fluxo final de aprendizado, teste e salvamento.';

  @override
  String get learningModeSaveStubMessage =>
      'Salvar ainda não está conectado. A próxima etapa é conectar esta tela ao botão Criar e aos controles remotos existentes.';

  @override
  String get learningModeLearnAnotherAction => 'Aprender outro botão';

  @override
  String get learningModeStepReviewTitle => 'Revise e salve';

  @override
  String get learningModeStepReviewSubtitle =>
      'Confirme o que foi aprendido e escolha onde ele deve ficar na sua biblioteca remota.';

  @override
  String get learningModeSaveToExistingRemote => 'Comando guardado';

  @override
  String get learningModeCreateNewRemote => 'Novo comando';

  @override
  String get learningModeProtocolPreviewTitle =>
      'Pré-visualização do protocolo';

  @override
  String get learningModeProtocolPreviewBody =>
      'Os detalhes do protocolo decodificado aparecerão aqui assim que o receptor capturar um pressionamento de botão limpo.';

  @override
  String get learningModeRawPreviewTitle => 'Dados em bruto';

  @override
  String get learningModeRawPreviewBody =>
      'Se a decodificação estiver incompleta, a captura de tempo bruto ainda estará disponível aqui para revisão e salvamento.';

  @override
  String get learningModeSaveCapture => 'Guardar sinal';

  @override
  String get learningModeReviewTipTitle => 'Para onde isso irá a seguir';

  @override
  String get learningModeReviewTipBody =>
      'A próxima etapa de implementação deve conectar este painel de revisão ao botão Criar e aos controles remotos existentes para que o sinal aprendido caia diretamente em sua biblioteca.';

  @override
  String get learningModeFinishPreview => 'Concluir visualização';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interacción';

  @override
  String get interactionSubtitle => 'Resposta tátil e disposição do comando';

  @override
  String get autoOpenLastRemoteTitle => 'Abrir o último comando ao iniciar';

  @override
  String get autoOpenLastRemoteSubtitle =>
      'Abre o comando utilizado mais recentemente ao iniciar a aplicação. Se não estiver disponível, é apresentada a lista de comandos.';

  @override
  String get hapticFeedbackTitle => 'Respuesta háptica';

  @override
  String get hapticFeedbackSubtitle => 'Vibrar ao tocar e ao executar ações';

  @override
  String get forceInAppVibrationTitle => 'Forçar vibração na aplicação';

  @override
  String get forceInAppVibrationSubtitle =>
      'Usar o vibrador diretamente mesmo que o feedback tátil do sistema esteja desligado';

  @override
  String get forceInAppVibrationWarning =>
      'Opção avançada. A aplicação pode vibrar mesmo quando o feedback tátil do Android está desativado globalmente.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'A vibração do sistema Android está desativada. A vibração forçada na aplicação não a pode substituir neste dispositivo.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'Este dispositivo não indica hardware de vibração, por isso a vibração na aplicação não pode funcionar.';

  @override
  String get intensity => 'Intensidad';

  @override
  String get intensityLight => 'Claro';

  @override
  String get intensityMedium => 'Media';

  @override
  String get intensityStrong => 'Fuerte';

  @override
  String get remoteButtonMetadataTitle =>
      'Mostrar etiquetas técnicas dos botões';

  @override
  String get remoteButtonMetadataSubtitle =>
      'Mostra protocolo, código e frequência nos botões do comando.';

  @override
  String get remoteButtonMetadataShown =>
      'Etiquetas técnicas dos botões visíveis.';

  @override
  String get remoteButtonMetadataHidden =>
      'Etiquetas técnicas dos botões ocultas.';

  @override
  String get flipRemoteDefaultTitle => 'Inverter vista do comando por defecto';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Abre os ecrãs do comando rodados 180° (para dongles USB montados em baixo).';

  @override
  String get remoteViewFlipped => 'A vista do comando vai abrir invertida.';

  @override
  String get remoteViewNormal => 'A vista do comando vai abrir normal.';

  @override
  String get backupTitle => 'Cópia';

  @override
  String get backupSubtitle => 'Importar/exportar comandos e macros';

  @override
  String get importBackup => 'Importar cópia';

  @override
  String get importBackupSubtitle =>
      'Importa cópias de comandos/macros ou ficheiros do Flipper Zero, LIRC ou IRPLUS';

  @override
  String get bulkImportFolder => 'Importar pasta';

  @override
  String get bulkImportFolderSubtitle =>
      'Importar vários comandos de uma pasta';

  @override
  String get exportBackup => 'Exportar cópia';

  @override
  String get exportBackupSubtitle =>
      'Guardar comandos + macros como um JSON em Transferências';

  @override
  String get restoreDemoRemotes => 'Restaurar comandos de demonstração';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Substituir os comandos atuais pela demonstração integrada';

  @override
  String get deleteAllRemotes => 'Eliminar todos os comandos';

  @override
  String get deleteAllRemotesSubtitle =>
      'Eliminar todos os comandos deste dispositivo';

  @override
  String get backupTip =>
      'Dica: exporte uma cópia antes de grandes alterações. A importação aceita cópias completas, cópias JSON antigas de comandos e ficheiros .ir do Flipper Zero.';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get aboutSubtitle => 'Informação da app e detalhes de código aberto';

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
  String get repositoryUrlCopied => 'URL do repositorio copiada';

  @override
  String get reportIssue => 'Reportar problema';

  @override
  String get reportIssueSubtitle => 'Erros e pedidos de funcionalidades';

  @override
  String get issuesUrlCopied => 'URL de issues copiada';

  @override
  String get license => 'Licencia';

  @override
  String get openSourceLicense => 'Licencia de código aberto';

  @override
  String get licenseUrlCopied => 'URL da licença copiado';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Visitar nuestro sitio web';

  @override
  String get companyUrlCopied => 'URL da empresa copiado';

  @override
  String get licenses => 'Licencias';

  @override
  String get openSourceLicenses => 'Licencias de código aberto';

  @override
  String byCreator(Object creator) {
    return 'por $creator';
  }

  @override
  String get deviceControlsTitle => 'Controlos do dispositivo';

  @override
  String get deviceControlsSubtitle =>
      'Mostrar botões favoritos na página de controlos do sistema';

  @override
  String get manageFavorites => 'Gerir favoritos';

  @override
  String get manageFavoritesSubtitle =>
      'Escolha que botões aparecem nos controlos do dispositivo';

  @override
  String get quickSettingsTitle => 'Definições rápidas';

  @override
  String get quickSettingsSubtitle =>
      'Adicionar mosaicos para atalhos de energia e volume';

  @override
  String get configureTiles => 'Configurar mosaicos';

  @override
  String get configureTilesSubtitle => 'Atribuir mosaicos a botões do comando';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Ciclo universal de energia para dispositivos próprios';

  @override
  String get openTvKill => 'Abrir TVKill';

  @override
  String get openTvKillSubtitle =>
      'Ciclar códigos de energia (use apenas em dispositivos seus)';

  @override
  String get failedToLoadTransmitterSettings =>
      'Falha ao carregar as definições do emissor.';

  @override
  String get usbStatusReady =>
      'O dongle USB está ligado e pronto para enviar IR.';

  @override
  String get usbStatusPermissionRequired =>
      'Dongle USB detetado. Peça permissão USB e aceite o aviso do sistema.';

  @override
  String get usbStatusPermissionDenied =>
      'Foi negada o permissão USB para o dongle ligado. Peça-a outra vez e aceite o aviso.';

  @override
  String get usbStatusPermissionGranted =>
      'A permissão USB foi concedida. O dongle ainda precisa de ser inicializado antes de poder enviar IR.';

  @override
  String get usbStatusOpenFailed =>
      'A permissão USB foi concedida, mas o dongle não pôde ser inicializado. Volte a ligá-lo e tente novamente.';

  @override
  String get usbStatusNoDevice =>
      'Não foi detetado nenhum dongle IR USB compatível.';

  @override
  String get usbSelectPermissionRequired =>
      'Dongle USB detetado, mas não autorizado. Toque em \"Pedir permissão USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'A permissão USB foi negada. Toque em \"Pedir permissão USB\" e aceite o aviso.';

  @override
  String get usbSelectPermissionGranted =>
      'A permissão USB foi concedida, mas o dongle ainda não foi inicializado. Tente voltar a ligá-lo.';

  @override
  String get usbSelectOpenFailed =>
      'A permissão USB foi concedida, mas o dongle não pôde ser inicializado. Volte a ligá-lo e tente novamente.';

  @override
  String get usbSelectNoDevice =>
      'Nenhum dongle IR USB compatível foi detetado. Ligue-o e depois toque em \"Pedir permissão USB\".';

  @override
  String get usbSelectReady => 'O dongle USB está pronto.';

  @override
  String get autoSwitchEnabledMessage =>
      'Mudança automática ativada: usa USB quando está ligado, caso contrário Interno.';

  @override
  String get autoSwitchDisabledMessage =>
      'Cambio automático desativedo: a seleção do emissor ahora es manual.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Falha ao atualizar a definição de mudança automática.';

  @override
  String get failedToSwitchTransmitter => 'Falha ao mudar de emissor.';

  @override
  String get deviceHasNoInternalIr =>
      'Este dispositivo não tem emissor IR integrado.';

  @override
  String get audioModeEnabledMessage =>
      'Modo áudio ativado. Use o volume multimédia no máximo e um adaptador LED de áudio para IR.';

  @override
  String get usbPermissionRequestSent => 'Solicitud de permissão USB enviada.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Pedido de permissão USB enviado. Aceite o aviso para ativar o USB.';

  @override
  String get usbAlreadyReady => 'O dongle USB já está inicializado e pronto.';

  @override
  String get failedToRequestUsbPermission =>
      'Não foi possível pedir a permissão USB.';

  @override
  String get transmitterHelpInternal =>
      'Usa o emissor IR integrado do telefone para enviar comandos.';

  @override
  String get transmitterHelpUsb =>
      'Usa um dongle IR USB (requer permissão) para enviar comandos.';

  @override
  String get transmitterHelpAudio1 =>
      'Usa a saída de áudio (mono). Requer um adaptador LED de áudio para IR e volume multimédia alto.';

  @override
  String get transmitterHelpAudio2 =>
      'Usa a saída de áudio (estéreo). Usa dois canais para melhor controlo do LED com adaptadores compatíveis.';

  @override
  String get transmitterInternal => 'IR interno';

  @override
  String get transmitterUsb => 'Dongle IR USB';

  @override
  String get transmitterAudio1 => 'Áudio (1 LED)';

  @override
  String get transmitterAudio2 => 'Áudio (2 LED)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Falha ao carregar as capacidades do emissor.';

  @override
  String get selectedTransmitter => 'Emissor selecionado';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Activo: $active';
  }

  @override
  String get refresh => 'Atualizar';

  @override
  String get autoSwitchTitle => 'Cambio auto';

  @override
  String get autoSwitchDisabledWhileAudio => 'Desativado ao usar modo Áudio';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Usa USB quando está ligado, caso contrário Interno';

  @override
  String get unavailableOnThisDevice => 'Não disponível neste dispositivo';

  @override
  String get openOnUsbAttachTitle => 'Abrir ao ligar USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'O Android pode sugerir abrir a app quando um dongle IR USB compatível é ligado.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Vai sugerir abrir o IR Blaster quando um dongle USB compatível for ligado.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Não vai sugerir abrir ao ligar USB.';

  @override
  String get failedToUpdateSetting => 'Falha ao atualizar a definição.';

  @override
  String get unnamedButton => 'Botão sem nome';

  @override
  String get iconFallback => 'Ícone';

  @override
  String get remoteListReorderHint =>
      'Mantenha um comando premido e arraste-o para a nova posição.';

  @override
  String get deleteRemoteTitle => 'Eliminar comando?';

  @override
  String deleteRemoteMessage(Object name) {
    return 'O comando «$name» será eliminado permanentemente. Esta ação não pode ser anulada.';
  }

  @override
  String get delete => 'Eliminar';

  @override
  String get addToDeviceControlsTitle =>
      'Adicionar a Controlos do dispositivo?';

  @override
  String get addToDeviceControlsDescription =>
      'Acesso rápido nos controlos do sistema.';

  @override
  String get skip => 'Omitir';

  @override
  String get add => 'Adicionar';

  @override
  String get addedToDeviceControls =>
      'Adicionado aos Controlos do dispositivo.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Comando «$name» eliminado. Esta ação não pode ser anulada.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count botões',
      one: '$count botão',
    );
    return '$_temp0 · $layout';
  }

  @override
  String get layoutComfort => 'Larga';

  @override
  String get layoutCompact => 'Compacta';

  @override
  String get open => 'Abrir';

  @override
  String get useThisRemote => 'Usar este comando';

  @override
  String get edit => 'Editar';

  @override
  String get editRemoteSubtitle => 'Renomear e editar botões';

  @override
  String get thisCannotBeUndone => 'Esta ação não pode ser anulada';

  @override
  String get searchRemotes => 'Pesquisar comandos';

  @override
  String get reorderRemotes => 'Reordenar comandos';

  @override
  String get addRemote => 'Adicionar comando';

  @override
  String get more => 'Mais';

  @override
  String get reorderMode => 'Modo reordenar';

  @override
  String remoteButtonCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count botões',
      one: '$count botão',
    );
    return '$_temp0';
  }

  @override
  String get noRemotesYet => 'Ainda não há comandos';

  @override
  String get noRemotesDescription =>
      'Crie um comando para enviar sinais infravermelhos.';

  @override
  String get noRemotesNextStep =>
      'Adicione um comando e depois os respetivos botões.';

  @override
  String get actions => 'Ações';

  @override
  String get macrosTitle => 'Macros';

  @override
  String get help => 'Ajuda';

  @override
  String get createMacro => 'Criar macro';

  @override
  String get timedMacrosTitle => 'Macros';

  @override
  String get timedMacrosSubtitle =>
      'Execute uma sequência de comandos IR com pausas entre os passos.';

  @override
  String get timedMacrosNextStep =>
      'Escolha um comando e adicione ações e pausas para criar a sua primeira macro.';

  @override
  String get macroFeatureToysTitle => 'Para brinquedos controlados por IR';

  @override
  String get macroFeatureToysDescription =>
      'Dê ao brinquedo tempo para concluir uma ação antes de enviar o comando seguinte.';

  @override
  String get macroFeatureTimingTitle => 'Pausas ajustáveis';

  @override
  String get macroFeatureTimingDescription =>
      'Defina a pausa entre comandos para dar ao dispositivo tempo para responder.';

  @override
  String get macroFeatureManualTitle => 'Aguardar confirmação';

  @override
  String get macroFeatureManualDescription =>
      'Aguarda que toque em Continuar antes de avançar para o passo seguinte.';

  @override
  String get exampleUseCase => 'Exemplo';

  @override
  String get macroExampleText =>
      '1. Envie o primeiro comando\n2. Aguarde um segundo\n3. Envie o comando seguinte';

  @override
  String get createFirstMacro => 'Criar a primeira macro';

  @override
  String get noRemote => 'Sem comando';

  @override
  String macroCopyName(String name) {
    return '$name (cópia)';
  }

  @override
  String macroStepCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count passos',
      one: '$count passo',
    );
    return '$_temp0';
  }

  @override
  String get aboutTimedMacros => 'Acerca das macros';

  @override
  String get aboutTimedMacrosDescription =>
      'Execute uma sequência de comandos IR com pausas entre os passos.';

  @override
  String get sendCommand => 'Enviar comando';

  @override
  String get sendCommandDescription =>
      'Envia o sinal IR de um botão guardado no seu comando.';

  @override
  String get delay => 'Espera';

  @override
  String get delayDescription =>
      'Aguarda o tempo definido antes de avançar para o passo seguinte.';

  @override
  String get manualContinue => 'Aguardar confirmação';

  @override
  String get manualContinueDescription =>
      'Aguarda que toque em Continuar antes de avançar para o passo seguinte.';

  @override
  String get gotIt => 'Entendido';

  @override
  String get failedToSaveMacros => 'Não foi possível guardar as macros.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Macro «$name» eliminada.';
  }

  @override
  String get undo => 'Anular';

  @override
  String get failedToRestoreMacro => 'Não foi possível restaurar a macro.';

  @override
  String get deleteMacroTitle => 'Eliminar macro?';

  @override
  String get deleteMacroMessage =>
      'Depois de eliminar, toque em Anular na mensagem apresentada para restaurar a macro.';

  @override
  String get noRemotesAvailable => 'Ainda não há comandos disponíveis.';

  @override
  String remoteButtonCountSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count botões',
      one: '$count botão',
    );
    return '$_temp0';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Restaurar a orientação original';

  @override
  String get remoteOrientationNormalTooltip => 'Rodar o comando 180°';

  @override
  String get stopLoop => 'Parar repetição';

  @override
  String get reorderButtons => 'Reordenar botões';

  @override
  String get remoteReorderHint =>
      'Mantenha um botão premido e arraste-o para outra posição.';

  @override
  String get manageRemote => 'Gerir comando';

  @override
  String get remoteNoButtons => 'Ainda não há botões';

  @override
  String get remoteNoButtonsDescription =>
      'Edite este comando para adicionar ou configurar botões.';

  @override
  String get editRemote => 'Editar comando';

  @override
  String get editRemoteActionsSubtitle =>
      'Mudar o nome do comando, organizar e editar botões';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Botão «$name» atualizado.';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Foi adicionado \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Botão duplicado.';

  @override
  String get loopRunningForButton => 'O ciclo está ativo para este botão.';

  @override
  String get loopTip => 'Dica: use Ciclo para repetir até parar.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Código copiado.';

  @override
  String get copyCode => 'Copiar código';

  @override
  String get startLoop => 'Iniciar ciclo';

  @override
  String get editButtonSubtitle => 'Alterar a etiqueta, as cores ou o sinal IR';

  @override
  String get newButton => 'Novo botão';

  @override
  String get newButtonSubtitle => 'Criar outro botão para este comando';

  @override
  String get duplicate => 'Duplicar';

  @override
  String get duplicateButtonSubtitle => 'Criar uma cópia deste botão';

  @override
  String get removeFromDeviceControls => 'Remover de Controlos do dispositivo';

  @override
  String get addToDeviceControls => 'Adicionar a Controlos do dispositivo';

  @override
  String get deviceControlsButtonSubtitle =>
      'Usar este botão nos controlos de dispositivos do Android';

  @override
  String get removedFromDeviceControls =>
      'Removido dos Controlos do dispositivo.';

  @override
  String get pinQuickTile => 'Fixar nos favoritos dos mosaicos rápidos';

  @override
  String get unpinQuickTile => 'Remover dos favoritos dos mosaicos rápidos';

  @override
  String get quickTileButtonSubtitle =>
      'Os favoritos aparecem primeiro ao configurar um mosaico de definições rápidas';

  @override
  String get removedFromQuickTileFavorites =>
      'Removido dos favoritos dos mosaicos rápidos.';

  @override
  String get pinnedToQuickTileFavorites =>
      'Fixado nos favoritos dos mosaicos rápidos.';

  @override
  String get duplicateAndEdit => 'Duplicar e editar';

  @override
  String get duplicateAndEditSubtitle =>
      'Criar uma cópia e editá-la de imediato';

  @override
  String get done => 'Concluído';

  @override
  String get run => 'Executar';

  @override
  String get untitledRemote => 'Comando sem nome';

  @override
  String get createRemoteTitle => 'Criar comando';

  @override
  String get editRemoteTitle => 'Editar comando';

  @override
  String get removeButtonTitle => 'Remover o botão?';

  @override
  String get imageButtonRemovedMessage =>
      'Este botão será removido do comando.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '«$name» será removido do comando.';
  }

  @override
  String get remove => 'Remover';

  @override
  String importedButtonCount(int count) {
    return 'Foram importados $count botão(es).';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Foram importados $count botão(ões) de comandos existentes.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Alterar a etiqueta, as cores ou o sinal IR';

  @override
  String get createButtonCopySubtitle => 'Criar uma cópia deste botão';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Criar uma cópia e editá-la de imediato';

  @override
  String get undoAvailableInNextSnackbar =>
      'Depois de remover o botão, toque em Anular na mensagem apresentada.';

  @override
  String get buttonRemoved => 'Botão removido.';

  @override
  String get remoteNameCannotBeEmpty => 'Introduza um nome para o comando.';

  @override
  String get saveRemote => 'Guardar comando';

  @override
  String get remoteName => 'Nome do comando';

  @override
  String get remoteNameHint => 'Ex.: televisão ou ar condicionado';

  @override
  String get remoteNameHelper =>
      'Este nome aparecerá na sua lista de comandos.';

  @override
  String get layoutStyle => 'Disposição';

  @override
  String get layoutWideDescription =>
      'Duas colunas de botões com mais detalhes.';

  @override
  String get layoutCompactDescription =>
      'Quatro colunas de botões com ícones ou texto.';

  @override
  String get importFromRemotes => 'Importar de comandos';

  @override
  String get importFromDatabase => 'Importar da base de dados';

  @override
  String get addButton => 'Adicionar botão';

  @override
  String get noButtonsYet => 'Ainda não há botões';

  @override
  String get createRemoteEmptyStateDescription =>
      'Procure botões na base de dados, importe-os de outro comando ou crie os seus.';

  @override
  String get createButtonTitle => 'Criar botão';

  @override
  String get editButtonTitle => 'Editar botão';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Falha ao carregar protocolos: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Falha ao carregar chaves da base de dados: $error';
  }

  @override
  String get presetPower => 'Enc.';

  @override
  String get presetVolume => 'Volume';

  @override
  String get presetChannel => 'Canal';

  @override
  String get presetNavigation => 'Navegación';

  @override
  String get all => 'Todos';

  @override
  String get completeRequiredFieldsToSave =>
      'Preencha os campos obrigatórios para guardar';

  @override
  String get buttonLabelStepTitle => 'Etiqueta do botão';

  @override
  String get buttonLabelStepSubtitle =>
      'Escolha uma imagem, um ícone ou escreva uma etiqueta.';

  @override
  String get buttonColorStepTitle => 'Cor do botão';

  @override
  String get buttonColorStepSubtitle =>
      'Escolha uma cor de fundo para este botão.';

  @override
  String get selectColor => 'Selecione cor:';

  @override
  String get noImageSelected => 'Não há imagem selecionada';

  @override
  String get gallery => 'Galería';

  @override
  String get builtIn => 'Integrado';

  @override
  String get removeImage => 'Remover imagem';

  @override
  String get requiredSelectImageOrSwitch =>
      'Obrigatório: selecione uma imagem, escolha um ícone ou mude para Texto.';

  @override
  String get iconSelected => 'Ícone selecionado';

  @override
  String get noIconSelected => 'Nenhum ícone selecionado';

  @override
  String get chooseIcon => 'Escolher ícone';

  @override
  String get removeIcon => 'Remover ícone';

  @override
  String get requiredSelectIconOrSwitch =>
      'Obrigatório: selecione um ícone ou mude para Imagem/Texto.';

  @override
  String get buttonText => 'Texto do botão';

  @override
  String get buttonTextHint => 'p. ej., Enc., Volume +, HDMI 1';

  @override
  String get buttonTextHelper => 'Este texto aparecerá en o botão.';

  @override
  String get requiredEnterButtonLabel => 'Obrigatório: introduza uma etiqueta.';

  @override
  String get defaultColorName => 'Predeterminado';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Foi criado um comando novo com um botão do último acerto.';

  @override
  String get selectRemote => 'Escolher comando';

  @override
  String remoteNumber(Object id) {
    return 'Comando n.º $id';
  }

  @override
  String get newRemoteCreated => 'Comando novo criado.';

  @override
  String get failedToCreateRemote => 'Falha ao criar o comando.';

  @override
  String get newRemoteEllipsis => 'Novo comando…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Adicionado a $name.';
  }

  @override
  String get failedToAddToRemote => 'Falha ao adicionar ao comando.';

  @override
  String get newRemoteDefaultName => 'Novo comando';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Saltou para o deslocamento $offset. Em pausa, prima Retomar para continuar.';
  }

  @override
  String get sent => 'Enviado.';

  @override
  String failedToSend(Object error) {
    return 'Falha ao enviar: $error';
  }

  @override
  String get copiedProtocolCode => 'Copiado (protocolo:código).';

  @override
  String get savedToResults => 'Guardado em Resultados.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Código inválido para o protocolo: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Candidato atual copiado.';

  @override
  String get jumpToOffset => 'Saltar ao deslocação';

  @override
  String get jumpToBruteCursor => 'Saltar ao cursor de força bruta';

  @override
  String get jump => 'Saltar';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Saltou para o cursor 0x$cursor. Em pausa, prima Retomar para continuar.';
  }

  @override
  String get irSignalTester => 'Probador de sinal IR';

  @override
  String get stop => 'Parar';

  @override
  String get selectButton => 'Escolher botão';

  @override
  String get buttonNotFoundInRemotes =>
      'Botão não encontrado nos comandos guardados.';

  @override
  String sentNamed(Object name) {
    return '«$name» enviado.';
  }

  @override
  String sendFailed(Object error) {
    return 'Não foi possível enviar: $error';
  }

  @override
  String get noFavoritesYet => 'Ainda não há favoritos';

  @override
  String get deviceControlsEmptyHint =>
      'Mantenha premido um botão do comando e selecione \"Adicionar aos Controlos do dispositivo\".';

  @override
  String get sendTest => 'Enviar teste';

  @override
  String get testSendCompleted => 'Teste de envio concluída.';

  @override
  String testSendFailed(Object error) {
    return 'Falha no envio de teste: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Foi removido \"$name\".';
  }

  @override
  String get brand => 'Marca';

  @override
  String get model => 'Modelo';

  @override
  String get selectBrand => 'Selecionar marca';

  @override
  String get searchBrand => 'Pesquisar marca…';

  @override
  String get selectModel => 'Selecionar modelo';

  @override
  String get searchModel => 'Pesquisar modelo…';

  @override
  String get unnamedKey => 'Tecla sem nome';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get emDash => '-';

  @override
  String get searchCommands => 'Pesquisar comandos';

  @override
  String get noMatchingCommands => 'Nenhum comando encontrado';

  @override
  String get quickTileFavoritesTitle => 'Botões favoritos';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Alterar botão do mosaico «$tileLabel»';
  }

  @override
  String get pickDifferentButton => 'Escolha outro botão';

  @override
  String get browseAllRemotesEllipsis => 'Explorar comandos';

  @override
  String get invalidMacroFileFormat =>
      'Formato de ficheiro de macro não válido.';

  @override
  String get failedToParseMacroFile =>
      'Não se pudo analizar o ficheiro de macro.';

  @override
  String get deviceCodeLabel => 'Código de dispositivo';

  @override
  String get commandLabel => 'Comando';

  @override
  String get editButtonCodeTitle => 'Editar código do botão';

  @override
  String get thisRemoteHasNoButtons => 'Este comando não tem botões.';

  @override
  String get selectCommand => 'Escolher comando';

  @override
  String get databaseModeAutofillHint =>
      'O modo Base de dados preenche o Passo 2 por si (marca + modelo + protocolo). Depois de importar uma tecla, pode ajustar tudo em Manual.';

  @override
  String get test => 'Teste';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Todos os botões elegidos eran duplicados.';

  @override
  String get noButtonsImported => 'Nenhum botão foi importado.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Foram importados $addedCount botão(es). Se omitieron $skippedCount duplicado(s).';
  }

  @override
  String get importAllMatchingTitle =>
      'Importar todos os botões correspondentes?';

  @override
  String get noMatchingKeysFound =>
      'Não foram encontradas teclas correspondentes.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Isto importará até $count teclas correspondentes da seleção atual da base de dados.';
  }

  @override
  String get importAll => 'Importar tudo';

  @override
  String get importingButtons => 'Importando botões…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Todos os botões correspondentes eran duplicados.';

  @override
  String get quickPresets => 'Definições rápidas';

  @override
  String get selectDeviceFirst => 'Selecione primeiro um dispositivo';

  @override
  String get searchByLabelOrHex => 'Pesquisar por etiqueta o hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Opcional: refine as teclas predefinidas de $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Selecione primeiroo marca, modelo e protocolo.';

  @override
  String get importFromDatabaseTitle => 'Importar de a base de dados';

  @override
  String get importFromDatabaseSubtitle =>
      'Procure o seu dispositivo, escolha os botões e importe-os.';

  @override
  String get deviceAndFilters => 'Dispositivo e filtros';

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
      'Não foi encontrado nenhum protocolo para esta marca e modelo.';

  @override
  String get protocolAutoDetected => 'Protocolo';

  @override
  String get protocolAutoDetectedHelper =>
      'Detetado automaticamente na base de dados. Pode alterá-lo antes de importar.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Selecione uma marca, modelo e protocolo para carregar teclas.';

  @override
  String get noKeysFound => 'Não foram encontradas teclas.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Não foram encontradas teclas para \"$query\".';
  }

  @override
  String get skipDuplicates => 'Omitir duplicados';

  @override
  String get skipDuplicatesSubtitle =>
      'Não importes botões que já existan en este comando.';

  @override
  String get importSelected => 'Importar selecionados';

  @override
  String get noMacrosToExport => 'Não há macros para exportar.';

  @override
  String get macrosExportedToDownloads => 'Macros exportedas a Descargas.';

  @override
  String get failedToExportMacros => 'Não se pudieron exporter as macros.';

  @override
  String get failedToReadFile => 'Não se pudo leer o ficheiro.';

  @override
  String get importFromExistingRemotesTitle =>
      'Importar de comandos existentes';

  @override
  String selectedCount(int count) {
    return '$count selecionados';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Não foram encontrados outros comandos com botões.';

  @override
  String get sourceRemote => 'Comando origen';

  @override
  String get searchButtons => 'Pesquisar botões';

  @override
  String get searchButtonsHint => 'Enc., Volume, Silencio..';

  @override
  String get selectVisible => 'Selecionar visibles';

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
      'Permissão de almacenamiento negada (necesario en algums Android antiguos).';

  @override
  String get backupExportedToDownloads => 'Cópia exporteda a Descargas.';

  @override
  String failedToExport(Object error) {
    return 'Falha ao exportar: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Foram importados $count comandos de uma cópia JSON antiga. As macros não foram alteradas.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Importação falhada: \"remotes\" deve ser uma lista JSON se existe.';

  @override
  String get importFailedMacrosMustBeList =>
      'Importação falhada: \"macros\" deve ser uma lista JSON se existe.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Falha na importação: formato de cópia inválido (era esperada uma lista antiga ou um mapa com remotes/macros).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Foram importados $remoteCount comandos da cópia. As macros não foram alteradas.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Foram importados $remoteCount comandos e $macroCount macros de a cópia.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Importação falhada: não se encontraron botões válidos en o ficheiro.ir.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Foi importado 1 comando de Flipper.ir. As macros não foram alteradas.';

  @override
  String get importFailedInvalidIrplus =>
      'Importação falhada: ficheiro irplus não válido (não se encontraron botões válidos).';

  @override
  String get importedOneRemoteFromIrplus =>
      'Foi importado 1 comando de irplus. As macros não foram alteradas.';

  @override
  String get importFailedInvalidLirc =>
      'Importação falhada: ficheiro LIRC não válido (não se encontraron códigos válidos/brutos).';

  @override
  String get importedOneRemoteFromLirc =>
      'Foi importado 1 comando de uma configuração LIRC. As macros não foram alteradas.';

  @override
  String get unsupportedFileTypeSelected =>
      'Foi selecionado um tipo de ficheiro não compatível.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Importação falhada: ficheiro não válido o ilegible.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Importação masiva concluída: não se encontraron ficheiros compatíveis en a pasta.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Importação masiva concluída: não foram importados comandos. Se omitieron $skippedCount ficheiro(s).';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Importação masiva concluída: foram importados $importedCount comando(s) de $supportedCount ficheiro(s) compatível(s). Se omitieron $skippedCount ficheiro(s).';
  }

  @override
  String get storagePermissionDenied => 'Permissão de almacenamiento negada.';

  @override
  String get bulkImportFailedReadFolder =>
      'Importação masiva falhada: não se pudo leer o contenido de a pasta.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Importação masiva concluída: não se encontraron ficheiros compatíveis ($sourceLabel).';
  }

  @override
  String get clearAction => 'Limpar';

  @override
  String get saveAction => 'Guardar';

  @override
  String buttonsTitleCount(int count) {
    return 'Botões ($count)';
  }

  @override
  String get invalidStepEncountered =>
      'Esta macro contém um passo inválido. Edite-o antes de tentar novamente.';

  @override
  String failedToSendNamed(Object name) {
    return 'Não foi possível enviar: $name';
  }

  @override
  String get buttonNotFound => 'Botão não encontrado';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Botão não encontrado: $name';
  }

  @override
  String get unknownButton => 'Botão desconhecido';

  @override
  String durationSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '$minutes min $seconds s';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '$hours h $minutes min';
  }

  @override
  String get orientationFlippedTooltip =>
      'Orientação: invertida (toque para normal)';

  @override
  String get orientationNormalTooltip =>
      'Orientação: normal (toque para inverter)';

  @override
  String get noSteps => 'Sem passos';

  @override
  String stepProgress(int current, int total) {
    return 'Passo $current de $total';
  }

  @override
  String get completed => 'Concluído';

  @override
  String get paused => 'Em pausa';

  @override
  String get running => 'Em execução';

  @override
  String get ready => 'Pronto';

  @override
  String stepsProgress(int current, int total) {
    return 'Passos: $current / $total';
  }

  @override
  String get waiting => 'A aguardar';

  @override
  String secondsRemaining(num seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
            locale: localeName, decimalDigits: 1);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Tempo restante: $secondsString s';
  }

  @override
  String millisecondsShort(int ms) {
    return '$ms ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Toque em Continuar quando estiver pronto para o passo seguinte.';

  @override
  String get error => 'Error';

  @override
  String get macroCompleted => 'Macro concluída';

  @override
  String finishedIn(Object duration) {
    return 'Concluída em $duration';
  }

  @override
  String get sequence => 'Passos';

  @override
  String waitMilliseconds(int ms) {
    return 'Aguardar $ms ms';
  }

  @override
  String get runAgain => 'Executar novamente';

  @override
  String get startMacro => 'Iniciar macro';

  @override
  String get continueAction => 'Continuar';

  @override
  String get unnamedRemote => 'Comando sem nome';

  @override
  String get enterMacroName => 'Introduza um nome para a macro.';

  @override
  String get addAtLeastOneStep => 'Adicione pelo menos um passo.';

  @override
  String get fixInvalidSteps => 'Corrija os passos inválidos antes de guardar.';

  @override
  String get unknownCommand => 'Comando desconhecido';

  @override
  String get unnamedCommand => 'Comando sem nome';

  @override
  String get iconCommand => 'Botão com ícone';

  @override
  String get selectDelay => 'Escolher tempo de espera';

  @override
  String keepMilliseconds(int ms) {
    return 'Manter $ms ms';
  }

  @override
  String get custom => 'Personalizado';

  @override
  String get enterCustomDelayDuration => 'Introduza outro tempo de espera';

  @override
  String millisecondsLong(int ms) {
    String _temp0 = intl.Intl.pluralLogic(
      ms,
      locale: localeName,
      other: '$ms milissegundos',
      one: '$ms milissegundo',
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
      other: '$secondsString segundos',
      one: '$secondsString segundo',
    );
    return '$_temp0';
  }

  @override
  String get customDelay => 'Espera personalizada';

  @override
  String get delayMillisecondsLabel => 'Espera (ms)';

  @override
  String get delayMillisecondsHint => '3000';

  @override
  String get recommendedDelayRange =>
      '1 000 milissegundos = 1 segundo. Dê ao dispositivo tempo suficiente para responder.';

  @override
  String get enterValidPositiveNumber =>
      'Introduza um número inteiro maior que zero.';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Comando';

  @override
  String get macroName => 'Nome da macro';

  @override
  String get macroNameHint => 'ex. Noite de cinema';

  @override
  String stepsTitleCount(int count) {
    return 'Passos ($count)';
  }

  @override
  String get noStepsYet => 'Ainda não há passos';

  @override
  String get addCommandsAndDelaysHint =>
      'Adicione comandos, tempos de espera ou pausas para confirmação. Os passos são executados pela ordem apresentada.';

  @override
  String get addStep => 'Adicionar passo';

  @override
  String get reorderStepsHint =>
      'Arraste a pega para mudar a ordem dos passos. Toque num passo para o editar.';

  @override
  String reorderStep(int index) {
    return 'Mover o passo $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Mantenha premido e arraste para mover o passo';

  @override
  String deleteStep(int index) {
    return 'Eliminar o passo $index';
  }

  @override
  String get invalidStepTapToFix => 'Passo inválido. Toque para o corrigir.';

  @override
  String get sendIrCommand => 'Enviar comando IR';

  @override
  String get waitForUserConfirmation =>
      'Faz uma pausa até decidir continuar a macro.';

  @override
  String get notImplemented => 'Não implementado';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Larga';

  @override
  String get iconButton => 'Icon botão';

  @override
  String get imageButton => 'Image botão';

  @override
  String get noSignalInfo => 'Sem info de sinal';

  @override
  String get proceed => 'Continuar';

  @override
  String get discard => 'Descartar';

  @override
  String get continueEditing => 'Continuar a editar';

  @override
  String get unsavedChangesTitle => 'Alterações por guardar';

  @override
  String get unsavedMacroChangesMessage =>
      'Descartar as alterações desta macro? Não serão guardadas.';

  @override
  String get stopMacroBeforeLeaving => 'Pare a macro antes de sair deste ecrã.';

  @override
  String get stopTestingBeforeLeaving =>
      'Stop testing before leaving this screen.';

  @override
  String get idle => 'Inactivo';

  @override
  String get start => 'Iniciar';

  @override
  String get resume => 'Retomar';

  @override
  String get pause => 'Pausa';

  @override
  String get stopped => 'Detenido';

  @override
  String get copy => 'Copiar';

  @override
  String get send => 'Enviar';

  @override
  String get step => 'Passo';

  @override
  String get addToRemote => 'Adicionar ao comando';

  @override
  String get noDescriptionAvailable => 'Nenhuma descrição disponível.';

  @override
  String get notAvailableSymbol => '-';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'O fornecedor Kaseikyo deve ter exatamente 4 dígitos hexadecimais.';

  @override
  String get irFinderDatabaseNotReady =>
      'A base de dados ainda não está pronta.';

  @override
  String get irFinderSelectBrandFirst =>
      'Selecione primeiroo uma marca en Configuração.';

  @override
  String get irFinderBruteforceUnavailable =>
      'A força bruta ainda não está disponível para este protocolo.';

  @override
  String get irFinderInvalidPrefix => 'Prefixo inválido.';

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
    return 'Comando n.º $value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Introduza um índice base 0 dentro dos resultados filtrados e ordenados.';

  @override
  String get irFinderJumpCursorHelper =>
      'Introduza um cursor hexadecimal base 0 dentro do espaço de força bruta.';

  @override
  String get irFinderSetupTab => 'Configuração';

  @override
  String get irFinderTestTab => 'Testar';

  @override
  String get irFinderResultsTab => 'Resultados';

  @override
  String get irFinderContinueToTest => 'Continuar a Teste';

  @override
  String get irFinderKaseikyoVendorTitle => 'Proveedor Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'Proveedor personalizado (4 hex)';

  @override
  String get irFinderBrowseDbCandidates => 'Explorar candidatos de BD…';

  @override
  String get irFinderEditSetup => 'Editar configuração';

  @override
  String get irFinderNoSavedHits =>
      'Ainda não há acertos guardados. Na página Teste, prima \"Guardar acerto\" quando o dispositivo responder.';

  @override
  String get irFinderBackToTest => 'Voltar a Teste';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Espaço de pesquisa grande';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Este espaço de força bruta é muito grande ($human possibilidades). O IR Finder respeitará as suas tentativas máximas e a espera, mas evite saturar dispositivos IR.\n\nRecomendação: use primeiro o modo Base de dados e/ou introduza bytes de prefixo conhecidos para reduzir o espaço.';
  }

  @override
  String get irFinderDatabaseSession => 'Sessão da base de dados';

  @override
  String get irFinderBruteforceSession => 'Sessão de força bruta';

  @override
  String get irFinderResumeLastSession => 'Retomar última sessão';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Marca: $brand · Modelo: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Prefixo: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Progreso: $progress · Início: $when';
  }

  @override
  String get irFinderApplyResume => 'Aplicar e retomar';

  @override
  String get irFinderBruteforceMode => 'Força bruta';

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
      'Controla a codificación e por tanto o espaço de pesquisa.';

  @override
  String get irFinderKnownPrefixLabel =>
      'Prefixo conhecido (bytes hexadecimais, opcional)';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Carga: $digits dígito(s) hex';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Carga: $digits dígito(s) hexadecimais · Exemplo: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Carga: $digits dígito(s) hexadecimais · Prefixo máx.: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Carga: $digits dígito(s) hexadecimais · Exemplo: $example · Prefixo máx.: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Exemplo: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Introduza os primeiroos bytes conocidos para reducir o espaço de pesquisa.';

  @override
  String get irFinderDatabaseMode => 'Base de dados';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Prefixo normalizado: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Prefixo normalizado';

  @override
  String get irFinderBruteforceNotConfigured =>
      'A força bruta ainda não está configurada para este protocolo.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Tudo ($value)';
  }

  @override
  String get irFinderTestControls => 'Controlos de teste';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Longitud de carga: $digits dígito(s) hex.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Espaço de pesquisa: $value possibilidades (após as restrições do prefixo).';
  }

  @override
  String get irFinderCooldownMs => 'Espera (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Máx. de tentativas por execução';

  @override
  String get irFinderTestAllCombinations => 'Testar todas as combinações';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Executa até esgotar o espaço de pesquisa. Limite efetivo: $value';
  }

  @override
  String get irFinderAttempts => 'Tentativas';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Rango do deslizador: 1–$max (escreva cualquier número para valores mayores)';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Máx.\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Límite efectivo en esta execução: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Dica: use primeiro o modo Base de dados; a força bruta funciona melhor com um prefixo conhecido (por exemplo, os primeiros 1 a 4 bytes).';

  @override
  String get irFinderDatabaseInitFailed =>
      'Falhou a inicialização de a base de dados.';

  @override
  String get irFinderPreparingDatabase =>
      'Preparando base local de códigos IR…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Pesquisa asistida por BD';

  @override
  String get irFinderBrand => 'Marca';

  @override
  String get irFinderSelectBrand => 'Selecionar marca';

  @override
  String get irFinderModelOptional => 'Modelo (opcional)';

  @override
  String get irFinderSelectBrandFirstShort => 'Selecione primeiroo uma marca';

  @override
  String get irFinderSelectModelRecommended =>
      'Selecione um modelo (recomendado)';

  @override
  String get irFinderOnlySelectedProtocol => 'Apenas protocolo selecionado';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Filtra as teclas pelo protocolo escolhido. Desative para ver todos os protocolos.';

  @override
  String get irFinderQuickWinsFirst => 'Acertos rápidos primeiro';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Prioriza teclas como POWER, MUTE, VOL e CH antes de outras mais profundas.';

  @override
  String get irFinderMaxKeysPerRun => 'Máx. de teclas a testar por execução';

  @override
  String get irFinderTesting => 'Probando…';

  @override
  String get irFinderCooldown => 'Espera';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'Modo';

  @override
  String get irFinderRetryLast => 'Tentar novamente a última';

  @override
  String get irFinderTrigger => 'Disparar';

  @override
  String get irFinderJump => 'Saltar…';

  @override
  String get irFinderSaveHit => 'Guardar acerto';

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
      'Empieza a teste para ver o último código intentado.';

  @override
  String irFinderFromDb(Object value) {
    return 'De BD: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'De força bruta (generado por o codificador de protocolo).';

  @override
  String irFinderSendError(Object error) {
    return 'Erro de envio: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Origen: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Os resultados permitem Testar e Copiar imediatamente. A integração direta para adicionar ao comando pode ser ampliada depois no editor.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Explorar candidatos de BD';

  @override
  String get irFinderFilterByLabelOrHex => 'Filtrar por etiqueta o hex…';

  @override
  String get irFinderJumpHere => 'Saltar aqui';

  @override
  String get irFinderSelectModel => 'Selecionar modelo';

  @override
  String get irFinderSearchBrands => 'Pesquisar marcas…';

  @override
  String get irFinderSearchModels => 'Pesquisar modelos…';

  @override
  String get iconPickerTitle => 'Selecionar ícone';

  @override
  String get iconPickerSearchHint => 'Pesquisar ícones...';

  @override
  String get iconPickerNoIconsFound => 'Não foram encontrados ícones';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count ícones disponíveis';
  }

  @override
  String get iconPickerCategoryAll => 'Tudo';

  @override
  String get iconPickerCategoryMedia => 'Medios';

  @override
  String get iconPickerCategoryVolume => 'Volume';

  @override
  String get iconPickerCategoryNavigation => 'Navegación';

  @override
  String get iconPickerCategoryPower => 'Enc.';

  @override
  String get iconPickerCategoryNumbers => 'Números';

  @override
  String get iconPickerCategorySettings => 'Definições';

  @override
  String get iconPickerCategoryDisplay => 'Ecrã';

  @override
  String get iconPickerCategoryInput => 'Entrada';

  @override
  String get iconPickerCategoryFavorite => 'Favorito';

  @override
  String get universalPowerTitle => 'Ligado universal';

  @override
  String get universalPowerRunTab => 'Executar';

  @override
  String get universalPowerUseResponsibly => 'Úsalo con responsabilidad';

  @override
  String get universalPowerConsentBody =>
      'Ligado universal cicla códigos IR de ligado. Úsalo apenas en dispositivos que posees o controlas. Deténlo en cuanto o dispositivo responda.';

  @override
  String get universalPowerConsentCheckbox => 'Poseo o controlo o dispositivo';

  @override
  String get universalPowerSetupBody =>
      'Cicla códigos de ligado para a marca escolhida. Deténlo en cuanto o dispositivo responda.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Último enviado: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Não foram encontrados códigos de energia. Tente ampliar a pesquisa.';

  @override
  String get universalPowerUnableToStart => 'Não se pudo iniciar.';

  @override
  String get universalPowerAllBrands => 'Todas as marcas (sem filtro)';

  @override
  String get universalPowerClearBrandFilter => 'Limpiar filtro de marca';

  @override
  String get universalPowerBroadenSearch => 'Amplía a pesquisa se hace falta';

  @override
  String get universalPowerBroadenSearchHint =>
      'Se não forem encontradas etiquetas de energia, inclua outras teclas.';

  @override
  String get universalPowerAdditionalPatternsDepth =>
      'Profundidad de patrones extra';

  @override
  String get universalPowerDepth1 => 'Apenas prioridad: POWER/OFF';

  @override
  String get universalPowerDepth2 => 'Incluir alias de POWER';

  @override
  String get universalPowerDepth3 => 'Incluir etiquetas secundarias de ligado';

  @override
  String get universalPowerDepth4 =>
      'Incluir todas as etiquetas (menor prioridad)';

  @override
  String get universalPowerLoopUntilStopped => 'Repetir até parar';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Continua a percorrer a fila até parar.';

  @override
  String get universalPowerDelayBetweenCodes => 'Pausa entre códigos';

  @override
  String get universalPowerStart => 'Iniciar Ligado universal';

  @override
  String get universalPowerRunStatus => 'Estado de execução';

  @override
  String universalPowerProgress(Object value) {
    return 'Progreso: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Em pausa porque a app passou para segundo plano.';

  @override
  String get universalPowerSendOneCode => 'Enviar um código';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Deténlo en cuanto o dispositivo responda.';

  @override
  String get iconNamePlay => 'Reproduzir';

  @override
  String get iconNamePause => 'Pausa';

  @override
  String get iconNameStop => 'Parar';

  @override
  String get iconNameFastForward => 'Avance rápido';

  @override
  String get iconNameRewind => 'Rebobinar';

  @override
  String get iconNameSkipNext => 'Seguinte';

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
  String get iconNameRepeatOne => 'Repetir uma';

  @override
  String get iconNameVolumeUp => 'Volume Cima';

  @override
  String get iconNameVolumeDown => 'Volume Baixo';

  @override
  String get iconNameVolumeOff => 'Volume Desligado';

  @override
  String get iconNameMute => 'Sil.';

  @override
  String get iconNameSpeaker => 'Altavoz';

  @override
  String get iconNameSurroundSound => 'Envolvente Sonido';

  @override
  String get iconNameEqualizer => 'Ecualizador';

  @override
  String get iconNameAudio => 'Áudio';

  @override
  String get iconNameMicrophone => 'Micrófono';

  @override
  String get iconNameMicOff => 'Mic Desligado';

  @override
  String get iconNameUp => 'Cima';

  @override
  String get iconNameDown => 'Baixo';

  @override
  String get iconNameLeft => 'Esquerda';

  @override
  String get iconNameRight => 'Direita';

  @override
  String get iconNameArrowUp => 'Seta Cima';

  @override
  String get iconNameArrowDown => 'Seta Baixo';

  @override
  String get iconNameArrowLeft => 'Seta Esquerda';

  @override
  String get iconNameArrowRight => 'Seta Direita';

  @override
  String get iconNameNavigation => 'Navegación';

  @override
  String get iconNameChevronLeft => 'Chevron Esquerda';

  @override
  String get iconNameChevronRight => 'Chevron Direita';

  @override
  String get iconNameExpandLess => 'Expandir Menos';

  @override
  String get iconNameExpandMore => 'Expandir Mais';

  @override
  String get iconNameCollapse => 'Contraer';

  @override
  String get iconNameExpand => 'Expandir';

  @override
  String get iconNameCircleUp => 'Círculo Cima';

  @override
  String get iconNameCircleDown => 'Círculo Baixo';

  @override
  String get iconNameCircleLeft => 'Círculo Esquerda';

  @override
  String get iconNameCircleRight => 'Círculo Direita';

  @override
  String get iconNameOkSelect => 'OK/Selecionar';

  @override
  String get iconNameConfirm => 'Confirmar';

  @override
  String get iconNameCancel => 'Cancelar';

  @override
  String get iconNameClose => 'Fechar';

  @override
  String get iconNameHome => 'Início';

  @override
  String get iconNameReturn => 'Voltar';

  @override
  String get iconNameExit => 'Salir';

  @override
  String get iconNameUndo => 'Anular';

  @override
  String get iconNameRedo => 'Rehacer';

  @override
  String get iconNamePower => 'Enc.';

  @override
  String get iconNamePowerAlt => 'Ligado Alt';

  @override
  String get iconNamePowerOff => 'Power Desligado';

  @override
  String get iconNameOn => 'Ligado';

  @override
  String get iconNameOff => 'Desligado';

  @override
  String get iconNameToggleOn => 'Alternar ligado';

  @override
  String get iconNameToggleOff => 'Alternar desligado';

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
  String get iconNamePlus => 'Mais';

  @override
  String get iconNameMinus => 'Menos';

  @override
  String get iconNameAddCircle => 'Adicionar círculo';

  @override
  String get iconNameRemoveCircle => 'Remove Círculo';

  @override
  String get iconNameSettings => 'Definições';

  @override
  String get iconNameMenu => 'Menú';

  @override
  String get iconNameMoreVertical => 'Mais Vertical';

  @override
  String get iconNameMoreHorizontal => 'Mais Horizontal';

  @override
  String get iconNameTune => 'Ajuste';

  @override
  String get iconNameRemoteSettings => 'Comando Definições';

  @override
  String get iconNameInfo => 'Informação';

  @override
  String get iconNameInfoOutline => 'Informação contorno';

  @override
  String get iconNameHelp => 'Ajuda';

  @override
  String get iconNameHelpOutline => 'Ajuda Contorno';

  @override
  String get iconNameList => 'Lista';

  @override
  String get iconNameViewList => 'Vista List';

  @override
  String get iconNameViewGrid => 'Vista Grelha';

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
  String get iconNameBrightnessHigh => 'Brilho alto';

  @override
  String get iconNameBrightnessMedium => 'Brilho medio';

  @override
  String get iconNameBrightnessLow => 'Brilho bajo';

  @override
  String get iconNameAutoBrightness => 'Brilho automático';

  @override
  String get iconNameLightMode => 'Luz Modo';

  @override
  String get iconNameDarkMode => 'Dark Modo';

  @override
  String get iconNameContrast => 'Contraste';

  @override
  String get iconNameHdrOn => 'HDR ligado';

  @override
  String get iconNameHdrOff => 'HDR Desligado';

  @override
  String get iconNameAspectRatio => 'Relación de aspecto';

  @override
  String get iconNameCrop => 'Recortar';

  @override
  String get iconNameZoomIn => 'Acercar';

  @override
  String get iconNameZoomOut => 'Alejar';

  @override
  String get iconNameFullscreen => 'Ecrã completa';

  @override
  String get iconNameExitFullscreen => 'Exit Ecrã completa';

  @override
  String get iconNameFitScreen => 'Ajustar ecrã';

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
  String get iconNameComposite => 'Compuisto';

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
  String get iconNameDoneAll => 'Concluído Tudo';

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
  String get iconNameInvertColors => 'Inverter Colores';

  @override
  String get iconNamePalette => 'Paleta';

  @override
  String get iconNameColor => 'Cor';

  @override
  String get iconNameTonality => 'Tonalidad';

  @override
  String get iconNameSearch => 'Pesquisar';

  @override
  String get iconNameRefresh => 'Atualizar';

  @override
  String get iconNameSync => 'Sincronizar';

  @override
  String get iconNameUpdate => 'Atualizar';

  @override
  String get iconNameDownload => 'Descargar';

  @override
  String get iconNameUpload => 'Subir';

  @override
  String get iconNameCloud => 'Nube';

  @override
  String get iconNameFolder => 'Pasta';

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
  String get iconNameMicNone => 'Mic Ningum';

  @override
  String get iconNameSubtitles => 'Legendas';

  @override
  String get iconNameClosedCaption => 'Legendas cerrados';

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
  String get iconNameCamera => 'Câmara';

  @override
  String get iconNameVideoCamera => 'Video Câmara';

  @override
  String get iconNamePhotoCamera => 'Foto Câmara';

  @override
  String get iconNameSlowMotion => 'Lento Movimiento';

  @override
  String get iconNameSpeed => 'Velocidad';

  @override
  String get iconNameVideoSettings => 'Video Definições';

  @override
  String get iconNameAudioTrack => 'Pista de áudio';

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
  String get iconNamePlayFa => 'Reproduzir FA';

  @override
  String get iconNamePauseFa => 'Pausa FA';

  @override
  String get iconNameStopFa => 'Parar FA';

  @override
  String get iconNamePlayFaOutline => 'Reproduzir FA Contorno';

  @override
  String get iconNamePauseFaOutline => 'Pausa FA Contorno';

  @override
  String get iconNameStopFaOutline => 'Parar FA Contorno';

  @override
  String get iconNameBackwardFa => 'Atrás FA';

  @override
  String get iconNameForwardFa => 'Adelante FA';

  @override
  String get iconNamePreviousFa => 'Anterior FA';

  @override
  String get iconNameNextFa => 'Seguinte FA';

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
  String get iconNameCameraFa => 'Câmara FA';

  @override
  String get iconNameCameraRetroFa => 'Câmara Retro FA';

  @override
  String get iconNameVolumeHighFa => 'Volume alto FA';

  @override
  String get iconNameVolumeLowFa => 'Volume bajo FA';

  @override
  String get iconNameVolumeOffFa => 'Volume Desligado FA';

  @override
  String get iconNameMuteFa => 'Silencio FA';

  @override
  String get iconNameMicMuteFa => 'Mic silenciado FA';

  @override
  String get iconNameHeadphonesFa => 'Auriculares FA';

  @override
  String get iconNameSpeakerFa => 'Altavoz FA';

  @override
  String get iconNameUpFa => 'Cima FA';

  @override
  String get iconNameDownFa => 'Baixo FA';

  @override
  String get iconNameLeftFa => 'Esquerda FA';

  @override
  String get iconNameRightFa => 'Direita FA';

  @override
  String get iconNameUpFaOutline => 'Cima FA Contorno';

  @override
  String get iconNameDownFaOutline => 'Baixo FA Contorno';

  @override
  String get iconNameLeftFaOutline => 'Esquerda FA Contorno';

  @override
  String get iconNameRightFaOutline => 'Direita FA Contorno';

  @override
  String get iconNameArrowUpFa => 'Seta Cima FA';

  @override
  String get iconNameArrowDownFa => 'Seta Baixo FA';

  @override
  String get iconNameArrowLeftFa => 'Seta Esquerda FA';

  @override
  String get iconNameArrowRightFa => 'Seta Direita FA';

  @override
  String get iconNameChevronUpFa => 'Chevron Cima FA';

  @override
  String get iconNameChevronDownFa => 'Chevron Baixo FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron Esquerda FA';

  @override
  String get iconNameChevronRightFa => 'Chevron Direita FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Contorno';

  @override
  String get iconNameCheckFa => 'Marca FA';

  @override
  String get iconNameCloseFa => 'Fechar FA';

  @override
  String get iconNameCloseCircleFa => 'Close Círculo FA';

  @override
  String get iconNameHomeFa => 'Início FA';

  @override
  String get iconNameUndoFa => 'Anular FA';

  @override
  String get iconNameRedoFa => 'Rehacer FA';

  @override
  String get iconNameRotateFa => 'Girar FA';

  @override
  String get iconNameSearchFa => 'Pesquisar FA';

  @override
  String get iconNameRefreshFa => 'Atualizar FA';

  @override
  String get iconNamePowerOffFa => 'Power Desligado FA';

  @override
  String get iconNamePlugFa => 'Enchufe FA';

  @override
  String get iconNameToggleOnFa => 'Alternar ligado FA';

  @override
  String get iconNameToggleOffFa => 'Alternar desligado FA';

  @override
  String get iconNameSettingsFa => 'Definições FA';

  @override
  String get iconNameSettingsAltFa => 'Definições Alt FA';

  @override
  String get iconNameMenuFa => 'Menú FA';

  @override
  String get iconNameMoreFa => 'Mais FA';

  @override
  String get iconNameMoreVerticalFa => 'Mais Vertical FA';

  @override
  String get iconNameInfoFa => 'Informação FA';

  @override
  String get iconNameInfoFaOutline => 'Informação FA contorno';

  @override
  String get iconNameHelpFa => 'Ajuda FA';

  @override
  String get iconNameHelpFaOutline => 'Ajuda FA Contorno';

  @override
  String get iconNameListFa => 'Lista FA';

  @override
  String get iconNameGridFa => 'Grelha FA';

  @override
  String get iconNameSlidersFa => 'Deslizadores FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'Monitor FA';

  @override
  String get iconNameDesktopFa => 'Escritorio FA';

  @override
  String get iconNameBrightnessFa => 'Brilho FA';

  @override
  String get iconNameNightModeFa => 'Noche Modo FA';

  @override
  String get iconNameLightFa => 'Luz FA';

  @override
  String get iconNameLightFaOutline => 'Luz FA Contorno';

  @override
  String get iconNameFlashFa => 'Flash FA';

  @override
  String get iconNameFullscreenFa => 'Ecrã completa FA';

  @override
  String get iconNameExitFullscreenFa => 'Exit Ecrã completa FA';

  @override
  String get iconNameZoomInFa => 'Acercar FA';

  @override
  String get iconNameZoomOutFa => 'Alejar FA';

  @override
  String get iconNameSubtitlesFa => 'Legendas FA';

  @override
  String get iconNamePictureInPictureFa => 'Imagem en imagem FA';

  @override
  String get iconNameColorFa => 'Cor FA';

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
  String get iconNameGamepadFa => 'Comando FA';

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
  String get iconNameImagesFa => 'Imagens FA';

  @override
  String get iconNameImageFa => 'Imagem FA';

  @override
  String get iconNameVideoFileFa => 'Ficheiro de video FA';

  @override
  String get iconNameAudioFileFa => 'Ficheiro de áudio FA';

  @override
  String get iconNamePlayOutlineFa => 'Reproduzir Contorno FA';

  @override
  String get iconNamePlaySimpleFa => 'Reproduzir simple FA';

  @override
  String get iconNamePauseSimpleFa => 'Pausa simple FA';

  @override
  String get iconNameStopSimpleFa => 'Parar simple FA';

  @override
  String get iconNameRecordFa => 'Grabar FA';

  @override
  String get iconNameStopCircleFa => 'Parar Círculo FA';

  @override
  String get iconNameLoadingFa => 'Cargando FA';

  @override
  String get iconNameTextFa => 'Texto FA';

  @override
  String get iconNameTextSizeFa => 'Texto Tamanho FA';

  @override
  String get iconNameLanguageFa => 'Idioma FA';

  @override
  String get iconNameGlobeFa => 'Globo FA';

  @override
  String get iconNameSubtitlesAltFa => 'Legendas Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Legendas Alt Contorno FA';

  @override
  String get iconNameChannelUpFa => 'Canal Cima FA';

  @override
  String get iconNameChannelDownFa => 'Canal Baixo FA';

  @override
  String get iconNamePageUpFa => 'Página Cima FA';

  @override
  String get iconNamePageDownFa => 'Página Baixo FA';

  @override
  String get iconNameGuideFa => 'Guía FA';

  @override
  String get iconNameGridViewFa => 'Grelha Vista FA';

  @override
  String get iconNameGridAltFa => 'Grelha Alt FA';

  @override
  String get iconNameScheduleFa => 'Programación FA';

  @override
  String get iconNameCalendarFa => 'Calendario FA';

  @override
  String get iconNameRedButtonFa => 'Rojo Botão FA';

  @override
  String get iconNameButtonOutlineFa => 'Botão Contorno FA';

  @override
  String get iconNameSquareButtonFa => 'Quadrado Botão FA';

  @override
  String get iconNameSquareOutlineFa => 'Quadrado Contorno FA';

  @override
  String get iconNameDotCircleFa => 'Punto Círculo FA';

  @override
  String get iconNameToolsFa => 'Herramientas FA';

  @override
  String get iconNameScrewdriverFa => 'Distornillador FA';

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
  String get iconNameSortDownFa => 'Ordenar Baixo FA';

  @override
  String get iconNameSortUpFa => 'Ordenar Cima FA';

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
  String get iconNameSquareFullFa => 'Quadrado Completo FA';

  @override
  String get iconNameFullscreenAltFa => 'Ecrã completa Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Zoom Mais FA';

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
  String get iconNameSignalFa => 'Sinal FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => 'Círculo Seta Cima FA';

  @override
  String get iconNameCircleArrowDownFa => 'Círculo Seta Baixo FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Círculo Seta Esquerda FA';

  @override
  String get iconNameCircleArrowRightFa => 'Círculo Seta Direita FA';

  @override
  String get iconNameLongArrowUpFa => 'Largo Seta Cima FA';

  @override
  String get iconNameLongArrowDownFa => 'Largo Seta Baixo FA';

  @override
  String get iconNameLongArrowLeftFa => 'Largo Seta Esquerda FA';

  @override
  String get iconNameLongArrowRightFa => 'Largo Seta Direita FA';

  @override
  String get iconNamePlusFa => 'Mais FA';

  @override
  String get iconNameMinusFa => 'Menos FA';

  @override
  String get iconNamePlusCircleFa => 'Mais Círculo FA';

  @override
  String get iconNameMinusCircleFa => 'Menos Círculo FA';

  @override
  String get iconNamePlusSquareFa => 'Mais Quadrado FA';

  @override
  String get iconNameMinusSquareFa => 'Menos Quadrado FA';

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
  String get iconNameCloudMoonFa => 'Nube Luma FA';

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
  String get unknownLabel => 'Desconhecido';

  @override
  String get selectedFilesLabel => 'ficheiro(s) selecionado(s)';

  @override
  String get folderNotFoundOrInaccessible =>
      'Pasta não encontrada o inaccesible.';

  @override
  String get importedRemoteDefaultName => 'MandoImportado';

  @override
  String get demoRemoteName => 'Comando demo';

  @override
  String get protocolFieldsInvalid =>
      'Rellena os campos obrigatórios do protocolo e asegúrate de que a frecuencia sea 15k–60k se se define.';

  @override
  String get unknownProtocolSelected =>
      'Foi selecionado um protocolo desconhecido.';

  @override
  String get continueSectionTitle => 'Continue';

  @override
  String get continueSectionSubtitle => 'Pick up where you left off.';

  @override
  String get continueLastRemoteTitle => 'Último comando';

  @override
  String get continueLastMacroTitle => 'Last macro';

  @override
  String get continueLastIrFinderHitTitle => 'Last IR Finder hit';

  @override
  String get continueTargetUnavailable => 'Este item já não está disponível.';

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
  String get pinRemote => 'Fixar comando';

  @override
  String get unpinRemote => 'Desafixar comando';

  @override
  String get pinRemoteSubtitle =>
      'Mantenha este comando no topo para lhe aceder rapidamente.';

  @override
  String get remoteAddedToPinned => 'Comando fixado.';

  @override
  String get remoteRemovedFromPinned => 'Comando desafixado.';

  @override
  String get homeDeviceControlsTitle => 'Controlos rápidos';

  @override
  String get homeDeviceControlsSubtitle =>
      'Ligar, silenciar e volume sem abrir um comando.';

  @override
  String get homeDeviceControlsEmptySubtitle =>
      'Configure botões de ligar, silenciar e volume nos Controlos do dispositivo.';

  @override
  String get showDeviceControlsOnHome => 'Mostrar controlos rápidos no início';

  @override
  String get showDeviceControlsOnHomeSubtitle =>
      'Mostra a linha compacta de Ligar, Silenciar e Volume no ecrã principal.';

  @override
  String get homeDeviceControlsShown =>
      'Controlos rápidos visíveis na aplicação.';

  @override
  String get homeDeviceControlsHidden =>
      'Controlos rápidos ocultos na aplicação.';

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
  String get globalSearchNoResults => 'Não foram encontrados resultados.';

  @override
  String get globalSearchTypeRemote => 'Comando';

  @override
  String get globalSearchTypeButton => 'Botão';

  @override
  String get globalSearchTypeMacro => 'Macro';

  @override
  String get learningModeCaptureFailed => 'Não foi possível captar o sinal.';

  @override
  String get learningModeReplaySent => 'Sinal enviado.';

  @override
  String get learningModeReplayFailed =>
      'Não foi possível enviar o sinal capturado.';

  @override
  String get learningModeNoRemotesAvailable =>
      'Ainda não há comandos guardados.';

  @override
  String get learningModeChooseRemoteTitle => 'Escolher comando';

  @override
  String get learningModeNewRemoteTitle => 'Criar comando';

  @override
  String get learningModeSaveSuccess => 'Botão guardado.';

  @override
  String get learningModeSaveFailed => 'Não foi possível guardar o botão.';

  @override
  String get remoteSetupIntro =>
      'Escolha um nome e uma disposição. Adicione os botões no passo seguinte.';

  @override
  String get startWithDefault => 'Nome predefinido';

  @override
  String get browseGithubStore => 'Explorar GitHub';

  @override
  String get addFirstButton => 'Adicionar primeiro botão';

  @override
  String get moreWaysToStart => 'Outras formas de adicionar botões';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Descartar a configuração deste novo comando? As alterações não serão guardadas.';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Descartar as alterações deste comando? Não serão guardadas.';

  @override
  String get firstButtonAdded => 'Primeiro botão adicionado.';

  @override
  String get iconColorTitle => 'Cor do ícone';

  @override
  String get iconColorHelper =>
      'Escolha uma cor para o símbolo que continue visível sobre o fundo do botão.';

  @override
  String get colorRed => 'Vermelho';

  @override
  String get colorPink => 'Rosa';

  @override
  String get colorPurple => 'Roxo';

  @override
  String get colorDeepPurple => 'Roxo escuro';

  @override
  String get colorIndigo => 'Índigo';

  @override
  String get colorBlue => 'Azul';

  @override
  String get colorLightBlue => 'Azul claro';

  @override
  String get colorCyan => 'Ciano';

  @override
  String get colorTeal => 'Verde-azulado';

  @override
  String get colorGreen => 'Verde';

  @override
  String get colorLightGreen => 'Verde claro';

  @override
  String get colorLime => 'Lima';

  @override
  String get colorYellow => 'Amarelo';

  @override
  String get colorAmber => 'Âmbar';

  @override
  String get colorOrange => 'Laranja';

  @override
  String get colorDeepOrange => 'Laranja escuro';

  @override
  String get colorBrown => 'Castanho';

  @override
  String get colorGrey => 'Cinzento';

  @override
  String get colorBlueGrey => 'Cinzento azulado';

  @override
  String get colorBlack => 'Preto';

  @override
  String get colorWhite => 'Branco';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Cor do botão $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Cor do botão $colorName, selecionada';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Cor do ícone $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Cor do ícone $colorName, selecionada';
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

  @override
  String get quickSettingsTilesTitle => 'Blocos das Definições rápidas';

  @override
  String get quickSettingsPowerTile => 'Bloco de ligar';

  @override
  String get quickSettingsMuteTile => 'Bloco de silêncio';

  @override
  String get quickSettingsVolumeUpTile => 'Bloco de aumentar volume';

  @override
  String get quickSettingsVolumeDownTile => 'Bloco de baixar volume';

  @override
  String get quickSettingsNoTilesConfigured => 'Nenhum bloco configurado';

  @override
  String get quickSettingsEmptyHint =>
      'Próximo passo: escolha um comando para pelo menos um bloco e depois adicione o bloco no menu de edição das Definições rápidas do Android.';

  @override
  String get quickSettingsSetPowerTile => 'Configurar bloco de ligar';

  @override
  String get quickSettingsConfiguredHint =>
      'Escolha qual botão cada bloco envia. Adicione os blocos no menu de edição das Definições rápidas do Android.';

  @override
  String get quickSettingsNotSet => 'Não configurado';

  @override
  String quickSettingsTileMappingSummary(String title, String subtitle) {
    return '$title · $subtitle';
  }

  @override
  String get quickSettingsPickButtonTooltip => 'Escolher botão';

  @override
  String get quickSettingsClearTooltip => 'Limpar';

  @override
  String get homeWidgetUnsupportedLauncher =>
      'Adicione o widget IR Blaster através do menu de widgets do ecrã inicial.';

  @override
  String get homeWidgetButtonUnsupported =>
      'Este botão não pode ser adicionado como widget ao ecrã inicial.';

  @override
  String get homeWidgetRequestSent =>
      'Pedido de adição enviado. Confirme no ecrã inicial, se necessário.';

  @override
  String get homeWidgetRequestRejected =>
      'Não foi possível iniciar a adição do widget. Experimente adicioná-lo a partir do ecrã inicial.';

  @override
  String homeWidgetSetupFailed(String error) {
    return 'Não foi possível configurar o widget: $error';
  }

  @override
  String get addHomeWidget => 'Adicionar widget ao ecrã inicial';

  @override
  String get addHomeWidgetSubtitle => 'Coloque este botão no ecrã inicial.';

  @override
  String buttonInfoType(String type) {
    return 'Tipo: $type';
  }

  @override
  String get buttonInfoCodeRaw => 'Código: sinal bruto';

  @override
  String buttonInfoCode(String code) {
    return 'Código: $code';
  }

  @override
  String get buttonInfoNoCode => 'SEM CÓDIGO';

  @override
  String buttonInfoFrequency(String frequency) {
    return 'Frequência: $frequency';
  }

  @override
  String get frequencyHzLabel => 'Frequência (Hz)';

  @override
  String get carrierFrequencyHelper => 'Frequência portadora, ex. 38000';

  @override
  String get requiredFrequencyHelper => 'Obrigatório. Exemplo: 38000';

  @override
  String get validFrequencyError =>
      'Introduza uma frequência válida (15k-60k).';

  @override
  String get resetToDefaultFrequency => 'Repor para 38000';

  @override
  String get rawDataLabel => 'Dados brutos';

  @override
  String get rawDataHelper =>
      'Números inteiros separados por espaços, ex. 9000 4500 560 560 ...';

  @override
  String get rawDataInvalid =>
      'Os dados brutos devem ser números inteiros separados por espaços ou novas linhas.';

  @override
  String get rawDataSafeguard =>
      'Proteção: tokens inválidos são bloqueados para evitar guardar um padrão que não pode ser enviado.';

  @override
  String get protocolLabel => 'Protocolo';

  @override
  String get protocolEncodingHelper =>
      'A codificação só está implementada para protocolos marcados como implementados.';

  @override
  String get protocolFrequencyHelper =>
      'Opcional. Se estiver vazio, é usada a frequência predefinida do protocolo quando disponível.';

  @override
  String get rawSignalInvalidWithFrequency =>
      'Os dados brutos devem ser números inteiros separados por espaços ou novas linhas, e a frequência deve ser 15k-60k.';

  @override
  String get necTimingsNumeric => 'Todos os tempos NEC devem ser numéricos.';

  @override
  String get frequencyRangeError => 'A frequência deve ser 15k-60k Hz.';

  @override
  String get pasteTooltip => 'Colar';

  @override
  String get clearTooltip => 'Limpar';

  @override
  String irFinderResumeMask(Object value) {
    return 'Máscara: $value';
  }

  @override
  String get irFinderKnownMaskLabel => 'Máscara de código conhecida (opcional)';

  @override
  String get irFinderKnownMaskHint => '00FFXXFF, FFXXFF ou 0xA1XX';

  @override
  String irFinderKnownMaskHelper(int digits, Object example) {
    return 'Carga de $digits dígitos. Use X para dígitos desconhecidos; os dígitos finais omitidos tornam-se X. Exemplo: $example';
  }

  @override
  String get irFinderKnownMaskInvalidCharacters =>
      'Use apenas dígitos hexadecimais, curingas X, espaços, dois-pontos, hífenes ou sublinhados.';

  @override
  String irFinderKnownMaskTooLong(int digits) {
    return 'A máscara excede a carga de $digits dígitos deste protocolo.';
  }

  @override
  String irFinderNormalizedMaskValue(Object value) {
    return 'Máscara normalizada: $value';
  }

  @override
  String get irFinderNormalizedMask => 'Máscara normalizada';

  @override
  String get irFinderNormalizedMaskAllUnknown =>
      'Todos os dígitos são desconhecidos';

  @override
  String get irFinderSearchOrder => 'Ordem de pesquisa';

  @override
  String get irFinderSmartOrder => 'Inteligente';

  @override
  String get irFinderSequentialOrder => 'Sequencial';

  @override
  String get irFinderSmartOrderHint =>
      'Conforme o protocolo: testa primeiro valores baixos comuns, depois distribui pelos campos de comando e dispositivo e ignora bits não usados.';

  @override
  String get irFinderSequentialOrderHint =>
      'Modo de compatibilidade: testa os curingas por ordem hexadecimal crescente.';

  @override
  String irFinderSmartMeaningfulBits(int bits) {
    return 'O modo inteligente varia $bits bit(s) significativos para esta máscara.';
  }

  @override
  String get irFinderBruteforceMaskTip =>
      'Dica: substitua cada dígito desconhecido por X. Fixar dígitos conhecidos em qualquer posição reduz bastante a pesquisa.';

  @override
  String get automationBroadcastsTitle =>
      'Permitir transmissões de automatização';

  @override
  String get automationBroadcastsSubtitle =>
      'Qualquer aplicação instalada pode enviar comandos IR pelo emissor integrado, USB ou áudio, mesmo com esta aplicação fechada. USB requer autorização prévia. O áudio requer um adaptador IR e o volume multimédia aumentado.';

  @override
  String get automationSettingsError =>
      'Não foi possível carregar ou guardar a definição de automatização. Tente novamente.';

  @override
  String get settingsHardwareTitle => 'Hardware IR e aprendizagem';

  @override
  String get settingsHardwareSubtitle =>
      'Escolher um emissor, gerir USB e aprender sinais';

  @override
  String get settingsAppearanceSubtitle => 'Tema, cores e idioma da aplicação';

  @override
  String get settingsInteractionSubtitle =>
      'Arranque, vibração, visualização do comando e automatização';

  @override
  String get settingsToolsTitle => 'Ferramentas e atalhos';

  @override
  String get settingsToolsSubtitle =>
      'Controlos de dispositivos, definições rápidas, loja GitHub e ligar/desligar universal';

  @override
  String get layoutCustom => 'Personalizada';

  @override
  String get layoutCustomDescription =>
      'Escolha o número de colunas e a forma dos botões. Adicione espaços vazios no editor.';

  @override
  String get layoutColumns => 'Botões por linha';

  @override
  String get layoutShape => 'Forma dos botões';

  @override
  String get layoutCircle => 'Círculo';

  @override
  String get layoutRoundedSquare => 'Quadrado arredondado';

  @override
  String get layoutRectangle => 'Retângulo';

  @override
  String get layoutReflowHint =>
      'Alterar o número de colunas reorganiza a grelha. Deslize para os lados se a grelha for mais larga do que o ecrã.';

  @override
  String get layoutUpdated => 'Disposição atualizada';

  @override
  String get layoutArrange => 'Organizar botões';

  @override
  String get layoutAddRow => 'Adicionar linha vazia';

  @override
  String get layoutArrangeHint =>
      'Mantenha um botão premido e arraste-o, ou toque nele e depois na nova posição. Se já houver outro botão, trocam de lugar.';

  @override
  String get layoutEmptyHint =>
      'Toque num espaço vazio para adicionar um botão ou num botão para o editar. Mantenha-o premido para ver mais opções.';

  @override
  String layoutCell(int row, int column) {
    return 'Linha $row, coluna $column';
  }

  @override
  String get dbBrandSearchHelp =>
      'Comece pela marca, como Sony ou TCL. Depois escolha um modelo de dispositivo ou comando.';

  @override
  String get dbModelSearchHelp =>
      'Procure o modelo indicado no dispositivo ou comando. Os espaços e hífenes não precisam de corresponder.';

  @override
  String get irFinderDatabaseSearchHint =>
      'Comece por uma marca no modo Base de dados para testar códigos conhecidos sem duplicados. A força bruta inteligente dá prioridade a algumas hipóteses, mas não deteta a resposta do dispositivo. Guarde um resultado quando observar uma resposta.';

  @override
  String get irFinderClearSearchToJump =>
      'Limpe a pesquisa para saltar para uma posição do teste.';

  @override
  String get crashReportTitle => 'Ocorreu um problema anteriormente';

  @override
  String get crashReportExplanation =>
      'Um relatório local contém detalhes técnicos da aplicação, do dispositivo e do erro. Nada é enviado automaticamente. Verifique se contém informações sensíveis antes de partilhar. Partilhar mantém o relatório; Não enviar elimina-o; Agora não guarda-o para o próximo arranque.';

  @override
  String get crashReportDetails => 'Rever relatório';

  @override
  String get crashReportShare => 'Partilhar relatório';

  @override
  String get crashReportEmail => 'Contactar por email';

  @override
  String get crashReportCopied => 'Relatório copiado.';

  @override
  String get crashReportDontSend => 'Não enviar';

  @override
  String get crashReportNotNow => 'Agora não';

  @override
  String get crashReportActionFailed =>
      'Não foi possível concluir esta ação. O relatório continua guardado. Tente copiá-lo ou partilhá-lo.';

  @override
  String get shareTitle => 'Partilhar e receber';

  @override
  String get shareReceive => 'Receber';

  @override
  String get shareScan => 'Ler código QR';

  @override
  String get shareOpenFile => 'Abrir ficheiro partilhado';

  @override
  String get shareSelect => 'Escolher o que partilhar';

  @override
  String get shareSend => 'Partilhar com outro dispositivo';

  @override
  String get shareQr => 'Mostrar código QR';

  @override
  String get shareQrHint =>
      'No outro telemóvel, abra IR Blaster > Comandos > Partilhar e receber > Ler código QR.';

  @override
  String get shareTooLarge =>
      'Demasiados dados para um QR legível. Utilize a partilha com outro dispositivo.';

  @override
  String get sharePreview => 'Rever itens partilhados';

  @override
  String get sharePrivacy =>
      'Não é necessária conta nem servidor. Nada é enviado ou emitido automaticamente. O dispositivo recetor precisa de um emissor IR compatível.';

  @override
  String get shareHardwareWarning =>
      'Alguns sinais aprendidos exigem o equipamento original e podem não funcionar noutro dispositivo.';

  @override
  String get shareMacroInfo =>
      'As macros incluem os comandos e botões associados. A importação cria cópias; nada é substituído ou executado automaticamente.';

  @override
  String get shareAdd => 'Adicionar cópias';

  @override
  String get shareAdded => 'Itens partilhados adicionados.';

  @override
  String get shareDestination => 'Adicionar botão a';

  @override
  String get shareCamera =>
      'Permita o acesso à câmara para ler códigos QR ou abra um ficheiro partilhado.';

  @override
  String get shareInvalid =>
      'Esta partilha é inválida, demasiado grande ou usa uma versão não suportada.';

  @override
  String get sharePrepareFailed =>
      'Não foi possível preparar a partilha. Verifique imagens ou botões de macros em falta e o tamanho da seleção.';

  @override
  String get shareFailed =>
      'Não foi possível concluir a partilha ou gravação. Os itens existentes não foram substituídos.';

  @override
  String get updatesTitle => 'Atualizações da aplicação';

  @override
  String get updatesAutomatic => 'Verificar atualizações automaticamente';

  @override
  String get updatesPrivacyGithub =>
      'Desativado por predefinição. Quando ativado, contacta o GitHub uma vez por dia durante a utilização da aplicação. Sem transferências automáticas.';

  @override
  String get updatesPrivacyPlay =>
      'Desativado por predefinição. Quando ativado, contacta o Google Play uma vez por dia durante a utilização da aplicação. Sem transferências automáticas.';

  @override
  String get updatesUnknown => 'Desconhecida';

  @override
  String get updatesChooseSource => 'Escolher origem das atualizações';

  @override
  String get updatesCheck => 'Verificar agora';

  @override
  String get updatesNever => 'Ainda não foi verificado';

  @override
  String updatesLastChecked(String date) {
    return 'Última verificação: $date';
  }

  @override
  String updatesAvailable(String version) {
    return 'Nova versão: $version';
  }

  @override
  String get updatesCurrent => 'Não foi encontrada uma versão mais recente.';

  @override
  String get updatesFailed =>
      'A atualização falhou. Verifique a ligação e tente novamente. Os APK incompatíveis são bloqueados; os dados da aplicação não são eliminados.';

  @override
  String get updatesFdroidNote =>
      'O GitHub pode anunciar uma versão antes de o F-Droid a compilar. Atualize através do F-Droid para manter uma assinatura compatível e os seus dados.';

  @override
  String get updatesOpenFdroid => 'Abrir F-Droid';

  @override
  String get updatesOpenPlay => 'Abrir Google Play';

  @override
  String get updatesDownload => 'Transferir atualização';

  @override
  String get updatesInstall => 'Instalar atualização';

  @override
  String get updatesAllowInstall => 'Permitir instalação';

  @override
  String get updatesInstallHint =>
      'O Android poderá pedir autorização para instalar a partir desta aplicação. Volte aqui e toque em Instalar atualização. Os seus comandos e macros são mantidos.';

  @override
  String get updatesReady => 'Atualização transferida e pronta a instalar.';

  @override
  String get updatesNoAsset =>
      'Não está disponível um APK verificado para este dispositivo. Consulte as notas da versão.';

  @override
  String get updatesReleaseNotes => 'Notas da versão';

  @override
  String updatesChannel(String source) {
    return 'Origem das atualizações: $source';
  }

  @override
  String updatesDownloadConfirm(String size) {
    return 'Transferir $size MB do GitHub? A instalação requer a sua confirmação.';
  }

  @override
  String get learningModeIncompleteSignal =>
      'O sinal parece incompleto. Aproxime o comando e tente novamente.';

  @override
  String get learningModeUseUsb => 'Usar adaptador USB';

  @override
  String get learningModeSwitchedUsb => 'Adaptador USB selecionado.';

  @override
  String learningModeSwitchUsbFailed(String error) {
    return 'Não foi possível selecionar o adaptador USB: $error';
  }

  @override
  String get learningModeAudioUnavailableTitle =>
      'Aprendizagem por áudio indisponível';

  @override
  String get learningModeAudioUnavailableBody =>
      'Os acessórios IR de áudio podem enviar comandos, mas não aprender sinais nesta aplicação. Utilize um recetor compatível com a aprendizagem.';

  @override
  String learningModeBuiltInReceiver(String brand) {
    return 'Recetor IR integrado $brand';
  }

  @override
  String get learningModeUsbReceiver => 'Recetor USB de aprendizagem';

  @override
  String learningModeDefaultRemoteName(String buttonName) {
    return 'Comando $buttonName';
  }

  @override
  String get learningModeSupportedReceivers =>
      'Utilize um recetor suportado pela aplicação:\n• Um adaptador IR USB compatível Tiqiaa, ZaZa ou ElkSmart\n• Um telemóvel Huawei / Honor suportado com receção IR\n• Um telemóvel LG suportado com UEI Quickset\n\nNem todos os modelos permitem aprender sinais.';

  @override
  String learningModeCapturedWith(String device) {
    return 'Sinal captado com $device';
  }

  @override
  String get learningModeLgReplayRestriction =>
      'Para reenviar este sinal, utilize o mesmo telemóvel LG com que o captou.';

  @override
  String learningModeTimingCount(int count) {
    return 'Intervalos registados: $count';
  }

  @override
  String get learningModeUnknownCarrier => 'Frequência portadora desconhecida';

  @override
  String learningModeByteCount(int count) {
    return 'Bytes: $count';
  }
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'IR Blaster';

  @override
  String get loading => 'Carregando…';

  @override
  String get unknownError => 'Erro desconhecido';

  @override
  String get failedToStart => 'Falha ao iniciar';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get quickTilePower => 'Ligar/desligar';

  @override
  String get quickTileMute => 'Silenciar';

  @override
  String get quickTileVolumeUp => 'Vol +';

  @override
  String get quickTileVolumeDown => 'Vol -';

  @override
  String get homeUsbPermissionRequiredMessage =>
      'Adaptador IR USB detectado. Permita o acesso USB para enviar comandos.';

  @override
  String get homeUsbPermissionDeniedMessage =>
      'O acesso USB foi negado. Solicite a permissão novamente e permita o acesso para enviar comandos.';

  @override
  String get homeUsbPermissionGrantedMessage =>
      'O acesso USB está permitido, mas o adaptador ainda não está pronto.';

  @override
  String get homeUsbOpenFailedMessage =>
      'Não foi possível conectar ao adaptador USB, mesmo com a permissão. Desconecte, conecte novamente e tente de novo.';

  @override
  String get homeUsbReadyMessage => 'Adaptador IR USB pronto.';

  @override
  String get homeUsbNoDeviceMessage =>
      'Este celular não tem emissor IR integrado e nenhum adaptador IR USB compatível está conectado.';

  @override
  String get homeUsbOptionPlugIn =>
      'Conecte um adaptador IR USB compatível e permita o acesso.';

  @override
  String get homeUsbOptionReady => 'Pronto para enviar.';

  @override
  String get homeUsbOptionPermissionRequired =>
      'Conectado. Permita o acesso USB.';

  @override
  String get homeUsbOptionPermissionDenied =>
      'Acesso negado. Solicite a permissão novamente.';

  @override
  String get homeUsbOptionPermissionGranted =>
      'Acesso permitido. Aguardando o adaptador.';

  @override
  String get homeUsbOptionOpenFailed =>
      'Falha na conexão. Reconecte o adaptador.';

  @override
  String get homeHardwareBannerNoInternal =>
      'Sem emissor IR integrado. Use um adaptador IR USB compatível ou um acessório de áudio para IR.';

  @override
  String get homeHardwareBannerPermissionRequired =>
      'Conectado. Permita o acesso USB.';

  @override
  String get homeHardwareBannerPermissionDenied =>
      'Acesso negado. Solicite a permissão novamente.';

  @override
  String get homeHardwareBannerPermissionGranted =>
      'Acesso permitido. Aguardando o adaptador.';

  @override
  String get homeHardwareBannerOpenFailed =>
      'Falha na conexão. Reconecte o adaptador.';

  @override
  String get homeHardwareBannerReady => 'Pronto para enviar.';

  @override
  String get homeHardwareRequiredTitle => 'É necessário um emissor IR';

  @override
  String get homeUsbDongleRecommended => 'Adaptador IR USB (recomendado)';

  @override
  String get homeAudioAdapterAlternative => 'Adaptador IR por áudio';

  @override
  String get homeAudioAdapterDescription =>
      'Requer um adaptador de áudio para IR. Nas configurações, escolha Áudio (1 ou 2 LEDs) e aumente o volume de mídia.';

  @override
  String get close => 'Fechar';

  @override
  String get homeChooseTransmitter => 'Escolher emissor';

  @override
  String get openSettings => 'Abrir Configurações';

  @override
  String get homeUsbPermissionSentApprove =>
      'Permissão solicitada. Permita o acesso USB na janela do Android.';

  @override
  String get homeUsbDongleNotDetected =>
      'Nenhum adaptador IR USB compatível encontrado. Conecte-o e tente novamente.';

  @override
  String get homeUsbPermissionRequestFailed =>
      'Não foi possível solicitar acesso USB. Tente novamente.';

  @override
  String get working => 'Processando…';

  @override
  String get requestUsbPermission => 'Solicitar acesso USB';

  @override
  String get homeHardwareTip =>
      'Você já pode preparar seus controles. O emissor IR só é necessário para enviar comandos.';

  @override
  String get homeNoIrTransmitterTitle => 'Nenhum emissor IR disponível';

  @override
  String get homeHardwareRequiredBody =>
      'Você pode criar e organizar controles remotos sem um emissor IR. Para controlar um aparelho, use uma das opções abaixo.';

  @override
  String get homeCanStillUseWithoutHardware =>
      'Você ainda pode criar, importar e organizar controles remotos.';

  @override
  String get homeWaysToUseIrBlaster => 'Opções de hardware';

  @override
  String get homeBuiltInIrOptionTitle => 'Emissor IR integrado';

  @override
  String get homeBuiltInIrOptionSubtitle =>
      'Alguns celulares têm um emissor IR integrado. Este celular não tem.';

  @override
  String get homeBuiltInIrUnavailable => 'Não integrado neste celular';

  @override
  String get homeUsbFamilyTiqiaaZaza => 'Tiqiaa / ZaZa';

  @override
  String get homeUsbFamilyElkSmart => 'ElkSmart';

  @override
  String get homeAudioAccessoryLabel => 'Adaptador de áudio para IR';

  @override
  String get homeContinueWithoutHardware => 'Continuar sem enviar';

  @override
  String get homeHowItWorks => 'Como funciona';

  @override
  String get settingsNavLabel => 'configurações';

  @override
  String get dismiss => 'Descartar';

  @override
  String get remotesNavLabel => 'controles';

  @override
  String get macrosNavLabel => 'Macros';

  @override
  String get signalTesterNavLabel => 'Probador IR';

  @override
  String get settingsTitle => 'configurações';

  @override
  String get remoteNoIrEmitterTitle => 'Emissor IR indisponível';

  @override
  String get remoteNoIrEmitterMessage =>
      'Nenhum emissor IR utilizável foi detectado.';

  @override
  String get remoteNoIrEmitterNeedsEmitter =>
      'Para enviar sinais, você precisa de um emissor IR integrado ou de um emissor externo compatível.';

  @override
  String get remoteDismiss => 'Continuar explorando';

  @override
  String get remoteClose => 'Fechar aplicativo';

  @override
  String remoteFailedToSend(Object error) {
    return 'Falha ao enviar IR: $error';
  }

  @override
  String remoteFailedToStartLoop(Object error) {
    return 'Não foi possível iniciar o ciclo: $error';
  }

  @override
  String remoteLoopStoppedFailed(Object error) {
    return 'Ciclo parado, envio falhado: $error';
  }

  @override
  String remoteLoopingHint(Object title) {
    return 'Repetindo \"$title\". Toque em Parar acima para parar.';
  }

  @override
  String get remoteLoopStopped => 'Ciclo detenido.';

  @override
  String get remoteUpdatedNotFound =>
      'O controle foi atualizado na tela. Não foi encontrado na lista salva.';

  @override
  String remoteUpdatedNamed(Object name) {
    return 'Foi atualizado \"$name\".';
  }

  @override
  String remoteDeleteFailed(Object error) {
    return 'Não foi possível excluir o controle: $error';
  }

  @override
  String get remoteNotFoundSavedList =>
      'Este controle não foi encontrado na lista de controles salvos.';

  @override
  String remoteDeletedNamed(Object name) {
    return 'Controle “$name” excluído.';
  }

  @override
  String get buttonFallbackTitle => 'Botão';

  @override
  String get imageFallbackTitle => 'Imagem';

  @override
  String get noBrowserAvailable => 'Nenhum navegador disponível';

  @override
  String failedToOpen(Object error) {
    return 'Não foi possível abrir: $error';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get settingsRestoreDemoTitle => 'Restaurar controles de demonstração?';

  @override
  String get settingsRestoreDemoMessage =>
      'Isto vai substituir os seus controles atuais pelos controles de demonstração integrados. É recomendado exportar uma cópia se quiser manter a lista atual.';

  @override
  String get settingsRestoreDemoConfirm => 'Restaurar demo';

  @override
  String get settingsDemoRemotesRestored =>
      'Controles de demonstração restaurados.';

  @override
  String get settingsDeleteAllRemotesTitle => 'Excluir todos os controles?';

  @override
  String get settingsDeleteAllRemotesMessage =>
      'Isto remove todos os controles deste dispositivo. Esta ação não pode ser desfeita.';

  @override
  String get settingsDeleteAllConfirm => 'Excluir tudo';

  @override
  String get settingsAllRemotesDeleted => 'Todos os controles foram excluídos.';

  @override
  String get themeAuto => 'Tema auto';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeDescAuto => 'Segue as configurações do dispositivo';

  @override
  String get themeDescLight => 'Sempre claro e nítido';

  @override
  String get themeDescDark => 'Descansa a vista';

  @override
  String get themeHintAuto =>
      'O tema muda apenas quando você alterna entre modo claro e escuro no dispositivo';

  @override
  String get themeHintLight =>
      'Perfeito para usar de dia e em locais bem iluminados';

  @override
  String get themeHintDark =>
      'Reduz a fadiga visual com pouca luz e economiza bateria em telas OLED';

  @override
  String get supportDevelopmentTitle => 'Apoyar desarrollo';

  @override
  String get supportDevelopmentSubtitle =>
      'Ajuda a manter o IR Blaster e a compatibilidade de hardware';

  @override
  String get supportDevelopmentBody =>
      'Sem anúncios, sem rastreamento nem funções bloqueadas. O seu apoio financia protocolos, suporte USB e melhor compatibilidade entre dispositivos.';

  @override
  String get donate => 'Donar';

  @override
  String get starRepo => 'Dar estrella';

  @override
  String get repositoryLinkCopied => 'Enlace do repositorio copiado';

  @override
  String get supportPillLocalOnly => 'Apenas local';

  @override
  String get supportPillNoTracking => 'Sem rastreio';

  @override
  String get supportPillHardwareAware => 'Consciente do hardware';

  @override
  String get supportPillOpenSource => 'Código aberto';

  @override
  String get appearanceTitle => 'Apariencia';

  @override
  String get appearanceSubtitle => 'Personalize a experiência visual';

  @override
  String get localizationTitle => 'Idioma';

  @override
  String get localizationSubtitle =>
      'Idioma do app e comportamento da tradução';

  @override
  String localizationAutoUsing(Object language) {
    return 'Auto: usando $language';
  }

  @override
  String get localizationAutoDescription =>
      'O app segue o idioma do dispositivo quando possível.';

  @override
  String get localizationManualDescription =>
      'O idioma do app foi definido manualmente.';

  @override
  String get useSystemLanguageTitle => 'Usar idioma do sistema';

  @override
  String useSystemLanguageEnabled(Object language) {
    return 'Seguindo o idioma do dispositivo: $language';
  }

  @override
  String get useSystemLanguageDisabled =>
      'Usa o idioma escolhido abaixo em vez do padrão do dispositivo.';

  @override
  String get chooseAppLanguage => 'Escolher idioma do app';

  @override
  String get languagePickerDisabledHint =>
      'Desative o idioma do sistema para escolher um manualmente.';

  @override
  String get searchLanguages => 'pesquisar idiomas';

  @override
  String get noLanguagesFound => 'Nenhum idioma correspondente';

  @override
  String get localizationHint =>
      'Se o idioma do sistema estiver ativo, o app segue a configuração regional do dispositivo e usa inglês se faltar uma tradução. Desative-o para fixar um idioma.';

  @override
  String get appLanguageTitle => 'Idioma do app';

  @override
  String get appLanguageHint =>
      'Auto segue o idioma do dispositivo. Escolha aqui inglês ou francês para forçar apenas no app.';

  @override
  String get languageAuto => 'Auto (sistema)';

  @override
  String get languageAutoDescription =>
      'Seguir o idioma do dispositivo automaticamente';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageEnglishDescription => 'Forçar o app a usar sempre inglês';

  @override
  String get languageFrench => 'Francês';

  @override
  String get languageFrenchDescription => 'Forçar o app a usar sempre francês';

  @override
  String get languageAutoShort => 'Auto';

  @override
  String get languageEnglishShort => 'Inglês';

  @override
  String get languageFrenchShort => 'Francês';

  @override
  String get useDynamicColors => 'Usar cores dinâmicas';

  @override
  String get themeChoiceAuto => 'Auto';

  @override
  String get themeChoiceLight => 'Claro';

  @override
  String get themeChoiceDark => 'Escuro';

  @override
  String get irTransmitterTitle => 'Emissor IR';

  @override
  String get irTransmitterSubtitle => 'Escolha que hardware envia controles IR';

  @override
  String get learningModeEntryTitle => 'Aprendizado IR';

  @override
  String get learningModeEntrySubtitle =>
      'Copie o sinal IR de um botão do controle remoto.';

  @override
  String get learningModeTitle => 'Aprendizado IR';

  @override
  String get learningModeHeroTitle => 'Aprenda um botão remoto de forma limpa';

  @override
  String get learningModeHeroSubtitle =>
      'Configure seu receptor, prepare o controle remoto original, capture um comando e revise-o antes de salvá-lo em um controle remoto.';

  @override
  String get learningModeReadyBadge => 'Receptor pronto';

  @override
  String get learningModeNeedsPermissionBadge => 'Permissão USB necessária';

  @override
  String get learningModeSetupBadge => 'Configuração do receptor necessária';

  @override
  String get learningModeNoReceiverBadge => 'Nenhum receptor de aprendizagem';

  @override
  String get learningModeCheckingBadge => 'Verificando hardware';

  @override
  String get learningModeFourStepFlow => 'Fluxo guiado em 4 etapas';

  @override
  String get learningModeSaveAnywhereBadge => 'Revise antes de salvar';

  @override
  String get learningModeGuideTitle => 'Escolha onde a captura deve acontecer';

  @override
  String get learningModeStepHardwareShort => 'Hardware';

  @override
  String get learningModeStepPrepareShort => 'Preparar';

  @override
  String get learningModeStepCaptureShort => 'Capturar';

  @override
  String get learningModeStepReviewShort => 'Análise';

  @override
  String get learningModeStepHardwareTitle =>
      'Verifique o hardware do receptor';

  @override
  String get learningModeStepHardwareSubtitle =>
      'Certifique-se de que um receptor de aprendizagem compatível esteja conectado e autorizado antes de começar.';

  @override
  String get learningModeCurrentSenderLabel => 'Transmissor atual';

  @override
  String get learningModeReceiverStatusLabel => 'Status de aprendizagem';

  @override
  String get learningModeCheckingHardwareBody =>
      'Verificando o transmissor e o receptor IR.';

  @override
  String get learningModeHardwareReadyBody =>
      'Um dongle USB IR é conectado e inicializado. Este é o lugar certo para iniciar o fluxo de aprendizagem assim que a fiação de captura estiver conectada.';

  @override
  String get learningModeHardwarePermissionBody =>
      'Permita o acesso ao adaptador USB para iniciar o aprendizado.';

  @override
  String get learningModeHardwareSetupBody =>
      'O receptor não está pronto. Confira a configuração ou reconecte-o e tente novamente.';

  @override
  String get learningModeHardwareNoReceiverBody =>
      'Conecte um receptor IR compatível para aprender sinais.';

  @override
  String get learningModeRefreshHardware => 'Verificar receptor';

  @override
  String get learningModeHardwareTipTitle => 'Melhor colocação';

  @override
  String get learningModeHardwareTipBody =>
      'O Modo de Aprendizagem reside no Transmissor IR porque depende da disponibilidade do hardware e é usado com menos frequência do que o envio de controles remotos.';

  @override
  String get learningModeStepPrepareTitle =>
      'Prepare o controle remoto original';

  @override
  String get learningModeStepPrepareSubtitle =>
      'Decida o que você está aprendendo e mantenha o controle remoto original estável e próximo ao receptor.';

  @override
  String get learningModeButtonNameLabel => 'Nome do botão';

  @override
  String get learningModeButtonNameHint =>
      'Por exemplo: Ligar/Desligar, HDMI 1, Menu';

  @override
  String get learningModeSinglePress => 'Pressão única';

  @override
  String get learningModeHoldButton => 'Botão segurar';

  @override
  String get learningModePreparationChecklistTitle => 'Antes de capturar';

  @override
  String get learningModePreparationItemDistance =>
      'Mantenha o controle remoto original a cerca de 2 a 5 cm do receptor.';

  @override
  String get learningModePreparationItemOneButton =>
      'Aprenda um botão de cada vez e use primeiro um toque curto e limpo.';

  @override
  String get learningModePreparationItemStill =>
      'Mantenha ambos os dispositivos estáveis ​​para evitar capturas ruidosas ou parciais.';

  @override
  String get learningModeStepCaptureTitle => 'Capture o sinal';

  @override
  String get learningModeStepCaptureSubtitle =>
      'Ouça um único comando e bloqueie o resultado antes de revisá-lo.';

  @override
  String get learningModeCaptureReadyTitle => 'Pronto para ouvir';

  @override
  String get learningModeCaptureReadyBody =>
      'O estado do seu hardware parece bom. O back-end de captura será conectado a esta etapa a seguir.';

  @override
  String get learningModeCaptureBlockedTitle =>
      'Hardware ainda não está pronto';

  @override
  String get learningModeCaptureBlockedBody =>
      'Você ainda pode revisar o fluxo agora, mas a captura deverá aguardar até que o receptor esteja pronto.';

  @override
  String get learningModeStartListening => 'Receber sinal';

  @override
  String get learningModeCaptureStubTitle =>
      'O back-end de captura vem a seguir';

  @override
  String get learningModeCaptureStubBody =>
      'Essa tela é totalmente estruturada primeiro para que o fluxo de captura final possa ser conectado aos estados reais do hardware, em vez de ser anexado posteriormente.';

  @override
  String get learningModeCaptureStubMessage =>
      'A captura de aprendizagem ainda não está conectada. Esta tela estrutura o fluxo completo primeiro.';

  @override
  String get learningModeUnnamedCapture => 'Sinal sem nome';

  @override
  String get learningModeStatusCheckingTitle => 'Verificando o receptor';

  @override
  String get learningModeStatusNoReceiverTitle => 'Receptor não está pronto';

  @override
  String get learningModeStatusPermissionTitle => 'Permissão USB necessária';

  @override
  String get learningModeStatusSetupTitle => 'Configure o receptor';

  @override
  String get learningModeStatusReadyTitle => 'Pronto para aprender';

  @override
  String get learningModeStatusListeningTitle => 'Aguardando sinal';

  @override
  String get learningModeStatusCapturedTitle => 'Sinal capturado';

  @override
  String get learningModeStatusReadyBody =>
      'Dê um nome ao botão, aponte o controle remoto original para o receptor e comece a ouvir quando estiver pronto.';

  @override
  String get learningModeStatusListeningBody =>
      'Aponte o controle remoto original para o receptor e pressione o botão uma vez.';

  @override
  String learningModeStatusCapturedBody(Object buttonName) {
    return 'Sinal capturado para $buttonName. Reenvie para conferir se o aparelho responde e depois salve.';
  }

  @override
  String get learningModeConnectReceiverTitle => 'Conecte um receptor IR';

  @override
  String get learningModeConnectReceiverBody =>
      'O modo de aprendizagem depende do hardware externo que pode receber IR. Depois que o receptor for detectado e autorizado, esta página se tornará um fluxo direto de escuta, teste e salvamento.';

  @override
  String get learningModeListenCardTitle => 'Ouça um botão';

  @override
  String get learningModeListenCardBody =>
      'Defina primeiro um rótulo, se desejar, depois comece a ouvir e pressione o botão no controle remoto original.';

  @override
  String get learningModeReadyToListenTitle => 'Pronto para receber';

  @override
  String get learningModeReadyToListenBody =>
      'Aponte o controle remoto original para o receptor e inicie a captura.';

  @override
  String get learningModeListeningNowTitle => 'Aguardando sinal';

  @override
  String get learningModeListeningNowBody =>
      'Pressione o botão do controle remoto original uma vez. Use a captura de visualização para percorrer o resto do andaime antes que o back-end de captura real seja conectado.';

  @override
  String get learningModePreviewCaptureAction => 'Visualizar sinal capturado';

  @override
  String get learningModeCapturedSummary => 'Sinal capturado';

  @override
  String get learningModeResultActionsTitle => 'Testar e salvar';

  @override
  String get learningModeResultActionsBody =>
      'Reenvie o sinal e confira se o aparelho responde antes de salvar o botão.';

  @override
  String get learningModeReplayAction => 'Reenviar';

  @override
  String get learningModeReplayStubMessage =>
      'O replay ainda não está conectado. Esta é a estrutura da UI para o fluxo final de aprendizado, teste e salvamento.';

  @override
  String get learningModeSaveStubMessage =>
      'Salvar ainda não está conectado. A próxima etapa é conectar esta tela ao botão Criar e aos controles remotos existentes.';

  @override
  String get learningModeLearnAnotherAction => 'Aprender outro botão';

  @override
  String get learningModeStepReviewTitle => 'Revise e salve';

  @override
  String get learningModeStepReviewSubtitle =>
      'Confirme o que foi aprendido e escolha onde ele deve ficar na sua biblioteca remota.';

  @override
  String get learningModeSaveToExistingRemote => 'Controle salvo';

  @override
  String get learningModeCreateNewRemote => 'Novo controle';

  @override
  String get learningModeProtocolPreviewTitle => 'Prévia do protocolo';

  @override
  String get learningModeProtocolPreviewBody =>
      'Os detalhes do protocolo decodificado aparecerão aqui assim que o receptor capturar um pressionamento de botão limpo.';

  @override
  String get learningModeRawPreviewTitle => 'Dados brutos';

  @override
  String get learningModeRawPreviewBody =>
      'Se a decodificação estiver incompleta, a captura de tempo bruto ainda estará disponível aqui para revisão e salvamento.';

  @override
  String get learningModeSaveCapture => 'Salvar sinal';

  @override
  String get learningModeReviewTipTitle => 'Para onde isso irá a seguir';

  @override
  String get learningModeReviewTipBody =>
      'A próxima etapa de implementação deve conectar este painel de revisão ao botão Criar e aos controles remotos existentes para que o sinal aprendido caia diretamente em sua biblioteca.';

  @override
  String get learningModeFinishPreview => 'Concluir visualização';

  @override
  String get backAction => 'Back';

  @override
  String get interactionTitle => 'Interacción';

  @override
  String get interactionSubtitle => 'Resposta tátil e layout do controle';

  @override
  String get autoOpenLastRemoteTitle => 'Abrir o último controle ao iniciar';

  @override
  String get autoOpenLastRemoteSubtitle =>
      'Abre o controle usado mais recentemente quando o app inicia. Se ele não estiver disponível, a lista de controles será exibida.';

  @override
  String get hapticFeedbackTitle => 'Respuesta háptica';

  @override
  String get hapticFeedbackSubtitle => 'Vibrar ao tocar e ao executar ações';

  @override
  String get forceInAppVibrationTitle => 'Forçar vibração no app';

  @override
  String get forceInAppVibrationSubtitle =>
      'Usar o vibrador diretamente mesmo que o feedback tátil do sistema esteja desligado';

  @override
  String get forceInAppVibrationWarning =>
      'Opção avançada. O app pode vibrar mesmo quando o feedback tátil do Android estiver desativado globalmente.';

  @override
  String get forceInAppVibrationBlockedMasterWarning =>
      'A vibração do sistema Android está desativada. A vibração forçada no app não pode substituí-la neste dispositivo.';

  @override
  String get forceInAppVibrationNoVibratorWarning =>
      'Este dispositivo não informa hardware de vibração, então a vibração no app não pode funcionar.';

  @override
  String get intensity => 'Intensidad';

  @override
  String get intensityLight => 'Claro';

  @override
  String get intensityMedium => 'Media';

  @override
  String get intensityStrong => 'Fuerte';

  @override
  String get remoteButtonMetadataTitle =>
      'Mostrar etiquetas técnicas dos botões';

  @override
  String get remoteButtonMetadataSubtitle =>
      'Mostra protocolo, código e frequência nos botões do controle.';

  @override
  String get remoteButtonMetadataShown =>
      'Etiquetas técnicas dos botões visíveis.';

  @override
  String get remoteButtonMetadataHidden =>
      'Etiquetas técnicas dos botões ocultas.';

  @override
  String get flipRemoteDefaultTitle => 'Inverter vista do controle por defecto';

  @override
  String get flipRemoteDefaultSubtitle =>
      'Abre as telas do controle giradas em 180° (para dongles USB montados embaixo).';

  @override
  String get remoteViewFlipped =>
      'A visualização do controle vai abrir invertida.';

  @override
  String get remoteViewNormal => 'A visualização do controle vai abrir normal.';

  @override
  String get backupTitle => 'Cópia';

  @override
  String get backupSubtitle => 'Importar/exportar controles e macros';

  @override
  String get importBackup => 'Importar cópia';

  @override
  String get importBackupSubtitle =>
      'Importa cópias de controles/macros ou arquivos do Flipper Zero, LIRC ou IRPLUS';

  @override
  String get bulkImportFolder => 'Importar pasta';

  @override
  String get bulkImportFolderSubtitle =>
      'Importar vários controles de uma pasta';

  @override
  String get exportBackup => 'Exportar cópia';

  @override
  String get exportBackupSubtitle =>
      'Salvar controles + macros como um JSON em Downloads';

  @override
  String get restoreDemoRemotes => 'Restaurar controles de demonstração';

  @override
  String get restoreDemoRemotesSubtitle =>
      'Substituir os controles atuais pela demonstração integrada';

  @override
  String get deleteAllRemotes => 'Excluir todos os controles';

  @override
  String get deleteAllRemotesSubtitle =>
      'Excluir todos os controles deste dispositivo';

  @override
  String get backupTip =>
      'Dica: exporte uma cópia antes de grandes alterações. A importação aceita cópias completas, cópias JSON antigas de controles e arquivos .ir do Flipper Zero.';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get aboutSubtitle => 'Informações do app e detalhes de código aberto';

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
  String get repositoryUrlCopied => 'URL do repositorio copiada';

  @override
  String get reportIssue => 'Reportar problema';

  @override
  String get reportIssueSubtitle => 'Erros e pedidos de recursos';

  @override
  String get issuesUrlCopied => 'URL de issues copiada';

  @override
  String get license => 'Licencia';

  @override
  String get openSourceLicense => 'Licencia de código aberto';

  @override
  String get licenseUrlCopied => 'URL da licença copiada';

  @override
  String get companyName => 'KaijinLab Inc.';

  @override
  String get visitWebsite => 'Visitar nuestro sitio web';

  @override
  String get companyUrlCopied => 'URL da empresa copiada';

  @override
  String get licenses => 'Licencias';

  @override
  String get openSourceLicenses => 'Licencias de código aberto';

  @override
  String byCreator(Object creator) {
    return 'por $creator';
  }

  @override
  String get deviceControlsTitle => 'controles do dispositivo';

  @override
  String get deviceControlsSubtitle =>
      'Mostrar botões favoritos na página de controles do sistema';

  @override
  String get manageFavorites => 'Gerir favoritos';

  @override
  String get manageFavoritesSubtitle =>
      'Escolha quais botões aparecem nos controles do dispositivo';

  @override
  String get quickSettingsTitle => 'Configurações rápidas';

  @override
  String get quickSettingsSubtitle =>
      'Adicionar blocos para atalhos de energia e volume';

  @override
  String get configureTiles => 'Configurar blocos';

  @override
  String get configureTilesSubtitle => 'Atribuir blocos aos botões do controle';

  @override
  String get tvKillTitle => 'TVKill';

  @override
  String get tvKillSubtitle =>
      'Ciclo universal de energia para dispositivos seus';

  @override
  String get openTvKill => 'Abrir TVKill';

  @override
  String get openTvKillSubtitle =>
      'Ciclar códigos de energia (use apenas em dispositivos seus)';

  @override
  String get failedToLoadTransmitterSettings =>
      'Falha ao carregar as configurações do emissor.';

  @override
  String get usbStatusReady =>
      'O dongle USB está conectado e pronto para enviar IR.';

  @override
  String get usbStatusPermissionRequired =>
      'Dongle USB detectado. Peça permissão USB e aceite o aviso do sistema.';

  @override
  String get usbStatusPermissionDenied =>
      'A permissão USB foi negada para o dongle conectado. Peça novamente e aceite o aviso.';

  @override
  String get usbStatusPermissionGranted =>
      'A permissão USB foi concedida. O dongle ainda precisa ser inicializado antes de poder enviar IR.';

  @override
  String get usbStatusOpenFailed =>
      'A permissão USB foi concedida, mas o dongle não pôde ser inicializado. Reconecte-o e tente novamente.';

  @override
  String get usbStatusNoDevice =>
      'Nenhum dongle IR USB compatível foi detectado.';

  @override
  String get usbSelectPermissionRequired =>
      'Dongle USB detectado, mas não autorizado. Toque em \"Pedir permissão USB\".';

  @override
  String get usbSelectPermissionDenied =>
      'A permissão USB foi negada. Toque em \"Pedir permissão USB\" e aceite o aviso.';

  @override
  String get usbSelectPermissionGranted =>
      'A permissão USB foi concedida, mas o dongle ainda não foi inicializado. Tente reconectá-lo.';

  @override
  String get usbSelectOpenFailed =>
      'A permissão USB foi concedida, mas o dongle não pôde ser inicializado. Reconecte-o e tente novamente.';

  @override
  String get usbSelectNoDevice =>
      'Nenhum dongle IR USB compatível foi detectado. Conecte-o e depois toque em \"Pedir permissão USB\".';

  @override
  String get usbSelectReady => 'O dongle USB está pronto.';

  @override
  String get autoSwitchEnabledMessage =>
      'Troca automática ativada: usa USB quando está conectado, caso contrário Interno.';

  @override
  String get autoSwitchDisabledMessage =>
      'Cambio automático desativedo: a seleção do emissor ahora es manual.';

  @override
  String get failedToUpdateAutoSwitch =>
      'Falha ao atualizar a configuração de troca automática.';

  @override
  String get failedToSwitchTransmitter => 'Falha ao trocar o emissor.';

  @override
  String get deviceHasNoInternalIr =>
      'Este dispositivo não tem emissor IR integrado.';

  @override
  String get audioModeEnabledMessage =>
      'Modo de áudio ativado. Use o volume de mídia no máximo e um adaptador LED de áudio para IR.';

  @override
  String get usbPermissionRequestSent => 'Solicitud de permissão USB enviada.';

  @override
  String get usbPermissionRequestSentApprove =>
      'Pedido de permissão USB enviado. aceite o aviso para ativar o USB.';

  @override
  String get usbAlreadyReady => 'O dongle USB já está inicializado e pronto.';

  @override
  String get failedToRequestUsbPermission =>
      'Não foi possível pedir a permissão USB.';

  @override
  String get transmitterHelpInternal =>
      'Usa o emissor IR integrado do telefone para enviar controles.';

  @override
  String get transmitterHelpUsb =>
      'Usa um dongle IR USB (requer permissão) para enviar controles.';

  @override
  String get transmitterHelpAudio1 =>
      'Usa a saída de áudio (mono). Requer um adaptador LED de áudio para IR e volume de mídia alto.';

  @override
  String get transmitterHelpAudio2 =>
      'Usa a saída de áudio (estéreo). Usa dois canais para melhor controle do LED com adaptadores compatíveis.';

  @override
  String get transmitterInternal => 'IR interno';

  @override
  String get transmitterUsb => 'Dongle IR USB';

  @override
  String get transmitterAudio1 => 'áudio (1 LED)';

  @override
  String get transmitterAudio2 => 'áudio (2 LED)';

  @override
  String get failedToLoadTransmitterCapabilities =>
      'Falha ao carregar as capacidades do emissor.';

  @override
  String get selectedTransmitter => 'Emissor selecionado';

  @override
  String selectedTransmitterValue(Object effective, Object active) {
    return '$effective • Activo: $active';
  }

  @override
  String get refresh => 'Atualizar';

  @override
  String get autoSwitchTitle => 'Cambio auto';

  @override
  String get autoSwitchDisabledWhileAudio => 'Desativado ao usar modo áudio';

  @override
  String get autoSwitchUsesUsbOtherwiseInternal =>
      'Usa USB quando está conectado, caso contrário Interno';

  @override
  String get unavailableOnThisDevice => 'Não disponível neste dispositivo';

  @override
  String get openOnUsbAttachTitle => 'Abrir ao conectar USB';

  @override
  String get openOnUsbAttachSubtitle =>
      'O Android pode sugerir abrir o app quando um dongle IR USB compatível for conectado.';

  @override
  String get openOnUsbAttachEnabledMessage =>
      'Vai sugerir abrir o IR Blaster quando um dongle USB compatível for conectado.';

  @override
  String get openOnUsbAttachDisabledMessage =>
      'Não vai sugerir abrir ao conectar USB.';

  @override
  String get failedToUpdateSetting => 'Falha ao atualizar a configuração.';

  @override
  String get unnamedButton => 'Botão sem nome';

  @override
  String get iconFallback => 'Ícone';

  @override
  String get remoteListReorderHint =>
      'Toque e segure um controle, depois arraste para a nova posição.';

  @override
  String get deleteRemoteTitle => 'Excluir controle?';

  @override
  String deleteRemoteMessage(Object name) {
    return 'O controle “$name” será excluído permanentemente. Esta ação não pode ser desfeita.';
  }

  @override
  String get delete => 'Excluir';

  @override
  String get addToDeviceControlsTitle =>
      'Adicionar a controles do dispositivo?';

  @override
  String get addToDeviceControlsDescription =>
      'Acesso rápido nos controles do sistema.';

  @override
  String get skip => 'Omitir';

  @override
  String get add => 'Adicionar';

  @override
  String get addedToDeviceControls =>
      'Adicionado aos controles do dispositivo.';

  @override
  String deletedRemoteUndoUnavailable(Object name) {
    return 'Controle “$name” excluído. Esta ação não pode ser desfeita.';
  }

  @override
  String remoteLayoutSummary(int count, Object layout) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count botões',
      one: '$count botão',
    );
    return '$_temp0 · $layout';
  }

  @override
  String get layoutComfort => 'Amplo';

  @override
  String get layoutCompact => 'Compacto';

  @override
  String get open => 'Abrir';

  @override
  String get useThisRemote => 'Usar este controle';

  @override
  String get edit => 'Editar';

  @override
  String get editRemoteSubtitle => 'Renomear e editar botões';

  @override
  String get thisCannotBeUndone => 'Esta ação não pode ser desfeita';

  @override
  String get searchRemotes => 'pesquisar controles';

  @override
  String get reorderRemotes => 'Reordenar controles';

  @override
  String get addRemote => 'Adicionar controle';

  @override
  String get more => 'Mais';

  @override
  String get reorderMode => 'Modo reordenar';

  @override
  String remoteButtonCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count botões',
      one: '$count botão',
    );
    return '$_temp0';
  }

  @override
  String get noRemotesYet => 'Ainda não há controles';

  @override
  String get noRemotesDescription =>
      'Crie um controle para enviar sinais infravermelhos.';

  @override
  String get noRemotesNextStep => 'Adicione um controle e depois os botões.';

  @override
  String get actions => 'Ações';

  @override
  String get macrosTitle => 'Macros';

  @override
  String get help => 'Ajuda';

  @override
  String get createMacro => 'Criar macro';

  @override
  String get timedMacrosTitle => 'Macros';

  @override
  String get timedMacrosSubtitle =>
      'Execute uma sequência de comandos IR com pausas entre as etapas.';

  @override
  String get timedMacrosNextStep =>
      'Escolha um controle e adicione comandos e pausas para criar sua primeira macro.';

  @override
  String get macroFeatureToysTitle => 'Para brinquedos controlados por IR';

  @override
  String get macroFeatureToysDescription =>
      'Dê ao brinquedo tempo para concluir uma ação antes de enviar o próximo comando.';

  @override
  String get macroFeatureTimingTitle => 'Pausas ajustáveis';

  @override
  String get macroFeatureTimingDescription =>
      'Defina a pausa entre comandos para dar ao dispositivo tempo para responder.';

  @override
  String get macroFeatureManualTitle => 'Aguardar confirmação';

  @override
  String get macroFeatureManualDescription =>
      'Aguarda você tocar em Continuar antes de avançar para a próxima etapa.';

  @override
  String get exampleUseCase => 'Exemplo';

  @override
  String get macroExampleText =>
      '1. Envie o primeiro comando\n2. Aguarde um segundo\n3. Envie o próximo comando';

  @override
  String get createFirstMacro => 'Criar sua primeira macro';

  @override
  String get noRemote => 'Sem controle';

  @override
  String macroCopyName(String name) {
    return '$name (cópia)';
  }

  @override
  String macroStepCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count etapas',
      one: '$count etapa',
    );
    return '$_temp0';
  }

  @override
  String get aboutTimedMacros => 'Sobre as macros';

  @override
  String get aboutTimedMacrosDescription =>
      'Execute uma sequência de comandos IR com pausas entre as etapas.';

  @override
  String get sendCommand => 'Enviar comando';

  @override
  String get sendCommandDescription =>
      'Envia o sinal IR de um botão salvo no seu controle.';

  @override
  String get delay => 'Espera';

  @override
  String get delayDescription =>
      'Aguarda o tempo definido antes de avançar para a próxima etapa.';

  @override
  String get manualContinue => 'Aguardar confirmação';

  @override
  String get manualContinueDescription =>
      'Aguarda você tocar em Continuar antes de avançar para a próxima etapa.';

  @override
  String get gotIt => 'Entendido';

  @override
  String get failedToSaveMacros => 'Não foi possível salvar as macros.';

  @override
  String deletedMacroNamed(Object name) {
    return 'Macro “$name” excluída.';
  }

  @override
  String get undo => 'Desfazer';

  @override
  String get failedToRestoreMacro => 'Não foi possível restaurar a macro.';

  @override
  String get deleteMacroTitle => 'Excluir macro?';

  @override
  String get deleteMacroMessage =>
      'Após excluir, toque em Desfazer na mensagem que aparecer para restaurar a macro.';

  @override
  String get noRemotesAvailable => 'Não há controles disponíveis.';

  @override
  String remoteButtonCountSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count botões',
      one: '$count botão',
    );
    return '$_temp0';
  }

  @override
  String get remoteOrientationFlippedTooltip =>
      'Restaurar a orientação original';

  @override
  String get remoteOrientationNormalTooltip => 'Girar o controle em 180°';

  @override
  String get stopLoop => 'Parar repetição';

  @override
  String get reorderButtons => 'Reordenar botões';

  @override
  String get remoteReorderHint =>
      'Toque e segure um botão, depois arraste-o para outra posição.';

  @override
  String get manageRemote => 'Gerenciar controle';

  @override
  String get remoteNoButtons => 'Ainda não há botões';

  @override
  String get remoteNoButtonsDescription =>
      'Edite este controle para adicionar ou configurar botões.';

  @override
  String get editRemote => 'Editar controle';

  @override
  String get editRemoteActionsSubtitle =>
      'Renomear o controle, organizar e editar botões';

  @override
  String remoteUpdatedNamedButton(Object name) {
    return 'Botão “$name” atualizado.';
  }

  @override
  String buttonAddedNamed(Object name) {
    return 'Foi adicionado \"$name\".';
  }

  @override
  String get buttonDuplicated => 'Botão duplicado.';

  @override
  String get loopRunningForButton => 'O ciclo está ativo para este botão.';

  @override
  String get loopTip => 'Dica: use Ciclo para repetir até parar.';

  @override
  String get loopingBadge => 'Looping';

  @override
  String get codeCopied => 'Código copiado.';

  @override
  String get copyCode => 'Copiar código';

  @override
  String get startLoop => 'Iniciar ciclo';

  @override
  String get editButtonSubtitle => 'Alterar o rótulo, as cores ou o sinal IR';

  @override
  String get newButton => 'Novo botão';

  @override
  String get newButtonSubtitle => 'Criar outro botão para este controle';

  @override
  String get duplicate => 'Duplicar';

  @override
  String get duplicateButtonSubtitle => 'Criar uma cópia deste botão';

  @override
  String get removeFromDeviceControls => 'Remover de controles do dispositivo';

  @override
  String get addToDeviceControls => 'Adicionar a controles do dispositivo';

  @override
  String get deviceControlsButtonSubtitle =>
      'Usar este botão nos controles de dispositivos do Android';

  @override
  String get removedFromDeviceControls =>
      'Removido dos controles do dispositivo.';

  @override
  String get pinQuickTile => 'Fixar nos favoritos dos blocos rápidos';

  @override
  String get unpinQuickTile => 'Remover dos favoritos dos blocos rápidos';

  @override
  String get quickTileButtonSubtitle =>
      'Os favoritos aparecem primeiro ao configurar um bloco de configurações rápidas';

  @override
  String get removedFromQuickTileFavorites =>
      'Removido dos favoritos dos blocos rápidos.';

  @override
  String get pinnedToQuickTileFavorites =>
      'Fixado nos favoritos dos blocos rápidos.';

  @override
  String get duplicateAndEdit => 'Duplicar e editar';

  @override
  String get duplicateAndEditSubtitle =>
      'Criar uma cópia e editá-la imediatamente';

  @override
  String get done => 'Concluído';

  @override
  String get run => 'Executar';

  @override
  String get untitledRemote => 'Controle sem nome';

  @override
  String get createRemoteTitle => 'Criar controle';

  @override
  String get editRemoteTitle => 'Editar controle';

  @override
  String get removeButtonTitle => 'Remover o botão?';

  @override
  String get imageButtonRemovedMessage =>
      'Este botão será removido do controle.';

  @override
  String namedButtonRemovedMessage(Object name) {
    return '\"$name\" será removido do controle.';
  }

  @override
  String get remove => 'Remover';

  @override
  String importedButtonCount(int count) {
    return 'Foram importados $count botão(es).';
  }

  @override
  String importedButtonsFromExistingRemotes(int count) {
    return 'Foram importados $count botão(ões) de controles existentes.';
  }

  @override
  String get editButtonSettingsSubtitle =>
      'Alterar o rótulo, as cores ou o sinal IR';

  @override
  String get createButtonCopySubtitle => 'Criar uma cópia deste botão';

  @override
  String get duplicateAndEditButtonSubtitle =>
      'Criar uma cópia e editá-la imediatamente';

  @override
  String get undoAvailableInNextSnackbar =>
      'Depois de remover o botão, toque em Desfazer na mensagem que aparecer.';

  @override
  String get buttonRemoved => 'Botão removido.';

  @override
  String get remoteNameCannotBeEmpty => 'Digite um nome para o controle.';

  @override
  String get saveRemote => 'Salvar controle';

  @override
  String get remoteName => 'Nome do controle';

  @override
  String get remoteNameHint => 'Ex.: TV ou ar-condicionado';

  @override
  String get remoteNameHelper =>
      'Este nome aparecerá na sua lista de controles.';

  @override
  String get layoutStyle => 'Layout';

  @override
  String get layoutWideDescription =>
      'Duas colunas de botões com mais detalhes.';

  @override
  String get layoutCompactDescription =>
      'Quatro colunas de botões com ícones ou texto.';

  @override
  String get importFromRemotes => 'Importar de controles';

  @override
  String get importFromDatabase => 'Importar do banco de dados';

  @override
  String get addButton => 'Adicionar botão';

  @override
  String get noButtonsYet => 'Ainda não há botões';

  @override
  String get createRemoteEmptyStateDescription =>
      'Encontre botões no banco de dados, importe de outro controle ou crie os seus.';

  @override
  String get createButtonTitle => 'Criar botão';

  @override
  String get editButtonTitle => 'Editar botão';

  @override
  String failedToLoadProtocols(Object error) {
    return 'Falha ao carregar protocolos: $error';
  }

  @override
  String failedToLoadDatabaseKeys(Object error) {
    return 'Falha ao carregar chaves do banco de dados: $error';
  }

  @override
  String get presetPower => 'Enc.';

  @override
  String get presetVolume => 'Volume';

  @override
  String get presetChannel => 'Canal';

  @override
  String get presetNavigation => 'Navegación';

  @override
  String get all => 'Todos';

  @override
  String get completeRequiredFieldsToSave =>
      'Completa os campos obrigatórios para salvar';

  @override
  String get buttonLabelStepTitle => 'Etiqueta do botão';

  @override
  String get buttonLabelStepSubtitle =>
      'Escolha uma imagem, um ícone ou escreva uma etiqueta.';

  @override
  String get buttonColorStepTitle => 'Cor do botão';

  @override
  String get buttonColorStepSubtitle =>
      'Escolha uma cor de fundo para este botão.';

  @override
  String get selectColor => 'Selecione cor:';

  @override
  String get noImageSelected => 'Não há imagem selecionada';

  @override
  String get gallery => 'Galería';

  @override
  String get builtIn => 'Integrado';

  @override
  String get removeImage => 'Remover imagem';

  @override
  String get requiredSelectImageOrSwitch =>
      'Obrigatório: selecione uma imagem, escolha um ícone ou mude para Texto.';

  @override
  String get iconSelected => 'Ícone selecionado';

  @override
  String get noIconSelected => 'Nenhum ícone selecionado';

  @override
  String get chooseIcon => 'Escolher ícone';

  @override
  String get removeIcon => 'Remover ícone';

  @override
  String get requiredSelectIconOrSwitch =>
      'Obrigatório: selecione um ícone ou mude para Imagem/Texto.';

  @override
  String get buttonText => 'Texto do botão';

  @override
  String get buttonTextHint => 'p. ej., Enc., Volume +, HDMI 1';

  @override
  String get buttonTextHelper => 'Este texto aparecerá en o botão.';

  @override
  String get requiredEnterButtonLabel => 'Obrigatório: digite uma etiqueta.';

  @override
  String get defaultColorName => 'Predeterminado';

  @override
  String get newRemoteCreatedFromLastHit =>
      'Foi criado um novo controle com um botão do último acerto.';

  @override
  String get selectRemote => 'Escolher controle';

  @override
  String remoteNumber(Object id) {
    return 'controle n.º $id';
  }

  @override
  String get newRemoteCreated => 'controle novo criado.';

  @override
  String get failedToCreateRemote => 'Falha ao criar o controle.';

  @override
  String get newRemoteEllipsis => 'Novo controle…';

  @override
  String addedToRemoteNamed(Object name) {
    return 'Adicionado a $name.';
  }

  @override
  String get failedToAddToRemote => 'Falha ao adicionar ao controle.';

  @override
  String get newRemoteDefaultName => 'Novo controle';

  @override
  String jumpedToOffsetPaused(int offset) {
    return 'Saltou para o deslocamento $offset. Pausado, toque em retomar para continuar.';
  }

  @override
  String get sent => 'Enviado.';

  @override
  String failedToSend(Object error) {
    return 'Falha ao enviar: $error';
  }

  @override
  String get copiedProtocolCode => 'Copiado (protocolo:código).';

  @override
  String get savedToResults => 'Salvo em Resultados.';

  @override
  String invalidCodeForProtocol(Object error) {
    return 'Código inválido para o protocolo: $error';
  }

  @override
  String get copiedCurrentCandidate => 'Candidato atual copiado.';

  @override
  String get jumpToOffset => 'Saltar ao deslocação';

  @override
  String get jumpToBruteCursor => 'Saltar ao cursor de força bruta';

  @override
  String get jump => 'Saltar';

  @override
  String jumpedToCursorPaused(Object cursor) {
    return 'Saltou para o cursor 0x$cursor. Pausado, toque em retomar para continuar.';
  }

  @override
  String get irSignalTester => 'Probador de sinal IR';

  @override
  String get stop => 'parar';

  @override
  String get selectButton => 'Escolher botão';

  @override
  String get buttonNotFoundInRemotes =>
      'Botão não encontrado nos controles salvos.';

  @override
  String sentNamed(Object name) {
    return '“$name” enviado.';
  }

  @override
  String sendFailed(Object error) {
    return 'Não foi possível enviar: $error';
  }

  @override
  String get noFavoritesYet => 'Ainda não há favoritos';

  @override
  String get deviceControlsEmptyHint =>
      'Mantenha pressionado um botão do controle e selecione \"Adicionar aos controles do dispositivo\".';

  @override
  String get sendTest => 'Enviar teste';

  @override
  String get testSendCompleted => 'Teste de envio concluída.';

  @override
  String testSendFailed(Object error) {
    return 'Falha no envio de teste: $error';
  }

  @override
  String removedNamed(Object name) {
    return 'Foi removido \"$name\".';
  }

  @override
  String get brand => 'Marca';

  @override
  String get model => 'Modelo';

  @override
  String get selectBrand => 'Selecionar marca';

  @override
  String get searchBrand => 'pesquisar marca…';

  @override
  String get selectModel => 'Selecionar modelo';

  @override
  String get searchModel => 'pesquisar modelo…';

  @override
  String get unnamedKey => 'Tecla sem nome';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get emDash => '-';

  @override
  String get searchCommands => 'Buscar comandos';

  @override
  String get noMatchingCommands => 'Nenhum comando encontrado';

  @override
  String get quickTileFavoritesTitle => 'Botões favoritos';

  @override
  String changeMappingForTile(Object tileLabel) {
    return 'Alterar botão do bloco “$tileLabel”';
  }

  @override
  String get pickDifferentButton => 'Escolha outro botão';

  @override
  String get browseAllRemotesEllipsis => 'Explorar controles';

  @override
  String get invalidMacroFileFormat =>
      'Formato de arquivo de macro não válido.';

  @override
  String get failedToParseMacroFile =>
      'Não se pudo analizar o arquivo de macro.';

  @override
  String get deviceCodeLabel => 'Código de dispositivo';

  @override
  String get commandLabel => 'Comando';

  @override
  String get editButtonCodeTitle => 'Editar código do botão';

  @override
  String get thisRemoteHasNoButtons => 'Este controle não tem botões.';

  @override
  String get selectCommand => 'Escolher comando';

  @override
  String get databaseModeAutofillHint =>
      'O modo Banco de dados preenche o Passo 2 para você (marca + modelo + protocolo). Após importar uma tecla, você pode ajustar tudo no modo Manual.';

  @override
  String get test => 'Testar';

  @override
  String get allSelectedButtonsWereDuplicates =>
      'Todos os botões elegidos eran duplicados.';

  @override
  String get noButtonsImported => 'Nenhum botão foi importado.';

  @override
  String importedButtonsSkippedDuplicates(int addedCount, int skippedCount) {
    return 'Foram importados $addedCount botão(es). Se omitieron $skippedCount duplicado(s).';
  }

  @override
  String get importAllMatchingTitle =>
      'Importar todos os botões correspondentes?';

  @override
  String get noMatchingKeysFound =>
      'Nenhuma tecla correspondente foi encontrada.';

  @override
  String importAllMatchingMessage(int count) {
    return 'Isto importará até $count teclas correspondentes da seleção atual do banco de dados.';
  }

  @override
  String get importAll => 'Importar tudo';

  @override
  String get importingButtons => 'Importando botões…';

  @override
  String get allMatchingButtonsWereDuplicates =>
      'Todos os botões correspondentes eran duplicados.';

  @override
  String get quickPresets => 'configurações rápidos';

  @override
  String get selectDeviceFirst => 'Selecione primeiro um dispositivo';

  @override
  String get searchByLabelOrHex => 'pesquisar por etiqueta o hex';

  @override
  String optionalRefinePresetKeys(Object preset) {
    return 'Opcional: refine as teclas predefinidas de $preset';
  }

  @override
  String get selectBrandModelProtocolFirst =>
      'Selecione primeiroo marca, modelo e protocolo.';

  @override
  String get importFromDatabaseTitle => 'Importar de a base de dados';

  @override
  String get importFromDatabaseSubtitle =>
      'Encontre seu dispositivo, escolha os botões e importe-os.';

  @override
  String get deviceAndFilters => 'Dispositivo e filtros';

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
      'Nenhum protocolo foi encontrado para esta marca e modelo.';

  @override
  String get protocolAutoDetected => 'Protocolo';

  @override
  String get protocolAutoDetectedHelper =>
      'Detectado automaticamente no banco de dados. Você pode alterá-lo antes de importar.';

  @override
  String get selectBrandModelToLoadKeys =>
      'Selecione uma marca, modelo e protocolo para carregar teclas.';

  @override
  String get noKeysFound => 'Nenhuma tecla encontrada.';

  @override
  String noKeysFoundForSearch(Object query) {
    return 'Nenhuma tecla encontrada para \"$query\".';
  }

  @override
  String get skipDuplicates => 'Omitir duplicados';

  @override
  String get skipDuplicatesSubtitle =>
      'Não importes botões que já existan en este controle.';

  @override
  String get importSelected => 'Importar selecionados';

  @override
  String get noMacrosToExport => 'Não há macros para exportar.';

  @override
  String get macrosExportedToDownloads => 'Macros exportedas a Descargas.';

  @override
  String get failedToExportMacros => 'Não se pudieron exporter as macros.';

  @override
  String get failedToReadFile => 'Não se pudo leer o arquivo.';

  @override
  String get importFromExistingRemotesTitle =>
      'Importar de controles existentes';

  @override
  String selectedCount(int count) {
    return '$count selecionados';
  }

  @override
  String get noOtherRemotesWithButtons =>
      'Nenhum outro controle com botões foi encontrado.';

  @override
  String get sourceRemote => 'controle origen';

  @override
  String get searchButtons => 'pesquisar botões';

  @override
  String get searchButtonsHint => 'Enc., Volume, Silencio..';

  @override
  String get selectVisible => 'Selecionar visibles';

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
      'Permissão de almacenamiento negada (necesario en algums Android antiguos).';

  @override
  String get backupExportedToDownloads => 'Cópia exporteda a Descargas.';

  @override
  String failedToExport(Object error) {
    return 'Falha ao exportar: $error';
  }

  @override
  String importedLegacyJsonBackup(int count) {
    return 'Foram importados $count controles de uma cópia JSON antiga. As macros não foram alteradas.';
  }

  @override
  String get importFailedRemotesMustBeList =>
      'Importação falhada: \"remotes\" deve ser uma lista JSON se existe.';

  @override
  String get importFailedMacrosMustBeList =>
      'Importação falhada: \"macros\" deve ser uma lista JSON se existe.';

  @override
  String get importFailedInvalidBackupFormat =>
      'Falha na importação: formato de cópia inválido (era esperada uma lista antiga ou um mapa com remotes/macros).';

  @override
  String importedBackupRemotesOnly(int remoteCount) {
    return 'Foram importados $remoteCount controles da cópia. As macros não foram alteradas.';
  }

  @override
  String importedBackupRemotesAndMacros(int remoteCount, int macroCount) {
    return 'Foram importados $remoteCount controles e $macroCount macros de a cópia.';
  }

  @override
  String get importFailedNoValidButtonsInIr =>
      'Importação falhada: não se encontraron botões válidos en o arquivo.ir.';

  @override
  String get importedOneRemoteFromFlipper =>
      'Foi importado 1 controle de Flipper.ir. As macros não foram alteradas.';

  @override
  String get importFailedInvalidIrplus =>
      'Importação falhada: arquivo irplus não válido (não se encontraron botões válidos).';

  @override
  String get importedOneRemoteFromIrplus =>
      'Foi importado 1 controle de irplus. As macros não foram alteradas.';

  @override
  String get importFailedInvalidLirc =>
      'Importação falhada: arquivo LIRC não válido (não se encontraron códigos válidos/brutos).';

  @override
  String get importedOneRemoteFromLirc =>
      'Foi importado 1 controle de uma configuração LIRC. As macros não foram alteradas.';

  @override
  String get unsupportedFileTypeSelected =>
      'Foi selecionado um tipo de arquivo não compatível.';

  @override
  String get importFailedInvalidUnreadableFile =>
      'Importação falhada: arquivo não válido o ilegible.';

  @override
  String get bulkImportNoSupportedFilesInFolder =>
      'Importação masiva concluída: não se encontraron arquivos compatíveis en a pasta.';

  @override
  String bulkImportNoRemotesImported(int skippedCount) {
    return 'Importação masiva concluída: não foram importados controles. Se omitieron $skippedCount arquivo(s).';
  }

  @override
  String bulkImportComplete(
      int importedCount, int supportedCount, int skippedCount) {
    return 'Importação masiva concluída: foram importados $importedCount controle(s) de $supportedCount arquivo(s) compatível(s). Se omitieron $skippedCount arquivo(s).';
  }

  @override
  String get storagePermissionDenied => 'Permissão de almacenamiento negada.';

  @override
  String get bulkImportFailedReadFolder =>
      'Importação masiva falhada: não se pudo leer o contenido de a pasta.';

  @override
  String bulkImportNoSupportedFilesSource(Object sourceLabel) {
    return 'Importação masiva concluída: não se encontraron arquivos compatíveis ($sourceLabel).';
  }

  @override
  String get clearAction => 'Limpar';

  @override
  String get saveAction => 'Salvar';

  @override
  String buttonsTitleCount(int count) {
    return 'Botões ($count)';
  }

  @override
  String get invalidStepEncountered =>
      'Esta macro contém uma etapa inválida. Edite-a antes de tentar novamente.';

  @override
  String failedToSendNamed(Object name) {
    return 'Não foi possível enviar: $name';
  }

  @override
  String get buttonNotFound => 'Botão não encontrado';

  @override
  String buttonNotFoundNamed(Object name) {
    return 'Botão não encontrado: $name';
  }

  @override
  String get unknownButton => 'Botão desconhecido';

  @override
  String durationSecondsShort(int seconds) {
    return '$seconds s';
  }

  @override
  String durationMinutesSecondsShort(int minutes, int seconds) {
    return '$minutes min $seconds s';
  }

  @override
  String durationHoursMinutesShort(int hours, int minutes) {
    return '$hours h $minutes min';
  }

  @override
  String get orientationFlippedTooltip =>
      'Orientação: invertida (toque para normal)';

  @override
  String get orientationNormalTooltip =>
      'Orientação: normal (toque para inverter)';

  @override
  String get noSteps => 'Sem etapas';

  @override
  String stepProgress(int current, int total) {
    return 'Etapa $current de $total';
  }

  @override
  String get completed => 'Concluído';

  @override
  String get paused => 'Pausado';

  @override
  String get running => 'Em execução';

  @override
  String get ready => 'Pronto';

  @override
  String stepsProgress(int current, int total) {
    return 'Etapas: $current / $total';
  }

  @override
  String get waiting => 'Aguardando';

  @override
  String secondsRemaining(num seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
            locale: localeName, decimalDigits: 1);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Tempo restante: $secondsString s';
  }

  @override
  String millisecondsShort(int ms) {
    return '$ms ms';
  }

  @override
  String get tapContinueWhenReady =>
      'Toque em Continuar quando estiver pronto para a próxima etapa.';

  @override
  String get error => 'Error';

  @override
  String get macroCompleted => 'Macro concluída';

  @override
  String finishedIn(Object duration) {
    return 'Concluída em $duration';
  }

  @override
  String get sequence => 'Etapas';

  @override
  String waitMilliseconds(int ms) {
    return 'Aguardar $ms ms';
  }

  @override
  String get runAgain => 'Executar novamente';

  @override
  String get startMacro => 'Iniciar macro';

  @override
  String get continueAction => 'Continuar';

  @override
  String get unnamedRemote => 'Controle sem nome';

  @override
  String get enterMacroName => 'Digite um nome para a macro.';

  @override
  String get addAtLeastOneStep => 'Adicione pelo menos uma etapa.';

  @override
  String get fixInvalidSteps => 'Corrija as etapas inválidas antes de salvar.';

  @override
  String get unknownCommand => 'Comando desconhecido';

  @override
  String get unnamedCommand => 'Comando sem nome';

  @override
  String get iconCommand => 'Botão com ícone';

  @override
  String get selectDelay => 'Escolher tempo de espera';

  @override
  String keepMilliseconds(int ms) {
    return 'Manter $ms ms';
  }

  @override
  String get custom => 'Personalizado';

  @override
  String get enterCustomDelayDuration => 'Digite outro tempo de espera';

  @override
  String millisecondsLong(int ms) {
    String _temp0 = intl.Intl.pluralLogic(
      ms,
      locale: localeName,
      other: '$ms milissegundos',
      one: '$ms milissegundo',
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
      other: '$secondsString segundos',
      one: '$secondsString segundo',
    );
    return '$_temp0';
  }

  @override
  String get customDelay => 'Espera personalizada';

  @override
  String get delayMillisecondsLabel => 'Espera (ms)';

  @override
  String get delayMillisecondsHint => '3000';

  @override
  String get recommendedDelayRange =>
      '1.000 milissegundos = 1 segundo. Dê ao dispositivo tempo suficiente para responder.';

  @override
  String get enterValidPositiveNumber =>
      'Digite um número inteiro maior que zero.';

  @override
  String get ok => 'OK';

  @override
  String get remote => 'Controle';

  @override
  String get macroName => 'Nome da macro';

  @override
  String get macroNameHint => 'ex. Noite de cinema';

  @override
  String stepsTitleCount(int count) {
    return 'Etapas ($count)';
  }

  @override
  String get noStepsYet => 'Ainda não há etapas';

  @override
  String get addCommandsAndDelaysHint =>
      'Adicione comandos, tempos de espera ou pausas para confirmação. As etapas são executadas na ordem exibida.';

  @override
  String get addStep => 'Adicionar etapa';

  @override
  String get reorderStepsHint =>
      'Arraste a alça para mudar a ordem das etapas. Toque em uma etapa para editá-la.';

  @override
  String reorderStep(int index) {
    return 'Mover a etapa $index';
  }

  @override
  String get pressAndDragToChangeStepOrder =>
      'Mantenha pressionado e arraste para mover a etapa';

  @override
  String deleteStep(int index) {
    return 'Excluir a etapa $index';
  }

  @override
  String get invalidStepTapToFix => 'Etapa inválida. Toque para corrigir.';

  @override
  String get sendIrCommand => 'Enviar comando IR';

  @override
  String get waitForUserConfirmation =>
      'Pausa até você decidir continuar a macro.';

  @override
  String get notImplemented => 'Não implementado';

  @override
  String frequencyKhz(int value) {
    return '$value kHz';
  }

  @override
  String get necProtocolShort => 'NEC';

  @override
  String get msbShort => 'MSB';

  @override
  String get layoutWide => 'Amplo';

  @override
  String get iconButton => 'Icon botão';

  @override
  String get imageButton => 'Image botão';

  @override
  String get noSignalInfo => 'Sem info de sinal';

  @override
  String get proceed => 'Continuar';

  @override
  String get discard => 'Descartar';

  @override
  String get continueEditing => 'Continuar editando';

  @override
  String get unsavedChangesTitle => 'Alterações não salvas';

  @override
  String get unsavedMacroChangesMessage =>
      'Descartar as alterações desta macro? Elas não serão salvas.';

  @override
  String get stopMacroBeforeLeaving => 'Pare a macro antes de sair desta tela.';

  @override
  String get stopTestingBeforeLeaving =>
      'Stop testing before leaving this screen.';

  @override
  String get idle => 'Inactivo';

  @override
  String get start => 'Iniciar';

  @override
  String get resume => 'Retomar';

  @override
  String get pause => 'Pausa';

  @override
  String get stopped => 'Detenido';

  @override
  String get copy => 'Copiar';

  @override
  String get send => 'Enviar';

  @override
  String get step => 'Passo';

  @override
  String get addToRemote => 'Adicionar ao controle';

  @override
  String get noDescriptionAvailable => 'Nenhuma descrição disponível.';

  @override
  String get notAvailableSymbol => '-';

  @override
  String get irFinderKaseikyoVendorInvalid =>
      'O fornecedor Kaseikyo deve ter exatamente 4 dígitos hexadecimais.';

  @override
  String get irFinderDatabaseNotReady =>
      'O banco de dados ainda não está pronto.';

  @override
  String get irFinderSelectBrandFirst =>
      'Selecione primeiroo uma marca en Configuração.';

  @override
  String get irFinderBruteforceUnavailable =>
      'A força bruta ainda não está disponível para este protocolo.';

  @override
  String get irFinderInvalidPrefix => 'Prefixo inválido.';

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
    return 'controle n.º $value';
  }

  @override
  String get irFinderJumpOffsetHelper =>
      'Digite um índice base 0 dentro dos resultados filtrados e ordenados.';

  @override
  String get irFinderJumpCursorHelper =>
      'Digite um cursor hexadecimal base 0 dentro do espaço de força bruta.';

  @override
  String get irFinderSetupTab => 'Configuração';

  @override
  String get irFinderTestTab => 'Testar';

  @override
  String get irFinderResultsTab => 'Resultados';

  @override
  String get irFinderContinueToTest => 'Continuar a Teste';

  @override
  String get irFinderKaseikyoVendorTitle => 'Proveedor Kaseikyo';

  @override
  String get irFinderCustomVendorLabel => 'Proveedor personalizado (4 hex)';

  @override
  String get irFinderBrowseDbCandidates => 'Explorar candidatos de BD…';

  @override
  String get irFinderEditSetup => 'Editar configuração';

  @override
  String get irFinderNoSavedHits =>
      'Ainda não há acertos salvos. Na página Testar, toque em \"Salvar acerto\" quando o dispositivo responder.';

  @override
  String get irFinderBackToTest => 'voltar a Teste';

  @override
  String get irFinderLargeSearchSpaceTitle => 'Espaço de pesquisa grande';

  @override
  String irFinderLargeSearchSpaceBody(Object human) {
    return 'Este espaço de força bruta é muito grande ($human possibilidades). O IR Finder respeitará suas tentativas máximas e a espera, mas evite saturar dispositivos IR.\n\nRecomendação: use primeiro o modo Banco de dados e/ou informe bytes de prefixo conhecidos para reduzir o espaço.';
  }

  @override
  String get irFinderDatabaseSession => 'Sessão do banco de dados';

  @override
  String get irFinderBruteforceSession => 'Sessão de força bruta';

  @override
  String get irFinderResumeLastSession => 'Retomar última sessão';

  @override
  String irFinderResumeBrandModel(Object brand, Object model) {
    return 'Marca: $brand · Modelo: $model';
  }

  @override
  String irFinderResumePrefix(Object value) {
    return 'Prefixo: $value';
  }

  @override
  String irFinderResumeProgress(Object progress, Object when) {
    return 'Progreso: $progress · Início: $when';
  }

  @override
  String get irFinderApplyResume => 'Aplicar e retomar';

  @override
  String get irFinderBruteforceMode => 'Força bruta';

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
      'Controla a codificación e por tanto o espaço de pesquisa.';

  @override
  String get irFinderKnownPrefixLabel =>
      'Prefixo conhecido (bytes hexadecimais, opcional)';

  @override
  String get irFinderKnownPrefixHint => 'A1B2, A1 B2, A1:B2, 0xA1 0xB2';

  @override
  String irFinderKnownPrefixHelperPayload(int digits) {
    return 'Carga: $digits dígito(s) hex';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExample(int digits, Object example) {
    return 'Carga: $digits dígito(s) hexadecimais · Exemplo: $example';
  }

  @override
  String irFinderKnownPrefixHelperPayloadMax(int digits, int bytes) {
    return 'Carga: $digits dígito(s) hexadecimais · Prefixo máx.: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperPayloadExampleMax(
      int digits, Object example, int bytes) {
    return 'Carga: $digits dígito(s) hexadecimais · Exemplo: $example · Prefixo máx.: $bytes byte(s)';
  }

  @override
  String irFinderKnownPrefixHelperExample(Object example) {
    return 'Exemplo: $example';
  }

  @override
  String get irFinderKnownPrefixHelperFallback =>
      'Introduza os primeiroos bytes conocidos para reducir o espaço de pesquisa.';

  @override
  String get irFinderDatabaseMode => 'Base de dados';

  @override
  String irFinderNormalizedPrefixValue(Object value) {
    return 'Prefixo normalizado: $value';
  }

  @override
  String get irFinderNormalizedPrefix => 'Prefixo normalizado';

  @override
  String get irFinderBruteforceNotConfigured =>
      'A força bruta ainda não está configurada para este protocolo.';

  @override
  String irFinderAllLimit(Object value) {
    return 'Tudo ($value)';
  }

  @override
  String get irFinderTestControls => 'controles de teste';

  @override
  String irFinderPayloadLength(int digits) {
    return 'Longitud de carga: $digits dígito(s) hex.';
  }

  @override
  String irFinderSearchSpace(Object value) {
    return 'Espaço de pesquisa: $value possibilidades (após as restrições do prefixo).';
  }

  @override
  String get irFinderCooldownMs => 'Espera (ms)';

  @override
  String get irFinderMaxAttemptsPerRun => 'Máx. de tentativas por execução';

  @override
  String get irFinderTestAllCombinations => 'Testar todas as combinações';

  @override
  String irFinderTestAllCombinationsHint(Object value) {
    return 'Executa até esgotar o espaço de pesquisa. Limite efetivo: $value';
  }

  @override
  String get irFinderAttempts => 'Tentativas';

  @override
  String irFinderAttemptsSliderRange(int max) {
    return 'Rango do deslizador: 1–$max (escreva cualquier número para valores mayores)';
  }

  @override
  String irFinderMaxButton(int value) {
    return 'Máx.\n$value';
  }

  @override
  String irFinderEffectiveLimitThisRun(Object value) {
    return 'Límite efectivo en esta execução: $value';
  }

  @override
  String get irFinderBruteforceTip =>
      'Dica: use primeiro o modo Banco de dados; a força bruta funciona melhor com um prefixo conhecido (por exemplo, os primeiros 1 a 4 bytes).';

  @override
  String get irFinderDatabaseInitFailed =>
      'Falhou a inicialização de a base de dados.';

  @override
  String get irFinderPreparingDatabase =>
      'Preparando base local de códigos IR…';

  @override
  String get irFinderDatabaseAssistedSearch => 'Pesquisa asistida por BD';

  @override
  String get irFinderBrand => 'Marca';

  @override
  String get irFinderSelectBrand => 'Selecionar marca';

  @override
  String get irFinderModelOptional => 'Modelo (opcional)';

  @override
  String get irFinderSelectBrandFirstShort => 'Selecione primeiroo uma marca';

  @override
  String get irFinderSelectModelRecommended =>
      'Selecione um modelo (recomendado)';

  @override
  String get irFinderOnlySelectedProtocol => 'Apenas protocolo selecionado';

  @override
  String get irFinderOnlySelectedProtocolHint =>
      'Filtra as teclas pelo protocolo escolhido. Desative para ver todos os protocolos.';

  @override
  String get irFinderQuickWinsFirst => 'Acertos rápidos primeiro';

  @override
  String get irFinderQuickWinsFirstHint =>
      'Prioriza teclas como POWER, MUTE, VOL e CH antes de outras mais profundas.';

  @override
  String get irFinderMaxKeysPerRun => 'Máx. de teclas a testar por execução';

  @override
  String get irFinderTesting => 'Probando…';

  @override
  String get irFinderCooldown => 'Espera';

  @override
  String get irFinderEta => 'ETA';

  @override
  String get irFinderMode => 'Modo';

  @override
  String get irFinderRetryLast => 'Tentar novamente a última';

  @override
  String get irFinderTrigger => 'Disparar';

  @override
  String get irFinderJump => 'Saltar…';

  @override
  String get irFinderSaveHit => 'Salvar acerto';

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
      'Empieza a teste para ver o último código intentado.';

  @override
  String irFinderFromDb(Object value) {
    return 'De BD: $value';
  }

  @override
  String get irFinderFromBruteforce =>
      'De força bruta (generado por o codificador de protocolo).';

  @override
  String irFinderSendError(Object error) {
    return 'Erro de envio: $error';
  }

  @override
  String irFinderSourceValue(Object value) {
    return 'Origen: $value';
  }

  @override
  String get irFinderResultsNote =>
      'Os resultados permitem Testar e Copiar imediatamente. A integração direta para adicionar ao controle pode ser ampliada depois no editor.';

  @override
  String get irFinderBrowseDbCandidatesTitle => 'Explorar candidatos de BD';

  @override
  String get irFinderFilterByLabelOrHex => 'Filtrar por etiqueta o hex…';

  @override
  String get irFinderJumpHere => 'Saltar aqui';

  @override
  String get irFinderSelectModel => 'Selecionar modelo';

  @override
  String get irFinderSearchBrands => 'pesquisar marcas…';

  @override
  String get irFinderSearchModels => 'pesquisar modelos…';

  @override
  String get iconPickerTitle => 'Selecionar ícone';

  @override
  String get iconPickerSearchHint => 'Pesquisar ícones...';

  @override
  String get iconPickerNoIconsFound => 'Nenhum ícone encontrado';

  @override
  String iconPickerIconsAvailable(int count) {
    return '$count ícones disponíveis';
  }

  @override
  String get iconPickerCategoryAll => 'Tudo';

  @override
  String get iconPickerCategoryMedia => 'Medios';

  @override
  String get iconPickerCategoryVolume => 'Volume';

  @override
  String get iconPickerCategoryNavigation => 'Navegación';

  @override
  String get iconPickerCategoryPower => 'Enc.';

  @override
  String get iconPickerCategoryNumbers => 'Números';

  @override
  String get iconPickerCategorySettings => 'configurações';

  @override
  String get iconPickerCategoryDisplay => 'tela';

  @override
  String get iconPickerCategoryInput => 'Entrada';

  @override
  String get iconPickerCategoryFavorite => 'Favorito';

  @override
  String get universalPowerTitle => 'conectado universal';

  @override
  String get universalPowerRunTab => 'Executar';

  @override
  String get universalPowerUseResponsibly => 'Úsalo con responsabilidad';

  @override
  String get universalPowerConsentBody =>
      'conectado universal cicla códigos IR de conectado. Úsalo apenas en dispositivos que posees o controlas. Deténlo en cuanto o dispositivo responda.';

  @override
  String get universalPowerConsentCheckbox => 'Poseo o controle o dispositivo';

  @override
  String get universalPowerSetupBody =>
      'Cicla códigos de conectado para a marca escolhida. Deténlo en cuanto o dispositivo responda.';

  @override
  String universalPowerLastSent(Object value) {
    return 'Último enviado: $value';
  }

  @override
  String get universalPowerNoCodesFound =>
      'Nenhum código de energia foi encontrado. Tente ampliar a pesquisa.';

  @override
  String get universalPowerUnableToStart => 'Não se pudo iniciar.';

  @override
  String get universalPowerAllBrands => 'Todas as marcas (sem filtro)';

  @override
  String get universalPowerClearBrandFilter => 'Limpiar filtro de marca';

  @override
  String get universalPowerBroadenSearch => 'Amplía a pesquisa se hace falta';

  @override
  String get universalPowerBroadenSearchHint =>
      'Se nenhuma etiqueta de energia for encontrada, inclua outras teclas.';

  @override
  String get universalPowerAdditionalPatternsDepth =>
      'Profundidad de patrones extra';

  @override
  String get universalPowerDepth1 => 'Apenas prioridad: POWER/OFF';

  @override
  String get universalPowerDepth2 => 'Incluir alias de POWER';

  @override
  String get universalPowerDepth3 =>
      'Incluir etiquetas secundarias de conectado';

  @override
  String get universalPowerDepth4 =>
      'Incluir todas as etiquetas (menor prioridad)';

  @override
  String get universalPowerLoopUntilStopped => 'Repetir até parar';

  @override
  String get universalPowerLoopUntilStoppedHint =>
      'Continua percorrendo a fila até você parar.';

  @override
  String get universalPowerDelayBetweenCodes => 'Pausa entre códigos';

  @override
  String get universalPowerStart => 'Iniciar conectado universal';

  @override
  String get universalPowerRunStatus => 'Estado de execução';

  @override
  String universalPowerProgress(Object value) {
    return 'Progreso: $value';
  }

  @override
  String get universalPowerPausedInBackground =>
      'Pausado porque o app foi para segundo plano.';

  @override
  String get universalPowerSendOneCode => 'Enviar um código';

  @override
  String get universalPowerStopWhenDeviceResponds =>
      'Deténlo en cuanto o dispositivo responda.';

  @override
  String get iconNamePlay => 'Reproduzir';

  @override
  String get iconNamePause => 'Pausa';

  @override
  String get iconNameStop => 'parar';

  @override
  String get iconNameFastForward => 'Avance rápido';

  @override
  String get iconNameRewind => 'Rebobinar';

  @override
  String get iconNameSkipNext => 'Seguinte';

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
  String get iconNameRepeatOne => 'Repetir uma';

  @override
  String get iconNameVolumeUp => 'Volume Cima';

  @override
  String get iconNameVolumeDown => 'Volume Baixo';

  @override
  String get iconNameVolumeOff => 'Volume Desconectado';

  @override
  String get iconNameMute => 'Sil.';

  @override
  String get iconNameSpeaker => 'Altavoz';

  @override
  String get iconNameSurroundSound => 'Envolvente Sonido';

  @override
  String get iconNameEqualizer => 'Ecualizador';

  @override
  String get iconNameAudio => 'áudio';

  @override
  String get iconNameMicrophone => 'Micrófono';

  @override
  String get iconNameMicOff => 'Mic Desconectado';

  @override
  String get iconNameUp => 'Cima';

  @override
  String get iconNameDown => 'Baixo';

  @override
  String get iconNameLeft => 'Esquerda';

  @override
  String get iconNameRight => 'Direita';

  @override
  String get iconNameArrowUp => 'Seta Cima';

  @override
  String get iconNameArrowDown => 'Seta Baixo';

  @override
  String get iconNameArrowLeft => 'Seta Esquerda';

  @override
  String get iconNameArrowRight => 'Seta Direita';

  @override
  String get iconNameNavigation => 'Navegación';

  @override
  String get iconNameChevronLeft => 'Chevron Esquerda';

  @override
  String get iconNameChevronRight => 'Chevron Direita';

  @override
  String get iconNameExpandLess => 'Expandir Menos';

  @override
  String get iconNameExpandMore => 'Expandir Mais';

  @override
  String get iconNameCollapse => 'Contraer';

  @override
  String get iconNameExpand => 'Expandir';

  @override
  String get iconNameCircleUp => 'Círculo Cima';

  @override
  String get iconNameCircleDown => 'Círculo Baixo';

  @override
  String get iconNameCircleLeft => 'Círculo Esquerda';

  @override
  String get iconNameCircleRight => 'Círculo Direita';

  @override
  String get iconNameOkSelect => 'OK/Selecionar';

  @override
  String get iconNameConfirm => 'Confirmar';

  @override
  String get iconNameCancel => 'Cancelar';

  @override
  String get iconNameClose => 'Fechar';

  @override
  String get iconNameHome => 'Início';

  @override
  String get iconNameReturn => 'voltar';

  @override
  String get iconNameExit => 'Salir';

  @override
  String get iconNameUndo => 'desfazer';

  @override
  String get iconNameRedo => 'Rehacer';

  @override
  String get iconNamePower => 'Enc.';

  @override
  String get iconNamePowerAlt => 'conectado Alt';

  @override
  String get iconNamePowerOff => 'Power Desconectado';

  @override
  String get iconNameOn => 'conectado';

  @override
  String get iconNameOff => 'Desconectado';

  @override
  String get iconNameToggleOn => 'Alternar conectado';

  @override
  String get iconNameToggleOff => 'Alternar desconectado';

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
  String get iconNamePlus => 'Mais';

  @override
  String get iconNameMinus => 'Menos';

  @override
  String get iconNameAddCircle => 'Adicionar círculo';

  @override
  String get iconNameRemoveCircle => 'Remove Círculo';

  @override
  String get iconNameSettings => 'configurações';

  @override
  String get iconNameMenu => 'Menú';

  @override
  String get iconNameMoreVertical => 'Mais Vertical';

  @override
  String get iconNameMoreHorizontal => 'Mais Horizontal';

  @override
  String get iconNameTune => 'Ajuste';

  @override
  String get iconNameRemoteSettings => 'controle configurações';

  @override
  String get iconNameInfo => 'Informação';

  @override
  String get iconNameInfoOutline => 'Informação contorno';

  @override
  String get iconNameHelp => 'Ajuda';

  @override
  String get iconNameHelpOutline => 'Ajuda Contorno';

  @override
  String get iconNameList => 'Lista';

  @override
  String get iconNameViewList => 'Vista List';

  @override
  String get iconNameViewGrid => 'Vista grade';

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
  String get iconNameBrightnessHigh => 'Brilho alto';

  @override
  String get iconNameBrightnessMedium => 'Brilho medio';

  @override
  String get iconNameBrightnessLow => 'Brilho bajo';

  @override
  String get iconNameAutoBrightness => 'Brilho automático';

  @override
  String get iconNameLightMode => 'Luz Modo';

  @override
  String get iconNameDarkMode => 'Dark Modo';

  @override
  String get iconNameContrast => 'Contraste';

  @override
  String get iconNameHdrOn => 'HDR conectado';

  @override
  String get iconNameHdrOff => 'HDR Desconectado';

  @override
  String get iconNameAspectRatio => 'Relación de aspecto';

  @override
  String get iconNameCrop => 'Recortar';

  @override
  String get iconNameZoomIn => 'Acercar';

  @override
  String get iconNameZoomOut => 'Alejar';

  @override
  String get iconNameFullscreen => 'tela completa';

  @override
  String get iconNameExitFullscreen => 'Exit tela completa';

  @override
  String get iconNameFitScreen => 'Ajustar tela';

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
  String get iconNameComposite => 'Compuisto';

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
  String get iconNameDoneAll => 'Concluído Tudo';

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
  String get iconNameInvertColors => 'Inverter Colores';

  @override
  String get iconNamePalette => 'Paleta';

  @override
  String get iconNameColor => 'Cor';

  @override
  String get iconNameTonality => 'Tonalidad';

  @override
  String get iconNameSearch => 'buscar';

  @override
  String get iconNameRefresh => 'Atualizar';

  @override
  String get iconNameSync => 'Sincronizar';

  @override
  String get iconNameUpdate => 'Atualizar';

  @override
  String get iconNameDownload => 'Descargar';

  @override
  String get iconNameUpload => 'Subir';

  @override
  String get iconNameCloud => 'Nube';

  @override
  String get iconNameFolder => 'Pasta';

  @override
  String get iconNameDelete => 'Excluir';

  @override
  String get iconNameEdit => 'Editar';

  @override
  String get iconNameSave => 'Salvar';

  @override
  String get iconNameShare => 'Compartir';

  @override
  String get iconNamePrint => 'Imprimir';

  @override
  String get iconNameLanguage => 'Idioma';

  @override
  String get iconNameTranslate => 'Traducir';

  @override
  String get iconNameMicNone => 'Mic Ningum';

  @override
  String get iconNameSubtitles => 'Legendas';

  @override
  String get iconNameClosedCaption => 'Legendas cerrados';

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
  String get iconNameCamera => 'Câmara';

  @override
  String get iconNameVideoCamera => 'Video Câmara';

  @override
  String get iconNamePhotoCamera => 'Foto Câmara';

  @override
  String get iconNameSlowMotion => 'Lento Movimiento';

  @override
  String get iconNameSpeed => 'Velocidad';

  @override
  String get iconNameVideoSettings => 'Video configurações';

  @override
  String get iconNameAudioTrack => 'Pista de áudio';

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
  String get iconNamePlayFa => 'Reproduzir FA';

  @override
  String get iconNamePauseFa => 'Pausa FA';

  @override
  String get iconNameStopFa => 'parar FA';

  @override
  String get iconNamePlayFaOutline => 'Reproduzir FA Contorno';

  @override
  String get iconNamePauseFaOutline => 'Pausa FA Contorno';

  @override
  String get iconNameStopFaOutline => 'parar FA Contorno';

  @override
  String get iconNameBackwardFa => 'Atrás FA';

  @override
  String get iconNameForwardFa => 'Adelante FA';

  @override
  String get iconNamePreviousFa => 'Anterior FA';

  @override
  String get iconNameNextFa => 'Seguinte FA';

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
  String get iconNameCameraFa => 'Câmara FA';

  @override
  String get iconNameCameraRetroFa => 'Câmara Retro FA';

  @override
  String get iconNameVolumeHighFa => 'Volume alto FA';

  @override
  String get iconNameVolumeLowFa => 'Volume bajo FA';

  @override
  String get iconNameVolumeOffFa => 'Volume Desconectado FA';

  @override
  String get iconNameMuteFa => 'Silencio FA';

  @override
  String get iconNameMicMuteFa => 'Mic silenciado FA';

  @override
  String get iconNameHeadphonesFa => 'Auriculares FA';

  @override
  String get iconNameSpeakerFa => 'Altavoz FA';

  @override
  String get iconNameUpFa => 'Cima FA';

  @override
  String get iconNameDownFa => 'Baixo FA';

  @override
  String get iconNameLeftFa => 'Esquerda FA';

  @override
  String get iconNameRightFa => 'Direita FA';

  @override
  String get iconNameUpFaOutline => 'Cima FA Contorno';

  @override
  String get iconNameDownFaOutline => 'Baixo FA Contorno';

  @override
  String get iconNameLeftFaOutline => 'Esquerda FA Contorno';

  @override
  String get iconNameRightFaOutline => 'Direita FA Contorno';

  @override
  String get iconNameArrowUpFa => 'Seta Cima FA';

  @override
  String get iconNameArrowDownFa => 'Seta Baixo FA';

  @override
  String get iconNameArrowLeftFa => 'Seta Esquerda FA';

  @override
  String get iconNameArrowRightFa => 'Seta Direita FA';

  @override
  String get iconNameChevronUpFa => 'Chevron Cima FA';

  @override
  String get iconNameChevronDownFa => 'Chevron Baixo FA';

  @override
  String get iconNameChevronLeftFa => 'Chevron Esquerda FA';

  @override
  String get iconNameChevronRightFa => 'Chevron Direita FA';

  @override
  String get iconNameOkFa => 'OK FA';

  @override
  String get iconNameOkFaOutline => 'OK FA Contorno';

  @override
  String get iconNameCheckFa => 'Marca FA';

  @override
  String get iconNameCloseFa => 'Fechar FA';

  @override
  String get iconNameCloseCircleFa => 'Close Círculo FA';

  @override
  String get iconNameHomeFa => 'Início FA';

  @override
  String get iconNameUndoFa => 'desfazer FA';

  @override
  String get iconNameRedoFa => 'Rehacer FA';

  @override
  String get iconNameRotateFa => 'Girar FA';

  @override
  String get iconNameSearchFa => 'pesquisar FA';

  @override
  String get iconNameRefreshFa => 'Atualizar FA';

  @override
  String get iconNamePowerOffFa => 'Power Desconectado FA';

  @override
  String get iconNamePlugFa => 'Enchufe FA';

  @override
  String get iconNameToggleOnFa => 'Alternar conectado FA';

  @override
  String get iconNameToggleOffFa => 'Alternar desconectado FA';

  @override
  String get iconNameSettingsFa => 'configurações FA';

  @override
  String get iconNameSettingsAltFa => 'configurações Alt FA';

  @override
  String get iconNameMenuFa => 'Menú FA';

  @override
  String get iconNameMoreFa => 'Mais FA';

  @override
  String get iconNameMoreVerticalFa => 'Mais Vertical FA';

  @override
  String get iconNameInfoFa => 'Informação FA';

  @override
  String get iconNameInfoFaOutline => 'Informação FA contorno';

  @override
  String get iconNameHelpFa => 'Ajuda FA';

  @override
  String get iconNameHelpFaOutline => 'Ajuda FA Contorno';

  @override
  String get iconNameListFa => 'Lista FA';

  @override
  String get iconNameGridFa => 'grade FA';

  @override
  String get iconNameSlidersFa => 'Deslizadores FA';

  @override
  String get iconNameTvFa => 'TV FA';

  @override
  String get iconNameMonitorFa => 'Monitor FA';

  @override
  String get iconNameDesktopFa => 'Escritorio FA';

  @override
  String get iconNameBrightnessFa => 'Brilho FA';

  @override
  String get iconNameNightModeFa => 'Noche Modo FA';

  @override
  String get iconNameLightFa => 'Luz FA';

  @override
  String get iconNameLightFaOutline => 'Luz FA Contorno';

  @override
  String get iconNameFlashFa => 'Flash FA';

  @override
  String get iconNameFullscreenFa => 'tela completa FA';

  @override
  String get iconNameExitFullscreenFa => 'Exit tela completa FA';

  @override
  String get iconNameZoomInFa => 'Acercar FA';

  @override
  String get iconNameZoomOutFa => 'Alejar FA';

  @override
  String get iconNameSubtitlesFa => 'Legendas FA';

  @override
  String get iconNamePictureInPictureFa => 'Imagem en imagem FA';

  @override
  String get iconNameColorFa => 'Cor FA';

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
  String get iconNameGamepadFa => 'controle FA';

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
  String get iconNameImagesFa => 'Imagens FA';

  @override
  String get iconNameImageFa => 'Imagem FA';

  @override
  String get iconNameVideoFileFa => 'arquivo de video FA';

  @override
  String get iconNameAudioFileFa => 'arquivo de áudio FA';

  @override
  String get iconNamePlayOutlineFa => 'Reproduzir Contorno FA';

  @override
  String get iconNamePlaySimpleFa => 'Reproduzir simple FA';

  @override
  String get iconNamePauseSimpleFa => 'Pausa simple FA';

  @override
  String get iconNameStopSimpleFa => 'parar simple FA';

  @override
  String get iconNameRecordFa => 'Grabar FA';

  @override
  String get iconNameStopCircleFa => 'parar Círculo FA';

  @override
  String get iconNameLoadingFa => 'Cargando FA';

  @override
  String get iconNameTextFa => 'Texto FA';

  @override
  String get iconNameTextSizeFa => 'Texto Tamanho FA';

  @override
  String get iconNameLanguageFa => 'Idioma FA';

  @override
  String get iconNameGlobeFa => 'Globo FA';

  @override
  String get iconNameSubtitlesAltFa => 'Legendas Alt FA';

  @override
  String get iconNameSubtitlesAltOutlineFa => 'Legendas Alt Contorno FA';

  @override
  String get iconNameChannelUpFa => 'Canal Cima FA';

  @override
  String get iconNameChannelDownFa => 'Canal Baixo FA';

  @override
  String get iconNamePageUpFa => 'Página Cima FA';

  @override
  String get iconNamePageDownFa => 'Página Baixo FA';

  @override
  String get iconNameGuideFa => 'Guía FA';

  @override
  String get iconNameGridViewFa => 'grade Vista FA';

  @override
  String get iconNameGridAltFa => 'grade Alt FA';

  @override
  String get iconNameScheduleFa => 'Programación FA';

  @override
  String get iconNameCalendarFa => 'Calendario FA';

  @override
  String get iconNameRedButtonFa => 'Rojo Botão FA';

  @override
  String get iconNameButtonOutlineFa => 'Botão Contorno FA';

  @override
  String get iconNameSquareButtonFa => 'Quadrado Botão FA';

  @override
  String get iconNameSquareOutlineFa => 'Quadrado Contorno FA';

  @override
  String get iconNameDotCircleFa => 'Punto Círculo FA';

  @override
  String get iconNameToolsFa => 'Herramientas FA';

  @override
  String get iconNameScrewdriverFa => 'Distornillador FA';

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
  String get iconNameSortDownFa => 'Ordenar Baixo FA';

  @override
  String get iconNameSortUpFa => 'Ordenar Cima FA';

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
  String get iconNameSquareFullFa => 'Quadrado Completo FA';

  @override
  String get iconNameFullscreenAltFa => 'tela completa Alt FA';

  @override
  String get iconNameZoomPlusFa => 'Zoom Mais FA';

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
  String get iconNameSignalFa => 'Sinal FA';

  @override
  String get iconNameFeedFa => 'Feed FA';

  @override
  String get iconNameCircleArrowUpFa => 'Círculo Seta Cima FA';

  @override
  String get iconNameCircleArrowDownFa => 'Círculo Seta Baixo FA';

  @override
  String get iconNameCircleArrowLeftFa => 'Círculo Seta Esquerda FA';

  @override
  String get iconNameCircleArrowRightFa => 'Círculo Seta Direita FA';

  @override
  String get iconNameLongArrowUpFa => 'Largo Seta Cima FA';

  @override
  String get iconNameLongArrowDownFa => 'Largo Seta Baixo FA';

  @override
  String get iconNameLongArrowLeftFa => 'Largo Seta Esquerda FA';

  @override
  String get iconNameLongArrowRightFa => 'Largo Seta Direita FA';

  @override
  String get iconNamePlusFa => 'Mais FA';

  @override
  String get iconNameMinusFa => 'Menos FA';

  @override
  String get iconNamePlusCircleFa => 'Mais Círculo FA';

  @override
  String get iconNameMinusCircleFa => 'Menos Círculo FA';

  @override
  String get iconNamePlusSquareFa => 'Mais Quadrado FA';

  @override
  String get iconNameMinusSquareFa => 'Menos Quadrado FA';

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
  String get iconNameCloudMoonFa => 'Nube Luma FA';

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
  String get unknownLabel => 'Desconhecido';

  @override
  String get selectedFilesLabel => 'arquivo(s) selecionado(s)';

  @override
  String get folderNotFoundOrInaccessible =>
      'Pasta não encontrada o inaccesible.';

  @override
  String get importedRemoteDefaultName => 'MandoImportado';

  @override
  String get demoRemoteName => 'controle demo';

  @override
  String get protocolFieldsInvalid =>
      'Rellena os campos obrigatórios do protocolo e asegúrate de que a frecuencia sea 15k–60k se se define.';

  @override
  String get unknownProtocolSelected =>
      'Foi selecionado um protocolo desconhecido.';

  @override
  String get continueSectionTitle => 'Continue';

  @override
  String get continueSectionSubtitle => 'Pick up where you left off.';

  @override
  String get continueLastRemoteTitle => 'Último controle';

  @override
  String get continueLastMacroTitle => 'Last macro';

  @override
  String get continueLastIrFinderHitTitle => 'Last IR Finder hit';

  @override
  String get continueTargetUnavailable => 'Este item não está mais disponível.';

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
  String get pinRemote => 'Fixar controle';

  @override
  String get unpinRemote => 'Desafixar controle';

  @override
  String get pinRemoteSubtitle =>
      'Mantenha este controle no topo para acessá-lo rapidamente.';

  @override
  String get remoteAddedToPinned => 'Controle fixado.';

  @override
  String get remoteRemovedFromPinned => 'Controle desafixado.';

  @override
  String get homeDeviceControlsTitle => 'Controles rápidos';

  @override
  String get homeDeviceControlsSubtitle =>
      'Liga/desliga, mudo e volume sem abrir um controle remoto.';

  @override
  String get homeDeviceControlsEmptySubtitle =>
      'Configure botões de liga/desliga, mudo e volume nos Controles do dispositivo.';

  @override
  String get showDeviceControlsOnHome =>
      'Mostrar controles rápidos na tela inicial';

  @override
  String get showDeviceControlsOnHomeSubtitle =>
      'Mostra a linha compacta de Liga/desliga, Mudo e Volume na tela principal.';

  @override
  String get homeDeviceControlsShown => 'Controles rápidos visíveis no app.';

  @override
  String get homeDeviceControlsHidden => 'Controles rápidos ocultos no app.';

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
  String get globalSearchNoResults => 'Nenhum resultado encontrado.';

  @override
  String get globalSearchTypeRemote => 'Controle';

  @override
  String get globalSearchTypeButton => 'Botão';

  @override
  String get globalSearchTypeMacro => 'Macro';

  @override
  String get learningModeCaptureFailed => 'Não foi possível capturar o sinal.';

  @override
  String get learningModeReplaySent => 'Sinal enviado.';

  @override
  String get learningModeReplayFailed =>
      'Não foi possível enviar o sinal capturado.';

  @override
  String get learningModeNoRemotesAvailable => 'Ainda não há controles salvos.';

  @override
  String get learningModeChooseRemoteTitle => 'Escolha um controle';

  @override
  String get learningModeNewRemoteTitle => 'Criar controle';

  @override
  String get learningModeSaveSuccess => 'Botão salvo.';

  @override
  String get learningModeSaveFailed => 'Não foi possível salvar o botão.';

  @override
  String get remoteSetupIntro =>
      'Escolha um nome e um layout. Adicione os botões na próxima etapa.';

  @override
  String get startWithDefault => 'Usar nome padrão';

  @override
  String get browseGithubStore => 'Explorar GitHub';

  @override
  String get addFirstButton => 'Adicionar primeiro botão';

  @override
  String get moreWaysToStart => 'Outras formas de adicionar botões';

  @override
  String get unsavedRemoteSetupChangesMessage =>
      'Descartar a configuração deste novo controle? As alterações não serão salvas.';

  @override
  String get unsavedRemoteStudioChangesMessage =>
      'Descartar as alterações deste controle? Elas não serão salvas.';

  @override
  String get firstButtonAdded => 'Primeiro botão adicionado.';

  @override
  String get iconColorTitle => 'Cor do ícone';

  @override
  String get iconColorHelper =>
      'Escolha uma cor para o símbolo que continue visível sobre o fundo do botão.';

  @override
  String get colorRed => 'Vermelho';

  @override
  String get colorPink => 'Rosa';

  @override
  String get colorPurple => 'Roxo';

  @override
  String get colorDeepPurple => 'Roxo escuro';

  @override
  String get colorIndigo => 'Índigo';

  @override
  String get colorBlue => 'Azul';

  @override
  String get colorLightBlue => 'Azul claro';

  @override
  String get colorCyan => 'Ciano';

  @override
  String get colorTeal => 'Verde-azulado';

  @override
  String get colorGreen => 'Verde';

  @override
  String get colorLightGreen => 'Verde claro';

  @override
  String get colorLime => 'Lima';

  @override
  String get colorYellow => 'Amarelo';

  @override
  String get colorAmber => 'Âmbar';

  @override
  String get colorOrange => 'Laranja';

  @override
  String get colorDeepOrange => 'Laranja escuro';

  @override
  String get colorBrown => 'Marrom';

  @override
  String get colorGrey => 'Cinza';

  @override
  String get colorBlueGrey => 'Cinza azulado';

  @override
  String get colorBlack => 'Preto';

  @override
  String get colorWhite => 'Branco';

  @override
  String buttonColorSemantics(Object colorName) {
    return 'Cor do botão $colorName';
  }

  @override
  String buttonColorSemanticsSelected(Object colorName) {
    return 'Cor do botão $colorName, selecionada';
  }

  @override
  String iconColorSemantics(Object colorName) {
    return 'Cor do ícone $colorName';
  }

  @override
  String iconColorSemanticsSelected(Object colorName) {
    return 'Cor do ícone $colorName, selecionada';
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

  @override
  String get quickSettingsTilesTitle => 'Blocos das Configurações rápidas';

  @override
  String get quickSettingsPowerTile => 'Bloco de ligar';

  @override
  String get quickSettingsMuteTile => 'Bloco de mudo';

  @override
  String get quickSettingsVolumeUpTile => 'Bloco de aumentar volume';

  @override
  String get quickSettingsVolumeDownTile => 'Bloco de diminuir volume';

  @override
  String get quickSettingsNoTilesConfigured => 'Nenhum bloco configurado';

  @override
  String get quickSettingsEmptyHint =>
      'Próximo passo: escolha um comando para pelo menos um bloco e depois adicione o bloco no menu de edição das Configurações rápidas do Android.';

  @override
  String get quickSettingsSetPowerTile => 'Configurar bloco de ligar';

  @override
  String get quickSettingsConfiguredHint =>
      'Escolha qual botão cada bloco envia. Adicione os blocos no menu de edição das Configurações rápidas do Android.';

  @override
  String get quickSettingsNotSet => 'Não configurado';

  @override
  String quickSettingsTileMappingSummary(String title, String subtitle) {
    return '$title · $subtitle';
  }

  @override
  String get quickSettingsPickButtonTooltip => 'Escolher botão';

  @override
  String get quickSettingsClearTooltip => 'Limpar';

  @override
  String get homeWidgetUnsupportedLauncher =>
      'Adicione o widget do IR Blaster pelo menu de widgets da tela inicial.';

  @override
  String get homeWidgetButtonUnsupported =>
      'Este botão não pode ser adicionado como widget à tela inicial.';

  @override
  String get homeWidgetRequestSent =>
      'A adição do widget foi solicitada. Confirme na tela inicial, se necessário.';

  @override
  String get homeWidgetRequestRejected =>
      'Não foi possível solicitar o widget. Tente adicioná-lo pela tela inicial.';

  @override
  String homeWidgetSetupFailed(String error) {
    return 'Não foi possível configurar o widget: $error';
  }

  @override
  String get addHomeWidget => 'Adicionar widget à tela inicial';

  @override
  String get addHomeWidgetSubtitle => 'Coloque este botão na sua tela inicial.';

  @override
  String buttonInfoType(String type) {
    return 'Tipo: $type';
  }

  @override
  String get buttonInfoCodeRaw => 'Código: sinal bruto';

  @override
  String buttonInfoCode(String code) {
    return 'Código: $code';
  }

  @override
  String get buttonInfoNoCode => 'SEM CÓDIGO';

  @override
  String buttonInfoFrequency(String frequency) {
    return 'Frequência: $frequency';
  }

  @override
  String get frequencyHzLabel => 'Frequência (Hz)';

  @override
  String get carrierFrequencyHelper => 'Frequência portadora, ex. 38000';

  @override
  String get requiredFrequencyHelper => 'Obrigatório. Exemplo: 38000';

  @override
  String get validFrequencyError => 'Insira uma frequência válida (15k-60k).';

  @override
  String get resetToDefaultFrequency => 'Redefinir para 38000';

  @override
  String get rawDataLabel => 'Dados brutos';

  @override
  String get rawDataHelper =>
      'Números inteiros separados por espaços, ex. 9000 4500 560 560 ...';

  @override
  String get rawDataInvalid =>
      'Os dados brutos devem ser números inteiros separados por espaços ou novas linhas.';

  @override
  String get rawDataSafeguard =>
      'Proteção: tokens inválidos são bloqueados para evitar salvar um padrão que não pode ser enviado.';

  @override
  String get protocolLabel => 'Protocolo';

  @override
  String get protocolEncodingHelper =>
      'A codificação só está implementada para protocolos marcados como implementados.';

  @override
  String get protocolFrequencyHelper =>
      'Opcional. Se vazio, a frequência padrão do protocolo é usada quando disponível.';

  @override
  String get rawSignalInvalidWithFrequency =>
      'Os dados brutos devem ser números inteiros separados por espaços ou novas linhas, e a frequência deve ser 15k-60k.';

  @override
  String get necTimingsNumeric => 'Todos os tempos NEC devem ser numéricos.';

  @override
  String get frequencyRangeError => 'A frequência deve ser 15k-60k Hz.';

  @override
  String get pasteTooltip => 'Colar';

  @override
  String get clearTooltip => 'Limpar';

  @override
  String irFinderResumeMask(Object value) {
    return 'Máscara: $value';
  }

  @override
  String get irFinderKnownMaskLabel => 'Máscara de código conhecida (opcional)';

  @override
  String get irFinderKnownMaskHint => '00FFXXFF, FFXXFF ou 0xA1XX';

  @override
  String irFinderKnownMaskHelper(int digits, Object example) {
    return 'Carga de $digits dígitos. Use X nos dígitos desconhecidos; os dígitos finais omitidos viram X. Exemplo: $example';
  }

  @override
  String get irFinderKnownMaskInvalidCharacters =>
      'Use somente dígitos hexadecimais, curingas X, espaços, dois-pontos, hífens ou sublinhados.';

  @override
  String irFinderKnownMaskTooLong(int digits) {
    return 'A máscara é maior que a carga de $digits dígitos deste protocolo.';
  }

  @override
  String irFinderNormalizedMaskValue(Object value) {
    return 'Máscara normalizada: $value';
  }

  @override
  String get irFinderNormalizedMask => 'Máscara normalizada';

  @override
  String get irFinderNormalizedMaskAllUnknown =>
      'Todos os dígitos são desconhecidos';

  @override
  String get irFinderSearchOrder => 'Ordem de busca';

  @override
  String get irFinderSmartOrder => 'Inteligente';

  @override
  String get irFinderSequentialOrder => 'Sequencial';

  @override
  String get irFinderSmartOrderHint =>
      'Conforme o protocolo: testa primeiro valores baixos comuns, depois distribui pelos campos de comando e dispositivo e ignora bits não usados.';

  @override
  String get irFinderSequentialOrderHint =>
      'Modo de compatibilidade: testa os curingas em ordem hexadecimal crescente.';

  @override
  String irFinderSmartMeaningfulBits(int bits) {
    return 'O modo inteligente varia $bits bit(s) significativos para esta máscara.';
  }

  @override
  String get irFinderBruteforceMaskTip =>
      'Dica: substitua cada dígito desconhecido por X. Fixar dígitos conhecidos em qualquer posição reduz bastante a busca.';

  @override
  String get automationBroadcastsTitle => 'Permitir transmissões de automação';

  @override
  String get automationBroadcastsSubtitle =>
      'Qualquer aplicativo instalado pode enviar comandos IR pelo emissor integrado, USB ou áudio, mesmo com este aplicativo fechado. USB exige permissão prévia. O áudio exige um adaptador IR e o volume de mídia aumentado.';

  @override
  String get automationSettingsError =>
      'Não foi possível carregar ou salvar a configuração de automação. Tente novamente.';

  @override
  String get settingsHardwareTitle => 'Hardware IR e aprendizado';

  @override
  String get settingsHardwareSubtitle =>
      'Escolha um emissor, gerencie USB e aprenda sinais';

  @override
  String get settingsAppearanceSubtitle => 'Tema, cores e idioma do aplicativo';

  @override
  String get settingsInteractionSubtitle =>
      'Inicialização, vibração, exibição do controle e automação';

  @override
  String get settingsToolsTitle => 'Ferramentas e atalhos';

  @override
  String get settingsToolsSubtitle =>
      'Controles de dispositivos, configurações rápidas, loja GitHub e ligar/desligar universal';

  @override
  String get layoutCustom => 'Personalizado';

  @override
  String get layoutCustomDescription =>
      'Escolha o número de colunas e o formato dos botões. Adicione espaços vazios no editor.';

  @override
  String get layoutColumns => 'Botões por linha';

  @override
  String get layoutShape => 'Formato dos botões';

  @override
  String get layoutCircle => 'Círculo';

  @override
  String get layoutRoundedSquare => 'Quadrado arredondado';

  @override
  String get layoutRectangle => 'Retângulo';

  @override
  String get layoutReflowHint =>
      'Alterar o número de colunas reorganiza a grade. Deslize para os lados se a grade for mais larga que a tela.';

  @override
  String get layoutUpdated => 'Layout atualizado';

  @override
  String get layoutArrange => 'Organizar botões';

  @override
  String get layoutAddRow => 'Adicionar linha vazia';

  @override
  String get layoutArrangeHint =>
      'Mantenha um botão pressionado e arraste, ou toque nele e depois na nova posição. Se já houver outro botão, eles trocam de lugar.';

  @override
  String get layoutEmptyHint =>
      'Toque em um espaço vazio para adicionar um botão ou em um botão para editar. Mantenha o botão pressionado para ver mais opções.';

  @override
  String layoutCell(int row, int column) {
    return 'Linha $row, coluna $column';
  }

  @override
  String get dbBrandSearchHelp =>
      'Comece pela marca, como Sony ou TCL. Depois escolha um modelo de aparelho ou controle remoto.';

  @override
  String get dbModelSearchHelp =>
      'Busque o modelo indicado no aparelho ou controle remoto. Espaços e hífens não precisam ser iguais.';

  @override
  String get irFinderDatabaseSearchHint =>
      'Comece por uma marca no modo Banco de dados para testar códigos conhecidos sem duplicatas. A força bruta inteligente prioriza algumas possibilidades, mas não detecta a resposta do aparelho. Salve um acerto quando observar uma resposta.';

  @override
  String get irFinderClearSearchToJump =>
      'Limpe a busca para ir a uma posição do teste.';

  @override
  String get crashReportTitle => 'Ocorreu um problema anteriormente';

  @override
  String get crashReportExplanation =>
      'Um relatório local contém detalhes técnicos do aplicativo, do dispositivo e do erro. Nada é enviado automaticamente. Verifique se há informações sensíveis antes de compartilhar. Compartilhar mantém o relatório; Não enviar o exclui; Agora não o guarda para a próxima abertura.';

  @override
  String get crashReportDetails => 'Revisar relatório';

  @override
  String get crashReportShare => 'Compartilhar relatório';

  @override
  String get crashReportEmail => 'Contatar por e-mail';

  @override
  String get crashReportCopied => 'Relatório copiado.';

  @override
  String get crashReportDontSend => 'Não enviar';

  @override
  String get crashReportNotNow => 'Agora não';

  @override
  String get crashReportActionFailed =>
      'Não foi possível concluir esta ação. O relatório continua salvo. Tente copiá-lo ou compartilhá-lo.';

  @override
  String get shareTitle => 'Compartilhar e receber';

  @override
  String get shareReceive => 'Receber';

  @override
  String get shareScan => 'Escanear código QR';

  @override
  String get shareOpenFile => 'Abrir arquivo compartilhado';

  @override
  String get shareSelect => 'Escolher o que compartilhar';

  @override
  String get shareSend => 'Compartilhar com outro dispositivo';

  @override
  String get shareQr => 'Mostrar código QR';

  @override
  String get shareQrHint =>
      'No outro celular, abra IR Blaster > Controles > Compartilhar e receber > Escanear código QR.';

  @override
  String get shareTooLarge =>
      'Dados demais para um QR legível. Use o compartilhamento com outro dispositivo.';

  @override
  String get sharePreview => 'Revisar itens compartilhados';

  @override
  String get sharePrivacy =>
      'Não é preciso conta nem servidor. Nada é enviado ou transmitido automaticamente. O dispositivo receptor precisa de um emissor IR compatível.';

  @override
  String get shareHardwareWarning =>
      'Alguns sinais aprendidos exigem o hardware original e podem não funcionar em outro dispositivo.';

  @override
  String get shareMacroInfo =>
      'As macros incluem os controles e botões associados. A importação cria cópias; nada é substituído ou executado automaticamente.';

  @override
  String get shareAdd => 'Adicionar cópias';

  @override
  String get shareAdded => 'Itens compartilhados adicionados.';

  @override
  String get shareDestination => 'Adicionar botão a';

  @override
  String get shareCamera =>
      'Permita o acesso à câmera para escanear códigos QR ou abra um arquivo compartilhado.';

  @override
  String get shareInvalid =>
      'Este compartilhamento é inválido, grande demais ou usa uma versão não compatível.';

  @override
  String get sharePrepareFailed =>
      'Não foi possível preparar o compartilhamento. Verifique imagens ou botões de macros ausentes e o tamanho da seleção.';

  @override
  String get shareFailed =>
      'Não foi possível concluir o compartilhamento ou salvamento. Os itens existentes não foram substituídos.';

  @override
  String get updatesTitle => 'Atualizações do aplicativo';

  @override
  String get updatesAutomatic => 'Verificar atualizações automaticamente';

  @override
  String get updatesPrivacyGithub =>
      'Desativado por padrão. Quando ativado, acessa o GitHub uma vez por dia enquanto você usa o aplicativo. Sem downloads automáticos.';

  @override
  String get updatesPrivacyPlay =>
      'Desativado por padrão. Quando ativado, acessa o Google Play uma vez por dia enquanto você usa o aplicativo. Sem downloads automáticos.';

  @override
  String get updatesUnknown => 'Desconhecida';

  @override
  String get updatesChooseSource => 'Escolher fonte de atualizações';

  @override
  String get updatesCheck => 'Verificar agora';

  @override
  String get updatesNever => 'Ainda não verificado';

  @override
  String updatesLastChecked(String date) {
    return 'Última verificação: $date';
  }

  @override
  String updatesAvailable(String version) {
    return 'Nova versão: $version';
  }

  @override
  String get updatesCurrent => 'Nenhuma versão mais recente encontrada.';

  @override
  String get updatesFailed =>
      'Falha na atualização. Verifique sua conexão e tente novamente. APKs incompatíveis são bloqueados; nenhum dado do aplicativo é excluído.';

  @override
  String get updatesFdroidNote =>
      'O GitHub pode anunciar uma versão antes que o F-Droid a compile. Atualize pelo F-Droid para manter uma assinatura compatível e seus dados.';

  @override
  String get updatesOpenFdroid => 'Abrir F-Droid';

  @override
  String get updatesOpenPlay => 'Abrir Google Play';

  @override
  String get updatesDownload => 'Baixar atualização';

  @override
  String get updatesInstall => 'Instalar atualização';

  @override
  String get updatesAllowInstall => 'Permitir instalação';

  @override
  String get updatesInstallHint =>
      'O Android pode pedir permissão para instalar a partir deste aplicativo. Volte aqui e toque em Instalar atualização. Seus controles remotos e macros são mantidos.';

  @override
  String get updatesReady => 'Atualização baixada e pronta para instalar.';

  @override
  String get updatesNoAsset =>
      'Nenhum APK verificado está disponível para este dispositivo. Consulte as notas da versão.';

  @override
  String get updatesReleaseNotes => 'Notas da versão';

  @override
  String updatesChannel(String source) {
    return 'Fonte de atualizações: $source';
  }

  @override
  String updatesDownloadConfirm(String size) {
    return 'Baixar $size MB do GitHub? A instalação exige sua confirmação.';
  }

  @override
  String get learningModeIncompleteSignal =>
      'O sinal parece incompleto. Aproxime o controle e tente novamente.';

  @override
  String get learningModeUseUsb => 'Usar adaptador USB';

  @override
  String get learningModeSwitchedUsb => 'Adaptador USB selecionado.';

  @override
  String learningModeSwitchUsbFailed(String error) {
    return 'Não foi possível selecionar o adaptador USB: $error';
  }

  @override
  String get learningModeAudioUnavailableTitle =>
      'Aprendizado por áudio indisponível';

  @override
  String get learningModeAudioUnavailableBody =>
      'Os acessórios IR de áudio podem enviar comandos, mas não aprender sinais neste app. Use um receptor compatível com o aprendizado.';

  @override
  String learningModeBuiltInReceiver(String brand) {
    return 'Receptor IR integrado $brand';
  }

  @override
  String get learningModeUsbReceiver => 'Receptor USB de aprendizado';

  @override
  String learningModeDefaultRemoteName(String buttonName) {
    return 'Controle $buttonName';
  }

  @override
  String get learningModeSupportedReceivers =>
      'Use um receptor compatível com o app:\n• Um adaptador IR USB compatível Tiqiaa, ZaZa ou ElkSmart\n• Um celular Huawei / Honor compatível com recepção IR\n• Um celular LG compatível com UEI Quickset\n\nNem todos os modelos permitem aprender sinais.';

  @override
  String learningModeCapturedWith(String device) {
    return 'Sinal capturado com $device';
  }

  @override
  String get learningModeLgReplayRestriction =>
      'Para reenviar este sinal, use o mesmo celular LG usado na captura.';

  @override
  String learningModeTimingCount(int count) {
    return 'Intervalos registrados: $count';
  }

  @override
  String get learningModeUnknownCarrier => 'Frequência portadora desconhecida';

  @override
  String learningModeByteCount(int count) {
    return 'Bytes: $count';
  }
}
