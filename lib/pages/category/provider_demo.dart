import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_template/common/entites/entitys.dart';
import 'package:flutter_template/common/provider/provider.dart';
import 'package:flutter_template/common/stateview/stateview.dart';
import 'package:flutter_template/common/utils/screen.dart';
import 'package:flutter_template/common/utils/utils.dart';
import 'package:flutter_template/common/values/values.dart';
import 'package:flutter_template/common/viewmodel/viewmodel.dart';
import 'package:flutter_template/common/widgets/widgets.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller; // EasyRefresh控制器
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    // _loadLatestWithDiskCache();
  }

  // 如果有磁盘缓存，延迟3秒拉取更新档案
  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE == true) {
      var cacheData = StorageUtil().getJSON(STORAGE_PROVIDER_DEMO_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 3), () {
          _controller?.callRefresh();
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 切记！ 为了不让PageView子页面重绘
    // 子页面需要 super.build
    super.build(context);
    return ProviderWidget<ProviderViewDemo>(
      model: ProviderViewDemo(),
      onReady: (model) {
        model.getProviderEntity(context: context, cacheDisk: true);
      },
      builder: (context, model, child) {
        return MultiStateWidget(
          failOnPressed: () async {
            await model.getProviderEntity(
              context: context,
              refresh: true,
            );
          },
          builder: (context) => Scaffold(
            appBar: transparentAppBar(
              context: context,
              title: Text(
                "Provider_MVVM",
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Montserrat',
                  fontSize: appSetFontSize(18.0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
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
              itemCount: subjectEntity?.item?.length,
              itemBuilder: (context, index) {
                var bean = subjectEntity?.item[index];
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
                                  "${bean?.title}",
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

  @override
  bool get wantKeepAlive => true;
}
