import 'package:flutter/material.dart';

class MpsfCommonCell extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final String text;
  final TextStyle textStyle;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final VoidCallback? callback;
  final double height;
  const MpsfCommonCell(
    this.text, {
    Key? key,
    this.padding = const EdgeInsets.fromLTRB(12, 0, 0, 0),
    this.textStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color(0xFF333333),
    ),
    this.leftWidget,
    this.rightWidget,
    this.callback,
    this.height = 44,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        color: Colors.white,
        padding: padding,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildWidgets(),
        ),
      ),
    );
  }

  List<Widget> _buildWidgets() {
    List<Widget> children = <Widget>[];
    if (leftWidget != null) {
      children.add(leftWidget!);
    }

    children.add(
      Expanded(child: Text(text, style: textStyle)),
    );

    if (rightWidget != null) {
      children.add(rightWidget!);
    } else {
      children.add(Container(
        padding: const EdgeInsets.all(0),
        child: const IconButton(
            icon: Icon(Icons.arrow_forward_ios), iconSize: 15, onPressed: null),
      ));
    }
    return children;
  }
}
