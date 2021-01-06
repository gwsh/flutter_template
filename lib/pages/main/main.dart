import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_template/common/apis/apis.dart';
import 'package:flutter_template/common/entites/entitys.dart';
import 'package:flutter_template/common/utils/utils.dart';
import 'package:flutter_template/common/values/values.dart';
import 'package:flutter_template/common/viewmodel/viewmodel.dart';
import 'package:flutter_template/common/widgets/widgets.dart';
import 'package:flutter_template/pages/main/mian_import.dart';

import 'recommend_widget.dart';

/// 这个页面没有采用状态管理
/// 状态管理的Demo => see [ProviderViewDemo]
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller; // EasyRefresh控制器
  NewsPageListResponseEntity _newsPageList; // 新闻翻页
  NewsItem _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity> _categories = []; // 分类
  List<ChannelResponseEntity> _channels = []; // 频道
  String _selCategoryCode; // 选中的分类Code

  @override
  // 切记！ 为了不让PageView子页面重绘
  // 每一个子页面 都要在class with AutomaticKeepAliveClientMixin
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _loadAllData();
    _loadLatestWithDiskCache();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  // 如果有磁盘缓存，延迟3秒拉取更新档案
  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE == true) {
      var cacheData = StorageUtil().getJSON(STORAGE_INDEX_NEWS_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 3), () {
          _controller?.callRefresh();
        });
      }
    }
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories(
      context: context,
      cacheDisk: true,
    );
    _channels = await NewsAPI.channels(
      context: context,
      cacheDisk: true,
    );
    _newsRecommend = await NewsAPI.newsRecommend(
      context: context,
      cacheDisk: true,
    );
    _newsPageList = await NewsAPI.newsPageList(
      context: context,
      cacheDisk: true,
    );

    _selCategoryCode = _categories?.first?.code ?? "";

    if (mounted) {
      setState(() {});
    }
  }

  // 拉取推荐、新闻
  _loadNewsData(
    categoryCode, {
    bool refresh = false,
  }) async {
    _selCategoryCode = categoryCode;
    _newsRecommend = await NewsAPI.newsRecommend(
      context: context,
      params: NewsRecommendRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );
    _newsPageList = await NewsAPI.newsPageList(
      context: context,
      params: NewsPageListRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );
    if (mounted) {
      setState(() {});
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    return _categories == null
        ? Container()
        : newsCategoriesWidget(
            categories: _categories,
            selCategoryCode: _selCategoryCode,
            onTap: (CategoryResponseEntity item) {
              _loadNewsData(item.code);
            },
          );
  }

  // 推荐阅读
  Widget _buildRecommend() {
    return _newsRecommend == null // 数据没到位，可以用骨架图展示
        ? Container()
        : recommendWidget(_newsRecommend);
  }

  // 频道
  Widget _buildChannels() {
    return _channels == null
        ? Container()
        : newsChannelsWidget(
            channels: _channels,
            onTap: (ChannelResponseEntity item) {},
          );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
            height: appSetHeight(161 * 5 + 100.0),
          )
        : Column(
            children: _newsPageList?.items?.map((item) {
              // 新闻行
              List<Widget> widgets = <Widget>[
                newsItem(item),
                Divider(height: 1),
              ];

              // 每 5 条 显示广告
              int index = _newsPageList.items.indexOf(item);
              if (((index + 1) % 5) == 0) {
                widgets.addAll(<Widget>[
                  adWidget(),
                  Divider(height: 1),
                ]);
              }
              // 返回
              return Column(
                children: widgets,
              );
            })?.toList()??[],
          );
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return newsletterWidget();
  }

  @override
  Widget build(BuildContext context) {
    // 切记！ 为了不让PageView子页面重绘
    // 子页面需要 super.build
    super.build(context);
    return Scaffold(
      appBar: transparentAppBar(
        context: context,
        title: Text(
          "首页",
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Montserrat',
            fontSize: appSetFontSize(18.0),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _newsPageList == null
          ? cardListSkeleton()
          : EasyRefresh(
              enableControlFinishRefresh: true,
              controller: _controller,
              header: MaterialHeader(),
              onRefresh: () async {
                try {
                  await _loadNewsData(
                    _selCategoryCode,
                    refresh: true,
                  );
                  _controller?.finishRefresh();
                } catch (e) {
                  _controller?.finishRefresh();
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildCategories(),
                    Divider(height: 1),
                    _buildRecommend(),
                    Divider(height: 1),
                    _buildChannels(),
                    Divider(height: 1),
                    _buildNewsList(),
                    Divider(height: 1),
                    _buildEmailSubscribe(),
                  ],
                ),
              ),
            ),
    );
  }
}
