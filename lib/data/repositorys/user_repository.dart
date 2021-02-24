import 'package:dio/dio.dart';
import 'package:flutter_cycle/core/config.dart';
import '../../core/http/api_response.dart';
import '../../core/http/http_utils.dart';
import '../models/response/user_entity.dart';

class UserRepository {
  static String domain = IM_BASE_URL;
  static Future<ApiResponse<UserEntity>> getUser(int UserId) async {
    String path = domain + '/v1/users/$UserId';
    try {
      final response = await HttpUtils.get(path);
      var data = UserEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
