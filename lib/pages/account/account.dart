import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../test.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
      onTap: () {
        // Navigator.of(context).push(CupertinoPageRoute(builder: (context) => TestPage()));
      },child: Text('Account')),
    );
  }
}
