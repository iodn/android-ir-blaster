import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'github_release.dart';

const updateChannel = MethodChannel('org.nslabs/app_updates');

class UpdateController extends ChangeNotifier with WidgetsBindingObserver {
  UpdateController({http.Client Function()? clientFactory})
      : _clientFactory = clientFactory ?? http.Client.new;
  static final instance = UpdateController();
  final http.Client Function() _clientFactory;
  Future<void>? _initializing;
  SharedPreferences? _prefs;
  Map<String, dynamic> info = {};
  bool automatic = false, checking = false, downloading = false, acting = false;
  bool available = false, failed = false, initialized = false;
  double progress = 0;
  DateTime? checkedAt;
  GithubRelease? release;
  int? playBuild;
  http.Client? _client;
  int _generation = 0;

  String get source {
    final detected = info['source'] as String? ?? 'unknown';
    final chosen = _prefs?.getString('updates_source');
    return detected == 'unknown'
        ? (['github', 'fdroid'].contains(chosen) ? chosen! : 'unknown')
        : detected;
  }

  bool get busy => checking || downloading || acting;
  bool get ready => info['ready'] == true && source == 'github';
  String get version => '${info['version'] ?? '?'} (${info['build'] ?? '?'})';
  String get _key => 'updates_${source}_${info['version']}_${info['build']}';

  Future<void> initialize() => _initializing ??= _initialize();
  Future<void> _initialize() async {
    WidgetsBinding.instance.addObserver(this);
    updateChannel.setMethodCallHandler((call) async {
      if (call.method == 'progress' && downloading) {
        progress = (call.arguments as num).toDouble().clamp(0, 1);
        notifyListeners();
      }
    });
    try {
      _prefs = await SharedPreferences.getInstance();
      await refreshInfo();
      automatic = _prefs!.getBool('updates_automatic_$source') ?? false;
      final saved = _prefs!.getString('${_key}_result');
      if (saved != null) {
        try {
          _apply(Map<String, dynamic>.from(jsonDecode(saved) as Map));
        } catch (_) {}
      }
    } catch (_) {
      failed = true;
    }
    initialized = true;
    notifyListeners();
    unawaited(checkIfDue());
  }

  Future<void> refreshInfo() async {
    final value = await updateChannel.invokeMapMethod<String, dynamic>('info');
    info = value ?? {};
    notifyListeners();
  }

  Future<void> setAutomatic(bool value) async {
    await initialize();
    if (!await _prefs!.setBool('updates_automatic_$source', value)) {
      throw StateError('Preference not saved');
    }
    automatic = value;
    if (!value && checking) {
      _generation++;
      _client?.close();
      checking = false;
    }
    notifyListeners();
    if (value) await checkIfDue();
  }

  Future<void> chooseSource(String value) async {
    if (info['source'] != 'unknown' ||
        !['github', 'fdroid'].contains(value) ||
        busy) {
      return;
    }
    if (!await _prefs!.setString('updates_source', value)) {
      throw StateError('Preference not saved');
    }
    automatic = _prefs!.getBool('updates_automatic_$source') ?? false;
    available = false;
    failed = false;
    checkedAt = null;
    release = null;
    playBuild = null;
    notifyListeners();
    await checkIfDue();
  }

  Future<void> checkIfDue() async {
    if (!automatic || !initialized || source == 'unknown' || busy) return;
    final last = _prefs?.getInt('${_key}_attempt') ?? 0;
    final elapsed = DateTime.now().millisecondsSinceEpoch - last;
    if (last != 0 &&
        elapsed >= 0 &&
        elapsed < const Duration(days: 1).inMilliseconds) {
      return;
    }
    await check();
  }

