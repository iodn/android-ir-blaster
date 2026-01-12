import 'dart:math';

enum MacroStepType {
  send,
  delay,
  manualContinue,
}

class MacroStep {
  final String id;
  final MacroStepType type;
  final String? buttonId;
  final String? buttonRef;
  final int? delayMs;

  const MacroStep({
    required this.id,
    required this.type,
    this.buttonId,
    this.buttonRef,
    this.delayMs,
  });

  static String newId() {
    final now = DateTime.now().microsecondsSinceEpoch.toRadixString(16);
    final rnd = Random().nextInt(1 << 32).toRadixString(16).padLeft(8, '0');
    return '$now$rnd';
  }

  bool get isValid {
    switch (type) {
      case MacroStepType.send:
        return ((buttonId ?? '').trim().isNotEmpty) || ((buttonRef ?? '').trim().isNotEmpty);
      case MacroStepType.delay:
        return (delayMs ?? -1) >= 0;
      case MacroStepType.manualContinue:
        return true;
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.name,
        'buttonId': buttonId,
        'buttonRef': buttonRef,
        'delayMs': delayMs,
      };

  factory MacroStep.fromJson(Map<String, dynamic> json) {
    final typeStr = json['type'] as String?;
    MacroStepType parsedType;
    try {
      parsedType = MacroStepType.values.firstWhere((e) => e.name == typeStr);
    } catch (_) {
      parsedType = MacroStepType.send;
    }

    final rawId = (json['id'] as String?)?.trim() ?? '';
    var buttonId = (json['buttonId'] as String?)?.trim();
    var buttonRef = (json['buttonRef'] as String?)?.trim();

    if ((buttonRef == null || buttonRef.isEmpty) && buttonId != null && buttonId.isNotEmpty) {
      final looksLikeUuid = RegExp(r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$').hasMatch(buttonId);
      if (!looksLikeUuid) {
        buttonRef = buttonId;
        buttonId = null;
      }
    }

    return MacroStep(
      id: rawId.isEmpty ? MacroStep.newId() : rawId,
      type: parsedType,
      buttonId: buttonId,
      buttonRef: buttonRef,
      delayMs: json['delayMs'] is int ? json['delayMs'] as int? : int.tryParse('${json['delayMs']}'),
    );
  }

  MacroStep copyWith({
    String? id,
    MacroStepType? type,
    String? buttonId,
    String? buttonRef,
    int? delayMs,
  }) {
    return MacroStep(
      id: id ?? this.id,
      type: type ?? this.type,
      buttonId: buttonId ?? this.buttonId,
      buttonRef: buttonRef ?? this.buttonRef,
      delayMs: delayMs ?? this.delayMs,
    );
  }
}
