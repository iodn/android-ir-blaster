import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class IRButton {
  final String id;
  final int? code;
  final String? rawData;
  final int? frequency;
  final String image;
  final bool isImage;
  final String? necBitOrder;
  final String? protocol;
  final Map<String, dynamic>? protocolParams;
  final int? iconCodePoint;
  final String? iconFontFamily;
  final String? iconFontPackage;
  final int? buttonColor;

  const IRButton({
    required this.id,
    this.code,
    this.rawData,
    this.frequency,
    required this.image,
    required this.isImage,
    this.necBitOrder,
    this.protocol,
    this.protocolParams,
    this.iconCodePoint,
    this.iconFontFamily,
    this.iconFontPackage,
    this.buttonColor,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'rawData': rawData,
        'frequency': frequency,
        'image': image,
        'isImage': isImage,
        'necBitOrder': necBitOrder,
        'protocol': protocol,
        'protocolParams': protocolParams,
        'iconCodePoint': iconCodePoint,
        'iconFontFamily': iconFontFamily,
        'iconFontPackage': iconFontPackage,
        'buttonColor': buttonColor,
      };

  factory IRButton.fromJson(Map<String, dynamic> json) {
    final pp = json['protocolParams'];
    final rawId = (json['id'] as String?)?.trim();
    return IRButton(
      id: (rawId == null || rawId.isEmpty) ? const Uuid().v4() : rawId,
      code: json['code'] is int ? json['code'] as int? : int.tryParse('${json['code']}'),
      rawData: json['rawData'] as String?,
      frequency: json['frequency'] is int ? json['frequency'] as int? : int.tryParse('${json['frequency']}'),
      image: (json['image'] as String?) ?? '',
      isImage: (json['isImage'] as bool?) ?? true,
      necBitOrder: json['necBitOrder'] as String?,
      protocol: json['protocol'] as String?,
      protocolParams: (pp is Map) ? Map<String, dynamic>.from(pp) : null,
      iconCodePoint: json['iconCodePoint'] is int ? json['iconCodePoint'] as int? : int.tryParse('${json['iconCodePoint'] ?? ''}'),
      iconFontFamily: json['iconFontFamily'] as String?,
      iconFontPackage: _resolveIconFontPackage(
        json['iconFontPackage'] as String?,
        json['iconFontFamily'] as String?,
      ),
      buttonColor: json['buttonColor'] is int ? json['buttonColor'] as int? : int.tryParse('${json['buttonColor'] ?? ''}'),
    );
  }

  IRButton copyWith({
    String? id,
    int? code,
    String? rawData,
    int? frequency,
    String? image,
    bool? isImage,
    String? necBitOrder,
    String? protocol,
    Map<String, dynamic>? protocolParams,
    int? iconCodePoint,
    String? iconFontFamily,
    String? iconFontPackage,
    int? buttonColor,
  }) {
    return IRButton(
      id: id ?? this.id,
      code: code ?? this.code,
      rawData: rawData ?? this.rawData,
      frequency: frequency ?? this.frequency,
      image: image ?? this.image,
      isImage: isImage ?? this.isImage,
      necBitOrder: necBitOrder ?? this.necBitOrder,
      protocol: protocol ?? this.protocol,
      protocolParams: protocolParams ?? this.protocolParams,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      iconFontFamily: iconFontFamily ?? this.iconFontFamily,
      iconFontPackage: iconFontPackage ?? this.iconFontPackage,
      buttonColor: buttonColor ?? this.buttonColor,
    );
  }
}

String? _resolveIconFontPackage(String? explicitPackage, String? fontFamily) {
  final pkg = explicitPackage?.trim();
  if (pkg != null && pkg.isNotEmpty) return pkg;

  final family = fontFamily?.trim();
  if (family == null || family.isEmpty) return null;
  if (family.toLowerCase().contains('fontawesome')) {
    return 'font_awesome_flutter';
  }
  return null;
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
      id: json['id'] is int ? json['id'] as int : int.tryParse('${json['id']}'),
      buttons: (json['buttons'] as List<dynamic>? ?? const [])
          .whereType<Map>()
          .map((data) => IRButton.fromJson(data.cast<String, dynamic>()))
          .toList(),
      name: (json['name'] as String?) ?? '',
      useNewStyle: (json['useNewStyle'] as bool?) ?? false,
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
    flush: true,
  );
}

