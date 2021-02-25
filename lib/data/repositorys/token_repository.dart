import 'package:dio/dio.dart';
import 'package:flutter_cycle/core/config.dart';
import 'package:flutter_cycle/core/shared_preferences/sp.dart';
import 'package:flutter_cycle/data/models/request/token_post_entity.dart';
import '../../core/http/api_response.dart';
import '../models/response/token_entity.dart';

class TokenRepository {
  static Future<ApiResponse<TokenEntity>> refreshToken() async {
    String path = IM_BASE_URL + '/v1/api-token';
    try {
      BaseOptions options = new BaseOptions(
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

      TokenPostEntity p = TokenPostEntity();
      p.pincode = await SpUtil().getPinCode();
      p.deviceUid = await SpUtil().getDeviceUid();
      p.userId = await SpUtil().getUserId();

      var response = await tokenDio.post(path, data: p);
      var data = TokenEntity.fromJson(response.data);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
