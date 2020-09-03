import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_template/common/entites/entitys.dart';
import 'package:flutter_template/common/provider/provider.dart';
import 'package:flutter_template/common/stateview/stateview.dart';
import 'package:flutter_template/common/utils/screen.dart';
import 'package:flutter_template/common/viewmodel/viewmodel.dart';
import 'package:flutter_template/common/widgets/widgets.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  EasyRefreshController _controller; // EasyRefresh控制器
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ProviderViewDemo>(
      model: ProviderViewDemo(),
      onReady: (model) {
        model.getProviderEntity(context: context);
      },
      builder: (context, model, child) {
        return MultiStateWidget(
          failOnPressed: () {
            toastInfo(msg: "模拟刷新");
          },
          builder: (context) => Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              child: EasyRefresh(
                enableControlFinishRefresh: true,
                controller: _controller,
                header: MaterialHeader(),
                onRefresh: () async {
                  await model.getProviderEntity(
                    context: context,
                    refresh: true,
                  );
                  _controller?.finishRefresh();
                },
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                      height: appSetHeight(280),
                      child: _buildSubjectWidget(model.entity),
                    ),
                  ]),
                ),
              ),
            ),
          ),
          state: model.state,
        );
      },
    );
  }

  Widget _buildSubjectWidget(ProviderDemoEntity subjectEntity) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "豆瓣高分",
                  style: TextStyle(
                    fontSize: appSetFontSize(18.0),
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).textTheme.subtitle1.color,
                    shadows: [
                      BoxShadow(
                        color: Colors.grey[500],
                        blurRadius: 20.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                ),
                Text(
                  "查看更多",
                  style: TextStyle(
                    fontSize: appSetFontSize(18.0),
                    fontWeight: FontWeight.w400,
                    color: Colors.green,
                    shadows: [
                      BoxShadow(
                        color: Colors.grey[500],
                        blurRadius: 20.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: subjectEntity.item.length,
              itemBuilder: (context, index) {
                var bean = subjectEntity.item[index];
                return Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: imageCached(
                                    bean.cover,
                                    width: appSetWidth(140),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 0),
                                child: Text(
                                  "${bean.title}",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .color,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
