enum IrFinderSearchStrategy { smart, sequential }

extension IrFinderSearchStrategyParsing on IrFinderSearchStrategy {
  static IrFinderSearchStrategy fromName(String? raw) {
    return raw?.trim().toLowerCase() == IrFinderSearchStrategy.sequential.name
        ? IrFinderSearchStrategy.sequential
        : IrFinderSearchStrategy.smart;
  }
}

enum IrCodeMaskError { invalidCharacters, tooLong }

class IrCodeMaskParseResult {
  final IrCodeMask? mask;
  final IrCodeMaskError? error;

  const IrCodeMaskParseResult._({required this.mask, required this.error});

  bool get ok => mask != null;

  factory IrCodeMaskParseResult.success(IrCodeMask mask) =>
      IrCodeMaskParseResult._(mask: mask, error: null);

  factory IrCodeMaskParseResult.failure(IrCodeMaskError error) =>
      IrCodeMaskParseResult._(mask: null, error: error);
}

class IrCodeMask {
  final int totalHexDigits;
  final String normalized;
  final int enteredHexDigits;

  const IrCodeMask._({
    required this.totalHexDigits,
    required this.normalized,
    required this.enteredHexDigits,
  });

  static IrCodeMaskParseResult parse(String raw,
      {required int totalHexDigits}) {
    if (totalHexDigits <= 0) {
      return IrCodeMaskParseResult.failure(IrCodeMaskError.tooLong);
    }

    final String withoutPrefixes = raw.replaceAllMapped(
      RegExp(r'(^|[\s:_-])0[xX](?=[0-9a-fA-FxX?])'),
      (Match match) => match.group(1) ?? '',
    );
    final StringBuffer cleaned = StringBuffer();

    for (int i = 0; i < withoutPrefixes.length; i++) {
      final String char = withoutPrefixes[i];
      if (RegExp(r'[0-9a-fA-F]').hasMatch(char)) {
        cleaned.write(char.toUpperCase());
      } else if (char == 'x' || char == 'X' || char == '?') {
        cleaned.write('X');
      } else if (RegExp(r'[\s:_-]').hasMatch(char)) {
        continue;
      } else {
        return IrCodeMaskParseResult.failure(
          IrCodeMaskError.invalidCharacters,
        );
      }
    }

    final String entered = cleaned.toString();
    if (entered.length > totalHexDigits) {
      return IrCodeMaskParseResult.failure(IrCodeMaskError.tooLong);
    }

    return IrCodeMaskParseResult.success(
      IrCodeMask._(
        totalHexDigits: totalHexDigits,
        normalized: entered.padRight(totalHexDigits, 'X'),
        enteredHexDigits: entered.length,
      ),
    );
  }

  bool isNibbleFixed(int nibbleFromRight) {
    final int index = totalHexDigits - 1 - nibbleFromRight;
    return normalized[index] != 'X';
  }

  int fixedNibble(int nibbleFromRight) {
    final int index = totalHexDigits - 1 - nibbleFromRight;
    return int.parse(normalized[index], radix: 16);
  }

  int get wildcardHexDigits =>
      normalized.split('').where((String char) => char == 'X').length;

  String get grouped {
    final StringBuffer out = StringBuffer();
    for (int i = 0; i < normalized.length; i++) {
      if (i > 0 && i.isEven) out.write(' ');
      out.write(normalized[i]);
    }
    return out.toString();
  }
}

class IrFinderSearchBitGroup {
  final List<int> rawBitPositions;
  final Set<int> invertedRawBitPositions;

  IrFinderSearchBitGroup(
    List<int> rawBitPositions, {
    Set<int> invertedRawBitPositions = const <int>{},
  })  : rawBitPositions = List<int>.unmodifiable(rawBitPositions),
        invertedRawBitPositions =
            Set<int>.unmodifiable(invertedRawBitPositions);
}

class IrFinderProtocolSearchProfile {
  final String protocolId;
  final int totalHexDigits;
  final List<IrFinderSearchBitGroup> smartGroups;

  IrFinderProtocolSearchProfile({
    required this.protocolId,
    required this.totalHexDigits,
    required List<IrFinderSearchBitGroup> smartGroups,
  }) : smartGroups = List<IrFinderSearchBitGroup>.unmodifiable(smartGroups);

  int get rawBitCount => totalHexDigits * 4;

  int get meaningfulBitCount => smartGroups.fold<int>(
        0,
        (int count, IrFinderSearchBitGroup group) =>
            count + group.rawBitPositions.length,
      );
}

