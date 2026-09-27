import '../ir_protocol_types.dart';

const marantzProtocolDefinition = IrProtocolDefinition(
  id: 'marantz',
  displayName: 'Marantz',
  description: 'Marantz extended RC5 (RC5x): 36 kHz, 889 us bi-phase units, '
      'with a four-unit space after the address. '
      'Address (5 bits), command (7 bits), extension (6 bits), all hexadecimal. '
      'Packed finder codes: address << 13 | command << 6 | extension (5 hex digits).',
  implemented: true,
  defaultFrequencyHz: 36000,
  fields: [
    IrFieldDef(
        id: 'address',
        label: 'Address (5 bits)',
        type: IrFieldType.intHex,
        required: true,
        min: 0,
        max: 0x1F,
        maxLength: 2,
        hint: '00..1F',
        maxLines: 1),
    IrFieldDef(
        id: 'command',
        label: 'Command (7 bits)',
        type: IrFieldType.intHex,
        required: true,
        min: 0,
        max: 0x7F,
        maxLength: 2,
        hint: '00..7F',
        maxLines: 1),
    IrFieldDef(
        id: 'extension',
        label: 'Extension (6 bits)',
        type: IrFieldType.intHex,
        required: true,
        min: 0,
        max: 0x3F,
        maxLength: 2,
        hint: '00..3F',
        maxLines: 1),
  ],
);

/// The 18 payload bits, excluding start/field/toggle, in address-command-extension
/// order. The unused top two bits of a five-digit finder value are padding.
Map<String, String> marantzParamsFromHex(String hex) {
  if (!RegExp(r'^[0-9a-fA-F]{1,5}$').hasMatch(hex)) {
    throw ArgumentError('Marantz packed code must contain 1..5 hex digits');
  }
  final value = int.parse(hex, radix: 16);
  String field(int v) => v.toRadixString(16).toUpperCase().padLeft(2, '0');
  return {
    'address': field((value >> 13) & 0x1F),
    'command': field((value >> 6) & 0x7F),
    'extension': field(value & 0x3F),
  };
}

class MarantzProtocolEncoder implements IrProtocolEncoder {
  const MarantzProtocolEncoder();
  static const protocolId = 'marantz';
  static bool _lastToggle = false;
  static int? _lastPayload;

  @override
  String get id => protocolId;
  @override
  IrProtocolDefinition get definition => marantzProtocolDefinition;

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final address = _field(params['address'], 0x1F, 'address');
    final command = _field(params['command'], 0x7F, 'command');
    final extension = _field(params['extension'], 0x3F, 'extension');
    final payload = (address << 13) | (command << 6) | extension;
    final rawToggle = params['toggle'];
    final bool toggle;
    if (rawToggle == null) {
      toggle = params['_repeat'] == true && payload == _lastPayload
          ? _lastToggle
          : !_lastToggle;
    } else if (rawToggle is bool) {
      toggle = rawToggle;
    } else if (rawToggle == 0 || rawToggle == '0' || rawToggle == 'false') {
      toggle = false;
    } else if (rawToggle == 1 || rawToggle == '1' || rawToggle == 'true') {
      toggle = true;
    } else {
      throw ArgumentError('Marantz toggle must be 0/1 or true/false');
    }

    final durations = <int>[];
    void append(bool mark, int micros) {
      if (durations.isNotEmpty && durations.length.isOdd == mark) {
        durations[durations.length - 1] += micros;
      } else {
        durations.add(micros);
      }
    }

    void bits(int value, int count) {
      for (var shift = count - 1; shift >= 0; shift--) {
        final one = (value & (1 << shift)) != 0;
        append(!one, 889);
        append(one, 889);
      }
    }

    // IRP RC5x: (1,~S:1:6,T:1,D:5,-4,S:6,F:6,^114m), D=address,
    // S=command, F=extension. The start bit's leading idle half is implicit.
    append(true, 889);
    bits(command < 0x40 ? 1 : 0, 1);
    bits(toggle ? 1 : 0, 1);
    bits(address, 5);
    append(false, 4 * 889);
    bits(command, 6);
    bits(extension, 6);
    append(false, 114000 - durations.fold<int>(0, (sum, n) => sum + n));
    if (params['_preview'] != true) {
      _lastToggle = toggle;
      _lastPayload = payload;
    }
    return IrEncodeResult(frequencyHz: 36000, pattern: durations);
  }

  int _field(dynamic raw, int max, String name) {
    final int? value;
    if (raw is int) {
      value = raw;
    } else if (raw is String &&
        RegExp(r'^[0-9a-fA-F]{1,2}$').hasMatch(raw.trim())) {
      value = int.parse(raw.trim(), radix: 16);
    } else {
      value = null;
    }
    if (value == null || value < 0 || value > max) {
      throw ArgumentError(
          'Marantz $name must be hexadecimal in 00..${max.toRadixString(16)}');
    }
    return value;
  }
}
