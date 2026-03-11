import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/state/transmitter_prefs.dart';
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

    _capsEventsSub =
        IrTransmitterPlatform.capabilitiesEvents().listen(_onCaps);
  }

  @override
  void dispose() {
    _capsEventsSub?.cancel();
    _capsEventsSub = null;

    _capsSub?.cancel();
    _capsSub = null;

    _startupSheetContext = null;
    super.dispose();
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
    return t == IrTransmitterType.audio1Led ||
        t == IrTransmitterType.audio2Led;
  }

  bool _needsHardwareNotice(IrTransmitterCapabilities caps) {
    final audioSelected = _isAudio(caps.currentType);
    return !audioSelected && !caps.hasInternal && !caps.usbReady;
  }

  String _usbUnavailableMessage(IrTransmitterCapabilities caps) {
    switch (caps.usbStatus) {
      case UsbConnectionStatus.permissionRequired:
        return 'This phone does not include a built-in IR emitter. A USB IR dongle is detected, but permission is not granted yet.\n\nApprove the USB permission prompt to enable sending IR.';
      case UsbConnectionStatus.permissionDenied:
        return 'This phone does not include a built-in IR emitter. A USB IR dongle is detected, but USB permission was denied.\n\nRequest permission again and approve the prompt to enable sending IR.';
      case UsbConnectionStatus.permissionGranted:
        return 'This phone does not include a built-in IR emitter. A USB IR dongle is authorized, but it is not initialized yet.';
      case UsbConnectionStatus.openFailed:
        return 'This phone does not include a built-in IR emitter. A USB IR dongle is detected and authorized, but it could not be initialized.\n\nReconnect the dongle and try again.';
      case UsbConnectionStatus.ready:
        return 'This phone does not include a built-in IR emitter.';
      case UsbConnectionStatus.noDevice:
        return 'This phone does not include a built-in IR emitter, and no supported USB IR dongle is currently connected.\n\nYou can still create, import, and manage remotes — but to transmit IR signals you need one of the options below.';
    }
  }

  String _usbOptionSubtitle(IrTransmitterCapabilities caps) {
    if (!caps.hasUsb) {
      return 'Plug in a supported USB IR dongle, then approve permission.';
    }
    switch (caps.usbStatus) {
      case UsbConnectionStatus.ready:
        return 'Ready to use.';
      case UsbConnectionStatus.permissionRequired:
        return 'Plugged in. Permission required.';
      case UsbConnectionStatus.permissionDenied:
        return 'Permission denied. Request it again.';
      case UsbConnectionStatus.permissionGranted:
        return 'Authorized. Initializing dongle.';
      case UsbConnectionStatus.openFailed:
        return 'Authorized, but initialization failed.';
      case UsbConnectionStatus.noDevice:
        return 'Plug in a supported USB IR dongle, then approve permission.';
    }
  }

  String _hardwareBannerSubtitle(IrTransmitterCapabilities caps) {
    if (!caps.hasUsb) {
      return 'This phone has no built-in IR. Connect a USB IR dongle or enable Audio mode in Settings.';
    }
    switch (caps.usbStatus) {
      case UsbConnectionStatus.permissionRequired:
        return 'USB dongle detected. Permission required to send IR.';
      case UsbConnectionStatus.permissionDenied:
        return 'USB permission was denied. Request it again to send IR.';
      case UsbConnectionStatus.permissionGranted:
        return 'USB dongle authorized. Waiting for initialization.';
      case UsbConnectionStatus.openFailed:
        return 'USB dongle authorized, but initialization failed.';
      case UsbConnectionStatus.ready:
        return 'USB is ready.';
      case UsbConnectionStatus.noDevice:
        return 'This phone has no built-in IR. Connect a USB IR dongle or enable Audio mode in Settings.';
    }
  }

  /// Missing handler you referenced in initState().
  Future<void> _onCaps(IrTransmitterCapabilities caps) async {
    final prev = _caps;

    // React only when USB becomes authorized (false -> true)
    final bool becameUsbReady =
        (prev?.usbReady ?? false) == false && caps.usbReady;

    final bool activeIsAudio = _isAudio(caps.currentType);

    if (becameUsbReady && !activeIsAudio) {
      final autoPick = TransmitterPrefs.instance.autoSelectAudioForUsbAudio;

      if (!mounted) return;

      if (autoPick) {
        // Auto-switch with Undo
        final prevType = caps.currentType;

        try {
          await IrTransmitterPlatform.setPreferredType(
            IrTransmitterType.audio1Led,
          );
          await IrTransmitterPlatform.setActiveType(
            IrTransmitterType.audio1Led,
          );
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  const Text('Audio (1 LED) enabled for USB Audio dongle.'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () async {
                  try {
                    await IrTransmitterPlatform.setPreferredType(prevType);
                    await IrTransmitterPlatform.setActiveType(prevType);
                  } catch (_) {
                    // ignore
                  }
                },
              ),
            ),
          );
        } catch (_) {
          // ignore
        }
      } else {
        // Ask user to switch
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'USB Audio dongle detected. Switch to Audio (1 LED)?',
            ),
            action: SnackBarAction(
              label: 'Use Audio',
              onPressed: () async {
                try {
                  await IrTransmitterPlatform.setPreferredType(
                    IrTransmitterType.audio1Led,
                  );
                  await IrTransmitterPlatform.setActiveType(
                    IrTransmitterType.audio1Led,
                  );
                } catch (_) {
                  // ignore
                }
              },
            ),
          ),
        );
      }
    }

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

          const String headline = 'IR hardware required to send commands';
          final String message = _usbUnavailableMessage(caps);

          final List<_HardwareOption> options = <_HardwareOption>[
            _HardwareOption(
              icon: Icons.usb_rounded,
              title: 'USB IR dongle (recommended)',
              subtitle: _usbOptionSubtitle(caps),
            ),
            const _HardwareOption(
              icon: Icons.graphic_eq_rounded,
              title: 'Audio IR adapter (alternative)',
              subtitle:
                  'Settings → IR Transmitter → Audio (1 LED / 2 LED). Requires an audio-to-IR adapter.',
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
                        color: cs.errorContainer.withOpacity(0.65),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: cs.outlineVariant.withOpacity(0.25),
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
                      tooltip: 'Close',
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
                    color: cs.surfaceContainerHighest.withOpacity(0.55),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: cs.outlineVariant.withOpacity(0.22),
                    ),
                  ),
                  child: Text(
                    message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: cs.onSurface.withOpacity(0.85),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose a transmitter',
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
                        label: const Text('Open Settings'),
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
                                            ? 'USB permission request sent. Approve the prompt to enable USB.'
                                            : 'No supported USB IR dongle detected. Plug it in and try again.',
                                      ),
                                    ),
                                  );
                                } catch (_) {
                                  if (!mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Failed to request USB permission.',
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
                        label:
                            Text(_busy ? 'Working…' : 'Request USB permission'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Tip: You can still build and organize remotes now. Hardware is only required when transmitting.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurface.withOpacity(0.65),
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

    const String title = 'No IR transmitter available';
    final String subtitle = _hardwareBannerSubtitle(caps);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
      child: Card(
        elevation: 0,
        color: cs.errorContainer.withOpacity(0.22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: cs.onErrorContainer.withOpacity(0.95),
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
                        color: cs.onErrorContainer.withOpacity(0.95),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onErrorContainer.withOpacity(0.88),
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
                          label: const Text('Settings'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () =>
                              setState(() => _bannerDismissed = true),
                          icon: const Icon(Icons.close_rounded),
                          label: const Text('Dismiss'),
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
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.settings_remote_outlined),
            selectedIcon: Icon(Icons.settings_remote),
            label: 'Remotes',
          ),
          NavigationDestination(
            icon: Icon(Icons.playlist_play_rounded),
            selectedIcon: Icon(Icons.playlist_play),
            label: 'Macros',
          ),
          NavigationDestination(
            icon: Icon(Icons.radar_outlined),
            selectedIcon: Icon(Icons.radar),
            label: 'Signal Tester',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
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
      color: cs.surfaceContainerHighest.withOpacity(0.55),
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
                color: cs.primaryContainer.withOpacity(0.65),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: cs.outlineVariant.withOpacity(0.22),
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
                      color: cs.onSurface.withOpacity(0.72),
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
