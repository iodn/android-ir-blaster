import 'package:flutter/material.dart';

const double _kMinContrastRatio = 4.5;

Color normalizeAccessibleButtonColor(Color color) {
  Color candidate = color.withAlpha(0xFF);
  Color fg = bestButtonForeground(candidate);
  if (_contrastRatio(candidate, fg) >= _kMinContrastRatio) return candidate;

  final hsl = HSLColor.fromColor(candidate);
  final useLightText = fg == Colors.white;
  for (int i = 0; i < 12; i++) {
    final nextLightness = (hsl.lightness + (useLightText ? -0.04 : 0.04))
        .clamp(0.0, 1.0);
    candidate = hsl.withLightness(nextLightness).toColor().withAlpha(0xFF);
    fg = bestButtonForeground(candidate);
    if (_contrastRatio(candidate, fg) >= _kMinContrastRatio) return candidate;
  }

  return candidate;
}

Color bestButtonForeground(Color background) {
  final bg = background.withAlpha(0xFF);
  final whiteRatio = _contrastRatio(bg, Colors.white);
  final blackRatio = _contrastRatio(bg, Colors.black);
  return whiteRatio >= blackRatio ? Colors.white : Colors.black;
}

Color resolveButtonBackground(Color? customColor, Color fallback) {
  if (customColor == null) return fallback;
  return normalizeAccessibleButtonColor(customColor);
}

Color resolveButtonForeground(Color? customColor, Color fallback) {
  if (customColor == null) return fallback;
  return bestButtonForeground(normalizeAccessibleButtonColor(customColor));
}

double _contrastRatio(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  final light = la > lb ? la : lb;
  final dark = la > lb ? lb : la;
  return (light + 0.05) / (dark + 0.05);
}
