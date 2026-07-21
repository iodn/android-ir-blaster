import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/state/remote_highlights_prefs.dart';
import 'package:irblaster_controller/utils/remote.dart';

void main() {
  test('remote highlight refs prefer stable ids over duplicate names', () {
    final first = Remote(id: 10, name: 'TV', buttons: const []);
    final second = Remote(id: 11, name: 'TV', buttons: const []);
    final ref = RemoteHighlightRef.fromRemote(first);

    expect(ref.matches(first), isTrue);
    expect(ref.matches(second), isFalse);
  });

  test('remote highlight refs keep name fallback for legacy refs without ids',
      () {
    final remote = Remote(id: 10, name: 'TV', buttons: const []);
    final legacyRef = RemoteHighlightRef(
      remoteId: 0,
      remoteName: 'TV',
      buttonCount: 0,
      savedAt: DateTime(2026),
    );

    expect(legacyRef.matches(remote), isTrue);
  });
}
