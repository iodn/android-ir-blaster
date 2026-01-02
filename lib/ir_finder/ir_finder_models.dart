import 'dart:math';

import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/ir/ir_protocol_types.dart';

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
    switch (id) {
      case 'nec':
      case 'nec2':
      case 'necx1':
      case 'necx2':
        return const IrFinderBruteSpec(
          protocolId: 'nec',
          totalHexDigits: 8,
          displayName: 'NEC (32-bit)',
        );
      case 'rc5':
        return const IrFinderBruteSpec(
          protocolId: 'rc5',
          totalHexDigits: 4,
          displayName: 'RC5',
        );
      case 'rc6':
        return const IrFinderBruteSpec(
          protocolId: 'rc6',
          totalHexDigits: 8,
          displayName: 'RC6',
        );
      default:
        return IrFinderBruteSpec(
          protocolId: id,
          totalHexDigits: 8,
          displayName: id.toUpperCase(),
        );
    }
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

  static String _pickPrimaryFieldId(IrProtocolDefinition def) {
    final fields = def.fields;

    String? findById(Set<String> ids) {
      for (final f in fields) {
        final id = f.id.trim().toLowerCase();
        if (ids.contains(id)) return f.id;
      }
      return null;
    }

    final String? direct = findById(<String>{
      'hex',
      'code',
      'hexcode',
      'data',
      'value',
      'command',
      'payload',
    });
    if (direct != null) return direct;

    for (final f in fields) {
      if (f.type == IrFieldType.string) return f.id;
    }

    if (fields.isNotEmpty) return fields.first.id;

    return 'hex';
  }

  static Map<String, dynamic> buildParamsForProtocol(
    String protocolId,
    String codeHex,
  ) {
    final enc = IrProtocolRegistry.encoderFor(protocolId);
    final def = enc.definition;

    final String key = _pickPrimaryFieldId(def);
    final String cleaned = _cleanHex(codeHex);

    return <String, dynamic>{
      'protocolId': protocolId,
      key: cleaned,
    };
  }
}
