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

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(
      initial: true,
      page: IndexPage,
      name: "indexPageRoute",
    ),
    CustomRoute(
      page: WelcomePage,
      name: "welcomePageRoute",
      transitionsBuilder: zoomInTransition,
    ),
    MaterialRoute(
      page: SignInPage,
      name: "signInPageRoute",
    ),
    MaterialRoute(
      page: SignUpPage,
      name: "signUpPageRoute",
    ),
    MaterialRoute(
      page: ApplicationPage,
      name: "applicationPageRoute",
      guards: [AuthGuard],
    ),
    MaterialRoute(
      page: DetailsPage,
      name: "detailsPageRoute",
      guards: [AuthGuard],
    ),
  ],
)
class $AppRouter {}
