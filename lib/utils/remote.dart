import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class IRButton {
  final int? code;
  final String? rawData;
  final int? frequency;
  final String image;
  final bool isImage;

  const IRButton({
    this.code,
    this.rawData,
    this.frequency,
    required this.image,
    required this.isImage,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'rawData': rawData,
        'frequency': frequency,
        'image': image,
        'isImage': isImage,
      };

  factory IRButton.fromJson(Map<String, dynamic> json) {
    return IRButton(
      code: json['code'],
      rawData: json['rawData'],
      frequency: json['frequency'],
      image: json['image'],
      isImage: json['isImage'],
    );
  }
}

class Remote {
  int id;
  final List<IRButton> buttons;
  String name;
  bool useNewStyle;

  // Static counter to auto-generate incremental IDs.
  static int _nextId = 1;

  Remote({
    int? id,
    required this.buttons,
    required this.name,
    this.useNewStyle = false,
  }) : id = id ?? _nextId++;

  Map<String, dynamic> toJson() => {
        'id': id,
        'buttons': buttons.map((b) => b.toJson()).toList(),
        'name': name,
        'useNewStyle': useNewStyle,
      };

  factory Remote.fromJson(Map<String, dynamic> json) {
    // If the JSON doesn't include an id, let the constructor assign one.
    return Remote(
      id: json['id'] != null ? json['id'] as int : null,
      buttons: (json['buttons'] as List)
          .map((data) => IRButton.fromJson(data as Map<String, dynamic>))
          .toList(),
      name: json['name'],
      useNewStyle: json['useNewStyle'] ?? false,
    );
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _remotesFile async {
  final path = await _localPath;
  return File('$path/remotes.json');
}

Future<File> writeRemotelist(List<Remote> remotes) async {
  final file = await _remotesFile;
  return file.writeAsString(
    jsonEncode(remotes.map((remote) => remote.toJson()).toList()),
  );
}

Future<List<Remote>> readRemotes() async {
  try {
    final file = await _remotesFile;
    final contents = await file.readAsString();
    List<Remote> remotes = (jsonDecode(contents) as List)
        .map((json) => Remote.fromJson(json as Map<String, dynamic>))
        .toList();

    // Update _nextId to be one greater than the maximum loaded remote id.
    if (remotes.isNotEmpty) {
      int maxId =
          remotes.fold(0, (prev, remote) => remote.id > prev ? remote.id : prev);
      Remote._nextId = maxId + 1;
    }
    return remotes;
  } catch (e) {
    // If encountering an error (e.g. file not found), return an empty list.
    return <Remote>[];
  }
}

List<String> defaultImages = [
  "assets/ON.png",
  "assets/OFF.png",
  "assets/UP.png",
  "assets/DOWN.png",
  "assets/STROBE.png",
  "assets/FLASH.png",
  "assets/SMOOTH.png",
  "assets/COOL.png",
  "assets/BLUE.png",
  "assets/BLUE0.png",
  "assets/BLUE1.png",
  "assets/BLUE2.png",
  "assets/BLUE3.png",
  "assets/RED.png",
  "assets/RED0.png",
  "assets/RED1.png",
  "assets/RED2.png",
  "assets/RED3.png",
  "assets/GREEN.png",
  "assets/GREEN0.png",
  "assets/GREEN1.png",
  "assets/GREEN2.png",
  "assets/GREEN3.png",
  "assets/WARM.png",
  "assets/1h.png",
  "assets/2h.png",
  "assets/4h.png",
  "assets/6h.png",
];

// Default NEC config for synthesized patterns and a standard 38 kHz carrier.
const int kDefaultCarrierHz = 38000;
const String kDefaultNecConfig = "NEC:9000,4500,560,560,1690,560";

List<Remote> writeDefaultRemotes() {
  Remote irblasterRemote = Remote(
    buttons: const [
      IRButton(
        code: 0x00F700FF,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/UP.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7807F,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/DOWN.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F740BF,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/OFF.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7C03F,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/ON.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F720DF,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/RED.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7A05F,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/GREEN.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7609F,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/BLUE.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7E01F,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/WARM.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F710EF,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/RED0.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7906F,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/GREEN0.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F750AF,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/BLUE0.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7D02F,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/FLASH.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F730CF,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/RED1.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7B04F,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/GREEN1.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7708F,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/BLUE1.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7F00F,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/STROBE.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F708F7,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/RED2.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F78877,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/GREEN2.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F748B7,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/BLUE2.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7C837,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/COOL.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F728D7,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/1h.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7A857,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/2h.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F76897,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/4h.png",
        isImage: true,
      ),
      IRButton(
        code: 0x00F7E817,
        rawData: kDefaultNecConfig,
        frequency: kDefaultCarrierHz,
        image: "assets/6h.png",
        isImage: true,
      ),
    ],
    name: "Osram Remote",
  );

  writeRemotelist([irblasterRemote]);
  return [irblasterRemote];
}

/// Gets an image from the user using the image_picker library.
Future<String?> getImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    // Save the image to the app's local directory.
    final dir = await _localPath;
    final filePath = '$dir/${image.name}';
    await image.saveTo(filePath);
    return filePath;
  }
  return null;
}
