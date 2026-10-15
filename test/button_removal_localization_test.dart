import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/remote_editor/remote_editor_actions.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets(
        'removal confirmation is readable and identifies buttons: $locale',
        (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      late BuildContext host;
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: Builder(builder: (context) {
          host = context;
          return const Scaffold();
        }),
      ));
      final l10n = AppLocalizations.of(host)!;
      for (final button in [
        const IRButton(
            id: 'named', image: 'Living room television power', isImage: false),
        const IRButton(
            id: 'image', image: '/private/button.png', isImage: true),
        IRButton(
            id: 'icon',
            image: '',
            isImage: false,
            iconCodePoint: Icons.power_settings_new.codePoint,
            iconFontFamily: 'MaterialIcons'),
      ]) {
        for (final confirm in [false, true]) {
          final result = RemoteEditorActions.confirmDeleteButton(host, button);
          await tester.pumpAndSettle();
          final message = button.isImage || button.image.isEmpty
              ? l10n.imageButtonRemovedMessage
              : l10n.namedButtonRemovedMessage(button.image);
          expect(find.text(message), findsOneWidget);
          for (final text in [
            l10n.removeButtonTitle,
            message,
            l10n.cancel,
            l10n.remove
          ]) {
            final p = tester.renderObject<RenderParagraph>(find.text(text));
            expect(p.didExceedMaxLines, isFalse, reason: text);
            expect(p.getMaxIntrinsicHeight(p.size.width),
                lessThanOrEqualTo(p.size.height + 0.1),
                reason: text);
          }
          await tester.tap(find.text(confirm ? l10n.remove : l10n.cancel));
          await tester.pumpAndSettle();
          expect(await result, confirm);
          expect(tester.takeException(), isNull);
        }
      }
    });
  }
}
