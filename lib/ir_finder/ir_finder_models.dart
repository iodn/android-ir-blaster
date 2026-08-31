import 'dart:math';

import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/ir/ir_protocol_types.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_search.dart';

enum IrFinderMode { bruteforce, database }

enum IrFinderSource { bruteforce, database }

class IrFinderCandidate {
  final String protocolId;

  /// UI display fields expected by ir_finder_screen.dart
  final String displayProtocol;
  final String displayCode;

  /// Whatever your encoder expects.
  final dynamic params;

  final IrFinderSource source;

  /// Optional DB context expected by the screen
  final String? dbBrand;
  final String? dbModel;
  final String? dbLabel;
  final int? dbRemoteId;

  const IrFinderCandidate({
    required this.protocolId,
    required this.displayProtocol,
    required this.displayCode,
    required this.params,
    required this.source,
    this.dbBrand,
    this.dbModel,
    this.dbLabel,
    this.dbRemoteId,
  });

  /// Backward-compat aliases
  String get code => displayCode;
  String get protocolName => displayProtocol;
  String? get brand => dbBrand;
  String? get model => dbModel;
  String? get keyLabel => dbLabel;
  int? get dbId => dbRemoteId;
}

class IrFinderHit {
  final DateTime savedAt;

  final String protocolId;
  final String protocolName;
  final String code;

  final IrFinderSource source;

  /// Optional DB context expected by the screen
  final String? dbBrand;
  final String? dbModel;
  final String? dbLabel;
  final int? dbRemoteId;
  final Map<String, dynamic>? protocolParams;

  const IrFinderHit({
    required this.savedAt,
    required this.protocolId,
    required this.protocolName,
    required this.code,
    required this.source,
    this.dbBrand,
    this.dbModel,
    this.dbLabel,
    this.dbRemoteId,
    this.protocolParams,
  });

  /// Backward-compat aliases
  DateTime get foundAt => savedAt;
  String? get brand => dbBrand;
  String? get model => dbModel;
  String? get keyLabel => dbLabel;
  int? get dbId => dbRemoteId;
}

class IrDbKeyCandidate {
  final int id;

  /// Field names expected by ir_finder_screen.dart
  final String protocol;
  final String hexcode;
  final int? remoteId;
  final String? label;

  /// Optional context
  final String? brand;
  final String? model;

  const IrDbKeyCandidate({
    required this.id,
    required this.protocol,
    required this.hexcode,
    this.remoteId,
    this.label,
    this.brand,
    this.model,
  });

  /// Backward-compat aliases
  String get protocolId => protocol;
  String? get commandLabel => label;
  String? get deviceLabel => null;
}

class IrBigInt {
  static BigInt pow(BigInt base, int exp) {
    if (exp < 0) throw ArgumentError.value(exp, 'exp', 'Must be >= 0');
    BigInt result = BigInt.one;
    BigInt b = base;
    int e = exp;
    while (e > 0) {
      if ((e & 1) == 1) result *= b;
      e >>= 1;
      if (e > 0) b *= b;
    }
    return result;
  }

  static String formatHuman(BigInt n) {
    final BigInt thousand = BigInt.from(1000);
    if (n < thousand) return n.toString();
    const List<String> units = <String>['', 'K', 'M', 'B', 'T', 'P', 'E'];
    BigInt value = n;
    int u = 0;
    while (value >= thousand && u < units.length - 1) {
      value ~/= thousand;
      u++;
    }
    return '${value.toString()}${units[u]}';
  }

  static int toIntClamp(BigInt v, {required int max}) {
    if (v <= BigInt.zero) return 0;
    final BigInt m = BigInt.from(max);
    if (v >= m) return max;
    return v.toInt();
  }
}

class IrFinderBruteSpec {
  final String protocolId;

  /// Total hex digits for brute force space (e.g. NEC 32-bit => 8 hex digits).
  final int totalHexDigits;

  /// UI name
  final String displayName;

