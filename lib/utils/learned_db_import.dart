import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/ir_finder/ir_signal_matcher.dart';
import 'package:irblaster_controller/utils/db_button_import.dart';
import 'package:irblaster_controller/utils/remote.dart';

/// A button learned in Learning Mode and, if the app could identify it, its
/// database code. [code] is null for signals that are neither NEC nor RC5.
class LearnedButton {
  const LearnedButton(this.button, this.code);

  final IRButton button;
  final DecodedIrSignal? code;
}

/// Buttons to add when a suggested database remote is imported after learning.
///
/// Every learned button is kept, including the ones the app could not identify,
/// and they come first. A key of the database remote is left out only when it
/// has exactly the same protocol and hexcode as a learned button, so that code
/// is not added twice. Keys that cannot be turned into a button are skipped.
List<IRButton> mergeLearnedWithDbRemote({
  required List<LearnedButton> learned,
  required List<IrDbKeyCandidate> remoteKeys,
  String unnamedLabel = '',
}) {
  final learnedCodes = <String>{
    for (final item in learned)
      if (item.code != null) item.code!.key,
  };
  final buttons = <IRButton>[for (final item in learned) item.button];
  for (final key in remoteKeys) {
    if (learnedCodes.contains(DecodedIrSignal.keyFor(key.protocol, key.hexcode))) {
      continue;
    }
    final button = buildButtonFromDbRow(key, unnamedLabel: unnamedLabel);
    if (button != null) buttons.add(button);
  }
  return buttons;
}
