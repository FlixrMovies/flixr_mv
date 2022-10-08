import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flixr_mv/app_route_generator.dart';
import 'package:flixr_mv/constants.dart';
import 'package:flixr_mv/get_it.dart';
import 'package:flixr_mv/src/utils/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  setup(mode: savedThemeMode ?? AdaptiveThemeMode.dark);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //Setting SystemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(AppConstants.defaultSystemUi);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, required this.savedThemeMode});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSwatch(
              brightness: Brightness.light,
              primarySwatch:
                  UiUtils.createMaterialColor(const Color(0xFFF2C94C)),
            ).copyWith(secondary: Colors.redAccent)),
        dark: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSwatch(
            brightness: Brightness.dark,
            primarySwatch: UiUtils.createMaterialColor(const Color(0xFFF2C94C)),
          ).copyWith(secondary: Colors.redAccent),
        ),
        initial: savedThemeMode ?? AdaptiveThemeMode.dark,
        builder: (theme, darkTheme) => Sizer(
            builder: (context, orientation, deviceType) => GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flixr',
                  darkTheme: darkTheme.copyWith(
                    textTheme: GoogleFonts.syneTextTheme(),
                  ),
                  theme: theme.copyWith(
                    textTheme: GoogleFonts.syneTextTheme(),
                  ),
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                )));
  }
}
