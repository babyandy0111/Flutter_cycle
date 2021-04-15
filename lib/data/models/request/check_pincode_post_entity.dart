class CheckPinCodePostEntity {
  String _deviceUid;
  String _phone;
  String _pincode;

  CheckPinCodePostEntity({String deviceUid, String phone, String pincode}) {
    this._deviceUid = deviceUid;
    this._phone = phone;
    this._pincode = pincode;
  }

  String get deviceUid => _deviceUid;
  set deviceUid(String deviceUid) => _deviceUid = deviceUid;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get pincode => _pincode;
  set pincode(String pincode) => _pincode = pincode;

  CheckPinCodePostEntity.fromJson(Map<String, dynamic> json) {
    _deviceUid = json['device_uid'];
    _phone = json['phone'];
    _pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_uid'] = this._deviceUid;
    data['phone'] = this._phone;
    data['pincode'] = this._pincode;
    return data;
  }
}
