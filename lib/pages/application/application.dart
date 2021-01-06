import 'package:flutter/material.dart';
import 'package:flutter_template/common/utils/utils.dart';
import 'package:flutter_template/common/values/values.dart';
import 'package:flutter_template/common/widgets/widgets.dart';
import 'package:flutter_template/pages/account/account.dart';
import 'package:flutter_template/pages/bookmarks/bookmarks.dart';
import 'package:flutter_template/pages/category/provider_demo.dart';
import 'package:flutter_template/pages/main/mian_import.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  // 当前 tab 页码
  int _page = 0;

  // 页控制器
  PageController _pageController;

  // 底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          Iconfont.home,
          color: AppColors.tabBarElement,
        ),
      ),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          Iconfont.home,
          color: AppColors.secondaryElementText,
        ),
      ),
      label: "首页",
      // title: Text('main'),
      backgroundColor: AppColors.primaryBackground,
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          Iconfont.grid,
          color: AppColors.tabBarElement,
        ),
      ),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          Iconfont.grid,
          color: AppColors.secondaryElementText,
        ),
      ),
      // title: Text('category'),
      label: "商城",
      backgroundColor: AppColors.primaryBackground,
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          Iconfont.tag,
          color: AppColors.tabBarElement,
        ),
      ),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          Iconfont.tag,
          color: AppColors.secondaryElementText,
        ),
      ),
      // title: Text('tag'),
      label: "书店",
      backgroundColor: AppColors.primaryBackground,
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          Iconfont.me,
          color: AppColors.tabBarElement,
        ),
      ),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          Iconfont.me,
          color: AppColors.secondaryElementText,
        ),
      ),
      // title: Text('my'),
      label: "我的",
      backgroundColor: AppColors.primaryBackground,
    ),
  ];

  // tab栏动画
  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 50), curve: Curves.ease);
  }

  // tab栏页码切换
  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        CategoryPage(),
        BookmarksPage(),
        AccountPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      iconSize: 26,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Avenir',
        fontSize: appSetFontSize(14),
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Avenir',
        fontSize: appSetFontSize(14),
      ),
      // showSelectedLabels: true,
      // showUnselectedLabels: true,
    );
  }

  DateTime _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          toastInfo(msg: "连续两次退出哟~");
          return false;
        }
        return true;
      },
      child: Scaffold(
        // 让子类去写Appbar更加符合业务需求
        // appBar: _buildAppBar(),
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
}
