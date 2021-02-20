import 'package:flutter_cycle/http/repositorys/config_repository.dart';

import '../../http/entitys/config_entity.dart';
import '../../http/lib/api_response.dart';

void getConfig() async {
  ApiResponse<ConfigEntity> entity = await ConfigRepository.getConfig();
  print(entity.data.aesKey);
}