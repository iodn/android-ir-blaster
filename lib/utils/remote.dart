import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class IRButton {
  final int? code; // For hex codes.
  final String? rawData; // For raw IR signals (space-separated string).
  final int? frequency; // Frequency for raw signals.
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
  final List<IRButton> buttons;
  String name;
  bool useNewStyle;

  Remote({
    required this.buttons,
    required this.name,
    this.useNewStyle = false,
  });

  Map<String, dynamic> toJson() => {
        'buttons': buttons.map((b) => b.toJson()).toList(),
        'name': name,
        'useNewStyle': useNewStyle,
      };

  factory Remote.fromJson(Map<String, dynamic> json) {
    return Remote(
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
      jsonEncode(remotes.map((remote) => remote.toJson()).toList()));
}

Future<List<Remote>> readRemotes() async {
  try {
    final file = await _remotesFile;
    final contents = await file.readAsString();
    List<Remote> remotes = (jsonDecode(contents) as List)
        .map((json) => Remote.fromJson(json as Map<String, dynamic>))
        .toList();
    return remotes;
  } catch (e) {
    // If encountering an error, return an empty list.
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

List<Remote> writeDefaultRemotes() {
  Remote irblasterRemote = Remote(
    buttons: const [
      IRButton(code: 0xF700FF, image: "assets/UP.png", isImage: true),
      IRButton(code: 0xF7807F, image: "assets/DOWN.png", isImage: true),
      IRButton(code: 0xF740BF, image: "assets/OFF.png", isImage: true),
      IRButton(code: 0xF7C03F, image: "assets/ON.png", isImage: true),
      IRButton(code: 0xF720DF, image: "assets/RED.png", isImage: true),
      IRButton(code: 0xF7A05F, image: "assets/GREEN.png", isImage: true),
      IRButton(code: 0xF7609F, image: "assets/BLUE.png", isImage: true),
      IRButton(code: 0xF7E01F, image: "assets/WARM.png", isImage: true),
      IRButton(code: 0xF710EF, image: "assets/RED0.png", isImage: true),
      IRButton(code: 0xF7906F, image: "assets/GREEN0.png", isImage: true),
      IRButton(code: 0xF750AF, image: "assets/BLUE0.png", isImage: true),
      IRButton(code: 0xF7D02F, image: "assets/FLASH.png", isImage: true),
      IRButton(code: 0xF730CF, image: "assets/RED1.png", isImage: true),
      IRButton(code: 0xF7B04F, image: "assets/GREEN1.png", isImage: true),
      IRButton(code: 0xF7708F, image: "assets/BLUE1.png", isImage: true),
      IRButton(code: 0xF7F00F, image: "assets/STROBE.png", isImage: true),
      IRButton(code: 0xF708F7, image: "assets/RED2.png", isImage: true),
      IRButton(code: 0xF78877, image: "assets/GREEN2.png", isImage: true),
      IRButton(code: 0xF748B7, image: "assets/BLUE2.png", isImage: true),
      IRButton(code: 0xF7C837, image: "assets/COOL.png", isImage: true),
      IRButton(code: 0xF728D7, image: "assets/1h.png", isImage: true),
      IRButton(code: 0xF7A857, image: "assets/2h.png", isImage: true),
      IRButton(code: 0xF76897, image: "assets/4h.png", isImage: true),
      IRButton(code: 0xF7E817, image: "assets/6h.png", isImage: true),
    ],
    name: "Osram Remote",
  );

  writeRemotelist([irblasterRemote]);
  return [irblasterRemote];
}

/// Gets an image from the user using the image_picker library
Future<String?> getImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    // Save the image to the app's local directory.
    await image.saveTo(await _localPath + image.name);
    return await _localPath + image.name;
  }
  return null;
}
