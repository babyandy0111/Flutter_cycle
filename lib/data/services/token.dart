import '../../core/http/api_response.dart';
import '../entitys/response/token_entity.dart';
import '../repositorys/token_repository.dart';

Future<String> refreshToken(Map<String, Object> p) async {
  ApiResponse<TokenEntity> entity = await TokenRepository.refreshToken(p);
  var token = entity.data.token;
  // print(entity.data.token);
  // print(entity.data.expire_at);
  if (token != null) {
    return token;
  }
  return null;
}
