import 'dart:convert';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/github_store/github_store_service.dart';
import 'package:irblaster_controller/github_store/models.dart';
import 'package:irblaster_controller/github_store/url_parser.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remotes_io.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _describeGitHubStoreError(
  Object error, {
  required bool hasSavedToken,
}) {
  if (error is GitHubRateLimitException) {
    final resetAt = error.resetAt;
    if (resetAt == null) {
      return hasSavedToken
          ? 'GitHub API rate limit reached. Try again later.'
          : 'GitHub API rate limit reached. Add an optional personal token in Connection if you want higher limits on this device.';
    }
    final local = resetAt.toLocal();
    final hh = local.hour % 12 == 0 ? 12 : local.hour % 12;
    final mm = local.minute.toString().padLeft(2, '0');
    final ampm = local.hour >= 12 ? 'PM' : 'AM';
    final month = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ][local.month - 1];
    final when = '$month ${local.day}, $hh:$mm $ampm';
    return hasSavedToken
        ? 'GitHub API rate limit reached. Try again after $when.'
        : 'GitHub API rate limit reached. Try again after $when, or add an optional personal token in Connection for higher limits on this device.';
  }
  if (error is GitHubAuthException) {
    return error.message;
  }
  return error.toString().replaceFirst('Exception: ', '');
}

class GitHubStoreScreen extends StatefulWidget {
  const GitHubStoreScreen({super.key});

  @override
  State<GitHubStoreScreen> createState() => _GitHubStoreScreenState();
}

class _GitHubStoreScreenState extends State<GitHubStoreScreen> {
  static const String _defaultRepoUrl =
      'https://github.com/Lucaslhm/Flipper-IRDB';

  final TextEditingController _urlCtrl = TextEditingController();
  final TextEditingController _searchCtrl = TextEditingController();
  final GitHubStoreService _service = GitHubStoreService();

  RepoRef? _repo;
  List<RepoRef> _sources = const <RepoRef>[];
  String _currentPath = '';
  List<RepoItem> _items = const <RepoItem>[];
  bool _loading = false;
  String? _error;
  Object? _lastStoreError;
  bool _repoControlsExpanded = true;
  bool _hasSavedToken = false;
  bool _hasLoadedDirectory = false;
  bool _hasAttemptedLoad = false;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final sources = await _GitHubStorePrefs.loadSources();
    final last = await _GitHubStorePrefs.loadLastRepo();
    final token = await _GitHubStorePrefs.loadAuthToken();
    final initial = last ??
        parseGitHubUrl(_defaultRepoUrl) ??
        const RepoRef(
          owner: 'Lucaslhm',
          repo: 'Flipper-IRDB',
          branch: '',
          path: '',
          originalUrl: _defaultRepoUrl,
        );

