import 'package:dio/dio.dart';
import 'package:flutter_cycle/http/lib/config.dart';
import '../lib/api_response.dart';
import '../lib/http_utils.dart';
import '../entitys/token_entity.dart';

class TokenRepository {
  static Future<ApiResponse<TokenEntity>> refreshToken(p) async {
    String path = 'v1/api-token';
    try {
      BaseOptions options = new BaseOptions(
        baseUrl: IM_BASE_URL,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
        headers: {},
      );

      Dio tokenDio = new Dio(options);
      tokenDio.interceptors.add(LogInterceptor(
        request: HTTP_REQUEST_LOG,
        requestHeader: HTTP_REQUEST_HEADER_LOG,
        requestBody: HTTP_REQUEST_BODY_LOG,
        responseHeader: HTTP_RESPONSE_HEADER_LOG,
        responseBody: HTTP_RESPONSE_BODY_LOG,
        error: HTTP_ERROR_LOG,
      ));

      final response = await tokenDio.post(path, data: p);
      var data = TokenEntity.fromJson(response.data);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
