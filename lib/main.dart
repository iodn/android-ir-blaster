import 'dart:async';
import 'dart:ui';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/state/app_theme.dart';
import 'package:irblaster_controller/state/dynamic_color.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/state/macros_state.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/macros_io.dart';
import 'package:irblaster_controller/widgets/home_shell.dart';
import 'package:media_store_plus/media_store_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint('FlutterError: ${details.exception}\n${details.stack}');
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('Uncaught platform error: $error\n$stack');
    return true;
  };
  try {
    await AppThemeController.instance.load();
    await DynamicColorController.instance.load();
  } catch (e, st) {
    debugPrint('Failed to load theme preference: $e\n$st');
  }
  runZonedGuarded(() {
    runApp(const _App());
  }, (error, stack) {
    debugPrint('Zone error: $error\n$stack');
  });
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([AppThemeController.instance, DynamicColorController.instance]),
      builder: (context, _) {
        return DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) {
            final useDynamic = DynamicColorController.instance.enabled;
            final ColorScheme lightScheme = useDynamic
                ? (lightDynamic ?? ColorScheme.fromSeed(seedColor: Colors.blue))
                : ColorScheme.fromSeed(seedColor: Colors.blue);
            final ColorScheme darkScheme = useDynamic
                ? (darkDynamic ?? ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark))
                : ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark);
            return MaterialApp(
              title: 'IR Blaster',
              debugShowCheckedModeBanner: false,
              themeMode: AppThemeController.instance.mode,
              theme: ThemeData(useMaterial3: true, colorScheme: lightScheme, brightness: Brightness.light),
              darkTheme: ThemeData(useMaterial3: true, colorScheme: darkScheme, brightness: Brightness.dark),
              home: const _BootstrapScreen(),
            );
          },
        );
      },
    );
  }
}

class _BootstrapScreen extends StatefulWidget {
  const _BootstrapScreen();

  @override
  State<_BootstrapScreen> createState() => _BootstrapScreenState();
}

class _BootstrapScreenState extends State<_BootstrapScreen> {
  late Future<void> _future = _bootstrap();

  Future<void> _bootstrap() async {
    await MediaStore.ensureInitialized().timeout(
      const Duration(seconds: 8),
      onTimeout: () {
        throw TimeoutException('MediaStore.ensureInitialized() timed out');
      },
    );
    MediaStore.appFolder = 'IRBlaster';
    remotes = await readRemotes().timeout(
      const Duration(seconds: 8),
      onTimeout: () {
        throw TimeoutException('readRemotes() timed out');
      },
    );
    if (remotes.isEmpty) {
      remotes = writeDefaultRemotes();
    }
    notifyRemotesChanged();
    macros = await readMacros().timeout(
      const Duration(seconds: 8),
      onTimeout: () {
        throw TimeoutException('readMacros() timed out');
      },
    );
    notifyMacrosChanged();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _future,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const _Splash();
        }
        if (snap.hasError) {
          return _BootstrapError(
            error: snap.error,
            onRetry: () => setState(() => _future = _bootstrap()),
          );
        }
        return const HomeShell();
      },
    );
  }
}

class _Splash extends StatelessWidget {
  const _Splash();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(height: 14),
            Text('Loading…', style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _BootstrapError extends StatelessWidget {
  final Object? error;
  final VoidCallback onRetry;

  const _BootstrapError({
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final msg = (error == null) ? 'Unknown error' : error.toString();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline_rounded, size: 44, color: cs.error),
                const SizedBox(height: 12),
                Text(
                  'Failed to start',
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: cs.errorContainer.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: cs.outlineVariant.withValues(alpha: 0.25),
                    ),
                  ),
                  child: SelectableText(
                    msg,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Retry'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}