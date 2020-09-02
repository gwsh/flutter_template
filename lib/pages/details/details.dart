import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/values/values.dart';
import 'package:flutter_template/common/widgets/widgets.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final String url;

  const DetailsPage({Key key, this.title, this.url}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // 顶部导航
  Widget _buildAppBar() {
    return transparentAppBar(
        context: context,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            ExtendedNavigator.rootNavigator.pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.bookmark_border,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.share,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          )
        ]);
  }

  // 正文
  Widget _buildPageView() {
    return Container(
      child: Text("${widget.title} ${widget.url}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
    );
  }
}
