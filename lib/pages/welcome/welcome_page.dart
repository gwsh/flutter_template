import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/common/values/radii.dart';
import 'package:flutter_template/common/utils/utils.dart';
import 'package:flutter_template/common/values/values.dart';
import 'package:flutter_template/global.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  /// 顶部标题
  Widget _buildPageHeadTitle() {
    return Container(
      margin: EdgeInsets.only(
        top: appSetHeight(60),
      ),
      child: Text(
        "Features",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: appSetFontSize(
            24,
          ),
        ),
      ),
    );
  }

  /// 标题说明
  Widget _buildPageHeadDetail() {
    return Container(
      width: appSetWidth(242),
      height: appSetHeight(70),
      margin: EdgeInsets.only(top: appSetHeight(14)),
      child: Text(
        "The best of news channels all in one place. Trusted sources and personalized news for you.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.normal,
          fontSize: appSetFontSize(16),
          height: 1.2,
        ),
      ),
    );
  }

  /// 特性说明
  /// 宽度 80 + 20 + 195 = 295
  Widget _buildFeatureItem(String imageName, String intro, double marginTop) {
    return Container(
      width: appSetWidth(295),
      height: appSetHeight(80),
      margin: EdgeInsets.only(top: appSetHeight(marginTop)),
      child: Row(
        children: [
          Container(
            width: appSetWidth(80),
            height: appSetWidth(80),
            child: Image.asset(
              "assets/images/$imageName.png",
              fit: BoxFit.none,
            ),
          ),
          Spacer(),
          Container(
            width: appSetWidth(195),
            child: Text(
              intro,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: appSetFontSize(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 开始按钮
  Widget _buildStartButton() {
    return Container(
      width: appSetWidth(295),
      height: appSetHeight(44),
      margin: EdgeInsets.only(
        bottom: appSetHeight(20),
      ),
      child: FlatButton(
        color: AppColors.primaryElement,
        textColor: AppColors.primaryElementText,
        child: Text("Get started"),
        shape: RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            "/sign-in",
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context,
    //     width: 375, height: 812 - 44 - 34, allowFontScaling: true);
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            _buildPageHeadTitle(),
            _buildPageHeadDetail(),
            _buildFeatureItem(
              "feature-1",
              "Compelling photography and typography provide a beautiful reading",
              86,
            ),
            _buildFeatureItem(
              "feature-2",
              "Sector news never shares your personal data with advertisers or publishers",
              40,
            ),
            _buildFeatureItem(
              "feature-3",
              "You can get Premium to unlock hundreds of publications",
              40,
            ),
            Spacer(),
            _buildStartButton(),
          ],
        ),
      ),
    );
  }
}
