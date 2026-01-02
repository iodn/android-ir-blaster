import '../ir_protocol_types.dart';

class RawSignalProtocolEncoder implements IrProtocolEncoder {
  static const String protocolId = 'raw';
  const RawSignalProtocolEncoder();

  @override
  String get id => protocolId;

  static const int defaultFrequencyHz = 38000;

  // Practical sanity limits (avoid accidental megabyte pastes / invalid pulses).
  static const int maxEntries = 4096;
  static const int minDurationUs = 1;
  static const int maxDurationUs = 2000000; // 2s per element is plenty for IR gaps.

  // If a capture ends with a trailing MARK (odd count), auto-append a trailing SPACE
  // so ConsumerIrManager receives mark/space pairs (even length).
  static const int defaultTrailingSpaceUs = 45000; // 45ms is a safe "end gap".

  @override
  IrProtocolDefinition get definition => const IrProtocolDefinition(
        id: protocolId,
        displayName: 'Raw signal',
        implemented: true,
        defaultFrequencyHz: defaultFrequencyHz,
        fields: <IrFieldDef>[
          IrFieldDef(
            id: 'frequencyHz',
            label: 'Carrier frequency (Hz)',
            type: IrFieldType.intDecimal,
            required: false,
            defaultValue: defaultFrequencyHz,
            min: 10000,
            max: 100000,
            hint: '38000',
            helperText:
                'Typical IR is 36-40kHz (TVs often 38kHz). Leave default unless you know the carrier.',
          ),
          IrFieldDef(
            id: 'pattern',
            label: 'Raw pattern (µs)',
            type: IrFieldType.string,
            required: true,
            helperText:
                'Space/newline/comma/semicolon-separated durations in microseconds. '
                'Hex tokens like 0x15E are accepted. Lines may include # or // comments. '
                'If the count is odd, a trailing space is automatically appended.',
            maxLines: 6,
          ),
        ],
      );

  @override
  IrEncodeResult encode(Map<String, dynamic> params) {
    final dynamic p = params['pattern'];
    if (p is! String) {
      throw ArgumentError('pattern must be a String');
    }

    final int frequencyHz = _readFrequency(params);
    final List<int> pattern = _parsePattern(p);

    // ConsumerIrManager expects alternating on/off durations starting with ON.
    // If the capture ends with ON (odd count), append a trailing OFF gap.
    if (pattern.length.isOdd) {
      if (pattern.length >= maxEntries) {
        throw FormatException(
          'Raw pattern has ${pattern.length} entries (limit $maxEntries) and is odd. '
          'Remove one entry or increase limits before auto-padding.',
        );
      }

      final int gap = defaultTrailingSpaceUs.clamp(minDurationUs, maxDurationUs);
      pattern.add(gap);
    }

    return IrEncodeResult(frequencyHz: frequencyHz, pattern: pattern);
  }

  int _readFrequency(Map<String, dynamic> params) {
    final dynamic f = params['frequencyHz'];
    if (f == null) return defaultFrequencyHz;
    if (f is! int) {
      throw ArgumentError('frequencyHz must be an int');
    }
    if (f < 10000 || f > 100000) {
      throw ArgumentError('frequencyHz out of range (10000–100000)');
    }
    return f;
  }

  List<int> _parsePattern(String input) {
    final String cleaned = _stripLineComments(input).trim();
    if (cleaned.isEmpty) {
      throw FormatException('Raw pattern is empty');
    }

    // Tokenize integers including optional sign and optional 0x prefix.
    // Accept separators: whitespace, comma, semicolon, brackets.
    final RegExp tokenRe = RegExp(r'[-+]?(?:0x[0-9a-fA-F]+|\d+)');
    final Iterable<RegExpMatch> matches = tokenRe.allMatches(cleaned);

    final List<String> tokens = <String>[];
    for (final m in matches) {
      final t = m.group(0);
      if (t != null && t.isNotEmpty) tokens.add(t);
    }

    if (tokens.isEmpty) {
      throw FormatException(
        'No durations found. Provide integers like: "9000 4500 560 560 ..."',
      );
    }
    if (tokens.length > maxEntries) {
      throw FormatException(
        'Raw pattern is too long (${tokens.length} entries). '
        'Limit is $maxEntries to avoid device/transport issues.',
      );
    }

    final List<int> out = <int>[];
    for (int i = 0; i < tokens.length; i++) {
      final String t = tokens[i];
      final int v = _parseIntToken(t, index: i);

      if (v < minDurationUs) {
        throw FormatException(
          'Invalid duration at index $i: $v. Durations must be > 0 µs.',
        );
      }
      if (v > maxDurationUs) {
        throw FormatException(
          'Duration too large at index $i: $v µs. '
          'If this is intentional, consider splitting into shorter frames.',
        );
      }

      out.add(v);
    }

    return out;
  }

  int _parseIntToken(String token, {required int index}) {
    final bool neg = token.startsWith('-');
    final String t = token.startsWith('+') ? token.substring(1) : token;

    int? v;
    if (t.startsWith('0x') || t.startsWith('0X')) {
      v = int.tryParse(t.substring(2), radix: 16);
    } else {
      v = int.tryParse(t);
    }

    if (v == null) {
      throw FormatException('Invalid integer "$token" at index $index');
    }
    if (neg) {
      throw FormatException(
        'Invalid duration "$token" at index $index. Raw durations must be positive (µs).',
      );
    }
    return v;
  }

  String _stripLineComments(String s) {
    // Remove everything after '#' or '//' per line.
    final List<String> lines = s.split('\n');
    final StringBuffer out = StringBuffer();
    for (final line in lines) {
      String l = line;
      final int hash = l.indexOf('#');
      final int slashes = l.indexOf('//');

      int cut = -1;
      if (hash >= 0) cut = hash;
      if (slashes >= 0) cut = (cut < 0) ? slashes : (slashes < cut ? slashes : cut);

      if (cut >= 0) l = l.substring(0, cut);
      out.writeln(l);
    }
    return out.toString();
  }
}
