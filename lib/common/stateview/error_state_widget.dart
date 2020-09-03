import 'package:flutter/material.dart';
import 'package:flutter_template/common/utils/screen.dart';

class ErrorStateWidget extends StatefulWidget {
  VoidCallback onPressed;

  ErrorStateWidget({Key key, @required this.onPressed}) : super(key: key);

  @override
  _ErrorStateWidgetState createState() => _ErrorStateWidgetState();
}

class _ErrorStateWidgetState extends State<ErrorStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "网络错误~",
            style: TextStyle(
              fontSize: appSetFontSize(16),
              fontFamily: 'Montserrat',
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: appSetHeight(100),
            child: RaisedButton(
              onPressed: widget.onPressed ?? null,
              child: Text("点击刷新"),
            ),
          )
        ],
      ),
    );
  }
}
