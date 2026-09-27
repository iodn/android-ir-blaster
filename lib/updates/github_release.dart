class ReleaseVersion implements Comparable<ReleaseVersion> {
  ReleaseVersion(this.parts, this.build);
  final List<int> parts;
  final int? build;
  static ReleaseVersion? parse(String text) {
    final m = RegExp(r'^v?(\d+)\.(\d+)\.(\d+)(?:\+(\d+))?$').firstMatch(text);
    if (m == null) return null;
    return ReleaseVersion([for (var i = 1; i <= 3; i++) int.parse(m[i]!)],
        m[4] == null ? null : int.parse(m[4]!));
  }

  @override
  int compareTo(ReleaseVersion other) {
    for (var i = 0; i < 3; i++) {
      final result = parts[i].compareTo(other.parts[i]);
      if (result != 0) return result;
    }
    return build == null || other.build == null
        ? 0
        : build!.compareTo(other.build!);
  }
}

class GithubRelease {
  GithubRelease(this.version, this.page, this.asset);
  final String version;
  final Uri page;
  final Map<String, dynamic>? asset;
  static const repository = 'https://github.com/iodn/android-ir-blaster';
  static const latestApi =
      'https://api.github.com/repos/iodn/android-ir-blaster/releases/latest';

  static GithubRelease parse(Map<String, dynamic> json, String? abi) {
    final tag = json['tag_name'];
    if (tag is! String ||
        ReleaseVersion.parse(tag) == null ||
        json['draft'] != false ||
        json['prerelease'] != false) {
      throw const FormatException('Unsupported release');
    }
    final page = Uri.parse(json['html_url'] as String);
    if (page.scheme != 'https' ||
        page.host != 'github.com' ||
        page.hasPort ||
        page.userInfo.isNotEmpty ||
        page.path != '/iodn/android-ir-blaster/releases/tag/$tag') {
      throw const FormatException('Unexpected release URL');
    }
    Map<String, dynamic>? asset;
    final assets = json['assets'];
    if (assets is List &&
        ['arm64-v8a', 'armeabi-v7a', 'x86_64'].contains(abi)) {
      final matches = assets
          .whereType<Map>()
          .where((a) => a['name'] == 'irblaster-$abi-release.apk')
          .toList();
      if (matches.length == 1) {
        final a = matches.single;
        final uri = Uri.tryParse(a['browser_download_url'] as String? ?? '');
        final hash = a['digest'] as String? ?? '';
        final size = a['size'];
        if (uri != null &&
            uri.scheme == 'https' &&
            uri.host == 'github.com' &&
            !uri.hasPort &&
            uri.userInfo.isEmpty &&
            uri.query.isEmpty &&
            uri.fragment.isEmpty &&
            uri.path ==
                '/iodn/android-ir-blaster/releases/download/$tag/irblaster-$abi-release.apk' &&
            RegExp(r'^sha256:[0-9a-f]{64}$').hasMatch(hash) &&
            size is int &&
            size > 0 &&
            size <= 150 * 1024 * 1024) {
          asset = {
            'url': uri.toString(),
            'sha256': hash.substring(7),
            'size': size,
            'version': tag.replaceFirst(RegExp(r'^v'), ''),
            'abi': abi
          };
        }
      }
    }
    return GithubRelease(tag.replaceFirst(RegExp(r'^v'), ''), page, asset);
  }
}
