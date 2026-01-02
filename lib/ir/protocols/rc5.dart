import '../ir_protocol_types.dart';

const IrProtocolDefinition rc5ProtocolDefinition = IrProtocolDefinition(
  id: 'rc5',
  displayName: 'RC5',
  description:
      'RC5: Manchester coding, unit=889us, carrier=36kHz. '
      'Input: up to 3 hex digits. Builds leader bits, toggle bit, and 11-bit payload (MSB-first). '
      'Frame padded/replaced to 114000us.',
  implemented: true,
  defaultFrequencyHz: 36000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Code (1–3 hex digits)',
      type: IrFieldType.string,
      required: true,
      maxLength: 3,
      hint: 'e.g., 1A3',
      helperText: 'Up to 3 hex digits (0-9, A-F).',
      maxLines: 1,
    ),
  ],
);

class Rc5ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'rc5';
  const Rc5ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => rc5ProtocolDefinition;

  static const int defaultFrequencyHz = 36000;

  // Timings
  static const int unit = 0x379; // 889us
  static const int frameTargetUs = 0x1BD50; // 114000us

  // flipped on each encode.
  static bool _toggleFlag = false;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a string');
    }
    final String hex = h.trim();

    _validateHexMaxLen(hex, 3, protocolName: 'RC5');

    // Flip toggle per “press” (mirrors using the toggling method in smali).
    _toggleFlag = !_toggleFlag;

    final String headHex = hex.isEmpty
        ? '0'
        : (hex.length >= 2 ? hex.substring(hex.length - 2) : hex);
    final int headVal = int.parse(headHex, radix: 16);

    final String leader = (headVal > 0x7F) ? '11' : '10';
    final String toggleBit = _toggleFlag ? '1' : '0';

    final int value = hex.isEmpty ? 0 : int.parse(hex, radix: 16);
    final String bin = value.toRadixString(2);
    final String padded = bin.padLeft(11, '0');
    final String payload11 = padded.substring(0, 11); // take(11) MSB-first

    final String bits = leader + toggleBit + payload11; // 14 bits total

    final List<int> seq = <int>[];
    // initial half-period
    seq.add(unit);

    String? prev;
    for (int i = 0; i < bits.length; i++) {
      final String b = bits[i];
      if (prev != null) {
        if (b != prev) {
          // transition: add two half periods
          seq.add(unit);
          seq.add(unit);
        } else {
          // same bit: double the last segment length then add half
          final int lastIdx = seq.length - 1;
          seq[lastIdx] = seq[lastIdx] * 2;
          seq.add(unit);
        }
      } else {
        // first bit behaves like transition from undefined
        seq.add(unit);
      }
      prev = b;
    }

    // Frame completion to 114000us:
    // if seq.size is even -> append gap; else replace last element to reach total.
    if (seq.length.isEven) {
      final int used = _sum(seq);
      final int gap = frameTargetUs - used;
      seq.add(gap > 0 ? gap : 0);
    } else {
      final int usedWithoutLast = _sum(seq.sublist(0, seq.length - 1));
      final int replacement = frameTargetUs - usedWithoutLast;
      seq[seq.length - 1] = replacement > 0 ? replacement : 0;
    }

    return IrEncodeResult(
      frequencyHz: defaultFrequencyHz,
      pattern: seq,
    );
  }
}

void _validateHexMaxLen(String hex, int maxLen, {required String protocolName}) {
  if (hex.length > maxLen) {
    // matches Kotlin message for RC5 specifically
    if (protocolName == 'RC5') {
      throw ArgumentError('Error: RC5 hexcode length > $maxLen');
    }
    throw ArgumentError('$protocolName hexcode length > $maxLen');
  }
  for (int i = 0; i < hex.length; i++) {
    if (!_isHexChar(hex.codeUnitAt(i))) {
      throw ArgumentError('$protocolName hexcode is not hexadecimal');
    }
  }
}

bool _isHexChar(int codeUnit) {
  return (codeUnit >= 48 && codeUnit <= 57) ||
      (codeUnit >= 65 && codeUnit <= 70) ||
      (codeUnit >= 97 && codeUnit <= 102);
}

int _sum(List<int> xs) {
  int s = 0;
  for (final int v in xs) {
    s += v;
  }
  return s;
}
