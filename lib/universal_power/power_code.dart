class PowerCode {
  final String protocolId;
  final String hexCode;
  final String label;
  final String? brand;
  final String? model;
  final int? frequencyHz;
  final List<int>? rawPattern;

  const PowerCode({
    required this.protocolId,
    required this.hexCode,
    required this.label,
    this.brand,
    this.model,
    this.frequencyHz,
    this.rawPattern,
  });
}

int powerLabelRank(String label) {
  final String norm = _normalizeLabel(label);
  if (norm.isEmpty) return 3;

  const primaryExact = <String>{
    'POWER',
    'PWR',
    'OFF',
    'ON',
    'POWER_OFF',
    'POWER_ON',
    'PWR_OFF',
    'PWR_ON',
  };
  const aliases = <String>{
    'STANDBY',
    'SLEEP',
  };
  const secondary = <String>{
    'TV_POWER',
    'SYSTEM_POWER',
    'MAIN_POWER',
    'ALL_POWER',
    'POWER_TOGGLE',
    'PWR_TOGGLE',
  };

  if (primaryExact.contains(norm)) return 0;

  final bool hasPower = norm.contains('POWER') || norm.contains('PWR');
  final bool hasOffOn = norm.contains('OFF') || norm.contains('ON');

  if (hasPower && hasOffOn) return 0;
  if (hasPower) return 1;
  if (aliases.contains(norm)) return 1;
  if (secondary.contains(norm)) return 2;
  return 3;
}

String _normalizeLabel(String label) {
  final String raw = label.trim();
  if (raw.isEmpty) return '';
  final StringBuffer out = StringBuffer();
  bool lastUnderscore = false;
  for (int i = 0; i < raw.length; i++) {
    final int u = raw.codeUnitAt(i);
    final bool isAlphaNum =
        (u >= 48 && u <= 57) || (u >= 65 && u <= 90) || (u >= 97 && u <= 122);
    if (isAlphaNum) {
      out.writeCharCode(u >= 97 && u <= 122 ? (u - 32) : u);
      lastUnderscore = false;
    } else if (!lastUnderscore) {
      out.write('_');
      lastUnderscore = true;
    }
  }
  var s = out.toString();
  while (s.startsWith('_')) {
    s = s.substring(1);
  }
  while (s.endsWith('_')) {
    s = s.substring(0, s.length - 1);
  }
  return s;
}
