import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/crash_reporting.dart';
import 'package:irblaster_controller/widgets/crash_report_dialog.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final calls = <MethodCall>[];
  var fail = false;
  var haveReport = true;
  setUp(() {
    calls.clear();
    fail = false;
    haveReport = true;
    for (final channel in [
      CrashReporting.channel,
      const MethodChannel('org.nslabs/irtransmitter')
    ]) {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
        calls.add(call);
        if (fail) throw PlatformException(code: 'unavailable');
        if (call.method == 'previous') {
          if (!haveReport) return null;
          return {'id': '1', 'text': 'Example stack trace'};
        }
        return null;
      });
    }
  });

  Future<void> open(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
          builder: (context) => Scaffold(
                  body: TextButton(
                onPressed: () => showPreviousCrashReport(context),
                child: const Text('Open'),
              ))),
    ));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
  }

  testWidgets('Not now retains report without sending', (tester) async {
    await open(tester);
    await tester.tap(find.text('Not now'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
    expect(calls.map((c) => c.method), ['previous']);
  });

  testWidgets('no report or unavailable storage does not prompt',
      (tester) async {
    haveReport = false;
    await open(tester);
    expect(find.byType(AlertDialog), findsNothing);
    fail = true;
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('review and copy expose the complete report without deleting it',
      (tester) async {
    String? copied;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, (call) async {
      if (call.method == 'Clipboard.setData') {
        copied = call.arguments['text'] as String;
      }
      return null;
    });
    addTearDown(() => TestDefaultBinaryMessengerBinding
        .instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, null));
    await open(tester);
    await tester.tap(find.text('Review report'));
    await tester.pumpAndSettle();
    expect(find.text('Example stack trace'), findsOneWidget);
    await tester.ensureVisible(find.text('Copy'));
    await tester.tap(find.text('Copy'));
    await tester.pumpAndSettle();
    expect(copied, 'Example stack trace');
    expect(calls.where((c) => c.method == 'discard'), isEmpty);
  });

  testWidgets('Don’t send deletes the matching report', (tester) async {
    await open(tester);
    await tester.tap(find.text('Don’t send'));
    await tester.pumpAndSettle();
    expect(calls.last.method, 'discard');
    expect(calls.last.arguments, {'id': '1'});
    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('share and email require explicit taps and retain report',
      (tester) async {
    await open(tester);
    expect(calls.length, 1);
    await tester.tap(find.text('Share report'));
    await tester.pumpAndSettle();
    expect(calls.last.method, 'shareText');
    expect(calls.last.arguments['text'], 'Example stack trace');
    await tester.tap(find.text('Email support'));
    await tester.pumpAndSettle();
    expect(calls.last.method, 'email');
    expect(calls.last.arguments['address'], 'contact@neroteam.com');
    expect(calls.where((c) => c.method == 'discard'), isEmpty);
    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets('missing email app and failed delete retain usable dialog',
      (tester) async {
    await open(tester);
    fail = true;
    await tester.tap(find.text('Email support'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Could not complete'), findsOneWidget);
    await tester.tap(find.text('Don’t send'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.tap(find.text('Not now'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('compact screen with large text has no overflow', (tester) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 1.6;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    await open(tester);
    expect(tester.takeException(), isNull);
    await tester.tap(find.text('Not now'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
  });
}