class IrFinderSearchProfiles {
  IrFinderSearchProfiles._();

  static const List<String> protocolIds = <String>[
    'nec',
    'nec2',
    'necx1',
    'necx2',
    'nrc17',
    'denon',
    'f12_relaxed',
    'jvc',
    'kaseikyo',
    'pioneer',
    'proton',
    'rc5',
    'rc6',
    'rca_38',
    'rcc0082',
    'rcc2026',
    'rec80',
    'recs80',
    'recs80_l',
    'samsung32',
    'samsung36',
    'sharp',
    'sony12',
    'sony15',
    'sony20',
    'thomson7',
    'xsat',
  ];

  static List<int> _bits(int start, int count) =>
      List<int>.generate(count, (int index) => start + index);

  static IrFinderSearchBitGroup _group(
    List<int> positions, {
    Set<int> inverted = const <int>{},
  }) =>
      IrFinderSearchBitGroup(
        positions,
        invertedRawBitPositions: inverted,
      );

  static final Map<String, IrFinderProtocolSearchProfile> _profiles =
      <String, IrFinderProtocolSearchProfile>{
    'denon': IrFinderProtocolSearchProfile(
      protocolId: 'denon',
      totalHexDigits: 4,
      smartGroups: <IrFinderSearchBitGroup>[
        _group(<int>[0, ..._bits(4, 7)]),
        _group(_bits(11, 5)),
      ],
    ),
    'f12_relaxed': IrFinderProtocolSearchProfile(
      protocolId: 'f12_relaxed',
      totalHexDigits: 3,
      smartGroups: <IrFinderSearchBitGroup>[_group(_bits(0, 12))],
    ),
    'jvc': _twoByteProfile('jvc'),
    'kaseikyo': IrFinderProtocolSearchProfile(
      protocolId: 'kaseikyo',
      totalHexDigits: 6,
      smartGroups: <IrFinderSearchBitGroup>[
        _group(<int>[..._bits(8, 8), 0, 1]),
        _group(_bits(16, 8)),
      ],
    ),
    'nec': _twoWordProfile('nec', totalHexDigits: 8),
    'nec2': _twoWordProfile('nec2', totalHexDigits: 8),
    'necx1': _twoWordProfile('necx1', totalHexDigits: 8),
    'necx2': _twoWordProfile('necx2', totalHexDigits: 8),
    'nrc17': IrFinderProtocolSearchProfile(
      protocolId: 'nrc17',
      totalHexDigits: 4,
      smartGroups: <IrFinderSearchBitGroup>[
        _group(_bits(8, 8)),
        _group(_bits(4, 4)),
        _group(_bits(0, 4)),
      ],
    ),
    'pioneer': _twoByteProfile('pioneer'),
    'proton': _twoByteProfile('proton'),
    'rc5': IrFinderProtocolSearchProfile(
      protocolId: 'rc5',
      totalHexDigits: 3,
      smartGroups: <IrFinderSearchBitGroup>[
        _group(
          <int>[..._bits(0, 6), 11],
          inverted: const <int>{11},
        ),
        _group(_bits(6, 5)),
      ],
    ),
    'rc6': _twoByteProfile('rc6'),
    'rca_38': IrFinderProtocolSearchProfile(
      protocolId: 'rca_38',
      totalHexDigits: 3,
      smartGroups: <IrFinderSearchBitGroup>[
        _group(_bits(0, 8)),
        _group(_bits(8, 4)),
      ],
    ),
    'rcc0082': IrFinderProtocolSearchProfile(
      protocolId: 'rcc0082',
      totalHexDigits: 3,
      smartGroups: <IrFinderSearchBitGroup>[
        _group(_bits(2, 9)),
      ],
    ),
    'rcc2026': IrFinderProtocolSearchProfile(
      protocolId: 'rcc2026',
      totalHexDigits: 11,
      smartGroups: <IrFinderSearchBitGroup>[
        _group(_bits(0, 42)),
      ],
    ),
    'rec80': IrFinderProtocolSearchProfile(
      protocolId: 'rec80',
      totalHexDigits: 12,
      smartGroups: <IrFinderSearchBitGroup>[
        _group(_bits(0, 16)),
        _group(_bits(16, 32)),
      ],
    ),
    'recs80': _recs80Profile('recs80'),
    'recs80_l': _recs80Profile('recs80_l'),
    'samsung32': _twoByteProfile('samsung32'),
    'samsung36': IrFinderProtocolSearchProfile(
      protocolId: 'samsung36',
      totalHexDigits: 7,
      smartGroups: <IrFinderSearchBitGroup>[
        _group(_bits(0, 8)),
        _group(_bits(8, 4)),
        _group(_bits(12, 8)),
        _group(_bits(20, 8)),
      ],
    ),
    'sharp': IrFinderProtocolSearchProfile(
      protocolId: 'sharp',
      totalHexDigits: 4,
      smartGroups: <IrFinderSearchBitGroup>[
        _group(_bits(0, 8)),
        _group(_bits(8, 5)),
      ],
    ),
    'sony12': _sonyProfile('sony12', addressBits: 5),
    'sony15': _sonyProfile('sony15', addressBits: 8),
    'sony20': _sonyProfile('sony20', addressBits: 13),
    'thomson7': IrFinderProtocolSearchProfile(
      protocolId: 'thomson7',
      totalHexDigits: 3,
      smartGroups: <IrFinderSearchBitGroup>[
        _group(<int>[0, 1, 2, 3, 5, 6, 8, 9, 10, 11]),
      ],
    ),
    'xsat': _twoByteProfile('xsat'),
  };

