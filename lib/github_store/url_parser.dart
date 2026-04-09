import 'models.dart';

RepoRef? parseGitHubUrl(String url) {
  final trimmed = url.trim();
  if (trimmed.isEmpty) return null;
  final uri = Uri.tryParse(trimmed);
  if (uri == null) return null;
  if (uri.host.toLowerCase() != 'github.com') return null;

  final segs = uri.path.split('/').where((s) => s.isNotEmpty).toList();
  if (segs.length < 2) return null;

  final owner = segs[0];
  final repo = segs[1];
  var branch = '';
  var path = '';

  if (segs.length >= 4 && segs[2] == 'tree') {
    branch = segs[3];
    if (segs.length > 4) {
      path = segs.sublist(4).join('/');
    }
  }

  return RepoRef(
    owner: owner,
    repo: repo,
    branch: branch,
    path: path,
    originalUrl: url,
  );
}
