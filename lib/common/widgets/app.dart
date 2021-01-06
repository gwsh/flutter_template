import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pk_skeleton/pk_skeleton.dart';

/// 透明背景 AppBar
Widget transparentAppBar({
  @required BuildContext context,
  Widget title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    brightness: Brightness.light,
    elevation: 0,
    title: title ?? Text(""),
    leading: leading,
    actions: actions,
  );
}

/// 骨架屏-卡片
Widget cardListSkeleton() {
  return PKCardListSkeleton(
    isCircularImage: true,
    isBottomLinesActive: false,
    length: 10,
  );
}

class StatusBar {
  /// 状态栏样式 沉浸式状态栏
  static statusBar({String color = "dark"}) {
    // 白色沉浸式状态栏颜色  白色文字
    SystemUiOverlayStyle light = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,

      /// 注意安卓要想实现沉浸式的状态栏 需要底部设置透明色
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    );
    // 黑色沉浸式状态栏颜色 黑色文字
    SystemUiOverlayStyle dark = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,

      /// 注意安卓要想实现沉浸式的状态栏 需要底部设置透明色
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    "light" == color?.trim()
        ? SystemChrome.setSystemUIOverlayStyle(light)
        : SystemChrome.setSystemUIOverlayStyle(dark);
  }
}
