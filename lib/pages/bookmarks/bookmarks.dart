import 'package:flutter/material.dart';
import 'package:flutter_template/common/utils/screen.dart';

class BookmarksPage extends StatefulWidget {
  BookmarksPage({Key key}) : super(key: key);

  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("书店",style: TextStyle(
          fontSize: appSetFontSize(24)
        ),),
      ),
    );
  }
}
