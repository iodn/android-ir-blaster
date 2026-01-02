import '../ir_protocol_types.dart';

const IrProtocolDefinition rec80ProtocolDefinition = IrProtocolDefinition(
  id: 'rec80',
  displayName: 'REC80',
  description:
      'REC80: 37 kHz. Hex length=12. Bits = '
      '(first 8 hex -> 32 bits) + (last 4 hex -> 16 bits) = 48 bits. '
      'Header 3456/1728. Bit1: 432/1296. Bit0: 432/432. Tail: 432/74736.',
  implemented: true,
  defaultFrequencyHz: 37000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Hex (12 chars)',
      type: IrFieldType.string,
      required: true,
      helperText: 'Exactly 12 hex characters (0–9, A–F).',
      maxLines: 1,
    ),
  ],
);

class Rec80ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'rec80';
  const Rec80ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => rec80ProtocolDefinition;

  // r.d(): 0x9088 = 37000 Hz
  static const int defaultFrequencyHz = 0x9088; // 37000

  // r.b() timing tables
  static const int headerMark = 0x0D80; // 3456
  static const int headerSpace = 0x06C0; // 1728

  static const int bitMark = 0x01B0; // 432
  static const int bit1Space = 0x0510; // 1296
  static const int bit0Space = 0x01B0; // 432

  static const int tailMark = 0x01B0; // 432
  static const int tailSpace = 0x123F0; // 74736

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a String');
    }
    final String hex = h.trim();
    _validateHex12(hex);

    final String first8 = hex.substring(0, 8);
    final String last4 = hex.substring(hex.length - 4);

    final int v32 = int.parse(first8, radix: 16);
    final int v16 = int.parse(last4, radix: 16);

    final String bits32 = v32.toRadixString(2).padLeft(32, '0');
    final String bits16 = v16.toRadixString(2).padLeft(16, '0');
    final String bits = bits32 + bits16; // 48 bits

    final List<int> out = <int>[];
    out.add(headerMark);
    out.add(headerSpace);

    for (int i = 0; i < bits.length; i++) {
      out.add(bitMark);
      out.add(bits[i] == '1' ? bit1Space : bit0Space);
    }

    out.add(tailMark);
    out.add(tailSpace);

    return IrEncodeResult(frequencyHz: defaultFrequencyHz, pattern: out);
  }

  void _validateHex12(String hex) {
    if (hex.length != 12) {
      throw FormatException('hexcode length != 12');
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