    if (!mounted) return;
    setState(() {
      _sources = sources;
      _repo = initial;
      _currentPath = initial.path;
      _urlCtrl.text = initial.originalUrl;
      _hasSavedToken = token?.trim().isNotEmpty == true;
    });
    _service.setAuthToken(token);
  }

  @override
  void dispose() {
    _urlCtrl.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  String _relativeCurrentPath() {
    final repo = _repo;
    if (repo == null) return '';
    final root = repo.path;
    final current = _currentPath;
    if (root.isNotEmpty && current.startsWith(root)) {
      final rel = current.substring(root.length);
      return rel.startsWith('/') ? rel.substring(1) : rel;
    }
    return current;
  }

  bool get _canNavigateUp {
    final repo = _repo;
    if (repo == null) return false;
    final root = repo.path.trim();
    final current = _currentPath.trim();
    if (current.isEmpty) return false;
    if (root.isEmpty) return true;
    return current != root;
  }

  String get _repoLabel {
    final repo = _repo;
    if (repo == null) return 'No source selected';
    final alias = repo.alias?.trim();
    if (alias != null && alias.isNotEmpty) return alias;
    return '${repo.owner}/${repo.repo}';
  }

  bool get _isDefaultRepoSelected {
    final repo = _repo;
    if (repo == null) return false;
    return repo.owner.toLowerCase() == 'lucaslhm' &&
        repo.repo.toLowerCase() == 'flipper-irdb';
  }

  Future<void> _browseFromUrl() async {
    final raw = _urlCtrl.text.trim();
    final parsed = parseGitHubUrl(raw);
    if (parsed == null) {
      _showSnack('Only GitHub repository links are supported.');
      return;
    }
    setState(() {
      _repo = parsed;
      _currentPath = parsed.path;
      _items = const <RepoItem>[];
      _error = null;
      _lastStoreError = null;
      _hasLoadedDirectory = false;
      _hasAttemptedLoad = false;
    });
    await _GitHubStorePrefs.saveLastRepo(parsed);
    await _loadDirectory();
  }

  Future<void> _loadDirectory({bool forceRefresh = false}) async {
    final repo = _repo;
    if (repo == null) return;
    setState(() {
      _loading = true;
      _error = null;
      _lastStoreError = null;
      _hasAttemptedLoad = true;
    });
    try {
      final items = await _service.listDirectory(
        repo,
        subPath: _relativeCurrentPath(),
        forceRefresh: forceRefresh,
      );
      if (!mounted) return;
      setState(() {
        _items = items;
        _lastStoreError = null;
        _hasLoadedDirectory = true;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = _describeGitHubStoreError(
          e,
          hasSavedToken: _hasSavedToken,
        );
        _lastStoreError = e;
        _hasLoadedDirectory = false;
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _syncTokenFromPrefs() async {
    final token = await _GitHubStorePrefs.loadAuthToken();
    _service.setAuthToken(token);
    if (!mounted) return;
    setState(() {
      _hasSavedToken = token?.trim().isNotEmpty == true;
    });
  }

  Future<void> _openConnectionSettings() async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => const _GitHubConnectionScreen(),
      ),
    );
    await _syncTokenFromPrefs();
  }

  Future<void> _navigateUp() async {
    if (!_canNavigateUp) return;
    final currentParts =
        _currentPath.split('/').where((p) => p.isNotEmpty).toList();
    final rootParts =
        (_repo?.path ?? '').split('/').where((p) => p.isNotEmpty).toList();
    if (currentParts.length <= rootParts.length) return;
    final next = currentParts.sublist(0, currentParts.length - 1).join('/');
    setState(() {
      _currentPath = next;
    });
    await _loadDirectory();
  }

  Future<void> _openItem(RepoItem item) async {
    if (item.type == RepoItemType.dir) {
      setState(() {
        _currentPath = item.path;
      });
      await _loadDirectory();
      return;
    }
    if (!isSupportedImportFilename(item.name)) {
      _showSnack('This file type is not supported for import.');
      return;
    }
    if (_repo == null || !mounted) return;
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _GitHubFileImportScreen(
          repo: _repo!,
          item: item,
          service: _service,
        ),
      ),
    );
  }

  Future<void> _saveCurrentSource() async {
    final repo = _repo;
    if (repo == null) return;
    final exists = _sources.any((source) => _sameSource(source, repo));
    if (exists) {
      _showSnack('Source already saved.');
      return;
    }
    final alias = repo.alias?.trim().isNotEmpty == true
        ? repo.alias!.trim()
        : '${repo.owner}/${repo.repo}';
    final updated = [
      ..._sources,
      repo.copyWith(alias: alias),
    ];
    await _GitHubStorePrefs.saveSources(updated);
    if (!mounted) return;
    setState(() {
      _sources = updated;
      _repo = repo.copyWith(alias: alias);
    });
    _showSnack('Source saved.');
  }

  Future<void> _openSourcePicker() async {
    if (_sources.isEmpty) {
      _showSnack('No saved sources yet.');
      return;
    }
    final chosen = await showModalBottomSheet<RepoRef>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Choose source',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    tooltip: 'Manage',
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.settings_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _sources.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final source = _sources[index];
                    final label = source.alias?.trim().isNotEmpty == true
                        ? source.alias!.trim()
                        : '${source.owner}/${source.repo}';
                    return ListTile(
                      leading: const Icon(Icons.bookmarks_outlined),
                      title: Text(label, overflow: TextOverflow.ellipsis),
                      subtitle: Text(
                        source.originalUrl,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () => Navigator.of(context).pop(source),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (chosen == null || !mounted) return;
    setState(() {
      _repo = chosen;
      _currentPath = chosen.path;
      _urlCtrl.text = chosen.originalUrl;
      _items = const <RepoItem>[];
      _error = null;
      _hasLoadedDirectory = false;
      _hasAttemptedLoad = false;
    });
    await _GitHubStorePrefs.saveLastRepo(chosen);
  }

  Future<void> _openManageSources() async {
    final updated = await Navigator.of(context).push<List<RepoRef>>(
      MaterialPageRoute<List<RepoRef>>(
        builder: (_) => _ManageSourcesScreen(sources: _sources),
      ),
    );
    if (updated == null || !mounted) return;
    await _GitHubStorePrefs.saveSources(updated);
    setState(() {
      _sources = updated;
    });
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final repo = _repo;
    final query = _searchCtrl.text.trim().toLowerCase();
    final visible = query.isEmpty
        ? _items
        : _items
            .where((item) => item.name.toLowerCase().contains(query))
            .toList(growable: false);

    return PopScope(
      canPop: !_canNavigateUp,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (_canNavigateUp) {
          await _navigateUp();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GitHub Store'),
          actions: [
            IconButton(
              tooltip: 'Saved sources',
              onPressed: _sources.isEmpty ? null : _openSourcePicker,
              icon: const Icon(Icons.bookmarks_outlined),
            ),
            IconButton(
              tooltip: 'GitHub connection',
              onPressed: _openConnectionSettings,
              icon: const FaIcon(FontAwesomeIcons.github),
            ),
            IconButton(
              tooltip: 'Manage sources',
              onPressed: _openManageSources,
              icon: const Icon(Icons.tune_rounded),
            ),
            IconButton(
              tooltip: 'Refresh',
              onPressed: repo == null || _loading || !_hasLoadedDirectory
                  ? null
                  : () => _loadDirectory(forceRefresh: true),
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            if (repo != null && _hasLoadedDirectory) {
              await _loadDirectory(forceRefresh: true);
            }
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            children: [
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        _repoLabel,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: 'Pick saved source',
                            onPressed:
                                _sources.isEmpty ? null : _openSourcePicker,
                            icon: const Icon(Icons.bookmarks_outlined),
                          ),
                          Icon(
                            _repoControlsExpanded
                                ? Icons.expand_less_rounded
                                : Icons.expand_more_rounded,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          _repoControlsExpanded = !_repoControlsExpanded;
                        });
                      },
                    ),
                    if (_repoControlsExpanded)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              repo?.originalUrl ?? _defaultRepoUrl,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _urlCtrl,
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.go,
                              onSubmitted: (_) => _browseFromUrl(),
                              decoration: const InputDecoration(
                                labelText: 'GitHub URL',
                                hintText:
                                    'https://github.com/OWNER/REPO[/tree/BRANCH/path]',
                                prefixIcon: Icon(Icons.link_rounded),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: FilledButton.icon(
                                    onPressed: _loading ? null : _browseFromUrl,
                                    icon: const Icon(Icons.storefront_rounded),
                                    label: const Text('Browse'),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: repo == null
                                        ? null
                                        : _saveCurrentSource,
                                    icon:
                                        const Icon(Icons.bookmark_add_outlined),
                                    label: const Text('Save source'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (repo != null && _hasLoadedDirectory) ...[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${repo.owner}/${repo.repo}',
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: _canNavigateUp ? _navigateUp : null,
                              icon: const Icon(Icons.arrow_upward_rounded),
                              label: const Text('Up'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _currentPath.isEmpty ? '/' : '/$_currentPath',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _searchCtrl,
                          onChanged: (_) => setState(() {}),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search_rounded),
                            hintText: 'Filter current folder',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
              if (_loading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (repo != null && !_hasAttemptedLoad)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _isDefaultRepoSelected
                              ? 'Example GitHub source'
                              : 'Repository not loaded yet',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _isDefaultRepoSelected
                              ? 'The default repository is only an example source for IR codes.'
                              : 'Tap the button below to load the selected GitHub repository.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 14),
                        FilledButton.icon(
                          onPressed: _loading ? null : _loadDirectory,
                          icon: const Icon(Icons.cloud_download_rounded),
                          label: Text(
                            _isDefaultRepoSelected
                                ? 'Load example repository'
                                : 'Load repository',
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else if (_error != null)
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          _error!,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ),
                    ),
                    if (_lastStoreError is GitHubRateLimitException) ...[
                      const SizedBox(height: 10),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Improve GitHub access',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _hasSavedToken
                                    ? 'This device already has a saved token. You can review it or test the connection from GitHub Connection.'
                                    : 'You can keep using public GitHub access, or add an optional personal token to raise the API limit for this device.',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 12),
                              FilledButton.icon(
                                onPressed: _openConnectionSettings,
                                icon: const FaIcon(
                                  FontAwesomeIcons.github,
                                  size: 16,
                                ),
                                label: const Text('Open GitHub Connection'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                )
              else if (repo == null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Enter a GitHub URL to start browsing.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                )
              else if (visible.isEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'No matching files or folders were found here.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                )
              else
                Card(
                  child: Column(
                    children: [
                      for (var i = 0; i < visible.length; i++) ...[
                        ListTile(
                          leading: Icon(
                            visible[i].type == RepoItemType.dir
                                ? Icons.folder_open_rounded
                                : Icons.description_outlined,
                          ),
                          title: Text(visible[i].name),
                          subtitle: Text(
                            visible[i].path,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: visible[i].type == RepoItemType.dir
                              ? const Icon(Icons.chevron_right_rounded)
                              : _FileSupportChip(fileName: visible[i].name),
                          onTap: () => _openItem(visible[i]),
                        ),
                        if (i != visible.length - 1) const Divider(height: 1),
                      ],
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FileSupportChip extends StatelessWidget {
  const _FileSupportChip({required this.fileName});

  final String fileName;

  @override
  Widget build(BuildContext context) {
    final supported = isSupportedImportFilename(fileName);
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: supported ? cs.primaryContainer : cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        supported ? 'Import' : 'Unsupported',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: supported ? cs.onPrimaryContainer : cs.onSurfaceVariant,
            ),
      ),
    );
  }
}

class _GitHubFileImportScreen extends StatefulWidget {
  const _GitHubFileImportScreen({
    required this.repo,
    required this.item,
    required this.service,
  });

  final RepoRef repo;
  final RepoItem item;
  final GitHubStoreService service;

  @override
  State<_GitHubFileImportScreen> createState() =>
      _GitHubFileImportScreenState();
}

class _GitHubFileImportScreenState extends State<_GitHubFileImportScreen> {
  Future<_ParsedGitHubImport>? _future;
  bool _saving = false;
  bool _wrap = true;

  Future<void> _showImportSuccessSheet({
    required String title,
    required String message,
    Remote? remoteToOpen,
  }) async {
    final action = await showModalBottomSheet<_ImportSuccessAction>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (sheetContext) {
        final theme = Theme.of(sheetContext);
        final cs = theme.colorScheme;
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.14),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          message,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              if (remoteToOpen != null) ...[
                FilledButton.icon(
                  onPressed: () => Navigator.of(sheetContext).pop(
                    _ImportSuccessAction.openRemote,
                  ),
                  icon: const Icon(Icons.settings_remote_rounded),
                  label: const Text('Open remote'),
                ),
                const SizedBox(height: 10),
              ],
              OutlinedButton.icon(
                onPressed: () => Navigator.of(sheetContext).pop(
                  _ImportSuccessAction.browseAgain,
                ),
                icon: const Icon(Icons.travel_explore_rounded),
                label: const Text('Browse again'),
              ),
            ],
          ),
        );
      },
    );

    if (!mounted) return;
    if (action == _ImportSuccessAction.openRemote && remoteToOpen != null) {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => RemoteView(remote: remoteToOpen),
        ),
      );
      return;
    }

    if (action == _ImportSuccessAction.browseAgain || action == null) {
      Navigator.of(context).pop();
    }
  }

  Future<_ParsedGitHubImport> _load(BuildContext context) async {
    final fallbackRemoteName = context.l10n.importedRemoteDefaultName;
    final fallbackButtonLabel = context.l10n.buttonFallbackTitle;
    final payload =
        await widget.service.fetchFileText(widget.repo, widget.item.path);
    final preview = analyzeImportedText(
      payload.text,
      filename: widget.item.name,
      fallbackRemoteName: fallbackRemoteName,
      fallbackButtonLabel: fallbackButtonLabel,
    );
    return _ParsedGitHubImport(
      payload: payload,
      preview: preview,
    );
  }

  Future<void> _saveAsNew(_ParsedGitHubImport parsed) async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      if (remotes.isEmpty) {
        remotes = await readRemotes();
      }
      final importedRemotes = cloneRemotesForImport(parsed.preview.remotes);
      final importedIds = importedRemotes.map((remote) => remote.id).toSet();
      final next = <Remote>[
        ...remotes,
        ...importedRemotes,
      ];
      await writeRemotelist(next);
      remotes = await readRemotes();
      notifyRemotesChanged();
      if (!mounted) return;
      final savedRemotes = remotes
          .where((remote) => importedIds.contains(remote.id))
          .toList(growable: false);
      final importedCount = savedRemotes.length;
      await _showImportSuccessSheet(
        title: importedCount == 1 ? 'Remote imported' : 'Remotes imported',
        message: importedCount == 1
            ? 'The remote is ready. You can keep browsing GitHub or open it now.'
            : 'Imported $importedCount remotes. You can go back to GitHub Store and continue browsing.',
        remoteToOpen: importedCount == 1 ? savedRemotes.first : null,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Import failed: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  Future<void> _saveIntoExisting(_ParsedGitHubImport parsed) async {
    if (_saving) return;
    if (remotes.isEmpty) {
      remotes = await readRemotes();
    }
    if (!mounted) return;
    if (remotes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.noRemotesAvailable)),
      );
      return;
    }

    final target = await showModalBottomSheet<Remote>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: remotes.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (_, index) {
            final remote = remotes[index];
            return ListTile(
              leading: const Icon(Icons.settings_remote_outlined),
              title: Text(
                remote.name.isEmpty
                    ? context.l10n.remoteNumber(remote.id)
                    : remote.name,
              ),
              subtitle: Text(
                context.l10n.remoteButtonCountLabel(remote.buttons.length),
              ),
              onTap: () => Navigator.of(sheetContext).pop(remote),
            );
          },
        ),
      ),
    );
    if (target == null) return;

    setState(() => _saving = true);
    try {
      final idx = remotes.indexWhere((remote) => remote.id == target.id);
      if (idx < 0) {
        throw StateError('Target remote not found.');
      }

      final existingKeys = remotes[idx]
          .buttons
          .map((button) => normalizeButtonKey(button.image))
          .toSet();
      final incoming = cloneButtonsForImport(
        parsed.preview.remotes.expand((remote) => remote.buttons),
      );

      final toAdd = <IRButton>[];
      var skipped = 0;
      for (final button in incoming) {
        final key = normalizeButtonKey(button.image);
        if (key.isNotEmpty && existingKeys.contains(key)) {
          skipped++;
          continue;
        }
        existingKeys.add(key);
        toAdd.add(button);
      }

      if (toAdd.isEmpty) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              context.l10n.importedButtonsSkippedDuplicates(0, skipped),
            ),
          ),
        );
        return;
      }

      remotes[idx].buttons.addAll(toAdd);
      await writeRemotelist(remotes);
      remotes = await readRemotes();
      notifyRemotesChanged();

      if (!mounted) return;
      final updatedRemote = remotes
          .where((remote) => remote.id == target.id)
          .firstOrNull;
      final remoteLabel = updatedRemote?.name.isNotEmpty == true
          ? updatedRemote!.name
          : context.l10n.remoteNumber(target.id);
      final message = skipped > 0
          ? context.l10n.importedButtonsSkippedDuplicates(toAdd.length, skipped)
          : context.l10n.importedButtonCount(toAdd.length);
      final successMessage = updatedRemote == null
          ? '$remoteLabel: $message'
          : '$remoteLabel: $message You can keep browsing GitHub or open this remote now.';
      await _showImportSuccessSheet(
        title: 'Import complete',
        message: successMessage,
        remoteToOpen: updatedRemote,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Import failed: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _future ??= _load(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
      ),
      body: FutureBuilder<_ParsedGitHubImport>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  _describeGitHubStoreError(
                    snapshot.error ?? Exception('Unknown error'),
                    hasSavedToken: widget.service.hasAuthToken,
                  ),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final parsed = snapshot.data!;
          final preview = parsed.preview;

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        parsed.payload.path,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: preview.isSupported
                                  ? theme.colorScheme.primaryContainer
                                  : theme.colorScheme.errorContainer,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              preview.isSupported
                                  ? 'Compatible'
                                  : 'Not compatible',
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: preview.isSupported
                                    ? theme.colorScheme.onPrimaryContainer
                                    : theme.colorScheme.onErrorContainer,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              preview.formatLabel,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        preview.supportReason,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Parsed ${preview.remotes.length} remote${preview.remotes.length == 1 ? '' : 's'} and ${preview.totalButtons} button${preview.totalButtons == 1 ? '' : 's'}.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 12),
                      for (final remote in preview.remotes.take(8))
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.settings_remote_outlined,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  '${remote.name.isEmpty ? context.l10n.unnamedRemote : remote.name} (${remote.buttons.length})',
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (preview.remotes.length > 8)
                        Text(
                          '+${preview.remotes.length - 8} more',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      if (preview.issues.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Text(
                          'Validation',
                          style: theme.textTheme.labelLarge,
                        ),
                        const SizedBox(height: 6),
                        for (final issue in preview.issues.take(6))
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  size: 16,
                                  color: theme.colorScheme.tertiary,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    issue,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'File preview',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            tooltip: _wrap ? 'Disable wrap' : 'Enable wrap',
                            onPressed: () => setState(() => _wrap = !_wrap),
                            icon: Icon(
                              _wrap
                                  ? Icons.wrap_text_rounded
                                  : Icons.swap_horiz_rounded,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(maxHeight: 360),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: _codeView(context, parsed.payload.text, _wrap),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _saving || !preview.isSupported
                    ? null
                    : () => _saveAsNew(parsed),
                icon: const Icon(Icons.add_box_outlined),
                label: Text(
                  preview.remotes.length == 1
                      ? 'Create new remote'
                      : 'Create new remotes',
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _saving || !preview.isSupported
                    ? null
                    : () => _saveIntoExisting(parsed),
                icon: const Icon(Icons.playlist_add_rounded),
                label: const Text('Add buttons to existing remote'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _codeView(BuildContext context, String text, bool wrap) {
    final mono = const TextStyle(fontFamily: 'monospace');

    if (wrap) {
      return SingleChildScrollView(
        child: SelectableText(text, style: mono),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width),
        child: SingleChildScrollView(
          child: SelectableText(text, style: mono),
        ),
      ),
    );
  }
}

enum _ImportSuccessAction {
  browseAgain,
  openRemote,
}

class _ManageSourcesScreen extends StatefulWidget {
  const _ManageSourcesScreen({required this.sources});

  final List<RepoRef> sources;

  @override
  State<_ManageSourcesScreen> createState() => _ManageSourcesScreenState();
}

class _ManageSourcesScreenState extends State<_ManageSourcesScreen> {
  final List<RepoRef> _sources = <RepoRef>[];

  @override
  void initState() {
    super.initState();
    _sources.addAll(widget.sources);
  }

  Future<void> _rename(int index) async {
    final source = _sources[index];
    final controller = TextEditingController(
      text: source.alias?.trim().isNotEmpty == true
          ? source.alias!.trim()
          : '${source.owner}/${source.repo}',
    );

    final alias = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        final inset = MediaQuery.of(context).viewInsets.bottom;
        return Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + inset),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rename source',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Alias',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: () =>
                        Navigator.of(context).pop(controller.text.trim()),
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    if (alias == null || alias.isEmpty || !mounted) return;
    setState(() {
      _sources[index] = source.copyWith(alias: alias);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Sources'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(_sources),
            child: const Text('Done'),
          ),
        ],
      ),
      body: _sources.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'No sources saved yet.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            )
          : ReorderableListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _sources.length,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  var target = newIndex;
                  if (target > oldIndex) target -= 1;
                  final item = _sources.removeAt(oldIndex);
                  _sources.insert(target, item);
                });
              },
              itemBuilder: (context, index) {
                final source = _sources[index];
                final title = source.alias?.trim().isNotEmpty == true
                    ? source.alias!.trim()
                    : '${source.owner}/${source.repo}';
                return ListTile(
                  key: ValueKey(
                    '${source.owner}/${source.repo}/${source.branch}/${source.path}',
                  ),
                  leading: const Icon(Icons.drag_handle_rounded),
                  title: Text(title),
                  subtitle: Text(
                    source.originalUrl,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        tooltip: 'Rename',
                        onPressed: () => _rename(index),
                        icon: const Icon(Icons.edit_outlined),
                      ),
                      IconButton(
                        tooltip: 'Delete',
                        onPressed: () {
                          setState(() {
                            _sources.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class _ParsedGitHubImport {
  const _ParsedGitHubImport({
    required this.payload,
    required this.preview,
  });

  final GitHubFilePayload payload;
  final ImportPreviewResult preview;
}

class _GitHubConnectionScreen extends StatefulWidget {
  const _GitHubConnectionScreen();

  @override
  State<_GitHubConnectionScreen> createState() => _GitHubConnectionScreenState();
}

class _GitHubConnectionScreenState extends State<_GitHubConnectionScreen> {
  final TextEditingController _tokenCtrl = TextEditingController();
  final GitHubStoreService _service = GitHubStoreService();

  bool _loadingPrefs = true;
  bool _testing = false;
  bool _showToken = false;
  bool _hasSavedToken = false;
  String? _statusMessage;
  bool _statusIsError = false;
  GitHubRateLimitStatus? _status;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final token = await _GitHubStorePrefs.loadAuthToken();
    _service.setAuthToken(token);
    if (!mounted) return;
    setState(() {
      _tokenCtrl.text = token ?? '';
      _hasSavedToken = token?.trim().isNotEmpty == true;
      _loadingPrefs = false;
    });
  }

  @override
  void dispose() {
    _tokenCtrl.dispose();
    super.dispose();
  }

  Future<void> _saveToken() async {
    final token = _tokenCtrl.text.trim();
    await _GitHubStorePrefs.saveAuthToken(token);
    _service.setAuthToken(token);
    if (!mounted) return;
    setState(() {
      _hasSavedToken = token.isNotEmpty;
      _statusMessage = token.isEmpty
          ? 'Personal token removed. The app is using public GitHub access.'
          : 'Personal token saved on this device.';
      _statusIsError = false;
    });
  }

  Future<void> _removeToken() async {
    _tokenCtrl.clear();
    await _saveToken();
  }

  Future<void> _testConnection() async {
    final token = _tokenCtrl.text.trim();
    _service.setAuthToken(token);
    setState(() {
      _testing = true;
      _statusMessage = null;
      _status = null;
      _statusIsError = false;
    });
    try {
      final status = await _service.getRateLimitStatus();
      if (!mounted) return;
      setState(() {
        _status = status;
        _statusIsError = false;
        _statusMessage = token.isEmpty
            ? 'Public GitHub access is working.'
            : 'GitHub token is working.';
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _statusIsError = true;
        _statusMessage = _describeGitHubStoreError(
          error,
          hasSavedToken: token.isNotEmpty,
        );
      });
    } finally {
      if (mounted) {
        setState(() {
          _testing = false;
        });
      }
    }
  }

  String? _formatResetAt(DateTime? dateTime) {
    if (dateTime == null) return null;
    final local = dateTime.toLocal();
    final hh = local.hour % 12 == 0 ? 12 : local.hour % 12;
    final mm = local.minute.toString().padLeft(2, '0');
    final ampm = local.hour >= 12 ? 'PM' : 'AM';
    final month = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ][local.month - 1];
    return '$month ${local.day}, $hh:$mm $ampm';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Connection'),
      ),
      body: _loadingPrefs
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: cs.primaryContainer,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                Icons.cloud_sync_outlined,
                                color: cs.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'GitHub access for browsing and import',
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'The app uses public GitHub access by default and caches results on this device.',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: cs.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Personal access token',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Optional. If you leave this empty, the app keeps using public GitHub access.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _tokenCtrl,
                          obscureText: !_showToken,
                          autocorrect: false,
                          enableSuggestions: false,
                          decoration: InputDecoration(
                            labelText: 'GitHub personal access token',
                            hintText: 'ghp_...',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.key_rounded),
                            suffixIcon: IconButton(
                              tooltip: _showToken ? 'Hide token' : 'Show token',
                              onPressed: () {
                                setState(() {
                                  _showToken = !_showToken;
                                });
                              },
                              icon: Icon(
                                _showToken
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: FilledButton.icon(
                                onPressed: _saveToken,
                                icon: const Icon(Icons.save_outlined),
                                label: Text(
                                  _hasSavedToken ? 'Update token' : 'Save token',
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: _hasSavedToken ||
                                        _tokenCtrl.text.trim().isNotEmpty
                                    ? _removeToken
                                    : null,
                                icon: const Icon(Icons.delete_outline),
                                label: const Text('Remove'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Stored on this device only.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check GitHub access',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Run a lightweight GitHub check to verify your current access mode and see your current rate limit window.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 12),
                        FilledButton.tonalIcon(
                          onPressed: _testing ? null : _testConnection,
                          icon: _testing
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.network_check_rounded),
                          label: Text(
                            _testing ? 'Checking…' : 'Test GitHub access',
                          ),
                        ),
                        if (_statusMessage != null) ...[
                          const SizedBox(height: 14),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: _statusIsError
                                  ? cs.errorContainer
                                  : cs.secondaryContainer,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _statusIsError ? 'Connection issue' : 'Connection ready',
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: _statusIsError
                                        ? cs.onErrorContainer
                                        : cs.onSecondaryContainer,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  _statusMessage!,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: _statusIsError
                                        ? cs.onErrorContainer
                                        : cs.onSecondaryContainer,
                                  ),
                                ),
                                if (_status != null) ...[
                                  const SizedBox(height: 10),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      if (_status!.remaining != null)
                                        Chip(
                                          label: Text(
                                            'Remaining: ${_status!.remaining}',
                                          ),
                                        ),
                                      if (_status!.limit != null)
                                        Chip(
                                          label: Text(
                                            'Limit: ${_status!.limit}',
                                          ),
                                        ),
                                      if (_formatResetAt(_status!.resetAt) != null)
                                        Chip(
                                          label: Text(
                                            'Reset: ${_formatResetAt(_status!.resetAt)!}',
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _GitHubStorePrefs {
  static const String _lastRepoKey = 'irblaster.store.lastRepo';
  static const String _sourcesKey = 'irblaster.store.sources';
  static const String _authTokenKey = 'irblaster.store.githubAuthToken';

  static Future<RepoRef?> loadLastRepo() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_lastRepoKey);
    if (raw == null || raw.trim().isEmpty) return null;
    try {
      final map = jsonDecode(raw);
      if (map is! Map) return null;
      final repo = RepoRef.fromJson(Map<String, dynamic>.from(map));
      if (repo.owner.isEmpty || repo.repo.isEmpty) return null;
      return repo;
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveLastRepo(RepoRef repo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastRepoKey, jsonEncode(repo.toJson()));
  }

  static Future<List<RepoRef>> loadSources() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_sourcesKey);
    if (raw == null || raw.trim().isEmpty) return const <RepoRef>[];
    try {
      final list = jsonDecode(raw);
      if (list is! List) return const <RepoRef>[];
      return list
          .whereType<Map>()
          .map((item) => RepoRef.fromJson(Map<String, dynamic>.from(item)))
          .where((repo) => repo.owner.isNotEmpty && repo.repo.isNotEmpty)
          .toList();
    } catch (_) {
      return const <RepoRef>[];
    }
  }

  static Future<void> saveSources(List<RepoRef> sources) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _sourcesKey,
      jsonEncode(sources.map((source) => source.toJson()).toList()),
    );
  }

  static Future<String?> loadAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_authTokenKey)?.trim() ?? '';
    return token.isEmpty ? null : token;
  }

  static Future<void> saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final trimmed = token.trim();
    if (trimmed.isEmpty) {
      await prefs.remove(_authTokenKey);
      return;
    }
    await prefs.setString(_authTokenKey, trimmed);
  }
}

bool _sameSource(RepoRef a, RepoRef b) {
  return a.owner == b.owner &&
      a.repo == b.repo &&
      a.branch == b.branch &&
      a.path == b.path;
}
