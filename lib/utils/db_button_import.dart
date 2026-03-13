import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/ir/ir_protocol_types.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:uuid/uuid.dart';

IRButton? buildButtonFromDbRow(IrDbKeyCandidate row) {
  final String label = _deriveLabel(row);
  final String protoDb = row.protocol.trim();
  final String hexClean = _cleanHex(row.hexcode);

  if (hexClean.isEmpty) return null;

  if (protoDb.isEmpty || _dbProtocolIsNec(protoDb)) {
    final int? parsed = int.tryParse(hexClean, radix: 16);
    if (parsed == null) return null;
    return IRButton(
      id: _newId(),
      code: parsed,
      rawData: null,
      frequency: null,
      image: label,
      isImage: false,
      necBitOrder: null,
      protocol: null,
      protocolParams: null,
    );
  }

  final String? mapped = _mapDbProtocolToAppProtocolId(protoDb);
  if (mapped == null) {
    final int? parsed = int.tryParse(hexClean, radix: 16);
    if (parsed == null) return null;
    return IRButton(
      id: _newId(),
      code: parsed,
      rawData: null,
      frequency: null,
      image: label,
      isImage: false,
      necBitOrder: null,
      protocol: null,
      protocolParams: null,
    );
  }

  final def = IrProtocolRegistry.definitionFor(mapped);
  if (def == null) return null;

  final derived = _deriveProtocolFieldTextFromHex(mapped, hexClean);
  final params = <String, dynamic>{};
  for (final field in def.fields) {
    final String? t0 = derived[field.id];
    if (t0 == null) continue;
    final String t = t0.trim();
    if (t.isEmpty) continue;

    if (field.type == IrFieldType.intDecimal) {
      final v = int.tryParse(t);
      if (v != null) params[field.id] = v;
    } else if (field.type == IrFieldType.intHex) {
      final v = int.tryParse(t, radix: 16);
      if (v != null) params[field.id] = v;
    } else if (field.type == IrFieldType.boolean) {
      params[field.id] = _coerceBool(t);
    } else {
      params[field.id] = t;
    }
  }

  return IRButton(
    id: _newId(),
    code: null,
    rawData: null,
    frequency: def.defaultFrequencyHz > 0 ? def.defaultFrequencyHz : null,
    image: label,
    isImage: false,
    necBitOrder: null,
    protocol: mapped,
    protocolParams: params,
  );
}

String _deriveLabel(IrDbKeyCandidate row) {
  final String label = (row.label ?? '').trim();
  if (label.isNotEmpty) return label;
  final String hex = row.hexcode.trim();
  return hex.isEmpty ? 'Unnamed key' : hex;
}

String _newId() {
  return const Uuid().v4();
}

String _cleanHex(String v) {
  return v.trim().toUpperCase().replaceAll(RegExp(r'[^0-9A-F]'), '');
}

String _normalizeProtoKey(String s) {
  return s.trim().toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '');
}

String? _mapDbProtocolToAppProtocolId(String dbProtocol) {
  final key = _normalizeProtoKey(dbProtocol);
  final defs = IrProtocolRegistry.allDefinitions();
  for (final d in defs) {
    final idKey = _normalizeProtoKey(d.id);
    final nameKey = _normalizeProtoKey(d.displayName);
    if (idKey == key || nameKey == key) return d.id;
  }
  return null;
}

bool _dbProtocolIsNec(String dbProtocol) {
  final k = _normalizeProtoKey(dbProtocol);
  return k == 'nec';
}

bool _coerceBool(String t) {
  final v = t.trim().toLowerCase();
  return v == '1' || v == 'true' || v == 'yes' || v == 'on';
}

bool _idLooksLike(IrFieldDef f, String needle) {
  final id = f.id.toLowerCase().trim();
  final label = f.label.toLowerCase().trim();
  return id == needle || id.contains(needle) || label.contains(needle);
}

