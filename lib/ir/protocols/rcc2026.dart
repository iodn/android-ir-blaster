import '../ir_protocol_types.dart';

const IrProtocolDefinition rcc2026ProtocolDefinition = IrProtocolDefinition(
  id: 'rcc2026',
  displayName: 'RCC2026',
  description:
      'RCC2026: 38,222 Hz. Header 8800/4400. '
      '42 data bits from hex length=11: toBinaryString padded to 44, takeLast(42). '
      'Each bit: 550 mark + (550 space for 0, 1650 space for 1). '
      'Then 550 + 23100, then append tail [8800, 4400, 550, 90750].',
  implemented: true,
  defaultFrequencyHz: 38222,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Hex (11 chars)',
      type: IrFieldType.string,
      required: true,
      helperText: 'Exactly 11 hex characters (0–9, A–F).',
      maxLines: 1,
    ),
  ],
);

class Rcc2026ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'rcc2026';
  const Rcc2026ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => rcc2026ProtocolDefinition;

  // q.d(): 0x954e = 38222 Hz
  static const int defaultFrequencyHz = 0x954e; // 38222

  // q.a() tail: [0x2260, 0x1130, 0x226, 0x1627e]
  static const int tailHeaderMark = 0x2260; // 8800
  static const int tailHeaderSpace = 0x1130; // 4400
  static const int tailMark = 0x0226; // 550
  static const int tailGap = 0x1627e; // 90750

  // q.b() main timings
  static const int headerMark = 0x2260; // 8800
  static const int headerSpace = 0x1130; // 4400
  static const int bitMark = 0x0226; // 550
  static const int zeroSpace = 0x0226; // 550
  static const int oneSpace = 0x0672; // 1650
  static const int finalMark = 0x0226; // 550
  static const int midGap = 0x5a3c; // 23100

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a String');
    }
    final String hex = h.trim();
    _validateHex(hex);

    // q.b():
    // value = hex.toLong(16)
    // bin = value.toString(2).padStart(44,'0').takeLast(42)
    final int value = int.parse(hex, radix: 16);
    final String bin = value.toRadixString(2).padLeft(44, '0');
    final String bits = bin.substring(bin.length - 42);

    final List<int> out = <int>[];
    out.add(headerMark);
    out.add(headerSpace);

    for (int i = 0; i < bits.length; i++) {
      final String ch = bits[i];
      out.add(bitMark);
      out.add(ch == '0' ? zeroSpace : oneSpace);
    }

    out.add(finalMark);
    out.add(midGap);

    // append tail array
    out.add(tailHeaderMark);
    out.add(tailHeaderSpace);
    out.add(tailMark);
    out.add(tailGap);

    return IrEncodeResult(frequencyHz: defaultFrequencyHz, pattern: out);
    }

  void _validateHex(String hex) {
    if (hex.length != 11) {
      throw FormatException('hexcode length != 11');
    }
    for (int i = 0; i < hex.length; i++) {
      final int c = hex.codeUnitAt(i);
      final bool ok =
          (c >= 0x30 && c <= 0x39) || // 0-9
          (c >= 0x41 && c <= 0x46) || // A-F
          (c >= 0x61 && c <= 0x66);   // a-f
      if (!ok) {
        throw FormatException('hexcode is not hexadecimal');
      }
    }
  }
}
