import 'dart:async';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:irblaster_controller/updates/github_release.dart';
import 'package:irblaster_controller/updates/update_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> releaseJson(
        {String tag = 'v3.5.0', String abi = 'arm64-v8a'}) =>
    {
      'tag_name': tag,
      'draft': false,
      'prerelease': false,
      'html_url': '${GithubRelease.repository}/releases/tag/$tag',
      'assets': [
        <String, dynamic>{
          'name': 'irblaster-$abi-release.apk',
          'size': 1234,
          'digest': 'sha256:${'a' * 64}',
          'browser_download_url':
              '${GithubRelease.repository}/releases/download/$tag/irblaster-$abi-release.apk'
        }
      ],
    };

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late UpdateController controller;
  var requests = 0;
  var source = 'github';
  final calls = <String>[];
  Map<String, Object> nativeInfo() =>
      {'source': source, 'version': '3.4.2', 'build': 45, 'abi': 'arm64-v8a'};
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    requests = 0;
    source = 'github';
    calls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(updateChannel, (call) async {
      calls.add(call.method);
      if (call.method == 'info') return nativeInfo();
      if (call.method == 'checkPlay') return {'available': true, 'build': 46};
      return null;
    });
    controller = UpdateController(
        clientFactory: () => MockClient((request) async {
              requests++;
              expect(request.url.toString(), GithubRelease.latestApi);
              return http.Response(jsonEncode(releaseJson()), 200);
            }));
  });
  tearDown(() => controller.dispose());

  test('default and startup perform no network or store check', () async {
    await controller.initialize();
    await controller.checkIfDue();
    expect(controller.automatic, isFalse);
    expect(requests, 0);
    expect(calls, ['info']);
  });
  test('manual check works without enabling automatic checks or downloading',
      () async {
    await controller.initialize();
    await controller.check();
    expect(requests, 1);
    expect(controller.available, isTrue);
    expect(controller.automatic, isFalse);
    expect(calls, ['info']);
    expect(controller.release!.asset!['abi'], 'arm64-v8a');
  });
  test('opt-in checks at most once a day and cached result survives restart',
      () async {
    await controller.initialize();
    await controller.setAutomatic(true);
    await controller.checkIfDue();
    expect(requests, 1);
    controller.dispose();
    controller = UpdateController(
        clientFactory: () => MockClient((_) async {
              fail('No repeated network request');
            }));
    await controller.initialize();
    expect(controller.available, isTrue);
    expect(controller.checkedAt, isNotNull);
    await controller.setAutomatic(false);
    await controller.checkIfDue();
    expect(controller.automatic, isFalse);
  });
  test('F-Droid gets upstream news but cannot download or install GitHub APKs',
      () async {
    source = 'fdroid';
    await controller.initialize();
    await controller.check();
    await controller.download();
    await controller.action('install');
    await controller.action('permission');
    expect(controller.available, isTrue);
    expect(calls, ['info']);
  });
  test('GitHub downloads only on request and never automatically installs',
      () async {
    await controller.initialize();
    await controller.download();
    expect(calls, ['info']);
    await controller.check();
    expect(calls, ['info']);
    await controller.download();
    expect(calls, ['info', 'download', 'info']);
    expect(controller.downloading, isFalse);
    expect(controller.failed, isFalse);
  });
  test('Play checks only Play and ignores saved GitHub choice and consent',
      () async {
    source = 'play';
    SharedPreferences.setMockInitialValues(
        {'updates_source': 'github', 'updates_automatic_github': true});
    await controller.initialize();
    expect(calls, ['info']);
    await controller.check();
    await controller.download();
    await controller.action('install');
    await controller.action('startPlay');
    expect(requests, 0);
    expect(calls, ['info', 'checkPlay', 'startPlay']);
    expect(controller.available, isTrue);
  });
  test(
      'unknown source requires a choice without borrowing another source consent',
      () async {
    source = 'unknown';
    await controller.initialize();
    await controller.check();
    expect(requests, 0);
    await controller.chooseSource('github');
    await controller.setAutomatic(true);
    expect(requests, 1);
    await controller.chooseSource('fdroid');
    expect(controller.automatic, isFalse);
    expect(controller.available, isFalse);
    expect(requests, 1);
  });
  test('network failure does not claim current version or crash', () async {
    controller.dispose();
    controller = UpdateController(
        clientFactory: () => MockClient((_) async => http.Response('', 403)));
    await controller.initialize();
    await controller.check();
    expect(controller.failed, isTrue);
    expect(controller.checkedAt, isNull);
    expect(controller.checking, isFalse);
  });
  test('disabling during a check discards the response', () async {
    final pending = Completer<http.Response>();
    controller.dispose();
    controller = UpdateController(
        clientFactory: () => MockClient((_) => pending.future));
    await controller.initialize();
    final checking = controller.check();
    await Future<void>.delayed(Duration.zero);
    await controller.setAutomatic(false);
    pending.complete(http.Response(jsonEncode(releaseJson()), 200));
    await checking;
    expect(controller.available, isFalse);
  });
  test(
      'numeric version comparison handles 3.10, tags, build numbers and downgrades',
      () {
    expect(
        ReleaseVersion.parse('v3.10.0')!
            .compareTo(ReleaseVersion.parse('3.9.0')!),
        greaterThan(0));
    expect(
        ReleaseVersion.parse('3.4.2')!
            .compareTo(ReleaseVersion.parse('3.4.2+45')!),
        0);
    expect(
        ReleaseVersion.parse('3.4.2+46')!
            .compareTo(ReleaseVersion.parse('3.4.2+45')!),
        greaterThan(0));
    expect(
        ReleaseVersion.parse('3.3.0')!
            .compareTo(ReleaseVersion.parse('3.4.2')!),
        lessThan(0));
    expect(ReleaseVersion.parse('3.5.0-beta'), isNull);
  });
  test(
      'unverified, duplicated, foreign and wrong ABI assets cannot be installed',
      () {
    for (final mutate in <void Function(Map<String, dynamic>)>[
      (j) => j['assets'][0]['digest'] = null,
      (j) => j['assets'][0]['browser_download_url'] =
          'http://github.com/update.apk',
      (j) => j['assets'][0]['browser_download_url'] =
          'https://attacker.example/update.apk',
      (j) => j['assets'][0]['size'] = 200 * 1024 * 1024,
      (j) => j['assets'].add(j['assets'][0]),
    ]) {
      final json = releaseJson();
      mutate(json);
      expect(GithubRelease.parse(json, 'arm64-v8a').asset, isNull);
    }
    expect(GithubRelease.parse(releaseJson(), 'armeabi-v7a').asset, isNull);
    expect(GithubRelease.parse(releaseJson(), null).asset, isNull);
    expect(
        () => GithubRelease.parse(
            releaseJson()..['prerelease'] = true, 'arm64-v8a'),
        throwsFormatException);
    expect(
        () => GithubRelease.parse(
            releaseJson()..['html_url'] = 'https://example.com', 'arm64-v8a'),
        throwsFormatException);
  });
}
