import '../../core/http/api_response.dart';
import '../models/response/user_entity.dart';
import '../repositorys/user_repository.dart';

Future<UserEntity> getUser() async {
  ApiResponse<UserEntity> entity = await UserRepository.getUser(501);
  return entity.data;
}