import 'package:flutter/material.dart';
import 'package:flutter_template/common/stateview/multi_state_widget.dart';
import 'package:flutter_template/common/utils/utils.dart';

/// 当没有数据的时候的页面
/// 可以重写改页面
/// @see [MultiStateWidget]
class EmptyStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "数据不见啦~",
        style: TextStyle(
          fontSize: appSetFontSize(16),
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