  static IrFinderProtocolSearchProfile _twoByteProfile(String protocolId) =>
      IrFinderProtocolSearchProfile(
        protocolId: protocolId,
        totalHexDigits: 4,
        smartGroups: <IrFinderSearchBitGroup>[
          _group(_bits(0, 8)),
          _group(_bits(8, 8)),
        ],
      );

  static IrFinderProtocolSearchProfile _twoWordProfile(
    String protocolId, {
    required int totalHexDigits,
  }) =>
      IrFinderProtocolSearchProfile(
        protocolId: protocolId,
        totalHexDigits: totalHexDigits,
        smartGroups: <IrFinderSearchBitGroup>[
          _group(_bits(0, 16)),
          _group(_bits(16, 16)),
        ],
      );

  static IrFinderProtocolSearchProfile _recs80Profile(String protocolId) =>
      IrFinderProtocolSearchProfile(
        protocolId: protocolId,
        totalHexDigits: 3,
        smartGroups: <IrFinderSearchBitGroup>[
          _group(_bits(3, 9)),
        ],
      );

  static IrFinderProtocolSearchProfile _sonyProfile(
    String protocolId, {
    required int addressBits,
  }) =>
      IrFinderProtocolSearchProfile(
        protocolId: protocolId,
        totalHexDigits: (7 + addressBits + 3) ~/ 4,
        smartGroups: <IrFinderSearchBitGroup>[
          _group(_bits(0, 7)),
          _group(_bits(7, addressBits)),
        ],
      );

  static List<IrFinderProtocolSearchProfile> get all =>
      List<IrFinderProtocolSearchProfile>.unmodifiable(_profiles.values);

  static IrFinderProtocolSearchProfile? forProtocol(String protocolId) =>
      _profiles[protocolId.trim().toLowerCase()];
}

class IrFinderSearchPlan {
  final IrFinderProtocolSearchProfile profile;
  final IrCodeMask mask;
  final IrFinderSearchStrategy strategy;

  late final List<_VariableGroup> _smartVariableGroups =
      _buildSmartVariableGroups();
  late final List<int> _sequentialVariableBits = _buildSequentialVariableBits();

  IrFinderSearchPlan({
    required this.profile,
    required this.mask,
    required this.strategy,
  }) {
    if (mask.totalHexDigits != profile.totalHexDigits) {
      throw ArgumentError('Mask and protocol payload lengths must match');
    }
  }

  BigInt get space {
    final int variableBits = strategy == IrFinderSearchStrategy.smart
        ? _smartVariableGroups.fold<int>(
            0,
            (int count, _VariableGroup group) =>
                count + group.rawBitPositions.length,
          )
        : _sequentialVariableBits.length;
    return BigInt.one << variableBits;
  }

  int get meaningfulVariableBits => _smartVariableGroups.fold<int>(
        0,
        (int count, _VariableGroup group) =>
            count + group.rawBitPositions.length,
      );

  String codeAt(BigInt cursor) {
    if (cursor < BigInt.zero || cursor >= space) {
      throw ArgumentError.value(
        cursor,
        'cursor',
        'Must be between 0 and ${space - BigInt.one}',
      );
    }

    BigInt value = _fixedMaskValue();
    if (strategy == IrFinderSearchStrategy.sequential) {
      for (int i = 0; i < _sequentialVariableBits.length; i++) {
        if (((cursor >> i) & BigInt.one) == BigInt.one) {
          value |= BigInt.one << _sequentialVariableBits[i];
        }
      }
    } else {
      value = _applySmartCursor(value, cursor);
    }

    return value
        .toRadixString(16)
        .toUpperCase()
        .padLeft(profile.totalHexDigits, '0');
  }

