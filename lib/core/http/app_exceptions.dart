import 'package:dio/dio.dart';

/// 自定義error
class AppException implements Exception {
  final String _message;
  final int _code;

  AppException([
    this._code,
    this._message,
  ]);

  String toString() {
    return "$_code$_message";
  }

  factory AppException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return BadRequestException(-1, "取消請求");
        }
        break;
      case DioErrorType.connectTimeout:
        {
          return BadRequestException(-1, "連線超時");
        }
        break;
      case DioErrorType.sendTimeout:
        {
          return BadRequestException(-1, "請求超時");
        }
        break;
      case DioErrorType.receiveTimeout:
        {
          return BadRequestException(-1, "響應超時");
        }
        break;
      case DioErrorType.response:
        {
          try {
            int errCode = error.response.statusCode;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
                {
                  return BadRequestException(errCode, "請求語法錯誤");
                }
                break;
              case 401:
                {
                  return UnauthorisedException(errCode, "沒有權限");
                }
                break;
              case 403:
                {
                  return UnauthorisedException(errCode, "服務器拒絕執行");
                }
                break;
              case 404:
                {
                  return UnauthorisedException(errCode, "無法連接伺服器");
                }
                break;
              case 405:
                {
                  return UnauthorisedException(errCode, "請求方法被禁止");
                }
                break;
              case 500:
                {
                  return UnauthorisedException(errCode, "服务器内部错误");
                }
                break;
              case 502:
                {
                  return UnauthorisedException(errCode, "無效的請求");
                }
                break;
              case 503:
                {
                  return UnauthorisedException(errCode, "服務器掛了");
                }
                break;
              case 505:
                {
                  return UnauthorisedException(errCode, "不支持的http請求協定");
                }
                break;
              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知錯誤");
                  return AppException(errCode, error.response.statusMessage);
                }
            }
          } on Exception catch (_) {
            return AppException(-1, "未知錯誤");
          }
        }
        break;
      default:
        {
          return AppException(-1, error.message);
        }
    }
  }
}

/// 請求錯誤
class BadRequestException extends AppException {
  BadRequestException([int code, String message]) : super(code, message);
}

/// 為認證異常
class UnauthorisedException extends AppException {
  UnauthorisedException([int code, String message]) : super(code, message);
}
