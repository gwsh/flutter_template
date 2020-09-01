import 'package:flutter_template/common/entites/entitus.dart';
import 'package:flutter_template/common/utils/utils.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<UserResponseEntity> login({UserRequestEntity params}) async {
    var response = await HttpUtil().post('/user/login', params: params);
    return UserResponseEntity.fromJson(response);
  }
}
