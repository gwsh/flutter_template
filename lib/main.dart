import 'package:flutter/material.dart';
import 'package:flutter_template/pages/index/index.dart';
import 'global.dart';
import 'routes.dart';

// void main() => runApp(MyApp());
void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ducafecat.tech',
      home: IndexPage(),
      routes: staticRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
