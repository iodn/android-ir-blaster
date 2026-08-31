import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/protocols/proton.dart';

void main() {
  test('Proton uses the canonical 4 ms separator between data bytes', () {
    const encoder = ProtonProtocolEncoder();
    final result = encoder.encode(<String, dynamic>{'hex': '0014'});

    expect(result.frequencyHz, 38500);
    expect(result.pattern.take(2), <int>[8000, 4000]);
    expect(result.pattern.skip(18).take(2), <int>[500, 4000]);
    expect(_decodeBits(result.pattern), '0001010000000000');
    expect(
        result.pattern.fold<int>(0, (sum, duration) => sum + duration), 63000);
  });
}

String _decodeBits(List<int> pattern) {
  final buffer = StringBuffer();
  for (final start in <int>[2, 20]) {
    for (int index = start + 1; index < start + 16; index += 2) {
      buffer.write(pattern[index] == 500 ? '0' : '1');
    }
  }
  return buffer.toString();
}
