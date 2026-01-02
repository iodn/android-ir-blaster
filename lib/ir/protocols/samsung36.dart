import '../ir_protocol_types.dart';

const IrProtocolDefinition samsung36ProtocolDefinition = IrProtocolDefinition(
  id: 'samsung36',
  displayName: 'Samsung36',
  description:
      'Samsung36: 38 kHz. Input hex length=7. Bits = '
      'A(8) + B(8) + C(4) + D(8) + ~D(8). Encode: '
      'start 4500/4500, first 16 bits as 500/(500|1500), then 500 + 4500, '
      'then last 20 bits same, then 500 + 59000.',
  implemented: true,
  defaultFrequencyHz: 38000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Hex (7 chars)',
      type: IrFieldType.string,
      required: true,
      helperText: 'Exactly 7 hex characters (0–9, A–F).',
      maxLines: 1,
    ),
  ],
);

class Samsung36ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'samsung36';
  const Samsung36ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => samsung36ProtocolDefinition;

  // x.d(): 0x9470 = 38000 Hz
  static const int defaultFrequencyHz = 0x9470; // 38000

  // x.b() constants
  static const int hdr = 0x1194; // 4500
  static const int mark = 0x01F4; // 500
  static const int space0 = 0x01F4; // 500
  static const int space1 = 0x05DC; // 1500
  static const int finalSpace = 0xE678; // 59000

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a String');
    }
    final String hex = h.trim();
    _validateHexN(hex, 7);

    // Extract fields: A(2 hex), B(2 hex), C(1 hex), D(2 hex)
    final String aHex = hex.substring(0, 2);
    final String bHex = hex.substring(2, 4);
    final String cHex = hex.substring(4, 5);
    final String dHex = hex.substring(5, 7);

    final String aBits = _hexToBits(aHex, 8);
    final String bBits = _hexToBits(bHex, 8);
    final String cBits = _hexToBits(cHex, 4);
    final String dBits = _hexToBits(dHex, 8);

    // Invert D bits character-wise
    final String invD = _invertBits(dBits);

    final String bits = aBits + bBits + cBits + dBits + invD; // 36 bits

    final List<int> out = <int>[];

    // Start [4500, 4500]
    out.add(hdr);
    out.add(hdr);

    // First 16 bits
    final String first16 = bits.substring(0, 16);
    _appendBits(out, first16);

    // Add [500, 4500]
    out.add(mark);
    out.add(hdr);

    // Last 20 bits
    final String last20 = bits.substring(bits.length - 20);
    _appendBits(out, last20);

    // Add [500, 59000]
    out.add(mark);
    out.add(finalSpace);

    return IrEncodeResult(frequencyHz: defaultFrequencyHz, pattern: out);
  }

  void _appendBits(List<int> out, String bits) {
    for (int i = 0; i < bits.length; i++) {
      out.add(mark);
      out.add(bits[i] == '0' ? space0 : space1);
    }
  }

  String _hexToBits(String hexStr, int width) {
    final int v = int.parse(hexStr, radix: 16);
    return v.toRadixString(2).padLeft(width, '0');
  }

  String _invertBits(String bits) {
    final StringBuffer sb = StringBuffer();
    for (int i = 0; i < bits.length; i++) {
      sb.write(bits[i] == '0' ? '1' : '0');
    }
    return sb.toString();
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
