import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:irblaster_controller/widgets/code_test.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/ir.dart';

class CreateButton extends StatefulWidget {
  final IRButton? button;

  const CreateButton({super.key, this.button});

  @override
  State<CreateButton> createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> {
  // Hex inputs
  final TextEditingController codeController = TextEditingController(); // for hex
  final TextEditingController hexFreqController =
      TextEditingController(); // for hex frequency (optional/custom)

  // Raw inputs
  final TextEditingController rawDataController =
      TextEditingController(); // for raw pattern
  final TextEditingController freqController =
      TextEditingController(); // for raw frequency

  // Label inputs
  final TextEditingController nameController =
      TextEditingController(); // for button text

  // Advanced NEC timing controllers
  final TextEditingController headerMarkCtrl =
      TextEditingController(text: NECParams.defaults.headerMark.toString());
  final TextEditingController headerSpaceCtrl =
      TextEditingController(text: NECParams.defaults.headerSpace.toString());
  final TextEditingController bitMarkCtrl =
      TextEditingController(text: NECParams.defaults.bitMark.toString());
  final TextEditingController zeroSpaceCtrl =
      TextEditingController(text: NECParams.defaults.zeroSpace.toString());
  final TextEditingController oneSpaceCtrl =
      TextEditingController(text: NECParams.defaults.oneSpace.toString());
  final TextEditingController trailerMarkCtrl =
      TextEditingController(text: NECParams.defaults.trailerMark.toString());

  Widget? image;
  String? imagePath;

  // True => hex code, false => raw signal
  bool isHex = true;

  // When true, use custom NEC timings for hex code (stored in rawData as "NEC:..." and use hexFreqController).
  bool useCustomNec = false;

  // Bit order toggle for custom NEC synthesis: false = MSB (compat), true = LSB (literal).
  bool necBitOrderIsLsb = false;

  @override
  void initState() {
    super.initState();

    // If editing an existing button, fill fields accordingly
    if (widget.button != null) {
      final b = widget.button!;
      final hasRaw = b.rawData != null && b.rawData!.isNotEmpty;

      // Detect custom NEC config stored in rawData starting with "NEC:"
      if (hasRaw && isNecConfigString(b.rawData)) {
        isHex = true;
        useCustomNec = true;

        // Hex code
        if (b.code != null) {
          codeController.text = b.code!.toRadixString(16);
        }

        // Frequency for hex
        if (b.frequency != null && b.frequency! > 0) {
          hexFreqController.text = b.frequency!.toString();
        } else {
          hexFreqController.text = kDefaultNecFrequencyHz.toString();
        }

        // Parse NEC params
        final params = parseNecParamsFromString(b.rawData!);
        headerMarkCtrl.text = params.headerMark.toString();
        headerSpaceCtrl.text = params.headerSpace.toString();
        bitMarkCtrl.text = params.bitMark.toString();
        zeroSpaceCtrl.text = params.zeroSpace.toString();
        oneSpaceCtrl.text = params.oneSpace.toString();
        trailerMarkCtrl.text = params.trailerMark.toString();

        // Bit order (optional)
        necBitOrderIsLsb = (b.necBitOrder ?? 'msb').toLowerCase() == 'lsb';
      } else if (hasRaw) {
        // Regular raw pattern
        isHex = false;
        rawDataController.text = b.rawData!;
        freqController.text = (b.frequency ?? 38000).toString();
      } else if (b.code != null) {
        // Plain hex
        isHex = true;
        useCustomNec = false;
        codeController.text = b.code!.toRadixString(16);
        hexFreqController.text = kDefaultNecFrequencyHz.toString();
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
    } else {
      // Defaults
      hexFreqController.text = kDefaultNecFrequencyHz.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Save button
      floatingActionButton: FloatingActionButton(
        onPressed: _onSavePressed,
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
                                                            defaultImages[index],
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

            // 2) Radio row: pick Hex code vs. Raw signal
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
                const Text("Raw signal"),
              ],
            ),

            // 3) Conditionally show fields
            const Divider(),
            if (isHex)
              Expanded(
                child: ListView(
                  children: [
                    _buildHexCodeField(),
                    _buildNecAdvanced(),
                  ],
                ),
              )
            else
              _buildRawFields(),
          ],
        ),
      ),
    );
  }

  void _onSavePressed() {
    // Validate fields
    if (isHex) {
      if (codeController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Hex code cannot be empty")),
        );
        return;
      }
      if (useCustomNec) {
        // Optional: validate timings numeric
        final allNumeric = [
          headerMarkCtrl.text,
          headerSpaceCtrl.text,
          bitMarkCtrl.text,
          zeroSpaceCtrl.text,
          oneSpaceCtrl.text,
          trailerMarkCtrl.text,
        ].every((t) => int.tryParse(t) != null);
        if (!allNumeric) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("All NEC timings must be numeric")),
          );
          return;
        }
        if (hexFreqController.text.isNotEmpty &&
            int.tryParse(hexFreqController.text) == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Frequency must be numeric")),
          );
          return;
        }
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

      // If using custom NEC timings, encode NEC params in rawData as "NEC:..." and use hex frequency.
      String? rawDataForNec;
      int? freqForNec;
      String? bitOrder;

      if (useCustomNec) {
        final hMark = int.tryParse(headerMarkCtrl.text) ??
            NECParams.defaults.headerMark;
        final hSpace = int.tryParse(headerSpaceCtrl.text) ??
            NECParams.defaults.headerSpace;
        final bMark =
            int.tryParse(bitMarkCtrl.text) ?? NECParams.defaults.bitMark;
        final zSpace =
            int.tryParse(zeroSpaceCtrl.text) ?? NECParams.defaults.zeroSpace;
        final oSpace =
            int.tryParse(oneSpaceCtrl.text) ?? NECParams.defaults.oneSpace;
        final tMark = int.tryParse(trailerMarkCtrl.text) ??
            NECParams.defaults.trailerMark;

        // Keyed format for forward-compatibility and readability.
        rawDataForNec = "NEC:h=$hMark,$hSpace;b=$bMark,$zSpace,$oSpace;t=$tMark";
        freqForNec = int.tryParse(hexFreqController.text);
        freqForNec ??= kDefaultNecFrequencyHz;

        bitOrder = necBitOrderIsLsb ? 'lsb' : 'msb';
      }

      button = IRButton(
        code: parsedHex,
        rawData: rawDataForNec,
        frequency: rawDataForNec != null ? freqForNec : null,
        image: imagePath ?? nameController.text,
        isImage: imagePath != null,
        necBitOrder: bitOrder,
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

  // Advanced NEC timing options for hex mode
  Widget _buildNecAdvanced() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text("Use custom NEC timings"),
              value: useCustomNec,
              onChanged: (v) => setState(() => useCustomNec = v),
            ),
            if (useCustomNec) ...[
              const SizedBox(height: 8),

              // Bit order switch for custom NEC
              SwitchListTile(
                title: const Text("Send literal LSB-first"),
                subtitle: const Text(
                    "Off = MSB-first"),
                value: necBitOrderIsLsb,
                onChanged: (v) => setState(() => necBitOrderIsLsb = v),
              ),

              // Frequency for hex (raw transmit)
              TextField(
                controller: hexFreqController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
                decoration: const InputDecoration(
                  labelText: "Frequency (Hz)",
                  helperText: "Carrier frequency for NEC (e.g., 38000)",
                ),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: headerMarkCtrl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: "Header Mark (µs)",
                        hintText: "9000",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: headerSpaceCtrl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: "Header Space (µs)",
                        hintText: "4500",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: bitMarkCtrl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: "Bit Mark (µs)",
                        hintText: "560",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: zeroSpaceCtrl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: "0 Space (µs)",
                        hintText: "560",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: oneSpaceCtrl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: "1 Space (µs)",
                        hintText: "1690",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: trailerMarkCtrl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: "Trailer Mark (µs)",
                        hintText: "560",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Note: NEC sends 32 bits LSB-first on the wire. Use LSB mode if your hex code is stored in natural order or use MSB mode for LIRC-style stored codes.",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ],
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
                helperText: "Space-separated integers, e.g. 9000 4500 560 560 ...",
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
