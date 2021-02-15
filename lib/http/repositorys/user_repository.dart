import 'package:dio/dio.dart';
import 'package:flutter_cycle/http/lib/api_response.dart';
import 'package:flutter_cycle/http/lib/http_utils.dart';
import 'package:flutter_cycle/http/models/user_entity.dart';

class UserRepository {
  static Future<ApiResponse<UserEntity>> getUser(int UserId) async {
    String path = '/v1/users/$UserId';
    try {
      final response = await HttpUtils.get(path);
      var data = UserEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
