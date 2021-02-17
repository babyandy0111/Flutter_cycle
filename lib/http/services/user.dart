import '../lib/api_response.dart';
import '../entitys/user_entity.dart';
import '../repositorys/user_repository.dart';

void getUser() async {
  ApiResponse<UserEntity> entity = await UserRepository.getUser(501);
  print(entity.data.phone);
}