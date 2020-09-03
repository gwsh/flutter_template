import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/common/router/router.gr.dart';
import 'package:flutter_template/common/utils/screen.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      checkToPage();
    });
  }

  checkToPage() {
    // 判断是否是第一次
    // true => 显示欢迎页面
    // false=> 判断是否已经登录过↓
    //         true => 离线登录
    //         false=> 登录页面
    if (Global.isFirstOpen == true) {
      ExtendedNavigator.rootNavigator.pushReplacementNamed(
        Routes.welcomePageRoute,
      );
    } else if (Global.isOfflineLogin == true) {
      ExtendedNavigator.rootNavigator.pushReplacementNamed(
        Routes.applicationPageRoute,
      );
    } else {
      ExtendedNavigator.rootNavigator.pushReplacementNamed(
        Routes.signInPageRoute,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 初始化屏幕适配文件
    ScreenUtil.init(
      context,
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "广告页面3s...",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: appSetHeight(48),
            right: appSetWidth(22),
            child: InkWell(
              onTap: () {
                checkToPage();
              },
              child: Container(
                padding: EdgeInsets.all(
                  appSetWidth(4.0),
                ),
                child: Text(
                  "跳过",
                  style: TextStyle(
                    fontSize: appSetFontSize(16.0),
                    fontFamily: "Montserrat",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
