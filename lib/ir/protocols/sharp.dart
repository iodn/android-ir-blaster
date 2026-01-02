import '../ir_protocol_types.dart';

const IrProtocolDefinition sharpProtocolDefinition = IrProtocolDefinition(
  id: 'sharp',
  displayName: 'Sharp',
  description:
      'Sharp: 38 kHz. Input hex length=4. '
      'Build 13-bit string = nib0(4)+nib1(4)+nib2(4)+nib3.take(1). '
      'Then duplicates it to 26 bits (bits13 + bits13). '
      'Encode first 13 bits with (0=>280/860, 1=>280/1720), append block d, '
      'encode second 13 bits, append block e. Blocks: '
      'b=[280,860], c=[280,1720], d=c+b+[280,0xAA28], e=b+c+[280,0xAA28].',
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

    // Convert 4 nibbles to bits; last nibble only takes the first bit.
    final String n0 = _nibbleBits(hex[0]);
    final String n1 = _nibbleBits(hex[1]);
    final String n2 = _nibbleBits(hex[2]);
    final String n3 = _nibbleBits(hex[3]).substring(0, 1); // take(1)

    final String bits13 = n0 + n1 + n2 + n3; // length 13
    final String bits26 = bits13 + bits13; // smali effectively doubles it

    final String first13 = bits26.substring(0, 13);
    final String second13 = bits26.substring(13, 26);

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

  String _nibbleBits(String hexChar) {
    final int v = int.parse(hexChar, radix: 16) & 0xF;
    return v.toRadixString(2).padLeft(4, '0');
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
