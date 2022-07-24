import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
1.设置了电池栏的颜色

*/
class MpsfDefaultScaffold extends StatefulWidget {
  final Widget? body;
  final SystemUiOverlayStyle uiOverlayStyle;
  const MpsfDefaultScaffold({
    Key? key,
    this.body,
    this.uiOverlayStyle = SystemUiOverlayStyle.dark,
  }) : super(key: key);

  @override
  State<MpsfDefaultScaffold> createState() => _MpsfDefaultScaffoldState();
}

class _MpsfDefaultScaffoldState extends State<MpsfDefaultScaffold> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: widget.uiOverlayStyle,
      child: Scaffold(
        body: widget.body,
      ),
    );
  }
}
