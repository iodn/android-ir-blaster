import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/l10n.dart';
import '../utils/crash_reporting.dart';

Future<void> showPreviousCrashReport(BuildContext context) async {
  Map<String, dynamic>? report;
  try {
    report = await CrashReporting.channel
        .invokeMapMethod<String, dynamic>('previous');
  } catch (_) {
    return; // Reporting must not block startup when storage is unavailable.
  }
  if (!context.mounted || report == null) return;
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => CrashReportDialog(
      id: report!['id'] as String,
      text: report['text'] as String,
    ),
  );
}

class CrashReportDialog extends StatefulWidget {
  const CrashReportDialog({super.key, required this.id, required this.text});
  final String id;
  final String text;

  @override
  State<CrashReportDialog> createState() => _CrashReportDialogState();
}

class _CrashReportDialogState extends State<CrashReportDialog> {
  bool _busy = false;
  String? _status;

  Future<void> _act(Future<void> Function() action) async {
    setState(() {
      _busy = true;
      _status = null;
    });
    try {
      await action();
    } catch (_) {
      if (mounted) {
        setState(() => _status = context.l10n.crashReportActionFailed);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      scrollable: true,
      icon: const Icon(Icons.bug_report_outlined),
      title: Text(l10n.crashReportTitle),
      content: SizedBox(
        width: 480,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.crashReportExplanation),
            const SizedBox(height: 12),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Text(l10n.crashReportDetails),
              children: [
                SizedBox(
                  height: 220,
                  child: SingleChildScrollView(
                    child: SelectableText(widget.text,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontFamily: 'monospace')),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(spacing: 8, runSpacing: 8, children: [
              FilledButton.icon(
                onPressed: _busy
                    ? null
                    : () => _act(() async {
                          await const MethodChannel('org.nslabs/irtransmitter')
                              .invokeMethod<void>('shareText', {
                            'subject':
                                '${l10n.appTitle} - ${l10n.crashReportTitle}',
                            'text': widget.text,
                          });
                        }),
                icon: const Icon(Icons.share_outlined),
                label: Text(l10n.crashReportShare),
              ),
              OutlinedButton.icon(
                onPressed: _busy
                    ? null
                    : () => _act(() async {
                          await CrashReporting.channel
                              .invokeMethod<void>('email', {
                            'address': 'contact@neroteam.com',
                            'subject':
                                '${l10n.appTitle} - ${l10n.crashReportTitle}',
                            'text': widget.text,
                          });
                        }),
                icon: const Icon(Icons.mail_outline),
                label: Text(l10n.crashReportEmail),
              ),
              TextButton.icon(
                onPressed: _busy
                    ? null
                    : () => _act(() async {
                          await Clipboard.setData(
                              ClipboardData(text: widget.text));
                          if (mounted) {
                            setState(() => _status = l10n.crashReportCopied);
                          }
                        }),
                icon: const Icon(Icons.copy_outlined),
                label: Text(l10n.copy),
              ),
            ]),
            if (_status != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(_status!, semanticsLabel: _status),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _busy
              ? null
              : () => _act(() async {
                    await CrashReporting.channel
                        .invokeMethod<void>('discard', {'id': widget.id});
                    if (context.mounted) Navigator.of(context).pop();
                  }),
          child: Text(l10n.crashReportDontSend),
        ),
        TextButton(
          onPressed: _busy ? null : () => Navigator.of(context).pop(),
          child: Text(l10n.crashReportNotNow),
        ),
      ],
    );
  }
}
