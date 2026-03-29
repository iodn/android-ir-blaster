import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/icon_picker_names.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/button_label.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:uuid/uuid.dart';

class ExistingRemoteButtonImportSheet extends StatefulWidget {
  final List<IRButton> existingButtons;
  final int? currentRemoteId;

  const ExistingRemoteButtonImportSheet({
    super.key,
    required this.existingButtons,
    this.currentRemoteId,
  });

  @override
  State<ExistingRemoteButtonImportSheet> createState() =>
      _ExistingRemoteButtonImportSheetState();
}

class _ExistingRemoteButtonImportSheetState
    extends State<ExistingRemoteButtonImportSheet> {
  static const _uuid = Uuid();
  final TextEditingController _searchCtl = TextEditingController();
  final Set<String> _selectedKeys = <String>{};

  List<Remote> _sources = <Remote>[];
  Remote? _activeSource;

  @override
  void initState() {
    super.initState();
    _sources = remotes
        .where((r) =>
            (widget.currentRemoteId == null || r.id != widget.currentRemoteId) &&
            r.buttons.isNotEmpty)
        .toList(growable: false);
    _activeSource = _sources.isNotEmpty ? _sources.first : null;
  }

  @override
  void dispose() {
    _searchCtl.dispose();
    super.dispose();
  }

  String _keyFor(int remoteId, String buttonId) => '$remoteId::$buttonId';

  String _normalized(String value) => value.trim().toLowerCase();

  dynamic _stableJsonValue(dynamic value) {
    if (value is Map) {
      final entries = value.entries.toList()
        ..sort((a, b) => a.key.toString().compareTo(b.key.toString()));
      return <String, dynamic>{
        for (final e in entries) e.key.toString(): _stableJsonValue(e.value),
      };
    }
    if (value is List) return value.map(_stableJsonValue).toList(growable: false);
    return value;
  }

  String _signature(IRButton b) {
    final String label = _normalized(
      displayButtonLabel(
        b,
        fallback: b.image,
        iconNameLocalizer: (name) => localizedIconPickerName(context.l10n, name),
      ),
    );

    if (b.protocol != null && b.protocol!.trim().isNotEmpty) {
      final params = b.protocolParams ?? const <String, dynamic>{};
      return 'protocol|$label|${b.protocol}|${b.frequency ?? 0}|${jsonEncode(_stableJsonValue(params))}';
    }
    if (b.rawData != null && b.rawData!.trim().isNotEmpty) {
      return 'raw|$label|${b.frequency ?? 0}|${b.rawData!.trim()}';
    }
    return 'legacy|$label|${b.code ?? 0}|${b.frequency ?? 0}|${b.necBitOrder ?? ''}';
  }

  List<IRButton> _filteredButtons(Remote r) {
    final q = _searchCtl.text.trim().toLowerCase();
    if (q.isEmpty) return r.buttons;
    return r.buttons.where((b) {
      final label = displayButtonLabel(
        b,
        fallback: b.image,
        iconNameLocalizer: (name) => localizedIconPickerName(context.l10n, name),
      ).toLowerCase();
      final proto = (b.protocol ?? '').toLowerCase();
      return label.contains(q) || proto.contains(q);
    }).toList(growable: false);
  }

  void _toggleAllVisible(Remote r, bool select) {
    final visible = _filteredButtons(r);
    setState(() {
      for (final b in visible) {
        final k = _keyFor(r.id, b.id);
        if (select) {
          _selectedKeys.add(k);
        } else {
          _selectedKeys.remove(k);
        }
      }
    });
  }

  IRButton _cloneButton(IRButton src) {
    final params = src.protocolParams == null
        ? null
        : Map<String, dynamic>.from(src.protocolParams!);
    return IRButton(
      id: _uuid.v4(),
      code: src.code,
      rawData: src.rawData,
      frequency: src.frequency,
      image: src.image,
      isImage: src.isImage,
      necBitOrder: src.necBitOrder,
      protocol: src.protocol,
      protocolParams: params,
      iconCodePoint: src.iconCodePoint,
      iconFontFamily: src.iconFontFamily,
      iconFontPackage: src.iconFontPackage,
      buttonColor: src.buttonColor,
    );
  }

  void _finishImport() {
    final existingSignatures = widget.existingButtons.map(_signature).toSet();
    final picked = <IRButton>[];

    for (final r in _sources) {
      for (final b in r.buttons) {
        final k = _keyFor(r.id, b.id);
        if (!_selectedKeys.contains(k)) continue;
        final sig = _signature(b);
        if (existingSignatures.contains(sig)) continue;
        existingSignatures.add(sig);
        picked.add(_cloneButton(b));
      }
    }

    Navigator.of(context).pop(picked);
  }

  Widget _leadingForButton(IRButton b) {
    final canRenderIcon = b.iconCodePoint != null &&
        ((b.iconFontFamily?.trim().isNotEmpty ?? false) ||
            (b.iconFontPackage?.trim().isNotEmpty ?? false));
    if (canRenderIcon) {
      return Icon(
        IconData(
          b.iconCodePoint!,
          fontFamily: b.iconFontFamily,
          fontPackage: b.iconFontPackage,
        ),
      );
    }
    if (b.isImage && b.image.trim().isNotEmpty) {
      if (b.image.startsWith('assets/')) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            b.image,
            width: 32,
            height: 32,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
          ),
        );
      }
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          File(b.image),
          width: 32,
          height: 32,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
        ),
      );
    }
    return const Icon(Icons.smart_button_outlined);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final source = _activeSource;
    final visibleButtons = source == null ? const <IRButton>[] : _filteredButtons(source);
    final int selectedVisible = source == null
        ? 0
        : visibleButtons
            .where((b) => _selectedKeys.contains(_keyFor(source.id, b.id)))
            .length;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    context.l10n.importFromExistingRemotesTitle,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    context.l10n.selectedCount(_selectedKeys.length),
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (_sources.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    context.l10n.noOtherRemotesWithButtons,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              )
            else ...[
              DropdownButtonFormField<int>(
                initialValue: source?.id,
                decoration: InputDecoration(
                  labelText: context.l10n.sourceRemote,
                  prefixIcon: Icon(Icons.settings_remote_outlined),
                ),
                items: _sources
                    .map(
                      (r) => DropdownMenuItem<int>(
                        value: r.id,
                        child: Text('${r.name} (${r.buttons.length})'),
                      ),
                    )
                    .toList(growable: false),
                onChanged: (id) {
                  if (id == null) return;
                  setState(() {
                    _activeSource =
                        _sources.firstWhere((r) => r.id == id, orElse: () => _sources.first);
                  });
                },
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _searchCtl,
                decoration: InputDecoration(
                  labelText: context.l10n.searchButtons,
                  hintText: context.l10n.searchButtonsHint,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchCtl.text.trim().isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            setState(() => _searchCtl.clear());
                          },
                          icon: const Icon(Icons.clear),
                        ),
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: source == null ? null : () => _toggleAllVisible(source, true),
                    icon: const Icon(Icons.select_all),
                    label: Text(context.l10n.selectVisible),
                  ),
                  const SizedBox(width: 6),
                  TextButton.icon(
                    onPressed: source == null ? null : () => _toggleAllVisible(source, false),
                    icon: const Icon(Icons.deselect),
                    label: Text(context.l10n.clearVisible),
                  ),
                  const Spacer(),
                  Text(
                    '$selectedVisible/${visibleButtons.length}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Expanded(
                child: ListView.separated(
                  itemCount: visibleButtons.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final b = visibleButtons[i];
                    final key = _keyFor(source!.id, b.id);
                    final selected = _selectedKeys.contains(key);
                    final label = displayButtonLabel(
                      b,
                      fallback: b.image,
                      iconNameLocalizer: (name) => localizedIconPickerName(context.l10n, name),
                    );
                    final subtitle = (b.protocol != null && b.protocol!.trim().isNotEmpty)
                        ? context.l10n.protocolNamed(b.protocol!)
                        : (b.rawData != null && b.rawData!.trim().isNotEmpty)
                            ? context.l10n.rawSignal
                            : context.l10n.legacyCode;
                    return CheckboxListTile(
                      value: selected,
                      onChanged: (v) {
                        setState(() {
                          if (v == true) {
                            _selectedKeys.add(key);
                          } else {
                            _selectedKeys.remove(key);
                          }
                        });
                      },
                      secondary: _leadingForButton(b),
                      title: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      controlAffinity: ListTileControlAffinity.trailing,
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.of(context).pop(const <IRButton>[]),
                      icon: const Icon(Icons.close),
                      label: Text(context.l10n.cancel),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _selectedKeys.isEmpty ? null : _finishImport,
                      icon: const Icon(Icons.download_done_outlined),
                      label: Text(context.l10n.importCount(_selectedKeys.length)),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
