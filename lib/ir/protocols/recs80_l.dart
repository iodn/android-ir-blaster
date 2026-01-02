import '../ir_protocol_types.dart';

const IrProtocolDefinition recs80LProtocolDefinition = IrProtocolDefinition(
  id: 'recs80_l',
  displayName: 'RECS80_L',
  description:
      'RECS80_L: 33.3 kHz. Hex length=3. Maintains a static toggle '
      'that flips on each encode. Same bit string as RECS80. '
      'Bit1: 180/8460. Bit0: 180/5580. End: 180 + (138000 - sum(out)).',
  implemented: true,
  defaultFrequencyHz: 33300,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Hex (3 chars)',
      type: IrFieldType.string,
      required: true,
      helperText:
          'Exactly 3 hex characters (0–9, A–F). Toggle flips each send. Fixed total frame length.',
      maxLines: 1,
    ),
  ],
);

class Recs80LProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'recs80_l';
  const Recs80LProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => recs80LProtocolDefinition;

  // t.d(): 0x8214 = 33300 Hz
  static const int defaultFrequencyHz = 0x8214; // 33300

  // t.c / t.d timing tables
  static const int mark = 0x00B4; // 180
  static const int bit1Space = 0x210C; // 8460
  static const int bit0Space = 0x15CC; // 5580

  static const int endMark = 0x00B4; // 180
  static const int frameTotal = 0x21B10; // 138000

  static bool _toggle = false;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a String');
    }
    final String hex = h.trim();
    _validateHex3(hex);

    // t.b(): flip toggle then call a()
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

    final int used = _sum(out);
    final int remaining = frameTotal - used;

    out.add(remaining > 0 ? remaining : 0);

    return IrEncodeResult(frequencyHz: defaultFrequencyHz, pattern: out);
  }

  int _sum(List<int> xs) {
    int s = 0;
    for (final int v in xs) {
      s += v;
    }
    return s;
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
