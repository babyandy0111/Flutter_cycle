import '../repositorys/config_repository.dart';
import '../models/response/config_entity.dart';
import '../../core/http/api_response.dart';

void getConfig() async {
  ApiResponse<ConfigEntity> entity = await ConfigRepository.getConfig();
  print(entity.data.aesKey);
}