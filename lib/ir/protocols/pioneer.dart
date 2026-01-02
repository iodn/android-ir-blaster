import '../ir_protocol_types.dart';

const IrProtocolDefinition pioneerProtocolDefinition = IrProtocolDefinition(
  id: 'pioneer',
  displayName: 'Pioneer',
  description:
      'Pioneer: 8-hex-digit code -> 32 bits (4 bytes MSB-first). Carrier 40kHz. '
      'Preamble 8350/4200, bit mark 538, bit space 538/1614, trailer 538 + gap 26236. '
      'Whole frame duplicated back-to-back.',
  implemented: true,
  defaultFrequencyHz: 40000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Code (8 hex digits)',
      type: IrFieldType.string,
      required: true,
      maxLength: 8,
      hint: 'e.g., 12AB34CD',
      helperText: '8 hex digits (0-9, A-F).',
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

  // Timings per Kotlin notes
  static const List<int> preamble = <int>[0x209E, 0x1068]; // 8350,4200
  static const int mark = 0x21A; // 538
  static const int space0 = 0x21A; // 538
  static const int space1 = 0x64E; // 1614
  static const int endGap = 0x66BC; // 26236

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) throw ArgumentError('hex must be a string');
    final String hex = h.trim();

    _validateHexExact(hex, 8, protocolName: 'Pioneer');

    String byteBits(String twoHex) {
      final int v = int.parse(twoHex, radix: 16) & 0xFF;
      return v.toRadixString(2).padLeft(8, '0');
    }

    final String b0 = byteBits(hex.substring(0, 2));
    final String b1 = byteBits(hex.substring(2, 4));
    final String b2 = byteBits(hex.substring(4, 6));
    final String b3 = byteBits(hex.substring(6, 8));
    final String bits32 = b0 + b1 + b2 + b3;

    List<int> encodeOneFrame(String bits) {
      final List<int> out = <int>[];
      out.addAll(preamble);
      for (int i = 0; i < bits.length; i++) {
        out.add(mark);
        out.add(bits[i] == '0' ? space0 : space1);
      }
      out.add(mark);
      out.add(endGap);
      return out;
    }

    final List<int> frame = encodeOneFrame(bits32);

    // Duplicate frame back-to-back
    final List<int> total = <int>[];
    total.addAll(frame);
    total.addAll(frame);

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
