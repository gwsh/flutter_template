import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/utils/utils.dart';
import 'package:flutter_template/common/values/server.dart';
import 'package:flutter_template/common/values/values.dart';

typedef Success = void Function(dynamic json);

typedef Fail = void Function(String reason, int code);

typedef After = void Function();

class ProviderDemoAPI {
  static Future getProviderEntity(
      {@required BuildContext context,
      bool refresh = false,
      bool cacheDisk = false,
      Success success,
      Fail fail,
      After after}) async {
    var response = await HttpUtil().get(
      PROVIDER_DEMO_URL,
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_PROVIDER_DEMO_CACHE_KEY,
      success: success,
      fail: fail,
      after: after,
    );
    return response;
  }
}