Future<List<Remote>> readRemotes() async {
  try {
    final file = await _remotesFile;
    if (!await file.exists()) return <Remote>[];
    final contents = await file.readAsString();
    final decoded = jsonDecode(contents);
    if (decoded is! List) return <Remote>[];

    var mutated = false;
    final uuid = const Uuid();

    final List<Map<String, dynamic>> normalized = [];
    for (final item in decoded) {
      if (item is! Map) continue;
      final map = item.cast<String, dynamic>();
      final buttons = map['buttons'];
      if (buttons is List) {
        for (final b in buttons) {
          if (b is Map) {
            final bm = b.cast<String, dynamic>();
            final rawId = (bm['id'] as String?)?.trim();
            if (rawId == null || rawId.isEmpty) {
              bm['id'] = uuid.v4();
              mutated = true;
            }
            final ff = (bm['iconFontFamily'] as String?)?.trim();
            final fp = (bm['iconFontPackage'] as String?)?.trim();
            if ((fp == null || fp.isEmpty) &&
                ff != null &&
                ff.toLowerCase().contains('fontawesome')) {
              bm['iconFontPackage'] = 'font_awesome_flutter';
              mutated = true;
            }
          }
        }
      }
      normalized.add(map);
    }

    final remotes = normalized.map((m) => Remote.fromJson(m)).toList();

    if (remotes.isNotEmpty) {
      final int maxId = remotes.fold<int>(
        0,
        (prev, remote) => remote.id > prev ? remote.id : prev,
      );
      Remote._nextId = maxId + 1;
    }

    if (mutated) {
      await writeRemotelist(remotes);
    }

    return remotes;
  } catch (_) {
    return <Remote>[];
  }
}

String formatButtonDisplayName(String raw) {
  var s = raw.trim();
  if (s.isEmpty) return s;

  final slash = s.lastIndexOf('/');
  if (slash >= 0 && slash < s.length - 1) {
    s = s.substring(slash + 1);
  }

  final lower = s.toLowerCase();
  const exts = <String>['.png', '.jpg', '.jpeg'];
  for (final ext in exts) {
    if (lower.endsWith(ext)) {
      s = s.substring(0, s.length - ext.length);
      break;
    }
  }

  if (s.startsWith('assets/')) {
    s = s.substring('assets/'.length);
  }

  return s;
}

String normalizeButtonKey(String raw) {
  return formatButtonDisplayName(raw).trim().toLowerCase();
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

List<Remote> writeDefaultRemotes() {
  final uuid = const Uuid();

  final List<IRButton> demoButtons = [
    IRButton(
      id: uuid.v4(),
      code: 0x00F700FF,
      rawData: kDefaultNecConfig,
      frequency: kDefaultCarrierHz,
      image: "assets/UP.png",
      isImage: true,
    ),
    IRButton(
      id: uuid.v4(),
      code: 0x00F7807F,
      rawData: kDefaultNecConfig,
      frequency: kDefaultCarrierHz,
      image: "assets/DOWN.png",
      isImage: true,
    ),
    IRButton(
      id: uuid.v4(),
      code: 0x00F740BF,
      rawData: kDefaultNecConfig,
      frequency: kDefaultCarrierHz,
      image: "assets/OFF.png",
      isImage: true,
    ),
    IRButton(
      id: uuid.v4(),
      code: 0x00F7C03F,
      rawData: kDefaultNecConfig,
      frequency: kDefaultCarrierHz,
      image: "assets/ON.png",
      isImage: true,
    ),
    IRButton(
      id: uuid.v4(),
      code: 0x00F720DF,
      rawData: kDefaultNecConfig,
      frequency: kDefaultCarrierHz,
      image: "assets/RED.png",
      isImage: true,
    ),
    IRButton(
      id: uuid.v4(),
      code: 0x00F7A05F,
      rawData: kDefaultNecConfig,
      frequency: kDefaultCarrierHz,
      image: "assets/GREEN.png",
      isImage: true,
    ),
    IRButton(
      id: uuid.v4(),
      code: 0x00F7609F,
      rawData: kDefaultNecConfig,
      frequency: kDefaultCarrierHz,
      image: "assets/BLUE.png",
      isImage: true,
    ),
    IRButton(
      id: uuid.v4(),
      code: 0x00F7E01F,
      rawData: kDefaultNecConfig,
      frequency: kDefaultCarrierHz,
      image: "assets/WARM.png",
      isImage: true,
    ),
  ];

  final Remote demo = Remote(
    buttons: demoButtons,
    name: "Demo Remote",
    useNewStyle: true,
  );

  final List<Remote> defaults = [demo];
  writeRemotelist(defaults);
  return defaults;
}

Future<String?> getImage() async {
  final picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image == null) return null;

  final dir = await _localPath;
  final filePath = '$dir/${image.name}';
  await image.saveTo(filePath);
  return filePath;
}
