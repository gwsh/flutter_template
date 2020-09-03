import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/apis/provider_demo.dart';
import 'package:flutter_template/common/entites/entitys.dart';
import 'package:flutter_template/common/utils/utils.dart';
import 'package:flutter_template/common/values/server.dart';
import 'package:flutter_template/common/viewmodel/viewmodel.dart';

/// 这是状态的View
/// 典型的MVVM
class ProviderViewDemo extends BaseViewModel {
  ProviderDemoEntity entity;

  static ProviderDemoEntity decode(dynamic json) {
    return ProviderDemoEntity.fromJson(json);
  }

  getProviderEntity({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    state = BaseState.LOADING;
    notifyListeners();
    ProviderDemoAPI.getProviderEntity(
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      success: (json) {
        /// 开辟子线程
        compute(decode, json).then((value) {
          // if (value == null) {
          //   state = BaseState.EMPTY;
          // } else {
          //   entity = value;
          //   state = BaseState.CONTENT;
          // }
          state = BaseState.EMPTY;
          // state = BaseState.FAIL;
          notifyListeners();
        });
      },
      fail: (reason, statusCode) {
        state = BaseState.FAIL;
        notifyListeners();
      },
      after: () {},
    );
  }
}
