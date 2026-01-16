import '../ir_protocol_types.dart';

const IrProtocolDefinition samsung32ProtocolDefinition = IrProtocolDefinition(
  id: 'samsung32',
  displayName: 'Samsung32',
  description:
      'Samsung32.\n'
      'Payload = addr(8) + addr(8) + cmd(8) + ~cmd(8).\n'
      'Bit order: LSB-first.\n'
      'Timings: 4500/4500, mark 550, space0 550, space1 1650, gap 46000.',
  implemented: true,
  defaultFrequencyHz: 38000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'address',
      label: 'Address (1 byte)',
      type: IrFieldType.string,
      required: true,
      maxLength: 2,
      hint: 'e.g., E0',
      helperText: 'address byte (00..FF).',
      maxLines: 1,
    ),
    IrFieldDef(
      id: 'command',
      label: 'Command (1 byte)',
      type: IrFieldType.string,
      required: true,
      maxLength: 2,
      hint: 'e.g., 1A',
      helperText: 'Samsung32 command byte (00..FF).',
      maxLines: 1,
    ),
  ],
);

class Samsung32ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'samsung32';
  const Samsung32ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => samsung32ProtocolDefinition;

  static const int hdr = 4500;
  static const int mark = 550;
  static const int space0 = 550;
  static const int space1 = 1650;
  static const int gap = 46000;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final int address = _readHexByte(params['address'], name: 'Samsung32 address');
    final int command = _readHexByte(params['command'], name: 'Samsung32 command');
    final int invCommand = (~command) & 0xFF;

    // Flipper packing:
    // data = addr | (addr<<8) | (cmd<<16) | (~cmd<<24)
    final int data = (address & 0xFF) |
        ((address & 0xFF) << 8) |
        ((command & 0xFF) << 16) |
        ((invCommand & 0xFF) << 24);

    final List<int> out = <int>[];

    out.add(hdr);
    out.add(hdr);

    // 32 bits LSB-first
    for (int i = 0; i < 32; i++) {
      final int bit = (data >> i) & 1;
      out.add(mark);
      out.add(bit == 0 ? space0 : space1);
    }

    // stop mark + gap
    out.add(mark);
    out.add(gap);

    return IrEncodeResult(
      frequencyHz: 38000,
      pattern: out,
    );
  }
}

int _readHexByte(dynamic v, {required String name}) {
  if (v is! String) throw ArgumentError('$name must be a hex string');
  final String s = v.trim();
  if (s.isEmpty || s.length > 2) {
    throw ArgumentError('$name must be 1 byte hex (00..FF)');
  }
  return int.parse(s, radix: 16) & 0xFF;
}
