// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../app_theme.dart';
import '../../get_it.dart';

class LightButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final void Function()? onPressed;
  const LightButton({Key? key, 
  required this.icon, 
  required this.text, 
  this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = getIt<AppTheme>();

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: appTheme.primaryColor, onPrimary: appTheme.greyColor),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            // Icon(Icons.add, size: 11.sp, color: appTheme.whiteTextColor),
            SizedBox(
              width: 2.w,
            ),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: appTheme.greyColor,
                  fontSize: 11.sp),
            )
          ],
        ));
  }
}
