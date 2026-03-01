import '../ir_protocol_types.dart';

const IrProtocolDefinition rc6ProtocolDefinition = IrProtocolDefinition(
  id: 'rc6',
  displayName: 'RC6',
  description:
      'RC6 mode-0: leader 2664/888, start+mode bits, double-width toggle bit, '
      'then 16-bit payload (address+command). Carrier 36kHz.',
  implemented: true,
  defaultFrequencyHz: 36000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Code (hex)',
      type: IrFieldType.string,
      required: true,
      maxLength: 32,
      hint: 'e.g., 800F',
      helperText:
          'Hex string (0-9, A-F). The last 4 hex digits are used as the 16-bit payload.',
      maxLines: 1,
    ),
  ],
);

class Rc6ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'rc6';
  const Rc6ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => rc6ProtocolDefinition;

  static const int defaultFrequencyHz = 36000;

  // flips per encode.
  static bool _toggleFlag = false;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a string');
    }
    final String hex = h.trim();
    if (hex.isEmpty) {
      throw ArgumentError('RC6 hexcode length == 0');
    }
    for (int i = 0; i < hex.length; i++) {
      if (!_isHexChar(hex.codeUnitAt(i))) {
        throw ArgumentError('RC6 hexcode is not hexadecimal');
      }
    }

    // Flip toggle per “press”
    _toggleFlag = !_toggleFlag;

    // Timings
    const int t = 0x01BC; // 444
    const int leaderMark = 0x0A68; // 2664
    const int leaderSpace = 0x0378; // 888

    // Payload: last 4 hex chars -> 16-bit binary
    final String last4 = (hex.length >= 4) ? hex.substring(hex.length - 4) : hex;
    final int value = int.parse(last4, radix: 16) & 0xFFFF;
    final String payloadBits = value.toRadixString(2).padLeft(16, '0');

    // RC6 mode-0 bit layout:
    // start(1), mode(000), toggle(double-width), payload(16 bits)
    final String bits = '1000${_toggleFlag ? '1' : '0'}$payloadBits';

    // Build mark/space durations by merging adjacent half-bits with same level.
    // For each bit: 1 => mark then space, 0 => space then mark.
    final List<int> pattern = <int>[];
    bool lastWasMark = false;

    void addSegment(bool isMark, int durationUs) {
      if (durationUs <= 0) return;
      if (pattern.isNotEmpty && lastWasMark == isMark) {
        pattern[pattern.length - 1] = pattern.last + durationUs;
      } else {
        pattern.add(durationUs);
      }
      lastWasMark = isMark;
    }

    addSegment(true, leaderMark);
    addSegment(false, leaderSpace);

    for (int i = 0; i < bits.length; i++) {
      final int half = (i == 4) ? (2 * t) : t; // toggle bit is double-width
      final bool one = bits.codeUnitAt(i) == 0x31; // '1'
      addSegment(one, half);
      addSegment(!one, half);
    }

    return IrEncodeResult(
      frequencyHz: defaultFrequencyHz,
      pattern: pattern,
    );
  }
}

bool _isHexChar(int codeUnit) {
  return (codeUnit >= 48 && codeUnit <= 57) ||
      (codeUnit >= 65 && codeUnit <= 70) ||
      (codeUnit >= 97 && codeUnit <= 102);
}
