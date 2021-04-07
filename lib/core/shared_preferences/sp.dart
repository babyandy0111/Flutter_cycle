import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';
import 'package:indochat_officialaccount/data/models/request/token_post_entity.dart';
import 'package:indochat_officialaccount/data/services/token.dart' as tokenService;

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

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  Future<String> getPlatform() async {
    return _prefs.getString('platform');
  }

  Future<String> getDeviceUid() async {
    return _prefs.getString('device_uid');
  }

  Future<String> getPincode() async {
    return _prefs.getString('pincode');
  }

  Future<String> getPhone() async {
    return _prefs.getString('phone');
  }

  Future<int> getUserId() async {
    return _prefs.getInt('user_id');
  }

  Future<String> getAPPVersion() async {
    return _prefs.getString('app_version');
  }

  Future<String> getAPPLang() async {
    return _prefs.getString('lang');
  }

  Future<String> getToken() async {
    if (_prefs.getString('token') == null) {
      return await refreshToken();
    } else {
      return _prefs.getString('token');
    }
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
      return _prefs.setString('platform', 'I');
    }

    return _prefs.setString('platform', '');
  }

  Future<bool> setDeviceUid(deviceUid) async {
    return _prefs.setString('device_uid', deviceUid);
  }

  Future<bool> setPincode(pincode) async {
    return _prefs.setString('pincode', pincode);
  }

  Future<bool> setPhone(phone) async {
    return _prefs.setString('phone', phone);
  }

  Future<bool> setUserId(userId) async {
    return _prefs.setInt('user_id', userId);
  }

  Future<bool> setAPPVersion(appVersion) async {
    return _prefs.setString('app_version', appVersion);
  }

  Future<bool> setAPPLang(lang) async {
    return _prefs.setString('lang', lang);
  }

  Future<bool> setToken(token) async {
    return _prefs.setString('token', token);
  }

  Future<String> refreshToken() async {
    TokenPostEntity p = TokenPostEntity();
    p.pincode =  _prefs.getString("pincode");
    p.deviceUid = _prefs.getString("device_uid");
    p.userId = _prefs.getInt("user_id");
    print("Print: ${p.toJson()}");
    await tokenService.refreshToken(p.toJson()).then((value) {
      setToken(value);
    });
  }
}