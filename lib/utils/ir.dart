import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/ir/ir_protocol_types.dart';
import 'remote.dart';

const platform = MethodChannel('org.nslabs/irtransmitter');

const int kDefaultNecFrequencyHz = 38000;
const int kMinIrFrequencyHz = 15000;
const int kMaxIrFrequencyHz = 60000;

class NECParams {
  final int headerMark;
  final int headerSpace;
  final int bitMark;
  final int zeroSpace;
  final int oneSpace;
  final int trailerMark;

  const NECParams({
    required this.headerMark,
    required this.headerSpace,
    required this.bitMark,
    required this.zeroSpace,
    required this.oneSpace,
    required this.trailerMark,
  });

  static const NECParams defaults = NECParams(
    headerMark: 9000,
    headerSpace: 4500,
    bitMark: 560,
    zeroSpace: 560,
    oneSpace: 1690,
    trailerMark: 560,
  );
}

bool isNecConfigString(String? rawData) {
  if (rawData == null) return false;
  return rawData.trimLeft().toUpperCase().startsWith('NEC:');
}

NECParams parseNecParamsFromString(String rawData) {
  try {
    final String s = rawData.trim();
    final int idx = s.toUpperCase().indexOf('NEC:');
    if (idx != 0) return NECParams.defaults;
    final String body = s.substring(4).trim();
    if (body.contains('=') || body.contains(';')) {
      int headerMark = NECParams.defaults.headerMark;
      int headerSpace = NECParams.defaults.headerSpace;
      int bitMark = NECParams.defaults.bitMark;
      int zeroSpace = NECParams.defaults.zeroSpace;
      int oneSpace = NECParams.defaults.oneSpace;
      int trailerMark = NECParams.defaults.trailerMark;
      final parts = body.split(';');
      for (final part in parts) {
        final p = part.trim();
        if (p.isEmpty) continue;
        final eq = p.indexOf('=');
        if (eq <= 0) continue;
        final key = p.substring(0, eq).trim().toLowerCase();
        final values = p
            .substring(eq + 1)
            .split(RegExp(r'[, ]+'))
            .where((e) => e.trim().isNotEmpty)
            .toList();
        if (key == 'h' || key == 'header') {
          if (values.length >= 2) {
            headerMark = int.tryParse(values[0]) ?? headerMark;
            headerSpace = int.tryParse(values[1]) ?? headerSpace;
          }
        } else if (key == 'b' || key == 'bit') {
          if (values.length >= 3) {
            bitMark = int.tryParse(values[0]) ?? bitMark;
            zeroSpace = int.tryParse(values[1]) ?? zeroSpace;
            oneSpace = int.tryParse(values[2]) ?? oneSpace;
          }
        } else if (key == 't' || key == 'trail' || key == 'trailer') {
          if (values.isNotEmpty) {
            trailerMark = int.tryParse(values[0]) ?? trailerMark;
          }
        }
      }
      return NECParams(
        headerMark: headerMark,
        headerSpace: headerSpace,
        bitMark: bitMark,
        zeroSpace: zeroSpace,
        oneSpace: oneSpace,
        trailerMark: trailerMark,
      );
    } else {
      final nums = body
          .split(RegExp(r'[, ]+'))
          .where((e) => e.trim().isNotEmpty)
          .toList();
      if (nums.length >= 6) {
        final headerMark =
            int.tryParse(nums[0]) ?? NECParams.defaults.headerMark;
        final headerSpace =
            int.tryParse(nums[1]) ?? NECParams.defaults.headerSpace;
        final bitMark = int.tryParse(nums[2]) ?? NECParams.defaults.bitMark;
        final zeroSpace =
            int.tryParse(nums[3]) ?? NECParams.defaults.zeroSpace;
        final oneSpace = int.tryParse(nums[4]) ?? NECParams.defaults.oneSpace;
        final trailerMark =
            int.tryParse(nums[5]) ?? NECParams.defaults.trailerMark;
        return NECParams(
          headerMark: headerMark,
          headerSpace: headerSpace,
          bitMark: bitMark,
          zeroSpace: zeroSpace,
          oneSpace: oneSpace,
          trailerMark: trailerMark,
        );
      }
      return NECParams.defaults;
    }
  } catch (_) {
    return NECParams.defaults;
  }
}

