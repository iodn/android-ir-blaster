import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'settings/widgets/section_card.dart';
import 'settings/widgets/support_pill.dart';

class AboutScreen extends StatefulWidget {
  final String repoUrl;
  final String issuesUrl;
  final String liberapayUrl;

  const AboutScreen({
    super.key,
    required this.repoUrl,
    required this.issuesUrl,
    required this.liberapayUrl,
  });

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo? _info;
  String? _logoAssetPath;

  static const List<String> _logoCandidates = <String>[
    'assets/images/logo.png',
    'assets/logo.png',
  ];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final info = await PackageInfo.fromPlatform();
    final logo = await _findFirstExistingAsset(_logoCandidates);
    if (!mounted) return;
    setState(() {
      _info = info;
      _logoAssetPath = logo;
    });
  }

  Future<String?> _findFirstExistingAsset(List<String> candidates) async {
    for (final p in candidates) {
      try {
        await rootBundle.load(p);
        return p;
      } catch (_) {}
    }
    return null;
  }

  Future<void> _copy(BuildContext context, String text, String message) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
    HapticFeedback.selectionClick();
  }

  Future<void> _launchExternal(BuildContext context, String url) async {
    try {
      final uri = Uri.parse(url);
      final ok = await canLaunchUrl(uri);
      if (!ok) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('No browser available'),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Failed to open link'),
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

  String _buildModeLabel() {
    if (kReleaseMode) return 'Release';
    if (kProfileMode) return 'Profile';
    return 'Debug';
  }

  String _versionLabel() {
    final info = _info;
    if (info == null) return '—';
    final v = info.version.trim().isEmpty ? '—' : info.version.trim();
    final b = info.buildNumber.trim().isEmpty ? '—' : info.buildNumber.trim();
    return '$v+$b';
  }

  String _packageName() => _info?.packageName ?? '—';
  String _appName() => (_info?.appName.trim().isNotEmpty ?? false) ? _info!.appName : 'IR Blaster';

  List<_OtherApp> _otherApps() {
    return const <_OtherApp>[
      _OtherApp(name: 'IR Blaster', query: 'IR%20Blaster'),
      _OtherApp(name: 'USBDevInfo', query: 'USBDevInfo'),
      _OtherApp(name: 'GadgetFS', query: 'GadgetFS'),
      _OtherApp(name: 'TapDucky', query: 'TapDucky'),
      _OtherApp(name: 'HIDWiggle', query: 'HIDWiggle'),
    ];
  }

  String _githubSearchUrlForRepo(String query) {
    return 'https://github.com/search?q=org%3Aiodn+$query&type=repositories';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final appName = _appName();
    final ver = _versionLabel();
    final pkg = _packageName();
    final mode = _buildModeLabel();
    final year = DateTime.now().year;

    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Center(
            child: Column(
              children: [
                _AppLogo(
                  assetPath: _logoAssetPath,
                  size: 88,
                  backgroundColor: cs.primaryContainer.withOpacity(0.7),
                  iconColor: cs.onPrimaryContainer,
                ),
                const SizedBox(height: 12),
                Text(
                  appName,
                  style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'Version $ver',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurface.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'KaijinLab Inc.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: cs.onSurface.withOpacity(0.8),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          SectionCard(
            title: 'Links',
            subtitle: 'Repository, issues, and donations',
            leading: Icon(Icons.link_rounded, color: cs.primary),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.code_rounded),
                  title: const Text('Repository'),
                  subtitle: Text(widget.repoUrl),
                  trailing: const Icon(Icons.open_in_new_rounded),
                  onTap: () => _launchExternal(context, widget.repoUrl),
                  onLongPress: () => _copy(context, widget.repoUrl, 'Repository link copied'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.bug_report_outlined),
                  title: const Text('Report an issue'),
                  subtitle: Text(widget.issuesUrl),
                  trailing: const Icon(Icons.open_in_new_rounded),
                  onTap: () => _launchExternal(context, widget.issuesUrl),
                  onLongPress: () => _copy(context, widget.issuesUrl, 'Issues link copied'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.favorite_rounded),
                  title: const Text('Donate via Liberapay'),
                  subtitle: Text(widget.liberapayUrl),
                  trailing: const Icon(Icons.open_in_new_rounded),
                  onTap: () => _launchExternal(context, widget.liberapayUrl),
                  onLongPress: () => _copy(context, widget.liberapayUrl, 'Liberapay link copied'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: 'What this app is',
            subtitle: 'Infrared control toolkit',
            leading: Icon(Icons.settings_remote_rounded, color: cs.primary),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'IR Blaster helps build and use custom IR remotes on Android: transmit with internal emitters, compatible USB IR dongles, or audio-to-IR LED adapters, and import signals from Flipper Zero .ir files. No accounts, no tracking, no ads.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: cs.onSurface.withOpacity(0.85),
                      height: 1.35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      SupportPill(icon: Icons.settings_remote_rounded, label: 'Custom remotes'),
                      SupportPill(icon: Icons.settings_input_antenna_rounded, label: 'Internal IR'),
                      SupportPill(icon: Icons.usb_rounded, label: 'USB dongles'),
                      SupportPill(icon: Icons.volume_up_rounded, label: 'Audio adapter'),
                      SupportPill(icon: Icons.file_upload_outlined, label: 'Flipper .ir import'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: 'Build information',
            subtitle: 'Version, package, and build mode',
            leading: Icon(Icons.info_outline, color: cs.primary),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  _InfoRow(label: 'App', value: appName),
                  const SizedBox(height: 10),
                  _InfoRow(label: 'Version', value: ver),
                  const SizedBox(height: 10),
                  _InfoRow(label: 'Package', value: pkg),
                  const SizedBox(height: 10),
                  _InfoRow(label: 'Build', value: mode),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: 'Other apps by KaijinLab',
            subtitle: 'More security and hardware-adjacent tools',
            leading: Icon(Icons.apps_rounded, color: cs.primary),
            child: Column(
              children: [
                for (final a in _otherApps()) ...[
                  ListTile(
                    leading: const Icon(Icons.launch_rounded),
                    title: Text(a.name),
                    subtitle: const Text('Open GitHub repositories search'),
                    trailing: const Icon(Icons.open_in_new_rounded),
                    onTap: () => _launchExternal(context, _githubSearchUrlForRepo(a.query)),
                    onLongPress: () => _copy(context, _githubSearchUrlForRepo(a.query), 'Search link copied'),
                  ),
                  if (a != _otherApps().last) const Divider(height: 1),
                ],
              ],
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: 'Legal',
            subtitle: 'Open-source licenses and acknowledgements',
            leading: Icon(Icons.gavel_rounded, color: cs.primary),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.article_outlined),
                  title: const Text('Open-source licenses'),
                  subtitle: const Text('View third-party dependency licenses'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {
                    showLicensePage(
                      context: context,
                      applicationName: appName,
                      applicationVersion: ver,
                      applicationIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: _AppLogo(
                          assetPath: _logoAssetPath,
                          size: 56,
                          backgroundColor: cs.primaryContainer.withOpacity(0.7),
                          iconColor: cs.onPrimaryContainer,
                        ),
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.content_copy_rounded),
                  title: const Text('Copy build details'),
                  subtitle: const Text('Version + package + build mode'),
                  onTap: () {
                    final text =
                        '$appName\nVersion: $ver\nPackage: $pkg\nBuild: $mode\nRepo: ${widget.repoUrl}\n';
                    _copy(context, text, 'Build details copied');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Center(
            child: Text(
              '© $year KaijinLab • Open-source software',
              style: theme.textTheme.bodySmall?.copyWith(
                color: cs.onSurface.withOpacity(0.55),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 92,
          child: Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: cs.onSurface.withOpacity(0.65),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SelectableText(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: cs.onSurface.withOpacity(0.9),
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}

class _AppLogo extends StatelessWidget {
  final String? assetPath;
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  const _AppLogo({
    required this.assetPath,
    required this.size,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    Widget child;
    if (assetPath != null) {
      child = ClipRRect(
        borderRadius: BorderRadius.circular(size / 5),
        child: Image.asset(
          assetPath!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.settings_remote_rounded, size: size * 0.6, color: iconColor);
          },
        ),
      );
    } else {
      child = Icon(Icons.settings_remote_rounded, size: size * 0.6, color: iconColor);
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size / 4),
        border: Border.all(color: cs.outlineVariant.withOpacity(0.35)),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class _OtherApp {
  final String name;
  final String query;

  const _OtherApp({
    required this.name,
    required this.query,
  });
}
