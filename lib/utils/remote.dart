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
  final String? necBitOrder;
  final String? protocol;
  final Map<String, dynamic>? protocolParams;

  const IRButton({
    this.code,
    this.rawData,
    this.frequency,
    required this.image,
    required this.isImage,
    this.necBitOrder,
    this.protocol,
    this.protocolParams,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'rawData': rawData,
        'frequency': frequency,
        'image': image,
        'isImage': isImage,
        'necBitOrder': necBitOrder,
        'protocol': protocol,
        'protocolParams': protocolParams,
      };

  factory IRButton.fromJson(Map<String, dynamic> json) {
    final pp = json['protocolParams'];
    return IRButton(
      code: json['code'],
      rawData: json['rawData'],
      frequency: json['frequency'],
      image: json['image'],
      isImage: json['isImage'],
      necBitOrder: json['necBitOrder'],
      protocol: json['protocol'],
      protocolParams: (pp is Map) ? Map<String, dynamic>.from(pp) : null,
    );
  }
}

class Remote {
  int id;
  final List<IRButton> buttons;
  String name;
  bool useNewStyle;

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

    final List<Remote> remotes = (jsonDecode(contents) as List)
        .map((json) => Remote.fromJson(json as Map<String, dynamic>))
        .toList();

    if (remotes.isNotEmpty) {
      final int maxId = remotes.fold<int>(
        0,
        (prev, remote) => remote.id > prev ? remote.id : prev,
      );
      Remote._nextId = maxId + 1;
    }

    return remotes;
  } catch (_) {
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

const int kDefaultCarrierHz = 38000;
const String kDefaultNecConfig = "NEC:9000,4500,560,560,1690,560";

String _labelFromAsset(String assetPath) {
  // "assets/UP.png" -> "UP"
  String s = assetPath.trim();
  if (s.isEmpty) return s;
  final int slash = s.lastIndexOf('/');
  if (slash >= 0) s = s.substring(slash + 1);
  final int dot = s.lastIndexOf('.');
  if (dot > 0) s = s.substring(0, dot);
  return s;
}

List<IRButton> _makeComfortButtonsFromClassicAssets(List<IRButton> classic) {
  return classic
      .map(
        (b) => IRButton(
          code: b.code,
          rawData: b.rawData,
          frequency: b.frequency,
          // Keep the asset path so your UI can still render the image,
          // but use a human-friendly label without ".png" as the button "name".
          image: _labelFromAsset(b.image),
          isImage: b.isImage,
          necBitOrder: b.necBitOrder,
          protocol: b.protocol,
          protocolParams: b.protocolParams,
        ),
      )
      .toList(growable: false);
}

List<Remote> writeDefaultRemotes() {
  // Classic demo: keeps image paths exactly as before.
  final List<IRButton> classicDemoButtons = const [
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
  ];

  // 1) Comfort style: useNewStyle=true AND button "image" field becomes a clean label (no ".png").
  //    This matches your requirement, assuming your comfort UI treats IRButton.image as the label.
  final Remote comfortDemo = Remote(
    buttons: _makeComfortButtonsFromClassicAssets(classicDemoButtons),
    name: "Demo Remote (Comfort)",
    useNewStyle: true,
  );

  // 2) Classic compact style: unchanged, keeps asset paths in IRButton.image.
  final Remote classicDemo = Remote(
    buttons: classicDemoButtons,
    name: "Demo Remote (Classic)",
    useNewStyle: false,
  );

  final List<Remote> defaults = [comfortDemo, classicDemo];
  writeRemotelist(defaults);
  return defaults;
}

Future<String?> getImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    final dir = await _localPath;
    final filePath = '$dir/${image.name}';
    await image.saveTo(filePath);
    return filePath;
  }
  return null;
}