List<int> buildNecPatternFromStoredCodeMSBFirst(int code32,
    {NECParams params = NECParams.defaults}) {
  final int nec = code32 & 0xFFFFFFFF;
  final List<int> pattern = [];
  pattern.add(params.headerMark);
  pattern.add(params.headerSpace);
  for (int i = 31; i >= 0; i--) {
    final int bit = (nec >> i) & 0x1;
    pattern.add(params.bitMark);
    if (bit == 0) {
      pattern.add(params.zeroSpace);
    } else {
      pattern.add(params.oneSpace);
    }
  }
  pattern.add(params.trailerMark);
  return pattern;
}

List<int> buildNecPatternLSBFirst(int code32,
    {NECParams params = NECParams.defaults}) {
  final int nec = code32 & 0xFFFFFFFF;
  final List<int> pattern = [];
  pattern.add(params.headerMark);
  pattern.add(params.headerSpace);
  for (int i = 0; i < 32; i++) {
    final int bit = (nec >> i) & 0x1;
    pattern.add(params.bitMark);
    pattern.add(bit == 0 ? params.zeroSpace : params.oneSpace);
  }
  pattern.add(params.trailerMark);
  return pattern;
}

void _reportFlutterError(String where, Object error, StackTrace stack) {
  FlutterError.reportError(
    FlutterErrorDetails(
      exception: error,
      stack: stack,
      library: 'IR Blaster',
      context: ErrorDescription(where),
      informationCollector: () sync* {
        yield DiagnosticsProperty<String>('channel', platform.name);
      },
    ),
  );
}

void _validatePattern(List<int> pattern, {String where = 'pattern'}) {
  for (int i = 0; i < pattern.length; i++) {
    final v = pattern[i];
    if (v <= 0) {
      throw ArgumentError.value(v, '$where[$i]', 'Duration must be > 0 µs');
    }
  }
}

void _validateFrequency(int frequencyHz) {
  if (frequencyHz < kMinIrFrequencyHz || frequencyHz > kMaxIrFrequencyHz) {
    throw RangeError.range(
      frequencyHz,
      kMinIrFrequencyHz,
      kMaxIrFrequencyHz,
      'frequency',
      'IR carrier frequency must be between $kMinIrFrequencyHz and $kMaxIrFrequencyHz Hz',
    );
  }
}

Future<void> transmit(int code) async {
  final pattern = convertNECtoList(code);
  _validatePattern(pattern, where: 'hexPattern');
  try {
    await platform.invokeMethod("transmit", {"list": pattern});
  } catch (e, st) {
    _reportFlutterError('transmit()', e, st);
    rethrow;
  }
}

Future<void> transmitRaw(int frequency, List<int> pattern) async {
  _validateFrequency(frequency);
  _validatePattern(pattern, where: 'rawPattern');
  try {
    await platform
        .invokeMethod("transmitRaw", {"frequency": frequency, "list": pattern});
  } catch (e, st) {
    _reportFlutterError('transmitRaw()', e, st);
    rethrow;
  }
}

Future<bool> hasIrEmitter() async {
  try {
    final result = await platform.invokeMethod("hasIrEmitter");
    return result == true;
  } catch (e, st) {
    _reportFlutterError('hasIrEmitter()', e, st);
    return false;
  }
}

List<int> convertNECtoList(int nec) {
  return buildNecPatternFromStoredCodeMSBFirst(nec, params: NECParams.defaults);
}

class IrPreview {
  final int frequencyHz;
  final List<int> pattern;
  final String mode;

  const IrPreview({
    required this.frequencyHz,
    required this.pattern,
    required this.mode,
  });
}