  BigInt _fixedMaskValue() {
    BigInt value = BigInt.zero;
    for (int nibble = 0; nibble < mask.totalHexDigits; nibble++) {
      if (!mask.isNibbleFixed(nibble)) continue;
      value |= BigInt.from(mask.fixedNibble(nibble)) << (nibble * 4);
    }
    return value;
  }

  List<int> _buildSequentialVariableBits() {
    final List<int> result = <int>[];
    for (int bit = 0; bit < profile.rawBitCount; bit++) {
      if (!mask.isNibbleFixed(bit ~/ 4)) result.add(bit);
    }
    return result;
  }

  List<_VariableGroup> _buildSmartVariableGroups() {
    final Set<int> seen = <int>{};
    final List<_VariableGroup> result = <_VariableGroup>[];
    for (final IrFinderSearchBitGroup group in profile.smartGroups) {
      final List<int> variable = <int>[];
      final Set<int> inverted = <int>{};
      for (final int bit in group.rawBitPositions) {
        if (bit < 0 || bit >= profile.rawBitCount || !seen.add(bit)) {
          throw StateError(
            'Invalid smart bit profile for ${profile.protocolId}: $bit',
          );
        }
        if (!mask.isNibbleFixed(bit ~/ 4)) {
          variable.add(bit);
          if (group.invertedRawBitPositions.contains(bit)) {
            inverted.add(bit);
          }
        }
      }
      if (variable.isNotEmpty) {
        result.add(_VariableGroup(variable, inverted));
      }
    }
    return result;
  }

  BigInt _applySmartCursor(BigInt value, BigInt cursor) {
    final List<BigInt> groupRanks =
        List<BigInt>.filled(_smartVariableGroups.length, BigInt.zero);
    int cursorBit = 0;
    int depth = 0;
    bool added;
    do {
      added = false;
      for (int groupIndex = 0;
          groupIndex < _smartVariableGroups.length;
          groupIndex++) {
        final _VariableGroup group = _smartVariableGroups[groupIndex];
        if (depth >= group.rawBitPositions.length) continue;
        added = true;
        if (((cursor >> cursorBit) & BigInt.one) == BigInt.one) {
          groupRanks[groupIndex] |= BigInt.one << depth;
        }
        cursorBit++;
      }
      depth++;
    } while (added);

    for (int groupIndex = 0;
        groupIndex < _smartVariableGroups.length;
        groupIndex++) {
      final _VariableGroup group = _smartVariableGroups[groupIndex];
      final BigInt ordered = _spreadAfterCommonValues(
        groupRanks[groupIndex],
        group.rawBitPositions.length,
      );
      for (int bitIndex = 0;
          bitIndex < group.rawBitPositions.length;
          bitIndex++) {
        final int rawBit = group.rawBitPositions[bitIndex];
        final bool semanticOne =
            ((ordered >> bitIndex) & BigInt.one) == BigInt.one;
        final bool rawOne =
            semanticOne ^ group.invertedRawBitPositions.contains(rawBit);
        if (rawOne) value |= BigInt.one << rawBit;
      }
    }
    return value;
  }

  static BigInt _spreadAfterCommonValues(BigInt rank, int width) {
    if (width <= 0) return BigInt.zero;
    final BigInt commonLimit = BigInt.one << (width < 4 ? width : 4);
    if (rank < commonLimit) return rank;

    final BigInt reversed = _reverseBits(rank, width);
    // Swap each common value with its bit-reversed position. This preserves a
    // bijection while keeping 0..15 first and distributing later candidates.
    return reversed < commonLimit ? rank : reversed;
  }

  static BigInt _reverseBits(BigInt value, int width) {
    BigInt out = BigInt.zero;
    for (int i = 0; i < width; i++) {
      if (((value >> i) & BigInt.one) == BigInt.one) {
        out |= BigInt.one << (width - 1 - i);
      }
    }
    return out;
  }
}

class _VariableGroup {
  final List<int> rawBitPositions;
  final Set<int> invertedRawBitPositions;

  _VariableGroup(List<int> rawBitPositions, Set<int> invertedRawBitPositions)
      : rawBitPositions = List<int>.unmodifiable(rawBitPositions),
        invertedRawBitPositions =
            Set<int>.unmodifiable(invertedRawBitPositions);
}
