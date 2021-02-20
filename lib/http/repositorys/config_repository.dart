import 'package:dio/dio.dart';
import '../../http/entitys/config_entity.dart';
import '../../http/lib/sp.dart';
import '../entitys/config_get_entity.dart';
import '../../http/lib/http_utils.dart';
import '../../http/lib/api_response.dart';
import '../../http/entitys/user_entity.dart';

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