  const IrFinderBruteSpec({
    required this.protocolId,
    required this.totalHexDigits,
    required this.displayName,
  });

  static IrFinderBruteSpec? forProtocol(String protocolId) {
    final String id = protocolId.trim().toLowerCase();
    final IrFinderProtocolSearchProfile? profile =
        IrFinderSearchProfiles.forProtocol(id);
    if (profile == null) return null;
    return IrFinderBruteSpec(
      protocolId: id,
      totalHexDigits: profile.totalHexDigits,
      displayName: IrProtocolRegistry.displayName(id),
    );
  }

  /// Legacy helper (kept permissive).
  static String composeHex({
    IrFinderBruteSpec? spec,
    String? protocolId,
    int? totalHexDigits,
    BigInt? cursor,
    BigInt? counter,
    BigInt? attempt,
    BigInt? index,
    BigInt? value,
    List<int>? prefixBytes,
    String? prefixHex,
    Object? prefix,
    Object? prefixConstraint,
  }) {
    final int digits = max(1, totalHexDigits ?? spec?.totalHexDigits ?? 8);
    BigInt c = cursor ?? counter ?? attempt ?? index ?? value ?? BigInt.zero;
    if (c.isNegative) c = BigInt.zero;

    List<int> bytes = <int>[];
    final Object? p = prefixBytes ?? prefixHex ?? prefix ?? prefixConstraint;
    if (p is List<int>) {
      bytes = List<int>.from(p);
    } else if (p is String) {
      final String cleaned = p.replaceAll(RegExp(r'[^0-9a-fA-F]'), '');
      if (cleaned.length.isEven && cleaned.isNotEmpty) {
        bytes = <int>[
          for (int i = 0; i < cleaned.length; i += 2)
            int.parse(cleaned.substring(i, i + 2), radix: 16),
        ];
      }
    } else {
      try {
        final dynamic d = p;
        if (d != null && d.valid == true && d.bytes is List<int>) {
          bytes = List<int>.from(d.bytes as List<int>);
        }
      } catch (_) {}
    }

    final String prefixStr = bytes
        .map((int b) => b.clamp(0, 255).toRadixString(16).padLeft(2, '0'))
        .join()
        .toUpperCase();

    final int usedDigits = min(prefixStr.length, digits);
    final int remaining = digits - usedDigits;

    final BigInt space =
        remaining <= 0 ? BigInt.one : IrBigInt.pow(BigInt.from(16), remaining);
    final BigInt normalized = remaining <= 0 ? BigInt.zero : (c % space);

    final String tail = remaining <= 0
        ? ''
        : normalized.toRadixString(16).padLeft(remaining, '0').toUpperCase();

    return (prefixStr.substring(0, usedDigits) + tail)
        .padRight(digits, '0')
        .toUpperCase();
  }
}

class IrFinderParams {
  static String _cleanHex(String s) =>
      s.replaceAll(RegExp(r'[^0-9a-fA-F]'), '').toUpperCase();

  static Map<String, dynamic> paramsForHit(
    IrFinderHit hit, {
    String? kaseikyoVendor,
  }) {
    final stored = hit.protocolParams;
    if (stored != null && stored.isNotEmpty) {
      return Map<String, dynamic>.from(stored);
    }
    return buildParamsForProtocol(
      hit.protocolId,
      hit.code,
      kaseikyoVendor: kaseikyoVendor,
    );
  }

