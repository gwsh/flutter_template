// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../pages/application/application.dart';
import '../../pages/details/details.dart';
import '../../pages/index/index.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/sign_up/sign_up.dart';
import '../../pages/welcome/welcome_page.dart';
import '../entites/entitys.dart';
import 'auth_grard.dart';
import 'router.dart';

class Routes {
  static const String indexPageRoute = '/';
  static const String welcomePageRoute = '/welcome-page';
  static const String signInPageRoute = '/sign-in-page';
  static const String signUpPageRoute = '/sign-up-page';
  static const String applicationPageRoute = '/application-page';
  static const String detailsPageRoute = '/details-page';
  static const all = <String>{
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
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.indexPageRoute, page: IndexPage),
    RouteDef(Routes.welcomePageRoute, page: WelcomePage),
    RouteDef(Routes.signInPageRoute, page: SignInPage),
    RouteDef(Routes.signUpPageRoute, page: SignUpPage),
    RouteDef(Routes.applicationPageRoute,
        page: ApplicationPage, guards: [AuthGuard]),
    RouteDef(Routes.detailsPageRoute, page: DetailsPage, guards: [AuthGuard]),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    IndexPage: (data) {
      final args = data.getArgs<IndexPageArguments>(
        orElse: () => IndexPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => IndexPage(key: args.key),
        settings: data,
      );
    },
    WelcomePage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => WelcomePage(),
        settings: data,
        transitionsBuilder: zoomInTransition,
      );
    },
    SignInPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInPage(),
        settings: data,
      );
    },
    SignUpPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpPage(),
        settings: data,
      );
    },
    ApplicationPage: (data) {
      final args = data.getArgs<ApplicationPageArguments>(
        orElse: () => ApplicationPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ApplicationPage(key: args.key),
        settings: data,
      );
    },
    DetailsPage: (data) {
      final args = data.getArgs<DetailsPageArguments>(
        orElse: () => DetailsPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DetailsPage(
          key: args.key,
          item: args.item,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension AppRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushIndexPageRoute({
    Key key,
  }) =>
      push<dynamic>(
        Routes.indexPageRoute,
        arguments: IndexPageArguments(key: key),
      );

  Future<dynamic> pushWelcomePageRoute() =>
      push<dynamic>(Routes.welcomePageRoute);

  Future<dynamic> pushSignInPageRoute() =>
      push<dynamic>(Routes.signInPageRoute);

  Future<dynamic> pushSignUpPageRoute() =>
      push<dynamic>(Routes.signUpPageRoute);

  Future<dynamic> pushApplicationPageRoute(
          {Key key, OnNavigationRejected onReject}) =>
      push<dynamic>(
        Routes.applicationPageRoute,
        arguments: ApplicationPageArguments(key: key),
        onReject: onReject,
      );

  Future<dynamic> pushDetailsPageRoute(
          {Key key, NewsItem item, OnNavigationRejected onReject}) =>
      push<dynamic>(
        Routes.detailsPageRoute,
        arguments: DetailsPageArguments(key: key, item: item),
        onReject: onReject,
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// IndexPage arguments holder class
class IndexPageArguments {
  final Key key;
  IndexPageArguments({this.key});
}

/// ApplicationPage arguments holder class
class ApplicationPageArguments {
  final Key key;
  ApplicationPageArguments({this.key});
}

/// DetailsPage arguments holder class
class DetailsPageArguments {
  final Key key;
  final NewsItem item;
  DetailsPageArguments({this.key, this.item});
}
