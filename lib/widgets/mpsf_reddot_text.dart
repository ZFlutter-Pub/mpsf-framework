import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import '../utils/mpsf_util.dart';

class MpsfRedDotText extends StatelessWidget {
  final String data;
  final Color color;
  final double fontSize;
  final int showRedDot;

  const MpsfRedDotText(
    this.data, {
    Key? key,
    this.color = Colors.grey,
    this.showRedDot = 0,
    this.fontSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: _buildWidgets(),
    );
  }

  List<Widget> _buildWidgets() {
    List<Widget> children = <Widget>[];

    if (!TextUtil.isEmpty(data)) {
      TextStyle textStyle = TextStyle(fontSize: fontSize, color: color);
      children.add(
        Text(mpsfStr(data), style: textStyle),
      );
    }

    if (showRedDot == 1) {
      children.add(
        Container(
          width: 5,
          height: 5,
          color: Colors.red,
        ),
      );
    }

    children.add(
      Container(
        padding: const EdgeInsets.only(right: 5),
        child: const Icon(Icons.arrow_forward_ios, size: 10),
      ),
    );
    return children;
  }
}
