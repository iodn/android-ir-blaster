import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/ir/ir_protocol_types.dart';

const Map<String, String> _protocolExampleHex = <String, String>{
  'denon': '0000',
  'f12_relaxed': '100',
  'jvc': '0000',
  'kaseikyo': '80D003',
  'nec': '000000FF',
  'nec2': '000800FF',
  'necx1': '000008F7',
  'necx2': '000C08F7',
  'pioneer': '1A2B',
  'proton': '0000',
  'rc5': '000',
  'rc6': '800F',
  'rca_38': 'F00',
  'rcc0082': '000',
  'rcc2026': '0087FBC03FC',
  'rec80': '28C600212100',
  'recs80': '000',
  'recs80_l': '000',
  'samsung32': '00000000',
  'samsung36': '00C0001',
  'sharp': '2024',
  'sony12': '000',
  'sony15': '0014',
  'sony20': '0002F',
  'thomson7': '080',
};

String normalizeHexDigitsOnlyUpper(String s) {
  final StringBuffer out = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    final int u = s.codeUnitAt(i);
    final bool isHex = (u >= 48 && u <= 57) || (u >= 65 && u <= 70) || (u >= 97 && u <= 102);
    if (isHex) out.writeCharCode(u);
  }
  return out.toString().toUpperCase();
}

int totalHexDigitsForProtocol(String protocolId) {
  final ex = _protocolExampleHex[protocolId];
  if (ex != null && ex.isNotEmpty) return ex.length;
  try {
    final def = IrProtocolRegistry.definitionFor(protocolId);
    if (def != null && def.fields.isNotEmpty) {
      final f = def.fields.first;
      final int? maxLen = f.maxLength;
      if (f.type == IrFieldType.string && maxLen != null && maxLen > 0) {
        final int digits = maxLen.clamp(1, 64);
        return digits;
      }
    }
  } catch (_) {}
  return 0;
}

String fitHexDigitsForProtocol(String protocolId, String codeHexAny) {
  final String pid = protocolId.trim().toLowerCase();
  final int want = totalHexDigitsForProtocol(pid);
  String s = normalizeHexDigitsOnlyUpper(codeHexAny);
  if (want <= 0) return s;
  if (s.length > want) {
    s = s.substring(s.length - want);
  } else if (s.length < want) {
    s = s.padLeft(want, '0');
  }
  return s;
}

Map<String, dynamic> buildParamsForProtocol({
  required String protocolId,
  required String codeHex,
  String kaseikyoVendor = '2002',
}) {
  final String pid = protocolId.trim().toLowerCase();
  final String fitted = fitHexDigitsForProtocol(pid, codeHex);

  if (pid == 'kaseikyo') {
    return _buildKaseikyoParams(codeHexAny: fitted, vendorAny: kaseikyoVendor);
  }

  if (pid == 'pioneer') {
    if (fitted.length != 4) {
      throw ArgumentError('Pioneer code must be 4 hex digits');
    }
    return <String, dynamic>{
      'address': fitted.substring(0, 2),
      'command': fitted.substring(2, 4),
    };
  }

  if (pid == 'rca_38') {
    if (fitted.length != 3) {
      throw ArgumentError('RCA code must be 3 hex digits');
    }
    return <String, dynamic>{
      'address': fitted.substring(0, 1),
      'command': fitted.substring(1, 3),
    };
  }

  if (pid == 'thomson7') {
    try {
      final def = IrProtocolRegistry.definitionFor(pid);
      if (def != null && def.fields.isNotEmpty) {
        final f = def.fields.first;
        if (f.type == IrFieldType.intDecimal) {
          return <String, dynamic>{
            f.id: int.parse(fitted.isEmpty ? '0' : fitted, radix: 16),
          };
        }
        if (f.type == IrFieldType.string) {
          return <String, dynamic>{f.id: fitted};
        }
      }
    } catch (_) {}
    return <String, dynamic>{
      'code': int.parse(fitted.isEmpty ? '0' : fitted, radix: 16),
    };
  }

  try {
    final def = IrProtocolRegistry.definitionFor(pid);
    if (def == null || def.fields.isEmpty) {
      return <String, dynamic>{'hex': fitted};
    }

    if (def.fields.length == 1) {
      final f = def.fields.first;
      if (f.type == IrFieldType.intDecimal) {
        return <String, dynamic>{
          f.id: int.parse(fitted.isEmpty ? '0' : fitted, radix: 16),
        };
      }
      return <String, dynamic>{f.id: fitted};
    }

    final Map<String, IrFieldDef> byId = <String, IrFieldDef>{
      for (final f in def.fields) f.id: f,
    };

    if (byId.containsKey('address') && byId.containsKey('command')) {
      final int digits = fitted.length;
      if (digits >= 4) {
        return <String, dynamic>{
          'address': fitted.substring(0, 2),
          'command': fitted.substring(2, 4),
        };
      }
    }

    return <String, dynamic>{def.fields.first.id: fitted};
  } catch (_) {
    return <String, dynamic>{'hex': fitted};
  }
}

Map<String, dynamic> _buildKaseikyoParams({
  required String codeHexAny,
  required String vendorAny,
}) {
  final String vendor = normalizeHexDigitsOnlyUpper(vendorAny).padLeft(4, '0');
  if (!RegExp(r'^[0-9A-F]{4}$').hasMatch(vendor)) {
    throw ArgumentError('Kaseikyo vendor must be 4 hex digits');
  }

  final String vMsb = vendor.substring(0, 2);
  final String vLsb = vendor.substring(2, 4);

  final String code = normalizeHexDigitsOnlyUpper(codeHexAny);

  if (code.length == 16) {
    final List<String> addr = <String>[
      code.substring(0, 2),
      code.substring(2, 4),
      code.substring(4, 6),
      code.substring(6, 8),
    ];
    final List<String> cmd = <String>[
      code.substring(8, 10),
      code.substring(10, 12),
      code.substring(12, 14),
      code.substring(14, 16),
    ];
    return <String, dynamic>{
      'address': _bytesToSpacedHex(addr),
      'command': _bytesToSpacedHex(cmd),
    };
  }

  if (code.length == 8) {
    final String b0 = code.substring(0, 2);
    final String cmd0 = code.substring(2, 4);
    final String cmd1 = code.substring(4, 6);
    final String idByte = code.substring(6, 8);
    final String addr = _bytesToSpacedHex(<String>[b0, vLsb, vMsb, idByte]);
    final String cmd = _bytesToSpacedHex(<String>[cmd0, cmd1, '00', '00']);
    return <String, dynamic>{
      'address': addr,
      'command': cmd,
    };
  }

  if (code.length == 6) {
    final String b0 = code.substring(0, 2);
    final String cmd0 = code.substring(2, 4);
    final String cmd1 = code.substring(4, 6);
    final String addr = _bytesToSpacedHex(<String>[b0, vLsb, vMsb, '00']);
    final String cmd = _bytesToSpacedHex(<String>[cmd0, cmd1, '00', '00']);
    return <String, dynamic>{
      'address': addr,
      'command': cmd,
    };
  }

  throw ArgumentError('Kaseikyo code must be 6, 8, or 16 hex digits');
}

String _bytesToSpacedHex(List<String> bytes2) {
  return bytes2.map((e) => e.toUpperCase()).join(' ');
}
