import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../lib/app_exceptions.dart';

/// 錯誤處理攔截
class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err) {
    // error統一處理
    AppException appException = AppException.create(err);
    // 錯誤提示
    debugPrint('DioError===: ${appException.toString()}');
    err.error = appException;
    return super.onError(err);
  }
}
