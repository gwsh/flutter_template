import 'package:flutter/material.dart';
import 'package:flutter_template/common/provider/provider_widget.dart';

/// 封装基础的ViewModel
/// 切记不是所有地方都需要状态管理
/// 状态管理是有代价的 还是需要根据自身的业务自行选择合适的地方
/// @see [ProviderWidget] 这个类会管理所有集成自 ChangeNotifier
/// 也就是若业务需求管理状态 则他的ViewModel 需要集成自[BaseViewModel]
class BaseViewModel extends ChangeNotifier {
  BaseState state;
}

/// 请求数据可能出现的常见四种情况
/// 让页面展示不同的类容
enum BaseState {
  LOADING,
  EMPTY,
  CONTENT,
  FAIL,
}
