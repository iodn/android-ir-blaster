import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    for (final count in [0, 101]) {
      testWidgets(
          'remote header count fits with back navigation: $locale / $count',
          (tester) async {
        SharedPreferences.setMockInitialValues({});
        const channel = MethodChannel('org.nslabs/irtransmitter');
        final messenger =
            TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
        messenger.setMockMethodCallHandler(
            channel, (_) async => {'hasInternal': true});
        addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
        tester.view.physicalSize = const Size(320, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        await tester.pumpWidget(MaterialApp(
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(2)),
            child: child!,
          ),
          home: Builder(
              builder: (context) => TextButton(
                    child: const Text('Open'),
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (_) => RemoteView(
                          remote: Remote(
                              name: 'TV',
                              buttons: List.generate(
                                  count,
                                  (i) => IRButton(
                                      id: '$i', image: 'P', isImage: false)))),
                    )),
                  )),
        ));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();
        final l10n =
            AppLocalizations.of(tester.element(find.byType(RemoteView)))!;
        final label = find.text(l10n.remoteButtonCountSummary(count));
        expect(label, findsOneWidget);
        final paragraph = tester.renderObject<RenderParagraph>(label);
        expect(paragraph.didExceedMaxLines, isFalse);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1));
        final bounds = tester.getRect(find.byType(AppBar));
        final rect = tester.getRect(label);
        expect(rect.top, greaterThanOrEqualTo(bounds.top));
        expect(rect.bottom, lessThanOrEqualTo(bounds.bottom));
        expect(rect.left, greaterThanOrEqualTo(0));
        expect(rect.right, lessThanOrEqualTo(320));
        if (count == 0) {
          final description = find.text(l10n.remoteNoButtonsDescription);
          await tester.ensureVisible(description);
          await tester.pumpAndSettle();
          final body = tester.renderObject<RenderParagraph>(description);
          expect(body.didExceedMaxLines, isFalse);
          expect(body.getMaxIntrinsicHeight(body.size.width),
              lessThanOrEqualTo(body.size.height + 0.1));
          final manage = find.widgetWithText(FilledButton, l10n.manageRemote);
          await tester.ensureVisible(manage);
          await tester.pumpAndSettle();
          expect(manage.hitTestable(), findsOneWidget);
        }
        await tester.pumpWidget(const SizedBox());
        await tester.pumpAndSettle();
      });
    }
  }
}
