import 'package:flixr_mv/controllers/base_notifier.dart';
import 'package:flixr_mv/extensions/sateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseNotifier> extends StatelessWidget {
  final T controller;
  final bool disposeModel;
  final Function(T)? onModelReady;
  final  Widget Function(BuildContext context, T controller) builder;

  const BaseWidget(
      {Key? key,
      required this.controller,
      this.disposeModel = true,
      required this.builder,
      this.onModelReady, required})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: controller,
        child: StatefulWrapper(
            onInit: () {
              onModelReady?.call(controller);
            },
            onDispose: () {
              if (disposeModel) {
                controller.dispose();
                return;
              }
            },
            child: builder(
              context,
              controller
            )));
  }
}
