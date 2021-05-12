import 'package:dio/dio.dart';
import 'package:flutter_cycle/core/http/api_response.dart';
import 'package:flutter_cycle/core/config.dart';
import 'package:flutter_cycle/core/http/http_utils.dart';
import 'package:flutter_cycle/core/shared_preferences/sp.dart';
import 'package:flutter_cycle/data/models/response/channel_members_entity.dart';

class ChannelMembersRepository {
  static Future<ApiResponse<ChannelMembersEntity>> getMembersList() async {
    String path = IM_BASE_URL + '/v1/channels/${await SpUtil().getUserId()}/members';

    try {
      final response = await HttpUtils.get(path);
      var data = ChannelMembersEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
