import 'dart:convert';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/widgets/create_remote.dart';
import 'package:irblaster_controller/main.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:path_provider/path_provider.dart';

class RemoteList extends StatefulWidget {
  const RemoteList({super.key});

  @override
  State<RemoteList> createState() => _RemoteListState();
}

class _RemoteListState extends State<RemoteList> {
  Future<void> requestStoragePermission() async {
    if (Platform.isAndroid) {
      // First, check if the permission is already granted
      if (await Permission.manageExternalStorage.isGranted) {
        return;
      }

      // Request storage permission
      PermissionStatus status =
          await Permission.manageExternalStorage.request();

      if (!status.isGranted) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Storage permission denied')),
        );
      }
    }
  }

  Future<void> backupRemotes() async {
    await requestStoragePermission(); // Ensure permission request

    if (Platform.isAndroid) {
      if (!await Permission.manageExternalStorage.isGranted) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Storage permission denied')),
        );
        return;
      }

      Directory? downloadsDir = Directory('/storage/emulated/0/Download');
      if (!downloadsDir.existsSync()) {
        downloadsDir = await getExternalStorageDirectory();
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      String path = '${downloadsDir!.path}/remotes_backup_$timestamp.json';

      // Save the file
      final File backupFile = File(path);
      final String jsonString =
          jsonEncode(remotes.map((r) => r.toJson()).toList());
      await backupFile.writeAsString(jsonString);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Backup saved in: $path')),
      );
    }
  }

  Future<void> importRemotes() async {
    // Use FileType.any to allow any file to be picked.
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      final filePath = result.files.single.path;
      if (filePath != null) {
        final file = File(filePath);
        final contents = await file.readAsString();

        if (filePath.toLowerCase().endsWith('.json')) {
          try {
            List<dynamic> jsonData = jsonDecode(contents);
            List<Remote> imported = jsonData
                .map((data) => Remote.fromJson(data as Map<String, dynamic>))
                .toList();
            setState(() {
              remotes = imported; // or remotes.addAll(imported);
            });
          } catch (e) {
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Import failed: Invalid JSON file')),
            );
            return;
          }
        } else if (filePath.toLowerCase().endsWith('.ir')) {
          parseIRFile(contents);
          setState(() {});
        } else {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Unsupported file type selected')),
          );
          return;
        }

        await writeRemotelist(remotes);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Import successful')),
        );
      }
    }
  }

  void parseIRFile(String content) {
    List<String> blocks = content.split('#');
    List<IRButton> buttons = [];
    String remoteName = "Flipper IR Remote";

    for (String block in blocks) {
      block = block.trim();
      if (block.isEmpty) continue;

      if (block.contains("type: parsed")) {
        final nameMatch = RegExp(r'name:\s*(.+)').firstMatch(block);
        final addressMatch =
            RegExp(r'address:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})')
                .firstMatch(block);
        final commandMatch =
            RegExp(r'command:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})')
                .firstMatch(block);

        if (nameMatch != null && addressMatch != null && commandMatch != null) {
          String name = nameMatch.group(1)!.trim();
          String hexCode = convertToLIRCHex(addressMatch, commandMatch);
          buttons.add(IRButton(
              code: int.parse(hexCode, radix: 16),
              rawData: null,
              frequency: null,
              image: name,
              isImage: false));
        }
      } else if (block.contains("type: raw")) {
        final nameMatch = RegExp(r'name:\s*(.+)').firstMatch(block);
        final frequencyMatch = RegExp(r'frequency:\s*(\d+)').firstMatch(block);
        final dataMatch = RegExp(r'data:\s*([\d\s]+)').firstMatch(block);

        if (nameMatch != null && frequencyMatch != null && dataMatch != null) {
          String name = nameMatch.group(1)!.trim();
          int frequency = int.parse(frequencyMatch.group(1)!);
          String rawData = dataMatch.group(1)!.trim();

          buttons.add(IRButton(
              code: null,
              rawData: rawData,
              frequency: frequency,
              image: name,
              isImage: false));
        }
      }
    }

    if (buttons.isNotEmpty) {
      Remote newRemote =
          Remote(name: remoteName, useNewStyle: true, buttons: buttons);
      remotes.add(newRemote);
    }
  }

  String convertToLIRCHex(RegExpMatch addressMatch, RegExpMatch commandMatch) {
    int addrByte1 = int.parse(addressMatch.group(1)!, radix: 16);
    int addrByte2 = int.parse(addressMatch.group(2)!, radix: 16);
    int cmdByte1 = int.parse(commandMatch.group(1)!, radix: 16);
    int cmdByte2 = int.parse(commandMatch.group(2)!, radix: 16);

    int lircCmd = bitReverse(addrByte1);
    int lircCmdInv =
        (addrByte2 == 0) ? (0xFF - lircCmd) : bitReverse(addrByte2);
    int lircAddr = bitReverse(cmdByte1);
    int lircAddrInv =
        (cmdByte2 == 0) ? (0xFF - lircAddr) : bitReverse(cmdByte2);

    return "${lircCmd.toRadixString(16).padLeft(2, '0')}${lircCmdInv.toRadixString(16).padLeft(2, '0')}${lircAddr.toRadixString(16).padLeft(2, '0')}${lircAddrInv.toRadixString(16).padLeft(2, '0')}"
        .toUpperCase();
  }

  int bitReverse(int x) {
    return int.parse(
        x.toRadixString(2).padLeft(8, '0').split('').reversed.join(),
        radix: 2);
  }

  @override
  Widget build(BuildContext context) {
    // Use the theme color for cards.
    final cardColor = Theme.of(context).colorScheme.primary.withOpacity(0.2);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Remotes"),
        actions: [
          IconButton(
            tooltip: 'Import Remotes',
            icon: const Icon(Icons.file_upload),
            onPressed: () => importRemotes(),
          ),
          IconButton(
            tooltip: 'Backup Remotes',
            icon: const Icon(Icons.file_download),
            onPressed: () => backupRemotes(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          writeRemotelist(remotes).then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Remotes have been saved")));
          });
        },
        child: const Icon(Icons.save),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: remotes.length + 1, // Extra tile for "Add a remote"
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (index < remotes.length) {
              final Remote remote = remotes[index];
              return Card(
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RemoteView(remote: remote),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          remote.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      OverflowBar(
                        alignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              try {
                                Remote editedRemote = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CreateRemote(remote: remote),
                                  ),
                                );
                                setState(() {
                                  remotes[index] = editedRemote;
                                });
                              } catch (e) {
                                // Handle error if needed.
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                remotes.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              // "Add a remote" tile
              return Card(
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () async {
                    try {
                      Remote newRemote = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateRemote(),
                        ),
                      );
                      setState(() {
                        remotes.add(newRemote);
                      });
                      writeRemotelist(remotes);
                    } catch (e) {
                      return;
                    }
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: 40),
                      SizedBox(height: 10),
                      Text(
                        "Add a remote",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
