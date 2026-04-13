import 'package:irblaster_controller/utils/remote.dart';

enum RemoteLayoutStyle { compact, wide }

class RemoteEditorDraft {
  RemoteEditorDraft({
    this.remoteId,
    required this.name,
    required this.layoutStyle,
    required List<IRButton> buttons,
  })  : buttons = List<IRButton>.from(buttons),
        _initialName = name,
        _initialLayoutStyle = layoutStyle,
        _initialButtons = List<IRButton>.from(buttons);

  factory RemoteEditorDraft.create({
    required String defaultName,
    RemoteLayoutStyle layoutStyle = RemoteLayoutStyle.compact,
  }) {
    return RemoteEditorDraft(
      name: defaultName,
      layoutStyle: layoutStyle,
      buttons: const <IRButton>[],
    );
  }

  factory RemoteEditorDraft.fromRemote(Remote remote) {
    return RemoteEditorDraft(
      remoteId: remote.id,
      name: remote.name,
      layoutStyle: remote.useNewStyle
          ? RemoteLayoutStyle.wide
          : RemoteLayoutStyle.compact,
      buttons: remote.buttons,
    );
  }

  final int? remoteId;
  final String _initialName;
  final RemoteLayoutStyle _initialLayoutStyle;
  final List<IRButton> _initialButtons;

  String name;
  RemoteLayoutStyle layoutStyle;
  final List<IRButton> buttons;

  bool get useNewStyle => layoutStyle == RemoteLayoutStyle.wide;
  int get buttonCount => buttons.length;

  bool get isDirty {
    if (name != _initialName) return true;
    if (layoutStyle != _initialLayoutStyle) return true;
    return !_sameButtons(buttons, _initialButtons);
  }

  RemoteEditorDraft copy() {
    return RemoteEditorDraft(
      remoteId: remoteId,
      name: name,
      layoutStyle: layoutStyle,
      buttons: buttons,
    );
  }

  Remote toRemote() {
    return Remote(
      id: remoteId,
      name: name,
      buttons: List<IRButton>.from(buttons),
      useNewStyle: useNewStyle,
    );
  }

  void updateName(String value) {
    name = value;
  }

  void updateLayoutStyle(RemoteLayoutStyle value) {
    layoutStyle = value;
  }

  void replaceButtonAt(int index, IRButton button) {
    buttons[index] = button;
  }

  void addButton(IRButton button) {
    buttons.add(button);
  }

  void addButtons(Iterable<IRButton> values) {
    buttons.addAll(values);
  }

  void insertButton(int index, IRButton button) {
    buttons.insert(index, button);
  }

  IRButton removeButtonAt(int index) {
    return buttons.removeAt(index);
  }

  static bool _sameButtons(List<IRButton> a, List<IRButton> b) {
    if (identical(a, b)) return true;
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (!_sameButton(a[i], b[i])) return false;
    }
    return true;
  }

  static bool _sameButton(IRButton a, IRButton b) {
    return a.id == b.id &&
        a.code == b.code &&
        a.rawData == b.rawData &&
        a.frequency == b.frequency &&
        a.image == b.image &&
        a.isImage == b.isImage &&
        a.necBitOrder == b.necBitOrder &&
        a.protocol == b.protocol &&
        _sameProtocolParams(a.protocolParams, b.protocolParams) &&
        a.iconCodePoint == b.iconCodePoint &&
        a.iconFontFamily == b.iconFontFamily &&
        a.iconFontPackage == b.iconFontPackage &&
        a.iconColor == b.iconColor &&
        a.buttonColor == b.buttonColor;
  }

  static bool _sameProtocolParams(
    Map<String, dynamic>? a,
    Map<String, dynamic>? b,
  ) {
    if (identical(a, b)) return true;
    if (a == null || b == null) return a == b;
    if (a.length != b.length) return false;
    for (final entry in a.entries) {
      if (!b.containsKey(entry.key)) return false;
      if (!_sameDynamic(entry.value, b[entry.key])) return false;
    }
    return true;
  }

  static bool _sameDynamic(dynamic a, dynamic b) {
    if (a is Map && b is Map) {
      return _sameProtocolParams(
        a.map((key, value) => MapEntry('$key', value)),
        b.map((key, value) => MapEntry('$key', value)),
      );
    }
    if (a is List && b is List) {
      if (a.length != b.length) return false;
      for (int i = 0; i < a.length; i++) {
        if (!_sameDynamic(a[i], b[i])) return false;
      }
      return true;
    }
    return a == b;
  }
}
