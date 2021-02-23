class TokenPostEntity {
  String _deviceUid;
  String _pincode;
  int _userId;

  TokenPostEntity({String deviceUid, String pincode, int userId}) {
    this._deviceUid = deviceUid;
    this._pincode = pincode;
    this._userId = userId;
  }

  String get deviceUid => _deviceUid;
  set deviceUid(String deviceUid) => _deviceUid = deviceUid;
  String get pincode => _pincode;
  set pincode(String pincode) => _pincode = pincode;
  int get userId => _userId;
  set userId(int userId) => _userId = userId;

  TokenPostEntity.fromJson(Map<String, dynamic> json) {
    _deviceUid = json['device_uid'];
    _pincode = json['pincode'];
    _userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_uid'] = this._deviceUid;
    data['pincode'] = this._pincode;
    data['user_id'] = this._userId;
    return data;
  }
}
