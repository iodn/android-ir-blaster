import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/protocols/nrc17.dart';

void main() {
  test('NRC17 wraps the command in synchronization and termination frames', () {
    const encoder = Nrc17ProtocolEncoder();
    final result = encoder.encode(<String, dynamic>{'hex': '5C61'});

    expect(result.frequencyHz, 38000);
    expect(result.pattern, <int>[
      // Synchronization: start + FE + FF.
      500, 2500, 500, 1000, 1000, 500, 500, 500, 500, 500, 500, 500,
      500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500,
      500, 500, 500, 500, 500, 500, 500, 500, 500, 14500,
      // Command 5C and device 16.
      500, 2500, 500, 1000, 500, 500, 1000, 500, 500, 500, 500, 1000,
      1000, 1000, 500, 500, 1000, 500, 500, 1000, 1000, 1000, 500, 500,
      500, 500, 500, 110000,
      // Termination: start + FE + FF.
      500, 2500, 500, 1000, 1000, 500, 500, 500, 500, 500, 500, 500,
      500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500,
      500, 500, 500, 500, 500, 500, 500, 500, 500, 100500,
    ]);
  });
}
