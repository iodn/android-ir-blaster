import '../ir_protocol_types.dart';

class ElkSmartLearnedProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'elksmart_learned';

  const ElkSmartLearnedProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => elksmartLearnedProtocolDefinition;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    throw const IrProtocolNotImplementedException(protocolId);
  }
}

const IrProtocolDefinition elksmartLearnedProtocolDefinition =
    IrProtocolDefinition(
      id: ElkSmartLearnedProtocolEncoder.protocolId,
      displayName: 'Learned (ElkSmart USB)',
      description: 'Learned signal captured from an ElkSmart USB dongle.',
      defaultFrequencyHz: 38000,
      implemented: false,
    );
