import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConstants {
  static String apiBaseUrl = "https://flixrtest.azurewebsites.net/";
  static String movieApiUrl = "$apiBaseUrl/movies";

  static const defaultSystemUi = SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      statusBarColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark);
}
