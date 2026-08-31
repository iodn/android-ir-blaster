import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/protocols/rca_38.dart';

void main() {
  test('RCA-38 matches the canonical 24-bit frame', () {
    const encoder = Rca38ProtocolEncoder();
    final result = encoder.encode(<String, dynamic>{
      'address': 'A',
      'command': '2B',
    });

    expect(result.frequencyHz, 38700);
    expect(result.pattern.take(2), <int>[3680, 3680]);
    expect(_decodeBits(result.pattern), '101000101011010111010100');
    expect(result.pattern.takeLast(2), <int>[460, 7360]);
  });
}

String _decodeBits(List<int> pattern) {
  final buffer = StringBuffer();
  for (int index = 3; index < 3 + 48; index += 2) {
    buffer.write(pattern[index] == 920 ? '0' : '1');
  }
  return buffer.toString();
}

extension<T> on Iterable<T> {
  Iterable<T> takeLast(int count) => skip(length - count);
}
