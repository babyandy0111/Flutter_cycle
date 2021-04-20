import 'package:flutter_cycle/core/shared_preferences/sp.dart';

import '../../core/http/api_response.dart';
import '../models/response/token_entity.dart';
import '../repositorys/token_repository.dart';

Future<TokenEntity> refreshToken() async {
  ApiResponse<TokenEntity> entity = await TokenRepository.refreshToken();

  if (entity.data.token != null) {
    await SpUtil().setToken(entity.data.token);
  }

  return entity.data;
}
