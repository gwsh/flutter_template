import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/global.dart';
import 'package:flutter_template/pages/application/application.dart';
import 'package:flutter_template/pages/sign_in/sign_in.dart';
import 'package:flutter_template/pages/welcome/welcome_page.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    // 初始化屏幕适配文件
    ScreenUtil.init(
      context,
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );
    // 判断是否是第一次
    // true => 显示欢迎页面
    // false=> 判断是否已经登录过↓
    //         true => 离线登录
    //         false=> 登录页面
    return Scaffold(
      body: Global.isFirstOpen == true
          ? WelcomePage()
          : Global.isOfflineLogin == true ? ApplicationPage() : SignInPage(),
    );
  }
}
