import '../ir_protocol_types.dart';

const IrProtocolDefinition kaseikyoProtocolDefinition = IrProtocolDefinition(
  id: 'kaseikyo',
  displayName: 'Kaseikyo',
  description:
      'Kaseikyo (48-bit), LSB-first per byte.\n'
      'Vendor(16) + VendorParity(4) + Genre1(4) + Genre2(4) + Command(10) + ID(2) + XOR(8).',
  implemented: true,
  defaultFrequencyHz: 37000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'address',
      label: 'Address (4 bytes)',
      type: IrFieldType.string,
      required: true,
      maxLength: 11, // "AA BB CC DD"
      hint: 'e.g., 80 02 20 00',
      helperText: 'Address (4 bytes, hex).',
      maxLines: 1,
    ),
    IrFieldDef(
      id: 'command',
      label: 'Command (4 bytes)',
      type: IrFieldType.string,
      required: true,
      maxLength: 11, // "AA BB CC DD"
      hint: 'e.g., D0 03 00 00',
      helperText: 'Command (4 bytes, hex).',
      maxLines: 1,
    ),
  ],
);

class KaseikyoProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'kaseikyo';
  const KaseikyoProtocolEncoder();

  @override
  String get id => protocolId;

  @override
  IrProtocolDefinition get definition => kaseikyoProtocolDefinition;

  // Timings
  static const int unit = 432;
  static const int headerMark = 8 * unit; // 3456
  static const int headerSpace = 4 * unit; // 1728
  static const int bitMark = unit; // 432
  static const int zeroSpace = unit; // 432
  static const int oneSpace = 3 * unit; // 1296
  static const int repeatDistanceUs = 130000 - 56000; // 74000

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final List<int> addr =
        _read4Bytes(params, 'address', protocolName: 'Kaseikyo');
    final List<int> cmd =
        _read4Bytes(params, 'command', protocolName: 'Kaseikyo');

    final int b0 = addr[0] & 0xFF;

    final int genre1 = (b0 >> 4) & 0x0F;
    final int genre2 = b0 & 0x0F;

    final int vendorLsb = addr[1] & 0xFF;
    final int vendorMsb = addr[2] & 0xFF;

    final int id2 = addr[3] & 0x03;

    // Command is the 32-bit message.command in little-endian.
    // Only low 10 bits are meaningful for Kaseikyo in
    final int command16 = ((cmd[1] & 0xFF) << 8) | (cmd[0] & 0xFF);
    final int command10 = command16 & 0x03FF;

    // Vendor parity
    int vendorParity = (vendorLsb ^ vendorMsb) & 0xFF;
    vendorParity = ((vendorParity & 0x0F) ^ (vendorParity >> 4)) & 0x0F;

    // Build the 6 protocol bytes
    // data[0] = vendor_lsb
    // data[1] = vendor_msb
    // data[2] = (vendorParity & 0xf) | (genre1 << 4)
    // data[3] = (genre2 & 0xf) | ((command & 0xf) << 4)
    // data[4] = (id << 6) | (command >> 4)
    // data[5] = data[2] ^ data[3] ^ data[4]
    final int d0 = vendorLsb;
    final int d1 = vendorMsb;
    final int d2 = (vendorParity & 0x0F) | ((genre1 & 0x0F) << 4);
    final int d3 = (genre2 & 0x0F) | ((command10 & 0x0F) << 4);
    final int d4 = ((id2 & 0x03) << 6) | ((command10 >> 4) & 0x3F);
    final int d5 = (d2 ^ d3 ^ d4) & 0xFF;

    final List<int> bytesLsbFirst = <int>[d0, d1, d2, d3, d4, d5];

    final List<int> out = <int>[];

    // Header
    out.add(headerMark);
    out.add(headerSpace);

    // Bits LSB-first within each byte
    for (final int b in bytesLsbFirst) {
      for (int i = 0; i < 8; i++) {
        final int bit = (b >> i) & 1;
        out.add(bitMark);
        out.add(bit == 0 ? zeroSpace : oneSpace);
      }
    }

    // Trailing mark + pause
    out.add(bitMark);
    out.add(repeatDistanceUs);

    return IrEncodeResult(
      frequencyHz: 37000,
      pattern: out,
    );
  }

  List<int> _read4Bytes(
    Map<String, dynamic> params,
    String key, {
    required String protocolName,
  }) {
    final dynamic v = params[key];
    if (v is! String) {
      throw ArgumentError('$protocolName: "$key" must be a 4-byte hex string');
    }
    final String s = v.trim();

    // Accept:
    // - "AA BB CC DD"
    // - "AABBCCDD"
    final List<String> parts;
    final RegExp spaced = RegExp(r'^([0-9A-Fa-f]{2}\s+){3}[0-9A-Fa-f]{2}$');
    final RegExp compact = RegExp(r'^[0-9A-Fa-f]{8}$');

    if (spaced.hasMatch(s)) {
      parts = s.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    } else if (compact.hasMatch(s)) {
      parts = <String>[
        s.substring(0, 2),
        s.substring(2, 4),
        s.substring(4, 6),
        s.substring(6, 8),
      ];
    } else {
      throw ArgumentError(
        '$protocolName: "$key" must be 4 bytes, e.g. "80 02 20 00" or "80022000"',
      );
    }

    if (parts.length != 4) {
      throw ArgumentError('$protocolName: "$key" must contain exactly 4 bytes');
    }

    return parts.map((p) => int.parse(p, radix: 16) & 0xFF).toList();
  }
}
