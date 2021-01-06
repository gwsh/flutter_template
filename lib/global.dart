import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/common/entites/entitys.dart';
import 'package:logger/logger.dart';
import 'common/provider/provider.dart';
import 'common/utils/utils.dart';
import 'common/values/values.dart';

/// pro环境：生产环境，面向外部用户的环境，连接上互联网即可访问的正式环境。
/// pre环境：灰度环境，外部用户可以访问，但是服务器配置相对低，其它和生产一样。
/// test环境：测试环境，外部用户无法访问，专门给测试人员使用的，版本相对稳定。
/// dev环境：开发环境，外部用户无法访问，开发人员使用，版本变动很大。
enum ModelType {
  dev,
  pro,
  pre,
  test,
}

/// 全局配置
class Global {
  /// 用户配置 全局可以拿到用户信息
  static UserLoginResponseEntity profile = UserLoginResponseEntity(
    accessToken: null,
  );

  /// 预计整合日志系统(dev环境才会显示日志) 和BASE_URL
  static ModelType modelType = ModelType.pro;

  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 应用状态
  static AppState appState = AppState();

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// 全局日志
  ///
  static Logger logger;

  /// 暴露的初始化方法 init
  static Future init({ModelType type = ModelType.pro}) async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    modelType = type;

    logger = _createLogger();

    // 工具初始
    await StorageUtil.init();
    HttpUtil();

    // 读取设备第一次打开
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    // 读取离线用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserLoginResponseEntity.fromJson(_profileJSON);
      isOfflineLogin = true;
    }

    // http 缓存

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      //设置Android头部的导航栏透明
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, //全局设置透明
          statusBarIconBrightness: Brightness.dark
          //light:黑色图标 dark：白色图标
          //在此处设置statusBarIconBrightness为全局设置
          );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  // 持久化 用户信息
  static Future<bool> saveProfile(UserLoginResponseEntity userResponse) {
    profile = userResponse;
    return StorageUtil()
        .setJSON(STORAGE_USER_PROFILE_KEY, userResponse.toJson());
  }

  static Logger _createLogger() {
    Logger logger = Logger(
        printer: PrettyPrinter(
      printTime: true,
    ));
    Logger.level = Level.debug;
    return logger;
  }
}
