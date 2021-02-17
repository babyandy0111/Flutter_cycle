import 'package:dio/dio.dart';
import '../lib/api_response.dart';
import '../lib/http_utils.dart';
import '../entitys/user_entity.dart';

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
