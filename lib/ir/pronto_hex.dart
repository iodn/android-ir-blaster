class ProntoRawSignal {
  final int frequencyHz;
  final String rawDurations;
  const ProntoRawSignal(
      {required this.frequencyHz, required this.rawDurations});
}

ProntoRawSignal? tryParseProntoHexToRaw(String payload) {
  final cleaned = payload.replaceAll('\r', ' ').replaceAll('\n', ' ').trim();
  if (cleaned.isEmpty) return null;

  final tokens =
      cleaned.split(RegExp(r'\s+')).where((e) => e.isNotEmpty).toList();
  if (tokens.length < 6) return null;

  bool looksHex = true;
  for (final t in tokens.take(4)) {
    if (!RegExp(r'^[0-9A-Fa-f]{4}$').hasMatch(t)) {
      looksHex = false;
      break;
    }
  }
  if (!looksHex) return null;

  final List<int> words = <int>[];
  for (final t in tokens) {
    final v = int.tryParse(t, radix: 16);
    if (v == null) return null;
    words.add(v);
  }

  final int type = words[0];
  final int freqWord = words[1];
  if (type != 0x0000 && type != 0x0100) return null;
  if (freqWord <= 0) return null;

  final int seq1 = words[2];
  final int seq2 = words[3];
  final int totalPairs = (seq1 + seq2) * 2;
  final int requiredWords = 4 + totalPairs;
  if (words.length < requiredWords) return null;

  final double carrierPeriodUs = freqWord * 0.241246;
  if (carrierPeriodUs <= 0) return null;

  final int freqHz = (1000000.0 / carrierPeriodUs).round().clamp(10000, 200000);
  final List<int> durations = <int>[];

  for (int i = 4; i < requiredWords; i++) {
    final int w = words[i];
    if (w <= 0) return null;
    final int us = (w * carrierPeriodUs).round();
    if (us <= 0) return null;
    durations.add(us);
  }

  if (durations.length < 6) return null;
  return ProntoRawSignal(
    frequencyHz: freqHz,
    rawDurations: durations.join(' '),
  );
}
