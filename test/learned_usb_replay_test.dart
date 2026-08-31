import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('org.nslabs/irtransmitter');
  final calls = <MethodCall>[];

  setUp(() {
    calls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          calls.add(call);
          return true;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test(
    'USB learned signals replay through the stable raw transmitter',
    () async {
      for (final protocol in ['tiqiaa_learned', 'elksmart_learned']) {
        await sendIR(
          IRButton(
            id: protocol,
            image: 'Learned',
            isImage: false,
            protocol: protocol,
            protocolParams: const <String, dynamic>{
              'family': 'usb',
              'frequencyHz': 40000,
              'rawPreview': '9000 4500 560 560',
              'opaqueFrameBase64': 'unsafe-vendor-frame',
            },
          ),
        );
      }

      expect(calls, hasLength(2));
      for (final call in calls) {
        expect(call.method, 'transmitRaw');
        expect(call.arguments, <String, Object>{
          'frequency': 40000,
          'list': <int>[9000, 4500, 560, 560],
        });
      }
    },
  );

  test('Tiqiaa opaque replay is rejected before accessing USB', () async {
    final button = IRButton(
      id: 'legacy-tiqiaa',
      image: 'Learned',
      isImage: false,
      protocol: 'tiqiaa_learned',
      protocolParams: const <String, dynamic>{
        'family': 'tiqiaa',
        'opaqueFrameBase64': 'unsafe-vendor-frame',
      },
    );

    await expectLater(
      sendIR(button),
      throwsA(
        isA<StateError>().having(
          (error) => error.message,
          'message',
          contains('missing raw replay data'),
        ),
      ),
    );
    expect(calls, isEmpty);
  });
}
