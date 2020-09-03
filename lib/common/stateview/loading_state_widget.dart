import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/widgets.dart';

/// 加载显示骨架卡片
class LoadingStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _loading = Container(
      child: cardListSkeleton(),
      alignment: Alignment.center,
    );
    return _loading;
  }
}
