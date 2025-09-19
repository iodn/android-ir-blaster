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

  // Handle button press with haptic feedback
  void _handleButtonPress(IRButton button) async {
    HapticFeedback.lightImpact();
    try {
      await sendIR(button);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send IR: $e')),
      );
    }
  }

  // Helper to know if it's a plain NEC hex (no rawData) -> defaults apply (MSB @ 38 kHz)
  bool _isPlainNecHex(IRButton b) {
    final hasRaw = b.rawData != null && b.rawData!.trim().isNotEmpty;
    return b.code != null && !hasRaw;
  }

  // Small rounded label used as a "chip" without extra dependencies.
  Widget _pill(
    BuildContext context,
    String text, {
    Color? bg,
    Color? fg,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color background =
        bg ?? colorScheme.secondaryContainer.withValues(alpha: 0.9);
    final Color foreground = fg ?? colorScheme.onSecondaryContainer;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
          color: foreground,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  String? _necMode(IRButton b) {
    final hasRaw = (b.rawData != null && b.rawData!.isNotEmpty);
    final isNecCustom = hasRaw && isNecConfigString(b.rawData);
    if (isNecCustom) {
      return (b.necBitOrder ?? 'msb').toUpperCase() == 'LSB' ? 'LSB' : 'MSB';
    }
    if (_isPlainNecHex(b)) {
      // Plain hex NEC defaults to MSB compatibility mode
      return 'MSB';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bool useNewStyle = widget.remote.useNewStyle;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Haptic feedback for FAB
          HapticFeedback.selectionClick();

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
        final String? mode = _necMode(button);

        final content = button.isImage
            ? (button.image.startsWith("assets/")
                ? Image.asset(button.image)
                : Image.file(File(button.image)))
            : Center(
                child: Text(
                  button.image,
                  textAlign: TextAlign.center,
                ),
              );

        // Overlay a small corner badge ("LSB"/"MSB") for quick scanning.
        return GestureDetector(
          onTap: () => _handleButtonPress(button),
          child: Stack(
            children: [
              Positioned.fill(child: content),
              if (mode != null)
                Positioned(
                  top: 4,
                  right: 4,
                  child: Tooltip(
                    message: 'Bit order: $mode',
                    child: _pill(
                      context,
                      mode,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                    ),
                  ),
                ),
            ],
          ),
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

        // Determine label for code line (monospace for hex if present).
        final bool hasRaw =
            (button.rawData != null && button.rawData!.isNotEmpty);
        final bool isNecCustom = hasRaw && isNecConfigString(button.rawData);
        final bool isPlainNec = _isPlainNecHex(button);

        final String codeText = hasRaw
            ? (isNecCustom
                ? (button.code != null
                    ? button.code!.toRadixString(16).padLeft(8, '0').toUpperCase()
                    : 'NEC')
                : 'RAW CODE')
            : (button.code != null
                ? button.code!.toRadixString(16).padLeft(8, '0').toUpperCase()
                : 'NO CODE');

        // Build small chips row: NEC + LSB/MSB + frequency
        final List<Widget> chips = [];
        if (isNecCustom) {
          chips.add(_pill(context, 'NEC'));
          final String mode = (button.necBitOrder ?? 'msb').toUpperCase();
          chips.add(_pill(context, mode));
          if (button.frequency != null && button.frequency! > 0) {
            final int khz = (button.frequency! / 1000).round();
            chips.add(_pill(context, '${khz}kHz'));
          }
        } else if (isPlainNec) {
          // Default behavior for plain hex NEC: MSB at 38 kHz
          chips.add(_pill(context, 'NEC'));
          chips.add(_pill(context, 'MSB'));
          final int khz = (kDefaultNecFrequencyHz / 1000).round();
          chips.add(_pill(context, '${khz}kHz'));
        } else if (hasRaw) {
          chips.add(_pill(context, 'RAW'));
          if (button.frequency != null && button.frequency! > 0) {
            final int khz = (button.frequency! / 1000).round();
            chips.add(_pill(context, '${khz}kHz'));
          }
        }

        // The "title" (top line) can be the button's image string or name
        final String topLine = button.image;

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          child: InkWell(
            onTap: () => _handleButtonPress(button),
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

                  // Code line (hex or RAW/NO CODE)
                  Text(
                    codeText,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'monospace',
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.8),
                    ),
                  ),

                  // Chips row for mode/frequency (if applicable)
                  if (chips.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 6,
                      runSpacing: 4,
                      children: chips,
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
