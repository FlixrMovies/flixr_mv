import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  late AdaptiveThemeMode mode;
  AppTheme(this.mode);

  static bool get isDark => mode.isDark;

  static Color get scaffoldBackgroundColor =>
      isDark ? Colors.white : Colors.black;

  static const Color primaryColor = Color(0xFFF2C94C);
}
