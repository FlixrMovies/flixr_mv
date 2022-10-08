import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flixr_mv/app_theme.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup({
 required AdaptiveThemeMode mode
}) {
  getIt.registerSingleton<AppTheme>(AppTheme(mode));
}