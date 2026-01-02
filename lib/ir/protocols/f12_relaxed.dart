import '../ir_protocol_types.dart';

const IrProtocolDefinition f12RelaxedProtocolDefinition = IrProtocolDefinition(
  id: 'f12_relaxed',
  displayName: 'F12_relaxed',
  description:
      'F12_relaxed: carrier 38kHz. Parses hex to 12 bits, maps 0->[422,1266], 1->[1266,422]. '
      'Adjusts final slot to reach 54000us total frame length.',
  implemented: true,
  defaultFrequencyHz: 38000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Code (hex)',
      type: IrFieldType.string,
      required: true,
      maxLength: 32,
      hint: 'e.g., ABC',
      helperText:
          'Hex string (0-9, A-F). Entire value is parsed; first 12 bits are used.',
      maxLines: 1,
    ),
  ],
);

class F12RelaxedProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'f12_relaxed';
  const F12RelaxedProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => f12RelaxedProtocolDefinition;

  static const int defaultFrequencyHz = 38000;

  // Timings
  static const List<int> zero = <int>[0x1A6, 0x4F2]; // 422,1266
  static const List<int> one = <int>[0x4F2, 0x1A6]; // 1266,422
  static const int frameTargetUs = 0xD300; // 54000

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) throw ArgumentError('hex must be a string');
    final String hex = h.trim();

    if (hex.isEmpty) {
      throw ArgumentError('F12_relaxed hexcode length == 0');
    }
    for (int i = 0; i < hex.length; i++) {
      if (!_isHexChar(hex.codeUnitAt(i))) {
        throw ArgumentError('F12_relaxed hexcode is not hexadecimal');
      }
    }

    final int value = int.parse(hex, radix: 16);
    final String bin = value.toRadixString(2).padLeft(12, '0');
    final String bits12 = bin.substring(0, 12); // take(12)

    final List<int> seq = <int>[];
    for (int i = 0; i < bits12.length; i++) {
      final List<int> p = (bits12[i] == '0') ? zero : one;
      seq.add(p[0]);
      seq.add(p[1]);
    }

    // Adjust final slot to meet 54000us:
    // set last to 0, sum, then set last to (target - used).
    if (seq.isNotEmpty) {
      seq[seq.length - 1] = 0;
      final int used = _sum(seq);
      final int gap = frameTargetUs - used;
      seq[seq.length - 1] = gap > 0 ? gap : 0;
    }

    return IrEncodeResult(
      frequencyHz: defaultFrequencyHz,
      pattern: seq,
    );
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
