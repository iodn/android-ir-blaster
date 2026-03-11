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
    final String payload11 = (value & 0x7FF).toRadixString(2).padLeft(11, '0');

    final String bits = leader + toggleBit + payload11; // 14 bits total

    final List<bool> halfLevels = <bool>[];
    for (int i = 0; i < bits.length; i++) {
      final bool one = bits.codeUnitAt(i) == 0x31; // '1'
      // RC5: 1 => space then mark, 0 => mark then space.
      halfLevels.add(!one);
      halfLevels.add(one);
    }

    // The first RC5 start bit is always 1, so the message starts halfway
    // through an idle period. Skip that implicit leading space half-bit.
    final List<int> seq = <int>[];
    if (halfLevels.length > 1) {
      bool currentLevel = halfLevels[1];
      int currentDuration = unit;
      for (int i = 2; i < halfLevels.length; i++) {
        if (halfLevels[i] == currentLevel) {
          currentDuration += unit;
        } else {
          seq.add(currentDuration);
          currentLevel = halfLevels[i];
          currentDuration = unit;
        }
      }
      seq.add(currentDuration);
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
