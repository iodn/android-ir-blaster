import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/utils/ir.dart';

String deviceCodeString = "00 ff";
String commandString = "00 ff";
bool isBruteforcing = false;

class CodeTest extends StatefulWidget {
  final String? code;
  const CodeTest({super.key, this.code});

  @override
  CodeTestState createState() => CodeTestState();
}

void bruteforce(int n, bool send) {
  if (send) {
    transmit(int.parse((deviceCodeString + commandString).replaceAll(" ", ""),
        radix: 16));
  }

  int command = int.parse(commandString.substring(0, 2), radix: 16);
  int deviceCode = int.parse(deviceCodeString.substring(0, 2), radix: 16);
  // increase command after if it's bigger than 4 bits increase device code and set command to 0 again
  command += n;
  if (command < 0) {
    command = 0;
  }
  if (command > 0xFF) {
    deviceCode++;
    command = 0;
  }
  if (deviceCode > 0xFFFF) {
    deviceCode = 0;
    isBruteforcing = false;
  }
  
  commandString =
      "${command.toRadixString(16).padLeft(2, '0')} ${(~command).toUnsigned(8).toRadixString(16).padLeft(2, '0')}";
  deviceCodeString =
      "${deviceCode.toRadixString(16).padLeft(2, '0')} ${(~deviceCode).toUnsigned(8).toRadixString(16).padLeft(2, '0')}";
}

class CodeTestState extends State<CodeTest> {
  Timer? timer;

  @override
  void initState() {
    if (widget.code != null) {
      deviceCodeString =
          "${widget.code!.substring(0, 2)} ${widget.code!.substring(2, 4)}";
      commandString =
          "${widget.code!.substring(4, 6)} ${widget.code!.substring(6, 8)}";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  deviceCodeString,
                  style: const TextStyle(fontSize: 25),
                ),
                const Text("Device Code"),
                Text(
                  commandString,
                  style: const TextStyle(fontSize: 25),
                ),
                const Text("Command"),
                const Padding(padding: EdgeInsets.all(20)),
                GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            bruteforce(-1, false);
                          });
                        },
                        icon: const Icon(Icons.arrow_left),
                        iconSize: 35,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          setState(() {
                            bruteforce(0, true);
                          });
                        },
                        child:
                            const Text('Test', style: TextStyle(fontSize: 25)),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            bruteforce(1, true);
                          });
                        },
                        icon: const Icon(Icons.arrow_right),
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () {
                          // Show a popup so the user can edit the code in text fields
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  TextEditingController controller =
                                      TextEditingController();
                                  controller.text =
                                      (deviceCodeString + commandString)
                                          .replaceAll(" ", "");
                                  return AlertDialog(
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Cancel")),
                                        TextButton(
                                            onPressed: () {
                                              if (controller.text.length == 8) {
                                                setState(() {
                                                  deviceCodeString =
                                                      "${controller.text.substring(0, 2)} ${controller.text.substring(2, 4)}";
                                                  commandString =
                                                      "${controller.text.substring(4, 6)} ${controller.text.substring(6, 8)}";
                                                });
                                              }
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Save"))
                                      ],
                                      title:
                                          const Text("Edit Code of the button"),
                                      content: TextField(
                                        controller: controller,
                                        maxLength: 8,
                                        maxLines: 1,
                                        style: const TextStyle(fontSize: 25),
                                        textAlign: TextAlign.center,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9a-fA-F]")),
                                        ],
                                      ));
                                });
                          });
                        },
                        icon: const Icon(Icons.edit),
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (isBruteforcing) {
                              timer?.cancel();
                            } else {
                              timer = Timer.periodic(const Duration(seconds: 1),
                                  (Timer t) {
                                setState(() {
                                  bruteforce(1, true);
                                });
                              });
                            }
                            isBruteforcing = !isBruteforcing;
                          });
                        },
                        icon: Icon(
                            isBruteforcing ? Icons.pause : Icons.play_arrow),
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(
                              context, deviceCodeString + commandString);
                        },
                        icon: const Icon(Icons.check),
                        iconSize: 35,
                      ),
                    ]),
              ],
            )));
  }
}
