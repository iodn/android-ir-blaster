enum IrFieldType {
  string,
  intDecimal,
  intHex,
  boolean,
  choice,
}

class IrFieldDef {
  final String id;
  final String label;
  final IrFieldType type;

  /// Whether the field must be provided by the user (or have a defaultValue).
  final bool required;

  /// Optional UI hint shown inside the control (e.g., TextField hint).
  final String? hint;

  /// Optional UI helper text shown under the control.
  final String? helperText;

  /// Default value used to prefill the UI and/or encoder params.
  /// - For intDecimal/intHex: int
  /// - For boolean: bool
  /// - For choice: typically String from [options]
  /// - For string: String
  final dynamic defaultValue;

  /// For numeric types: inclusive bounds.
  final int? min;
  final int? max;

  /// For text/hex input: max characters (UI-only; encoder should still validate).
  final int? maxLength;

  /// Used by the UI TextField (e.g., raw patterns can be multiline).
  final int? maxLines;

  /// For choice fields: allowed values.
  /// Kept as strings to keep UI simple and avoid locale/format issues.
  final List<String> options;

  const IrFieldDef({
    required this.id,
    required this.label,
    required this.type,
    this.required = false,
    this.hint,
    this.helperText,
    this.defaultValue,
    this.min,
    this.max,
    this.maxLength,
    this.maxLines,
    this.options = const <String>[],
  });
}

class IrProtocolDefinition {
  final String id;
  final String displayName;

  /// Optional long description for UI.
  final String? description;

  /// Frequency shown in UI (encoder may still override).
  /// Keep non-null to avoid downstream nullability issues.
  final int defaultFrequencyHz;

  /// Whether an encoder exists (true) vs only UI stub (false).
  final bool implemented;

  final List<IrFieldDef> fields;

  const IrProtocolDefinition({
    required this.id,
    required this.displayName,
    this.description,
    this.defaultFrequencyHz = 38000,
    this.fields = const <IrFieldDef>[],
    this.implemented = false,
  });
}

class IrEncodeResult {
  final int frequencyHz;
  final List<int> pattern;

  const IrEncodeResult({
    required this.frequencyHz,
    required this.pattern,
  });
}

abstract class IrProtocolEncoder {
  /// Must match the protocol definition id.
  String get id;

  IrProtocolDefinition get definition;

  IrEncodeResult encode(Map<String, dynamic> params);
}

class IrProtocolNotImplementedException implements Exception {
  final String protocolId;
  const IrProtocolNotImplementedException(this.protocolId);

  @override
  String toString() => 'Protocol "$protocolId" is not implemented yet';
}
