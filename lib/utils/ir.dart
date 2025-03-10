import 'package:flutter/services.dart';
import 'remote.dart';

const platform = MethodChannel('org.nslabs/irtransmitter');

/// Transmits a hex (NEC) code.
void transmit(int code) async {
  await platform.invokeMethod("transmit", {"list": convertNECtoList(code)});
}

/// Transmits raw IR data given a frequency and pattern.
void transmitRaw(int frequency, List<int> pattern) async {
  await platform
      .invokeMethod("transmitRaw", {"frequency": frequency, "list": pattern});
}

/// Checks if the device has an IR emitter.
Future<bool> hasIrEmitter() async {
  return await platform.invokeMethod("hasIrEmitter");
}

/// Converts a NEC code into a timing list.
List<int> convertNECtoList(int nec) {
  List<int> list = [];
  list.add(9045);
  list.add(4050);

  String str = nec.toRadixString(2);
  str = str.padLeft(32, '0');

  for (int i = 0; i < str.length; i++) {
    list.add(600);
    if (str[i] == "0") {
      list.add(550);
    } else {
      list.add(1650);
    }
  }
  list.add(600);
  return list;
}

/// Helper function that sends the IR signal based on the button type.
/// If the button contains rawData and frequency, it sends a raw signal;
/// otherwise it transmits a hex NEC code.
void sendIR(IRButton button) {
  if (button.rawData != null && button.frequency != null) {
    List<int> pattern =
        button.rawData!.split(' ').map((e) => int.tryParse(e) ?? 0).toList();
    transmitRaw(button.frequency!, pattern);
  } else if (button.code != null) {
    transmit(button.code!);
  }
}
