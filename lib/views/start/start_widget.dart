import 'dart:ui' as ui;

import 'package:flixr_mv/controllers/home.dart';
import 'package:flixr_mv/widgets/base_widget.dart';
import 'package:flixr_mv/widgets/buttons/grey_button.dart';
import 'package:flixr_mv/widgets/buttons/light_button.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseWidget<HomeChangeNotifier>(
      controller: Provider.of<HomeChangeNotifier>(context),
      disposeModel: false,
      onModelReady: (model) => model.init(),
      builder: (context, controller) => Scaffold(
        
          backgroundColor: controller.appTheme.scaffoldBackgroundColor,
          body: controller.isLoading
              ? Center(
                  child: Loader(
                    color: controller.appTheme.greyColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        controller.appTheme.primaryColor),
                  ),
                )
              : Stack(
                  children: [
                    Positioned.fill(child: _ItemsWidget()),
                    // _HeaderWidget(),
                  ],
                )));
}

class _HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeChangeNotifier>(context);
    return BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 1.0,
          sigmaY: 1.0,
        ),
        blendMode: BlendMode.dstATop,
        child: Center(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "All",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: controller.appTheme.whiteTextColor,
                      fontSize: 14.sp),
                )
              ]), // replace your loading widget
        )).withHeight(15.h);
  }
}

class _ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeChangeNotifier>(context);

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _ImageMask(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GreyButton(
                    icon: Icon(Icons.add,
                        size: 11.sp, color: controller.appTheme.whiteTextColor),
                    text: "Wishlist",
                    onPressed: () {}),
                SizedBox(
                  width: 5.w,
                ),
                LightButton(
                    icon: Icon(Icons.more_horiz,
                        size: 11.sp,
                        color: controller.appTheme.greyColor),
                    onPressed: () {},
                    text: "Details")
              ],
            )
          ],
        ).withHeight(60.h)
      ],
    );
  }
}

class _ImageMask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeChangeNotifier>(context);
    return ShaderMask(
      // gradient layer  ----------------------------
      shaderCallback: (bound) {
        return LinearGradient(
            end: FractionalOffset.topCenter,
            begin: FractionalOffset.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.99),
              Colors.black.withOpacity(0.7),
              Colors.transparent,
            ],
            stops: const [
              0.0,
              0.3,
              0.45
            ]).createShader(bound);
      },

      blendMode: BlendMode.srcOver,

      // your widget  ------------------------
      child: Container(
          height: 60.h,
          width: double.infinity,
          child: Image.network(
            controller.movies!.header!.image!,
            fit: BoxFit.cover,
          )),
    );
  }
}