int? _expectedHexDigits(IrFieldDef f) {
  if (f.type == IrFieldType.intHex) {
    final max = f.max;
    if (max != null && max > 0) {
      final digits = max.toRadixString(16).length;
      return digits;
    }
  }

  if (f.type == IrFieldType.string) {
    final ml = f.maxLength;
    if (ml != null && ml > 0) {
      if (ml <= 2) return ml;
      if (ml == 4 || ml == 6 || ml == 8) return ml;
      if (ml == 11) return 8;
    }

    final hint = (f.hint ?? '').trim();
    if (hint.isNotEmpty) {
      if (_wantsSpacedBytes(f)) {
        final int pairCount = RegExp(r'[0-9A-Fa-f]{2}').allMatches(hint).length;
        if (pairCount > 0) return pairCount * 2;
      }

      final tokens = RegExp(r'\b[0-9A-Fa-f]+\b').allMatches(hint);
      int best = 0;
      for (final m in tokens) {
        final len = m.group(0)?.length ?? 0;
        if (len > best) best = len;
      }
      if (best > 0) return best;
    }
  }
  return null;
}

bool _fieldLooksHexLike(IrFieldDef f) {
  if (f.type != IrFieldType.string) return false;
  final hint = (f.hint ?? '').trim();
  if (hint.isEmpty) return false;
  return _cleanHex(hint).length >= 2;
}

bool _wantsSpacedBytes(IrFieldDef f) {
  final hint = (f.hint ?? '').trim();
  if (hint.isEmpty) return false;
  return RegExp(r'^([0-9A-Fa-f]{2}\s+){1,}[0-9A-Fa-f]{2}$').hasMatch(hint);
}

String _formatBytesSpaced(String hex) {
  var h = _cleanHex(hex);
  if (h.isEmpty) return '';
  if (h.length.isOdd) h = '0$h';
  final bytes = <String>[];
  for (int i = 0; i + 1 < h.length; i += 2) {
    bytes.add(h.substring(i, i + 2));
  }
  return bytes.join(' ');
}

IrFieldDef? _findFieldById(IrProtocolDefinition def, String id) {
  for (final f in def.fields) {
    if (f.id == id) return f;
  }
  return null;
}

