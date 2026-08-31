import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/protocols/sharp.dart';

void main() {
  test('Sharp emits the required normal, inverted, normal frame sequence', () {
    const encoder = SharpProtocolEncoder();
    final result = encoder.encode(<String, dynamic>{'hex': '81E4'});

    expect(result.frequencyHz, 38000);
    expect(result.pattern.length, 96);
    expect(_decodeFrame(result.pattern, 0), '100000010011110');
    expect(_decodeFrame(result.pattern, 1), '100001101100001');
    expect(_decodeFrame(result.pattern, 2), '100000010011110');
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
