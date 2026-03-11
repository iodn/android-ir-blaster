import '../ir_protocol_types.dart';

const IrProtocolDefinition sharpProtocolDefinition = IrProtocolDefinition(
  id: 'sharp',
  displayName: 'Sharp',
  description:
      'Sharp: 38 kHz. Input hex length=4 packed as address(5 bits) + command(8 bits). '
      'Address and command are sent LSB-first. The second 13-bit message repeats the '
      'same address and inverts the command bits. Tail blocks encode the documented '
      'expansion/check bits and frame gap.',
  implemented: true,
  defaultFrequencyHz: 38000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Hex (4 chars)',
      type: IrFieldType.string,
      required: true,
      helperText: 'Exactly 4 hex characters (0–9, A–F).',
      maxLines: 1,
    ),
  ],
);

class SharpProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'sharp';
  const SharpProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => sharpProtocolDefinition;

  // y.d(): 0x9470 = 38000 Hz
  static const int defaultFrequencyHz = 0x9470; // 38000

  // Base blocks (constructor-built in smali)
  static const List<int> b = <int>[0x118, 0x35C]; // [280, 860]
  static const List<int> c = <int>[0x118, 0x6B8]; // [280, 1720]
  static const List<int> tailPair = <int>[0x118, 0xAA28]; // [280, 43560]

  // d = c + b + tailPair
  static const List<int> d = <int>[
    ...c,
    ...b,
    ...tailPair,
  ];

  // e = b + c + tailPair
  static const List<int> e = <int>[
    ...b,
    ...c,
    ...tailPair,
  ];

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a String');
    }
    final String hex = h.trim();
    _validateHexN(hex, 4);

    final int packed = int.parse(hex, radix: 16) & 0x1FFF;
    final int address = (packed >> 8) & 0x1F;
    final int command = packed & 0xFF;

    final String first13 = _bitsLsbFirst(address, 5) + _bitsLsbFirst(command, 8);
    final String second13 = _bitsLsbFirst(address, 5) + _bitsLsbFirst((~command) & 0xFF, 8);

    final List<int> out = <int>[];

    _appendSharpBits(out, first13);
    out.addAll(d);
    _appendSharpBits(out, second13);
    out.addAll(e);

    return IrEncodeResult(frequencyHz: defaultFrequencyHz, pattern: out);
  }

  void _appendSharpBits(List<int> out, String bits) {
    for (int i = 0; i < bits.length; i++) {
      out.addAll(bits[i] == '0' ? b : c);
    }
  }

  String _bitsLsbFirst(int value, int width) {
    final StringBuffer out = StringBuffer();
    for (int i = 0; i < width; i++) {
      out.write(((value >> i) & 1) == 0 ? '0' : '1');
    }
    return out.toString();
  }

  void _validateHexN(String hex, int n) {
    if (hex.length != n) {
      throw FormatException('hexcode length != $n');
    }
    for (int i = 0; i < hex.length; i++) {
      final int c = hex.codeUnitAt(i);
      final bool ok =
          (c >= 0x30 && c <= 0x39) || // 0-9
          (c >= 0x41 && c <= 0x46) || // A-F
          (c >= 0x61 && c <= 0x66); // a-f
      if (!ok) {
        throw FormatException('hexcode is not hexadecimal');
      }
    }
  }
}
