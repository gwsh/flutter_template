import 'package:flutter_template/global.dart';

/// 全局Log日志
/// 只有在Dev环境下面才会打印
class AppLogUtil {
  /// Debug
  static void d(dynamic message, [dynamic error, StackTrace stackTrace]) {
    Global.logger.d(message, error, stackTrace);
  }

  /// Error
  static void e(dynamic message, [dynamic error, StackTrace stackTrace]) {
    Global.logger.e(message, error, stackTrace);
  }

  /// Info
  static void info(dynamic message, [dynamic error, StackTrace stackTrace]) {
    Global.logger.i(message, error, stackTrace);
  }

  /// WARN
  static void warn(dynamic message, [dynamic error, StackTrace stackTrace]) {
    Global.logger.w(message, error, stackTrace);
  }
}
