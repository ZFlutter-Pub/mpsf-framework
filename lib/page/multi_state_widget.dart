// ignore_for_file: must_be_immutable, prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import '../utils/mpsf_util.dart';

import 'base_state.dart';

typedef Content = Widget Function(BuildContext context);

class MultiStateWidget extends StatefulWidget {
  Widget? loadingWidget;
  Widget? emptyWidget;
  Widget? failWidget;
  Content builder;
  BaseState? state;
  Function(BaseState? state)? onTap;

  MultiStateWidget({
    Key? key,
    this.state,
    this.emptyWidget,
    this.failWidget,
    this.loadingWidget,
    required this.builder,
    this.onTap,
  }) : super(key: key) {
    emptyWidget ??= EmptyStateWidget();

    failWidget ??= ErrorStateWidget();

    loadingWidget ??= LoadingStateWidget();
  }

  @override
  _MultiStateWidgetState createState() => _MultiStateWidgetState();
}

class _MultiStateWidgetState extends State<MultiStateWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state == null) {
      return SizedBox(width: 0, height: 0);
    }
    if (widget.state == BaseState.CONTENT) {
      return widget.builder(context);
    } else if (widget.state == BaseState.EMPTY) {
      return GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!(widget.state);
          }
        },
        child: widget.emptyWidget,
      );
    } else if (widget.state == BaseState.FAIL) {
      return GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!(widget.state);
          }
        },
        child: widget.failWidget,
      );
    } else {
      return GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!(widget.state);
          }
        },
        child: widget.loadingWidget,
      );
    }
  }
}

class EmptyStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "暂无数据",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}

class ErrorStateWidget extends StatelessWidget {
  String? reason;

  ErrorStateWidget({this.reason});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          mpsfStr(reason, placehold: "请求失败"),
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}

class LoadingStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text(
          "加载中...",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}
