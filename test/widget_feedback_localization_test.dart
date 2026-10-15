import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('widget feedback wraps with enlarged text: $locale',
        (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final messenger = GlobalKey<ScaffoldMessengerState>();
      late AppLocalizations l10n;
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        scaffoldMessengerKey: messenger,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.5)),
          child: child!,
        ),
        home: Builder(builder: (context) {
          l10n = AppLocalizations.of(context)!;
          return const Scaffold(body: SizedBox.expand());
        }),
      ));
      const diagnostic = 'PlatformException(WIDGET_ERROR, unavailable)';
      expect(l10n.homeWidgetSetupFailed(diagnostic), contains(diagnostic));
      for (final message in [
        l10n.homeDeviceControlsShown,
        l10n.homeDeviceControlsHidden,
        l10n.homeWidgetUnsupportedLauncher,
        l10n.homeWidgetButtonUnsupported,
        l10n.homeWidgetRequestSent,
        l10n.homeWidgetRequestRejected,
        l10n.homeWidgetSetupFailed(diagnostic),
      ]) {
        messenger.currentState!.showSnackBar(SnackBar(content: Text(message)));
        await tester.pumpAndSettle();
        expect(find.text(message), findsOneWidget);
        expect(tester.takeException(), isNull, reason: '$locale: $message');
        final bounds = tester.getRect(find.text(message));
        expect(bounds.left, greaterThanOrEqualTo(0));
        expect(bounds.right, lessThanOrEqualTo(320));
        expect(bounds.top, greaterThanOrEqualTo(0));
        expect(bounds.bottom, lessThanOrEqualTo(640));
        messenger.currentState!.removeCurrentSnackBar();
        await tester.pumpAndSettle();
      }
    });
  }
}
