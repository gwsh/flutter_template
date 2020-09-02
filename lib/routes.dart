import 'package:flutter_template/pages/sign_in/sign_in.dart';
import 'package:flutter_template/pages/sign_up/sign_up.dart';

import 'pages/application/application.dart';

/// 静态路由
var staticRoutes = {
  "/sign-in": (context) => SignInPage(), // 登录
  "/sign-up": (context) => SignUpPage(), // 注册
  "/app": (context) => ApplicationPage(), // 主程序
};
