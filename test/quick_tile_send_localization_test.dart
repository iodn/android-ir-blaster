import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/last_action_strip.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/quick_tile_chooser.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('localized send outcomes: $locale', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final oldRemotes = state.remotes;
      addTearDown(() {
        state.remotes = oldRemotes;
        clearLastAction();
      });
      const button = IRButton(
          id: 'power',
          image: 'Power',
          isImage: false,
          frequency: 38000,
          rawData: '9000 4500 560 560 560');
      final remote = Remote(id: 1, name: 'TV', buttons: [button]);
      const name = 'TV / кухня';
      final pick = QuickTilePick(remote: remote, button: button, title: name);
      final error =
          PlatformException(code: 'NO_IR', message: 'Emitter unavailable');
      var fail = false;
      var sends = 0;
      const channel = MethodChannel('org.nslabs/irtransmitter');
      final messenger = tester.binding.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(channel, (call) async {
        if (call.method == 'transmitRaw') {
          sends++;
          if (fail) throw error;
          return true;
        }
        return {'hasInternal': true};
      });
      addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final l10n = await AppLocalizations.delegate.load(locale);
      for (final outcome in ['success', 'failure', 'missing']) {
        clearLastAction();
        fail = outcome == 'failure';
        state.remotes = outcome == 'missing'
            ? [Remote(id: 1, name: 'TV', buttons: [])]
            : [remote];
        final before = sends;
        await tester.pumpWidget(MaterialApp(
          key: ValueKey(outcome),
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(2)),
            child: child!,
          ),
          home: Builder(
              builder: (context) => Scaffold(
                    body: TextButton(
                      onPressed: () => sendButtonPick(context, pick),
                      child: const Text('Send'),
                    ),
                  )),
        ));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Send'));
        await tester.pumpAndSettle();
        final value = outcome == 'success'
            ? l10n.sentNamed(name)
            : outcome == 'failure'
                ? l10n.sendFailed(error.toString())
                : l10n.buttonNotFoundInRemotes;
        final text = find.text(value);
        expect(text, findsOneWidget);
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1));
        expect(sends - before, outcome == 'missing' ? 0 : 1);
        expect(
            lastActionStrip.value?.title, outcome == 'success' ? name : null);
        if (outcome == 'success') expect(value, contains(name));
        if (outcome == 'failure') expect(value, contains(error.toString()));
      }
      clearLastAction();
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
