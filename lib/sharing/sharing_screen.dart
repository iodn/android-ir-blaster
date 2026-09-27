import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import '../l10n/l10n.dart';
import '../models/timed_macro.dart';
import '../state/remotes_state.dart' as state;
import '../state/macros_state.dart' as macro_state;
import '../utils/remote.dart';
import 'share_package.dart';
import 'share_transfer.dart';

const remoteSharingChannel = MethodChannel('org.nslabs/remote_sharing');

Future<void> showShare(BuildContext context,
        {List<Remote> remotes = const [],
        List<TimedMacro> macros = const [],
        IRButton? button,
        String? buttonName}) =>
    Navigator.of(context).push<void>(MaterialPageRoute(
        builder: (_) => ShareScreen(
            prepare: () => prepareShare(
                remotes: remotes,
                macros: macros,
                available: state.remotes,
                button: button,
                buttonName: buttonName))));

Future<void> showReceivedShare(BuildContext context, String? text) =>
    Navigator.of(context).push<void>(MaterialPageRoute(
        builder: (_) => ShareScreen(
            receiving: true,
            prepare: () => compute(SharePackage.decode, text ?? ''))));

class SharingScreen extends StatefulWidget {
  const SharingScreen({super.key});
  @override
  State<SharingScreen> createState() => _SharingScreenState();
}

class _SharingScreenState extends State<SharingScreen> {
  final _remotes = <Remote>{};
  final _macros = <TimedMacro>{};
  bool _busy = false;

