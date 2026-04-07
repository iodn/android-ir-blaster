import '../ir_protocol_types.dart';

class AudioLearnedProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'audio_learned';

  const AudioLearnedProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => audioLearnedProtocolDefinition;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    throw const IrProtocolNotImplementedException(protocolId);
  }
}

const IrProtocolDefinition audioLearnedProtocolDefinition = IrProtocolDefinition(
  id: AudioLearnedProtocolEncoder.protocolId,
  displayName: 'Learned (Audio IR)',
  description: 'Exact learned signal captured from an audio IR accessory.',
  defaultFrequencyHz: 44100,
  implemented: false,
);
