import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/main.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/create_remote.dart';
import 'package:irblaster_controller/widgets/remote_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class RemoteList extends StatefulWidget {
  const RemoteList({super.key});

  @override
  State<RemoteList> createState() => _RemoteListState();
}

class _RemoteListState extends State<RemoteList> {
  Future<void> requestStoragePermission() async {
    if (Platform.isAndroid) {
      if (await Permission.manageExternalStorage.isGranted) return;
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
    final mediaStore = MediaStore();
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'irblaster_backup_$timestamp.json';
      final jsonString = jsonEncode(remotes.map((r) => r.toJson()).toList());
      final tempDir = await getTemporaryDirectory();
      final tempPath = '${tempDir.path}/$fileName';
      final tempFile = File(tempPath);
      await tempFile.writeAsString(jsonString);
      await mediaStore.saveFile(
        tempFilePath: tempPath,
        dirType: DirType.download,
        dirName: DirName.download,
      );
      final publicPath = '/storage/emulated/0/Download' +
          '/${MediaStore.appFolder}' +
          '/$fileName';
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Backup saved in: $publicPath')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save backup: $e')),
      );
    }
  }

  Future<void> importRemotes() async {
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
      // Reassign ids after adding the new remote.
      for (int i = 0; i < remotes.length; i++) {
        remotes[i].id = i + 1;
      }
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
    return "${lircCmd.toRadixString(16).padLeft(2, '0')}"
            "${lircCmdInv.toRadixString(16).padLeft(2, '0')}"
            "${lircAddr.toRadixString(16).padLeft(2, '0')}"
            "${lircAddrInv.toRadixString(16).padLeft(2, '0')}"
        .toUpperCase();
  }

  int bitReverse(int x) {
    return int.parse(
        x.toRadixString(2).padLeft(8, '0').split('').reversed.join(),
        radix: 2);
  }

  @override
  Widget build(BuildContext context) {
    final cardColor =
        Theme.of(context).colorScheme.primary.withValues(alpha: 0.2);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remotes"),
        actions: [
          IconButton(
            tooltip: 'Search Remotes',
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: RemoteSearchDelegate(remotes),
              );
            },
          ),
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
              const SnackBar(content: Text("Remotes have been saved")),
            );
          });
        },
        child: const Icon(Icons.save),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Use a ReorderableGridView to show remotes in two columns.
            Expanded(
              child: ReorderableGridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 1,
                ),
                itemCount: remotes.length,
                itemBuilder: (context, index) {
                  final remote = remotes[index];
                  return Card(
                    key: ObjectKey(remote),
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
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Make the top area expandable and clickable
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text(
                                remote.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                          // Keep the buttons at the bottom
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surface
                                  .withValues(alpha: 0.1),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: OverflowBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () async {
                                    try {
                                      Remote editedRemote =
                                          await Navigator.push(
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
                                      // Reassign ids after removal.
                                      for (int i = 0; i < remotes.length; i++) {
                                        remotes[i].id = i + 1;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) newIndex--;
                    final Remote movedRemote = remotes.removeAt(oldIndex);
                    remotes.insert(newIndex, movedRemote);
                    // Reassign ids based on the new order.
                    for (int i = 0; i < remotes.length; i++) {
                      remotes[i].id = i + 1;
                    }
                  });
                },
              ),
            ),
            // "Add a remote" button below the grid.
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
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
                      // Reassign ids after adding a new remote.
                      for (int i = 0; i < remotes.length; i++) {
                        remotes[i].id = i + 1;
                      }
                    });
                    writeRemotelist(remotes);
                  } catch (e) {
                    return;
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text("Add a remote"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RemoteSearchDelegate extends SearchDelegate {
  final List<Remote> remotes;

  RemoteSearchDelegate(this.remotes);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear),
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = remotes
        .where(
            (remote) => remote.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        final remote = results[index];
        return Card(
          key: ObjectKey(remote),
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(
              remote.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    try {
                      Remote editedRemote = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateRemote(remote: remote),
                        ),
                      );
                      int originalIndex = remotes.indexOf(remote);
                      remotes[originalIndex] = editedRemote;
                      showSuggestions(context);
                    } catch (e) {
                      // Handle error if needed.
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    remotes.remove(remote);
                    showSuggestions(context);
                  },
                ),
              ],
            ),
            onTap: () {
              close(context, null);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RemoteView(remote: remote),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = remotes
        .where(
            (remote) => remote.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        final remote = suggestions[index];
        return Card(
          key: ObjectKey(remote),
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(
              remote.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              query = remote.name;
              showResults(context);
            },
          ),
        );
      },
    );
  }
}
