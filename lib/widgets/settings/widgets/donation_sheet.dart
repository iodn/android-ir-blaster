import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

enum DonationChain { btc, eth }

class DonationSheet extends StatefulWidget {
  final String repoUrl;
  final String btcAddress;
  final String ethAddress;
  final String liberapayUrl;
  final Future<void> Function(String text, String message) onCopy;

  const DonationSheet({
    super.key,
    required this.repoUrl,
    required this.btcAddress,
    required this.ethAddress,
    required this.liberapayUrl,
    required this.onCopy,
  });

  @override
  State<DonationSheet> createState() => _DonationSheetState();
}

class _DonationSheetState extends State<DonationSheet> {
  DonationChain _chain = DonationChain.btc;
  String? _focusId;
  bool _liberapayLoading = false;

  static const String _btcQrPngBase64 =
      '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';
  static const String _ethQrPngBase64 =
      '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';


  final List<_DonationFocus> _focuses = const [
    _DonationFocus(id: 'compat', title: 'Hardware Compatibility', subtitle: 'More devices and adapters'),
    _DonationFocus(id: 'usb', title: 'USB IR Dongles', subtitle: 'Stability & permissions flow'),
    _DonationFocus(id: 'audio', title: 'Audio-to-IR Adapter', subtitle: 'Better timing & presets'),
    _DonationFocus(id: 'import', title: 'Flipper .ir Import', subtitle: 'Faster parsing and mapping'),
    _DonationFocus(id: 'discover', title: 'Code Discovery Tools', subtitle: 'Guided brute-force UX'),
    _DonationFocus(id: 'ui', title: 'UI/UX Polish', subtitle: 'Performance and usability'),
  ];

  _DonationFocus? get _selectedFocus {
    final id = _focusId;
    if (id == null) return null;
    return _focuses.firstWhere((f) => f.id == id, orElse: () => _focuses.first);
  }

  static Uint8List _safeDecode(String b64) {
    try {
      final trimmed = b64.trim();
      if (trimmed.isEmpty) return Uint8List(0);
      return base64Decode(trimmed);
    } catch (_) {
      return Uint8List(0);
    }
  }

  late final Uint8List _btcQrBytes = _safeDecode(_btcQrPngBase64);
  late final Uint8List _ethQrBytes = _safeDecode(_ethQrPngBase64);

