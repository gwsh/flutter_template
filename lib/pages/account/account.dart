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

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPagePageState createState() => _AccountPagePageState();
}

class _AccountPagePageState extends State<AccountPage>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller; // EasyRefresh控制器
  ScrollController _scrollController;
  bool isHide = false;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _scrollController = ScrollController();
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
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //监听滚动位置
    _scrollController.addListener(() {
      if (_scrollController.offset > 140) {
        isHide = true;
      } else {
        isHide = false;
      }
      setState(() {});
    });
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        cacheExtent: 10,
        slivers: <Widget>[
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            pinned: true,
            stretch: true,
            stretchTriggerOffset: 100,
            onStretchTrigger: () {
              print("ok");
              return;
            },
            expandedHeight: 220.0,
            flexibleSpace: InkWell(
              onDoubleTap: () {
                _scrollController.jumpTo(0.0);
              },
              child: Stack(
                children: [
                  FlexibleSpaceBar(
                    titlePadding: !isHide ? EdgeInsets.all(0.0) : null,
                    stretchModes: [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                    ],
                    title: isHide
                        ? Text(
                            "Eric Hernandez",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: appSetFontSize(16.0),
                            ),
                          )
                        : Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 260.0 - 90 - 40 - 44,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                        appSetWidth(15),
                                      ),
                                      topLeft: Radius.circular(
                                        appSetWidth(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 260.0 - 90 - 40,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipOval(
                                          child: Image.asset(
                                        "assets/images/topgb.png",
                                        width: 60.0,
                                        height: 60.0,
                                        fit: BoxFit.cover,
                                      )),
                                      //剪裁为圆形
                                      Text(
                                        "Eric Hernandez",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: appSetFontSize(14.0),
                                        ),
                                      ),
                                      Text(
                                        "22岁·互联网·双子座",
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: appSetFontSize(10.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                    background: Image.asset(
                      "assets/images/bg2020.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              //创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50 //50个列表项
                ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
