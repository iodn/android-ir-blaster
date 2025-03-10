import 'dart:io';

import 'package:flutter/material.dart';

import 'package:irblaster_controller/widgets/create_button.dart';
import 'package:irblaster_controller/utils/remote.dart';

class CreateRemote extends StatefulWidget {
  final Remote? remote;
  const CreateRemote({super.key, this.remote});

  @override
  State<CreateRemote> createState() => _CreateRemoteState();
}

class _CreateRemoteState extends State<CreateRemote> {
  TextEditingController textEditingController = TextEditingController();
  late Remote remote;

  // We track the style preference in a local bool:
  bool useNewStyle = false;

  @override
  void initState() {
    remote = widget.remote ?? Remote(buttons: [], name: "Untitled Remote");
    textEditingController.value = TextEditingValue(text: remote.name);

    // If editing an existing remote, reflect its current style choice
    useNewStyle = remote.useNewStyle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (remote.name.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Remote name can't be empty")));
            }
            // Save the style choice into the remote
            remote.useNewStyle = useNewStyle;

            Navigator.pop(context, remote);
          },
          child: const Icon(Icons.save)),
      appBar: AppBar(
        title: TextField(
          controller: textEditingController,
          onChanged: ((value) {
            remote.name = value;
          }),
        ),
      ),
      body: Column(
        children: [
          // 1) A row or listTile with a Switch to pick layout style
          ListTile(
            title: const Text('Use 2-column Style'),
            trailing: Switch(
              value: useNewStyle,
              onChanged: (bool value) {
                setState(() {
                  useNewStyle = value;
                });
              },
            ),
          ),
          // 2) The rest of your UI (the grid of buttons, etc.)
          Expanded(
            child: Center(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: remote.buttons.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  // ... your existing code for displaying or adding buttons ...
                  if (index < remote.buttons.length) {
                    IRButton button = remote.buttons[index];
                    return _buildButtonItem(button, index);
                  } else {
                    return _buildAddButton();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonItem(IRButton button, int index) {
    return button.isImage
        ? GestureDetector(
            child: button.image.startsWith("assets/")
                ? Image.asset(button.image)
                : Image.file(File(button.image)),
            onLongPress: () {
              setState(() {
                remote.buttons.removeAt(index);
              });
            },
            onTap: () async {
              try {
                final IRButton newButton = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateButton(button: button),
                  ),
                );
                setState(() {
                  remote.buttons[index] = newButton;
                });
              } catch (_) {}
            },
          )
        : TextButton(
            onLongPress: () {
              setState(() {
                remote.buttons.removeAt(index);
              });
            },
            onPressed: () async {
              try {
                final IRButton newButton = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateButton(button: button),
                  ),
                );
                setState(() {
                  remote.buttons[index] = newButton;
                });
              } catch (_) {}
            },
            child: Text(button.image),
          );
  }

  Widget _buildAddButton() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          try {
            IRButton button = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateButton(),
              ),
            );
            setState(() {
              remote.buttons.add(button);
            });
          } catch (_) {}
        },
      ),
    );
  }
}
