import 'package:flutter_cycle/data/models/response/check-pincode-entity.dart';

import '../../core/http/api_response.dart';
import '../models/response/user_entity.dart';
import '../repositorys/user_repository.dart';

Future<UserEntity> getUser() async {
  ApiResponse<UserEntity> entity = await UserRepository.getUser(501);
  return entity.data;
}

Future<CheckPinCodeEntity> checkPinCode(phone, pincode) async {
  ApiResponse<CheckPinCodeEntity> entity = await UserRepository.checkPinCode(phone, pincode);
  return entity.data;
}