  String _formatAddress(String a, {int group = 4}) {
    final s = a.trim();
    if (s.isEmpty) return s;
    final out = StringBuffer();
    var count = 0;
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

  String _buildShareText({required bool isBtc, _DonationFocus? focus}) {
    final focusLine = focus == null ? '' : 'Focus: ${focus.title}\n';
    final chainLine = isBtc
        ? 'Bitcoin (BTC) — send on Bitcoin network only.\n'
        : 'Ethereum (ERC-20) — send on Ethereum mainnet only.\n';
    final addrLine = isBtc ? 'BTC address: ${widget.btcAddress}\n' : 'ETH address: ${widget.ethAddress}\n';
    return ''
        'Support IR Blaster - Open Source App\n'
        '$focusLine'
        '$chainLine'
        '$addrLine'
        'Repo: ${widget.repoUrl}\n';
  }

  Future<void> _openLiberapay() async {
    setState(() => _liberapayLoading = true);
    try {
      final uri = Uri.parse(widget.liberapayUrl);
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched && mounted) {
        _showError('Failed to open Liberapay in browser');
      }
    } catch (e) {
      if (!mounted) return;
      _showError('Error opening Liberapay: $e');
    } finally {
      if (mounted) {
        setState(() => _liberapayLoading = false);
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _thankYou() async {
    if (!mounted) return;
    final theme = Theme.of(context);
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: Icon(Icons.favorite_rounded, color: theme.colorScheme.primary, size: 40),
        title: const Text('Thank You! 💙'),
        content: Text(
          'Your support helps keep IR Blaster free, maintained, and compatible across hardware. Thank you for supporting open-source.',
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

  Future<void> _pickFocus() async {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final selected = await showModalBottomSheet<String?>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            Text(
              'Donation Focus',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 6),
            Text(
              'Optional. Helps prioritize what to work on next.',
              style: theme.textTheme.bodyMedium?.copyWith(color: cs.onSurface.withOpacity(0.7)),
            ),
            const SizedBox(height: 16),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.all_inclusive_rounded),
                    title: const Text('General Support'),
                    subtitle: const Text('Best overall option'),
                    trailing: _focusId == null ? const Icon(Icons.check_rounded) : null,
                    onTap: () => Navigator.of(ctx).pop(''),
                  ),
                  const Divider(height: 0),
                  for (int i = 0; i < _focuses.length; i++) ...[
                    if (i != 0) const Divider(height: 0),
                    ListTile(
                      leading: const Icon(Icons.flag_outlined),
                      title: Text(_focuses[i].title),
                      subtitle: Text(_focuses[i].subtitle),
                      trailing: _focusId == _focuses[i].id ? const Icon(Icons.check_rounded) : null,
                      onTap: () => Navigator.of(ctx).pop(_focuses[i].id),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );

    if (selected == null) return;
    setState(() => _focusId = selected.isEmpty ? null : selected);
    Haptics.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final isBtc = _chain == DonationChain.btc;
    final focus = _selectedFocus;
    final focusLabel = focus?.title ?? 'General Support';
    final address = isBtc ? widget.btcAddress : widget.ethAddress;
    final qrBytes = isBtc ? _btcQrBytes : _ethQrBytes;
    final networkTitle = isBtc ? 'Bitcoin network only' : 'Ethereum mainnet only';
    final preview = _preview(address, head: 10, tail: 8);
    final formatted = _formatAddress(address, group: 4);

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 6,
        bottom: 12 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          _buildHeader(theme, cs),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDonationOptionsHeader(theme, cs),
                const SizedBox(height: 12),
                _buildLiberapayCard(theme, cs),
                const SizedBox(height: 20),
                _buildCryptoSectionHeader(theme, cs),
                const SizedBox(height: 12),
                _buildChainSelector(theme),
                const SizedBox(height: 12),
                _buildNetworkWarning(theme, cs, networkTitle, preview),
                const SizedBox(height: 12),
                _buildQrCard(theme, cs, isBtc, focusLabel, qrBytes),
                const SizedBox(height: 12),
                _buildAddressCard(theme, cs, formatted, address, isBtc, focus),
                const SizedBox(height: 16),
                _buildFooterNote(theme, cs),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, ColorScheme cs) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: cs.primaryContainer.withOpacity(0.7),
          child: Icon(Icons.volunteer_activism_rounded, color: cs.onPrimaryContainer),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Support Development', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
              const SizedBox(height: 2),
              Text(
                'Optional donation that funds maintenance and features',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: cs.onSurface.withOpacity(0.7),
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
    );
  }

  Widget _buildDonationOptionsHeader(ThemeData theme, ColorScheme cs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Donation Options', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        Text(
          'Your contribution keeps this app free, maintained, and community-driven',
          style: theme.textTheme.bodyMedium?.copyWith(color: cs.onSurface.withOpacity(0.7)),
        ),
      ],
    );
  }

