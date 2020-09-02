// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/pages/index/index.dart';
import 'package:flutter_template/pages/welcome/welcome_page.dart';
import 'package:flutter_template/pages/sign_in/sign_in.dart';
import 'package:flutter_template/pages/sign_up/sign_up.dart';
import 'package:flutter_template/pages/application/application.dart';
import 'package:flutter_template/common/router/auth_grard.dart';
import 'package:flutter_template/pages/details/details.dart';
import 'package:flutter_template/common/router/router.dart';

abstract class Routes {
  static const indexPageRoute = '/';
  static const welcomePageRoute = '/welcome-page-route';
  static const signInPageRoute = '/sign-in-page-route';
  static const signUpPageRoute = '/sign-up-page-route';
  static const applicationPageRoute = '/application-page-route';
  static const detailsPageRoute = '/details-page-route';
  static const all = {
    indexPageRoute,
    welcomePageRoute,
    signInPageRoute,
    signUpPageRoute,
    applicationPageRoute,
    detailsPageRoute,
  };
}

class AppRouter extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.applicationPageRoute: [AuthGuard],
        Routes.detailsPageRoute: [AuthGuard],
      };

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<AppRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.indexPageRoute:
        if (hasInvalidArgs<IndexPageArguments>(args)) {
          return misTypedArgsRoute<IndexPageArguments>(args);
        }
        final typedArgs = args as IndexPageArguments ?? IndexPageArguments();
        return CupertinoPageRoute<dynamic>(
          builder: (context) => IndexPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.welcomePageRoute:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => WelcomePage(),
          settings: settings,
        );
      case Routes.signInPageRoute:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => SignInPage(),
          settings: settings,
        );
      case Routes.signUpPageRoute:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => SignUpPage(),
          settings: settings,
        );
      case Routes.applicationPageRoute:
        if (hasInvalidArgs<ApplicationPageArguments>(args)) {
          return misTypedArgsRoute<ApplicationPageArguments>(args);
        }
        final typedArgs =
            args as ApplicationPageArguments ?? ApplicationPageArguments();
        return CupertinoPageRoute<dynamic>(
          builder: (context) => ApplicationPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.detailsPageRoute:
        if (hasInvalidArgs<DetailsPageArguments>(args)) {
          return misTypedArgsRoute<DetailsPageArguments>(args);
        }
        final typedArgs =
            args as DetailsPageArguments ?? DetailsPageArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => DetailsPage(
              key: typedArgs.key, title: typedArgs.title, url: typedArgs.url),
          settings: settings,
          transitionsBuilder: zoomInTransition,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//IndexPage arguments holder class
class IndexPageArguments {
  final Key key;

  IndexPageArguments({this.key});
}

//ApplicationPage arguments holder class
class ApplicationPageArguments {
  final Key key;

  ApplicationPageArguments({this.key});
}

//DetailsPage arguments holder class
class DetailsPageArguments {
  final Key key;
  final String title;
  final String url;

  DetailsPageArguments({this.key, this.title, this.url});
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension AppRouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushIndexPageRoute({
    Key key,
  }) =>
      pushNamed(
        Routes.indexPageRoute,
        arguments: IndexPageArguments(key: key),
      );

  Future pushWelcomePageRoute() => pushNamed(Routes.welcomePageRoute);

  Future pushSignInPageRoute() => pushNamed(Routes.signInPageRoute);

  Future pushSignUpPageRoute() => pushNamed(Routes.signUpPageRoute);

  Future pushApplicationPageRoute({Key key, OnNavigationRejected onReject}) =>
      pushNamed(
        Routes.applicationPageRoute,
        arguments: ApplicationPageArguments(key: key),
        onReject: onReject,
      );

  Future pushDetailsPageRoute(
          {Key key, String title, String url, OnNavigationRejected onReject}) =>
      pushNamed(
        Routes.detailsPageRoute,
        arguments: DetailsPageArguments(key: key, title: title, url: url),
        onReject: onReject,
      );
}
