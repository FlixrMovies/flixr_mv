import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  final Function? onInit;
  final Function? onDispose;
  final Widget child;
  const StatefulWrapper({required this.onInit, required this.child, this.onDispose});
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}
class _StatefulWrapperState extends State<StatefulWrapper> with TickerProviderStateMixin {
@override
  void initState() {
    if(widget.onInit != null) {
      try{
      widget.onInit!(this);
      }catch(_){
        widget.onInit!();
      }
    }
    super.initState();
  }
  @override
  void dispose() {
     if(widget.onDispose != null) {
      widget.onDispose!();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}