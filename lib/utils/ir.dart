import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'remote.dart';

const platform = MethodChannel('org.nslabs/irtransmitter');

/// Default NEC carrier frequency used when sending prebuilt (hex) patterns
/// through transmit(). This matches typical NEC remotes (~38 kHz).
const int kDefaultNecFrequencyHz = 38000;

/// NEC timing parameters holder (microseconds).
class NECParams {
  final int headerMark;   // e.g., 9000
  final int headerSpace;  // e.g., 4500
  final int bitMark;      // e.g., 560
  final int zeroSpace;    // e.g., 560
  final int oneSpace;     // e.g., 1690
  final int trailerMark;  // e.g., 560

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

/// Detects if a rawData string encodes a custom NEC config.
bool isNecConfigString(String? rawData) {
  if (rawData == null) return false;
  return rawData.trimLeft().toUpperCase().startsWith('NEC:');
}

/// Parses a custom NEC config string in one of these forms:
/// - "NEC:h=9000,4500;b=560,560,1690;t=560"
/// - "NEC:9000,4500,560,560,1690,560"
/// Unknown or malformed values fall back to NECParams.defaults.
NECParams parseNecParamsFromString(String rawData) {
  try {
    final String s = rawData.trim();
    final int idx = s.toUpperCase().indexOf('NEC:');
    if (idx != 0) return NECParams.defaults;
    final String body = s.substring(4).trim();

    if (body.contains('=') || body.contains(';')) {
      // Keyed format
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
      // Simple 6-number CSV format
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
        final zeroSpace = int.tryParse(nums[3]) ?? NECParams.defaults.zeroSpace;
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

/// Builds a NEC timing pattern for a 32-bit stored code using MSB-first bit order.
/// Rationale:
/// - Many saved NEC codes are already bit-reversed per byte (LIRC-style).
/// - Sending MSB-first of that stored value yields LSB-first on the wire.
/// Times are in microseconds; returns a list alternating mark/space durations.
List<int> buildNecPatternFromStoredCodeMSBFirst(int code32,
    {NECParams params = NECParams.defaults}) {
  final int nec = code32 & 0xFFFFFFFF;

  final List<int> pattern = [];
  // Start of frame
  pattern.add(params.headerMark);
  pattern.add(params.headerSpace);

  // 32 bits, MSB first of stored value
  for (int i = 31; i >= 0; i--) {
    final int bit = (nec >> i) & 0x1;
    pattern.add(params.bitMark);
    if (bit == 0) {
      pattern.add(params.zeroSpace);
    } else {
      pattern.add(params.oneSpace);
    }
  }

  // Trailer mark
  pattern.add(params.trailerMark);

  return pattern;
}

/// Optional builder if you ever store non-bit-reversed raw signals and want literal LSB-first.
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

/// Validates durations are positive (> 0).
void _validatePattern(List<int> pattern, {String where = 'pattern'}) {
  for (int i = 0; i < pattern.length; i++) {
    final v = pattern[i];
    if (v <= 0) {
      throw ArgumentError.value(v, '$where[$i]', 'Duration must be > 0 µs');
    }
  }
}

/// Validates frequency is within a reasonable IR range.
void _validateFrequency(int frequencyHz) {
  // Typical IR carrier is ~30–60 kHz; allow a safe range.
  const int minHz = 15000;
  const int maxHz = 60000;
  if (frequencyHz < minHz || frequencyHz > maxHz) {
    throw RangeError.range(
      frequencyHz,
      minHz,
      maxHz,
      'frequency',
      'IR carrier frequency must be between $minHz and $maxHz Hz',
    );
  }
}

/// Transmits a hex (NEC) code using default NEC timings (compat MSB-first on stored value).
/// Uses platform's default carrier if 'transmit' path is taken on Android.
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

/// Transmits raw IR data given a frequency and pattern.
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

/// Checks if the device has an IR emitter.
Future<bool> hasIrEmitter() async {
  try {
    final result = await platform.invokeMethod("hasIrEmitter");
    return result == true;
  } catch (e, st) {
    // Report but don't crash app flow; absence will be handled by UI.
    _reportFlutterError('hasIrEmitter()', e, st);
    return false;
  }
}

/// Converts a NEC code into a timing list using correct NEC timings and MSB-first
/// over the stored 32-bit value to maintain backward compatibility with existing
/// saved codes (LIRC-style bytes).
List<int> convertNECtoList(int nec) {
  return buildNecPatternFromStoredCodeMSBFirst(nec, params: NECParams.defaults);
}

/// Helper function that sends the IR signal based on the button type.
/// If the button contains rawData and frequency:
///   - If rawData encodes "NEC:..." custom timings and the button has a hex code,
///     it synthesizes a NEC pattern from the stored code and transmits as raw
///     at the provided frequency. Bit order can be chosen via button.necBitOrder:
///       * 'lsb' => literal LSB-first
///       * 'msb' (default) => MSB-first over stored value (compat with LIRC-style)
///   - Otherwise it parses rawData as space-separated integers and transmits raw.
/// Else if the button has a hex NEC code, it uses default NEC timings.
Future<void> sendIR(IRButton button) async {
  final hasRaw = button.rawData != null && button.rawData!.trim().isNotEmpty;
  final hasFreq = button.frequency != null && button.frequency! > 0;

  if (hasRaw && hasFreq) {
    if (isNecConfigString(button.rawData)) {
      // Custom NEC timings path
      if (button.code != null) {
        final params = parseNecParamsFromString(button.rawData!);
        final useLsb =
            (button.necBitOrder ?? 'msb').toLowerCase().trim() == 'lsb';
        final pattern = useLsb
            ? buildNecPatternLSBFirst(button.code!, params: params)
            : buildNecPatternFromStoredCodeMSBFirst(button.code!, params: params);
        await transmitRaw(button.frequency ?? kDefaultNecFrequencyHz, pattern);
        return;
      } else {
        throw StateError('Custom NEC timings provided but hex code is missing');
      }
    }

    // Regular raw pattern path
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

  if (button.code != null) {
    await transmit(button.code!);
    return;
  }

  throw StateError('IRButton has neither raw data nor hex code to send');
}
