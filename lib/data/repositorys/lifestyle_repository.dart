import 'package:dio/dio.dart';
import 'package:flutter_cycle/core/http/api_response.dart';
import 'package:flutter_cycle/core/config.dart';
import 'package:flutter_cycle/core/http/http_utils.dart';
import 'package:flutter_cycle/core/shared_preferences/sp.dart';
import 'package:flutter_cycle/data/models/request/lifestyle_posts_get_entity.dart';
import 'package:flutter_cycle/data/models/response/lifestyle_posts_entity.dart';

class LifestyleRepository {
  static Future<ApiResponse<LifestylePostsEntity>> getLifestylePosts() async {
    String path = LIFESTYLE_BASE_URL + '/v1/posts';
    try {
      LifestylePostsGetEntity p = LifestylePostsGetEntity();
      p.userId = await SpUtil().getUserId();
      final response = await HttpUtils.get(path, params: p.toJson());
      var data = LifestylePostsEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}