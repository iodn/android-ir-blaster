/// Identifies a learned raw IR pattern (NEC and RC5) and describes the matching
/// codes found in the database. Pure Dart, no Flutter or database dependency.
library;

/// A learned signal translated to the `(protocol, hexcode)` form used by the
/// `keys` table of the bundled database.
class DecodedIrSignal {
  const DecodedIrSignal({
    required this.protocol,
    required this.hexcodes,
    required this.description,
  });

  /// Protocol exactly as stored in `keys.protocol` (e.g. `NEC`, `RC5`).
  final String protocol;

  /// Hex codes to look up. The first entry is the exact code; the others are
  /// equivalent encodings used by some database entries.
  final List<String> hexcodes;

  /// Short human readable description, e.g. `RC5 · address 1 · command 12`.
  final String description;

  /// Identifies the exact code, so the same button learned twice counts once.
  String get key => '$protocol|${hexcodes.first}';
}

class IrDbBrandMatch {
  const IrDbBrandMatch({
    required this.brand,
    required this.modelCount,
    required this.sampleModels,
  });

  final String brand;
  final int modelCount;
  final List<String> sampleModels;
}

/// One database model (and the remote id holding the matching code).
class IrDbModelMatch {
  const IrDbModelMatch({required this.model, required this.remoteId});

  final String model;
  final int remoteId;
}

class IrDbSignalMatches {
  const IrDbSignalMatches({
    required this.totalBrands,
    required this.totalModels,
    required this.commonLabels,
    required this.brands,
  });

  static const IrDbSignalMatches empty = IrDbSignalMatches(
    totalBrands: 0,
    totalModels: 0,
    commonLabels: <String>[],
    brands: <IrDbBrandMatch>[],
  );

  final int totalBrands;
  final int totalModels;

  /// Most common button labels for this code (e.g. `POWER`).
  final List<String> commonLabels;

  /// Brands with the most matching models, best first.
  final List<IrDbBrandMatch> brands;
}

class IrSignalDecoder {
  const IrSignalDecoder._();

  /// Pattern is `mark, space, mark, ...` in microseconds. Returns null when the
  /// signal is not a recognised NEC or RC5 frame.
  static DecodedIrSignal? decode(List<int> pattern) {
    return _decodeNec(pattern) ?? _decodeRc5(pattern);
  }

  static bool _within(int v, int lo, int hi) => v >= lo && v <= hi;

  // NEC: 9 ms mark, 4.5 ms space, then 32 bits (562 us mark + 562 us space for 0,
  // 1687 us space for 1), sent most significant bit first. The database stores the
  // 32 bits as 8 hex digits in transmission order.
  static DecodedIrSignal? _decodeNec(List<int> p) {
    if (p.length < 67) return null;
    if (!_within(p[0], 7000, 11500) || !_within(p[1], 3200, 6000)) return null;
    var value = 0;
    for (var i = 0; i < 32; i++) {
      final mark = p[2 + 2 * i];
      final space = p[3 + 2 * i];
      if (!_within(mark, 300, 900)) return null;
      final int bit;
      if (_within(space, 300, 1124)) {
        bit = 0;
      } else if (_within(space, 1125, 2400)) {
        bit = 1;
      } else {
        return null;
      }
      value = (value << 1) | bit;
    }
    final hex = value.toRadixString(16).toUpperCase().padLeft(8, '0');
    return DecodedIrSignal(
      protocol: 'NEC',
      hexcodes: <String>[hex],
      description: 'NEC · $hex',
    );
  }

  // RC5: 14 Manchester bits of 889 us half-bits: start(1), field, toggle,
  // address(5), command(6). The database stores field + address + command as
  // 3 hex digits (the toggle bit is not part of the code).
  static DecodedIrSignal? _decodeRc5(List<int> p) {
    if (p.length < 10) return null;
    final halves = <int>[0]; // the idle half of the start bit is not transmitted
    var level = 1;
    for (final d in p) {
      final int n;
      if (_within(d, 600, 1150)) {
        n = 1;
      } else if (_within(d, 1500, 2100)) {
        n = 2;
      } else if (d > 3000) {
        break; // inter-frame gap
      } else {
        return null;
      }
      for (var i = 0; i < n; i++) {
        halves.add(level);
      }
      level ^= 1;
    }
    if (halves.length < 27) return null;
    if (halves.length == 27) halves.add(0); // last half merged into the gap

    final bits = <int>[];
    for (var i = 0; i < 28; i += 2) {
      final a = halves[i];
      final b = halves[i + 1];
      if (a == 0 && b == 1) {
        bits.add(1);
      } else if (a == 1 && b == 0) {
        bits.add(0);
      } else {
        return null;
      }
    }
    if (bits[0] != 1) return null;

    var payload = 0; // address (5 bits) + command (6 bits)
    for (var i = 3; i < 14; i++) {
      payload = (payload << 1) | bits[i];
    }
    final field = bits[1];
    final value = (field << 11) | payload;
    final address = payload >> 6;
    final command = (payload & 0x3F) + (field == 0 ? 0x40 : 0);

    String hex3(int v) => v.toRadixString(16).toUpperCase().padLeft(3, '0');
    final codes = <String>{hex3(value), hex3(value | 0x800), hex3(value & 0x7FF)};
    return DecodedIrSignal(
      protocol: 'RC5',
      hexcodes: codes.toList(growable: false),
      description: 'RC5 · address $address · command $command',
    );
  }
}
