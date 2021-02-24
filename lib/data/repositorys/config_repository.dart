import 'package:dio/dio.dart';
import 'package:flutter_cycle/core/config.dart';
import '../models/response/config_entity.dart';
import '../../core/shared_preferences/sp.dart';
import '../models/request/config_get_entity.dart';
import '../../core/http/http_utils.dart';
import '../../core/http/api_response.dart';

class ConfigRepository {
  static Future<ApiResponse<ConfigEntity>> getConfig() async {
    String path = IM_BASE_URL + '/v1/app-config';
    try {
      ConfigGetEntity p = ConfigGetEntity();
      p.userId = await SpUtil().getUserId();
      p.deviceType = await SpUtil().getPlatform();
      p.sdkVersion = await SpUtil().getSDKVersion();
      final response = await HttpUtils.get(path, params: p.toJson());
      var data = ConfigEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
