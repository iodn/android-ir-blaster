import '../ir_protocol_types.dart';

const IrProtocolDefinition rc5ProtocolDefinition = IrProtocolDefinition(
  id: 'rc5',
  displayName: 'RC5',
  description:
      'RC5: bi-phase coding, unit=889us, carrier=36kHz. '
      'Input: address(5 bits) + command(6 bits). Builds fixed start bits, toggle bit, and the 11-bit payload (MSB-first). '
      'Frame gap padded to 114000us.',
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
      helperText: 'RC5 device address (00..1F).',
      maxLines: 1,
    ),
    IrFieldDef(
      id: 'command',
      label: 'Command (6 bits)',
      type: IrFieldType.intHex,
      required: true,
      min: 0x00,
      max: 0x3F,
      maxLength: 2,
      hint: 'e.g., 0C',
      helperText: 'RC5 command (00..3F).',
      maxLines: 1,
    ),
  ],
);

class Rc5ProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'rc5';
  const Rc5ProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => rc5ProtocolDefinition;

  static const int defaultFrequencyHz = 36000;

  // Timings
  static const int unit = 0x379; // 889us
  static const int frameTargetUs = 0x1BD50; // 114000us
  static const int repeatWindowMs = 180;

  // RC5 toggle changes on a new press, but stays constant while the same key is
  // repeating. The app-level encoder is stateless, so we approximate that
  // behavior here by keeping the same toggle for rapid repeats of the same
  // payload and flipping it for a new press.
  static bool _toggleFlag = false;
  static int? _lastPayload;
  static DateTime? _lastEncodeAt;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final int payload = _readPackedPayload(params);
    final bool toggle = _resolveToggle(params, payload);

    final String leader = '11';
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

    // The first RC5 start bit is always 1, so the message starts halfway
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

  bool _resolveToggle(Map<String, dynamic> params, int payload) {
    final dynamic rawToggle = params['toggle'];
    if (rawToggle is bool) {
      _rememberToggleState(rawToggle, payload);
      return rawToggle;
    }
    if (rawToggle is String) {
      final String s = rawToggle.trim().toLowerCase();
      if (s == '0' || s == 'false') {
        _rememberToggleState(false, payload);
        return false;
      }
      if (s == '1' || s == 'true') {
        _rememberToggleState(true, payload);
        return true;
      }
      throw ArgumentError('RC5 toggle must be 0/1 or true/false');
    }

    final DateTime now = DateTime.now();
    final bool isRepeat = Rc5ProtocolEncoder._lastPayload == payload &&
        Rc5ProtocolEncoder._lastEncodeAt != null &&
        now.difference(Rc5ProtocolEncoder._lastEncodeAt!).inMilliseconds <=
            Rc5ProtocolEncoder.repeatWindowMs;
    if (!isRepeat) {
      Rc5ProtocolEncoder._toggleFlag = !Rc5ProtocolEncoder._toggleFlag;
    }
    _rememberToggleState(Rc5ProtocolEncoder._toggleFlag, payload, now: now);
    return Rc5ProtocolEncoder._toggleFlag;
  }

  void _rememberToggleState(bool toggle, int payload, {DateTime? now}) {
    Rc5ProtocolEncoder._toggleFlag = toggle;
    Rc5ProtocolEncoder._lastPayload = payload;
    Rc5ProtocolEncoder._lastEncodeAt = now ?? DateTime.now();
  }
}

int _readPackedPayload(Map<String, dynamic> params) {
  final dynamic addressRaw = params['address'];
  final dynamic commandRaw = params['command'];
  if (addressRaw != null || commandRaw != null) {
    final int address = _readHexField(addressRaw, max: 0x1F, name: 'RC5 address');
    final int command = _readHexField(commandRaw, max: 0x3F, name: 'RC5 command');
    return ((address & 0x1F) << 6) | (command & 0x3F);
  }

  final dynamic h = params['hex'];
  if (h is! String) {
    throw ArgumentError('RC5 requires address+command or legacy hex payload');
  }
  final String hex = h.trim();
  _validateHexMaxLen(hex, 3, protocolName: 'RC5');
  return (hex.isEmpty ? 0 : int.parse(hex, radix: 16)) & 0x7FF;
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

void _validateHexMaxLen(String hex, int maxLen, {required String protocolName}) {
  if (hex.length > maxLen) {
    // matches Kotlin message for RC5 specifically
    if (protocolName == 'RC5') {
      throw ArgumentError('Error: RC5 hexcode length > $maxLen');
    }
    throw ArgumentError('$protocolName hexcode length > $maxLen');
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

int _sum(List<int> xs) {
  int s = 0;
  for (final int v in xs) {
    s += v;
  }
  return s;
}
