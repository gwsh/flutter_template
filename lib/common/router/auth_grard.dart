import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/common/router/router.gr.dart';
import 'package:flutter_template/common/utils/utils.dart';
import 'package:flutter_template/common/widgets/widgets.dart';
/// 守卫路由
class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState navigator, String routeName,
      Object arguments) async {
    /// 是否授权 没有授权往登录页面
    var isAuth = await isAuthenticated();
    if (isAuth == false) {
      toastInfo(msg: "你没有权限，请登录~");
      ExtendedNavigator.rootNavigator.pushNamed(Routes.signInPageRoute);
    }
    return isAuth;
  }
}
