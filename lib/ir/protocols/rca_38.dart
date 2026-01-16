import '../ir_protocol_types.dart';

const IrProtocolDefinition rca38ProtocolDefinition = IrProtocolDefinition(
  id: 'rca_38',
  displayName: 'RCA',
  description:
      'Payload = addr(4) + cmd(8) + ~addr(4) + ~cmd(8) = 24 bits.\n'
      'Bit order: LSB-first.\n'
      'Timings: 4000/4000, mark 500, space0 1000, space1 2000, gap 8000.',
  implemented: true,
  defaultFrequencyHz: 38000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'address',
      label: 'Address (4-bit)',
      type: IrFieldType.string,
      required: true,
      maxLength: 1,
      hint: 'e.g., A',
      helperText: 'RCA address nibble (0..F).',
      maxLines: 1,
    ),
    IrFieldDef(
      id: 'command',
      label: 'Command (1 byte)',
      type: IrFieldType.string,
      required: true,
      maxLength: 2,
      hint: 'e.g., 2B',
      helperText: 'RCA command byte (00..FF).',
      maxLines: 1,
    ),
  ],
);

class Rca38ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'rca_38';
  const Rca38ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => rca38ProtocolDefinition;

  static const int preMark = 4000;
  static const int preSpace = 4000;
  static const int mark = 500;
  static const int space0 = 1000;
  static const int space1 = 2000;
  static const int gap = 8000;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final int addr4 = _readHexNibble(params['address'], name: 'RCA address') & 0x0F;
    final int cmd = _readHexByte(params['command'], name: 'RCA command') & 0xFF;

    final int invAddr4 = (~addr4) & 0x0F;
    final int invCmd = (~cmd) & 0xFF;

    // data = addr(4) | cmd(8)<<4 | invAddr(4)<<12 | invCmd(8)<<16
    final int data = (addr4 & 0x0F) |
        ((cmd & 0xFF) << 4) |
        ((invAddr4 & 0x0F) << 12) |
        ((invCmd & 0xFF) << 16);

    final List<int> out = <int>[];

    out.add(preMark);
    out.add(preSpace);

    // 24 bits LSB-first
    for (int i = 0; i < 24; i++) {
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

int _readHexNibble(dynamic v, {required String name}) {
  if (v is! String) throw ArgumentError('$name must be a hex string');
  final String s = v.trim();
  if (s.isEmpty || s.length > 1) {
    throw ArgumentError('$name must be 1 hex digit (0..F)');
  }
  return int.parse(s, radix: 16) & 0x0F;
}
