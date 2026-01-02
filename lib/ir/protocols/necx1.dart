import '../ir_protocol_types.dart';

const IrProtocolDefinition necx1ProtocolDefinition = IrProtocolDefinition(
  id: 'necx1',
  displayName: 'NECx1',
  description: 'NECx1: 8-hex -> 32-bit MSB-first. Carrier 38400 Hz. '
      'Main frame preamble 4500/4500, bits as 562 + (562/1687), trailing 562, '
      'pad to 108800us.',
  implemented: true,
  defaultFrequencyHz: 0x9600, /* 38400 */
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Code (8 hex digits)',
      type: IrFieldType.string,
      required: true,
      maxLength: 8,
      hint: 'e.g., 00FF12ED',
      helperText:
          'Up to 8 hex digits (0-9, A-F). Short values are left-padded with 0.',
      maxLines: 1,
    ),
  ],
);

class Necx1ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'necx1';
  const Necx1ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => necx1ProtocolDefinition;

  static const int carrierHz = 0x9600; /* 38400 */
  static const int T = 0x232; /* 562 */
  static const int THREE_T = 0x697; /* 1687 */
  static const int pre = 0x1194; /* 4500 */
  static const int nineT = 0x1190; /* 4496 */
  static const int targetUs = 0x1A580; /* 108800 */

  /// Optional helper: NECx1 toggle frame (smali a()).
  /// Not used automatically by encode() to avoid changing app behavior.
  IrEncodeResult encodeToggleFrame(String hexInput) {
    final String hex = _normalizeHexUpTo(hexInput, 8, protocolName: 'NECx1');

    final int firstByte = int.parse(hex.substring(0, 2), radix: 16) & 0xFF;

    final List<int> seq = <int>[];
    seq.add(nineT);
    seq.add(nineT);
    seq.add(T);
    seq.add(((firstByte & 0x01) == 1) ? THREE_T : T);
    seq.add(T);

    final int used = _sum(seq);
    final int gap = targetUs - used;
    seq.add(gap > 0 ? gap : 0);

    return IrEncodeResult(frequencyHz: carrierHz, pattern: seq);
  }

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) throw ArgumentError('hex must be a String');

    final String hexIn = h.trim();

    // Accept 1..8 hex digits; left-pad to 8.
    final String hex = _normalizeHexUpTo(hexIn, 8, protocolName: 'NECx1');

    final String bits32 = _to32Bits(hex);

    final List<int> seq = <int>[];

    // Preamble [4500, 4500]
    seq.add(pre);
    seq.add(pre);

    for (int i = 0; i < bits32.length; i++) {
      seq.add(T);
      seq.add(bits32[i] == '0' ? T : THREE_T);
    }

    // trailing mark
    seq.add(T);

    // pad to 108800us
    final int used = _sum(seq);
    final int gap = targetUs - used;
    seq.add(gap > 0 ? gap : 0);

    return IrEncodeResult(
      frequencyHz: carrierHz,
      pattern: seq,
    );
  }
}

/* Helpers (file-local) */
String _to32Bits(String hex) {
  final int value = int.parse(hex, radix: 16);
  return value.toRadixString(2).padLeft(32, '0');
}

int _sum(List<int> xs) {
  int s = 0;
  for (final int v in xs) {
    s += v;
  }
  return s;
}

bool _isHexChar(int c) {
  return (c >= 0x30 && c <= 0x39) || // 0-9
      (c >= 0x41 && c <= 0x46) || // A-F
      (c >= 0x61 && c <= 0x66); // a-f
}

void _validateHex1ToMax(String hex, int maxLen, {required String protocolName}) {
  if (hex.isEmpty || hex.length > maxLen) {
    throw ArgumentError('$protocolName hexcode length must be 1..$maxLen');
  }
  for (int i = 0; i < hex.length; i++) {
    if (!_isHexChar(hex.codeUnitAt(i))) {
      throw ArgumentError('$protocolName hexcode is not hexadecimal');
    }
  }
}

String _normalizeHexUpTo(String hex, int targetLen,
    {required String protocolName}) {
  final String s = hex.trim();
  _validateHex1ToMax(s, targetLen, protocolName: protocolName);
  return s.toUpperCase().padLeft(targetLen, '0');
}
