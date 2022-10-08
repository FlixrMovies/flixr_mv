import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flixr_mv/app_theme.dart';
import 'package:flixr_mv/extensions/sateful_wrapper.dart';
import 'package:flixr_mv/get_it.dart';
import 'package:flixr_mv/src/services/navigation.dart';
import 'package:flixr_mv/widgets/default_shared.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sizer/sizer.dart';

class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    
  final appTheme = getIt<AppTheme>();
    
    return Scaffold(
        appBar: DefaultWidgets.statusAppBar(color: Colors.black),
        extendBodyBehindAppBar: true,
        body: StatefulWrapper
        
        
        
        (
          onInit: ()=> Future.delayed(
            5.seconds,
          () =>
          getIt<NavigationService>().toAndClearRoute(routeName: '/start')),
          child: 
        Container(
            alignment: Alignment.center,
            color: appTheme.scaffoldBackgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: SizedBox(
              width: 50.w,
              child: TextLiquidFill(
                text: 'Flixr.',
                loadDuration: const Duration(seconds: 4),
                waveColor: appTheme.primaryColor,
                boxBackgroundColor: appTheme.scaffoldBackgroundColor,
                textStyle: TextStyle(
                  fontSize: 30.sp,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w500,
                ),
                boxHeight: 25.h,
              ),
            )),
      ));
  }
}