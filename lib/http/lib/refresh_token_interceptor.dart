import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:dio_retry_fixed/dio_retry_fixed.dart';
import 'package:flutter/material.dart';

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

    if (shouldRetry) {
      if (extra.retryInterval.inMilliseconds > 0) {
        await Future.delayed(extra.retryInterval);
      }

      // Update options to decrease retry count before new try
      extra = extra.copyWith(retries: extra.retries - 1);
      err.request.extra = err.request.extra..addAll(extra.toExtra());

      if (err.response?.statusCode == 401) {
        try {
          dio.interceptors.requestLock.lock();
          dio.interceptors.responseLock.lock();
          RequestOptions options = err.response.request;

          print("這邊要換token");

          dio.interceptors.requestLock.unlock();
          dio.interceptors.responseLock.unlock();
          // We retry with the updated options
          return await this.dio.request(
                err.request.path,
                cancelToken: err.request.cancelToken,
                data: err.request.data,
                onReceiveProgress: err.request.onReceiveProgress,
                onSendProgress: err.request.onSendProgress,
                queryParameters: err.request.queryParameters,
                options: err.request,
              );
        } catch (e) {
          return e;
        }
      }
    } else {
      return super.onError(err);
    }
  }
}
