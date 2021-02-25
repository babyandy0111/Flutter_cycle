import '../repositorys/config_repository.dart';
import '../models/response/config_entity.dart';
import '../../core/http/api_response.dart';

Future<String> getConfig() async {
  ApiResponse<ConfigEntity> entity = await ConfigRepository.getConfig();
  return entity.data.aesKey;
}