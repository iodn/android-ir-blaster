import 'package:flutter/foundation.dart';

enum RepoItemType { file, dir }

@immutable
class RepoRef {
  final String owner;
  final String repo;
  final String branch;
  final String path;
  final String originalUrl;
  final String? alias;

  const RepoRef({
    required this.owner,
    required this.repo,
    required this.branch,
    required this.path,
    required this.originalUrl,
    this.alias,
  });

  RepoRef copyWith({
    String? owner,
    String? repo,
    String? branch,
    String? path,
    String? originalUrl,
    String? alias,
  }) =>
      RepoRef(
        owner: owner ?? this.owner,
        repo: repo ?? this.repo,
        branch: branch ?? this.branch,
        path: path ?? this.path,
        originalUrl: originalUrl ?? this.originalUrl,
        alias: alias ?? this.alias,
      );

  Map<String, dynamic> toJson() => {
        'owner': owner,
        'repo': repo,
        'branch': branch,
        'path': path,
        'originalUrl': originalUrl,
        if (alias != null) 'alias': alias,
      };

  factory RepoRef.fromJson(Map<String, dynamic> json) => RepoRef(
        owner: (json['owner'] ?? '').toString(),
        repo: (json['repo'] ?? '').toString(),
        branch: (json['branch'] ?? '').toString(),
        path: (json['path'] ?? '').toString(),
        originalUrl: (json['originalUrl'] ?? '').toString(),
        alias: (json['alias'] ?? '').toString().trim().isEmpty
            ? null
            : (json['alias']).toString(),
      );
}

@immutable
class RepoItem {
  final RepoItemType type;
  final String name;
  final String path;
  final int? size;
  final String? downloadUrl;
  final String? sha;

  const RepoItem({
    required this.type,
    required this.name,
    required this.path,
    this.size,
    this.downloadUrl,
    this.sha,
  });
}

@immutable
class GitHubFilePayload {
  final String name;
  final String path;
  final int size;
  final String text;

  const GitHubFilePayload({
    required this.name,
    required this.path,
    required this.size,
    required this.text,
  });
}
