import 'package:flixr_mv/views/start/start_widget.dart';
import 'package:flutter/material.dart';

import 'views/splash.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {

    switch(settings.name) {
      case "/": {
        return MaterialPageRoute(builder: (context) => const AppSplashScreen());
      }
      case "/start" : {
        return MaterialPageRoute(builder: (context) => const HomePage());     

      }
      default: return null;
    }
  
    
  }
}
