import 'package:dio/dio.dart';
import '../entitys/response/config_entity.dart';
import '../../core/http/sp.dart';
import '../entitys/request/config_get_entity.dart';
import '../../core/http/http_utils.dart';
import '../../core/http/api_response.dart';

class ConfigRepository {
  static Future<ApiResponse<ConfigEntity>> getConfig() async {
    String path = '/v1/app-config';
    try {
      ConfigGetEntity p = ConfigGetEntity();
      p.userId = await SpUtil().getUserId();
      p.deviceType = await SpUtil().getPlatform();
      p.sdkVersion = await SpUtil().getSDKVersion();

      Map<String, dynamic> h = {
        "App-Version": "2.10.0",
        "Accept-Language": "en"
      };
      HttpUtils.setHeaders(h);
      final response = await HttpUtils.get(path, params: p.toJson());
      var data = ConfigEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
