import '../ir_protocol_types.dart';

const IrProtocolDefinition marantzProtocolDefinition = IrProtocolDefinition(
  id: 'marantz',
  displayName: 'Marantz',
  description:
      'MARANTZ: bi-phase coding, unit=889us, carrier=36kHz. '
      'Input: address(5 bits) + command(7 bits) + extension(6 bits). Fixed start bit,'
      'inverted 7th command bit, toggle bit, address, 4 unit gap, 12-bit payload '
      '(remaining 6 command bits + 6 extension bits), MSB-first. Frame gap padded to 114000us.',
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
      helperText: 'Marantz device address (00..1F).',
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
      helperText: 'Marantz command (00..7F).',
      maxLines: 1,
    ),
    IrFieldDef(
      id: 'extension',
      label: 'Command (6 bits)',
      type: IrFieldType.intHex,
      required: true,
      min: 0x00,
      max: 0x3F,
      maxLength: 2,
      hint: 'e.g., 0C',
      helperText: 'Marantz extension (00..3F).',
      maxLines: 1,
    ),
  ],
);

class MarantzProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'marantz';
  const MarantzProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => marantzProtocolDefinition;

  static const int defaultFrequencyHz = 36000;

  // Timings
  static const int unit = 0x379; // 889us
  static const int frameTargetUs = 0x1BD50; // 114000us
  static const int repeatWindowMs = 180;

  // Marantz toggle changes on a new press, but stays constant while the same key
  // is repeating. The app-level encoder is stateless, so we approximate that
  // behavior here by keeping the same toggle for rapid repeats of the same
  // payload and flipping it for a new press.
  static bool _toggleFlag = false;
  static int? _lastPayload;
  static DateTime? _lastEncodeAt;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    // Marantz is a variant of the RC5X IR protocol. After the address (i.e., the first 8 bits),
    // it inserts a 3.5 ms pause, followed by the 6 command bits and a 6-bit command extension.
    // (https://github.com/Arduino-IRremote/Arduino-IRremote/blob/master/src/ir_RC5_RC6.hpp)
    final (int address, int payload, bool extendedRange) = _readPackedPayload(params);
    final bool toggle = _resolveToggle(address, payload, extendedRange);

    final String leader = '1${extendedRange ? '0' : '1'}';
    final String toggleBit = toggle ? '1' : '0';
    final String address5 = address.toRadixString(2).padLeft(5, '0');
    final String payload12 = payload.toRadixString(2).padLeft(12, '0');

    final String bits1 = leader + toggleBit + address5; // 8 bits total
    final String bits2 = payload12; // 12 bits total

    final List<bool> halfLevels = <bool>[];
    // MARANTZ: address
    for (int i = 0; i < bits1.length; i++) {
      final bool one = bits1.codeUnitAt(i) == 0x31; // '1'
      // RC5: 1 => space then mark, 0 => mark then space.
      halfLevels.add(!one);
      halfLevels.add(one);
    }
    // MARANTZ: gap
    for (int i=0; i<4; i++) {
      halfLevels.add(false);
    }
    // MARANTZ: playload
    for (int i = 0; i < bits2.length; i++) {
      final bool one = bits2.codeUnitAt(i) == 0x31; // '1'
      // RC5: 1 => space then mark, 0 => mark then space.
      halfLevels.add(!one);
      halfLevels.add(one);
    }

    // The Marantz start bit is always 1, so the message starts halfway
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

  bool _resolveToggle(int address, int payload, bool extendedRange) {
    final int extPayload = (address << 13) | (payload << 1) | (extendedRange ? 0x1 : 0x0);

    final DateTime now = DateTime.now();
    final bool isRepeat = MarantzProtocolEncoder._lastPayload == extPayload &&
        MarantzProtocolEncoder._lastEncodeAt != null &&
        now.difference(MarantzProtocolEncoder._lastEncodeAt!).inMilliseconds <=
            MarantzProtocolEncoder.repeatWindowMs;
    if (!isRepeat) {
      MarantzProtocolEncoder._toggleFlag = !MarantzProtocolEncoder._toggleFlag;
    }
    _rememberToggleState(MarantzProtocolEncoder._toggleFlag, extPayload, now: now);
    return MarantzProtocolEncoder._toggleFlag;
  }

  void _rememberToggleState(bool toggle, int payload, {DateTime? now}) {
    MarantzProtocolEncoder._toggleFlag = toggle;
    MarantzProtocolEncoder._lastPayload = payload;
    MarantzProtocolEncoder._lastEncodeAt = now ?? DateTime.now();
  }
}

(int, int, bool) _readPackedPayload(Map<String, dynamic> params) {
  final dynamic addressRaw = params['address'];
  final dynamic commandRaw = params['command'];
  final dynamic extensionRaw = params['extension'];

  final int address = _readHexField(addressRaw, max: 0x1F, name: 'Marantz address');
  final int command = _readHexField(commandRaw, max: 0x7F, name: 'Marantz command');
  final int extension = _readHexField(extensionRaw, max: 0x3F, name: 'Marantz extension');

  return ((address & 0x1F), ((command & 0x3F) << 6) | (extension & 0x3F), (command > 0x3F));
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
