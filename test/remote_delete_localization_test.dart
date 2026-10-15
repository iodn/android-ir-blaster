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
    testWidgets(
        'remote deletion warning is readable and cancel is safe: $locale',
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
      final name =
          List.filled(3, 'Living room TV and media center').join(' / ');
      var deletions = 0;
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: RemoteView(
          remote: Remote(name: name, buttons: []),
          onDeleteRemote: () async {
            deletions++;
          },
        ),
      ));
      await tester.pumpAndSettle();
      final l10n =
          AppLocalizations.of(tester.element(find.byType(RemoteView)))!;
      for (final confirm in [false, true]) {
        await tester.tap(find.byTooltip(l10n.manageRemote));
        await tester.pumpAndSettle();
        final action = find.text(l10n.deleteRemoteTitle);
        await tester.ensureVisible(action);
        await tester.pumpAndSettle();
        await tester.tap(action);
        await tester.pumpAndSettle();
        expect(deletions, 0);
        final message = l10n.deleteRemoteMessage(name);
        expect(message, contains(name));
        for (final value in [
          l10n.deleteRemoteTitle,
          message,
          l10n.cancel,
          l10n.delete
        ]) {
          final text = find.descendant(
              of: find.byType(AlertDialog), matching: find.text(value));
          expect(text, findsOneWidget);
          await tester.ensureVisible(text);
          await tester.pumpAndSettle();
          final paragraph = tester.renderObject<RenderParagraph>(text);
          expect(paragraph.didExceedMaxLines, isFalse);
          expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
              lessThanOrEqualTo(paragraph.size.height + 0.1));
        }
        final choice = find.text(confirm ? l10n.delete : l10n.cancel);
        expect(choice.hitTestable(), findsOneWidget);
        await tester.tap(choice);
        await tester.pumpAndSettle();
        expect(find.byType(AlertDialog), findsNothing);
        expect(deletions, confirm ? 1 : 0);
      }
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();
    });
  }
}
