import 'package:dio/dio.dart';
import 'package:flutter_cycle/core/http/api_response.dart';
import 'package:flutter_cycle/core/config.dart';
import 'package:flutter_cycle/core/http/http_utils.dart';
import 'package:flutter_cycle/core/shared_preferences/sp.dart';
import 'package:flutter_cycle/data/models/response/chat_entity.dart';

class ChatRepository {
  static Future<ApiResponse<GroupChannelsEntity>> getChatList() async {
    String path = IM_BASE_URL + '/v1/users/${await SpUtil().getUserId()}/group-channels';
    try {
      final response = await HttpUtils.get(path);
      var data = GroupChannelsEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
