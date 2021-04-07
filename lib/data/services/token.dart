import 'package:indochat_officialaccount/core/http/api_response.dart';
import 'package:indochat_officialaccount/data/models/response/token_entity.dart';
import 'package:indochat_officialaccount/data/models/repository/token_repository.dart';

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
