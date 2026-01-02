import '../ir_protocol_types.dart';

const IrProtocolDefinition protonProtocolDefinition = IrProtocolDefinition(
  id: 'proton',
  displayName: 'Proton',
  description:
      'Proton: 4-hex-digit code (16 bits). Carrier 38.5kHz. '
      'Header 8000/4000; sends last 8 bits, separator 500/8000, then first 8 bits. '
      'Frame padded to 63000us.',
  implemented: true,
  defaultFrequencyHz: 38500,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Code (4 hex digits)',
      type: IrFieldType.string,
      required: true,
      maxLength: 4,
      hint: 'e.g., 1A2B',
      helperText: '4 hex digits (0-9, A-F).',
      maxLines: 1,
    ),
  ],
);

class ProtonProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'proton';
  const ProtonProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => protonProtocolDefinition;

  static const int defaultFrequencyHz = 38500;

  // Timings (microseconds)
  static const int hdrMark = 0x1F40; // 8000
  static const int hdrSpace = 0x0FA0; // 4000
  static const int bitMark = 0x1F4; // 500
  static const int zeroSpace = 0x1F4; // 500
  static const int oneSpace = 0x5DC; // 1500
  static const int sepSpace = 0x1F40; // 8000
  static const int frameTargetUs = 0xF618; // 63000

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) {
      throw ArgumentError('hex must be a string');
    }
    final String hex = h.trim();

    _validateHexExact(hex, 4, protocolName: 'Proton');

    final int value = int.parse(hex, radix: 16) & 0xFFFF;
    final String bin = value.toRadixString(2).padLeft(16, '0');
    final String last8 = bin.substring(8, 16);
    final String first8 = bin.substring(0, 8);

    final List<int> seq = <int>[];
    // Header
    seq.add(hdrMark);
    seq.add(hdrSpace);

    void appendBits(String bits) {
      for (int i = 0; i < bits.length; i++) {
        final String ch = bits[i];
        seq.add(bitMark);
        seq.add(ch == '0' ? zeroSpace : oneSpace);
      }
    }

    // last 8 bits first
    appendBits(last8);

    // separator: mark + long space
    seq.add(bitMark);
    seq.add(sepSpace);

    // first 8 bits
    appendBits(first8);

    // final mark
    seq.add(bitMark);

    final int used = _sum(seq);
    final int remaining = frameTargetUs - used;
    // Defensive: never emit negative durations.
    seq.add(remaining > 0 ? remaining : 0);

    return IrEncodeResult(
      frequencyHz: defaultFrequencyHz,
      pattern: seq,
    );
  }
}

bool _isHexChar(int codeUnit) {
  // 0-9, A-F, a-f
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

int _sum(List<int> xs) {
  int s = 0;
  for (final int v in xs) {
    s += v;
  }
  return s;
}
