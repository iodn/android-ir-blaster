import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/state/app_theme.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/ir_transmitter_platform.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remotes_io.dart';
import 'package:irblaster_controller/widgets/about_screen.dart';
import 'package:irblaster_controller/widgets/settings/widgets/donation_sheet.dart';
import 'package:irblaster_controller/widgets/settings/widgets/section_card.dart';
import 'package:irblaster_controller/widgets/settings/widgets/support_pill.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String _repoUrl = 'https://github.com/iodn/android-ir-blaster';
  static const String _issuesUrl = 'https://github.com/iodn/android-ir-blaster/issues';
  static const String _licenseUrl = 'https://github.com/iodn/android-ir-blaster/blob/main/LICENSE';
  static const String _companyUrl = 'https://neroswarm.com';

  static const String _creatorName = 'KaijinLab Inc.';
  static const String _liberapayUrl = 'https://liberapay.com/KaijinLab/donate';

  static const String _btcAddress = 'bc1qtf79uecssueu4u4u86zct46vcs0vcd2cnmvw6f';
  static const String _ethAddress = '0xCaCc52Cd2D534D869a5C61dD3cAac57455f3c2fD';

  Future<void> _launchUrl(BuildContext context, String url) async {
    try {
      final uri = Uri.parse(url);
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('No browser available'),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to open: $e'),
          backgroundColor: Theme.of(context).colorScheme.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }


  Future<void> _copyToClipboard(
    BuildContext context, {
    required String text,
    required String message,
  }) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    HapticFeedback.selectionClick();
  }

  Future<bool> _confirmAction(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmLabel,
    IconData icon = Icons.warning_amber_rounded,
    bool destructive = false,
  }) async {
    final theme = Theme.of(context);
    return await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: Icon(
          icon,
          color: destructive ? theme.colorScheme.error : theme.colorScheme.primary,
          size: 32,
        ),
        title: Text(title),
        content: Text(message, style: theme.textTheme.bodyMedium),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton.tonal(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: destructive
                ? FilledButton.styleFrom(
                    backgroundColor: theme.colorScheme.errorContainer,
                    foregroundColor: theme.colorScheme.onErrorContainer,
                  )
                : null,
            child: Text(confirmLabel),
          ),
        ],
      ),
    ).then((v) => v ?? false);
  }

  Future<void> _doImport(BuildContext context) async {
    final result = await importRemotesFromPicker(context, current: remotes);
    if (result == null) return;

    if (result.remotes.isEmpty && result.message.toLowerCase().contains('failed')) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.message)));
      return;
    }

    remotes = result.remotes;
    await writeRemotelist(remotes);
    remotes = await readRemotes();
    notifyRemotesChanged();

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.message)));
  }

  Future<void> _doExport(BuildContext context) async {
    await exportRemotesToDownloads(context, remotes: remotes);
  }

  Future<void> _restoreDemoRemote(BuildContext context) async {
    final confirmed = await _confirmAction(
      context,
      title: 'Restore demo remotes?',
      message:
          'This will replace your current remotes with the built-in demo remotes. A backup is recommended if you want to keep your current list.',
      confirmLabel: 'Restore demo',
      icon: Icons.restore_rounded,
      destructive: true,
    );
    if (!confirmed) return;

    remotes = writeDefaultRemotes();
    await writeRemotelist(remotes);
    notifyRemotesChanged();

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Demo remotes restored.')));
  }

  Future<void> _deleteAllRemotes(BuildContext context) async {
    final confirmed = await _confirmAction(
      context,
      title: 'Delete all remotes?',
      message: 'This removes every remote from this device. This action can’t be undone.',
      confirmLabel: 'Delete all',
      icon: Icons.delete_forever,
      destructive: true,
    );
    if (!confirmed) return;

    remotes = <Remote>[];
    await writeRemotelist(remotes);
    notifyRemotesChanged();

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All remotes deleted.')));
  }

  void _openDonationSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        return FractionallySizedBox(
          heightFactor: 0.92,
          child: DonationSheet(
            repoUrl: _repoUrl,
            btcAddress: _btcAddress,
            ethAddress: _ethAddress,
            liberapayUrl: _liberapayUrl,
            onCopy: (text, message) => _copyToClipboard(ctx, text: text, message: message),
          ),
        );
      },
    );
  }

  Future<void> _changeTheme(BuildContext context, ThemeMode mode) async {
    await AppThemeController.instance.setMode(mode);
    HapticFeedback.selectionClick();
  }

  String _getThemeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'Auto Theme';
      case ThemeMode.light:
        return 'Light Theme';
      case ThemeMode.dark:
        return 'Dark Theme';
    }
  }

  IconData _getThemeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return Icons.auto_awesome_rounded;
      case ThemeMode.light:
        return Icons.light_mode_rounded;
      case ThemeMode.dark:
        return Icons.dark_mode_rounded;
    }
  }

  String _getThemeDescription(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'Follows your device settings';
      case ThemeMode.light:
        return 'Always bright and clear';
      case ThemeMode.dark:
        return 'Easy on the eyes';
    }
  }

  String _getThemeHint(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'Theme automatically switches when you change your device settings between light and dark mode';
      case ThemeMode.light:
        return 'Perfect for daytime use and well-lit environments';
      case ThemeMode.dark:
        return 'Reduces eye strain in low-light conditions and saves battery on OLED screens';
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          _buildSupportSection(context),
          const SizedBox(height: 10),
          _buildAppearanceSection(context),
          const SizedBox(height: 10),
          _buildIrTransmitterSection(cs),
          const SizedBox(height: 10),
          _buildRemotesSection(context),
          const SizedBox(height: 10),
          _buildAboutSection(context),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: 'Support Development',
        subtitle: 'Keep IR Blaster maintained and hardware-compatible',
        leading: Icon(Icons.volunteer_activism_rounded, color: cs.primary),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      cs.secondaryContainer.withOpacity(0.7),
                      cs.secondaryContainer.withOpacity(0.4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: cs.outlineVariant.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  'No ads, no tracking, no locked features. Your support funds protocol work, USB dongle support, and better compatibility across devices.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: cs.onSecondaryContainer,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => _openDonationSheet(context),
                      icon: const Icon(Icons.favorite_rounded),
                      label: const Text('Donate'),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _launchUrl(context, _repoUrl),
                      onLongPress: () => _copyToClipboard(
                        context,
                        text: _repoUrl,
                        message: 'Repository link copied',
                      ),
                      icon: const Icon(Icons.star_border_rounded),
                      label: const Text('Star Repo'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  SupportPill(icon: Icons.lock_outline_rounded, label: 'Local-only'),
                  SupportPill(icon: Icons.shield_outlined, label: 'No tracking'),
                  SupportPill(icon: Icons.memory_rounded, label: 'Hardware-aware'),
                  SupportPill(icon: Icons.code_rounded, label: 'Open-source'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppearanceSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedBuilder(
        animation: AppThemeController.instance,
        builder: (context, _) {
          final mode = AppThemeController.instance.mode;
          return SectionCard(
            title: 'Appearance',
            subtitle: 'Customize your visual experience',
            leading: Icon(Icons.palette_outlined, color: cs.primary),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          cs.primaryContainer.withOpacity(0.6),
                          cs.primaryContainer.withOpacity(0.3),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: cs.primary.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: cs.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _getThemeIcon(mode),
                            size: 20,
                            color: cs.onPrimary,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getThemeName(mode),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: cs.onPrimaryContainer,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _getThemeDescription(mode),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: cs.onPrimaryContainer.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _ThemeOptionCard(
                          icon: Icons.auto_awesome_rounded,
                          label: 'Auto',
                          isSelected: mode == ThemeMode.system,
                          onTap: () => _changeTheme(context, ThemeMode.system),
                          theme: theme,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _ThemeOptionCard(
                          icon: Icons.light_mode_rounded,
                          label: 'Light',
                          isSelected: mode == ThemeMode.light,
                          onTap: () => _changeTheme(context, ThemeMode.light),
                          theme: theme,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _ThemeOptionCard(
                          icon: Icons.dark_mode_rounded,
                          label: 'Dark',
                          isSelected: mode == ThemeMode.dark,
                          onTap: () => _changeTheme(context, ThemeMode.dark),
                          theme: theme,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: cs.outlineVariant.withOpacity(0.3)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.lightbulb_outline, size: 16, color: cs.primary),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _getThemeHint(mode),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: cs.onSurfaceVariant,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildIrTransmitterSection(ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: 'IR Transmitter',
        subtitle: 'Choose which hardware sends IR commands',
        leading: Icon(Icons.settings_input_antenna_rounded, color: cs.primary),
        child: const _IrTransmitterCard(),
      ),
    );
  }

  Widget _buildRemotesSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: 'Remotes',
        subtitle: 'Import/export and maintenance actions',
        leading: Icon(Icons.settings_remote_rounded, color: cs.primary),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.file_upload_outlined),
              title: const Text('Import remotes'),
              subtitle: const Text('Import .json backups or Flipper Zero .ir files'),
              onTap: () => _doImport(context),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.file_download_outlined),
              title: const Text('Export remotes'),
              subtitle: const Text('Save a JSON backup to Downloads'),
              onTap: () => _doExport(context),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.restore_rounded),
              title: const Text('Restore demo remotes'),
              subtitle: const Text('Replace current remotes with the built-in demo'),
              onTap: () => _restoreDemoRemote(context),
            ),
            const Divider(height: 1),
            ListTile(
              leading: Icon(Icons.delete_forever, color: theme.colorScheme.error),
              title: Text('Delete all remotes', style: TextStyle(color: theme.colorScheme.error)),
              subtitle: const Text('Remove everything from this device'),
              onTap: () => _deleteAllRemotes(context),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                'Tip: export a backup before large edits. Import supports both JSON backups and Flipper Zero .ir files.',
                style: TextStyle(color: cs.onSurfaceVariant),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: 'About',
        subtitle: 'App information and open-source details',
        leading: Icon(Icons.info_outline, color: cs.primary),
        child: Column(
          children: [
            FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                final info = snapshot.data;
                final version = info == null ? '—' : '${info.version}+${info.buildNumber}';
                return ListTile(
                  leading: const Icon(Icons.apps),
                  title: Text('IR Blaster - $_creatorName'),
                  subtitle: Text('Version $version'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AboutScreen()),
                    );
                  },
                );
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Source Code'),
              subtitle: const Text('View on GitHub'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => _launchUrl(context, _repoUrl),
              onLongPress: () => _copyToClipboard(context, text: _repoUrl, message: 'Repository URL copied'),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.bug_report),
              title: const Text('Report Issue'),
              subtitle: const Text('Bug reports & feature requests'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => _launchUrl(context, _issuesUrl),
              onLongPress: () => _copyToClipboard(context, text: _issuesUrl, message: 'Issues URL copied'),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.gavel),
              title: const Text('License'),
              subtitle: const Text('Open-source license'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => _launchUrl(context, _licenseUrl),
              onLongPress: () => _copyToClipboard(context, text: _licenseUrl, message: 'License URL copied'),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('KaijinLab Inc.'),
              subtitle: const Text('Visit our website'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => _launchUrl(context, _companyUrl),
              onLongPress: () => _copyToClipboard(context, text: _companyUrl, message: 'Company URL copied'),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Licenses'),
              subtitle: const Text('Open source licenses'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showLicensePage(
                  context: context,
                  applicationName: 'IR Blaster',
                  applicationVersion: 'by $_creatorName',
                  applicationIcon: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(Icons.settings_remote_rounded, size: 48, color: cs.primary),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeOptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final ThemeData theme;

  const _ThemeOptionCard({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? cs.primaryContainer.withOpacity(0.7) : cs.surfaceContainerHighest.withOpacity(0.4),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? cs.primary.withOpacity(0.5) : cs.outlineVariant.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? cs.primary : cs.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24,
                color: isSelected ? cs.onPrimary : cs.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                color: isSelected ? cs.onPrimaryContainer : cs.onSurfaceVariant,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(height: 4),
              Icon(Icons.check_circle, size: 16, color: cs.primary),
            ],
          ],
        ),
      ),
    );
  }
}

class _IrTransmitterCard extends StatefulWidget {
  const _IrTransmitterCard();

  @override
  State<_IrTransmitterCard> createState() => _IrTransmitterCardState();
}

class _IrTransmitterCardState extends State<_IrTransmitterCard> {
  bool _loading = true;
  bool _busy = false;

  IrTransmitterType _preferred = IrTransmitterType.internal;
  IrTransmitterType _active = IrTransmitterType.internal;
  IrTransmitterCapabilities? _caps;
  bool _autoSwitchEnabled = false;

  StreamSubscription<IrTransmitterCapabilities>? _capsSub;

  @override
  void initState() {
    super.initState();
    _capsSub = IrTransmitterPlatform.capabilitiesEvents().listen(
      (caps) {
        if (!mounted) return;

        final hasInternal = caps.hasInternal;
        final bool activeIsAudio =
            caps.currentType == IrTransmitterType.audio1Led || caps.currentType == IrTransmitterType.audio2Led;
        final autoSwitch = (hasInternal && !activeIsAudio) ? caps.autoSwitchEnabled : false;

        setState(() {
          _caps = caps;
          _active = caps.currentType;
          _autoSwitchEnabled = autoSwitch;
          _loading = false;
        });

        if (!hasInternal && _preferred == IrTransmitterType.internal) {
          setState(() {
            _preferred = IrTransmitterType.usb;
          });
          unawaited(IrTransmitterPlatform.setPreferredType(IrTransmitterType.usb));
        }
      },
      onError: (_) {},
      cancelOnError: false,
    );
    _load();
  }

  @override
  void dispose() {
    _capsSub?.cancel();
    _capsSub = null;
    super.dispose();
  }

  IrTransmitterType _effectiveSelection(bool hasInternal) {
    final bool preferredIsAudio = _preferred == IrTransmitterType.audio1Led || _preferred == IrTransmitterType.audio2Led;
    final bool activeIsAudio = _active == IrTransmitterType.audio1Led || _active == IrTransmitterType.audio2Led;
    if (preferredIsAudio || activeIsAudio) return _preferred;
    if (hasInternal && _autoSwitchEnabled) return _active;
    return _preferred;
  }

  Future<void> _load({bool showErrors = false}) async {
    try {
      final preferred = await IrTransmitterPlatform.getPreferredType();
      final caps = await IrTransmitterPlatform.getCapabilities();

      bool autoSwitch = false;
      try {
        autoSwitch = await IrTransmitterPlatform.getAutoSwitchEnabled();
      } catch (_) {
        autoSwitch = caps.autoSwitchEnabled;
      }

      if (!mounted) return;

      IrTransmitterType effectivePreferred = preferred;
      final bool activeIsAudio =
          caps.currentType == IrTransmitterType.audio1Led || caps.currentType == IrTransmitterType.audio2Led;
      bool effectiveAuto = (caps.hasInternal && !activeIsAudio) ? autoSwitch : false;

      if (!caps.hasInternal) {
        if (effectivePreferred == IrTransmitterType.internal) {
          effectivePreferred = IrTransmitterType.usb;
          try {
            await IrTransmitterPlatform.setPreferredType(IrTransmitterType.usb);
          } catch (_) {}
        }
        if (effectiveAuto) {
          effectiveAuto = false;
          try {
            await IrTransmitterPlatform.setAutoSwitchEnabled(false);
          } catch (_) {}
        }
      }

      setState(() {
        _preferred = effectivePreferred;
        _caps = caps;
        _active = caps.currentType;
        _autoSwitchEnabled = effectiveAuto;
        _loading = false;
        _busy = false;
      });
    } on PlatformException catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _busy = false;
      });
      if (showErrors) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Failed to load transmitter settings.')),
        );
      }
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _busy = false;
      });
      if (showErrors) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load transmitter settings.')),
        );
      }
    }
  }

  Future<void> _refreshCaps() async {
    try {
      final caps = await IrTransmitterPlatform.getCapabilities();

      bool autoSwitch = _autoSwitchEnabled;
      try {
        autoSwitch = await IrTransmitterPlatform.getAutoSwitchEnabled();
      } catch (_) {
        autoSwitch = caps.autoSwitchEnabled;
      }

      if (!mounted) return;

      final bool activeIsAudio =
          caps.currentType == IrTransmitterType.audio1Led || caps.currentType == IrTransmitterType.audio2Led;
      setState(() {
        _caps = caps;
        _active = caps.currentType;
        _autoSwitchEnabled = (caps.hasInternal && !activeIsAudio) ? autoSwitch : false;
      });
    } catch (_) {}
  }

  Future<void> _setAutoSwitch(bool enabled) async {
    final caps = _caps;
    if (caps == null) return;

    final bool activeIsAudio = _active == IrTransmitterType.audio1Led || _active == IrTransmitterType.audio2Led;
    if (activeIsAudio) enabled = false;
    if (!caps.hasInternal && enabled) enabled = false;

    setState(() {
      _busy = true;
      _autoSwitchEnabled = enabled;
    });

    try {
      await IrTransmitterPlatform.setAutoSwitchEnabled(enabled);
      await _refreshCaps();
      if (!mounted) return;

      if (enabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Auto-switch enabled: uses USB when connected, otherwise Internal.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Auto-switch disabled: transmitter selection is now manual.')),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update auto-switch setting.')),
      );
    } finally {
      if (!mounted) return;
      setState(() {
        _busy = false;
      });
      await _refreshCaps();
    }
  }

  Future<void> _applyManualSelection(IrTransmitterType t) async {
    final caps = _caps;
    if (caps != null && !caps.hasInternal && t == IrTransmitterType.internal) return;

    final bool selectedIsAudio = t == IrTransmitterType.audio1Led || t == IrTransmitterType.audio2Led;
    final bool turningOffAutoNow = (_autoSwitchEnabled && (selectedIsAudio || t == IrTransmitterType.internal || t == IrTransmitterType.usb));

    setState(() {
      _busy = true;
      _preferred = t;
      if (turningOffAutoNow) _autoSwitchEnabled = false;
    });

    try {
      await IrTransmitterPlatform.setPreferredType(t);
    } catch (_) {}

    if (turningOffAutoNow) {
      try {
        await IrTransmitterPlatform.setAutoSwitchEnabled(false);
      } catch (_) {}
    }

    try {
      await IrTransmitterPlatform.setActiveType(t);
    } on PlatformException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Failed to switch transmitter.')),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to switch transmitter.')),
      );
    } finally {
      await _refreshCaps();
    }

    if (!mounted) return;

    final freshCaps = _caps;
    if (t == IrTransmitterType.usb && freshCaps != null && !freshCaps.usbReady) {
      final msg = freshCaps.hasUsb
          ? 'USB dongle detected but not authorized. Tap “Request USB permission”.'
          : 'No supported USB IR dongle detected. Plug it in, then tap “Request USB permission”.';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    }

    if (t == IrTransmitterType.internal && freshCaps != null && !freshCaps.hasInternal) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('This device has no built-in IR emitter.')),
      );
    }

    if (selectedIsAudio) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Audio mode enabled. Use max media volume and an audio-to-IR LED adapter.')),
      );
    }

    setState(() {
      _busy = false;
    });
  }

  Future<void> _requestUsbPermission() async {
    setState(() {
      _busy = true;
    });

    try {
      final ok = await IrTransmitterPlatform.usbScanAndRequest();
      if (!mounted) return;

      if (!ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No supported USB IR dongle detected.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('USB permission request sent. Approve the prompt to enable USB.')),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to request USB permission.')),
      );
    } finally {
      await _refreshCaps();
      if (!mounted) return;
      setState(() {
        _busy = false;
      });
    }
  }

  String _helpTextFor(IrTransmitterType t) {
    switch (t) {
      case IrTransmitterType.internal:
        return 'Use the phone’s built-in IR emitter to send commands.';
      case IrTransmitterType.usb:
        return 'Use a USB IR dongle (permission required) to send commands.';
      case IrTransmitterType.audio1Led:
        return 'Use audio output (mono). Requires an audio-to-IR LED adapter and high media volume.';
      case IrTransmitterType.audio2Led:
        return 'Use audio output (stereo). Uses two channels for improved LED driving with compatible adapters.';
    }
  }

  String _titleFor(IrTransmitterType t) {
    switch (t) {
      case IrTransmitterType.internal:
        return 'Internal IR';
      case IrTransmitterType.usb:
        return 'USB IR Dongle';
      case IrTransmitterType.audio1Led:
        return 'Audio (1 LED)';
      case IrTransmitterType.audio2Led:
        return 'Audio (2 LEDs)';
    }
  }

  IconData _iconFor(IrTransmitterType t) {
    switch (t) {
      case IrTransmitterType.internal:
        return Icons.settings_input_antenna_rounded;
      case IrTransmitterType.usb:
        return Icons.usb_rounded;
      case IrTransmitterType.audio1Led:
        return Icons.volume_up_rounded;
      case IrTransmitterType.audio2Led:
        return Icons.surround_sound_rounded;
    }
  }

  bool _availableFor(IrTransmitterType t, IrTransmitterCapabilities caps) {
    switch (t) {
      case IrTransmitterType.internal:
        return caps.hasInternal;
      case IrTransmitterType.usb:
        return caps.hasUsb;
      case IrTransmitterType.audio1Led:
      case IrTransmitterType.audio2Led:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    if (_loading) {
      return const Padding(
        padding: EdgeInsets.all(18),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final caps = _caps;
    if (caps == null) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Failed to load transmitter capabilities.', style: TextStyle(color: cs.onSurfaceVariant)),
            const SizedBox(height: 10),
            FilledButton.tonalIcon(
              onPressed: _busy ? null : () => _load(showErrors: true),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final effective = _effectiveSelection(caps.hasInternal);
    final active = _active;
    final bool activeIsAudio = active == IrTransmitterType.audio1Led || active == IrTransmitterType.audio2Led;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(_iconFor(effective), color: cs.primary),
            title: const Text('Selected transmitter'),
            subtitle: Text(
              '${_titleFor(effective)} • Active: ${_titleFor(active)}',
              style: TextStyle(color: cs.onSurfaceVariant),
            ),
            trailing: IconButton(
              tooltip: 'Refresh',
              onPressed: _busy ? null : _refreshCaps,
              icon: const Icon(Icons.refresh_rounded),
            ),
          ),
          const Divider(height: 18),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            value: _autoSwitchEnabled,
            onChanged: (_busy || !caps.hasInternal || activeIsAudio) ? null : (v) => _setAutoSwitch(v),
            title: const Text('Auto-switch'),
            subtitle: Text(
              activeIsAudio
                  ? 'Disabled while using Audio mode'
                  : (caps.hasInternal ? 'Uses USB when connected, otherwise Internal' : 'Unavailable on this device'),
            ),
          ),
          const Divider(height: 18),
          for (final t in IrTransmitterType.values) ...[
            _TransmitterOptionTile(
              type: t,
              title: _titleFor(t),
              subtitle: _helpTextFor(t),
              icon: _iconFor(t),
              selected: effective == t,
              enabled: !_busy && _availableFor(t, caps),
              onTap: () => _applyManualSelection(t),
            ),
            if (t != IrTransmitterType.values.last) const Divider(height: 1),
          ],
          if (effective == IrTransmitterType.usb) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: cs.outlineVariant.withOpacity(0.3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline_rounded, size: 18, color: cs.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      caps.usbReady
                          ? 'USB dongle is authorized and ready.'
                          : 'If your dongle is connected but not working, request USB permission and approve the prompt.',
                      style: TextStyle(color: cs.onSurfaceVariant, height: 1.3),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _busy ? null : _requestUsbPermission,
                icon: const Icon(Icons.usb_rounded),
                label: const Text('Request USB permission'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TransmitterOptionTile extends StatelessWidget {
  final IrTransmitterType type;
  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  const _TransmitterOptionTile({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ListTile(
      enabled: enabled,
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Radio<IrTransmitterType>(
        value: type,
        groupValue: selected ? type : null,
        onChanged: enabled ? (_) => onTap() : null,
      ),
      onTap: enabled ? onTap : null,
    );
  }
}
