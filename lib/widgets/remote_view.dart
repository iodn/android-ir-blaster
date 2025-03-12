import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/widgets/remote_list.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';

class RemoteView extends StatefulWidget {
  final Remote remote;
  const RemoteView({super.key, required this.remote});

  @override
  RemoteViewState createState() => RemoteViewState();
}

class RemoteViewState extends State<RemoteView> {
  @override
  void initState() {
    super.initState();
    // Check IR emitter availability
    hasIrEmitter().then((value) {
      if (!value) {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('No IR emitter'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('This device does not have an IR emitter'),
                    Text('This app needs an IR emitter to function'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Dismiss'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool useNewStyle = widget.remote.useNewStyle;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to your remote list screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RemoteList()),
          );
        },
        child: const Icon(Icons.list),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(widget.remote.name),
      ),
      body: SafeArea(
        child: Center(
          // Decide which layout to build based on the remote's style setting
          child: useNewStyle ? _buildNewStyleGrid() : _buildOldStyleGrid(),
        ),
      ),
    );
  }

  // ============== OLD LAYOUT (4 columns) ==============
  Widget _buildOldStyleGrid() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: widget.remote.buttons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // old style
      ),
      itemBuilder: (context, index) {
        IRButton button = widget.remote.buttons[index];
        return button.isImage
            ? GestureDetector(
                child: button.image.startsWith("assets/")
                    ? Image.asset(button.image)
                    : Image.file(File(button.image)),
                onTap: () => sendIR(button),
              )
            : TextButton(
                onPressed: () => sendIR(button),
                child: Text(button.image),
              );
      },
    );
  }

  // ============== NEW LAYOUT (2 columns, "cards") ==============
  Widget _buildNewStyleGrid() {
    return GridView.builder(
      shrinkWrap: true,
      // 2 columns, more rectangular
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.2,
      ),
      itemCount: widget.remote.buttons.length,
      itemBuilder: (context, index) {
        final IRButton button = widget.remote.buttons[index];

        // Determine if this is a raw code or a hex code
        final bool isRaw =
            (button.rawData != null && button.rawData!.isNotEmpty);

        // If raw => "RAW", else => 8-digit hex (or "NO CODE" if null)
        final String codeLabel = isRaw
            ? 'RAW'
            : (button.code != null
                ? button.code!.toRadixString(16).padLeft(8, '0').toUpperCase()
                : 'NO CODE');

        // The "title" (top line) can be the button’s image string or name
        final String topLine = button.image;

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Theme.of(context).colorScheme.primary..withValues(alpha: 0.2),
          child: InkWell(
            onTap: () => sendIR(button),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    topLine,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Subtitle
                  Text(
                    codeLabel,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
