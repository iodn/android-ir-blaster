import '../ir_protocol_types.dart';

const IrProtocolDefinition recs80ProtocolDefinition = IrProtocolDefinition(
  id: 'recs80',
  displayName: 'RECS80',
  description:
      'RECS80: 38 kHz. Hex length=3. Maintains a static toggle '
      'that flips on each encode. Bit string: '
      '"1" + toggleBit + (n0.take(3)) + (n0.takeLast(1)) + (n1 all4) + (n2.take(1)). '
      'Bit1: 158/7426. Bit0: 158/4898. End: 158/45000.',
  implemented: true,
  defaultFrequencyHz: 38000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Hex (3 chars)',
      type: IrFieldType.string,
      required: true,
      helperText: 'Exactly 3 hex characters (0–9, A–F). Toggle flips each send.',
      maxLines: 1,
    ),
  ],
);

class Recs80ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'recs80';
  const Recs80ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => recs80ProtocolDefinition;

  // s.d(): 0x9470 = 38000 Hz
  static const int defaultFrequencyHz = 0x9470; // 38000

  // s.c / s.d timing tables
  static const int mark = 0x009E; // 158
  static const int bit1Space = 0x1D02; // 7426
  static const int bit0Space = 0x1322; // 4898

  static const int endMark = 0x009E; // 158
  static const int endSpace = 0xAFC8; // 45000

  // corresponds to static field s.b 
  static bool _toggle = false;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a String');
    }
    final String hex = h.trim();
    _validateHex3(hex);

    // s.b(): flip toggle then call a()
    _toggle = !_toggle;

    final String n0 = _nibbleBits(hex[0]);
    final String n1 = _nibbleBits(hex[1]);
    final String n2 = _nibbleBits(hex[2]);

    final String partA = n0.substring(0, 3); // take(3)
    final String partB = n0.substring(3, 4); // takeLast(1)
    final String partC = n1; // all 4
    final String partD = n2.substring(0, 1); // take(1)

    final String bits = '1' +
        (_toggle ? '1' : '0') +
        partA +
        partB +
        partC +
        partD;

    final List<int> out = <int>[];
    for (int i = 0; i < bits.length; i++) {
      out.add(mark);
      out.add(bits[i] == '1' ? bit1Space : bit0Space);
    }
    out.add(endMark);
    out.add(endSpace);

    return IrEncodeResult(frequencyHz: defaultFrequencyHz, pattern: out);
  }

  String _nibbleBits(String hexChar) {
    final int v = int.parse(hexChar, radix: 16) & 0xF;
    return v.toRadixString(2).padLeft(4, '0');
  }

  void _validateHex3(String hex) {
    if (hex.length != 3) {
      throw FormatException('hexcode length != 3');
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