  static Map<String, dynamic> buildParamsForProtocol(
    String protocolId,
    String codeHex, {
    String? kaseikyoVendor,
  }) {
    final id = protocolId.trim().toLowerCase();
    final String cleaned = _cleanHex(codeHex).toUpperCase();
    if (cleaned.isEmpty) {
      throw ArgumentError('$protocolId code must contain hexadecimal digits');
    }

    if (id == 'kaseikyo') {
      return _buildKaseikyoParams(cleaned, kaseikyoVendor ?? '2002');
    }

    if (id == 'sony12' || id == 'sony15' || id == 'sony20') {
      final int bits = id == 'sony12' ? 12 : (id == 'sony15' ? 15 : 20);
      final int addressBits = id == 'sony12' ? 5 : (id == 'sony15' ? 8 : 13);
      final int data = int.parse(cleaned, radix: 16) & ((1 << bits) - 1);
      final int command = data & 0x7F;
      final int address = (data >> 7) & ((1 << addressBits) - 1);
      return <String, dynamic>{
        'address': address
            .toRadixString(16)
            .toUpperCase()
            .padLeft((addressBits + 3) ~/ 4, '0'),
        'command': command.toRadixString(16).toUpperCase().padLeft(2, '0'),
      };
    }

    if (id == 'rca_38') {
      final String code = cleaned.padLeft(3, '0');
      return <String, dynamic>{
        'address': code.substring(code.length - 3, code.length - 2),
        'command': code.substring(code.length - 2),
      };
    }

    if (id == 'rc5') {
      final int data = int.parse(cleaned, radix: 16) & 0xFFF;
      final int command = (data & 0x3F) | (((data >> 11) & 1) == 0 ? 0x40 : 0);
      return <String, dynamic>{
        'address': ((data >> 6) & 0x1F)
            .toRadixString(16)
            .toUpperCase()
            .padLeft(2, '0'),
        'command': command.toRadixString(16).toUpperCase().padLeft(2, '0'),
      };
    }

    if (id == 'pioneer' && cleaned.length == 8) {
      return <String, dynamic>{
        'address': cleaned.substring(0, 2),
        'command': cleaned.substring(2, 4),
        'secondaryAddress': cleaned.substring(4, 6),
        'secondaryCommand': cleaned.substring(6, 8),
      };
    }

    if (id == 'pioneer' || id == 'samsung32' || id == 'xsat') {
      final String code = cleaned.padLeft(4, '0');
      return <String, dynamic>{
        'address': code.substring(code.length - 4, code.length - 2),
        'command': code.substring(code.length - 2),
      };
    }

    final enc = IrProtocolRegistry.encoderFor(protocolId);
    final def = enc.definition;
    if (def.fields.length != 1) {
      throw ArgumentError(
          '$protocolId does not have a supported tester layout');
    }

    final field = def.fields.single;
    if (field.type == IrFieldType.intDecimal ||
        field.type == IrFieldType.intHex) {
      return <String, dynamic>{field.id: int.parse(cleaned, radix: 16)};
    }

    return <String, dynamic>{field.id: cleaned};
  }

  static Map<String, dynamic> _buildKaseikyoParams(
    String cleaned,
    String vendorInput,
  ) {
    final String vendor = _cleanHex(vendorInput).padLeft(4, '0');
    if (vendor.length != 4) {
      throw ArgumentError('Kaseikyo vendor must be 4 hex digits');
    }
    final String vendorMsb = vendor.substring(0, 2);
    final String vendorLsb = vendor.substring(2, 4);

    String spaced(Iterable<String> bytes) => bytes.join(' ');

    if (cleaned.length == 16) {
      return <String, dynamic>{
        'address': spaced(<String>[
          cleaned.substring(0, 2),
          cleaned.substring(2, 4),
          cleaned.substring(4, 6),
          cleaned.substring(6, 8),
        ]),
        'command': spaced(<String>[
          cleaned.substring(8, 10),
          cleaned.substring(10, 12),
          cleaned.substring(12, 14),
          cleaned.substring(14, 16),
        ]),
      };
    }

    if (cleaned.length == 8 || cleaned.length == 6) {
      return <String, dynamic>{
        'address': spaced(<String>[
          cleaned.substring(0, 2),
          vendorLsb,
          vendorMsb,
          cleaned.length == 8 ? cleaned.substring(6, 8) : '00',
        ]),
        'command': spaced(<String>[
          cleaned.substring(2, 4),
          cleaned.substring(4, 6),
          '00',
          '00',
        ]),
      };
    }

    throw ArgumentError('Kaseikyo tester code must be 6, 8, or 16 hex digits');
  }
}
