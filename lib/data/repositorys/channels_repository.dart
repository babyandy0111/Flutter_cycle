import 'package:dio/dio.dart';
import 'package:flutter_cycle/core/http/api_response.dart';
import 'package:flutter_cycle/core/config.dart';
import 'package:flutter_cycle/core/http/http_utils.dart';
import 'package:flutter_cycle/core/shared_preferences/sp.dart';
import 'package:flutter_cycle/data/models/response/channels_entity.dart';

class ChannelsRepository {
  static Future<ApiResponse<ChannelsEntity>> postChannelsList() async {
    String path = IM_BASE_URL + '/v1/channels';

    try {
      final response = await HttpUtils.post(path);
      var data = ChannelsEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