Map<String, String> _deriveProtocolFieldTextFromHex(String protocolId, String hexInput) {
  final def = IrProtocolRegistry.definitionFor(protocolId);
  if (def == null) return const <String, String>{};

  final hex = _cleanHex(hexInput);
  if (hex.isEmpty) return const <String, String>{};

  String? addrId;
  String? cmdId;
  String? hexId;

  for (final f in def.fields) {
    if (addrId == null && _idLooksLike(f, 'address')) addrId = f.id;
    if (cmdId == null && (_idLooksLike(f, 'command') || _idLooksLike(f, 'cmd'))) cmdId = f.id;
    if (hexId == null && (_idLooksLike(f, 'hex') || _idLooksLike(f, 'code') || _idLooksLike(f, 'value'))) {
      hexId = f.id;
    }
  }

  if (protocolId == IrProtocolIds.rca38 && addrId != null && cmdId != null) {
    final String packed = hex.length >= 3 ? hex.substring(hex.length - 3) : hex.padLeft(3, '0');
    final String addrNib = packed.substring(0, 1).toUpperCase();
    final String cmdByte = packed.substring(1, 3).toUpperCase();
    return <String, String>{
      addrId: addrNib,
      cmdId: cmdByte,
    };
  }

  if (protocolId == IrProtocolIds.rc5 && addrId != null && cmdId != null) {
    final int packed = int.parse(hex, radix: 16) & 0x7FF;
    final int addr = (packed >> 6) & 0x1F;
    final int cmd = packed & 0x3F;
    return <String, String>{
      addrId: addr.toRadixString(16).toUpperCase().padLeft(2, '0'),
      cmdId: cmd.toRadixString(16).toUpperCase().padLeft(2, '0'),
    };
  }

  if ((protocolId == IrProtocolIds.sony12 ||
          protocolId == IrProtocolIds.sony15 ||
          protocolId == IrProtocolIds.sony20) &&
      addrId != null &&
      cmdId != null) {
    final int bits;
    final int addrBits;
    if (protocolId == IrProtocolIds.sony12) {
      bits = 12;
      addrBits = 5;
    } else if (protocolId == IrProtocolIds.sony15) {
      bits = 15;
      addrBits = 8;
    } else {
      bits = 20;
      addrBits = 13;
    }
    const int cmdBits = 7;

    final int data = int.parse(hex, radix: 16) & ((1 << bits) - 1);
    final int cmd = data & ((1 << cmdBits) - 1);
    final int addr = (data >> cmdBits) & ((1 << addrBits) - 1);

    final addrField = _findFieldById(def, addrId);
    final cmdField = _findFieldById(def, cmdId);
    final int addrDigits =
        (addrField == null) ? ((addrBits + 3) ~/ 4) : (_expectedHexDigits(addrField) ?? ((addrBits + 3) ~/ 4));
    final int cmdDigits =
        (cmdField == null) ? ((cmdBits + 3) ~/ 4) : (_expectedHexDigits(cmdField) ?? ((cmdBits + 3) ~/ 4));

    String addrVal = addr.toRadixString(16).toUpperCase().padLeft(addrDigits, '0');
    String cmdVal = cmd.toRadixString(16).toUpperCase().padLeft(cmdDigits, '0');
    if (addrField != null && _wantsSpacedBytes(addrField)) addrVal = _formatBytesSpaced(addrVal);
    if (cmdField != null && _wantsSpacedBytes(cmdField)) cmdVal = _formatBytesSpaced(cmdVal);

    return <String, String>{
      addrId: addrVal,
      cmdId: cmdVal,
    };
  }

  if (addrId != null && cmdId != null) {
    final addrField = _findFieldById(def, addrId);
    final cmdField = _findFieldById(def, cmdId);

    final int aDigits = addrField == null ? 2 : (_expectedHexDigits(addrField) ?? 2);
    final int cDigits = cmdField == null ? 2 : (_expectedHexDigits(cmdField) ?? 2);
    final int totalDigits = aDigits + cDigits;
    final String splitHex = (hex.length < totalDigits) ? hex.padLeft(totalDigits, '0') : hex;

    String addrVal = '';
    String cmdVal = '';

    if (splitHex.length >= totalDigits) {
      final bool looksLikeInvertedLayout =
          (aDigits == cDigits) && (splitHex.length == totalDigits * 2);

      if (looksLikeInvertedLayout) {
        addrVal = splitHex.substring(0, aDigits);
        final int cmdOff = 2 * aDigits;
        if (splitHex.length >= cmdOff + cDigits) {
          cmdVal = splitHex.substring(cmdOff, cmdOff + cDigits);
        } else {
          cmdVal = splitHex.substring(aDigits, aDigits + cDigits);
        }
      } else {
        addrVal = splitHex.substring(0, aDigits);
        cmdVal = splitHex.substring(aDigits, aDigits + cDigits);
      }
    }

    if (addrVal.isNotEmpty || cmdVal.isNotEmpty) {
      if (addrField != null && _wantsSpacedBytes(addrField)) addrVal = _formatBytesSpaced(addrVal);
      if (cmdField != null && _wantsSpacedBytes(cmdField)) cmdVal = _formatBytesSpaced(cmdVal);
      return <String, String>{
        if (addrVal.isNotEmpty) addrId: addrVal,
        if (cmdVal.isNotEmpty) cmdId: cmdVal,
      };
    }
  }

  if (hexId != null) {
    final f = _findFieldById(def, hexId);
    int? maxDigits = f == null ? null : _expectedHexDigits(f);

    String val = hex;
    if (maxDigits != null && maxDigits > 0 && val.length > maxDigits) {
      val = val.substring(val.length - maxDigits);
    }

    if (f != null && _wantsSpacedBytes(f)) {
      val = _formatBytesSpaced(val);
    }

    return <String, String>{hexId: val};
  }

  for (final f in def.fields) {
    if (!f.required) continue;
    if (f.type != IrFieldType.string) continue;
    if (!_fieldLooksHexLike(f)) continue;

    int? maxDigits = _expectedHexDigits(f);
    String val = hex;
    if (maxDigits != null && maxDigits > 0 && val.length > maxDigits) {
      val = val.substring(val.length - maxDigits);
    }
    if (_wantsSpacedBytes(f)) val = _formatBytesSpaced(val);
    return <String, String>{f.id: val};
  }

  return const <String, String>{};
}
