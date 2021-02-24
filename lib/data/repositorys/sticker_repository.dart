import 'package:dio/dio.dart';
import 'package:flutter_cycle/core/http/api_response.dart';
import 'package:flutter_cycle/core/config.dart';
import 'package:flutter_cycle/core/http/http_utils.dart';
import 'package:flutter_cycle/core/shared_preferences/sp.dart';
import 'package:flutter_cycle/data/entitys/request/home_sticker_picks_get_entity.dart';
import 'package:flutter_cycle/data/entitys/response/home_sticker_packs_entity.dart';

class StickerRepository {
  static Future<ApiResponse<HomeStickerPacksEntity>> getHomeStickerPacks() async {
    String path = STICKER_BASE_URL + '/v1/home-sticker-packs';
    try {
      HomeStickerPacksGetEntity p = HomeStickerPacksGetEntity();
      p.userId = await SpUtil().getUserId();
      final response = await HttpUtils.get(path, params: p.toJson());
      var data = HomeStickerPacksEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}