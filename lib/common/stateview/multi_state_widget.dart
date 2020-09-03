import 'package:flutter/material.dart';
import 'package:flutter_template/common/stateview/stateview.dart';
import 'package:flutter_template/common/viewmodel/viewmodel.dart';

typedef Content = Widget Function(BuildContext context);

/// 根据我们的的BaseState 配置Http 封装的三个回调
/// 我们可以维护一个状态以增加页面的交互体验
/// @see [BaseState]
// ignore: must_be_immutable
class MultiStateWidget extends StatefulWidget {
  Widget loadingWidget;
  Widget emptyWidget;
  Widget failWidget;
  Content builder;
  BaseState state;
  VoidCallback failOnPressed;

  MultiStateWidget({
    Key key,
    Content builder,
    @required this.failOnPressed,
    this.state,
    this.loadingWidget,
    this.emptyWidget,
    this.failWidget,
  }) : super(key: key) {
    if (state == BaseState.CONTENT) {
      if (builder != null) {
        this.builder = builder;
      }
    }
    if (emptyWidget == null) {
      emptyWidget = EmptyStateWidget();
    }
    if (failWidget == null) {
      failWidget = ErrorStateWidget(
        onPressed: failOnPressed,
      );
    }
    if (loadingWidget == null) {
      loadingWidget = LoadingStateWidget();
    }
  }

  @override
  _MultiStateWidgetState createState() => _MultiStateWidgetState();
}

class _MultiStateWidgetState extends State<MultiStateWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.state == null) {
      return Container(
        width: 0,
        height: 0,
      );
    }
    if (widget.state == BaseState.CONTENT) {
      return widget.builder(context);
    } else if (widget.state == BaseState.EMPTY) {
      return widget.emptyWidget;
    } else if (widget.state == BaseState.FAIL) {
      return widget.failWidget;
    } else {
      return widget.loadingWidget;
    }
  }
}
