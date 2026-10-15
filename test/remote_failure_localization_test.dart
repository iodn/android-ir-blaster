import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/state/remotes_state.dart' as state;
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('remote deletion failures stay readable: $locale',
        (tester) async {
      SharedPreferences.setMockInitialValues({});
      final oldRemotes = state.remotes;
      state.remotes = [];
      addTearDown(() => state.remotes = oldRemotes);
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
      final error = StateError('storage unavailable');
      final l10n = await AppLocalizations.delegate.load(locale);
      const name = 'TV / кухня';
      expect(l10n.remoteDeletedNamed(name), contains(name));
      expect(l10n.deletedRemoteUndoUnavailable(name), contains(name));
      expect(l10n.remoteUpdatedNamedButton(name), contains(name));
      expect(l10n.remoteDeleteFailed(error.toString()),
          contains(error.toString()));
      for (final failure in [true, false]) {
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
            remote: Remote(id: 404, name: 'TV', buttons: []),
            onDeleteRemote: failure
                ? () async {
                    throw error;
                  }
                : null,
          ),
        ));
        await tester.pumpAndSettle();
        await tester.tap(find.byTooltip(l10n.manageRemote));
        await tester.pumpAndSettle();
        final action = find.text(l10n.deleteRemoteTitle);
        await tester.ensureVisible(action);
        await tester.pumpAndSettle();
        await tester.tap(action);
        await tester.pumpAndSettle();
        await tester.tap(find.text(l10n.delete));
        await tester.pumpAndSettle();
        final text = find.text(failure
            ? l10n.remoteDeleteFailed(error.toString())
            : l10n.remoteNotFoundSavedList);
        expect(text, findsOneWidget);
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse);
        expect(paragraph.getMaxIntrinsicHeight(paragraph.size.width),
            lessThanOrEqualTo(paragraph.size.height + 0.1));
        expect(tester.getRect(text).left, greaterThanOrEqualTo(0));
        expect(tester.getRect(text).right, lessThanOrEqualTo(320));
        expect(state.remotes, isEmpty);
        expect(find.byType(RemoteView), findsOneWidget);
        await tester.pumpWidget(const SizedBox());
        await tester.pumpAndSettle();
      }
    });
  }
}
