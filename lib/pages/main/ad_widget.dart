import 'package:flutter/material.dart';
import 'package:flutter_template/common/utils/utils.dart';
import 'package:flutter_template/common/values/values.dart';

/// ad广告
Widget adWidget() {
  return Container(
    alignment: Alignment.center,
    height: appSetHeight(100),
    padding: EdgeInsets.all(appSetWidth(20)),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: appSetWidth(20)),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(Borders.primaryBorder),
        borderRadius: Radii.k6pxRadius,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tired of Ads? Get Premium - \$9.99",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: appSetFontSize(18),
            ),
          ),
        ],
      ),
    ),
  );
}
