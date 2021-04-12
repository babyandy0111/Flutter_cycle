import 'package:indochat_officialaccount/data/models/response/TokenEntity.dart';
import 'package:indochat_officialaccount/data/repositorys/TokenRepository.dart';
import '../../core/http/api_response.dart';

Future<String> refreshToken(Map<String, Object> p) async {
  ApiResponse<TokenEntity> entity = await TokenRepository.refreshToken();
  var token = entity.data.token;
  // print(entity.data.token);
  // print(entity.data.expire_at);
  if (token != null) {
    return token;
  }
  return null;
}