import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/widgets/code_test.dart';
import 'package:irblaster_controller/utils/remote.dart';

class CreateButton extends StatefulWidget {
  final IRButton? button;
  const CreateButton({super.key, this.button});

  @override
  State<CreateButton> createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> {
  TextEditingController codeController = TextEditingController(); // for hex
  TextEditingController nameController =
      TextEditingController(); // for button text
  TextEditingController rawDataController =
      TextEditingController(); // for raw pattern
  TextEditingController freqController =
      TextEditingController(); // for frequency

  Widget? image;
  String? imagePath;

  // True => hex code, false => raw code
  bool isHex = true;

  @override
  void initState() {
    super.initState();

    // If editing an existing button, fill fields accordingly
    if (widget.button != null) {
      final b = widget.button!;

      // If there's a hex code, we assume isHex = true
      // If there's raw data, we assume isHex = false
      // If both exist, pick whichever you want as default
      if (b.rawData != null && b.rawData!.isNotEmpty) {
        isHex = false;
        rawDataController.text = b.rawData!;
        freqController.text = (b.frequency ?? 38000).toString();
      } else if (b.code != null) {
        isHex = true;
        codeController.text = b.code!.toRadixString(16);
      }

      // For the button label: image or text
      if (b.isImage) {
        imagePath = b.image;
        if (imagePath!.startsWith("assets")) {
          image = Image.asset(
            imagePath!,
            fit: BoxFit.contain,
          );
        } else {
          image = Image.file(
            File(imagePath!),
            fit: BoxFit.contain,
          );
        }
      } else {
        nameController.text = b.image;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Save button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Validate fields
          if (isHex) {
            if (codeController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Hex code cannot be empty")),
              );
              return;
            }
          } else {
            if (rawDataController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Raw data cannot be empty")),
              );
              return;
            }
            if (freqController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Frequency cannot be empty")),
              );
              return;
            }
          }

          // Build the IRButton
          IRButton button;
          if (isHex) {
            // Parse the hex code
            final int? parsedHex = int.tryParse(codeController.text, radix: 16);
            button = IRButton(
              code: parsedHex,
              rawData: null,
              frequency: null,
              image: imagePath ?? nameController.text,
              isImage: imagePath != null,
            );
          } else {
            // Parse raw data + freq
            final int? freq = int.tryParse(freqController.text);
            button = IRButton(
              code: null,
              rawData: rawDataController.text.trim(),
              frequency: freq ?? 38000, // default if parse fails
              image: imagePath ?? nameController.text,
              isImage: imagePath != null,
            );
          }

          Navigator.pop(context, button);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Add a button"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1) TabBar for image vs. text label
            DefaultTabController(
              length: 2,
              child: SizedBox(
                height: 220,
                child: Builder(builder: ((context) {
                  final TabController tabController =
                      DefaultTabController.of(context);
                  tabController.addListener(() {
                    if (tabController.index == 1) {
                      setState(() {
                        image = null;
                        imagePath = null;
                      });
                    }
                  });
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TabBar(tabs: [
                        Tab(
                          child: Text(
                            "Image",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Text",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      const Padding(padding: EdgeInsets.all(5)),
                      Expanded(
                        child: TabBarView(children: [
                          // ============== Image Tab ==============
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            getImage().then((value) {
                                              imagePath = value;
                                              if (value != null) {
                                                File fimg = File(value);
                                                setState(() {
                                                  image = Image.file(
                                                    fimg,
                                                    fit: BoxFit.contain,
                                                  );
                                                });
                                              }
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: const Text("From gallery"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: SizedBox(
                                                    width: 300,
                                                    child: GridView.builder(
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                      ),
                                                      itemCount:
                                                          defaultImages.length,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              1),
                                                      itemBuilder:
                                                          (context, index) {
                                                        return ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            Navigator.pop(
                                                                context);
                                                            setState(() {
                                                              image =
                                                                  Image.asset(
                                                                defaultImages[
                                                                    index],
                                                              );
                                                              imagePath =
                                                                  defaultImages[
                                                                      index];
                                                            });
                                                          },
                                                          child: Image.asset(
                                                            defaultImages[
                                                                index],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: const Text("From assets"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: image ??
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Icon(
                                    Icons.add_photo_alternate,
                                    size: 50,
                                  ),
                                ),
                          ),

                          // ============== Text Tab ==============
                          Center(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    helperText: "Name of the button",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  );
                })),
              ),
            ),

            const SizedBox(height: 10),
            // 2) Radio row: pick Hex code vs. Raw code
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: isHex,
                  onChanged: (val) {
                    setState(() {
                      isHex = true;
                    });
                  },
                ),
                const Text("Hex code"),
                const SizedBox(width: 20),
                Radio<bool>(
                  value: false,
                  groupValue: isHex,
                  onChanged: (val) {
                    setState(() {
                      isHex = false;
                    });
                  },
                ),
                const Text("Raw code"),
              ],
            ),

            // 3) Conditionally show the Hex code field OR the Raw code fields
            const Divider(),
            if (isHex) _buildHexCodeField() else _buildRawFields(),
          ],
        ),
      ),
    );
  }

  // Widget for the "hex code" text field
  Widget _buildHexCodeField() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: codeController,
          maxLength: 8,
          maxLines: 1,
          textAlign: TextAlign.center,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9a-fA-F]")),
          ],
          decoration: InputDecoration(
            labelText: "Hex code",
            helperText: "8-digit hex code",
            suffixIcon: IconButton(
              onPressed: () async {
                try {
                  String a = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CodeTest(
                        code: codeController.value.text.padLeft(8, '0'),
                      ),
                    ),
                  );
                  codeController.text = a.replaceAll(" ", "");
                } catch (e) {
                  return;
                }
              },
              icon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  // Widget for the "raw data" + "frequency" fields
  Widget _buildRawFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Raw data
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: rawDataController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: "Raw data",
                helperText:
                    "Space-separated integers, e.g. 9000 4500 560 560 ...",
              ),
            ),
          ),
        ),
        // Frequency
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: freqController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],
              decoration: const InputDecoration(
                labelText: "Frequency (Hz)",
                helperText: "e.g. 38000",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
