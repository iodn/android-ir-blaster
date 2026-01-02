import '../ir_protocol_types.dart';

const IrProtocolDefinition jvcProtocolDefinition = IrProtocolDefinition(
  id: 'jvc',
  displayName: 'JVC',
  description:
      'JVC: 4-hex-digit code. Carrier 38kHz. '
      'Preamble 8400/4200, then 16 bits MSB-first encoded with mark=525 and space=525/1575. '
      'Appends trailing 525 + gap 21000. Whole a() sequence repeated twice after preamble.',
  implemented: true,
  defaultFrequencyHz: 38000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Code (4 hex digits)',
      type: IrFieldType.string,
      required: true,
      maxLength: 4,
      hint: 'e.g., 10EF',
      helperText: '4 hex digits (0-9, A-F).',
      maxLines: 1,
    ),
  ],
);

class JvcProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'jvc';
  const JvcProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => jvcProtocolDefinition;

  static const int defaultFrequencyHz = 38000;

  // Timings
  static const List<int> preamble = <int>[0x20D0, 0x1068]; // 8400,4200
  static const int mark = 0x20D; // 525
  static const int zeroSpace = 0x20D; // 525
  static const int oneSpace = 0x627; // 1575
  static const int finalGap = 0x5208; // 21000

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) throw ArgumentError('hex must be a string');
    final String hex = h.trim();

    _validateHexExact(hex, 4, protocolName: 'JVC');

    String byteBits(String twoHex) {
      final int v = int.parse(twoHex, radix: 16) & 0xFF;
      return v.toRadixString(2).padLeft(8, '0');
    }

    List<int> buildA() {
      final String hi = hex.substring(0, 2);
      final String lo = hex.substring(2, 4);
      final String bits = byteBits(hi) + byteBits(lo); // 16 bits MSB-first

      final List<int> out = <int>[];
      for (int i = 0; i < bits.length; i++) {
        out.add(mark);
        out.add(bits[i] == '0' ? zeroSpace : oneSpace);
      }
      // final mark and gap
      out.add(mark);
      out.add(finalGap);
      return out;
    }

    final List<int> seq1 = buildA();
    final List<int> seq2 = buildA();

    final List<int> total = <int>[];
    total.addAll(preamble);
    total.addAll(seq1);
    total.addAll(seq2);

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
