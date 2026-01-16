import '../ir_protocol_types.dart';

const IrProtocolDefinition sony20ProtocolDefinition = IrProtocolDefinition(
  id: 'sony20',
  displayName: 'SONY20',
  description:
      'Sony SIRC 20-bit.\n'
      'Packed as cmd(7 LSB) + addr(13) << 7. Bit order: LSB-first.\n'
      'Timings: 2400/600 header, 0=600/600, 1=1200/600.\n'
      'Frame padded to 45000us.',
  implemented: true,
  defaultFrequencyHz: 40000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'address',
      label: 'Address (13-bit)',
      type: IrFieldType.string,
      required: true,
      maxLength: 4,
      hint: 'e.g., 1ABC',
      helperText: 'Address, only low 13 bits used.',
      maxLines: 1,
    ),
    IrFieldDef(
      id: 'command',
      label: 'Command (7-bit)',
      type: IrFieldType.string,
      required: true,
      maxLength: 2,
      hint: 'e.g., 15',
      helperText: 'Command, only low 7 bits used.',
      maxLines: 1,
    ),
  ],
);

class Sony20ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'sony20';
  const Sony20ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => sony20ProtocolDefinition;

  static const int carrierHz = 40000;

  static const int hdrMark = 2400;
  static const int hdrSpace = 600;
  static const int oneMark = 1200;
  static const int zeroMark = 600;
  static const int space = 600;

  static const int frameTotalUs = 45000;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final int addr = _readHexInt(params['address'], name: 'SONY20 address') & 0x1FFF;
    final int cmd = _readHexInt(params['command'], name: 'SONY20 command') & 0x7F;

    final int data = (cmd & 0x7F) | ((addr & 0x1FFF) << 7);
    const int bits = 20;

    List<int> oneFrame() {
      final List<int> seq = <int>[];
      seq.add(hdrMark);
      seq.add(hdrSpace);

      for (int i = 0; i < bits; i++) {
        final int bit = (data >> i) & 1;
        seq.add(bit == 1 ? oneMark : zeroMark);
        seq.add(space);
      }

      if (seq.isNotEmpty) seq.removeLast();
      final int used = _sum(seq);
      int remaining = frameTotalUs - used;
      if (remaining < 0) remaining = 0;
      seq.add(remaining);

      return seq;
    }

    final List<int> f = oneFrame();
    final List<int> out = <int>[];
    out.addAll(f);
    out.addAll(f);
    out.addAll(f);

    return IrEncodeResult(frequencyHz: carrierHz, pattern: out);
  }
}

int _readHexInt(dynamic v, {required String name}) {
  if (v is! String) throw ArgumentError('$name must be a hex string');
  final String s = v.trim();
  if (s.isEmpty || s.length > 8) throw ArgumentError('$name invalid hex');
  return int.parse(s, radix: 16);
}

int _sum(List<int> xs) {
  int s = 0;
  for (final int v in xs) {
    s += v;
  }
  return s;
}
