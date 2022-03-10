import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpsf_framework/mpsf_framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 自定义导航条
class MpsfNavigationBar extends StatefulWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget? backWidget;
  final Widget? rightWidget;
  final Widget? bgWidget;
  final VoidCallback? backOnPressed;
  const MpsfNavigationBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.bgWidget,
    this.backOnPressed,
    this.backWidget,
    this.rightWidget,
  }) : super(key: key);

  @override
  _MpsfNavigationBarState createState() => _MpsfNavigationBarState();
}

class _MpsfNavigationBarState extends State<MpsfNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getNavigationBarHeight(),
      child: Stack(
        children: [
          widget.bgWidget ?? Container(color: Colors.white),
          Column(
            children: [
              getStatusBar(),
              getTopBar(),
            ],
          )
        ],
      ),
    );
  }

  double getNavigationBarHeight() {
    return getStatusBarHeight() + getTopBarHeight();
  }

  double getTopBarHeight() {
    return 44;
  }

  double getStatusBarHeight() {
    return MediaQuery.of(context).padding.top;
  }

  Widget getStatusBar() {
    return SizedBox(height: getStatusBarHeight());
  }

  ///TopBar
  Widget getTopBar() {
    return SizedBox(
      height: getTopBarHeight(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(child: getTopBarLeft()),
          Expanded(child: getTopBarCenter()),
          Expanded(child: getTopBarRight()),
        ],
      ),
    );
  }

  ///TopBar左边部分
  Widget getTopBarLeft() {
    return widget.backWidget ??
        SizedBox(
          width: getTopBarHeight(),
          child: Row(
            children: [
              IconButton(
                onPressed: clickBackWidget,
                padding: const EdgeInsets.all(12.0),
                icon: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  size: 18,
                ),
              )
            ],
          ),
        );
  }

  void clickBackWidget() {
    if (widget.backOnPressed != null) {
      widget.backOnPressed!();
      return;
    }
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      //说明已经没法回退了 ， 可以关闭了
      SystemNavigator.pop();
    }
  }

  ///TopBar中间部分
  Widget getTopBarCenter() {
    return widget.titleWidget ??
        Text(
          mpsfStr(widget.title),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        );
  }

  ///TopBar右侧部分
  Widget getTopBarRight() {
    return widget.rightWidget ??
        SizedBox(
          width: getTopBarHeight(),
          height: double.infinity,
        );
  }
}
