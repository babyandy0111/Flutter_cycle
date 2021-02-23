import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';

import '../../data/entitys/request/token_post_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/services/token.dart' as tokenService;

/// local cache
/// https://zhuanlan.zhihu.com/p/133924017
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

  Future<String> getDeviceToken() async {
    return _prefs.getString('device_token');
  }

  Future<bool> setToken(token) async {
    return _prefs.setString('token', token);
  }

  Future<bool> setUserId(user_id) async {
    return _prefs.setString('user_id', user_id);
  }

  Future<bool> setPinCode(pincode) async {
    return _prefs.setString('pincode', pincode);
  }

  Future<bool> setDeviceUid(device_uid) async {
    return _prefs.setString('device_uid', device_uid);
  }

  Future<bool> setDeviceToken(device_token) async {
    return _prefs.setString('device_token', device_token);
  }

  Future<String> getUserId() async {
    return _prefs.getString('user_id');
  }

  Future<String> getPlatform() async {
    return _prefs.getString('platform');
  }

  Future<String> getSDKVersion() async {
    return _prefs.getString('sdk_version');
  }

  Future<void> setPlatform() async {

    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var manufacturer = androidInfo.manufacturer;
      var model = androidInfo.model;
      print('Android $release (SDK $sdkInt), $manufacturer $model');
      // Android 9 (SDK 28), Xiaomi Redmi Note 7
      _prefs.setString('sdk_version', release);
      return _prefs.setString('platform', 'A');
    }

    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var systemName = iosInfo.systemName;
      var version = iosInfo.systemVersion;
      var name = iosInfo.name;
      var model = iosInfo.model;
      print('$systemName $version, $name $model');
      // iOS 13.1, iPhone 11 Pro Max iPhone
      _prefs.setString('sdk_version', version);
      return _prefs.setString('platform', 'I');
    }

    return _prefs.setString('platform', '');
  }

  Future<String> refreshToken() async {
    TokenPostEntity p = TokenPostEntity();
    p.pincode =  _prefs.getString("pincode");
    p.deviceUid = _prefs.getString("device_uid");
    p.userId = _prefs.getInt("user_id");
    await tokenService.refreshToken(p.toJson()).then((value) {
      setToken(value);
    });
  }
}