IrPreview previewIRButton(IRButton button) {
  final hasRaw = button.rawData != null && button.rawData!.trim().isNotEmpty;
  final hasFreq = button.frequency != null && button.frequency! > 0;

  if (hasRaw && hasFreq) {
    if (isNecConfigString(button.rawData)) {
      if (button.code != null) {
        final params = parseNecParamsFromString(button.rawData!);
        final useLsb =
            (button.necBitOrder ?? 'msb').toLowerCase().trim() == 'lsb';
        final pattern = useLsb
            ? buildNecPatternLSBFirst(button.code!, params: params)
            : buildNecPatternFromStoredCodeMSBFirst(button.code!,
                params: params);
        _validatePattern(pattern, where: 'previewNecCustom');
        _validateFrequency(button.frequency!);
        return IrPreview(
          frequencyHz: button.frequency!,
          pattern: pattern,
          mode: 'legacy_nec_custom',
        );
      }
      throw StateError('Custom NEC timings provided but hex code is missing');
    }

    final parts = button.rawData!
        .split(RegExp(r'\s+'))
        .where((e) => e.isNotEmpty)
        .toList(growable: false);
    if (parts.isEmpty) {
      throw FormatException('Raw data is empty');
    }
    final List<int> pattern = <int>[];
    for (int i = 0; i < parts.length; i++) {
      final parsed = int.tryParse(parts[i]);
      if (parsed == null) {
        throw FormatException(
            'Invalid integer in raw data at index $i: "${parts[i]}"');
      }
      pattern.add(parsed);
    }
    _validatePattern(pattern, where: 'previewRaw');
    _validateFrequency(button.frequency!);
    return IrPreview(
      frequencyHz: button.frequency!,
      pattern: pattern,
      mode: 'legacy_raw',
    );
  }

  if (button.protocol != null && button.protocol!.trim().isNotEmpty) {
    final id = button.protocol!.trim();
    final enc = IrProtocolRegistry.encoderFor(id);
    final params = button.protocolParams ?? <String, dynamic>{};
    final res = enc.encode(params);
    final int freq = (button.frequency != null && button.frequency! > 0)
        ? button.frequency!
        : res.frequencyHz;
    _validateFrequency(freq);
    _validatePattern(res.pattern, where: 'previewProtocol');
    return IrPreview(
      frequencyHz: freq,
      pattern: res.pattern,
      mode: 'protocol:$id',
    );
  }

  if (button.code != null) {
    final pattern = convertNECtoList(button.code!);
    _validatePattern(pattern, where: 'previewNecDefault');
    return IrPreview(
      frequencyHz: kDefaultNecFrequencyHz,
      pattern: pattern,
      mode: 'legacy_nec_default',
    );
  }

  throw StateError('IRButton has neither raw data nor hex code to preview');
}

Future<void> sendIR(IRButton button) async {
  final hasRaw = button.rawData != null && button.rawData!.trim().isNotEmpty;
  final hasFreq = button.frequency != null && button.frequency! > 0;

  if (hasRaw && hasFreq) {
    if (isNecConfigString(button.rawData)) {
      if (button.code != null) {
        final params = parseNecParamsFromString(button.rawData!);
        final useLsb =
            (button.necBitOrder ?? 'msb').toLowerCase().trim() == 'lsb';
        final pattern = useLsb
            ? buildNecPatternLSBFirst(button.code!, params: params)
            : buildNecPatternFromStoredCodeMSBFirst(button.code!,
                params: params);
        await transmitRaw(
            button.frequency ?? kDefaultNecFrequencyHz, pattern);
        return;
      } else {
        throw StateError('Custom NEC timings provided but hex code is missing');
      }
    }

    final parts = button.rawData!
        .split(RegExp(r'\s+'))
        .where((e) => e.isNotEmpty)
        .toList(growable: false);
    if (parts.isEmpty) {
      throw FormatException('Raw data is empty');
    }
    final List<int> pattern = <int>[];
    for (int i = 0; i < parts.length; i++) {
      final parsed = int.tryParse(parts[i]);
      if (parsed == null) {
        throw FormatException(
            'Invalid integer in raw data at index $i: "${parts[i]}"');
      }
      pattern.add(parsed);
    }
    await transmitRaw(button.frequency!, pattern);
    return;
  }

  if (button.code != null &&
      (button.protocol == null || button.protocol!.trim().isEmpty)) {
    await transmit(button.code!);
    return;
  }

  if (button.protocol != null && button.protocol!.trim().isNotEmpty) {
    final id = button.protocol!.trim();
    final enc = IrProtocolRegistry.encoderFor(id);
    final params = button.protocolParams ?? <String, dynamic>{};
    final res = enc.encode(params);
    final int freq = (button.frequency != null && button.frequency! > 0)
        ? button.frequency!
        : res.frequencyHz;
    await transmitRaw(freq, res.pattern);
    return;
  }

  throw StateError('IRButton has neither raw data nor hex code to send');
}
