import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/protocols/denon.dart';

void main() {
  test('Denon emits the required normal, inverted, normal frame sequence', () {
    const encoder = DenonProtocolEncoder();
    final result = encoder.encode(<String, dynamic>{'hex': '1190'});

    expect(result.frequencyHz, 38000);
    expect(result.pattern.length, 96);
    expect(_decodeFrame(result.pattern, 0), '000100011001000');
    expect(_decodeFrame(result.pattern, 1), '000101100110111');
    expect(_decodeFrame(result.pattern, 2), '000100011001000');
  });
}

String _decodeFrame(List<int> pattern, int frameIndex) {
  final frame = pattern.skip(frameIndex * 32).take(32).toList(growable: false);
  final buffer = StringBuffer();
  for (int index = 1; index < 30; index += 2) {
    buffer.write(frame[index] == 860 ? '0' : '1');
  }
  expect(frame.takeLast(2), <int>[280, 43560]);
  return buffer.toString();
}

extension<T> on Iterable<T> {
  Iterable<T> takeLast(int count) => skip(length - count);
}
