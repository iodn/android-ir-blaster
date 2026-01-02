class IrPrefixParseResult {
  final String raw;
  final bool ok;
  final String? error;

  final List<int> bytes;

  /// No separators, uppercase. Example: "A1B2"
  final String normalizedHex;

  const IrPrefixParseResult({
    required this.raw,
    required this.ok,
    required this.error,
    required this.bytes,
    required this.normalizedHex,
  });

  const IrPrefixParseResult.empty(String raw)
      : raw = raw,
        ok = true,
        error = null,
        bytes = const <int>[],
        normalizedHex = '';
}

class IrPrefixConstraint {
  final bool valid;
  final List<int> bytes;
  final String? errorMessage;

  const IrPrefixConstraint._({
    required this.valid,
    required this.bytes,
    required this.errorMessage,
  });

  factory IrPrefixConstraint.valid(List<int> bytes) => IrPrefixConstraint._(
        valid: true,
        bytes: List<int>.unmodifiable(bytes),
        errorMessage: null,
      );

  /// Backward-compatible: screen calls invalid(message, bytes)
  factory IrPrefixConstraint.invalid(String message,
          [List<int> bytes = const <int>[]]) =>
      IrPrefixConstraint._(
        valid: false,
        bytes: List<int>.unmodifiable(bytes),
        errorMessage: message,
      );

  /// Backward-compat aliases (some older code may use these)
  bool get isValid => valid;
  String? get error => errorMessage;
}

class IrPrefix {
  /// Parse input like:
  /// - "AA"
  /// - "AA BB"
  /// - "0xAABB"
  /// - "AA:BB:CC"
  /// into bytes.
  static IrPrefixParseResult parse(String raw, {int maxBytes = 16}) {
    final String trimmed = raw.trim();

    if (trimmed.isEmpty) {
      return IrPrefixParseResult.empty(raw);
    }

    final String cleaned = trimmed
        .replaceAll(RegExp(r'^0x', caseSensitive: false), '')
        .replaceAll(RegExp(r'[^0-9a-fA-F]'), '');

    if (cleaned.isEmpty) {
      return IrPrefixParseResult(
        raw: raw,
        ok: false,
        error: 'Invalid hex prefix (no hex digits found).',
        bytes: const <int>[],
        normalizedHex: '',
      );
    }

    if (cleaned.length.isOdd) {
      return IrPrefixParseResult(
        raw: raw,
        ok: false,
        error:
            'Invalid hex prefix (must be full bytes: even number of hex digits).',
        bytes: const <int>[],
        normalizedHex: '',
      );
    }

    final int requestedBytes = cleaned.length ~/ 2;
    final int byteCount = requestedBytes.clamp(0, maxBytes);

    final List<int> bytes = <int>[];
    for (int i = 0; i < byteCount; i++) {
      final int start = i * 2;
      final int b = int.parse(cleaned.substring(start, start + 2), radix: 16);
      bytes.add(b);
    }

    final String norm = bytes
        .map((int b) => b.toRadixString(16).padLeft(2, '0'))
        .join()
        .toUpperCase();

    return IrPrefixParseResult(
      raw: raw,
      ok: true,
      error: null,
      bytes: bytes,
      normalizedHex: norm,
    );
  }

  static String formatBytesAsHex(List<int> bytes) {
    return bytes
        .map((int b) =>
            b.clamp(0, 255).toRadixString(16).padLeft(2, '0').toUpperCase())
        .join(' ');
  }
}
