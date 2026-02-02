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
    frequency: null,
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
  return k == 'nec' || k.startsWith('nec');
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
    final hint = (f.hint ?? '').trim();
    final hintDigits = _cleanHex(hint).length;
    if (hintDigits > 0) return hintDigits;

    final ml = f.maxLength;
    if (ml != null && ml > 0) {
      if (ml <= 2) return ml;
      if (ml == 4 || ml == 6 || ml == 8) return ml;
      if (ml == 11) return 8;
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
    final String last6 = hex.length >= 6 ? hex.substring(hex.length - 6) : hex.padLeft(6, '0');
    final int v = int.parse(last6, radix: 16) & 0xFFFFFF;
    final String addrNib = (v & 0xF).toRadixString(16).toUpperCase();
    final String cmdByte = ((v >> 4) & 0xFF).toRadixString(16).padLeft(2, '0').toUpperCase();
    return <String, String>{
      addrId: addrNib,
      cmdId: cmdByte,
    };
  }

  if (addrId != null && cmdId != null) {
    final addrField = _findFieldById(def, addrId);
    final cmdField = _findFieldById(def, cmdId);

    final int aDigits = addrField == null ? 2 : (_expectedHexDigits(addrField) ?? 2);
    final int cDigits = cmdField == null ? 2 : (_expectedHexDigits(cmdField) ?? 2);

    String addrVal = '';
    String cmdVal = '';

    if (hex.length >= aDigits + cDigits) {
      final int totalDigits = aDigits + cDigits;
      final bool looksLikeInvertedLayout = (aDigits == cDigits) && (hex.length == totalDigits * 2);

      if (looksLikeInvertedLayout) {
        addrVal = hex.substring(0, aDigits);
        final int cmdOff = 2 * aDigits;
        if (hex.length >= cmdOff + cDigits) {
          cmdVal = hex.substring(cmdOff, cmdOff + cDigits);
        } else {
          cmdVal = hex.substring(aDigits, aDigits + cDigits);
        }
      } else {
        addrVal = hex.substring(0, aDigits);
        cmdVal = hex.substring(aDigits, aDigits + cDigits);
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
