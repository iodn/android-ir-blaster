import '../ir_protocol_types.dart';

class LgeIrLearnedProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'lge_ir_learned';

  const LgeIrLearnedProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => lgeIrLearnedProtocolDefinition;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    throw const IrProtocolNotImplementedException(protocolId);
  }
}

const IrProtocolDefinition lgeIrLearnedProtocolDefinition = IrProtocolDefinition(
  id: LgeIrLearnedProtocolEncoder.protocolId,
  displayName: 'Learned (LG Internal IR)',
  description:
      'IR signal captured from the built-in UEI Quickset IR receiver on LG phones. '
      'Device-locked: can only be replayed on the same LG device.',
  defaultFrequencyHz: 38000,
  implemented: false,
);
