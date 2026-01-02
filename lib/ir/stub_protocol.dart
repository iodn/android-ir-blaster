import 'ir_protocol_types.dart';

class StubIrProtocolEncoder implements IrProtocolEncoder {
  @override
  final IrProtocolDefinition definition;

  const StubIrProtocolEncoder(this.definition);

  @override
  String get id => definition.id;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    throw IrProtocolNotImplementedException(definition.id);
  }
}
