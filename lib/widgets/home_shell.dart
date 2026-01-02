import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/utils/ir_transmitter_platform.dart';
import 'package:irblaster_controller/widgets/ir_finder_screen.dart';
import 'package:irblaster_controller/widgets/remote_list.dart';
import 'package:irblaster_controller/widgets/settings_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;
  final List<Widget> _pages = const <Widget>[
    RemoteList(),
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
  }

  @override
  void dispose() {
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
      } catch (_) {}
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

        /* If hardware becomes available, clear banner automatically. */
        if (!needsNotice) {
          if (mounted) {
            setState(() {
              _bannerDismissed = false;
            });
          }
        }

        /* Auto-close the startup bottom sheet once USB is ready / notice no longer needed. */
        if (!needsNotice) {
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
      /* Non-fatal: app still works for browsing/remotes creation. */
    }
  }

  bool _isAudio(IrTransmitterType t) {
    return t == IrTransmitterType.audio1Led || t == IrTransmitterType.audio2Led;
  }

  bool _needsHardwareNotice(IrTransmitterCapabilities caps) {
    /* Notice is specifically for: no internal IR + USB not ready. */
    /* If user is in Audio mode, we do not block them with this notice. */
    final audioSelected = _isAudio(caps.currentType);
    return !audioSelected && !caps.hasInternal && !caps.usbReady;
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

          final bool hasUsb = caps.hasUsb;
          final bool usbReady = caps.usbReady;

          final String headline = 'IR hardware required to send commands';
          final String message = (!hasUsb)
              ? 'This phone does not include a built-in IR emitter, and no supported USB IR dongle is currently connected.\n\n'
                  'You can still create, import, and manage remotes — but to transmit IR signals you need one of the options below.'
              : (!usbReady)
                  ? 'This phone does not include a built-in IR emitter. A USB IR dongle is detected, but permission is not granted yet.\n\n'
                      'Approve the USB permission prompt to enable sending IR.'
                  : 'This phone does not include a built-in IR emitter.';

          final List<_HardwareOption> options = <_HardwareOption>[
            _HardwareOption(
              icon: Icons.usb_rounded,
              title: 'USB IR dongle (recommended)',
              subtitle: hasUsb
                  ? (usbReady
                      ? 'Ready to use.'
                      : 'Plugged in — permission required.')
                  : 'Plug in a supported USB IR dongle, then approve permission.',
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
                          setState(() => _index = 2);
                          HapticFeedback.selectionClick();
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
                                          'Failed to request USB permission.'),
                                    ),
                                  );
                                } finally {
                                  if (mounted) setState(() => _busy = false);
                                }
                              },
                        icon: const Icon(Icons.usb_rounded),
                        label: Text(_busy ? 'Working…' : 'Request USB permission'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Tip: You can still build and organize remotes now. Hardware is only required when transmitting.',
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
    final bool hasUsb = caps.hasUsb;
    final bool usbReady = caps.usbReady;

    final String title = 'No IR transmitter available';
    final String subtitle = hasUsb
        ? (usbReady
            ? 'USB is ready.'
            : 'USB dongle detected — permission required to send IR.')
        : 'This phone has no built-in IR. Connect a USB IR dongle or enable Audio mode in Settings.';

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
                            setState(() => _index = 2);
                            HapticFeedback.selectionClick();
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
                border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.22)),
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
