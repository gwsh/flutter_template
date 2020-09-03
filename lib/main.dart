import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/router/auth_grard.dart';
import 'package:flutter_template/common/router/router.gr.dart';
import 'package:provider/provider.dart';
import 'common/provider/provider.dart';
import 'global.dart';

void main() => Global.init().then(
      (e) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AppState>.value(
              value: Global.appState,
            ),
          ],
          child: Consumer<AppState>(builder: (context, appState, _) {
            if (appState.isGrayFilter) {
              // 清明节之类的灰度主题
              return ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
                child: MyApp(),
              );
            } else {
              return MyApp();
            }
          }),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '927cai.cn',
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator<AppRouter>(
        initialRoute: Routes.indexPageRoute,
        router: AppRouter(),
        // 权限守卫
        guards: [AuthGuard()],
      ),
    );
  }
}
