import 'package:flutter/material.dart';

import 'views/splash.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {

    switch(settings.name) {
      case "/": {
        return MaterialPageRoute(builder: (context) => const AppSplashScreen());
      }
      default: return null;
    }
  
    
  }
}