  Future<void> _receive(bool scan) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      String? text;
      if (scan) {
        if (!await Permission.camera.request().isGranted) {
          if (!mounted) return;
          await showDialog<void>(
              context: context,
              builder: (ctx) => AlertDialog(
                      title: Text(ctx.l10n.shareScan),
                      content: Text(ctx.l10n.shareCamera),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: Text(ctx.l10n.cancel)),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                              openAppSettings();
                            },
                            child: Text(ctx.l10n.openSettings)),
                      ]));
          return;
        }
        if (!mounted) return;
        text = await remoteSharingChannel.invokeMethod<String>('scan',
            {'prompt': context.l10n.shareScan, 'cancel': context.l10n.cancel});
      } else {
        final selection = await FilePicker.pickFiles(type: FileType.any);
        if (selection.isEmpty) return;
        final file = selection.single;
        if (file.path == null) {
          throw const FormatException();
        }
        final source = File(file.path!);
        if (await source.length() > SharePackage.maxBytes) {
          throw const FormatException();
        }
        text = await source.readAsString();
      }
      if (mounted && text != null) await showReceivedShare(context, text);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(context.l10n.shareInvalid)));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(context.l10n.shareTitle)),
        body: SafeArea(
            child: Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 640),
                    child:
                        ListView(padding: const EdgeInsets.all(16), children: [
                      Text(context.l10n.shareReceive,
                          style: Theme.of(context).textTheme.titleLarge),
                      Card(
                          child: Column(children: [
                        ListTile(
                            leading: const Icon(Icons.qr_code_scanner),
                            title: Text(context.l10n.shareScan),
                            onTap: _busy ? null : () => _receive(true)),
                        ListTile(
                            leading: const Icon(Icons.file_open_outlined),
                            title: Text(context.l10n.shareOpenFile),
                            onTap: _busy ? null : () => _receive(false)),
                      ])),
                      const SizedBox(height: 20),
                      Text(context.l10n.shareSelect,
                          style: Theme.of(context).textTheme.titleLarge),
                      Text(context.l10n.shareMacroInfo),
                      const SizedBox(height: 12),
                      Text(context.l10n.remotesNavLabel,
                          style: Theme.of(context).textTheme.titleMedium),
                      for (final r in state.remotes)
                        CheckboxListTile(
                            title: Text(r.name),
                            subtitle: Text(context.l10n
                                .remoteButtonCountSummary(r.buttons.length)),
                            value: _remotes.contains(r),
                            onChanged: _busy
                                ? null
                                : (v) => setState(() {
                                      if (v == true) {
                                        _remotes.add(r);
                                      } else {
                                        _remotes.remove(r);
                                      }
                                    })),
                      Text(context.l10n.macrosTitle,
                          style: Theme.of(context).textTheme.titleMedium),
                      for (final m in macro_state.macros)
                        CheckboxListTile(
                            title: Text(m.name),
                            subtitle: Text(m.remoteName),
                            value: _macros.contains(m),
                            onChanged: _busy
                                ? null
                                : (v) => setState(() {
                                      if (v == true) {
                                        _macros.add(m);
                                      } else {
                                        _macros.remove(m);
                                      }
                                    })),
                    ])))),
        bottomNavigationBar: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButton.icon(
                    icon: const Icon(Icons.share_outlined),
                    label: Text(context.l10n.shareSend),
                    onPressed: _busy || (_remotes.isEmpty && _macros.isEmpty)
                        ? null
                        : () => showShare(context,
                            remotes: _remotes.toList(),
                            macros: _macros.toList())))),
      );
}

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key, required this.prepare, this.receiving = false});
  final Future<SharePackage> Function() prepare;
  final bool receiving;
  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  late final Future<SharePackage> _package = widget.prepare();
  bool _busy = false;
  int _destination = -1;

  Future<void> _act(Future<void> Function() action) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await action();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(context.l10n.shareFailed)));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _qr(SharePackage package) async {
    final text = package.qrText();
    if (text == null) return;
    final png = await remoteSharingChannel
        .invokeMethod<Uint8List>('qr', {'text': text});
    if (!mounted || png == null) return;
    await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
              scrollable: true,
              title: Text(ctx.l10n.shareQr),
              content: SizedBox(
                  width: 400,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Image.memory(png,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.none,
                        semanticLabel: ctx.l10n.shareQr),
                    const SizedBox(height: 12),
                    Text(ctx.l10n.shareQrHint),
                  ])),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: Text(ctx.l10n.close))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) => PopScope(
      canPop: !_busy,
      child: Scaffold(
        appBar: AppBar(
            title: Text(widget.receiving
                ? context.l10n.sharePreview
                : context.l10n.shareTitle)),
        body: FutureBuilder<SharePackage>(
            future: _package,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(widget.receiving
                            ? context.l10n.shareInvalid
                            : context.l10n.sharePrepareFailed)));
              }
              final package = snapshot.data;
              if (package == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return SafeArea(
                  child: Center(
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 640),
                          child: ListView(
                              padding: const EdgeInsets.all(20),
                              children: [
                                Icon(
                                    widget.receiving
                                        ? Icons.move_to_inbox_outlined
                                        : Icons.devices_outlined,
                                    size: 48,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                const SizedBox(height: 16),
                                Text(context.l10n.sharePrivacy),
                                if (package.hardwareSpecific)
                                  Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                          context.l10n.shareHardwareWarning,
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error))),
                                if (package.macros.isNotEmpty)
                                  Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(context.l10n.shareMacroInfo)),
                                const SizedBox(height: 16),
                                for (final r in package.remotes)
                                  Card(
                                      child: ExpansionTile(
                                    leading: const Icon(
                                        Icons.settings_remote_outlined),
                                    title: Text(r.name),
                                    subtitle: Text(context.l10n
                                        .remoteButtonCountSummary(
                                            r.buttons.length)),
                                    children: [
                                      for (final b in r.buttons)
                                        ListTile(
                                            dense: true,
                                            title: Text(formatButtonDisplayName(
                                                b.image.startsWith('shared:')
                                                    ? r.name
                                                    : b.image)),
                                            subtitle: Text(b.protocol ??
                                                (b.rawData != null
                                                    ? 'RAW'
                                                    : 'NEC')))
                                    ],
                                  )),
                                for (final m in package.macros)
                                  Card(
                                      child: ListTile(
                                          leading:
                                              const Icon(Icons.playlist_play),
                                          title: Text(m.name),
                                          subtitle: Text(context.l10n
                                              .macroStepCountLabel(
                                                  m.steps.length)))),
                                const SizedBox(height: 20),
                                if (widget.receiving) ...[
                                  if (package.singleButton)
                                    DropdownButtonFormField<int>(
                                        initialValue: _destination,
                                        isExpanded: true,
                                        decoration: InputDecoration(
                                            labelText:
                                                context.l10n.shareDestination),
                                        items: [
                                          DropdownMenuItem(
                                              value: -1,
                                              child: Text(context.l10n
                                                  .learningModeCreateNewRemote)),
                                          for (final r in state.remotes)
                                            DropdownMenuItem(
                                                value: r.id,
                                                child: Text(r.name,
                                                    overflow:
                                                        TextOverflow.ellipsis))
                                        ],
                                        onChanged: _busy
                                            ? null
                                            : (v) => setState(
                                                () => _destination = v ?? -1)),
                                  const SizedBox(height: 12),
                                  FilledButton.icon(
                                      icon: const Icon(Icons.add),
                                      label: Text(context.l10n.shareAdd),
                                      onPressed: _busy
                                          ? null
                                          : () => _act(() async {
                                                final destination =
                                                    _destination < 0
                                                        ? null
                                                        : state
                                                            .remotes
                                                            .firstWhere((r) =>
                                                                r.id ==
                                                                _destination);
                                                await importShare(package,
                                                    destination: destination);
                                                if (!context.mounted) return;
                                                final messenger =
                                                    ScaffoldMessenger.of(
                                                        context);
                                                final message =
                                                    context.l10n.shareAdded;
                                                Navigator.pop(context);
                                                messenger.showSnackBar(SnackBar(
                                                    content: Text(message)));
                                              })),
                                ] else ...[
                                  FilledButton.icon(
                                      icon: const Icon(Icons.share_outlined),
                                      label: Text(context.l10n.shareSend),
                                      onPressed: _busy
                                          ? null
                                          : () => _act(() async {
                                                await remoteSharingChannel
                                                    .invokeMethod<void>(
                                                        'share', {
                                                  'text': package.encode(),
                                                  'title':
                                                      context.l10n.shareTitle
                                                });
                                              })),
                                  const SizedBox(height: 12),
                                  OutlinedButton.icon(
                                      icon: const Icon(Icons.qr_code),
                                      label: Text(context.l10n.shareQr),
                                      onPressed:
                                          _busy || package.qrText() == null
                                              ? null
                                              : () => _act(() => _qr(package))),
                                  if (package.qrText() == null)
                                    Text(context.l10n.shareTooLarge),
                                ],
                                if (_busy)
                                  const Padding(
                                      padding: EdgeInsets.all(12),
                                      child: LinearProgressIndicator()),
                              ]))));
            }),
      ));
}
