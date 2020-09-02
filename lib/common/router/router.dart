import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/pages/application/application.dart';
import 'package:flutter_template/pages/details/details.dart';
import 'package:flutter_template/pages/index/index.dart';
import 'package:flutter_template/pages/sign_in/sign_in.dart';
import 'package:flutter_template/pages/sign_up/sign_up.dart';
import 'package:flutter_template/pages/welcome/welcome_page.dart';

import 'auth_grard.dart';
// 动画
Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // you get an animation object and a widget
  // make your own transition
  return ScaleTransition(scale: animation, child: child);
}

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $AppRouter {
  @initial
  IndexPage indexPageRoute;

  WelcomePage welcomePageRoute;

  SignInPage signInPageRoute;

  SignUpPage signUpPageRoute;

  @GuardedBy([AuthGuard])
  ApplicationPage applicationPageRoute;
  /// 跳转到该页面需要授权
  /// 一般而言 只有登录 注册 还原不需要做权限验证
  /// 当然这个还是看你的业务
  @GuardedBy([AuthGuard])
  @CustomRoute(transitionsBuilder: zoomInTransition)
  DetailsPage detailsPageRoute;
}
