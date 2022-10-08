import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationService {
  Future<T> to<T>({required String routeName, dynamic args}) {
    return Navigator.of(Get.context!).pushNamed(routeName, arguments: args)
        as Future<T>;
  }

  Future<void> toAndClearRoute<T>({required String routeName, dynamic args}) {
    return Navigator.of(Get.context!)
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: args);
  }
}
