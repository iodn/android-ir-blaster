import '../ir_protocol_types.dart';

class HuaweiIrLearnedProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'huawei_ir_learned';

  const HuaweiIrLearnedProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => huaweiIrLearnedProtocolDefinition;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    throw const IrProtocolNotImplementedException(protocolId);
  }
}

const IrProtocolDefinition huaweiIrLearnedProtocolDefinition = IrProtocolDefinition(
  id: HuaweiIrLearnedProtocolEncoder.protocolId,
  displayName: 'Learned (Huawei Internal IR)',
  description:
      'IR signal captured from the built-in IR receiver on Huawei and Honor devices.',
  defaultFrequencyHz: 38000,
  implemented: false,
);
