import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String _repoUrl = 'https://github.com/iodn/android-ir-blaster';
  static const String _issuesUrl = 'https://github.com/iodn/android-ir-blaster/issues';
  static const String _licenseUrl = 'https://github.com/iodn/android-ir-blaster/blob/main/LICENSE';
  static const String _companyUrl = 'https://neroswarm.com';

  Future<void> _launchUrl(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);

    if (uri == null || !(uri.isScheme('http') || uri.isScheme('https'))) {
      if (!context.mounted) return;
      _showError(context, 'Invalid link: $url');
      return;
    }

    try {
      final bool opened =
          await launchUrl(uri, mode: LaunchMode.externalApplication) ||
          await launchUrl(uri, mode: LaunchMode.platformDefault);

      if (!opened) {
        await Clipboard.setData(ClipboardData(text: url));
        if (!context.mounted) return;
        _showError(context, 'Could not open link. URL copied to clipboard.');
        HapticFeedback.selectionClick();
      }
    } on PlatformException catch (_) {
      await Clipboard.setData(ClipboardData(text: url));
      if (!context.mounted) return;
      _showError(context, 'Could not open link. URL copied to clipboard.');
      HapticFeedback.selectionClick();
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: url));
      if (!context.mounted) return;
      _showError(context, 'Error opening link. URL copied to clipboard.');
      HapticFeedback.selectionClick();
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Theme.of(context).colorScheme.onError,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  Future<void> _copyToClipboard(
    BuildContext context,
    String text,
    String message,
  ) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('About IR Blaster')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) {
                      return Container(
                        decoration: BoxDecoration(
                          color: cs.surfaceContainerHighest.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: cs.outlineVariant.withOpacity(0.35)),
                        ),
                        child: Icon(Icons.settings_remote_rounded, size: 54, color: cs.primary),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'IR Blaster',
                  style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 4),
                Text(
                  'by KaijinLab Inc.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: cs.onSurface.withOpacity(0.7),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    final info = snapshot.data;
                    if (info == null) return const SizedBox.shrink();
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: cs.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: cs.outlineVariant.withOpacity(0.5)),
                      ),
                      child: Text(
                        'Version ${info.version} (${info.buildNumber})',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'monospace',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.description_outlined, color: cs.primary),
                      const SizedBox(width: 12),
                      Text(
                        'About',
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'IR Blaster is an open-source infrared toolkit for Android. Create and manage fully custom remotes, transmit IR using internal emitters, supported USB IR dongles, or audio-to-IR LED adapters, and import signals from Flipper Zero .ir files.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: cs.onSurface.withOpacity(0.85),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _FeatureChip(icon: Icons.settings_remote_rounded, label: 'Custom Remotes', colorScheme: cs),
                      _FeatureChip(icon: Icons.settings_input_antenna_rounded, label: 'Internal IR', colorScheme: cs),
                      _FeatureChip(icon: Icons.usb_rounded, label: 'USB Dongles', colorScheme: cs),
                      _FeatureChip(icon: Icons.volume_up_rounded, label: 'Audio Adapter', colorScheme: cs),
                      _FeatureChip(icon: Icons.file_upload_outlined, label: 'Flipper .ir Import', colorScheme: cs),
                      _FeatureChip(icon: Icons.search_rounded, label: 'Code Discovery', colorScheme: cs),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.code),
                  title: const Text('Source Code'),
                  subtitle: const Text('View on GitHub'),
                  trailing: const Icon(Icons.open_in_new),
                  onTap: () => _launchUrl(context, _repoUrl),
                  onLongPress: () => _copyToClipboard(context, _repoUrl, 'Repository URL copied'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.bug_report),
                  title: const Text('Report Issue'),
                  subtitle: const Text('Bug reports & feature requests'),
                  trailing: const Icon(Icons.open_in_new),
                  onTap: () => _launchUrl(context, _issuesUrl),
                  onLongPress: () => _copyToClipboard(context, _issuesUrl, 'Issues URL copied'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.gavel),
                  title: const Text('License'),
                  subtitle: const Text('Open-source license'),
                  trailing: const Icon(Icons.open_in_new),
                  onTap: () => _launchUrl(context, _licenseUrl),
                  onLongPress: () => _copyToClipboard(context, _licenseUrl, 'License URL copied'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.business),
                  title: const Text('KaijinLab Inc.'),
                  subtitle: const Text('Visit our website'),
                  trailing: const Icon(Icons.open_in_new),
                  onTap: () => _launchUrl(context, _companyUrl),
                  onLongPress: () => _copyToClipboard(context, _companyUrl, 'Company URL copied'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: cs.errorContainer.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: cs.error),
                      const SizedBox(width: 12),
                      Text(
                        'Usage Note',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: cs.onErrorContainer,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Use IR Blaster only on devices you own or are authorized to control. Some equipment (TVs, AC units, gateways) may behave unexpectedly when receiving unknown codes. Test responsibly.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onErrorContainer.withOpacity(0.9),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Text(
                    '© ${DateTime.now().year} KaijinLab Inc.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurface.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Made for reliable IR control',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurface.withOpacity(0.5),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final ColorScheme colorScheme;

  const _FeatureChip({
    required this.icon,
    required this.label,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.primary.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: colorScheme.onPrimaryContainer),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
