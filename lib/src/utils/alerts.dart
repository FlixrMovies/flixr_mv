import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

class Alert {
  static void error({required String message, String? title}) =>
      AlertController.show(
          title ?? "Opps! An error occurred", message, TypeAlert.error);

  static void warning({required String message, String? title}) =>
      AlertController.show(title ?? "Warning", message, TypeAlert.warning);

  static void success({required String message, String? title}) =>
      AlertController.show(title ?? "Success!", message, TypeAlert.success);
}
