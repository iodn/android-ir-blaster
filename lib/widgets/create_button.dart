// ./lib/widgets/create_button.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/ir/ir_protocol_types.dart';
import 'package:irblaster_controller/ir_finder/irblaster_db.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/code_test.dart';
import 'package:irblaster_controller/widgets/icon_picker.dart';
import 'package:uuid/uuid.dart';

enum _LabelType { image, text, icon }
enum _SignalType { hex, raw, protocol }
enum _NecBitOrder { msb, lsb }
enum _DbPreset { power, volume, channel, navigation, all }

class CreateButton extends StatefulWidget {
  final IRButton? button;
  const CreateButton({super.key, this.button});

  @override
  State<CreateButton> createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> {
  static const int _kHelperMaxLines = 4;
  static const int _kHintMaxLines = 2;
  static const int _kErrorMaxLines = 3;

  late final String _buttonId;

  final TextEditingController codeController = TextEditingController();
  final TextEditingController hexFreqController = TextEditingController();
  final TextEditingController rawDataController = TextEditingController();
  final TextEditingController freqController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController headerMarkCtrl =
      TextEditingController(text: NECParams.defaults.headerMark.toString());
  final TextEditingController headerSpaceCtrl =
      TextEditingController(text: NECParams.defaults.headerSpace.toString());
  final TextEditingController bitMarkCtrl =
      TextEditingController(text: NECParams.defaults.bitMark.toString());
  final TextEditingController zeroSpaceCtrl =
      TextEditingController(text: NECParams.defaults.zeroSpace.toString());
  final TextEditingController oneSpaceCtrl =
      TextEditingController(text: NECParams.defaults.oneSpace.toString());
  final TextEditingController trailerMarkCtrl =
      TextEditingController(text: NECParams.defaults.trailerMark.toString());

  final TextEditingController protoFreqController = TextEditingController();

  bool _tabDatabase = false;

  String? _dbBrand;
  String? _dbModel;
  String? _dbProtocol;
  List<String> _dbProtocols = <String>[];

  final TextEditingController _dbSearchCtl = TextEditingController();
  final ScrollController _dbScrollCtl = ScrollController();

  bool _dbInit = false;
  bool _dbMetaLoading = false;
  bool _dbLoading = false;
  bool _dbExhausted = false;
  int _dbOffset = 0;
  List<IrDbKeyCandidate> _dbRows = <IrDbKeyCandidate>[];
  IrDbKeyCandidate? _dbSelected;

  final Map<String, TextEditingController> _protoControllers =
      <String, TextEditingController>{};

  _LabelType _labelType = _LabelType.image;
  _SignalType _signalType = _SignalType.hex;

  bool useCustomNec = false;
  _NecBitOrder _necBitOrder = _NecBitOrder.msb;

  String _selectedProtocolId = IrProtocolIds.nec;

  Widget? _imagePreview;
  String? _imagePath;

  IconData? _selectedIcon;
  Color? _selectedColor;

  bool _didAttachListeners = false;

  _DbPreset _dbPreset = _DbPreset.power;

  @override
  void initState() {
    super.initState();

    _buttonId = widget.button?.id ?? const Uuid().v4();
    hexFreqController.text = kDefaultNecFrequencyHz.toString();

    _dbScrollCtl.addListener(_onDbScroll);

    if (widget.button != null) {
      final b = widget.button!;
      final hasRaw = b.rawData != null && b.rawData!.trim().isNotEmpty;

      if (b.iconCodePoint != null) {
        _labelType = _LabelType.icon;
        _selectedIcon = IconData(
          b.iconCodePoint!,
          fontFamily: b.iconFontFamily,
        );
      } else if (b.isImage) {
        _labelType = _LabelType.image;
        _imagePath = b.image;
        if (_imagePath!.startsWith("assets")) {
          _imagePreview = Image.asset(_imagePath!, fit: BoxFit.contain);
        } else {
          _imagePreview = Image.file(File(_imagePath!), fit: BoxFit.contain);
        }
      } else {
        _labelType = _LabelType.text;
        nameController.text = b.image;
      }

      if (b.buttonColor != null) {
        _selectedColor = Color(b.buttonColor!);
      }

      if (b.protocol != null && b.protocol!.trim().isNotEmpty) {
        final normalized = b.protocol!.trim();
        _selectedProtocolId = normalized;
        if (IrProtocolRegistry.definitionFor(_selectedProtocolId) == null) {
          _selectedProtocolId = IrProtocolIds.nec;
        }
        _signalType = _SignalType.protocol;
        _selectedProtocolId = b.protocol!.trim();
        if (b.frequency != null && b.frequency! > 0) {
          protoFreqController.text = b.frequency!.toString();
        }
        final normalizedParams = _normalizeImportedProtocolParams(
          _selectedProtocolId,
          b.protocolParams ?? const <String, dynamic>{},
          legacyCode: b.code,
        );

        _syncProtocolControllersFromDefinition(normalizedParams);

        // If params were empty or incomplete, try deriving from legacy code as a last step
        if ((b.protocolParams == null || b.protocolParams!.isEmpty) && b.code != null) {
          final hexFallback = b.code!.toRadixString(16).toUpperCase();
          _fillProtocolFieldsFromDbHex(hexFallback);
        }
      } else if (hasRaw && isNecConfigString(b.rawData)) {
        _signalType = _SignalType.hex;
        useCustomNec = true;
        if (b.code != null) {
          codeController.text = b.code!.toRadixString(16);
        }
        if (b.frequency != null && b.frequency! > 0) {
          hexFreqController.text = b.frequency!.toString();
        } else {
          hexFreqController.text = kDefaultNecFrequencyHz.toString();
        }
        final params = parseNecParamsFromString(b.rawData!);
        headerMarkCtrl.text = params.headerMark.toString();
        headerSpaceCtrl.text = params.headerSpace.toString();
        bitMarkCtrl.text = params.bitMark.toString();
        zeroSpaceCtrl.text = params.zeroSpace.toString();
        oneSpaceCtrl.text = params.oneSpace.toString();
        trailerMarkCtrl.text = params.trailerMark.toString();
        _necBitOrder =
            ((b.necBitOrder ?? 'msb').toLowerCase() == 'lsb') ? _NecBitOrder.lsb : _NecBitOrder.msb;
      } else if (hasRaw) {
        _signalType = _SignalType.raw;
        rawDataController.text = b.rawData!;
        freqController.text = (b.frequency ?? kDefaultNecFrequencyHz).toString();
      } else if (b.code != null) {
        _signalType = _SignalType.hex;
        useCustomNec = false;
        codeController.text = b.code!.toRadixString(16);
        hexFreqController.text = kDefaultNecFrequencyHz.toString();
      }
    } else {
      _syncProtocolControllersFromDefinition(const <String, dynamic>{});
    }

    _attachListenersOnce();
  }

  @override
  void dispose() {
    _dbSearchCtl.dispose();
    _dbScrollCtl.dispose();

    codeController.dispose();
    hexFreqController.dispose();
    rawDataController.dispose();
    freqController.dispose();
    nameController.dispose();

    headerMarkCtrl.dispose();
    headerSpaceCtrl.dispose();
    bitMarkCtrl.dispose();
    zeroSpaceCtrl.dispose();
    oneSpaceCtrl.dispose();
    trailerMarkCtrl.dispose();

    protoFreqController.dispose();

    for (final c in _protoControllers.values) {
      c.dispose();
    }

    super.dispose();
  }

  void _attachListenersOnce() {
    if (_didAttachListeners) return;
    _didAttachListeners = true;

    void onChanged() {
      if (mounted) setState(() {});
    }

    codeController.addListener(onChanged);
    hexFreqController.addListener(onChanged);
    rawDataController.addListener(onChanged);
    freqController.addListener(onChanged);
    nameController.addListener(onChanged);

    headerMarkCtrl.addListener(onChanged);
    headerSpaceCtrl.addListener(onChanged);
    bitMarkCtrl.addListener(onChanged);
    zeroSpaceCtrl.addListener(onChanged);
    oneSpaceCtrl.addListener(onChanged);
    trailerMarkCtrl.addListener(onChanged);

    protoFreqController.addListener(onChanged);
  }

  String get _screenTitle => widget.button == null ? "Create Button" : "Edit Button";

  bool get _hasLabel {
    if (_labelType == _LabelType.image) return _imagePath != null;
    if (_labelType == _LabelType.icon) return _selectedIcon != null;
    return nameController.text.trim().isNotEmpty;
  }

  bool get _hexLooksValid {
    if (_signalType != _SignalType.hex) return true;
    final v = codeController.text.trim();
    if (v.isEmpty) return false;
    final parsed = int.tryParse(v, radix: 16);
    return parsed != null;
  }

  bool get _rawLooksValid {
    if (_signalType != _SignalType.raw) return true;
    if (rawDataController.text.trim().isEmpty) return false;
    if (freqController.text.trim().isEmpty) return false;

    final f = int.tryParse(freqController.text.trim());
    if (f == null) return false;
    if (f < kMinIrFrequencyHz || f > kMaxIrFrequencyHz) return false;

    final parts = rawDataController.text
        .trim()
        .split(RegExp(r'\s+'))
        .where((e) => e.isNotEmpty)
        .toList();
    if (parts.isEmpty) return false;
    for (final p in parts) {
      if (int.tryParse(p) == null) return false;
    }
    return true;
  }

  bool get _customNecLooksValid {
    if (_signalType != _SignalType.hex) return true;
    if (!useCustomNec) return true;

    final allNumeric = [
      headerMarkCtrl.text,
      headerSpaceCtrl.text,
      bitMarkCtrl.text,
      zeroSpaceCtrl.text,
      oneSpaceCtrl.text,
      trailerMarkCtrl.text,
    ].every((t) => int.tryParse(t.trim()) != null);

    if (!allNumeric) return false;

    final freqText = hexFreqController.text.trim();
    if (freqText.isEmpty) return false;

    final f = int.tryParse(freqText);
    if (f == null) return false;
    if (f < kMinIrFrequencyHz || f > kMaxIrFrequencyHz) return false;

    return true;
  }

  bool get _protocolLooksValid {
    if (_signalType != _SignalType.protocol) return true;

    if (_selectedProtocolId.trim().isEmpty) return false;

    final freqText = protoFreqController.text.trim();
    if (freqText.isNotEmpty) {
      final f = int.tryParse(freqText);
      if (f == null) return false;
      if (f < kMinIrFrequencyHz || f > kMaxIrFrequencyHz) return false;
    }

    final def = IrProtocolRegistry.definitionFor(_selectedProtocolId);
    if (def == null) return false;

    for (final field in def.fields) {
      if (!field.required) continue;
      final c = _protoControllers[field.id];
      if (c == null) return false;
      final t = c.text.trim();
      if (t.isEmpty) return false;

      if (field.type == IrFieldType.intDecimal) {
        if (int.tryParse(t) == null) return false;
      } else if (field.type == IrFieldType.intHex) {
        if (int.tryParse(t, radix: 16) == null) return false;
      } else if (field.type == IrFieldType.choice) {
        if (!field.options.contains(t)) return false;
      }
    }

    return true;
  }

  bool get _canSave => _hasLabel && _hexLooksValid && _rawLooksValid && _customNecLooksValid && _protocolLooksValid;

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  static bool _coerceBool(dynamic v) {
    if (v is bool) return v;
    if (v is int) return v != 0;
    if (v is String) {
      final s = v.trim().toLowerCase();
      if (s == 'true' || s == '1' || s == 'yes' || s == 'y') return true;
      if (s == 'false' || s == '0' || s == 'no' || s == 'n') return false;
    }
    return false;
  }

  String _cleanHex(String input) {
    return input.replaceAll(RegExp(r'[^0-9a-fA-F]'), '').toUpperCase();
  }

  bool _fieldLooksHexLike(IrFieldDef f) {
    final s = ('${f.id} ${f.label} ${f.hint ?? ''} ${f.helperText ?? ''}').toLowerCase();
    return s.contains('hex') ||
        s.contains('byte') ||
        s.contains('address') ||
        s.contains('command') ||
        s.contains('cmd') ||
        s.contains('code') ||
        s.contains('value');
  }

  int? _expectedHexDigits(IrFieldDef f) {
    if (f.type == IrFieldType.intHex) {
      return f.maxLength;
    }

    if (f.type == IrFieldType.string) {
      final hint = (f.hint ?? '').trim();
      final hintDigits = _cleanHex(hint).length;
      if (hintDigits > 0) return hintDigits;

      final ml = f.maxLength;
      if (ml != null && ml > 0) {
        // Some fields include spaces in maxLength (e.g., "AA BB CC DD" = 11 chars).
        // If hint is missing, best-effort:
        if (ml <= 2) return ml; // 1 byte / nibble
        if (ml == 4 || ml == 6 || ml == 8) return ml;
        if (ml == 11) return 8; // Kaseikyo style
      }
    }

    return null;
  }

  bool _wantsSpacedBytes(IrFieldDef f) {
    final hint = (f.hint ?? '').trim();
    if (hint.isEmpty) return false;
    // Detect "AA BB CC DD" style
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

    // Special: RCA (24-bit packed) -> address nibble + command byte
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

    // Address + Command protocols (most common mapping)
    if (addrId != null && cmdId != null) {
      final addrField = _findFieldById(def, addrId);
      final cmdField = _findFieldById(def, cmdId);

      final int aDigits = addrField == null ? 2 : (_expectedHexDigits(addrField) ?? 2);
      final int cDigits = cmdField == null ? 2 : (_expectedHexDigits(cmdField) ?? 2);

      String addrVal = '';
      String cmdVal = '';

      if (hex.length >= aDigits + cDigits) {
        // If payload is address + inv + cmd + inv (like Pioneer/Samsung family)
        // and both fields are same width, prefer extracting [addr][cmd] from positions 0 and 2*aDigits.
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
          // Default sequential split
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

    // Single HEX-like field (Denon/JVC/Proton/RC5/RC6/F12/NEC variants/etc)
    if (hexId != null) {
      final f = _findFieldById(def, hexId);
      int? maxDigits = f == null ? null : _expectedHexDigits(f);

      String val = hex;
      if (maxDigits != null && maxDigits > 0 && val.length > maxDigits) {
        // Prefer last N digits for better compatibility with RC5(3), Denon(4), JVC(4), etc.
        val = val.substring(val.length - maxDigits);
      }

      if (f != null && _wantsSpacedBytes(f)) {
        val = _formatBytesSpaced(val);
      }

      return <String, String>{hexId: val};
    }

    // Last resort: fill the first required string field if it looks hex-like
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

  Map<String, dynamic> _normalizeImportedProtocolParams(
    String protocolId,
    Map<String, dynamic> params, {
    int? legacyCode,
  }) {
    final def = IrProtocolRegistry.definitionFor(protocolId);
    if (def == null) return params;

    final Map<String, dynamic> out = <String, dynamic>{};
    final Map<String, dynamic> norm = <String, dynamic>{};

    for (final e in params.entries) {
      norm[_normalizeProtoKey(e.key)] = e.value;
    }

    for (final f in def.fields) {
      final String nkId = _normalizeProtoKey(f.id);
      final String nkLabel = _normalizeProtoKey(f.label);
      dynamic v = norm[nkId] ?? norm[nkLabel];
      if (v != null) out[f.id] = v;
    }

    // If params were missing or not matched, try fallback from common "hex/code/value" keys
    if (out.isEmpty) {
      dynamic vHex = norm['hex'] ?? norm['code'] ?? norm['value'] ?? norm['data'] ?? norm['hexcode'];
      String? hexCandidate;

      if (vHex is int) {
        hexCandidate = vHex.toRadixString(16).toUpperCase();
      } else if (vHex is String) {
        hexCandidate = vHex;
      }

      // Or fallback from legacy saved `button.code`
      hexCandidate ??= (legacyCode != null) ? legacyCode.toRadixString(16).toUpperCase() : null;

      if (hexCandidate != null && hexCandidate.trim().isNotEmpty) {
        final derived = _deriveProtocolFieldTextFromHex(protocolId, hexCandidate);
        for (final kv in derived.entries) {
          out[kv.key] = kv.value;
        }
      }
    }

    return out;
  }


  void _syncProtocolControllersFromDefinition(Map<String, dynamic> existingParams) {
    final def = IrProtocolRegistry.definitionFor(_selectedProtocolId);

    _protoControllers.forEach((_, c) => c.dispose());
    _protoControllers.clear();

    if (def == null) return;

    for (final field in def.fields) {
      final c = TextEditingController();

      dynamic v = existingParams[field.id];
      v ??= field.defaultValue;

      if (v == null && field.type == IrFieldType.choice && field.options.isNotEmpty) {
        v = field.options.first;
      }

      if (v != null) {
        if (field.type == IrFieldType.intHex) {
          if (v is int) {
            c.text = v.toRadixString(16).toUpperCase();
          } else {
            c.text = v.toString().trim();
          }
        } else if (field.type == IrFieldType.boolean) {
          c.text = _coerceBool(v).toString();
        } else if (field.type == IrFieldType.string && _fieldLooksHexLike(field)) {
          // Critical fix: most protocols store "hex/address/command" as STRING fields
          if (v is int) {
            final int? digits = _expectedHexDigits(field);
            String hx = v.toRadixString(16).toUpperCase();
            if (digits != null && digits > 0) {
              hx = hx.padLeft(digits, '0');
            }
            c.text = _wantsSpacedBytes(field) ? _formatBytesSpaced(hx) : hx;
          } else {
            final s = v.toString().trim();
            final cleaned = _cleanHex(s);
            if (cleaned.isEmpty) {
              c.text = s;
            } else {
              int? digits = _expectedHexDigits(field);
              String hx = cleaned;
              if (digits != null && digits > 0 && hx.length > digits) {
                hx = hx.substring(hx.length - digits);
              }
              c.text = _wantsSpacedBytes(field) ? _formatBytesSpaced(hx) : hx;
            }
          }
        } else {
          c.text = v.toString();
        }
      }

      c.addListener(() {
        if (mounted) setState(() {});
      });

      _protoControllers[field.id] = c;
    }
  }


  Future<void> _pasteInto(TextEditingController controller, {bool hexOnly = false}) async {
    final data = await Clipboard.getData('text/plain');
    final text = data?.text;
    if (text == null || text.trim().isEmpty) return;

    if (hexOnly) {
      final cleaned = text.replaceAll(RegExp(r'[^0-9a-fA-F]'), '');
      controller.text = cleaned;
    } else {
      controller.text = text.trim();
    }
  }

  Future<void> _pickImageFromGallery() async {
    final value = await getImage();
    if (!mounted) return;
    if (value == null) return;

    final fimg = File(value);
    setState(() {
      _imagePath = value;
      _imagePreview = Image.file(fimg, fit: BoxFit.contain);
    });
  }

  Future<void> _pickImageFromAssets() async {
    final picked = await showModalBottomSheet<String>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Choose a built-in icon', style: Theme.of(ctx).textTheme.titleMedium),
              const SizedBox(height: 12),
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: defaultImages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (ctx2, index) {
                    final path = defaultImages[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => Navigator.of(ctx).pop(path),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(path, fit: BoxFit.contain),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (!mounted) return;
    if (picked == null) return;

    setState(() {
      _imagePath = picked;
      _imagePreview = Image.asset(picked, fit: BoxFit.contain);
    });
  }

  void _clearImage() {
    setState(() {
      _imagePath = null;
      _imagePreview = null;
    });
  }

  Future<void> _pickIcon() async {
    final picked = await showDialog<IconData>(
      context: context,
      builder: (context) => IconPicker(initialIcon: _selectedIcon),
    );

    if (!mounted) return;
    if (picked == null) return;

    setState(() {
      _selectedIcon = picked;
    });
  }

  void _clearIcon() {
    setState(() {
      _selectedIcon = null;
    });
  }

  Widget _sectionHeader(String title, {String? subtitle, IconData? icon}) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20, color: theme.colorScheme.primary),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text, {IconData? icon}) {
    return Chip(
      visualDensity: VisualDensity.compact,
      avatar: icon == null ? null : Icon(icon, size: 16),
      label: Text(text),
    );
  }

  Widget _colorOption(Color? color, String label, ThemeData theme) {
    final isSelected = _selectedColor == color;
    final displayColor = color ?? theme.colorScheme.surfaceContainerHighest;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 60,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: displayColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outline,
                  width: isSelected ? 3 : 1,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: color == null
                          ? theme.colorScheme.onSurface
                          : Colors.white,
                      size: 20,
                    )
                  : null,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSignalSummaryChips() {
    final List<Widget> chips = [];

    if (_signalType == _SignalType.hex) {
      chips.add(_chip('HEX / NEC', icon: Icons.numbers));
      if (useCustomNec) {
        chips.add(_chip('Custom timings', icon: Icons.tune));
        chips.add(_chip(_necBitOrder == _NecBitOrder.lsb ? 'LSB' : 'MSB', icon: Icons.swap_horiz));
        final f = int.tryParse(hexFreqController.text.trim());
        if (f != null && f > 0) {
          chips.add(_chip('${(f / 1000).round()} kHz', icon: Icons.waves));
        }
      } else {
        chips.add(_chip('Default 38 kHz', icon: Icons.waves));
        chips.add(_chip('MSB (compat)', icon: Icons.swap_horiz));
      }
    } else if (_signalType == _SignalType.raw) {
      chips.add(_chip('RAW', icon: Icons.graphic_eq));
      final f = int.tryParse(freqController.text.trim());
      if (f != null && f > 0) {
        chips.add(_chip('${(f / 1000).round()} kHz', icon: Icons.waves));
      }
    } else {
      final name = IrProtocolRegistry.displayName(_selectedProtocolId);
      chips.add(_chip('PROTOCOL', icon: Icons.tune));
      chips.add(_chip(name, icon: Icons.settings_remote_outlined));
      final implemented = IrProtocolRegistry.isImplemented(_selectedProtocolId);
      if (!implemented) {
        chips.add(_chip('Not implemented', icon: Icons.hourglass_empty));
      }
      final f = int.tryParse(protoFreqController.text.trim());
      if (f != null && f > 0) {
        chips.add(_chip('${(f / 1000).round()} kHz', icon: Icons.waves));
      }
    }

    return chips;
  }

  IRButton _draftButtonForPreview() {
    final String labelValue = (_labelType == _LabelType.image) ? (_imagePath ?? '') : nameController.text.trim();

    if (_signalType == _SignalType.hex) {
      final int parsedHex = int.tryParse(codeController.text.trim(), radix: 16) ?? 0;

      String? rawDataForNec;
      int? freqForNec;
      String? bitOrder;

      if (useCustomNec) {
        final hMark = int.tryParse(headerMarkCtrl.text.trim()) ?? NECParams.defaults.headerMark;
        final hSpace = int.tryParse(headerSpaceCtrl.text.trim()) ?? NECParams.defaults.headerSpace;
        final bMark = int.tryParse(bitMarkCtrl.text.trim()) ?? NECParams.defaults.bitMark;
        final zSpace = int.tryParse(zeroSpaceCtrl.text.trim()) ?? NECParams.defaults.zeroSpace;
        final oSpace = int.tryParse(oneSpaceCtrl.text.trim()) ?? NECParams.defaults.oneSpace;
        final tMark = int.tryParse(trailerMarkCtrl.text.trim()) ?? NECParams.defaults.trailerMark;

        rawDataForNec = "NEC:h=$hMark,$hSpace;b=$bMark,$zSpace,$oSpace;t=$tMark";
        freqForNec = int.tryParse(hexFreqController.text.trim()) ?? kDefaultNecFrequencyHz;
        bitOrder = (_necBitOrder == _NecBitOrder.lsb) ? 'lsb' : 'msb';
      }

      return IRButton(
        id: _buttonId,
        code: parsedHex,
        rawData: rawDataForNec,
        frequency: rawDataForNec != null ? freqForNec : null,
        image: labelValue,
        isImage: _labelType == _LabelType.image,
        necBitOrder: bitOrder,
        iconCodePoint: _labelType == _LabelType.icon ? _selectedIcon?.codePoint : null,
        iconFontFamily: _labelType == _LabelType.icon ? _selectedIcon?.fontFamily : null,
        buttonColor: _selectedColor?.value,
      );
    }

    if (_signalType == _SignalType.raw) {
      final int freq = int.tryParse(freqController.text.trim()) ?? kDefaultNecFrequencyHz;
      return IRButton(
        id: _buttonId,
        code: null,
        rawData: rawDataController.text.trim(),
        frequency: freq,
        image: labelValue,
        isImage: _labelType == _LabelType.image,
        iconCodePoint: _labelType == _LabelType.icon ? _selectedIcon?.codePoint : null,
        iconFontFamily: _labelType == _LabelType.icon ? _selectedIcon?.fontFamily : null,
        buttonColor: _selectedColor?.value,
      );
    }

    final def = IrProtocolRegistry.definitionFor(_selectedProtocolId);
    final Map<String, dynamic> params = <String, dynamic>{};

    if (def != null) {
      for (final field in def.fields) {
        final c = _protoControllers[field.id];
        if (c == null) continue;

        final t = c.text.trim();
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
    }

    final int? f = protoFreqController.text.trim().isEmpty ? null : int.tryParse(protoFreqController.text.trim());

    return IRButton(
      id: _buttonId,
      code: null,
      rawData: null,
      frequency: f,
      image: labelValue,
      isImage: _labelType == _LabelType.image,
      protocol: _selectedProtocolId,
      protocolParams: params,
      iconCodePoint: _labelType == _LabelType.icon ? _selectedIcon?.codePoint : null,
      iconFontFamily: _labelType == _LabelType.icon ? _selectedIcon?.fontFamily : null,
      buttonColor: _selectedColor?.value,
    );
  }

  Future<void> _dbEnsureReady() async {
    if (_dbInit) return;

    setState(() => _dbMetaLoading = true);
    try {
      await IrBlasterDb.instance.ensureInitialized();
      _dbInit = true;
    } finally {
      if (mounted) setState(() => _dbMetaLoading = false);
    }
  }

  void _onDbScroll() {
    if (!_tabDatabase) return;
    if (_dbLoading || _dbExhausted) return;
    if (!_dbScrollCtl.hasClients) return;

    if (_dbScrollCtl.position.pixels >= _dbScrollCtl.position.maxScrollExtent - 240) {
      _dbReloadKeys(reset: false);
    }
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

  String _dbPresetToQuery(_DbPreset preset) {
    switch (preset) {
      case _DbPreset.power:
        return 'power';
      case _DbPreset.volume:
        return 'vol';
      case _DbPreset.channel:
        return 'ch';
      case _DbPreset.navigation:
        return 'menu';
      case _DbPreset.all:
        return '';
    }
  }

  String _dbEffectiveSearch() {
    final manual = _dbSearchCtl.text.trim();
    if (manual.isNotEmpty) return manual;
    return _dbPresetToQuery(_dbPreset);
  }

  String _dbPresetTitle(_DbPreset preset) {
    switch (preset) {
      case _DbPreset.power:
        return 'Power';
      case _DbPreset.volume:
        return 'Volume';
      case _DbPreset.channel:
        return 'Channel';
      case _DbPreset.navigation:
        return 'Navigation';
      case _DbPreset.all:
        return 'All';
    }
  }

  IconData _dbPresetIcon(_DbPreset preset) {
    switch (preset) {
      case _DbPreset.power:
        return Icons.power_settings_new_rounded;
      case _DbPreset.volume:
        return Icons.volume_up_rounded;
      case _DbPreset.channel:
        return Icons.live_tv_rounded;
      case _DbPreset.navigation:
        return Icons.gamepad_rounded;
      case _DbPreset.all:
        return Icons.list_alt_rounded;
    }
  }

  Future<void> _dbLoadProtocolsForSelection() async {
    if (_dbBrand == null || _dbModel == null) return;

    setState(() {
      _dbMetaLoading = true;
      _dbProtocols = <String>[];
      _dbProtocol = null;
      _dbSelected = null;
    });

    try {
      await _dbEnsureReady();

      final prots = await IrBlasterDb.instance.listProtocolsFor(
        brand: _dbBrand!,
        model: _dbModel!,
      );

      setState(() {
        _dbProtocols = prots;
        _dbProtocol = prots.isNotEmpty ? prots.first : null;
      });
    } catch (e) {
      if (mounted) _showSnack("Failed to load protocols: $e");
    } finally {
      if (mounted) setState(() => _dbMetaLoading = false);
    }
  }

  Future<void> _dbReloadKeys({required bool reset}) async {
    if (_dbBrand == null || _dbModel == null) return;
    if (_dbProtocol == null || _dbProtocol!.trim().isEmpty) return;
    if (_dbLoading || _dbExhausted) return;

    if (reset) {
      setState(() {
        _dbOffset = 0;
        _dbRows.clear();
        _dbExhausted = false;
        _dbSelected = null;
      });
    }

    setState(() => _dbLoading = true);

    try {
      await _dbEnsureReady();

      final search = _dbEffectiveSearch();

      final rows = await IrBlasterDb.instance.fetchCandidateKeys(
        brand: _dbBrand!,
        model: _dbModel!,
        selectedProtocolId: _dbProtocol,
        quickWinsFirst: true,
        hexPrefixUpper: null,
        search: search,
        limit: 60,
        offset: _dbOffset,
      );

      setState(() {
        _dbRows.addAll(rows);
        _dbOffset += rows.length;
        if (rows.isEmpty) _dbExhausted = true;
      });
    } catch (e) {
      if (mounted) _showSnack("Failed to load database keys: $e");
    } finally {
      if (mounted) setState(() => _dbLoading = false);
    }
  }

  Future<String?> _pickBrand(BuildContext context) async {
    await IrBlasterDb.instance.ensureInitialized();

    String? selected;
    int offset = 0;
    final items = <String>[];
    bool alive = true;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        final ctl = TextEditingController();
        final scrollCtl = ScrollController();
        bool loading = false;
        bool exhausted = false;

        Future<void> load(StateSetter setModal, {required bool reset}) async {
          if (!alive) return;
          if (loading) return;

          setModal(() => loading = true);

          try {
            if (reset) {
              offset = 0;
              exhausted = false;
              items.clear();
            }

            final next = await IrBlasterDb.instance.listBrands(
              search: ctl.text.trim(),
              limit: 60,
              offset: offset,
            );

            if (!alive) return;

            items.addAll(next);
            offset += next.length;
            if (next.isEmpty) exhausted = true;

            setModal(() {});
          } finally {
            if (!alive) return;
            setModal(() => loading = false);
          }
        }

        void onScroll(StateSetter setModal) {
          if (loading || exhausted) return;
          if (scrollCtl.position.pixels >= scrollCtl.position.maxScrollExtent - 240) {
            load(setModal, reset: false);
          }
        }

        return StatefulBuilder(
          builder: (ctx2, setModal) {
            if (!scrollCtl.hasListeners) {
              scrollCtl.addListener(() => onScroll(setModal));
              load(setModal, reset: true);
            }

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Select brand',
                            style: Theme.of(ctx2).textTheme.titleLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            alive = false;
                            Navigator.of(ctx2).pop();
                          },
                          icon: const Icon(Icons.close_rounded),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: ctl,
                      decoration: const InputDecoration(
                        hintText: 'Search brand…',
                        prefixIcon: Icon(Icons.search_rounded),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => load(setModal, reset: true),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                        controller: scrollCtl,
                        itemCount: items.length + (loading ? 1 : 0),
                        separatorBuilder: (_, __) => const Divider(height: 0),
                        itemBuilder: (ctx3, i) {
                          if (i >= items.length) {
                            return const Padding(
                              padding: EdgeInsets.all(14),
                              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                            );
                          }
                          final b = items[i];
                          return ListTile(
                            title: Text(b),
                            onTap: () {
                              selected = b;
                              alive = false;
                              Navigator.of(ctx2).pop();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    alive = false;
    return selected;
  }

  Future<String?> _pickModel(BuildContext context, {required String brand}) async {
    await IrBlasterDb.instance.ensureInitialized();

    String? selected;
    int offset = 0;
    final items = <String>[];
    bool alive = true;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        final ctl = TextEditingController();
        final scrollCtl = ScrollController();
        bool loading = false;
        bool exhausted = false;

        Future<void> load(StateSetter setModal, {required bool reset}) async {
          if (!alive) return;
          if (loading) return;

          setModal(() => loading = true);

          try {
            if (reset) {
              offset = 0;
              exhausted = false;
              items.clear();
            }

            final next = await IrBlasterDb.instance.listModelsDistinct(
              brand: brand,
              search: ctl.text.trim(),
              limit: 60,
              offset: offset,
            );

            if (!alive) return;

            items.addAll(next);
            offset += next.length;
            if (next.isEmpty) exhausted = true;

            setModal(() {});
          } finally {
            if (!alive) return;
            setModal(() => loading = false);
          }
        }

        void onScroll(StateSetter setModal) {
          if (loading || exhausted) return;
          if (scrollCtl.position.pixels >= scrollCtl.position.maxScrollExtent - 240) {
            load(setModal, reset: false);
          }
        }

        return StatefulBuilder(
          builder: (ctx2, setModal) {
            if (!scrollCtl.hasListeners) {
              scrollCtl.addListener(() => onScroll(setModal));
              load(setModal, reset: true);
            }

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Select model',
                            style: Theme.of(ctx2).textTheme.titleLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            alive = false;
                            Navigator.of(ctx2).pop();
                          },
                          icon: const Icon(Icons.close_rounded),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: ctl,
                      decoration: const InputDecoration(
                        hintText: 'Search model…',
                        prefixIcon: Icon(Icons.search_rounded),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => load(setModal, reset: true),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                        controller: scrollCtl,
                        itemCount: items.length + (loading ? 1 : 0),
                        separatorBuilder: (_, __) => const Divider(height: 0),
                        itemBuilder: (ctx3, i) {
                          if (i >= items.length) {
                            return const Padding(
                              padding: EdgeInsets.all(14),
                              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                            );
                          }
                          final m = items[i];
                          return ListTile(
                            title: Text(m),
                            onTap: () {
                              selected = m;
                              alive = false;
                              Navigator.of(ctx2).pop();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    alive = false;
    return selected;
  }

  Future<void> _dbSelectBrand() async {
    await _dbEnsureReady();

    final b = await _pickBrand(context);
    if (b == null) return;

    setState(() {
      _dbBrand = b;
      _dbModel = null;
      _dbProtocols = <String>[];
      _dbProtocol = null;

      _dbSearchCtl.clear();
      _dbRows.clear();

      _dbSelected = null;
      _dbOffset = 0;
      _dbExhausted = false;

      _dbPreset = _DbPreset.power;
    });
  }

  Future<void> _dbSelectModel() async {
    await _dbEnsureReady();
    if (_dbBrand == null) return;

    final m = await _pickModel(context, brand: _dbBrand!);
    if (m == null) return;

    setState(() {
      _dbModel = m;
      _dbProtocols = <String>[];
      _dbProtocol = null;

      _dbSearchCtl.clear();
      _dbRows.clear();

      _dbSelected = null;
      _dbOffset = 0;
      _dbExhausted = false;

      _dbPreset = _DbPreset.power;
    });

    await _dbLoadProtocolsForSelection();
    await _dbReloadKeys(reset: true);
  }

  Future<void> _dbSelectProtocol(String p) async {
    if (_dbBrand == null || _dbModel == null) return;

    setState(() {
      _dbProtocol = p;
      _dbRows.clear();
      _dbSelected = null;
      _dbOffset = 0;
      _dbExhausted = false;
    });

    await _dbReloadKeys(reset: true);
  }

  Future<void> _dbSetPreset(_DbPreset preset) async {
    if (_dbBrand == null || _dbModel == null) return;
    if (_dbProtocol == null || _dbProtocol!.trim().isEmpty) return;

    setState(() {
      _dbPreset = preset;
      _dbRows.clear();
      _dbSelected = null;
      _dbOffset = 0;
      _dbExhausted = false;
    });

    await _dbReloadKeys(reset: true);
  }

  bool _idLooksLike(IrFieldDef f, String needle) {
    final id = f.id.toLowerCase().trim();
    final label = f.label.toLowerCase().trim();
    return id == needle || id.contains(needle) || label.contains(needle);
  }

  void _fillProtocolFieldsFromDbHex(String hexClean) {
    final def = IrProtocolRegistry.definitionFor(_selectedProtocolId);
    if (def == null) return;

    final derived = _deriveProtocolFieldTextFromHex(_selectedProtocolId, hexClean);
    if (derived.isNotEmpty) {
      for (final e in derived.entries) {
        final c = _protoControllers[e.key];
        if (c != null) c.text = e.value;
      }
      return;
    }

    // Fallback: previous heuristic, but now include string fields too
    final hex = _cleanHex(hexClean);
    if (hex.isEmpty) return;

    IrFieldDef? addr;
    IrFieldDef? cmd;

    for (final f in def.fields) {
      if (addr == null && _idLooksLike(f, 'address')) addr = f;
      if (cmd == null && (_idLooksLike(f, 'command') || _idLooksLike(f, 'cmd'))) cmd = f;
    }

    if (addr != null && cmd != null) {
      final addrCtl = _protoControllers[addr.id];
      final cmdCtl = _protoControllers[cmd.id];
      if (addrCtl != null && cmdCtl != null) {
        final int aDigits = _expectedHexDigits(addr) ?? 2;
        final int cDigits = _expectedHexDigits(cmd) ?? 2;

        if (hex.length >= aDigits + cDigits) {
          String aVal = '';
          String cVal = '';

          final bool invertedLayout = (aDigits == cDigits) && (hex.length == (aDigits + cDigits) * 2);
          if (invertedLayout) {
            aVal = hex.substring(0, aDigits);
            final int cmdOff = 2 * aDigits;
            if (hex.length >= cmdOff + cDigits) {
              cVal = hex.substring(cmdOff, cmdOff + cDigits);
            } else {
              cVal = hex.substring(aDigits, aDigits + cDigits);
            }
          } else {
            aVal = hex.substring(0, aDigits);
            cVal = hex.substring(aDigits, aDigits + cDigits);
          }

          addrCtl.text = _wantsSpacedBytes(addr) ? _formatBytesSpaced(aVal) : aVal;
          cmdCtl.text = _wantsSpacedBytes(cmd) ? _formatBytesSpaced(cVal) : cVal;
          return;
        }
      }
    }

    // Find best single hex-like field (string OR intHex)
    IrFieldDef? target;
    for (final f in def.fields) {
      if (_idLooksLike(f, 'hex') || _idLooksLike(f, 'code') || _idLooksLike(f, 'value')) {
        target = f;
        break;
      }
    }
    target ??= def.fields.isNotEmpty ? def.fields.first : null;
    if (target == null) return;

    final c = _protoControllers[target.id];
    if (c == null) return;

    int? maxDigits = _expectedHexDigits(target);
    String v = hex;
    if (maxDigits != null && maxDigits > 0 && v.length > maxDigits) {
      v = v.substring(v.length - maxDigits);
    }

    c.text = _wantsSpacedBytes(target) ? _formatBytesSpaced(v) : v;
  }


  Future<void> _dbUseSelectedKey() async {
    final sel = _dbSelected;
    if (sel == null) return;

    final protoDb = (sel.protocol ?? '').trim();
    final hexClean = sel.hexcode.replaceAll(' ', '').toUpperCase();
    final labelTrim = (sel.label ?? '').trim();

    setState(() {
      if (_labelType == _LabelType.text && nameController.text.trim().isEmpty) {
        nameController.text = labelTrim;
      } else {
        if (nameController.text.trim().isEmpty && labelTrim.isNotEmpty) {
          nameController.text = labelTrim;
        }
      }
      _tabDatabase = false;
    });

    if (protoDb.isEmpty) {
      setState(() {
        _signalType = _SignalType.hex;
        codeController.text = hexClean;
      });
      _showSnack('Protocol missing in database row. Imported as HEX.');
      if (!_hasLabel) {
        _showSnack('Step 1 still requires a label (icon or text).');
      }
      return;
    }

    if (_dbProtocolIsNec(protoDb)) {
      setState(() {
        _signalType = _SignalType.hex;
        codeController.text = hexClean;
      });
      if (!_hasLabel) {
        _showSnack('IR code imported. Step 1 still requires a label (icon or text).');
      } else {
        _showSnack('Imported from database.');
      }
      return;
    }

    final mapped = _mapDbProtocolToAppProtocolId(protoDb);
    if (mapped == null) {
      setState(() {
        _signalType = _SignalType.hex;
        codeController.text = hexClean;
      });
      _showSnack('Protocol "$protoDb" is not mapped. Imported as HEX. You can adjust in Manual.');
      return;
    }

    setState(() {
      _signalType = _SignalType.protocol;
      _selectedProtocolId = mapped;
      _syncProtocolControllersFromDefinition(const <String, dynamic>{});
    });

    final def = IrProtocolRegistry.definitionFor(_selectedProtocolId);
    if (def != null) {
      _fillProtocolFieldsFromDbHex(hexClean);
      _showSnack('Imported from database.');
    } else {
      _showSnack('Imported protocol "$protoDb", but no field definition exists. Please configure manually.');
    }

    if (!_hasLabel) {
      _showSnack('Step 1 still requires a label (icon or text).');
    }
  }

  Widget _dbField({
    required String label,
    required IconData icon,
    required String value,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: enabled ? onTap : null,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
          enabled: enabled,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: value.startsWith('Select') ? FontWeight.w500 : FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: theme.colorScheme.onSurface.withValues(alpha: enabled ? 0.75 : 0.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDbPresetBar({required bool enabled}) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    Widget chip(_DbPreset p) {
      final selected = _dbPreset == p;
      return ChoiceChip(
        selected: selected,
        showCheckmark: false,
        label: Text(_dbPresetTitle(p)),
        avatar: Icon(_dbPresetIcon(p), size: 18),
        onSelected: enabled
            ? (v) {
                if (!v) return;
                _dbSetPreset(p);
              }
            : null,
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.flash_on_rounded, color: cs.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Quick presets',
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              if (!enabled)
                Text(
                  'Select device first',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.65),
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Start with common keys. Tap “All” for the full list.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: cs.onSurface.withValues(alpha: 0.78),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              chip(_DbPreset.power),
              chip(_DbPreset.volume),
              chip(_DbPreset.channel),
              chip(_DbPreset.navigation),
              chip(_DbPreset.all),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDbTab() {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final bool hasBrand = (_dbBrand != null && _dbBrand!.trim().isNotEmpty);
    final bool hasModel = (_dbModel != null && _dbModel!.trim().isNotEmpty);
    final bool hasProtocol = (_dbProtocol != null && _dbProtocol!.trim().isNotEmpty);
    final bool canBrowseKeys = hasBrand && hasModel && hasProtocol;

    final String effectiveSearch = _dbEffectiveSearch();

    final String searchHint = canBrowseKeys
        ? (_dbSearchCtl.text.trim().isNotEmpty
            ? 'Search by label or hex…'
            : (_dbPreset == _DbPreset.all
                ? 'Search by label or hex…'
                : 'Optional: refine “${_dbPresetTitle(_dbPreset)}” keys…'))
        : 'Select Brand + Model + Protocol first';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: cs.surfaceContainerHighest.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.8)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.auto_awesome, color: cs.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Database mode auto-fills Step 2 for you (brand + model + protocol). After importing a key, you can refine anything in Manual.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.8),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        if (_dbMetaLoading) ...[
          const LinearProgressIndicator(minHeight: 2),
          const SizedBox(height: 12),
        ],
        Row(
          children: [
            Expanded(
              child: _dbField(
                label: 'Brand',
                icon: Icons.factory_outlined,
                value: hasBrand ? _dbBrand! : 'Select brand',
                enabled: true,
                onTap: _dbSelectBrand,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _dbField(
                label: 'Model',
                icon: Icons.devices_other_outlined,
                value: hasModel ? _dbModel! : 'Select model',
                enabled: hasBrand,
                onTap: _dbSelectModel,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (hasBrand && hasModel) ...[
          if (_dbProtocols.isEmpty && !_dbMetaLoading) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cs.secondaryContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'No protocol found for this Brand/Model.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: cs.onSecondaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ] else ...[
            DropdownButtonFormField<String>(
              value: _dbProtocol,
              isExpanded: true,
              items: _dbProtocols
                  .map((p) => DropdownMenuItem<String>(
                        value: p,
                        child: Text(p),
                      ))
                  .toList(growable: false),
              onChanged: (v) {
                if (v == null) return;
                _dbSelectProtocol(v);
              },
              decoration: const InputDecoration(
                labelText: 'Protocol (auto detected)',
                border: OutlineInputBorder(),
                helperText: 'Auto-selected from the database for this device.',
                helperMaxLines: _kHelperMaxLines,
              ),
            ),
          ],
          const SizedBox(height: 12),
        ],
        _buildDbPresetBar(enabled: canBrowseKeys),
        const SizedBox(height: 12),
        TextField(
          controller: _dbSearchCtl,
          enabled: canBrowseKeys,
          decoration: InputDecoration(
            hintText: searchHint,
            prefixIcon: const Icon(Icons.search_rounded),
            border: const OutlineInputBorder(),
            suffixIcon: (!canBrowseKeys || _dbSearchCtl.text.trim().isEmpty)
                ? null
                : IconButton(
                    tooltip: 'Clear',
                    onPressed: () {
                      setState(() => _dbSearchCtl.clear());
                      _dbReloadKeys(reset: true);
                    },
                    icon: const Icon(Icons.clear),
                  ),
          ),
          onChanged: (_) {
            if (!canBrowseKeys) return;
            _dbReloadKeys(reset: true);
          },
        ),
        const SizedBox(height: 10),
        Container(
          constraints: const BoxConstraints(minHeight: 120, maxHeight: 360),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.8)),
          ),
          child: !canBrowseKeys
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      'Select Brand and Model to load the device protocol and available keys.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                )
              : (_dbRows.isEmpty && _dbLoading)
                  ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
                  : (_dbRows.isEmpty)
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              effectiveSearch.isEmpty
                                  ? 'No keys found.'
                                  : 'No keys found for “$effectiveSearch”.\nTry a different preset or search term.',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: cs.onSurface.withValues(alpha: 0.7),
                              ),
                            ),
                          ),
                        )
                      : ListView.separated(
                          controller: _dbScrollCtl,
                          itemCount: _dbRows.length + (_dbLoading ? 1 : 0),
                          separatorBuilder: (_, __) => const Divider(height: 0),
                          itemBuilder: (ctx, i) {
                            if (i >= _dbRows.length) {
                              return const Padding(
                                padding: EdgeInsets.all(14),
                                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                              );
                            }

                            final r = _dbRows[i];

                            final bool selected = (_dbSelected?.remoteId == r.remoteId) &&
                                (_dbSelected?.hexcode == r.hexcode) &&
                                (_dbSelected?.label == r.label);

                            final String titleText =
                                (r.label ?? '').trim().isEmpty ? 'Unnamed key' : (r.label ?? '').trim();
                            final String protoText =
                                (r.protocol ?? '').trim().isEmpty ? 'Unknown' : (r.protocol ?? '').trim();
                            final String hexText = r.hexcode.trim().isEmpty ? '—' : r.hexcode.trim();

                            return ListTile(
                              selected: selected,
                              leading: Icon(
                                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                                color: selected ? cs.primary : cs.onSurface.withValues(alpha: 0.5),
                              ),
                              title: Text(titleText),
                              subtitle: Text('$hexText · $protoText'),
                              trailing: IconButton(
                                tooltip: 'Copy',
                                icon: const Icon(Icons.copy_rounded),
                                onPressed: () => Clipboard.setData(
                                  ClipboardData(text: '$protoText:$hexText'),
                                ),
                              ),
                              onTap: () => setState(() => _dbSelected = r),
                            );
                          },
                        ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _dbSelected == null ? null : () => setState(() => _dbSelected = null),
                icon: const Icon(Icons.clear),
                label: const Text('Clear selection'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: _dbSelected == null ? null : _dbUseSelectedKey,
                icon: const Icon(Icons.download_done_rounded),
                label: const Text('Import key'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHexSection() {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: codeController,
          maxLength: 8,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 18,
            letterSpacing: 1.1,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9a-fA-F]")),
          ],
          decoration: InputDecoration(
            labelText: 'Hex code (NEC)',
            helperText: '8 hex digits (example: 00F700FF).',
            helperMaxLines: _kHelperMaxLines,
            hintMaxLines: _kHintMaxLines,
            errorText: (_signalType == _SignalType.hex && !_hexLooksValid) ? 'Enter a valid hex code.' : null,
            errorMaxLines: _kErrorMaxLines,
            suffixIcon: SizedBox(
              width: 144,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    tooltip: 'Paste',
                    onPressed: () => _pasteInto(codeController, hexOnly: true),
                    icon: const Icon(Icons.content_paste_outlined),
                  ),
                  IconButton(
                    tooltip: 'Finder',
                    onPressed: () async {
                      try {
                        final String a = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CodeTest(
                              code: codeController.value.text.padLeft(8, '0'),
                            ),
                          ),
                        );
                        codeController.text = a.replaceAll(" ", "");
                      } catch (_) {}
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Legacy NEC behavior remains unchanged for existing saved buttons.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
          ),
        ),
      ],
    );
  }

  Widget _buildNecAdvancedSection() {
    final theme = Theme.of(context);

    final bitOrderSegments = <ButtonSegment<_NecBitOrder>>[
      const ButtonSegment(
        value: _NecBitOrder.msb,
        label: Text('MSB'),
        icon: Icon(Icons.check_circle_outline),
      ),
      const ButtonSegment(
        value: _NecBitOrder.lsb,
        label: Text('LSB'),
        icon: Icon(Icons.swap_horiz),
      ),
    ];

    return ExpansionTile(
      initiallyExpanded: useCustomNec,
      title: const Text('Advanced (optional)'),
      subtitle: Text(
        useCustomNec ? 'Custom NEC timings and carrier frequency' : 'Use defaults unless a device requires custom timings',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
        ),
      ),
      childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Use custom NEC timings"),
          subtitle: const Text("Stores a NEC:... config and transmits as raw with the chosen frequency."),
          value: useCustomNec,
          onChanged: (v) => setState(() => useCustomNec = v),
        ),
        if (!useCustomNec) ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Defaults: 38 kHz carrier, standard NEC timings, MSB-first over stored value (compat).',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
              ),
            ),
          ),
        ],
        if (useCustomNec) ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Bit order',
              style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerLeft,
            child: SegmentedButton<_NecBitOrder>(
              segments: bitOrderSegments,
              selected: {_necBitOrder},
              onSelectionChanged: (s) => setState(() => _necBitOrder = s.first),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: hexFreqController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: "Frequency (Hz)",
              helperText: "Carrier frequency, e.g. 38000",
              helperMaxLines: _kHelperMaxLines,
              hintMaxLines: _kHintMaxLines,
              errorText: !_customNecLooksValid ? 'Enter a valid frequency (15k–60k).' : null,
              errorMaxLines: _kErrorMaxLines,
              suffixIcon: IconButton(
                tooltip: 'Reset to 38000',
                onPressed: () => setState(() => hexFreqController.text = kDefaultNecFrequencyHz.toString()),
                icon: const Icon(Icons.restart_alt),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _timingsGrid(),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "MSB mode is kept for compatibility with existing stored codes. Switch to LSB if your stored hex is in natural order for your device.",
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _timingsGrid() {
    Widget numField(TextEditingController c, String label, String hint) {
      return TextField(
        controller: c,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintMaxLines: _kHintMaxLines,
        ),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: numField(headerMarkCtrl, "Header Mark (µs)", "9000")),
            const SizedBox(width: 10),
            Expanded(child: numField(headerSpaceCtrl, "Header Space (µs)", "4500")),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: numField(bitMarkCtrl, "Bit Mark (µs)", "560")),
            const SizedBox(width: 10),
            Expanded(child: numField(zeroSpaceCtrl, "0 Space (µs)", "560")),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: numField(oneSpaceCtrl, "1 Space (µs)", "1690")),
            const SizedBox(width: 10),
            Expanded(child: numField(trailerMarkCtrl, "Trailer Mark (µs)", "560")),
          ],
        ),
      ],
    );
  }

  Widget _buildRawSection() {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: freqController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: "Frequency (Hz)",
            helperText: "Required. Example: 38000",
            helperMaxLines: _kHelperMaxLines,
            hintMaxLines: _kHintMaxLines,
            errorText: (_signalType == _SignalType.raw && !_rawLooksValid) ? 'Enter a valid frequency (15k–60k).' : null,
            errorMaxLines: _kErrorMaxLines,
            suffixIcon: IconButton(
              tooltip: 'Reset to 38000',
              onPressed: () => setState(() => freqController.text = '38000'),
              icon: const Icon(Icons.restart_alt),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: rawDataController,
          maxLines: 4,
          decoration: InputDecoration(
            labelText: "Raw data",
            helperText: "Space-separated integers, e.g. 9000 4500 560 560 ...",
            helperMaxLines: _kHelperMaxLines,
            hintMaxLines: _kHintMaxLines,
            errorText: (_signalType == _SignalType.raw && !_rawLooksValid)
                ? 'Raw data must be integers separated by spaces/newlines.'
                : null,
            errorMaxLines: _kErrorMaxLines,
            suffixIcon: IconButton(
              tooltip: 'Paste',
              onPressed: () => _pasteInto(rawDataController),
              icon: const Icon(Icons.content_paste_outlined),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Safeguard: invalid tokens are blocked to prevent saving a non-sendable pattern.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
          ),
        ),
      ],
    );
  }

  Widget _buildProtocolSection() {
    final theme = Theme.of(context);

    final defs = IrProtocolRegistry.allDefinitions();
    final def = IrProtocolRegistry.definitionFor(_selectedProtocolId);
    final bool implemented = IrProtocolRegistry.isImplemented(_selectedProtocolId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: _selectedProtocolId,
          isExpanded: true,
          items: defs
              .map(
                (d) => DropdownMenuItem<String>(
                  value: d.id,
                  child: Text(d.displayName),
                ),
              )
              .toList(growable: false),
          onChanged: (v) {
            if (v == null) return;
            setState(() {
              _selectedProtocolId = v;
              _syncProtocolControllersFromDefinition(const <String, dynamic>{});
            });
          },
          decoration: InputDecoration(
            labelText: 'Protocol',
            helperText: 'Encoding is implemented only for protocols marked as implemented.',
            helperMaxLines: _kHelperMaxLines,
            hintMaxLines: _kHintMaxLines,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: protoFreqController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: 'Frequency (Hz)',
            helperText: 'Optional. If empty, protocol default is used where available.',
            helperMaxLines: _kHelperMaxLines,
            hintMaxLines: _kHintMaxLines,
            errorText: (_signalType == _SignalType.protocol && !_protocolLooksValid)
                ? 'Fill required fields and ensure frequency is 15k–60k if set.'
                : null,
            errorMaxLines: _kErrorMaxLines,
            suffixIcon: IconButton(
              tooltip: 'Clear',
              onPressed: () => setState(() => protoFreqController.clear()),
              icon: const Icon(Icons.clear),
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (!implemented) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Registered only. Transmit will show "Not implemented yet" until encoding is added.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
        if (def != null) ...[
          for (final field in def.fields) ...[
            _buildProtocolField(field),
            const SizedBox(height: 10),
          ],
        ],
      ],
    );
  }

  Widget _buildProtocolField(IrFieldDef field) {
    final c = _protoControllers.putIfAbsent(field.id, () {
      final ctrl = TextEditingController();
      ctrl.addListener(() {
        if (mounted) setState(() {});
      });
      return ctrl;
    });

    if (field.type == IrFieldType.choice) {
      final opts = field.options;

      String? current = c.text.trim().isEmpty ? null : c.text.trim();
      if (current == null || !opts.contains(current)) {
        final dynamic dv = field.defaultValue;
        final String? fallback =
            (dv is String && opts.contains(dv)) ? dv : (opts.isNotEmpty ? opts.first : null);

        if (fallback != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            final now = c.text.trim();
            if (now.isEmpty || !opts.contains(now)) {
              c.text = fallback;
            }
          });
          current = fallback;
        }
      }

      String? errorText;
      if (_signalType == _SignalType.protocol && field.required) {
        final val = (current ?? '').trim();
        if (val.isEmpty) {
          errorText = 'Required';
        } else if (!opts.contains(val)) {
          errorText = 'Invalid selection';
        }
      }

      return DropdownButtonFormField<String>(
        value: (current != null && opts.contains(current)) ? current : null,
        isExpanded: true,
        items: opts
            .map(
              (o) => DropdownMenuItem<String>(
                value: o,
                child: Text(o),
              ),
            )
            .toList(growable: false),
        onChanged: (v) {
          if (v == null) return;
          setState(() => c.text = v);
        },
        decoration: InputDecoration(
          labelText: field.label,
          helperText: field.helperText,
          helperMaxLines: _kHelperMaxLines,
          hintMaxLines: _kHintMaxLines,
          errorText: errorText,
          errorMaxLines: _kErrorMaxLines,
          suffixIcon: (!field.required && c.text.trim().isNotEmpty)
              ? IconButton(
                  tooltip: 'Clear',
                  onPressed: () => setState(() => c.clear()),
                  icon: const Icon(Icons.clear),
                )
              : null,
        ),
      );
    }

    if (field.type == IrFieldType.boolean) {
      final bool value = _coerceBool(c.text.trim().isEmpty ? field.defaultValue : c.text);
      return SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(field.label),
        subtitle: field.helperText == null ? null : Text(field.helperText!),
        value: value,
        onChanged: (v) => setState(() => c.text = v.toString()),
      );
    }

    final bool isHex = field.type == IrFieldType.intHex;
    final bool isDec = field.type == IrFieldType.intDecimal;

    List<TextInputFormatter>? formatters;
    TextInputType? keyboard;

    if (isHex) {
      formatters = [FilteringTextInputFormatter.allow(RegExp(r'[0-9a-fA-F]'))];
      keyboard = TextInputType.text;
    } else if (isDec) {
      formatters = [FilteringTextInputFormatter.digitsOnly];
      keyboard = TextInputType.number;
    } else {
      keyboard = TextInputType.text;
    }

    String? errorText;
    final t = c.text.trim();

    if (_signalType == _SignalType.protocol && field.required && t.isEmpty) {
      errorText = 'Required';
    } else if (_signalType == _SignalType.protocol && t.isNotEmpty) {
      if (isDec && int.tryParse(t) == null) errorText = 'Must be a number';
      if (isHex && int.tryParse(t, radix: 16) == null) errorText = 'Must be hex';

      if (errorText == null && (isDec || isHex)) {
        final int? n = isHex ? int.tryParse(t, radix: 16) : int.tryParse(t);
        if (n != null) {
          if (field.min != null && n < field.min!) errorText = 'Min: ${field.min}';
          if (field.max != null && n > field.max!) errorText = 'Max: ${field.max}';
        }
      }
    }

    return TextField(
      controller: c,
      maxLines: field.maxLines ?? 1,
      maxLength: field.maxLength,
      inputFormatters: formatters,
      keyboardType: keyboard,
      decoration: InputDecoration(
        labelText: field.label,
        hintText: field.hint,
        hintMaxLines: _kHintMaxLines,
        helperText: field.helperText,
        helperMaxLines: _kHelperMaxLines,
        errorText: errorText,
        errorMaxLines: _kErrorMaxLines,
        suffixIcon: t.isEmpty
            ? null
            : IconButton(
                tooltip: 'Clear',
                onPressed: () => setState(() => c.clear()),
                icon: const Icon(Icons.clear),
              ),
      ),
    );
  }

  void _onSavePressed() {
    FocusScope.of(context).unfocus();

    if (!_hasLabel) {
      String message;
      if (_labelType == _LabelType.image) {
        message = "Please select an image, or switch to Icon/Text.";
      } else if (_labelType == _LabelType.icon) {
        message = "Please select an icon, or switch to Image/Text.";
      } else {
        message = "Please enter a label.";
      }
      _showSnack(message);
      return;
    }

    final String labelValue = (_labelType == _LabelType.image)
        ? (_imagePath ?? '')
        : (_labelType == _LabelType.icon)
            ? ''
            : nameController.text.trim();

    if (_signalType == _SignalType.hex) {
      if (codeController.text.trim().isEmpty) {
        _showSnack("Hex code cannot be empty.");
        return;
      }

      final parsedHex = int.tryParse(codeController.text.trim(), radix: 16);
      if (parsedHex == null) {
        _showSnack("Hex code is invalid.");
        return;
      }

      if (useCustomNec) {
        final allNumeric = [
          headerMarkCtrl.text,
          headerSpaceCtrl.text,
          bitMarkCtrl.text,
          zeroSpaceCtrl.text,
          oneSpaceCtrl.text,
          trailerMarkCtrl.text,
        ].every((t) => int.tryParse(t.trim()) != null);

        if (!allNumeric) {
          _showSnack("All NEC timings must be numeric.");
          return;
        }

        final f = int.tryParse(hexFreqController.text.trim());
        if (f == null || f < kMinIrFrequencyHz || f > kMaxIrFrequencyHz) {
          _showSnack("Frequency must be 15k–60k Hz.");
          return;
        }
      }

      String? rawDataForNec;
      int? freqForNec;
      String? bitOrder;

      if (useCustomNec) {
        final hMark = int.tryParse(headerMarkCtrl.text.trim()) ?? NECParams.defaults.headerMark;
        final hSpace = int.tryParse(headerSpaceCtrl.text.trim()) ?? NECParams.defaults.headerSpace;
        final bMark = int.tryParse(bitMarkCtrl.text.trim()) ?? NECParams.defaults.bitMark;
        final zSpace = int.tryParse(zeroSpaceCtrl.text.trim()) ?? NECParams.defaults.zeroSpace;
        final oSpace = int.tryParse(oneSpaceCtrl.text.trim()) ?? NECParams.defaults.oneSpace;
        final tMark = int.tryParse(trailerMarkCtrl.text.trim()) ?? NECParams.defaults.trailerMark;

        rawDataForNec = "NEC:h=$hMark,$hSpace;b=$bMark,$zSpace,$oSpace;t=$tMark";
        freqForNec = int.tryParse(hexFreqController.text.trim()) ?? kDefaultNecFrequencyHz;
        bitOrder = (_necBitOrder == _NecBitOrder.lsb) ? 'lsb' : 'msb';
      }

      final button = IRButton(
        id: _buttonId,
        code: parsedHex,
        rawData: rawDataForNec,
        frequency: rawDataForNec != null ? freqForNec : null,
        image: labelValue,
        isImage: _labelType == _LabelType.image,
        necBitOrder: bitOrder,
        iconCodePoint: _labelType == _LabelType.icon ? _selectedIcon?.codePoint : null,
        iconFontFamily: _labelType == _LabelType.icon ? _selectedIcon?.fontFamily : null,
        buttonColor: _selectedColor?.value,
      );

      Navigator.pop(context, button);
      return;
    }

    if (_signalType == _SignalType.raw) {
      if (!_rawLooksValid) {
        _showSnack("Raw data must be integers separated by spaces/newlines, and frequency must be 15k–60k.");
        return;
      }

      final int freq = int.parse(freqController.text.trim());

      final button = IRButton(
        id: _buttonId,
        code: null,
        rawData: rawDataController.text.trim(),
        frequency: freq,
        image: labelValue,
        isImage: _labelType == _LabelType.image,
        iconCodePoint: _labelType == _LabelType.icon ? _selectedIcon?.codePoint : null,
        iconFontFamily: _labelType == _LabelType.icon ? _selectedIcon?.fontFamily : null,
        buttonColor: _selectedColor?.value,
      );

      Navigator.pop(context, button);
      return;
    }

    if (_signalType == _SignalType.protocol) {
      if (!_protocolLooksValid) {
        _showSnack("Fill required protocol fields and ensure frequency is 15k–60k if set.");
        return;
      }

      final def = IrProtocolRegistry.definitionFor(_selectedProtocolId);
      if (def == null) {
        _showSnack("Unknown protocol selected.");
        return;
      }

      final Map<String, dynamic> params = <String, dynamic>{};

      for (final field in def.fields) {
        final c = _protoControllers[field.id];
        if (c == null) continue;

        final t = c.text.trim();
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

      final int? f = protoFreqController.text.trim().isEmpty ? null : int.tryParse(protoFreqController.text.trim());

      final button = IRButton(
        id: _buttonId,
        code: null,
        rawData: null,
        frequency: f,
        image: labelValue,
        isImage: _labelType == _LabelType.image,
        protocol: _selectedProtocolId,
        protocolParams: params,
        iconCodePoint: _labelType == _LabelType.icon ? _selectedIcon?.codePoint : null,
        iconFontFamily: _labelType == _LabelType.icon ? _selectedIcon?.fontFamily : null,
        buttonColor: _selectedColor?.value,
      );

      Navigator.pop(context, button);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final labelSegments = <ButtonSegment<_LabelType>>[
      const ButtonSegment(
        value: _LabelType.image,
        label: Text('Image'),
        icon: Icon(Icons.image_outlined),
      ),
      const ButtonSegment(
        value: _LabelType.text,
        label: Text('Text'),
        icon: Icon(Icons.text_fields),
      ),
      const ButtonSegment(
        value: _LabelType.icon,
        label: Text('Icon'),
        icon: Icon(Icons.emoji_symbols_outlined),
      ),
    ];

    final signalSegments = <ButtonSegment<_SignalType>>[
      const ButtonSegment(
        value: _SignalType.hex,
        label: Text('Hex (NEC)'),
        icon: Icon(Icons.numbers),
      ),
      const ButtonSegment(
        value: _SignalType.raw,
        label: Text('Raw timings'),
        icon: Icon(Icons.graphic_eq),
      ),
      const ButtonSegment(
        value: _SignalType.protocol,
        label: Text('Protocol'),
        icon: Icon(Icons.tune),
      ),
    ];

    IrPreview? preview;
    String? previewError;

    try {
      if ((_signalType == _SignalType.hex && _hexLooksValid && _customNecLooksValid) ||
          (_signalType == _SignalType.raw && _rawLooksValid) ||
          (_signalType == _SignalType.protocol && _protocolLooksValid)) {
        preview = previewIRButton(_draftButtonForPreview());
      }
    } catch (e) {
      previewError = e.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
        actions: [
          IconButton(
            tooltip: _canSave ? 'Save' : 'Complete required fields to save',
            onPressed: _canSave ? _onSavePressed : null,
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                label: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: _canSave ? _onSavePressed : null,
                icon: const Icon(Icons.save),
                label: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            _sectionHeader(
              '1) Button label',
              subtitle: 'Choose an image, icon, or type a text label.',
              icon: Icons.label_outline,
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SegmentedButton<_LabelType>(
                        segments: labelSegments,
                        selected: {_labelType},
                        onSelectionChanged: (s) {
                          final next = s.first;
                          setState(() {
                            _labelType = next;
                            if (_labelType == _LabelType.text) {
                              _clearImage();
                              _clearIcon();
                            } else if (_labelType == _LabelType.icon) {
                              _clearImage();
                            } else if (_labelType == _LabelType.image) {
                              _clearIcon();
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (_labelType == _LabelType.image) ...[
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
                          border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.8)),
                        ),
                        child: Center(
                          child: _imagePreview ??
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add_photo_alternate_outlined,
                                    size: 40,
                                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'No image selected',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                                    ),
                                  ),
                                ],
                              ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: _pickImageFromGallery,
                              icon: const Icon(Icons.photo_library_outlined),
                              label: const Text('Gallery'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FilledButton.tonalIcon(
                              onPressed: _pickImageFromAssets,
                              icon: const Icon(Icons.grid_view_outlined),
                              label: const Text('Built-in'),
                            ),
                          ),
                        ],
                      ),
                      if (_imagePath != null) ...[
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: _clearImage,
                            icon: const Icon(Icons.delete_outline),
                            label: const Text('Remove image'),
                          ),
                        ),
                      ],
                      if (!_hasLabel) ...[
                        const SizedBox(height: 6),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Required: select an image, choose an icon, or switch to Text.',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.error,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ] else if (_labelType == _LabelType.icon) ...[
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
                          border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.8)),
                        ),
                        child: Center(
                          child: _selectedIcon != null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      IconData(
                                        _selectedIcon!.codePoint,
                                        fontFamily: _selectedIcon!.fontFamily,
                                      ),
                                      size: 64,
                                      color: theme.colorScheme.primary,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Icon selected',
                                      style: theme.textTheme.bodySmall?.copyWith(
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.emoji_symbols_outlined,
                                      size: 40,
                                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'No icon selected',
                                      style: theme.textTheme.bodySmall?.copyWith(
                                        color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: _pickIcon,
                        icon: const Icon(Icons.apps),
                        label: const Text('Choose Icon'),
                      ),
                      if (_selectedIcon != null) ...[
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: _clearIcon,
                            icon: const Icon(Icons.delete_outline),
                            label: const Text('Remove icon'),
                          ),
                        ),
                      ],
                      if (!_hasLabel) ...[
                        const SizedBox(height: 6),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Required: select an icon or switch to Image/Text.',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.error,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ] else ...[
                      TextField(
                        controller: nameController,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Button text',
                          hintText: 'e.g., Power, Volume +, HDMI 1',
                          helperText: 'This text will appear on the button.',
                          helperMaxLines: _kHelperMaxLines,
                          hintMaxLines: _kHintMaxLines,
                          suffixIcon: nameController.text.trim().isEmpty
                              ? null
                              : IconButton(
                                  tooltip: 'Clear',
                                  onPressed: () => nameController.clear(),
                                  icon: const Icon(Icons.clear),
                                ),
                        ),
                      ),
                      if (!_hasLabel) ...[
                        const SizedBox(height: 6),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Required: enter a button label.',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.error,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ),
            _sectionHeader(
              '2) Button color (optional)',
              subtitle: 'Choose a background color for this button.',
              icon: Icons.palette_outlined,
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select color:',
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _colorOption(null, 'Default', theme),
                        _colorOption(Colors.red, 'Red', theme),
                        _colorOption(Colors.pink, 'Pink', theme),
                        _colorOption(Colors.purple, 'Purple', theme),
                        _colorOption(Colors.deepPurple, 'Deep Purple', theme),
                        _colorOption(Colors.indigo, 'Indigo', theme),
                        _colorOption(Colors.blue, 'Blue', theme),
                        _colorOption(Colors.lightBlue, 'Light Blue', theme),
                        _colorOption(Colors.cyan, 'Cyan', theme),
                        _colorOption(Colors.teal, 'Teal', theme),
                        _colorOption(Colors.green, 'Green', theme),
                        _colorOption(Colors.lightGreen, 'Light Green', theme),
                        _colorOption(Colors.lime, 'Lime', theme),
                        _colorOption(Colors.yellow, 'Yellow', theme),
                        _colorOption(Colors.amber, 'Amber', theme),
                        _colorOption(Colors.orange, 'Orange', theme),
                        _colorOption(Colors.deepOrange, 'Deep Orange', theme),
                        _colorOption(Colors.brown, 'Brown', theme),
                        _colorOption(Colors.grey, 'Grey', theme),
                        _colorOption(Colors.blueGrey, 'Blue Grey', theme),
                        _colorOption(Colors.black, 'Black', theme),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _sectionHeader(
              '3) IR signal',
              subtitle: 'Manual entry or database import.',
              icon: Icons.settings_remote_outlined,
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SegmentedButton<bool>(
                        segments: const [
                          ButtonSegment(value: false, label: Text('Manual'), icon: Icon(Icons.tune)),
                          ButtonSegment(value: true, label: Text('Database'), icon: Icon(Icons.storage_rounded)),
                        ],
                        selected: {_tabDatabase},
                        onSelectionChanged: (s) {
                          final next = s.first;
                          setState(() => _tabDatabase = next);
                          if (next) {
                            _dbEnsureReady();
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (_tabDatabase) ...[
                      _buildDbTab(),
                    ] else ...[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SegmentedButton<_SignalType>(
                          segments: signalSegments,
                          selected: {_signalType},
                          onSelectionChanged: (s) {
                            final next = s.first;
                            setState(() {
                              _signalType = next;
                              if (next == _SignalType.protocol) {
                                if (_protoControllers.isEmpty) {
                                  _syncProtocolControllersFromDefinition(
                                    widget.button?.protocolParams ?? const <String, dynamic>{},
                                  );
                                }
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _buildSignalSummaryChips(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 0),
                      const SizedBox(height: 12),
                      if (_signalType == _SignalType.hex) ...[
                        _buildHexSection(),
                        const SizedBox(height: 10),
                        _buildNecAdvancedSection(),
                      ] else if (_signalType == _SignalType.raw) ...[
                        _buildRawSection(),
                      ] else ...[
                        _buildProtocolSection(),
                      ],
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            _sectionHeader(
              '3) Preview & test',
              subtitle: 'Review the generated timings and transmit once without saving.',
              icon: Icons.visibility_outlined,
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (previewError != null) ...[
                      Text(
                        previewError,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.error,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                    if (preview != null) ...[
                      Text(
                        'Mode: ${preview.mode}',
                        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Frequency: ${preview.frequencyHz} Hz',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _PatternPreview(pattern: preview.pattern),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: (previewError == null && preview != null)
                                  ? () async {
                                      try {
                                        await sendIR(_draftButtonForPreview());
                                        if (!mounted) return;
                                        _showSnack('Test transmit sent.');
                                      } catch (e) {
                                        if (!mounted) return;
                                        _showSnack('Test transmit failed: $e');
                                      }
                                    }
                                  : null,
                              icon: const Icon(Icons.wifi_tethering),
                              label: const Text('Test transmit'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => setState(() {}),
                              icon: const Icon(Icons.refresh),
                              label: const Text('Refresh'),
                            ),
                          ),
                        ],
                      ),
                      if (_signalType == _SignalType.protocol && !IrProtocolRegistry.isImplemented(_selectedProtocolId)) ...[
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.info_outline, color: theme.colorScheme.primary),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'This protocol is registered but encoding is not implemented yet.',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ] else ...[
                      Text(
                        'Enter valid inputs to generate a preview.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: theme.colorScheme.primary),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Tip: Use Database mode for fast import, then switch to Manual to fine-tune protocols/timings as needed.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PatternPreview extends StatelessWidget {
  final List<int> pattern;
  const _PatternPreview({required this.pattern});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final int count = pattern.length;
    final int sum = pattern.fold(0, (p, v) => p + v);

    final int headN = count > 16 ? 16 : count;
    final String head = pattern.take(headN).join(', ');
    final String text = count <= headN ? head : '$head, …';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pattern preview ($count durations, total ${sum}µs)',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(
              fontFamily: 'monospace',
              color: theme.colorScheme.onSurface.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}
