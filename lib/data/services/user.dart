import 'package:flutter_cycle/core/shared_preferences/sp.dart';
import 'package:flutter_cycle/data/models/response/check_pincode_entity.dart';

import '../../core/http/api_response.dart';
import '../models/response/user_entity.dart';
import '../repositorys/user_repository.dart';

Future<UserEntity> getUser() async {
  int userid = await SpUtil().getUserId();
  ApiResponse<UserEntity> entity = await UserRepository.getUser(userid);
  return entity.data;
}

Future<CheckPinCodeEntity> checkPinCode(phone, pincode) async {
  ApiResponse<CheckPinCodeEntity> entity = await UserRepository.checkPinCode(phone, pincode);
  return entity.data;
}