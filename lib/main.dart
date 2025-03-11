import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/remote_list.dart';

List<Remote> remotes = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  remotes = await readRemotes();

  if (remotes.isEmpty) {
    remotes = writeDefaultRemotes();
  }

  runApp(DynamicColorBuilder(
    builder: (lightDynamic, darkDynamic) {
      final ColorScheme lightScheme =
          lightDynamic ?? ColorScheme.fromSeed(seedColor: Colors.blue);
      final ColorScheme darkScheme = darkDynamic ??
          ColorScheme.fromSeed(
              seedColor: Colors.blue, brightness: Brightness.dark);
      return MaterialApp(
        title: "IR Blaster",
        theme: ThemeData(colorScheme: lightScheme, useMaterial3: true),
        darkTheme: ThemeData(colorScheme: darkScheme, useMaterial3: true),
        home: const RemoteList(),
      );
    },
  ));
}
