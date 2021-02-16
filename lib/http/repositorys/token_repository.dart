import 'package:dio/dio.dart';
import '../lib/api_response.dart';
import '../lib/http_utils.dart';
import '../models/token_entity.dart';

class TokenRepository {
  static Future<ApiResponse<TokenEntity>> refreshToken(p) async {
    String path = '/v1/api-token';
    try {
      final response = await HttpUtils.post(path, data: p);
      var data = TokenEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
