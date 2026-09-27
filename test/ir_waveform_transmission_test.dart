import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final calls = <MethodCall>[];
  setUp(() {
    calls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(platform, (call) async {
      calls.add(call);
      return true;
    });
  });
  tearDown(() => TestDefaultBinaryMessengerBinding
      .instance.defaultBinaryMessenger
      .setMockMethodCallHandler(platform, null));

  final vectors = jsonDecode(
      File('test/fixtures/protocols/reference_vectors.json')
          .readAsStringSync()) as List;
  final buttons = <IRButton>[
    for (final vector in vectors)
      IRButton(
        id: vector['id'],
        image: 'Test',
        isImage: false,
        protocol: vector['id'],
        protocolParams: {...Map<String, dynamic>.from(vector['params'])}
          ..remove('toggle'),
      ),
    const IRButton(
        id: 'legacy', image: 'Test', isImage: false, code: 0x00FF01FE),
    for (final order in ['msb', 'lsb', 'true_lsb'])
      IRButton(
          id: 'custom-nec-$order',
          image: 'Test',
          isImage: false,
          code: 0x00FF01FE,
          frequency: 38000,
          necBitOrder: order,
          rawData: 'NEC:9000 4500 560 560 1690 560'),
    const IRButton(
        id: 'raw-odd',
        image: 'Test',
        isImage: false,
        frequency: 40000,
        rawData: '9000 4500 560'),
    const IRButton(
        id: 'raw-even',
        image: 'Test',
        isImage: false,
        frequency: 38000,
        rawData: '9000 4500 560 560'),
    const IRButton(
        id: 'frequency-override',
        image: 'Test',
        isImage: false,
        protocol: 'nec',
        protocolParams: {'hex': '00FF01FE'},
        frequency: 40000),
    for (final id in ['tiqiaa_learned', 'elksmart_learned'])
      IRButton(
          id: id,
          image: 'Test',
          isImage: false,
          protocol: id,
          protocolParams: const {
            'rawPreview': '9000 4500 560',
            'frequencyHz': 40000
          }),
  ];
  for (final button in buttons) {
    test('${button.id}: chart receives exact single/repeat/new-press payload',
        () async {
      for (final repeat in [false, true, false]) {
        IrPreview? signal;
        await sendIR(button,
            repeat: repeat, onEncoded: (value) => signal = value);
        expect(signal, isNotNull);
        expect(signal!.pattern, calls.last.arguments['list']);
        expect(signal!.frequencyHz,
            calls.last.arguments['frequency'] ?? kDefaultNecFrequencyHz);
        expect(() => signal!.pattern.add(1), throwsUnsupportedError);
      }
    });
  }
}
