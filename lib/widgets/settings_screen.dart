// ./lib/widgets/settings_screen.dart

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/ir_transmitter_platform.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remotes_io.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String _repoUrl = 'https://github.com/iodn/android-ir-blaster';
  static const String _issuesUrl = 'https://github.com/iodn/android-ir-blaster/issues';
  static const String _creatorName = 'KaijinLab Inc.';

  static const String _btcAddress = 'bc1qtf79uecssueu4u4u86zct46vcs0vcd2cnmvw6f';
  static const String _ethAddress = '0xCaCc52Cd2D534D869a5C61dD3cAac57455f3c2fD';

  static const String _btcUri =
      'bitcoin:$_btcAddress?label=IR%20Blaster%20Support&message=Thanks%20for%20supporting%20open-source';
  static const String _ethUri = 'ethereum:$_ethAddress';

  static const String _btcQrPngBase64 =
      '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';

  static const String _ethQrPngBase64 =
      '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';

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

  void _openAbout(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AboutScreen()),
    );
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

  Future<void> _restoreDemoRemote(BuildContext context) async {
    final confirmed = await _confirmAction(
      context,
      title: 'Restore demo remotes?',
      message: 'This will replace your current remotes with the built-in demo remotes. '
          'A backup is recommended if you want to keep your current list.',
      confirmLabel: 'Restore demo',
      icon: Icons.restore_rounded,
      destructive: true,
    );
    if (!confirmed) return;

    remotes = writeDefaultRemotes();
    await writeRemotelist(remotes);
    notifyRemotesChanged();

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Demo remote restored.')),
    );
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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All remotes deleted.')),
    );
  }

  void _openSupportProject(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(ctx).height * 0.92,
          ),
          child: _SupportProjectSheet(
            btcAddress: _btcAddress,
            ethAddress: _ethAddress,
            btcUri: _btcUri,
            ethUri: _ethUri,
            btcQrPngBase64: _btcQrPngBase64,
            ethQrPngBase64: _ethQrPngBase64,
            repoUrl: _repoUrl,
            onCopy: (text, message) => _copyToClipboard(context, text: text, message: message),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          _SectionHeader(
            title: 'IR Transmitter',
            subtitle: 'Choose which hardware sends IR commands',
          ),
          const SizedBox(height: 8),
          const _IrTransmitterCard(),
          const SizedBox(height: 20),
          _SectionHeader(
            title: 'Remotes',
            subtitle: 'Import/export and maintenance actions',
          ),
          const SizedBox(height: 8),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.file_upload_outlined),
                  title: const Text('Import remotes'),
                  subtitle: const Text('Import .json backups or Flipper Zero .ir files'),
                  onTap: () => _doImport(context),
                ),
                const Divider(height: 0),
                ListTile(
                  leading: const Icon(Icons.file_download_outlined),
                  title: const Text('Export remotes'),
                  subtitle: const Text('Save a JSON backup to Downloads'),
                  onTap: () => _doExport(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.restore_rounded),
                  title: const Text('Restore demo remote'),
                  subtitle: const Text('Replace current remotes with the built-in demo'),
                  onTap: () => _restoreDemoRemote(context),
                ),
                const Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.delete_forever, color: theme.colorScheme.error),
                  title: Text(
                    'Delete all remotes',
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                  subtitle: const Text('Remove everything from this device'),
                  onTap: () => _deleteAllRemotes(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _SectionHeader(
            title: 'Support the project',
            subtitle: 'Optional donation',
          ),
          const SizedBox(height: 8),
          _SupportProjectCard(onTap: () => _openSupportProject(context)),
          const SizedBox(height: 20),
          _SectionHeader(
            title: 'About',
            subtitle: 'Project info, open source, and credits',
          ),
          const SizedBox(height: 8),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('About IR Blaster'),
                  subtitle: const Text('Version, licenses, source code, and creator info'),
                  onTap: () => _openAbout(context),
                ),
                const Divider(height: 0),
                ListTile(
                  leading: const Icon(Icons.link),
                  title: const Text('Copy GitHub repo link'),
                  subtitle: const Text('Share the project or open it in a browser'),
                  onTap: () => _copyToClipboard(
                    context,
                    text: _repoUrl,
                    message: 'Repo link copied to clipboard.',
                  ),
                ),
                const Divider(height: 0),
                ListTile(
                  leading: const Icon(Icons.bug_report_outlined),
                  title: const Text('Copy issues link'),
                  subtitle: const Text('Report bugs or request features'),
                  onTap: () => _copyToClipboard(
                    context,
                    text: _issuesUrl,
                    message: 'Issues link copied to clipboard.',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const _FooterNote(
            text: 'Tip: export a backup before large edits. Import supports both JSON backups and Flipper Zero .ir files.',
          ),
        ],
      ),
    );
  }
}