  Widget _buildLiberapayCard(ThemeData theme, ColorScheme cs) {
    return Card(
      elevation: 0,
      color: cs.primaryContainer.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cs.primary.withOpacity(0.3), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: cs.primary, shape: BoxShape.circle),
                child: Icon(Icons.favorite_rounded, color: cs.onPrimary, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    children: [
                      Text('Liberapay', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: cs.primary, borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          'RECOMMENDED',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: cs.onPrimary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Flexible support options',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onPrimaryContainer.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cs.surface.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: cs.outlineVariant.withOpacity(0.3)),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Icon(Icons.check_circle_rounded, size: 16, color: cs.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Traditional payment methods (card, PayPal, bank)',
                    style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ]),
              const SizedBox(height: 6),
              Row(children: [
                Icon(Icons.check_circle_rounded, size: 16, color: cs.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Flexible recurring support or one-time contribution',
                    style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ]),
              const SizedBox(height: 6),
              Row(children: [
                Icon(Icons.check_circle_rounded, size: 16, color: cs.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Trusted by open-source developers',
                    style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ]),
            ]),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _liberapayLoading ? null : _openLiberapay,
              icon: _liberapayLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: cs.onPrimary),
                    )
                  : const Icon(Icons.open_in_new_rounded),
              label: Text(_liberapayLoading ? 'Opening browser...' : 'Donate via Liberapay'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: cs.primary,
                foregroundColor: cs.onPrimary,
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                Icon(Icons.info_outline_rounded, size: 16, color: cs.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Liberapay is a non-profit donation platform trusted by open-source projects.',
                    style: theme.textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant, height: 1.3),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildCryptoSectionHeader(ThemeData theme, ColorScheme cs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Direct Cryptocurrency Support', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        Text(
          'Privacy-focused option • Scan QR or copy address',
          style: theme.textTheme.bodyMedium?.copyWith(color: cs.onSurface.withOpacity(0.7)),
        ),
      ],
    );
  }

  Widget _buildChainSelector(ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: SegmentedButton<DonationChain>(
            segments: const [
              ButtonSegment(value: DonationChain.btc, label: Text('BTC'), icon: Icon(Icons.currency_bitcoin_rounded)),
              ButtonSegment(value: DonationChain.eth, label: Text('ETH'), icon: Icon(Icons.account_balance_wallet_rounded)),
            ],
            selected: {_chain},
            onSelectionChanged: (s) => setState(() => _chain = s.first),
          ),
        ),
        const SizedBox(width: 10),
        ActionChip(
          avatar: const Icon(Icons.flag_outlined, size: 18),
          label: Text(_selectedFocus?.title ?? 'General'),
          onPressed: _pickFocus,
        ),
      ],
    );
  }

  Widget _buildNetworkWarning(ThemeData theme, ColorScheme cs, String networkTitle, String preview) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: cs.errorContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: cs.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.shield_outlined, color: cs.onErrorContainer.withOpacity(0.9), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$networkTitle • $preview',
              style: theme.textTheme.bodySmall?.copyWith(
                color: cs.onErrorContainer.withOpacity(0.9),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrCard(ThemeData theme, ColorScheme cs, bool isBtc, String focusLabel, Uint8List qrBytes) {
    return Card(
      elevation: 0,
      color: cs.surfaceContainerHighest.withOpacity(0.6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Icon(
                isBtc ? Icons.currency_bitcoin_rounded : Icons.account_balance_wallet_rounded,
                color: cs.primary,
                size: 24,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  isBtc ? 'Bitcoin Donation' : 'Ethereum Donation',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: cs.primaryContainer.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: cs.outlineVariant.withOpacity(0.3)),
                ),
                child: Text(
                  focusLabel,
                  style: TextStyle(color: cs.onPrimaryContainer, fontWeight: FontWeight.w900, fontSize: 11),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cs.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: cs.outlineVariant.withOpacity(0.3)),
              ),
              child: qrBytes.isEmpty
                  ? SizedBox(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.qr_code_2_rounded, size: 64, color: cs.onSurface.withOpacity(0.3)),
                            const SizedBox(height: 8),
                            Text(
                              'QR code not available',
                              style: theme.textTheme.bodySmall?.copyWith(color: cs.onSurface.withOpacity(0.5)),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Image.memory(qrBytes, width: 200, height: 200, fit: BoxFit.contain, filterQuality: FilterQuality.none),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildAddressCard(
    ThemeData theme,
    ColorScheme cs,
    String formatted,
    String address,
    bool isBtc,
    _DonationFocus? focus,
  ) {
    return Card(
      elevation: 0,
      color: cs.surfaceContainerHighest.withOpacity(0.6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Address',
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: cs.onSurface.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: cs.surface.withOpacity(0.6),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: cs.outlineVariant.withOpacity(0.3)),
            ),
            child: SelectableText(
              formatted,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 12.5, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => widget.onCopy(address, isBtc ? 'BTC address copied' : 'ETH address copied'),
                  icon: const Icon(Icons.copy_rounded),
                  label: const Text('Copy Address'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.tonalIcon(
                  onPressed: () {
                    final share = _buildShareText(isBtc: isBtc, focus: focus);
                    widget.onCopy(share, 'Share text copied');
                  },
                  icon: const Icon(Icons.ios_share_rounded),
                  label: const Text('Share'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonalIcon(
              onPressed: _thankYou,
              icon: const Icon(Icons.favorite_border_rounded),
              label: const Text("I've sent a donation"),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildFooterNote(ThemeData theme, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        'Security note: Never trust donation addresses from screenshots, reviews, or third-party pages. Use only this in-app screen.',
        style: theme.textTheme.bodySmall?.copyWith(
          color: cs.onSurface.withOpacity(0.6),
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _DonationFocus {
  final String id;
  final String title;
  final String subtitle;

  const _DonationFocus({
    required this.id,
    required this.title,
    required this.subtitle,
  });
}
