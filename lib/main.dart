import 'package:flutter/material.dart';
import 'package:flutter_template/pages/welcome/welcome_page.dart';
import 'package:flutter_template/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: WelcomePage(),
      routes: staticRoutes,
    );
  }
}
