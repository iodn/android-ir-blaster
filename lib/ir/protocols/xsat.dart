import '../ir_protocol_types.dart';

const IrProtocolDefinition xsatProtocolDefinition = IrProtocolDefinition(
  id: 'xsat',
  displayName: 'XSAT (Mitsubishi)',
  description:
      'XSAT / Mitsubishi: 38 kHz. Header 8000/4000. '
      'Address(8) then command(8), both LSB-first. '
      'Each bit uses mark=526 and space=474 (0) or 1474 (1). '
      'A 4000us separator gap is inserted between address and command. '
      'Single-frame encoder padded to an overall ~60ms repeat cadence.',
  implemented: true,
  defaultFrequencyHz: 38000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'address',
      label: 'Address (1 byte)',
      type: IrFieldType.string,
      required: true,
      maxLength: 2,
      hint: 'e.g., 59',
      helperText: 'Address byte (00..FF).',
      maxLines: 1,
    ),
    IrFieldDef(
      id: 'command',
      label: 'Command (1 byte)',
      type: IrFieldType.string,
      required: true,
      maxLength: 2,
      hint: 'e.g., 35',
      helperText: 'Command byte (00..FF).',
      maxLines: 1,
    ),
  ],
);

class XsatProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'xsat';
  const XsatProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => xsatProtocolDefinition;

  static const int defaultFrequencyHz = 38000;
  static const int headerMark = 8000;
  static const int headerSpace = 4000;
  static const int bitMark = 526;
  static const int zeroSpace = 474; // 1000us cell total
  static const int oneSpace = 1474; // 2000us cell total
  static const int fieldSeparatorGap = 4000;
  static const int framePeriodUs = 60000;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final int address = _readHexByte(params['address'], name: 'XSAT address');
    final int command = _readHexByte(params['command'], name: 'XSAT command');

    final List<int> out = <int>[headerMark, headerSpace];
    _appendByteLsbFirst(out, address);

    if (out.isEmpty) {
      throw StateError('XSAT encoder generated an empty pattern');
    }
    out[out.length - 1] = out.last + fieldSeparatorGap;

    _appendByteLsbFirst(out, command);
    final int used = out.fold<int>(0, (sum, v) => sum + v);
    final int trailingGap = used >= framePeriodUs ? 0 : (framePeriodUs - used);
    out[out.length - 1] = out.last + trailingGap;

    return IrEncodeResult(
      frequencyHz: defaultFrequencyHz,
      pattern: out,
    );
  }

  void _appendByteLsbFirst(List<int> out, int value) {
    for (int i = 0; i < 8; i++) {
      final int bit = (value >> i) & 1;
      out.add(bitMark);
      out.add(bit == 0 ? zeroSpace : oneSpace);
    }
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
