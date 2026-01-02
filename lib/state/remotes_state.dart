import 'package:flutter/foundation.dart';
import 'package:irblaster_controller/utils/remote.dart';

/// Shared in-memory remotes list.
/// Keeps existing storage format and logic intact.
List<Remote> remotes = <Remote>[];

/// Increment this to force tabs to rebuild when remotes change outside their State.
final ValueNotifier<int> remotesRevision = ValueNotifier<int>(0);

void notifyRemotesChanged() {
  remotesRevision.value = remotesRevision.value + 1;
}
