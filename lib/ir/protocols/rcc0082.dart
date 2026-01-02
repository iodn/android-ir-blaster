import '../ir_protocol_types.dart';

const IrProtocolDefinition rcc0082ProtocolDefinition = IrProtocolDefinition(
  id: 'rcc0082',
  displayName: 'RCC0082',
  description:
      'RCC0082: 30,300 Hz. Uses BIT=528, GAP=2640, END=21120. '
      'Prefix 22 ints: [BIT, GAP, BIT x19, END], then [BIT, GAP, BIT, BIT]. '
      'Build 10-bit string: "0" + (n0 last3) + (n1 last4) + (n2 first2). '
      'For each bit index>0: if same as prev add BIT,BIT else add BIT to last element then add BIT. '
      'Then if out.size even: set last=0x1B330 else append 0x1B120. Then append suffix (same 22 ints).',
  implemented: true,
  defaultFrequencyHz: 30300,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Hex (3 chars)',
      type: IrFieldType.string,
      required: true,
      helperText: 'Exactly 3 hex characters (0–9, A–F).',
      maxLines: 1,
    ),
  ],
);

class Rcc0082ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'rcc0082';
  const Rcc0082ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => rcc0082ProtocolDefinition;

  // p.d(): 0x765c = 30300 Hz
  static const int defaultFrequencyHz = 0x765c; // 30300

  // p.b() constants
  static const int bit = 0x0210; // 528
  static const int gap = 0x0A50; // 2640
  static const int end = 0x5280; // 21120

  static const int tailEven = 0x1B330; // 111,408
  static const int tailOdd = 0x1B120; // 110,880

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a String');
    }
    final String hex = h.trim();
    _validateHex(hex);

    final List<int> out = <int>[];

    // Prefix 22 ints: [BIT, GAP, BIT x19, END]
    out.addAll(_prefixOrSuffix22());

    // 4-element block: [BIT, GAP, BIT, BIT]
    out.add(bit);
    out.add(gap);
    out.add(bit);
    out.add(bit);

    // Build bit string:
    // bits = "0" + n0(last3) + n1(last4) + n2(first2)
    final String n0 = _nibbleBits(hex[0]).substring(1); // last3 of 4
    final String n1 = _nibbleBits(hex[1]); // all4
    final String n2 = _nibbleBits(hex[2]).substring(0, 2); // first2
    final String bits = '0$n0$n1$n2'; // length 10

    // Encode transitions; only acts when i>0.
    for (int i = 0; i < bits.length; i++) {
      if (i == 0) continue;
      final String b = bits[i];
      final String prev = bits[i - 1];
      if (b == prev) {
        out.add(bit);
        out.add(bit);
      } else {
        // add BIT to the last element currently in output
        final int lastIndex = out.length - 1;
        out[lastIndex] = out[lastIndex] + bit;
        out.add(bit);
      }
    }

    // Tail adjustment based on parity of out.size
    if (out.length % 2 == 0) {
      out[out.length - 1] = tailEven;
    } else {
      out.add(tailOdd);
    }

    // Suffix 22 ints (same as prefix)
    out.addAll(_prefixOrSuffix22());

    return IrEncodeResult(frequencyHz: defaultFrequencyHz, pattern: out);
  }

  List<int> _prefixOrSuffix22() {
    // Exactly as described:
    // index 0: BIT
    // index 1: GAP
    // index 2..20: BIT
    // index 21: END
    final List<int> arr = List<int>.filled(22, bit, growable: false);
    arr[1] = gap;
    arr[21] = end;
    return arr;
  }

  String _nibbleBits(String hexChar) {
    final int v = int.parse(hexChar, radix: 16) & 0xF;
    return v.toRadixString(2).padLeft(4, '0');
  }

  void _validateHex(String hex) {
    if (hex.length != 3) {
      throw FormatException('Error: hexcode length != 3');
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
