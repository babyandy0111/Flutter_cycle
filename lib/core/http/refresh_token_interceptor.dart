import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:dio_retry_fixed/dio_retry_fixed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cycle/data/models/request/token_post_entity.dart';
import 'package:flutter_cycle/data/models/response/token_entity.dart';
import 'package:flutter_cycle/data/services/token.dart';
import '../shared_preferences/sp.dart';
import 'api_response.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;
  final Connectivity connectivity;
  final RetryOptions options;

  RefreshTokenInterceptor(
      {@required this.dio, this.connectivity, RetryOptions options})
      : this.options = options ?? const RetryOptions();

  @override
  Future onError(DioError err) async {
    var extra = RetryOptions.fromExtra(err.request) ?? this.options;
    var shouldRetry = extra.retries > 0 && await options.retryEvaluator(err);
    String oldtoken = await SpUtil().getToken();

    if (shouldRetry && oldtoken != null) {
      if (extra.retryInterval.inMilliseconds > 0) {
        await Future.delayed(extra.retryInterval);
      }

      // Update options to decrease retry count before new try
      extra = extra.copyWith(retries: extra.retries - 1);
      err.request.extra = err.request.extra..addAll(extra.toExtra());
      RequestOptions ops = err.response.request;

      // 這裡好像可以不需要, 先拿掉
      // if (oldtoken != ops.headers["Bearer"]) {
      //   ops.headers["Bearer"] = oldtoken;
      //   //repeat
      //   return dio.request(
      //     err.request.path,
      //     cancelToken: err.request.cancelToken,
      //     data: err.request.data,
      //     onReceiveProgress: err.request.onReceiveProgress,
      //     onSendProgress: err.request.onSendProgress,
      //     queryParameters: err.request.queryParameters,
      //     options: err.request,
      //   );
      // }

      if (err.response?.statusCode == 401) {
        print("鎖");
        dio.lock();
        dio.interceptors.requestLock.lock();
        dio.interceptors.responseLock.lock();
        dio.interceptors.errorLock.lock();

        TokenEntity entity = await refreshToken();
        ops.headers["Bearer"] = entity.token;
        print("換好 token: ${entity.token}");

        print("解鎖");
        dio.unlock();
        dio.interceptors.requestLock.unlock();
        dio.interceptors.responseLock.unlock();
        dio.interceptors.errorLock.unlock();
      }

      return dio.request(
        err.request.path,
        cancelToken: err.request.cancelToken,
        data: err.request.data,
        onReceiveProgress: err.request.onReceiveProgress,
        onSendProgress: err.request.onSendProgress,
        queryParameters: err.request.queryParameters,
        options: err.request,
      );
    } else {
      return super.onError(err);
    }
  }
}
