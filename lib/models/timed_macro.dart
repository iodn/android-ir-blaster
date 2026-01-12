import 'macro_step.dart';

class TimedMacro {
  final String id;
  final String name;
  final String remoteName;
  final List<MacroStep> steps;
  final int version;

  const TimedMacro({
    required this.id,
    required this.name,
    required this.remoteName,
    required this.steps,
    this.version = 1,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'remoteName': remoteName,
        'steps': steps.map((s) => s.toJson()).toList(),
        'version': version,
      };

  factory TimedMacro.fromJson(Map<String, dynamic> json) {
    final stepsRaw = json['steps'] as List<dynamic>? ?? const [];
    final steps = stepsRaw.whereType<Map>().map((e) => MacroStep.fromJson(e.cast<String, dynamic>())).toList();

    final id = (json['id'] as String?)?.trim() ?? '';
    final name = (json['name'] as String?)?.trim();
    final remoteName = (json['remoteName'] as String?)?.trim() ?? '';

    final hasVersion = json.containsKey('version');
    final parsedVersion = json['version'] is int ? json['version'] as int? : int.tryParse('${json['version']}');
    final version = hasVersion ? (parsedVersion ?? 0) : 0;

    return TimedMacro(
      id: id.isEmpty ? DateTime.now().millisecondsSinceEpoch.toString() : id,
      name: (name == null || name.isEmpty) ? 'Untitled Macro' : name,
      remoteName: remoteName,
      steps: steps,
      version: version,
    );
  }

  TimedMacro copyWith({
    String? id,
    String? name,
    String? remoteName,
    List<MacroStep>? steps,
    int? version,
  }) {
    return TimedMacro(
      id: id ?? this.id,
      name: name ?? this.name,
      remoteName: remoteName ?? this.remoteName,
      steps: steps ?? this.steps,
      version: version ?? this.version,
    );
  }
}
