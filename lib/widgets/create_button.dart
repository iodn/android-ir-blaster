import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/ir/ir_protocol_types.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/code_test.dart';

enum _LabelType { image, text }
enum _SignalType { hex, raw, protocol }
enum _NecBitOrder { msb, lsb }

class CreateButton extends StatefulWidget {
  final IRButton? button;
  const CreateButton({super.key, this.button});

  @override
  State<CreateButton> createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> {
  // Helper text wrapping on small screens.
  static const int _kHelperMaxLines = 4;
  static const int _kHintMaxLines = 2;
  static const int _kErrorMaxLines = 3;

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

  final Map<String, TextEditingController> _protoControllers =
      <String, TextEditingController>{};

  _LabelType _labelType = _LabelType.image;
  _SignalType _signalType = _SignalType.hex;

  bool useCustomNec = false;
  _NecBitOrder _necBitOrder = _NecBitOrder.msb;

  String _selectedProtocolId = IrProtocolIds.nec;

  Widget? _imagePreview;
  String? _imagePath;

  bool _didAttachListeners = false;

  @override
  void initState() {
    super.initState();

    hexFreqController.text = kDefaultNecFrequencyHz.toString();

    if (widget.button != null) {
      final b = widget.button!;
      final hasRaw = b.rawData != null && b.rawData!.trim().isNotEmpty;

      if (b.isImage) {
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

        _syncProtocolControllersFromDefinition(
          b.protocolParams ?? const <String, dynamic>{},
        );
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
            ((b.necBitOrder ?? 'msb').toLowerCase() == 'lsb')
                ? _NecBitOrder.lsb
                : _NecBitOrder.msb;
      } else if (hasRaw) {
        _signalType = _SignalType.raw;
        rawDataController.text = b.rawData!;
        freqController.text =
            (b.frequency ?? kDefaultNecFrequencyHz).toString();
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

  void _syncProtocolControllersFromDefinition(
      Map<String, dynamic> existingParams) {
    final def = IrProtocolRegistry.definitionFor(_selectedProtocolId);

    _protoControllers.forEach((_, c) => c.dispose());
    _protoControllers.clear();

    if (def == null) return;

    for (final field in def.fields) {
      final c = TextEditingController();

      dynamic v = existingParams[field.id];

      // Default value if not provided
      v ??= field.defaultValue;

      // For choice fields, ensure a valid selection exists
      if (v == null &&
          field.type == IrFieldType.choice &&
          field.options.isNotEmpty) {
        v = field.options.first;
      }

      if (v != null) {
        if (field.type == IrFieldType.intHex) {
          if (v is int) {
            c.text = v.toRadixString(16).toUpperCase();
          } else {
            c.text = v.toString();
          }
        } else if (field.type == IrFieldType.boolean) {
          c.text = _coerceBool(v).toString(); // "true"/"false"
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

  @override
  void dispose() {
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

  String get _screenTitle =>
      widget.button == null ? "Create Button" : "Edit Button";

  bool get _hasLabel {
    if (_labelType == _LabelType.image) return _imagePath != null;
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
      } else if (field.type == IrFieldType.boolean) {
        // always valid if present (we coerce on save)
      }
    }

    return true;
  }

  bool get _canSave =>
      _hasLabel &&
      _hexLooksValid &&
      _rawLooksValid &&
      _customNecLooksValid &&
      _protocolLooksValid;

  void _showSnack(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pasteInto(TextEditingController controller,
      {bool hexOnly = false}) async {
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
              Text('Choose a built-in icon',
                  style: Theme.of(ctx).textTheme.titleMedium),
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

  Widget _sectionHeader(String title,
      {String? subtitle, IconData? icon}) {
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
                Text(title,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w700)),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface
                          .withValues(alpha: 0.75),
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

  List<Widget> _buildSignalSummaryChips() {
    final List<Widget> chips = [];

    if (_signalType == _SignalType.hex) {
      chips.add(_chip('HEX / NEC', icon: Icons.numbers));
      if (useCustomNec) {
        chips.add(_chip('Custom timings', icon: Icons.tune));
        chips.add(_chip(
            _necBitOrder == _NecBitOrder.lsb ? 'LSB' : 'MSB',
            icon: Icons.swap_horiz));
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
    final String labelValue =
        (_labelType == _LabelType.image) ? (_imagePath ?? '') : nameController.text.trim();

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
        code: parsedHex,
        rawData: rawDataForNec,
        frequency: rawDataForNec != null ? freqForNec : null,
        image: labelValue,
        isImage: _labelType == _LabelType.image,
        necBitOrder: bitOrder,
      );
    }

    if (_signalType == _SignalType.raw) {
      final int freq = int.tryParse(freqController.text.trim()) ?? kDefaultNecFrequencyHz;
      return IRButton(
        code: null,
        rawData: rawDataController.text.trim(),
        frequency: freq,
        image: labelValue,
        isImage: _labelType == _LabelType.image,
      );
    }

    // Protocol
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
          // choice/string
          params[field.id] = t;
        }
      }
    }

    final int? f = protoFreqController.text.trim().isEmpty
        ? null
        : int.tryParse(protoFreqController.text.trim());

    return IRButton(
      code: null,
      rawData: null,
      frequency: f,
      image: labelValue,
      isImage: _labelType == _LabelType.image,
      protocol: _selectedProtocolId,
      protocolParams: params,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final labelSegments = <ButtonSegment<_LabelType>>[
      const ButtonSegment(
          value: _LabelType.image,
          label: Text('Image'),
          icon: Icon(Icons.image_outlined)),
      const ButtonSegment(
          value: _LabelType.text,
          label: Text('Text'),
          icon: Icon(Icons.text_fields)),
    ];

    final signalSegments = <ButtonSegment<_SignalType>>[
      const ButtonSegment(
          value: _SignalType.hex,
          label: Text('Hex (NEC)'),
          icon: Icon(Icons.numbers)),
      const ButtonSegment(
          value: _SignalType.raw,
          label: Text('Raw timings'),
          icon: Icon(Icons.graphic_eq)),
      const ButtonSegment(
          value: _SignalType.protocol,
          label: Text('Protocol'),
          icon: Icon(Icons.tune)),
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
              subtitle: 'Choose an image icon or type a text label.',
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
                          color: theme.colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.6),
                          border: Border.all(
                              color: theme.colorScheme.outlineVariant
                                  .withValues(alpha: 0.8)),
                        ),
                        child: Center(
                          child: _imagePreview ??
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.add_photo_alternate_outlined,
                                      size: 40,
                                      color: theme.colorScheme.onSurface
                                          .withValues(alpha: 0.7)),
                                  const SizedBox(height: 6),
                                  Text(
                                    'No image selected',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onSurface
                                          .withValues(alpha: 0.75),
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
                            'Required: select an image or switch to Text and enter a label.',
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
              '2) IR signal',
              subtitle: 'Choose how this button sends IR.',
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
                                  widget.button?.protocolParams ??
                                      const <String, dynamic>{},
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
                        style: theme.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Frequency: ${preview.frequencyHz} Hz',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.8),
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
                      if (_signalType == _SignalType.protocol &&
                          !IrProtocolRegistry.isImplemented(_selectedProtocolId)) ...[
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.info_outline,
                                color: theme.colorScheme.primary),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'This protocol is registered but encoding is not implemented yet.',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withValues(alpha: 0.8),
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
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.75),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              color: theme.colorScheme.surfaceContainerHighest
                  .withValues(alpha: 0.35),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: theme.colorScheme.primary),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Tip: HEX/NEC is best for standard remotes. Use Protocol mode to store future protocol-specific data without breaking legacy behavior.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.8),
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
              letterSpacing: 1.1),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9a-fA-F]")),
          ],
          decoration: InputDecoration(
            labelText: 'Hex code (NEC)',
            helperText: '8 hex digits (example: 00F700FF).',
            helperMaxLines: _kHelperMaxLines,
            hintMaxLines: _kHintMaxLines,
            errorText: (_signalType == _SignalType.hex && !_hexLooksValid)
                ? 'Enter a valid hex code.'
                : null,
            errorMaxLines: _kErrorMaxLines,
            suffixIcon: SizedBox(
              width: 96,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    tooltip: 'Paste',
                    onPressed: () =>
                        _pasteInto(codeController, hexOnly: true),
                    icon: const Icon(Icons.content_paste_outlined),
                  ),
                  IconButton(
                    tooltip: 'Find/test code',
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
          icon: Icon(Icons.check_circle_outline)),
      const ButtonSegment(
          value: _NecBitOrder.lsb,
          label: Text('LSB'),
          icon: Icon(Icons.swap_horiz)),
    ];

    return ExpansionTile(
      initiallyExpanded: useCustomNec,
      title: const Text('Advanced (optional)'),
      subtitle: Text(
        useCustomNec
            ? 'Custom NEC timings and carrier frequency'
            : 'Use defaults unless a device requires custom timings',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
        ),
      ),
      childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Use custom NEC timings"),
          subtitle: const Text(
              "Stores a NEC:... config and transmits as raw with the chosen frequency."),
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
              style: theme.textTheme.labelLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerLeft,
            child: SegmentedButton<_NecBitOrder>(
              segments: bitOrderSegments,
              selected: {_necBitOrder},
              onSelectionChanged: (s) =>
                  setState(() => _necBitOrder = s.first),
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
              errorText: !_customNecLooksValid
                  ? 'Enter a valid frequency (15k–60k).'
                  : null,
              errorMaxLines: _kErrorMaxLines,
              suffixIcon: IconButton(
                tooltip: 'Reset to 38000',
                onPressed: () => setState(() =>
                    hexFreqController.text =
                        kDefaultNecFrequencyHz.toString()),
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
              "MSB mode is kept for compatibility with existing stored codes. "
              "Switch to LSB if your stored hex is in natural order for your device.",
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
            Expanded(
                child: numField(headerSpaceCtrl, "Header Space (µs)", "4500")),
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
            errorText: (_signalType == _SignalType.raw && !_rawLooksValid)
                ? 'Enter a valid frequency (15k–60k).'
                : null,
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
            helperText:
                'Encoding is implemented only for protocols marked as implemented.',
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
            helperText:
                'Optional. If empty, protocol default is used where available.',
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

      // Enforce a valid selection (defer to post-frame to avoid rebuild loops)
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
            .map((o) => DropdownMenuItem<String>(
                  value: o,
                  child: Text(o),
                ))
            .toList(growable: false),
        onChanged: (v) {
          if (v == null) return;
          setState(() => c.text = v);
        },
        decoration: InputDecoration(
          labelText: field.label,
          helperText: field.helperText,
          helperMaxLines: _kHelperMaxLines, // <-- fixes truncation on small screens
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

    // BOOLEAN -> switch
    if (field.type == IrFieldType.boolean) {
      final bool value =
          _coerceBool(c.text.trim().isEmpty ? field.defaultValue : c.text);
      return SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(field.label),
        subtitle: field.helperText == null ? null : Text(field.helperText!),
        value: value,
        onChanged: (v) => setState(() => c.text = v.toString()),
      );
    }

    // TEXT / INT -> TextField
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

      // optional bounds (UX only)
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
        helperMaxLines: _kHelperMaxLines, // <-- fixes truncation on small screens
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
      _showSnack(_labelType == _LabelType.image
          ? "Please select an image, or switch to Text and enter a label."
          : "Please enter a label.");
      return;
    }

    final String labelValue =
        (_labelType == _LabelType.image) ? (_imagePath ?? '') : nameController.text.trim();

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
        code: parsedHex,
        rawData: rawDataForNec,
        frequency: rawDataForNec != null ? freqForNec : null,
        image: labelValue,
        isImage: _labelType == _LabelType.image,
        necBitOrder: bitOrder,
      );

      Navigator.pop(context, button);
      return;
    }

    if (_signalType == _SignalType.raw) {
      if (!_rawLooksValid) {
        _showSnack(
            "Raw data must be integers separated by spaces/newlines, and frequency must be 15k–60k.");
        return;
      }

      final int freq = int.parse(freqController.text.trim());

      final button = IRButton(
        code: null,
        rawData: rawDataController.text.trim(),
        frequency: freq,
        image: labelValue,
        isImage: _labelType == _LabelType.image,
      );

      Navigator.pop(context, button);
      return;
    }

    // Protocol
    if (_signalType == _SignalType.protocol) {
      if (!_protocolLooksValid) {
        _showSnack(
            "Fill required protocol fields and ensure frequency is 15k–60k if set.");
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

      final int? f = protoFreqController.text.trim().isEmpty
          ? null
          : int.tryParse(protoFreqController.text.trim());

      final button = IRButton(
        code: null,
        rawData: null,
        frequency: f,
        image: labelValue,
        isImage: _labelType == _LabelType.image,
        protocol: _selectedProtocolId,
        protocolParams: params,
      );

      Navigator.pop(context, button);
      return;
    }
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
        border: Border.all(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.8)),
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
