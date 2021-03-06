import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/entites/entitys.dart';
import 'package:flutter_template/common/router/router.gr.dart';
import 'package:flutter_template/common/utils/utils.dart';
import 'package:flutter_template/common/values/values.dart';
import 'package:flutter_template/common/widgets/widgets.dart';

// 推荐阅读
/// 推荐阅读
Widget recommendWidget(NewsItem item) {
  return Container(
    margin: EdgeInsets.all(appSetWidth(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图
        InkWell(
          onTap: () {
            ExtendedNavigator.root.pushDetailsPageRoute(item: item);
          },
          child: imageCached(
            item.thumbnail,
            width: appSetWidth(335),
            height: appSetHeight(290),
          ),
        ),
        // 作者
        Container(
          margin: EdgeInsets.only(top: appSetHeight(14)),
          child: Text(
            item.author,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              color: AppColors.thirdElementText,
              fontSize: appSetFontSize(14),
            ),
          ),
        ),
        // 标题
        InkWell(
          onTap: () {
            ExtendedNavigator.root.pushDetailsPageRoute(item: item);
          },
          child: Container(
            margin: EdgeInsets.only(top: appSetHeight(10)),
            child: Text(
              item.title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
                fontSize: appSetFontSize(24),
                height: 1,
              ),
            ),
          ),
        ),
        // 一行 3 列
        Container(
          margin: EdgeInsets.only(top: appSetHeight(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 分类
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                ),
                child: Text(
                  item.category,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryElementText,
                    fontSize: appSetFontSize(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              // 添加时间
              Container(
                width: appSetWidth(15),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                ),
                child: Text(
                  '• ${duTimeLineFormat(item.addtime)}',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElementText,
                    fontSize: appSetFontSize(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              // 更多
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryText,
                  size: 24,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