class _SupportProjectCard extends StatelessWidget {
  final VoidCallback onTap;
  const _SupportProjectCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: cs.primaryContainer.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.25)),
                ),
                child: Icon(Icons.volunteer_activism_rounded, color: cs.onPrimaryContainer),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Support the project',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'No ads, no tracking. Your donation funds maintenance and new features.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: cs.onSurface.withValues(alpha: 0.72),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right_rounded, color: cs.onSurface.withValues(alpha: 0.55)),
            ],
          ),
        ),
      ),
    );
  }
}

enum _DonationChain { btc, eth }

class _SupportProjectSheet extends StatefulWidget {
  final String btcAddress;
  final String ethAddress;
  final String btcUri;
  final String ethUri;
  final String btcQrPngBase64;
  final String ethQrPngBase64;
  final String repoUrl;
  final Future<void> Function(String text, String message) onCopy;

  const _SupportProjectSheet({
    required this.btcAddress,
    required this.ethAddress,
    required this.btcUri,
    required this.ethUri,
    required this.btcQrPngBase64,
    required this.ethQrPngBase64,
    required this.repoUrl,
    required this.onCopy,
  });

  @override
  State<_SupportProjectSheet> createState() => _SupportProjectSheetState();
}

class _SupportProjectSheetState extends State<_SupportProjectSheet> {
  _DonationChain _chain = _DonationChain.btc;

  late final Uint8List _btcQrBytes = _safeDecode(widget.btcQrPngBase64);
  late final Uint8List _ethQrBytes = _safeDecode(widget.ethQrPngBase64);

  final List<_SupportFocus> _focuses = const <_SupportFocus>[
    _SupportFocus(id: 'usb', title: 'USB IR improvements', subtitle: 'Stability & compatibility'),
    _SupportFocus(id: 'protocols', title: 'New IR protocols', subtitle: 'Broader device coverage'),
    _SupportFocus(id: 'bugs', title: 'Bug fixes', subtitle: 'Polish & reliability'),
    _SupportFocus(id: 'docs', title: 'Docs & localization', subtitle: 'Better onboarding'),
  ];

  String? _selectedFocusId;

  _SupportFocus? get _selectedFocus {
    final id = _selectedFocusId;
    if (id == null) return null;
    for (final f in _focuses) {
      if (f.id == id) return f;
    }
    return null;
  }

  static Uint8List _safeDecode(String b64) {
    try {
      final bytes = base64Decode(b64);
      return bytes;
    } catch (_) {
      return Uint8List(0);
    }
  }

  String _formatAddress(String a, {int group = 4}) {
    final String s = a.trim();
    if (s.isEmpty) return s;
    final StringBuffer out = StringBuffer();
    int count = 0;
    for (int i = 0; i < s.length; i++) {
      out.write(s[i]);
      count++;
      if (i != s.length - 1 && count == group) {
        out.write(' ');
        count = 0;
      }
    }
    return out.toString();
  }

  String _preview(String a, {int head = 10, int tail = 8}) {
    final s = a.trim();
    if (s.length <= head + tail + 1) return s;
    return '${s.substring(0, head)}…${s.substring(s.length - tail)}';
  }

