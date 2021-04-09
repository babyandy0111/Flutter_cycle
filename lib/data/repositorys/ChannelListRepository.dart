import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:indochat_officialaccount/core/config.dart';
import '../../core/http/api_response.dart';
import '../../core/http/http_utils.dart';
import '../models/response/ChannelListEntity.dart';

// https://app.quicktype.io/

class ChannelListRepository {
  static String domain = BASE_URL;
  static Future<ApiResponse<ChannelListEntity>> getChannelList() async {
    String path = domain + '/api/flutter-test.php';
    try {
      final response = await HttpUtils.get(path);
      var data = channelListEntityFromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}