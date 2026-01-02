import '../ir_protocol_types.dart';

const IrProtocolDefinition denonProtocolDefinition = IrProtocolDefinition(
  id: 'denon',
  displayName: 'Denon',
  description:
      'Denon: 4-hex-digit code. Carrier 38kHz. '
      'Builds 13-bit field from 4 nibbles (last bit of 4th nibble only), '
      'expands to 26 bits and encodes as: first13 + preamble + second13 + postamble.',
  implemented: true,
  defaultFrequencyHz: 38000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Code (4 hex digits)',
      type: IrFieldType.string,
      required: true,
      maxLength: 4,
      hint: 'e.g., 1A2B',
      helperText: '4 hex digits (0-9, A-F).',
      maxLines: 1,
    ),
  ],
);

class DenonProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'denon';
  const DenonProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => denonProtocolDefinition;

  static const int defaultFrequencyHz = 38000;

  // Timings (microseconds).
  static const int mark = 0x118; // 280
  static const int zeroSpace = 0x35C; // 860
  static const int oneSpace = 0x6B8; // 1720
  static const int tailGap = 0xAA28; // 43560

  static const List<int> zero = <int>[mark, zeroSpace];
  static const List<int> one = <int>[mark, oneSpace];

  // preamble d = b+b + [mark, tailGap]
  static const List<int> pre = <int>[
    mark, zeroSpace,
    mark, zeroSpace,
    mark, tailGap,
  ];

  // postamble e = c+c + [mark, tailGap]
  static const List<int> post = <int>[
    mark, oneSpace,
    mark, oneSpace,
    mark, tailGap,
  ];

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) throw ArgumentError('hex must be a string');
    final String hex = h.trim();

    _validateHexExact(hex, 4, protocolName: 'Denon');

    String n4bit(String s1) {
      final int v = int.parse(s1, radix: 16) & 0xF;
      return v.toRadixString(2).padLeft(4, '0');
    }

    final String nib0 = n4bit(hex.substring(0, 1));
    final String nib1 = n4bit(hex.substring(1, 2));
    final String nib2 = n4bit(hex.substring(2, 3));
    final String nib3 = n4bit(hex.substring(3, 4));

    // 13-bit field: nib0 + nib1 + nib2 + lastBit(nib3)
    final String bits13 = nib0 + nib1 + nib2 + nib3.substring(3, 4);

    final String first5 = bits13.substring(0, 5);
    final String next8 = bits13.substring(5, 13);

    // bits26 = first5 + next8 + first5 + next8.uppercase()
    // Uppercasing has no effect on '0'/'1', but we preserve the structure.
    final String bits26 = first5 + next8 + first5 + next8.toUpperCase();

    List<int> encodeBits(String bits) {
      final List<int> out = <int>[];
      for (int i = 0; i < bits.length; i++) {
        final String ch = bits[i];
        out.add(mark);
        out.add(ch == '0' ? zeroSpace : oneSpace);
      }
      return out;
    }

    final List<int> first13Enc = encodeBits(bits26.substring(0, 13));
    final List<int> second13Enc = encodeBits(bits26.substring(13, 26));

    final List<int> total = <int>[];
    total.addAll(first13Enc);
    total.addAll(pre);
    total.addAll(second13Enc);
    total.addAll(post);

    return IrEncodeResult(
      frequencyHz: defaultFrequencyHz,
      pattern: total,
    );
  }
}

bool _isHexChar(int codeUnit) {
  return (codeUnit >= 48 && codeUnit <= 57) ||
      (codeUnit >= 65 && codeUnit <= 70) ||
      (codeUnit >= 97 && codeUnit <= 102);
}

void _validateHexExact(String hex, int len, {required String protocolName}) {
  if (hex.length != len) {
    throw ArgumentError('$protocolName hexcode length != $len');
  }
  for (int i = 0; i < hex.length; i++) {
    if (!_isHexChar(hex.codeUnitAt(i))) {
      throw ArgumentError('$protocolName hexcode is not hexadecimal');
    }
  }
}
