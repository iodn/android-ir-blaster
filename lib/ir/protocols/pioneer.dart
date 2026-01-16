import '../ir_protocol_types.dart';

const IrProtocolDefinition pioneerProtocolDefinition = IrProtocolDefinition(
  id: 'pioneer',
  displayName: 'Pioneer',
  description:
      'Pioneer SR.\n'
      'Payload = address(8) + ~address(8) + command(8) + ~command(8)\n'
      'Bit order: LSB-first per byte.\n'
      'Carrier: 40kHz. Timings: 8500/4225, bit mark 500, space 500/1500, gap 26000.',
  implemented: true,
  defaultFrequencyHz: 40000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'address',
      label: 'Address (1 byte)',
      type: IrFieldType.string,
      required: true,
      maxLength: 2,
      hint: 'e.g., 1A',
      helperText: 'Address byte.',
      maxLines: 1,
    ),
    IrFieldDef(
      id: 'command',
      label: 'Command (1 byte)',
      type: IrFieldType.string,
      required: true,
      maxLength: 2,
      hint: 'e.g., 2B',
      helperText: 'Command byte.',
      maxLines: 1,
    ),
  ],
);

class PioneerProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'pioneer';
  const PioneerProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => pioneerProtocolDefinition;

  static const int defaultFrequencyHz = 40000;

  // Timings
  static const int preMark = 8500;
  static const int preSpace = 4225;
  static const int bitMark = 500;
  static const int space0 = 500;
  static const int space1 = 1500;
  static const int gap = 26000;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    // New format: address + command
    final int address = _readHexByte(params['address'], name: 'Pioneer address');
    final int command = _readHexByte(params['command'], name: 'Pioneer command');

    final int invAddress = (~address) & 0xFF;
    final int invCommand = (~command) & 0xFF;

    final List<int> bytes = <int>[address, invAddress, command, invCommand];

    List<int> frame() {
      final List<int> out = <int>[];

      // Preamble
      out.add(preMark);
      out.add(preSpace);

      // 32 bits, LSB-first per byte
      for (final int b in bytes) {
        for (int i = 0; i < 8; i++) {
          final int bit = (b >> i) & 1;
          out.add(bitMark);
          out.add(bit == 0 ? space0 : space1);
        }
      }

      // Stop mark + silence
      out.add(bitMark);
      out.add(gap);

      return out;
    }

    final List<int> total = <int>[];
    total.addAll(frame());
    total.addAll(frame());

    return IrEncodeResult(
      frequencyHz: defaultFrequencyHz,
      pattern: total,
    );
  }
}

int _readHexByte(dynamic v, {required String name}) {
  if (v is! String) throw ArgumentError('$name must be a hex string');
  final String s = v.trim();
  if (s.isEmpty || s.length > 2) {
    throw ArgumentError('$name must be 1 byte hex (00..FF)');
  }
  final int x = int.parse(s, radix: 16) & 0xFF;
  return x;
}
