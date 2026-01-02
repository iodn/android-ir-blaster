import '../ir_protocol_types.dart';

const IrProtocolDefinition sony20ProtocolDefinition = IrProtocolDefinition(
  id: 'sony20',
  displayName: 'SONY20',
  description:
      'Sony SIRC 20-bit: 40kHz. Input: 5 hex chars. '
      'Binary padded to 20 then take 20. Header 2400/600. '
      'Bit 0=600/600, Bit 1=1200/600. Remove last duration, pad to 45000us, '
      'then duplicate frame.',
  implemented: true,
  defaultFrequencyHz: 40000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'hex',
      label: 'Hex (5 chars)',
      type: IrFieldType.string,
      required: true,
      helperText: 'Exactly 5 hex characters (0–9, A–F).',
      maxLines: 1,
    ),
  ],
);

class Sony20ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'sony20';
  const Sony20ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => sony20ProtocolDefinition;

  static const int carrierHz = 0x9C40; // 40000

  static const int hdrMark = 2400;
  static const int hdrSpace = 600;

  static const int oneMark = 1200;
  static const int oneSpace = 600;

  static const int zeroMark = 600;
  static const int zeroSpace = 600;

  static const int frameTotalUs = 0xAFC8; // 45000

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic h = params['hex'];
    if (h is! String) throw ArgumentError('hex must be a String');

    final String hex = h.trim();
    _validateHex(hex, expectedLen: 5);

    final int value = int.parse(hex, radix: 16);
    final String bitsPadded = value.toRadixString(2).padLeft(20, '0');
    final String bits = bitsPadded.substring(bitsPadded.length - 20);

    final List<int> seq = <int>[];

    // Header
    seq.add(hdrMark);
    seq.add(hdrSpace);

    // Bits
    for (int i = 0; i < bits.length; i++) {
      final String b = bits[i];
      if (b == '0') {
        seq.add(zeroMark);
        seq.add(zeroSpace);
      } else {
        seq.add(oneMark);
        seq.add(oneSpace);
      }
    }

    // Remove last element
    if (seq.isNotEmpty) {
      seq.removeLast();
    }

    // Pad to frameTotalUs
    final int used = _sum(seq);
    int remaining = frameTotalUs - used;
    if (remaining < 0) remaining = 0;
    seq.add(remaining);

    // Duplicate once
    final List<int> out = <int>[];
    out.addAll(seq);
    out.addAll(seq);

    return IrEncodeResult(frequencyHz: carrierHz, pattern: out);
  }

  void _validateHex(String hex, {required int expectedLen}) {
    if (hex.length != expectedLen) {
      throw FormatException('hexcode length != $expectedLen');
    }
    for (int i = 0; i < hex.length; i++) {
      final int c = hex.codeUnitAt(i);
      final bool ok =
          (c >= 0x30 && c <= 0x39) || (c >= 0x41 && c <= 0x46) || (c >= 0x61 && c <= 0x66);
      if (!ok) throw FormatException('hexcode is not hexadecimal');
    }
  }

  int _sum(List<int> xs) {
    int s = 0;
    for (final int v in xs) {
      s += v;
    }
    return s;
  }
}