  String _buildShareText({required bool isBtc, _SupportFocus? focus}) {
    final focusLine = focus == null ? '' : 'Focus: ${focus.title}\n';
    final chainLine = isBtc
        ? 'Bitcoin (BTC) — send on Bitcoin network only.\n'
        : 'Ethereum (ERC-20) — send on Ethereum mainnet only.\n';
    final addrLine = isBtc ? 'BTC address: ${widget.btcAddress}\n' : 'ETH address: ${widget.ethAddress}\n';
    return ''
        'Support IR Blaster (open-source)\n'
        '$focusLine'
        '$chainLine'
        '$addrLine'
        'Repo: ${widget.repoUrl}\n';
  }

  Future<void> _thankYou() async {
    if (!mounted) return;
    final theme = Theme.of(context);
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: Icon(Icons.favorite_rounded, color: theme.colorScheme.primary, size: 32),
        title: const Text('Thank you'),
        content: Text(
          'Thank you for supporting open-source. Your donation directly funds maintenance and improvements to IR Blaster.',
          style: theme.textTheme.bodyMedium,
        ),
        actions: [
          FilledButton.tonal(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final bool isBtc = _chain == _DonationChain.btc;
    final focus = _selectedFocus;
    final focusLabel = focus?.title ?? 'General support';

    final String address = isBtc ? widget.btcAddress : widget.ethAddress;
    final String uri = isBtc ? widget.btcUri : widget.ethUri;
    final Uint8List qrPngBytes = isBtc ? _btcQrBytes : _ethQrBytes;

    final String networkTitle = isBtc ? 'Bitcoin network only' : 'Ethereum mainnet only';

    final String formatted = _formatAddress(address, group: 4);
    final String preview = _preview(address, head: 10, tail: 8);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 6,
          bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: cs.primaryContainer.withValues(alpha: 0.65),
                  child: Icon(Icons.volunteer_activism_rounded, color: cs.onPrimaryContainer),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Support the project',
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Optional donation',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurface.withValues(alpha: 0.72),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Close',
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cs.secondaryContainer.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.2)),
              ),
              child: Text(
                'IR Blaster is free and open-source. Donations help fund maintenance, protocol additions, and USB/audio transmitter work. Totally optional — thank you either way.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: cs.onSecondaryContainer.withValues(alpha: 0.92),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sponsor a focus area',
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final f in _focuses)
                  ChoiceChip(
                    label: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(f.title, style: const TextStyle(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 1),
                        Text(
                          f.subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: cs.onSurface.withValues(alpha: 0.7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    selected: _selectedFocusId == f.id,
                    onSelected: (v) {
                      setState(() {
                        _selectedFocusId = v ? f.id : null;
                      });
                      HapticFeedback.selectionClick();
                    },
                  ),
              ],
            ),
            const SizedBox(height: 14),
            const Divider(height: 0),
            const SizedBox(height: 12),

            // Replaces TabBar (prevents blank screen/crash when no TabController is present).
            SegmentedButton<_DonationChain>(
              segments: const <ButtonSegment<_DonationChain>>[
                ButtonSegment<_DonationChain>(
                  value: _DonationChain.btc,
                  label: Text('Bitcoin (BTC)'),
                  icon: Icon(Icons.currency_bitcoin_rounded),
                ),
                ButtonSegment<_DonationChain>(
                  value: _DonationChain.eth,
                  label: Text('Ethereum (ERC-20)'),
                  icon: Icon(Icons.account_balance_wallet_rounded),
                ),
              ],
              selected: <_DonationChain>{_chain},
              onSelectionChanged: (s) => setState(() => _chain = s.first),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: cs.errorContainer.withValues(alpha: 0.22),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.2)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.shield_outlined, color: cs.onErrorContainer.withValues(alpha: 0.95)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  networkTitle,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: cs.onErrorContainer.withValues(alpha: 0.95),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Address preview: $preview',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: cs.onErrorContainer.withValues(alpha: 0.88),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      elevation: 0,
                      color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  isBtc ? Icons.currency_bitcoin_rounded : Icons.account_balance_wallet_rounded,
                                  color: cs.primary,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    isBtc ? 'Bitcoin donation' : 'Ethereum donation',
                                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: cs.primaryContainer.withValues(alpha: 0.7),
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: Text(
                                    focusLabel,
                                    style: TextStyle(
                                      color: cs.onPrimaryContainer,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: cs.surface,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.25)),
                                ),
                                child: qrPngBytes.isEmpty
                                    ? SizedBox(
                                        width: 220,
                                        height: 220,
                                        child: Center(
                                          child: Icon(
                                            Icons.qr_code_2_rounded,
                                            size: 72,
                                            color: cs.onSurface.withValues(alpha: 0.35),
                                          ),
                                        ),
                                      )
                                    : Image.memory(
                                        qrPngBytes,
                                        width: 220,
                                        height: 220,
                                        fit: BoxFit.contain,
                                        filterQuality: FilterQuality.none,
                                      ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Address',
                              style: theme.textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: cs.onSurface.withValues(alpha: 0.85),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: cs.surface.withValues(alpha: 0.55),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.25)),
                              ),
                              child: SelectableText(
                                formatted,
                                style: const TextStyle(
                                  fontFamily: 'monospace',
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: FilledButton.icon(
                                    onPressed: () => widget.onCopy(
                                      address,
                                      isBtc ? 'BTC address copied.' : 'ETH address copied.',
                                    ),
                                    icon: const Icon(Icons.copy_rounded),
                                    label: const Text('Copy address'),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: FilledButton.tonalIcon(
                                    onPressed: () => widget.onCopy(
                                      uri,
                                      isBtc ? 'BTC payment link copied.' : 'ETH payment link copied.',
                                    ),
                                    icon: const Icon(Icons.link_rounded),
                                    label: const Text('Copy link'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  final share = _buildShareText(isBtc: isBtc, focus: focus);
                                  widget.onCopy(share, 'Share text copied.');
                                },
                                icon: const Icon(Icons.ios_share_rounded),
                                label: const Text('Copy share text'),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton.tonalIcon(
                                onPressed: _thankYou,
                                icon: const Icon(Icons.favorite_border_rounded),
                                label: const Text('I’ve sent a donation'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const _FooterNote(
                      text: 'Security note: never trust donation addresses shown in reviews, screenshots, or third-party pages. '
                          'Use only this in-app screen. If anything looks off, verify the preview above.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SupportFocus {
  final String id;
  final String title;
  final String subtitle;
  const _SupportFocus({required this.id, required this.title, required this.subtitle});
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
    final bool preferredIsAudio =
        _preferred == IrTransmitterType.audio1Led || _preferred == IrTransmitterType.audio2Led;
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
    final bool turningOffAutoNow =
        (_autoSwitchEnabled && (selectedIsAudio || t == IrTransmitterType.internal || t == IrTransmitterType.usb));

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
        const SnackBar(
          content: Text('Audio mode enabled. Use max media volume and an audio-to-IR LED adapter.'),
        ),
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
        return 'Use audio output (stereo anti-phase). Requires a 2-LED audio adapter and high media volume.';
    }
  }

  IconData _iconFor(IrTransmitterType t) {
    switch (t) {
      case IrTransmitterType.internal:
        return Icons.phone_iphone;
      case IrTransmitterType.usb:
        return Icons.usb;
      case IrTransmitterType.audio1Led:
        return Icons.graphic_eq;
      case IrTransmitterType.audio2Led:
        return Icons.surround_sound;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final caps = _caps;
    final bool hasInternal = caps?.hasInternal ?? true;
    final bool hasUsb = caps?.hasUsb ?? false;
    final bool usbReady = caps?.usbReady ?? false;

    final IrTransmitterType groupValue = _effectiveSelection(hasInternal);

    final bool selectionIsUsb = groupValue == IrTransmitterType.usb;
    final bool selectionIsAudio = groupValue == IrTransmitterType.audio1Led || groupValue == IrTransmitterType.audio2Led;

    final bool usbNeedsAttention = !selectionIsAudio && (_autoSwitchEnabled || selectionIsUsb) && (!hasUsb || !usbReady);

    final List<IrTransmitterType> options = <IrTransmitterType>[
      if (hasInternal) IrTransmitterType.internal,
      IrTransmitterType.usb,
      IrTransmitterType.audio1Led,
      IrTransmitterType.audio2Led,
    ];

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: _loading
            ? Row(
                children: [
                  const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)),
                  const SizedBox(width: 12),
                  Text('Loading transmitter settings…', style: theme.textTheme.bodyMedium),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.settings_input_component_outlined, color: theme.colorScheme.primary),
                      const SizedBox(width: 10),
                      Expanded(child: Text('IR Transmitter', style: theme.textTheme.titleMedium)),
                      IconButton(
                        tooltip: 'Refresh',
                        onPressed: _busy ? null : () => _load(showErrors: true),
                        icon: const Icon(Icons.refresh_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select which transmitter the app should use when sending IR.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _StatusChip(
                        icon: hasInternal ? Icons.check_circle_outline : Icons.cancel_outlined,
                        label: hasInternal ? 'Internal available' : 'No internal IR',
                      ),
                      _StatusChip(
                        icon: hasUsb ? Icons.usb : Icons.usb_off,
                        label: hasUsb ? 'USB detected' : 'No USB dongle',
                      ),
                      _StatusChip(
                        icon: usbReady ? Icons.verified_outlined : Icons.gpp_maybe_outlined,
                        label: usbReady ? 'USB authorized' : 'USB permission needed',
                      ),
                      _StatusChip(
                        icon: _active == IrTransmitterType.usb
                            ? Icons.usb
                            : (_active == IrTransmitterType.audio1Led || _active == IrTransmitterType.audio2Led)
                                ? Icons.graphic_eq
                                : Icons.phone_iphone,
                        label: 'Active: ${_active.displayName}',
                      ),
                    ],
                  ),
                  if (hasInternal) ...[
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SwitchListTile.adaptive(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        value: _autoSwitchEnabled,
                        onChanged: (_busy || selectionIsAudio) ? null : (v) => _setAutoSwitch(v),
                        title: const Text('Auto-switch (recommended)'),
                        subtitle: Text(
                          selectionIsAudio
                              ? 'Disabled while an Audio mode is selected.'
                              : 'When a USB dongle is connected, use USB; when removed, switch back to Internal.',
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  if (usbNeedsAttention) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.errorContainer.withValues(alpha: 0.65),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.info_outline_rounded, color: theme.colorScheme.onErrorContainer),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              hasUsb
                                  ? 'USB dongle detected, but permission is not granted yet.'
                                  : 'No supported USB IR dongle detected.',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onErrorContainer,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FilledButton.tonalIcon(
                        onPressed: _busy ? null : _requestUsbPermission,
                        icon: const Icon(Icons.usb_rounded),
                        label: const Text('Request USB permission'),
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.55),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        for (int idx = 0; idx < options.length; idx++) ...[
                          if (idx != 0) const Divider(height: 0),
                          _TransmitterRadioTile(
                            value: options[idx],
                            groupValue: groupValue,
                            enabled: !_busy,
                            title: options[idx].displayName,
                            subtitle: _helpTextFor(options[idx]),
                            icon: _iconFor(options[idx]),
                            trailing: _buildTrailingForOption(options[idx], theme, groupValue),
                            onChanged: (v) {
                              if (v == null) return;
                              _applyManualSelection(v);
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget? _buildTrailingForOption(IrTransmitterType t, ThemeData theme, IrTransmitterType groupValue) {
    if (_autoSwitchEnabled && (t == IrTransmitterType.internal || t == IrTransmitterType.usb)) {
      final bool isActive = groupValue == t;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: (isActive ? theme.colorScheme.primaryContainer : theme.colorScheme.surfaceContainerHighest)
              .withValues(alpha: 0.75),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.35)),
        ),
        child: Text(
          'Auto',
          style: theme.textTheme.labelMedium?.copyWith(
            color: isActive
                ? theme.colorScheme.onPrimaryContainer
                : theme.colorScheme.onSurface.withValues(alpha: 0.75),
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }
    return null;
  }
}

class _TransmitterRadioTile extends StatelessWidget {
  final IrTransmitterType value;
  final IrTransmitterType groupValue;
  final bool enabled;
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget? trailing;
  final ValueChanged<IrTransmitterType?> onChanged;

  const _TransmitterRadioTile({
    required this.value,
    required this.groupValue,
    required this.enabled,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.trailing,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RadioListTile<IrTransmitterType>(
      value: value,
      groupValue: groupValue,
      onChanged: enabled ? onChanged : null,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Row(
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.onSurface.withValues(alpha: 0.85)),
          const SizedBox(width: 10),
          Expanded(child: Text(title)),
          if (trailing != null) ...[
            const SizedBox(width: 8),
            trailing!,
          ],
        ],
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatusChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: cs.onSurface.withValues(alpha: 0.85)),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: cs.onSurface.withValues(alpha: 0.85),
              fontWeight: FontWeight.w600,
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  }
}

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late final Future<PackageInfo> _infoFuture = PackageInfo.fromPlatform();

  static const String _sourceUrl = 'https://github.com/iodn/android-ir-blaster';
  static const String _issuesUrl = 'https://github.com/iodn/android-ir-blaster/issues';
  static const String _creatorName = 'KaijinLab Inc.';

  Future<void> _copy(BuildContext context, String text, String message) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: FutureBuilder<PackageInfo>(
        future: _infoFuture,
        builder: (context, snap) {
          final info = snap.data;
          final appName = info?.appName ?? 'IR Blaster';
          final version = info == null ? '—' : '${info.version}+${info.buildNumber}';

          return ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.settings_remote, color: theme.colorScheme.primary),
                          const SizedBox(width: 10),
                          Expanded(child: Text(appName, style: theme.textTheme.headlineSmall)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _Pill(icon: Icons.tag, label: 'Version $version'),
                          _Pill(icon: Icons.business_outlined, label: 'Created by $_creatorName'),
                          const _Pill(icon: Icons.code, label: 'Open source'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Create custom infrared (IR) remotes using hex codes, raw IR data, or Flipper Zero .ir files.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'If this free open-source app helps you, consider starring the GitHub repo.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.badge_outlined),
                      title: const Text('Open source licenses'),
                      subtitle: const Text('View third-party license notices'),
                      onTap: () {
                        showLicensePage(
                          context: context,
                          applicationName: appName,
                          applicationVersion: version,
                        );
                      },
                    ),
                    const Divider(height: 0),
                    ListTile(
                      leading: const Icon(Icons.link),
                      title: const Text('Source code (GitHub)'),
                      subtitle: Text(_sourceUrl),
                      onTap: () => _copy(context, _sourceUrl, 'Repo link copied to clipboard.'),
                      trailing: IconButton(
                        tooltip: 'Copy link',
                        icon: const Icon(Icons.copy),
                        onPressed: () => _copy(context, _sourceUrl, 'Repo link copied to clipboard.'),
                      ),
                    ),
                    const Divider(height: 0),
                    ListTile(
                      leading: const Icon(Icons.bug_report_outlined),
                      title: const Text('Issues / feature requests'),
                      subtitle: Text(_issuesUrl),
                      onTap: () => _copy(context, _issuesUrl, 'Issues link copied to clipboard.'),
                      trailing: IconButton(
                        tooltip: 'Copy link',
                        icon: const Icon(Icons.copy),
                        onPressed: () => _copy(context, _issuesUrl, 'Issues link copied to clipboard.'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const _FooterNote(
                text: 'Note: This screen copies links to your clipboard (no browser-launch dependency is included).',
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _SectionHeader({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.titleMedium),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ],
    );
  }
}

class _FooterNote extends StatelessWidget {
  final String text;
  const _FooterNote({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        text,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _Pill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: cs.primaryContainer.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: cs.onPrimaryContainer),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: cs.onPrimaryContainer,
              fontWeight: FontWeight.w600,
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  }
}
