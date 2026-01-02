import '../ir_protocol_types.dart';

const IrProtocolDefinition thomson7ProtocolDefinition = IrProtocolDefinition(
  id: 'thomson7',
  displayName: 'Thomson7',
  description:
      'Thomson7: 33kHz. Input: 3 hex digits. '
      'Mask with 0xF7F, build 12 bits as last4 + toggleBit + first7. '
      'Bit0=[460,2000], Bit1=[460,4600]. Append 460, pad to 80000us, then duplicate frame.',
  implemented: true,
  defaultFrequencyHz: 33000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'code',
      label: 'Code (3-hex)',
      type: IrFieldType.intHex,
      required: true,
      min: 0x000,
      max: 0xFFF,
      maxLength: 3,
      hint: 'e.g., 1A3',
      helperText:
          'Three hex digits (000–FFF). Encoder applies mask 0xF7F and inserts an internal toggle bit.',
    ),
  ],
);

class Thomson7ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'thomson7';
  const Thomson7ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => thomson7ProtocolDefinition;

  static const int carrierHz = 0x80E8; // 33000

  static const int mark = 0x1CC; // 460
  static const int zeroSpace = 0x7D0; // 2000
  static const int oneSpace = 0x11F8; // 4600

  static const int frameTotalUs = 0x13880; // 80000
  static const int maskF7F = 0x0F7F;

  static bool _toggle = false;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    _toggle = !_toggle;

    final dynamic v = params['code'];
    if (v is! int) {
      throw ArgumentError('code must be an int');
    }

    final int raw = v & 0xFFF;
    final int masked = raw & maskF7F;

    final String bin12 = masked.toRadixString(2).padLeft(12, '0');
    final String last4 = bin12.substring(12 - 4); // last 4 bits
    final String first7 = bin12.substring(0, 7); // first 7 bits

    final List<int> seq = <int>[];

    void appendBitChar(String ch) {
      seq.add(mark);
      if (ch == '0') {
        seq.add(zeroSpace);
      } else {
        seq.add(oneSpace);
      }
    }

    // last4
    for (int i = 0; i < last4.length; i++) {
      appendBitChar(last4[i]);
    }

    // toggle-controlled mid-bit:
    // if true -> append ZERO else append ONE
    seq.add(mark);
    seq.add(_toggle ? zeroSpace : oneSpace);

    // first7
    for (int i = 0; i < first7.length; i++) {
      appendBitChar(first7[i]);
    }

    // tail marker: single 460
    seq.add(mark);

    // pad to 80000us
    final int used = _sum(seq);
    int remaining = frameTotalUs - used;
    if (remaining < 0) remaining = 0;
    seq.add(remaining);

    // duplicate sequence once
    final List<int> out = <int>[];
    out.addAll(seq);
    out.addAll(seq);

    return IrEncodeResult(frequencyHz: carrierHz, pattern: out);
  }

  int _sum(List<int> xs) {
    int s = 0;
    for (final int v in xs) {
      s += v;
    }
    return s;
  }
}
