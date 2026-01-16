import '../ir_protocol_types.dart';

const IrProtocolDefinition kaseikyoProtocolDefinition = IrProtocolDefinition(
  id: 'kaseikyo',
  displayName: 'Kaseikyo',
  description:
      'Kaseikyo/Panasonic: LSB-first 48-bit frame: Vendor(16) + VendParity(4) + Address(12) + Command(8) + XOR(8).\n'
      '37kHz carrier, header 3456/1728, bit mark 432, space 432 (0) or 1296 (1).\n'
      'Fields: VendorID (4 hex), Address (3 hex, 12 bits), Command (2 hex).',
  implemented: true,
  defaultFrequencyHz: 37000,
  fields: <IrFieldDef>[
    IrFieldDef(
      id: 'vendor',
      label: 'Vendor ID (4 hex)',
      type: IrFieldType.string,
      required: true,
      maxLength: 4,
      hint: 'e.g., 2002 for Panasonic',
      defaultValue: '2002',
      helperText: '16-bit hex vendor code (e.g., 2002 Panasonic, 3254 Denon).',
      maxLines: 1,
    ),
    IrFieldDef(
      id: 'address',
      label: 'Address (3 hex, 12 bits)',
      type: IrFieldType.string,
      required: true,
      maxLength: 3,
      hint: 'e.g., 0F1',
      helperText: '12-bit address: commonly subdevice<<4 | device.',
      maxLines: 1,
    ),
    IrFieldDef(
      id: 'command',
      label: 'Command (2 hex)',
      type: IrFieldType.string,
      required: true,
      maxLength: 2,
      hint: 'e.g., 76',
      helperText: '8-bit command byte.',
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
  static const int unit = 432; // base unit (37 kHz ~ 16 cycles)
  static const int headerMark = 8 * unit; // 3456
  static const int headerSpace = 4 * unit; // 1728
  static const int bitMark = unit; // 432
  static const int zeroSpace = unit; // 432
  static const int oneSpace = 3 * unit; // 1296
  static const int repeatDistanceUs = 130000 - 56000; // ~74ms as a safe inter-frame gap

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final String vendorHex = _readHex(params, 'vendor', minLen: 1, maxLen: 4,
        normalizeToLen: 4, protocolName: 'Kaseikyo');
    final String addressHex = _readHex(params, 'address', minLen: 1, maxLen: 3,
        normalizeToLen: 3, protocolName: 'Kaseikyo');
    final String commandHex = _readHex(params, 'command', minLen: 1, maxLen: 2,
        normalizeToLen: 2, protocolName: 'Kaseikyo');

    final int vendor = int.parse(vendorHex, radix: 16) & 0xFFFF;
    final int address12 = int.parse(addressHex, radix: 16) & 0x0FFF;
    final int command = int.parse(commandHex, radix: 16) & 0xFF;

    final int vendorParity = _vendorParityNibble(vendor);

    final int word1 = vendor; // 16 bits
    final int word2 = ((address12 << 4) | vendorParity) & 0xFFFF; // parity in low nibble

    final int byte0 = word1 & 0xFF; // LSB first
    final int byte1 = (word1 >> 8) & 0xFF;
    final int byte2 = word2 & 0xFF;
    final int byte3 = (word2 >> 8) & 0xFF;
    final int byte4 = command;
    final int byte5 = (byte2 ^ byte3 ^ byte4) & 0xFF; // 8-bit XOR parity

    final List<int> bytesLsbFirst = <int>[byte0, byte1, byte2, byte3, byte4, byte5];

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

    // Trailing mark and inter-frame gap
    out.add(bitMark);
    out.add(repeatDistanceUs);

    return IrEncodeResult(
      frequencyHz: 37000,
      pattern: out,
    );
  }

  int _vendorParityNibble(int vendor) {
    int p = vendor ^ (vendor >> 8);
    p = (p ^ (p >> 4)) & 0xF;
    return p;
  }

  String _readHex(Map<String, dynamic> params, String key,
      {required int minLen, required int maxLen, required int normalizeToLen, required String protocolName}) {
    final dynamic v = params[key];
    if (v is! String) {
      throw ArgumentError('$protocolName: "$key" must be a hex string');
    }
    final String s = v.trim();
    if (s.isEmpty || s.length < minLen || s.length > maxLen) {
      throw ArgumentError('$protocolName: "$key" hex length must be $minLen..$maxLen');
    }
    for (int i = 0; i < s.length; i++) {
      final int c = s.codeUnitAt(i);
      final bool ok = (c >= 0x30 && c <= 0x39) || (c >= 0x41 && c <= 0x46) || (c >= 0x61 && c <= 0x66);
      if (!ok) throw ArgumentError('$protocolName: "$key" is not hexadecimal');
    }
    return s.toUpperCase().padLeft(normalizeToLen, '0');
  }
}
