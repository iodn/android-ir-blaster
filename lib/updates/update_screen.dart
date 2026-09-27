import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/l10n.dart';
import 'update_controller.dart';

class UpdateBadge extends StatelessWidget {
  const UpdateBadge({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => ListenableBuilder(
      listenable: UpdateController.instance,
      builder: (context, _) => Badge(
          isLabelVisible: UpdateController.instance.available, child: child));
}

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, this.controller});
  final UpdateController? controller;
  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late final c = widget.controller ?? UpdateController.instance;
  @override
  void initState() {
    super.initState();
    unawaited(c.initialize());
  }

  Future<void> _open(String url) async {
    try {
      if (!await launchUrl(Uri.parse(url),
          mode: LaunchMode.externalApplication)) {
        throw StateError('No handler');
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(context.l10n.updatesFailed)));
      }
    }
  }

  Future<void> _set(Future<void> Function() action) async {
    try {
      await action();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(context.l10n.updatesFailed)));
      }
    }
  }

  Future<void> _download() async {
    final size =
        ((c.release!.asset!['size'] as int) / (1024 * 1024)).toStringAsFixed(1);
    final yes = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(ctx.l10n.updatesDownload),
              content: Text(ctx.l10n.updatesDownloadConfirm(size)),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: Text(ctx.l10n.cancel)),
                FilledButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: Text(ctx.l10n.updatesDownload))
              ],
            ));
    if (yes == true && mounted) await c.download();
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
      listenable: c,
      builder: (context, _) {
        final l = context.l10n;
        final colors = Theme.of(context).colorScheme;
        final source = switch (c.source) {
          'github' => 'GitHub',
          'fdroid' => 'F-Droid',
          'play' => 'Google Play',
          _ => l.updatesUnknown
        };
        final state = c.failed
            ? l.updatesFailed
            : c.checking
                ? l.loading
                : c.ready
                    ? l.updatesReady
                    : c.available
                        ? l.updatesAvailable(
                            c.release?.version ?? '${c.playBuild ?? ''}')
                        : c.checkedAt == null
                            ? l.updatesNever
                            : l.updatesCurrent;
        return Scaffold(
          appBar: AppBar(title: Text(l.updatesTitle)),
          body: SafeArea(
              child: Center(
                  child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: !c.initialized
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Card(
                          child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(l.versionLabel(c.version),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                    Text(l.updatesChannel(source)),
                                    const Divider(height: 28),
                                    Text(state,
                                        style: TextStyle(
                                            color:
                                                c.failed ? colors.error : null),
                                        semanticsLabel: state),
                                    if (c.checking)
                                      const Padding(
                                          padding: EdgeInsets.only(top: 12),
                                          child: LinearProgressIndicator()),
                                    if (c.checkedAt != null)
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Text(l.updatesLastChecked(
                                              '${MaterialLocalizations.of(context).formatMediumDate(c.checkedAt!.toLocal())} ${MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay.fromDateTime(c.checkedAt!.toLocal()))}'))),
                                  ]))),
                      if (c.info['source'] == 'unknown')
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: DropdownButtonFormField<String>(
                              initialValue:
                                  c.source == 'unknown' ? null : c.source,
                              decoration: InputDecoration(
                                  labelText: l.updatesChooseSource,
                                  border: const OutlineInputBorder()),
                              items: const [
                                DropdownMenuItem(
                                    value: 'github', child: Text('GitHub')),
                                DropdownMenuItem(
                                    value: 'fdroid', child: Text('F-Droid'))
                              ],
                              onChanged: c.busy
                                  ? null
                                  : (v) {
                                      if (v != null) {
                                        _set(() => c.chooseSource(v));
                                      }
                                    },
                            )),
                      Card(
                          child: SwitchListTile.adaptive(
                        title: Text(l.updatesAutomatic),
                        value: c.automatic,
                        subtitle: Text(c.source == 'play'
                            ? l.updatesPrivacyPlay
                            : l.updatesPrivacyGithub),
                        onChanged:
                            c.source == 'unknown' || c.downloading || c.acting
                                ? null
                                : (v) => _set(() => c.setAutomatic(v)),
                      )),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                          onPressed:
                              c.busy || c.source == 'unknown' ? null : c.check,
                          icon: const Icon(Icons.refresh),
                          label: Text(l.updatesCheck)),
                      if (c.source == 'fdroid') ...[
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(l.updatesFdroidNote)),
                        FilledButton.icon(
                            onPressed: () => _open(
                                'https://f-droid.org/packages/org.nslabs.ir_blaster/'),
                            icon: const Icon(Icons.open_in_new),
                            label: Text(l.updatesOpenFdroid)),
                      ],
                      if (c.source == 'play') ...[
                        if (c.available)
                          FilledButton.icon(
                              onPressed:
                                  c.busy ? null : () => c.action('startPlay'),
                              icon: const Icon(Icons.system_update),
                              label: Text(l.updatesInstall)),
                        TextButton(
                            onPressed: () => _open(
                                'https://play.google.com/store/apps/details?id=org.nslabs.ir_blaster'),
                            child: Text(l.updatesOpenPlay)),
                      ],
                      if (c.source == 'github') ...[
                        if (c.downloading) ...[
                          const SizedBox(height: 16),
                          LinearProgressIndicator(value: c.progress),
                          Text('${(100 * c.progress).round()}%',
                              textAlign: TextAlign.center),
                          TextButton(
                              onPressed: () => _set(c.cancelDownload),
                              child: Text(l.cancel)),
                        ] else if (c.ready) ...[
                          Text(l.updatesInstallHint),
                          FilledButton.icon(
                              onPressed: c.busy
                                  ? null
                                  : () => c.action(c.info['canInstall'] == true
                                      ? 'install'
                                      : 'permission'),
                              icon: const Icon(Icons.install_mobile),
                              label: Text(c.info['canInstall'] == true
                                  ? l.updatesInstall
                                  : l.updatesAllowInstall)),
                        ] else if (c.available) ...[
                          FilledButton.icon(
                              onPressed: c.busy || c.release?.asset == null
                                  ? null
                                  : _download,
                              icon: const Icon(Icons.download_outlined),
                              label: Text(l.updatesDownload)),
                          if (c.release?.asset == null) Text(l.updatesNoAsset),
                        ],
                      ],
                      if (c.release != null && c.source != 'play')
                        TextButton.icon(
                            onPressed: () => _open(c.release!.page.toString()),
                            icon: const Icon(Icons.article_outlined),
                            label: Text(l.updatesReleaseNotes)),
                    ],
                  ),
          ))),
        );
      });
}
