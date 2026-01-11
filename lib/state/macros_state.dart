import 'package:flutter/foundation.dart';
import 'package:irblaster_controller/models/timed_macro.dart';

List<TimedMacro> macros = <TimedMacro>[];
final ValueNotifier<int> macrosRevision = ValueNotifier<int>(0);

void notifyMacrosChanged() {
  macrosRevision.value = macrosRevision.value + 1;
}

void setMacros(List<TimedMacro> next) {
  macros = List<TimedMacro>.from(next);
  notifyMacrosChanged();
}
