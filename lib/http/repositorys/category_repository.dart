import 'package:dio/dio.dart';
import 'package:flutter_cycle/http/lib/api_response.dart';
import 'package:flutter_cycle/http/lib/http_utils.dart';
import 'package:flutter_cycle/http/models/category_entity.dart';

class GanRepository {
  static final String categories = "api/v2/categories/GanHuo";

  static Future<ApiResponse<CategoryEntity>> getCategories() async {
    try {
      final response = await HttpUtils.get(categories);
      var data = CategoryEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
