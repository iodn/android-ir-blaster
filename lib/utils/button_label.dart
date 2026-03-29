import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/widgets/icon_picker.dart';

String displayButtonLabel(
  IRButton button, {
  String fallback = '',
  String iconFallback = '',
  String Function(String canonicalName)? iconNameLocalizer,
}) {
  final label = formatButtonDisplayName(button.image).trim();
  if (label.isNotEmpty) return label;

  if (button.iconCodePoint != null) {
    final iconName = iconPickerNameFor(
      codePoint: button.iconCodePoint!,
      fontFamily: button.iconFontFamily,
    );
    if (iconName != null && iconName.trim().isNotEmpty) {
      return iconNameLocalizer?.call(iconName) ?? iconName;
    }
    return iconFallback;
  }

  return fallback;
}

String displayButtonRefLabel(
  String? raw, {
  String fallback = '',
}) {
  final pretty = formatButtonDisplayName((raw ?? '').trim());
  return pretty.isEmpty ? fallback : pretty;
}
