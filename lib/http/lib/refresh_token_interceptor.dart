import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:dio_retry_fixed/dio_retry_fixed.dart';
import 'package:flutter/material.dart';
import '../../http/lib/sp.dart';

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

    shouldRetry = true;
    if (shouldRetry) {
      if (extra.retryInterval.inMilliseconds > 0) {
        await Future.delayed(extra.retryInterval);
      }

      // Update options to decrease retry count before new try
      extra = extra.copyWith(retries: extra.retries - 1);
      err.request.extra = err.request.extra..addAll(extra.toExtra());

      if (err.response?.statusCode == 401) {
        await SpUtil().refreshToken();
        print("這邊要換token");

        print("鎖");
        dio.lock();
        dio.interceptors.responseLock.lock();
        dio.interceptors.errorLock.lock();

        RequestOptions ops = err.response.request;
        String new_token = await SpUtil().getToken();
        print("換好 token: ${new_token}");
        ops.headers["Bearer"] = new_token;

        print("解鎖");
        dio.unlock();
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
