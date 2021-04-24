import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';

import '../../data/models/request/token_post_entity.dart';
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
    return _prefs.getString('token');
  }

  Future<String> getDeviceToken() async {
    return _prefs.getString('device_token');
  }

  Future<bool> setToken(token) async {
    return _prefs.setString('token', token);
  }

  Future<bool> removeToken(token) async {
    return _prefs.remove('token');
  }

  getIsLogin() {
    return _prefs.getString('islogin');
  }

  Future<bool> setIsLogin() async {
    return _prefs.setString('islogin', "1");
  }

  Future<bool> logout() async {
    _prefs.remove("user_id");
    _prefs.remove("pincode");
    _prefs.remove("phone");
    _prefs.remove("device_uid");
    _prefs.remove("device_token");
    return _prefs.remove('islogin');
  }

  Future<bool> setUserId(user_id) async {
    return _prefs.setInt('user_id', user_id);
  }

  Future<bool> setPinCode(pincode) async {
    return _prefs.setString('pincode', pincode);
  }

  Future<bool> setPhone(phone) async {
    return _prefs.setString('phone', phone);
  }

  Future<bool> setDeviceUid(device_uid) async {
    return _prefs.setString('device_uid', device_uid);
  }

  Future<bool> setDeviceToken(device_token) async {
    return _prefs.setString('device_token', device_token);
  }

  Future<bool> setAPPVersion(app_version) async {
    return _prefs.setString('app_version', app_version);
  }

  Future<bool> setAPPLang(lang) async {
    return _prefs.setString('lang', lang);
  }

  Future<String> getAPPLang() async {
    return _prefs.getString('lang');
  }

  Future<String> getPinCode() async {
    return _prefs.getString('pincode');
  }

  Future<String> getDeviceUid() async {
    return _prefs.getString('device_uid');
  }

  Future<int> getUserId() async {
    return _prefs.getInt('user_id');
  }

  Future<String> getPhone() async {
    return _prefs.getString('phone');
  }

  Future<String> getPlatform() async {
    return _prefs.getString('platform');
  }

  Future<String> getSDKVersion() async {
    return _prefs.getString('sdk_version');
  }

  Future<String> getAPPVersion() async {
    return _prefs.getString('app_version');
  }

  Future<void> setPlatform() async {

    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var manufacturer = androidInfo.manufacturer;
      var model = androidInfo.model;
      var uuid = androidInfo.androidId;
      print('Android $release (SDK $sdkInt), $manufacturer $model, (uuid $uuid)');
      // Android 9 (SDK 28), Xiaomi Redmi Note 7
      _prefs.setString('sdk_version', release);
      setDeviceUid(uuid);
      return _prefs.setString('platform', 'A');
    }

    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var systemName = iosInfo.systemName;
      var version = iosInfo.systemVersion;
      var name = iosInfo.name;
      var model = iosInfo.model;
      var uuid = iosInfo.identifierForVendor;
      print('$systemName $version, $name $model, uuid $uuid');
      // iOS 13.1, iPhone 11 Pro Max iPhone
      _prefs.setString('sdk_version', version);
      setDeviceUid(uuid);
      return _prefs.setString('platform', 'I');
    }

    return _prefs.setString('platform', '');
  }

  setTestAccount() async {
    // 這邊是Andy帳號
    await SpUtil().setDeviceUid("34AC2FF4-83B5-4C94-B0F7-8CAC503E4A54");
    await SpUtil().setPinCode("740111");
    await SpUtil().setPhone("+628710000002");
    await SpUtil().setUserId(3);
    await SpUtil().setIsLogin();
    return true;
  }
}
