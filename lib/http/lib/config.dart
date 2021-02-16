import 'package:shared_preferences/shared_preferences.dart';
import '../api/token.dart' as tokenApi;

/// 全局配置
class Config {
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.get('token') == null) {
      return await refreshToken();
    } else {
      return prefs.get('token');
    }
  }

  Future<bool> setToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  Future<bool> setUserId(user_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt('user_id', user_id);
  }

  Future<bool> setPinCode(pincode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('pincode', pincode);
  }

  Future<bool> setDeviceUid(device_uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('device_uid', device_uid);
  }

  Future<String> refreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String device_uid = prefs.getString("device_uid");
    String pincode = prefs.getString("pincode");
    int user_id = prefs.getInt("user_id");
    var p = {"device_uid": device_uid, "pincode": pincode, "user_id": user_id};
    return tokenApi.refreshToken(p);
  }
}