  Future<void> check() async {
    if (!initialized || source == 'unknown' || busy) return;
    final generation = ++_generation;
    checking = true;
    failed = false;
    notifyListeners();
    try {
      await _prefs!
          .setInt('${_key}_attempt', DateTime.now().millisecondsSinceEpoch);
      if (generation != _generation) return;
      Map<String, dynamic> result;
      if (source == 'play') {
        result = {
          'play': await updateChannel
              .invokeMapMethod<String, dynamic>('checkPlay')
              .timeout(const Duration(seconds: 25))
        };
      } else {
        final client = _clientFactory();
        _client = client;
        try {
          final request =
              http.Request('GET', Uri.parse(GithubRelease.latestApi))
                ..followRedirects = false
                ..headers.addAll({
                  'Accept': 'application/vnd.github+json',
                  'User-Agent': 'IRBlaster-Updater',
                  'X-GitHub-Api-Version': '2022-11-28'
                });
          final response =
              await client.send(request).timeout(const Duration(seconds: 20));
          if (response.statusCode != 200) {
            throw StateError('Release lookup failed');
          }
          final bytes = <int>[];
          await for (final chunk
              in response.stream.timeout(const Duration(seconds: 20))) {
            if (bytes.length + chunk.length > 512 * 1024) {
              throw const FormatException('Response too large');
            }
            bytes.addAll(chunk);
          }
          result = {'github': jsonDecode(utf8.decode(bytes))};
        } finally {
          client.close();
          if (identical(_client, client)) _client = null;
        }
      }
      if (generation != _generation) return;
      result['checkedAt'] = DateTime.now().millisecondsSinceEpoch;
      _apply(result);
      await _prefs!.setString('${_key}_result', jsonEncode(result));
    } catch (_) {
      if (generation == _generation) failed = true;
    } finally {
      if (generation == _generation) {
        checking = false;
        notifyListeners();
      }
    }
  }

  void _apply(Map<String, dynamic> result) {
    if (source == 'play') {
      final play = Map<String, dynamic>.from(result['play'] as Map);
      playBuild = play['build'] as int?;
      available = play['available'] == true;
    } else {
      final candidate = GithubRelease.parse(
          Map<String, dynamic>.from(result['github'] as Map),
          info['abi'] as String?);
      final current =
          ReleaseVersion.parse('${info['version']}+${info['build']}');
      if (current == null) {
        throw const FormatException('Unknown installed version');
      }
      release = candidate;
      available =
          ReleaseVersion.parse(candidate.version)!.compareTo(current) > 0;
    }
    checkedAt = DateTime.fromMillisecondsSinceEpoch(result['checkedAt'] as int);
  }

  Future<void> download() async {
    if (busy || source != 'github' || !available || release?.asset == null) {
      return;
    }
    downloading = true;
    progress = 0;
    failed = false;
    notifyListeners();
    try {
      await updateChannel.invokeMethod<void>('download', release!.asset);
      await refreshInfo();
    } on PlatformException catch (e) {
      if (e.code != 'CANCELLED') failed = true;
    } catch (_) {
      failed = true;
    } finally {
      downloading = false;
      notifyListeners();
    }
  }

  Future<void> action(String method) async {
    if (busy) return;
    final allowed = source == 'play'
        ? ['startPlay']
        : source == 'github'
            ? ['permission', 'install']
            : <String>[];
    if (!allowed.contains(method)) return;
    acting = true;
    failed = false;
    notifyListeners();
    try {
      await updateChannel
          .invokeMethod<void>(method)
          .timeout(const Duration(seconds: 60));
    } catch (_) {
      failed = true;
    } finally {
      acting = false;
      notifyListeners();
    }
  }

  Future<void> cancelDownload() => updateChannel.invokeMethod<void>('cancel');

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) unawaited(_resume());
  }

  Future<void> _resume() async {
    if (!initialized) return;
    try {
      await refreshInfo();
      await checkIfDue();
    } catch (_) {}
  }

  @override
  void dispose() {
    _generation++;
    _client?.close();
    WidgetsBinding.instance.removeObserver(this);
    updateChannel.setMethodCallHandler(null);
    super.dispose();
  }
}
