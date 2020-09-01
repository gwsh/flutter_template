import 'package:flutter/material.dart';
import 'package:flutter_template/pages/welcome/welcome_page.dart';

import 'global.dart';
import 'routes.dart';

// void main() => runApp(MyApp());
void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ducafecat.tech',
      home: WelcomePage(),
      routes: staticRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
