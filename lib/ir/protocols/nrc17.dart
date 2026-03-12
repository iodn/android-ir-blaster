import '../ir_protocol_types.dart';

const IrProtocolDefinition nrc17ProtocolDefinition = IrProtocolDefinition(
  id: 'nrc17',
  displayName: 'Nokia NRC17',
  description:
      'NRC17: 38 kHz. Input hex length=4 packed as command(8 bits) + address(4 bits) + subcode(4 bits). '
      'Sends one NRC17 frame: pre-pulse 500/2500, then start bit 1, then command/address/subcode LSB-first '
      'with fixed 1 ms bi-phase bit cells (1 => burst first half, 0 => burst second half).',
  implemented: true,
  defaultFrequencyHz: 38000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Code (4 hex digits)',
      type: IrFieldType.string,
      required: true,
      maxLength: 4,
      hint: 'e.g., 5C61',
      helperText: 'Packed as command(2 hex) + address(1 hex) + subcode(1 hex).',
      maxLines: 1,
    ),
  ],
);

class Nrc17ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'nrc17';
  const Nrc17ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => nrc17ProtocolDefinition;

  static const int defaultFrequencyHz = 38000;
  static const int preMark = 500;
  static const int preSpace = 2500;
  static const int halfBit = 500;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a string');
    }
    final String hex = h.trim();
    _validateHexExact(hex, 4, protocolName: 'NRC17');

    final int command = int.parse(hex.substring(0, 2), radix: 16) & 0xFF;
    final int address = int.parse(hex.substring(2, 3), radix: 16) & 0x0F;
    final int subcode = int.parse(hex.substring(3, 4), radix: 16) & 0x0F;

    final String bits = '1' +
        _bitsLsbFirst(command, 8) +
        _bitsLsbFirst(address, 4) +
        _bitsLsbFirst(subcode, 4);

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

    addSegment(true, preMark);
    addSegment(false, preSpace);

    for (int i = 0; i < bits.length; i++) {
      final bool one = bits.codeUnitAt(i) == 0x31; // '1'
      addSegment(one, halfBit);
      addSegment(!one, halfBit);
    }

    return IrEncodeResult(
      frequencyHz: defaultFrequencyHz,
      pattern: pattern,
    );
  }

  String _bitsLsbFirst(int value, int width) {
    final StringBuffer out = StringBuffer();
    for (int i = 0; i < width; i++) {
      out.write(((value >> i) & 1) == 0 ? '0' : '1');
    }
    return out.toString();
  }
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

bool _isHexChar(int codeUnit) {
  return (codeUnit >= 48 && codeUnit <= 57) ||
      (codeUnit >= 65 && codeUnit <= 70) ||
      (codeUnit >= 97 && codeUnit <= 102);
}
