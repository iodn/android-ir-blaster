import '../ir_protocol_types.dart';

const IrProtocolDefinition rc6ProtocolDefinition = IrProtocolDefinition(
  id: 'rc6',
  displayName: 'RC6',
  description:
      'RC6: Manchester-like construction with alignment helpers (e/f). Carrier 36kHz. '
      'Uses last 4 hex chars as 16-bit payload. Static mid-field toggle flips each encode.',
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

    final List<int> list = <int>[];

    // Timings
    const int T = 0x01BC; // 444
    const List<int> leader = <int>[0x0A68, 0x0378]; // 2664, 888
    const List<int> oneT = <int>[T, T]; // 444, 444
    const List<int> mid = <int>[0x0378, 0x0378]; // 888, 888

    // Helpers e() and f()
    void e(List<int> pair) {
      if (list.length.isOdd) {
        final int idx = list.length - 1;
        list[idx] = list[idx] + pair[0];
        list.add(pair[1]);
      } else {
        list.add(pair[0]);
        list.add(pair[1]);
      }
    }

    void f(List<int> pair) {
      if (list.length.isEven) {
        if (list.isEmpty) {
          // defensive; should not happen in normal order
          list.add(pair[0]);
          list.add(pair[1]);
          return;
        }
        final int idx = list.length - 1;
        list[idx] = list[idx] + pair[0];
        list.add(pair[1]);
      } else {
        list.add(pair[0]);
        list.add(pair[1]);
      }
    }

    // 1) Leader
    e(leader);

    // 2) Three blocks: e + f + f
    e(oneT);
    f(oneT);
    f(oneT);

    // 3) Mid toggle field
    if (_toggleFlag) {
      e(mid);
    } else {
      f(mid);
    }

    // 4) Payload: last 4 hex chars -> 16-bit binary
    final String last4 = (hex.length >= 4) ? hex.substring(hex.length - 4) : hex;
    final int value = int.parse(last4, radix: 16) & 0xFFFF;
    final String bits = value.toRadixString(2).padLeft(16, '0');

    // 5) For each bit: '0' -> f(T,T), '1' -> e(T,T)
    for (int i = 0; i < bits.length; i++) {
      if (bits[i] == '0') {
        f(oneT);
      } else {
        e(oneT);
      }
    }

    return IrEncodeResult(
      frequencyHz: defaultFrequencyHz,
      pattern: list,
    );
  }
}

bool _isHexChar(int codeUnit) {
  return (codeUnit >= 48 && codeUnit <= 57) ||
      (codeUnit >= 65 && codeUnit <= 70) ||
      (codeUnit >= 97 && codeUnit <= 102);
}
