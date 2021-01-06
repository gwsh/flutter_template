import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/common/utils/screen.dart';
import 'package:flutter_template/common/utils/utils.dart';
import 'package:flutter_template/common/widgets/toast.dart';

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
  double _scaleHeight = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _scrollController = ScrollController();
    _scaleHeight = ScreenUtil().scaleHeight;
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
    _scrollController.addListener(() {
      print("${_scrollController.offset}");
      if (_scrollController.offset > 140 * _scaleHeight) {
        isHide = true;
      } else {
        isHide = false;
      }
      setState(() {});
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        cacheExtent: 10,
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0.0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            pinned: true,
            stretch: true,
            stretchTriggerOffset: 100,
            onStretchTrigger: () {
              toastInfo(msg: "刷新成功");
              return;
            },
            floating: true,
            expandedHeight: appSetWidth(240),
            flexibleSpace: Stack(
              children: [
                Container(
                  child: InkWell(
                    onDoubleTap: () {
                      _scrollController.jumpTo(0.0);
                    },
                    child: FlexibleSpaceBar(
                      titlePadding: !isHide ? EdgeInsets.all(0.0) : null,
                      stretchModes: [
                        StretchMode.zoomBackground,
                        StretchMode.blurBackground,
                      ],
                      title: isHide
                          ? Text(
                              "gwsh",
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
                                    height:
                                        (260.0 - 90 - 40 - 50) * _scaleHeight,
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
                                    height: (260.0 - 90 - 40) * _scaleHeight,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ClipOval(
                                            child: Image.asset(
                                          "assets/images/topgb.png",
                                          width: 60.0,
                                          height: 60.0,
                                          fit: BoxFit.cover,
                                        )),
                                        //剪裁为圆形
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: appSetHeight(6)),
                                          child: Text(
                                            "Eric Hernandez",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: appSetFontSize(14.0),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: appSetHeight(20)),
                                          child: Text(
                                            "22岁·互联网·双子座",
                                            style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: appSetFontSize(10.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: appSetHeight(4),
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: appSetWidth(20.0)),
                                    height: appSetHeight(0.2),
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                      background: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 20),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.asset(
                                "assets/images/bg2020.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: appSetHeight(80),
                                width: double.infinity,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // SliverPadding(
          //   padding: const EdgeInsets.all(8.0),
          //   sliver: new SliverGrid(
          //     //Grid
          //     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2, //Grid按两列显示
          //       mainAxisSpacing: 10.0,
          //       crossAxisSpacing: 10.0,
          //       childAspectRatio: 4.0,
          //     ),
          //     delegate: new SliverChildBuilderDelegate(
          //       (BuildContext context, int index) {
          //         //创建子widget
          //         return new Container(
          //           alignment: Alignment.center,
          //           color: Colors.white,
          //           // color: Colors.cyan[100 * (index % 9)],
          //           child: new Text('grid item $index'),
          //         );
          //       },
          //       childCount: 20,
          //     ),
          //   ),
          // ),
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
            }, childCount: 10 //50个列表项
                ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
