import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  late AdaptiveThemeMode mode;
  AppTheme(this.mode);

  bool get isDark => mode.isDark;

   Color get scaffoldBackgroundColor =>
      !isDark ? Colors.white : Colors.black;

    Color  get primaryColor => const Color(0xFFF2C94C);

  Color get greyColor => isDark ? Colors.grey.shade800 : Colors.grey.shade200;

  Color get whiteTextColor => isDark ? Colors.white : Colors.black;
}
