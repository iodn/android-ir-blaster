import '../ir_protocol_types.dart';

class TiqiaaLearnedProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'tiqiaa_learned';

  const TiqiaaLearnedProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => tiqiaaLearnedProtocolDefinition;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    throw const IrProtocolNotImplementedException(protocolId);
  }
}

const IrProtocolDefinition tiqiaaLearnedProtocolDefinition =
    IrProtocolDefinition(
      id: TiqiaaLearnedProtocolEncoder.protocolId,
      displayName: 'Learned (Tiqiaa USB)',
      description:
          'Exact learned signal captured from a Tiqiaa/ZaZa USB dongle.',
      defaultFrequencyHz: 38000,
      implemented: false,
    );
