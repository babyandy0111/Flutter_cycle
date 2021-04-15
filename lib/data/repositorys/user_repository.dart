import 'package:dio/dio.dart';
import 'package:flutter_cycle/core/config.dart';
import 'package:flutter_cycle/core/shared_preferences/sp.dart';
import 'package:flutter_cycle/data/models/request/check-pincode-post-entity.dart';
import 'package:flutter_cycle/data/models/response/check-pincode-entity.dart';
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

  static Future<ApiResponse<CheckPinCodeEntity>> checkPinCode(phone, pincode) async {
    String path = domain + '/v1/users/check-pincode';
    try {
      CheckPinCodePostEntity p = CheckPinCodePostEntity();
      p.pincode = pincode;
      p.phone = phone;
      p.deviceUid = await SpUtil().getDeviceUid();
      final response = await HttpUtils.post(path, data: p.toJson());
      var data = CheckPinCodeEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
