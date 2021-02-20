class ConfigGetEntity {
  String _userId;
  String _deviceType;
  String _sdkVersion;

  ConfigGetEntity({String userId, String deviceType, String sdkVersion}) {
    this._userId = userId;
    this._deviceType = deviceType;
    this._sdkVersion = sdkVersion;
  }

  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get deviceType => _deviceType;
  set deviceType(String deviceType) => _deviceType = deviceType;
  String get sdkVersion => _sdkVersion;
  set sdkVersion(String sdkVersion) => _sdkVersion = sdkVersion;

  ConfigGetEntity.fromJson(Map<String, dynamic> json) {
    _userId = json['user_id'];
    _deviceType = json['device_type'];
    _sdkVersion = json['sdk_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this._userId;
    data['device_type'] = this._deviceType;
    data['sdk_version'] = this._sdkVersion;
    return data;
  }
}
