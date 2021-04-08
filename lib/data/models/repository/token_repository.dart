import 'package:dio/dio.dart';
import 'package:indochat_officialaccount/core/config.dart';
import 'package:indochat_officialaccount/core/shared_preferences/sp.dart';
import 'package:indochat_officialaccount/data/models/request/token_post_entity.dart';
import 'package:indochat_officialaccount/core/http/api_response.dart';
import 'package:indochat_officialaccount/data/models/response/token_entity.dart';

class TokenRepository {
  static Future<ApiResponse<TokenEntity>> refreshToken() async {
    // TODO: 先改 call dev IM api
    // String path = TOKEN_BASE_URL + '/v1/api-token';
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
      p.pincode = await SpUtil().getPincode();
      p.deviceUid = await SpUtil().getDeviceUid();
      p.userId = await SpUtil().getUserId();
      var response = await tokenDio.post(path, data: p);
      var data = TokenEntity.fromJson(response.data);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }

  static Future<ApiResponse<TokenEntity>> officialToken() async {
    // TODO: 先 call dev IM api
    String path = IM_BASE_URL + '/v1/official-token';
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

      OfficialTokenPostEntity p = OfficialTokenPostEntity();
      p.userId = await SpUtil().getUserId();
      p.apiToken = await SpUtil().getToken();
      var response = await tokenDio.post(path, data: p);
      var data = TokenEntity.fromJson(response.data);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
