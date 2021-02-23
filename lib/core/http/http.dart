import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_retry_fixed/dio_retry_fixed.dart';
import 'package:flutter_cycle/core/http/refresh_token_interceptor.dart';
import '../http/sp.dart';
import '../http/retry_interceptor.dart';
import '../../core/http/config.dart';
import '../../core/http/connectivity_request_retrier.dart';
import '../../core/http/error_interceptor.dart';
import '../http/net_cache.dart';

class Http {
  static Http _instance = Http._internal();

  factory Http() => _instance;

  Dio dio;
  CancelToken _cancelToken = new CancelToken();

  Http._internal() {
    if (dio == null) {
      // BaseOptions、Options、RequestOptions 都可以給予參數，參數部分都是後蓋前
      BaseOptions options = new BaseOptions(
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
        headers: {},
      );

      dio = new Dio(options);

      // 添加攔截器
      dio.interceptors.add(ErrorInterceptor());

      // 添加內存緩存
      dio.interceptors.add(NetCacheInterceptor());

      // 沒網路retry機制
      dio.interceptors.add(
        RetryOnConnectionChangeInterceptor(
          requestRetrier: DioConnectivityRequestRetrier(
            dio: dio,
            connectivity: Connectivity(),
          ),
        ),
      );

      // refreshtoken & retry
      dio.interceptors.add(RefreshTokenInterceptor(
        dio: dio,
        connectivity: Connectivity(),
          options: RetryOptions(
            retries: RETRY_API_NUM, // Number of retries before a failure
            retryInterval: Duration(seconds: RETRY_S), // Interval between each retry
            retryEvaluator: (error) => error.response.statusCode == 401,
          )
      ));

      // log
      dio.interceptors.add(LogInterceptor(
        request: HTTP_REQUEST_LOG,
        requestHeader: HTTP_REQUEST_HEADER_LOG,
        requestBody: HTTP_REQUEST_BODY_LOG,
        responseHeader: HTTP_RESPONSE_HEADER_LOG,
        responseBody: HTTP_RESPONSE_BODY_LOG,
        error: HTTP_ERROR_LOG,
      ));

      // 在debug模式下需要測試，可以使用代理，並且禁用https模式
      if (PROXY_ENABLE) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
          client.findProxy = (uri) {
            return "PROXY $PROXY_IP:$PROXY_PORT";
          };
          // 驗證https的部分一律返回true
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        };
      }
    }
  }

  ///初始化
  ///
  /// [baseUrl] 地址前綴
  /// [connectTimeout] 設定連接超時的時間
  /// [receiveTimeout] 響應超時的時間
  /// [interceptors] 基礎攔截器
  void init(
      {String baseUrl,
      int connectTimeout,
      int receiveTimeout,
      List<Interceptor> interceptors}) {
    dio.options = dio.options.merge(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  /// 設定headers
  void setHeaders(Map<String, dynamic> map) {
    dio.options.headers.addAll(map);
  }

  /*
   * 取消请求
   */
  void cancelRequests({CancelToken token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  /// 讀取本地配置
  Future<Map<String, dynamic>> getAuthorizationHeader() async {
    var headers;
    await SpUtil().getToken().then((String token) {
      headers = {"Bearer": '$token'};
    });
    return headers;
  }

  /// restful get 操作
  Future get(
    String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
    bool refresh = false,
    bool noCache = !CACHE_ENABLE,
    String cacheKey,
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.merge(extra: {
      "refresh": refresh,
      "noCache": noCache,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    Map<String, dynamic> _authorization = await getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    Response response;
    response = await dio.get(path,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// restful post 操作
  Future post(
    String path, {
    Map<String, dynamic> params,
    data,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = await getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    var response = await dio.post(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// restful put 操作
  Future put(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();

    Map<String, dynamic> _authorization = await getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    var response = await dio.put(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// restful patch 操作
  Future patch(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = await getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    var response = await dio.patch(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// restful delete 操作
  Future delete(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();

    Map<String, dynamic> _authorization = await getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    var response = await dio.delete(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// restful post form
  Future postForm(
    String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = await getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    var response = await dio.post(path,
        data: FormData.fromMap(params),
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }
}
