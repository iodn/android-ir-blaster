import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/utils/crash_reporting.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('capture unhandled error once, exclude handled IR failures', () async {
    final calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(CrashReporting.channel, (call) async {
      calls.add(call);
      return null;
    });
    CrashReporting.frameworkError(FlutterErrorDetails(
      exception: StateError('No USB dongle'),
      library: 'IR Blaster',
    ));
    expect(calls, isEmpty);
    await CrashReporting.record(StateError('Unhandled failure'),
        StackTrace.fromString('#0 example.dart:42'));
    expect(calls.single.method, 'record');
    expect(calls.single.arguments['trace'], contains('Unhandled failure'));
    expect(calls.single.arguments['trace'], contains('example.dart:42'));
    expect(calls.single.arguments['trace'], contains('Dart:'));
    await CrashReporting.record(
        StateError('cascading error'), StackTrace.current);
    expect(calls.length, 1);
  });
}
