# App updates

Automatic checks are **off by default**. Settings > App updates offers manual
checks and opt-in daily checks while the app is used. GitHub/F-Droid checks
contact GitHub; Play checks use Google Play. No background worker, telemetry,
automatic download, or silent installation is added.

## Channels

- GitHub: download the matching ABI APK, verify its published SHA-256, package,
  newer version code, minimum Android version, ABI and matching signing
  certificate. Android performs final verification and asks before installation.
- F-Droid: GitHub checks announce upstream releases only. Installation stays with
  F-Droid, whose build may arrive later and uses a different signing certificate.
- Play: official in-app updates with a store-page fallback. Play builds exclude
  the APK downloader, its provider, and the package-install permission.
- Unknown source: user chooses GitHub or F-Droid. Signature checks still apply.

Detection uses the build flag, installer identity and certificate pins verified
against GitHub v3.4.2 and F-Droid version-code 40. Different signing keys are
rejected; the updater never uninstalls the app or clears remotes/macros.

## Builds

GitHub/F-Droid APKs use the normal build command, without distribution flags.
GitHub stable tags must be `vMAJOR.MINOR.PATCH` (optionally `+BUILD`), and assets:

- `irblaster-arm64-v8a-release.apk`
- `irblaster-armeabi-v7a-release.apk`
- `irblaster-x86_64-release.apk`

Increase Android versionCode on every release. GitHub must expose asset SHA-256
checksums; missing digests disable downloading rather than bypassing verification.

For Google Play:

```sh
flutter build appbundle --release --no-tree-shake-icons \
  --split-debug-info=android/app/debug-info \
  --dart-define=IRBLASTER_DISTRIBUTION=play
```

This also hides donations. The existing `IRBLASTER_HIDE_DONATIONS=true` flag
remains compatible and selects the same Play-safe build. Bundles without either
flag fail early.

### Required F-Droid metadata change

Before publishing, add this entry to the new build's existing `rm` list in
**fdroiddata**, `metadata/org.nslabs.ir_blaster.yml` (keep all existing entries):

```yaml
rm:
  - android/app/src/playUpdates
```

This removes the proprietary Play SDK declaration/source before scanning.
Default APK builds do not need that directory. This is an external metadata
change, not something this application repository can apply itself.

## Release verification

1. Fresh install: no update requests before consent or a manual check.
2. GitHub: physical-device update to a higher-version same-key APK; verify cancel,
   permission denial/retry, and retained remotes/macros.
3. Reject altered APKs, wrong signatures/ABI, equal or older version codes.
4. F-Droid: only its store action is offered; no GitHub APK installation.
5. Play: test through an internal track/app sharing with an eligible account and
   higher version code. Sideloaded debug tests do not prove the Play update flow.
6. Play merged manifest: no REQUEST_INSTALL_PACKAGES or UpdateFileProvider.
   Direct build: no Play SDK dependency.
7. Compact screens, enlarged text, translated UI, unknown-source selection.

## References

- [Google Play in-app updates](https://developer.android.com/guide/playcore/in-app-updates)
- [Play update testing](https://developer.android.com/guide/playcore/in-app-updates/test)
- [F-Droid build metadata](https://f-droid.org/docs/Build_Metadata_Reference/)
- [GitHub release API](https://docs.github.com/en/rest/releases/releases#get-the-latest-release)
