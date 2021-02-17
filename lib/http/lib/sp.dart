import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/token.dart' as tokenService;

/// local cache
class SpUtil {
  static SpUtil _instance = new SpUtil._();

  factory SpUtil() => _instance;
  static SharedPreferences _prefs;

  SpUtil._();

  static Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    String jsonString = _prefs.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool val) {
    return _prefs.setBool(key, val);
  }

  bool getBool(String key) {
    bool val = _prefs.getBool(key);
    return val == null ? false : val;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  Future<String> getToken() async {
    if (_prefs.getString('token') == null) {
      return await refreshToken();
    } else {
      return _prefs.getString('token');
    }
  }

  Future<bool> setToken(token) async {
    return _prefs.setString('token', token);
  }

  Future<bool> setUserId(user_id) async {
    return _prefs.setInt('user_id', user_id);
  }

  Future<bool> setPinCode(pincode) async {
    return _prefs.setString('pincode', pincode);
  }

  Future<bool> setDeviceUid(device_uid) async {
    return _prefs.setString('device_uid', device_uid);
  }

  Future<String> refreshToken() async {
    String device_uid = _prefs.getString("device_uid");
    String pincode = _prefs.getString("pincode");
    int user_id = _prefs.getInt("user_id");
    var p = {"device_uid": device_uid, "pincode": pincode, "user_id": user_id};
    await tokenService.refreshToken(p).then((value) {
      setToken(value);
    });
  }
}
