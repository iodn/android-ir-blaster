import '../ir_protocol_types.dart';

const IrProtocolDefinition rc5xProtocolDefinition = IrProtocolDefinition(
  id: 'rc5x',
  displayName: 'RC5X',
  description:
      'RC5X: bi-phase coding, unit=889us, carrier=36kHz. '
      'Input: address(5 bits) + command(7 bits). Fixed start bit, inverted 7th '
      'command bit, toggle bit, 11-bit payload (5 address bits + remaining '
      '6 command bits), MSB-first. Frame gap padded to 114000us.',
  implemented: true,
  defaultFrequencyHz: 36000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'address',
      label: 'Address (5 bits)',
      type: IrFieldType.intHex,
      required: true,
      min: 0x00,
      max: 0x1F,
      maxLength: 2,
      hint: 'e.g., 10',
      helperText: 'RC5X device address (00..1F).',
      maxLines: 1,
    ),
    IrFieldDef(
      id: 'command',
      label: 'Command (7 bits)',
      type: IrFieldType.intHex,
      required: true,
      min: 0x00,
      max: 0x7F,
      maxLength: 2,
      hint: 'e.g., 0C',
      helperText: 'RC5X command (00..7F).',
      maxLines: 1,
    ),
  ],
);

class Rc5xProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'rc5x';
  const Rc5xProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => rc5xProtocolDefinition;

  static const int defaultFrequencyHz = 36000;

  // Timings
  static const int unit = 0x379; // 889us
  static const int frameTargetUs = 0x1BD50; // 114000us
  static const int repeatWindowMs = 180;

  // RC5X toggle changes on a new press, but stays constant while the same key
  // is repeating. The app-level encoder is stateless, so we approximate that
  // behavior here by keeping the same toggle for rapid repeats of the same
  // payload and flipping it for a new press.
  static bool _toggleFlag = false;
  static int? _lastPayload;
  static DateTime? _lastEncodeAt;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    // RC5X extends the RC5 command range to 7 bits. It uses a single start bit,
    // while the second bit carries the inverted value of the 7th command bit.
    // This ensures that the first 64 commands remain compatible with the
    // original RC5 protocol (https://www.sbprojects.net/knowledge/ir/rc5.php)
    final (int payload, bool extendedRange) = _readPackedPayload(params);
    final bool toggle = _resolveToggle(payload, extendedRange);

    final String leader = '1${extendedRange ? '0' : '1'}';
    final String toggleBit = toggle ? '1' : '0';
    final String payload11 = payload.toRadixString(2).padLeft(11, '0');

    final String bits = leader + toggleBit + payload11; // 14 bits total

    final List<bool> halfLevels = <bool>[];
    for (int i = 0; i < bits.length; i++) {
      final bool one = bits.codeUnitAt(i) == 0x31; // '1'
      // RC5: 1 => space then mark, 0 => mark then space.
      halfLevels.add(!one);
      halfLevels.add(one);
    }

    // The RC5X start bit is always 1, so the message starts halfway
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

    // Pad the inter-frame gap to the nominal RC5 repeat period without
    // destroying the transmitted tail. If the sequence already ends in a space,
    // extend it. If it ends in a mark, append the trailing gap as a new space.
    final int used = _sum(seq);
    final int gap = frameTargetUs - used;
    if (gap > 0) {
      if (seq.length.isEven) {
        seq[seq.length - 1] += gap;
      } else {
        seq.add(gap);
      }
    }

    return IrEncodeResult(
      frequencyHz: defaultFrequencyHz,
      pattern: seq,
    );
  }

  bool _resolveToggle(int payload, bool extendedRange) {
    final int extPayload = (payload << 1) | (extendedRange ? 0x1 : 0x0);

    final DateTime now = DateTime.now();
    final bool isRepeat = Rc5xProtocolEncoder._lastPayload == extPayload &&
        Rc5xProtocolEncoder._lastEncodeAt != null &&
        now.difference(Rc5xProtocolEncoder._lastEncodeAt!).inMilliseconds <=
            Rc5xProtocolEncoder.repeatWindowMs;
    if (!isRepeat) {
      Rc5xProtocolEncoder._toggleFlag = !Rc5xProtocolEncoder._toggleFlag;
    }
    _rememberToggleState(Rc5xProtocolEncoder._toggleFlag, extPayload, now: now);
    return Rc5xProtocolEncoder._toggleFlag;
  }

  void _rememberToggleState(bool toggle, int payload, {DateTime? now}) {
    Rc5xProtocolEncoder._toggleFlag = toggle;
    Rc5xProtocolEncoder._lastPayload = payload;
    Rc5xProtocolEncoder._lastEncodeAt = now ?? DateTime.now();
  }
}

(int, bool) _readPackedPayload(Map<String, dynamic> params) {
  final dynamic addressRaw = params['address'];
  final dynamic commandRaw = params['command'];

  final int address = _readHexField(addressRaw, max: 0x1F, name: 'RC5X address');
  final int command = _readHexField(commandRaw, max: 0x7F, name: 'RC5X command');

  return (((address & 0x1F) << 6) | (command & 0x3F), (command > 0x3F));
}

int _readHexField(dynamic raw, {required int max, required String name}) {
  if (raw is int) {
    if (raw < 0 || raw > max) throw ArgumentError('$name out of range');
    return raw;
  }
  if (raw is String) {
    final String s = raw.trim();
    if (s.isEmpty) throw ArgumentError('$name must not be empty');
    final int value = int.parse(s, radix: 16);
    if (value < 0 || value > max) throw ArgumentError('$name out of range');
    return value;
  }
  throw ArgumentError('$name must be hex');
}

int _sum(List<int> xs) {
  int s = 0;
  for (final int v in xs) {
    s += v;
  }
  return s;
}
