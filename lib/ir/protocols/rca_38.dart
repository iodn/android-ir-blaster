import '../ir_protocol_types.dart';

const IrProtocolDefinition rca38ProtocolDefinition = IrProtocolDefinition(
  id: 'rca_38',
  displayName: 'RCA_38',
  description:
      'RCA_38: 3-hex-digit code -> 12 bits (high nibble + low byte). Carrier 38.7kHz. '
      'Preamble 3840/3840; bit 0=480/960, bit 1=480/1920; trailer 480/7680; sequence duplicated.',
  implemented: true,
  defaultFrequencyHz: 38700,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Code (3 hex digits)',
      type: IrFieldType.string,
      required: true,
      maxLength: 3,
      hint: 'e.g., A1F',
      helperText: 'Exactly 3 hex digits (0-9, A-F).',
      maxLines: 1,
    ),
  ],
);

class Rca38ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'rca_38';
  const Rca38ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => rca38ProtocolDefinition;

  static const int defaultFrequencyHz = 38700;

  // Timings (microseconds)
  static const List<int> zero = <int>[0x1E0, 0x3C0]; // 480, 960
  static const List<int> one = <int>[0x1E0, 0x780]; // 480, 1920
  static const List<int> pre = <int>[0x0F00, 0x0F00]; // 3840, 3840
  static const List<int> post = <int>[0x1E0, 0x1E00]; // 480, 7680

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a string');
    }
    final String hex = h.trim();

    _validateHexExact(hex, 3, protocolName: 'RCA_38');

    final int highNibble = int.parse(hex.substring(0, 1), radix: 16) & 0xF;
    final int lowByte = int.parse(hex.substring(1, 3), radix: 16) & 0xFF;

    final String bits =
        highNibble.toRadixString(2).padLeft(4, '0') +
        lowByte.toRadixString(2).padLeft(8, '0'); // 12 bits total

    final List<int> seq = <int>[];
    seq.addAll(pre);

    for (int i = 0; i < bits.length; i++) {
      seq.addAll(bits[i] == '0' ? zero : one);
    }

    seq.addAll(post);

    // duplicate the whole sequence once
    final List<int> doubled = <int>[];
    doubled.addAll(seq);
    doubled.addAll(seq);

    return IrEncodeResult(
      frequencyHz: defaultFrequencyHz,
      pattern: doubled,
    );
  }
}

bool _isHexChar(int codeUnit) {
  return (codeUnit >= 48 && codeUnit <= 57) ||
      (codeUnit >= 65 && codeUnit <= 70) ||
      (codeUnit >= 97 && codeUnit <= 102);
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
