import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/state/app_locale.dart';
import 'package:irblaster_controller/state/app_shortcuts.dart';
import 'package:irblaster_controller/state/continue_context_prefs.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/utils/ir_transmitter_platform.dart';
import 'package:irblaster_controller/widgets/ir_finder_screen.dart';
import 'package:irblaster_controller/widgets/macros_tab.dart';
import 'package:irblaster_controller/widgets/remote_list.dart';
import 'package:irblaster_controller/widgets/settings_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  // Global capabilities listener for USB Audio auto-select
  StreamSubscription<IrTransmitterCapabilities>? _capsEventsSub;

  int _index = 0;

  final List<Widget> _pages = const <Widget>[
    RemoteList(),
    MacrosTab(),
    IrFinderScreen(),
    SettingsScreen(),
  ];

  IrTransmitterCapabilities? _caps;
  StreamSubscription<IrTransmitterCapabilities>? _capsSub;

  bool _startupNoticeShown = false;
  bool _bannerDismissed = false;
  bool _busy = false;

  bool _startupSheetOpen = false;
  BuildContext? _startupSheetContext;

  @override
  void initState() {
    super.initState();

    _listenCaps();
    unawaited(_loadCapsAndMaybeShowStartupNotice());
    continueContextsRevision.addListener(_handleShortcutInputsChanged);
    AppLocaleController.instance.addListener(_handleShortcutInputsChanged);

    _capsEventsSub = IrTransmitterPlatform.capabilitiesEvents().listen(_onCaps);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      unawaited(AppShortcutController.instance.sync(context.l10n));
    });
  }

  @override
  void dispose() {
    continueContextsRevision.removeListener(_handleShortcutInputsChanged);
    AppLocaleController.instance.removeListener(_handleShortcutInputsChanged);
    _capsEventsSub?.cancel();
    _capsEventsSub = null;

    _capsSub?.cancel();
    _capsSub = null;

    _startupSheetContext = null;
    super.dispose();
  }

  void _handleShortcutInputsChanged() {
    if (!mounted) return;
    unawaited(AppShortcutController.instance.sync(context.l10n));
  }

  void _closeStartupSheetIfOpen() {
    final ctx = _startupSheetContext;
    if (!_startupSheetOpen || ctx == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final liveCtx = _startupSheetContext;
      if (!_startupSheetOpen || liveCtx == null) return;

      try {
        Navigator.of(liveCtx).pop();
      } catch (_) {
        // ignore
      }
    });
  }

  void _listenCaps() {
    _capsSub = IrTransmitterPlatform.capabilitiesEvents().listen(
      (caps) {
        if (!mounted) return;

        setState(() {
          _caps = caps;
        });

        final needsNotice = _needsHardwareNotice(caps);

        // When hardware becomes available again, reset the banner
        if (!needsNotice && mounted) {
          setState(() {
            _bannerDismissed = false;
          });
          _closeStartupSheetIfOpen();
        }
      },
      onError: (_) {},
      cancelOnError: false,
    );
  }

  Future<void> _loadCapsAndMaybeShowStartupNotice() async {
    try {
      final caps = await IrTransmitterPlatform.getCapabilities();
      if (!mounted) return;

      setState(() => _caps = caps);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _maybeShowStartupNotice(caps);
      });
    } catch (_) {
      // ignore
    }
  }

  bool _isAudio(IrTransmitterType t) {
    return t == IrTransmitterType.audio1Led || t == IrTransmitterType.audio2Led;
  }

  bool _needsHardwareNotice(IrTransmitterCapabilities caps) {
    final audioSelected = _isAudio(caps.currentType);
    return !audioSelected && !caps.hasInternal && !caps.usbReady;
  }

  String _usbUnavailableMessage(
      BuildContext context, IrTransmitterCapabilities caps) {
    switch (caps.usbStatus) {
      case UsbConnectionStatus.permissionRequired:
        return context.l10n.homeUsbPermissionRequiredMessage;
      case UsbConnectionStatus.permissionDenied:
        return context.l10n.homeUsbPermissionDeniedMessage;
      case UsbConnectionStatus.permissionGranted:
        return context.l10n.homeUsbPermissionGrantedMessage;
      case UsbConnectionStatus.openFailed:
        return context.l10n.homeUsbOpenFailedMessage;
      case UsbConnectionStatus.ready:
        return context.l10n.homeUsbReadyMessage;
      case UsbConnectionStatus.noDevice:
        return context.l10n.homeUsbNoDeviceMessage;
    }
  }

  String _usbOptionSubtitle(
      BuildContext context, IrTransmitterCapabilities caps) {
    if (!caps.hasUsb) {
      return context.l10n.homeUsbOptionPlugIn;
    }
    switch (caps.usbStatus) {
      case UsbConnectionStatus.ready:
        return context.l10n.homeUsbOptionReady;
      case UsbConnectionStatus.permissionRequired:
        return context.l10n.homeUsbOptionPermissionRequired;
      case UsbConnectionStatus.permissionDenied:
        return context.l10n.homeUsbOptionPermissionDenied;
      case UsbConnectionStatus.permissionGranted:
        return context.l10n.homeUsbOptionPermissionGranted;
      case UsbConnectionStatus.openFailed:
        return context.l10n.homeUsbOptionOpenFailed;
      case UsbConnectionStatus.noDevice:
        return context.l10n.homeUsbOptionPlugIn;
    }
  }

  String _hardwareBannerSubtitle(
      BuildContext context, IrTransmitterCapabilities caps) {
    if (!caps.hasUsb) {
      return context.l10n.homeHardwareBannerNoInternal;
    }
    switch (caps.usbStatus) {
      case UsbConnectionStatus.permissionRequired:
        return context.l10n.homeHardwareBannerPermissionRequired;
      case UsbConnectionStatus.permissionDenied:
        return context.l10n.homeHardwareBannerPermissionDenied;
      case UsbConnectionStatus.permissionGranted:
        return context.l10n.homeHardwareBannerPermissionGranted;
      case UsbConnectionStatus.openFailed:
        return context.l10n.homeHardwareBannerOpenFailed;
      case UsbConnectionStatus.ready:
        return context.l10n.homeHardwareBannerReady;
      case UsbConnectionStatus.noDevice:
        return context.l10n.homeHardwareBannerNoInternal;
    }
  }

  /// Missing handler you referenced in initState().
  Future<void> _onCaps(IrTransmitterCapabilities caps) async {
    if (!mounted) return;
    setState(() {
      // rebuild
    });
  }

  Future<void> _maybeShowStartupNotice(IrTransmitterCapabilities caps) async {
    if (_startupNoticeShown) return;
    if (!_needsHardwareNotice(caps)) return;

    _startupNoticeShown = true;
    _startupSheetOpen = true;
    _startupSheetContext = null;

    try {
      await showModalBottomSheet<void>(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        ),
        builder: (ctx) {
          _startupSheetContext = ctx;

          final liveCaps = _caps;
          if (liveCaps != null && !_needsHardwareNotice(liveCaps)) {
            _closeStartupSheetIfOpen();
          }

          final theme = Theme.of(ctx);
          final cs = theme.colorScheme;

          final String headline = ctx.l10n.homeHardwareRequiredTitle;
          final String message = _usbUnavailableMessage(ctx, caps);

          final List<_HardwareOption> options = <_HardwareOption>[
            _HardwareOption(
              icon: Icons.usb_rounded,
              title: ctx.l10n.homeUsbDongleRecommended,
              subtitle: _usbOptionSubtitle(ctx, caps),
            ),
            _HardwareOption(
              icon: Icons.graphic_eq_rounded,
              title: ctx.l10n.homeAudioAdapterAlternative,
              subtitle: ctx.l10n.homeAudioAdapterDescription,
            ),
          ];

          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 16 + MediaQuery.of(ctx).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: cs.errorContainer.withValues(alpha: 0.65),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: cs.outlineVariant.withValues(alpha: 0.25),
                        ),
                      ),
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: cs.onErrorContainer,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        headline,
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    IconButton(
                      tooltip: ctx.l10n.close,
                      onPressed: () => Navigator.of(ctx).pop(),
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: cs.outlineVariant.withValues(alpha: 0.22),
                    ),
                  ),
                  child: Text(
                    message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: cs.onSurface.withValues(alpha: 0.85),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ctx.l10n.homeChooseTransmitter,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(height: 8),
                for (final opt in options) ...[
                  _OptionCard(option: opt),
                  const SizedBox(height: 10),
                ],
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          setState(() => _index = 3);
                          Haptics.selectionClick();
                        },
                        icon: const Icon(Icons.settings_rounded),
                        label: Text(ctx.l10n.openSettings),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: _busy
                            ? null
                            : () async {
                                setState(() => _busy = true);
                                try {
                                  final ok = await IrTransmitterPlatform
                                      .usbScanAndRequest();
                                  if (!mounted) return;

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        ok
                                            ? context.l10n
                                                .homeUsbPermissionSentApprove
                                            : context
                                                .l10n.homeUsbDongleNotDetected,
                                      ),
                                    ),
                                  );
                                } catch (_) {
                                  if (!mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        context.l10n
                                            .homeUsbPermissionRequestFailed,
                                      ),
                                    ),
                                  );
                                } finally {
                                  if (mounted) {
                                    setState(() => _busy = false);
                                  }
                                }
                              },
                        icon: const Icon(Icons.usb_rounded),
                        label: Text(_busy
                            ? ctx.l10n.working
                            : ctx.l10n.requestUsbPermission),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  ctx.l10n.homeHardwareTip,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.65),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      );
    } finally {
      _startupSheetOpen = false;
      _startupSheetContext = null;
    }
  }

  Widget _hardwareBanner(BuildContext context) {
    final caps = _caps;
    if (caps == null) return const SizedBox.shrink();
    if (_bannerDismissed) return const SizedBox.shrink();
    if (!_needsHardwareNotice(caps)) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final String title = context.l10n.homeNoIrTransmitterTitle;
    final String subtitle = _hardwareBannerSubtitle(context, caps);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
      child: Card(
        elevation: 0,
        color: cs.errorContainer.withValues(alpha: 0.22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: cs.onErrorContainer.withValues(alpha: 0.95),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: cs.onErrorContainer.withValues(alpha: 0.95),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onErrorContainer.withValues(alpha: 0.88),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        FilledButton.tonalIcon(
                          onPressed: () {
                            setState(() => _index = 3);
                            Haptics.selectionClick();
                          },
                          icon: const Icon(Icons.settings_rounded),
                          label: Text(context.l10n.settingsNavLabel),
                        ),
                        OutlinedButton.icon(
                          onPressed: () =>
                              setState(() => _bannerDismissed = true),
                          icon: const Icon(Icons.close_rounded),
                          label: Text(context.l10n.dismiss),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _hardwareBanner(context),
          Expanded(
            child: IndexedStack(index: _index, children: _pages),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.settings_remote_outlined),
            selectedIcon: Icon(Icons.settings_remote),
            label: context.l10n.remotesNavLabel,
          ),
          NavigationDestination(
            icon: Icon(Icons.playlist_play_rounded),
            selectedIcon: Icon(Icons.playlist_play),
            label: context.l10n.macrosNavLabel,
          ),
          NavigationDestination(
            icon: Icon(Icons.radar_outlined),
            selectedIcon: Icon(Icons.radar),
            label: context.l10n.signalTesterNavLabel,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: context.l10n.settingsNavLabel,
          ),
        ],
      ),
    );
  }
}

class _HardwareOption {
  final IconData icon;
  final String title;
  final String subtitle;

  const _HardwareOption({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class _OptionCard extends StatelessWidget {
  final _HardwareOption option;

  const _OptionCard({required this.option});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Card(
      elevation: 0,
      color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: cs.primaryContainer.withValues(alpha: 0.65),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: cs.outlineVariant.withValues(alpha: 0.22),
                ),
              ),
              child: Icon(option.icon, color: cs.onPrimaryContainer),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.title,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    option.subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurface.withValues(alpha: 0.72),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
