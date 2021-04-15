class CheckPinCodeEntity {
  int _failTimes;
  int _status;
  int _userId;
  String _code;
  String _message;

  CheckPinCodeEntity({int failTimes, int status, int userId, String code, String message}) {
    this._failTimes = failTimes;
    this._status = status;
    this._userId = userId;
    this._code = code;
    this._message = message;
  }

  int get failTimes => _failTimes;
  set failTimes(int failTimes) => _failTimes = failTimes;
  int get status => _status;
  set status(int status) => _status = status;
  int get userId => _userId;
  set userId(int userId) => _userId = userId;

  String get code => _code;
  set code(String code) => _code = code;
  String get message => _message;
  set message(String message) => _message = message;

  CheckPinCodeEntity.fromJson(Map<String, dynamic> json) {
    _failTimes = json['fail_times'];
    _status = json['status'];
    _userId = json['user_id'];
    _code = json['code'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fail_times'] = this._failTimes;
    data['status'] = this._status;
    data['user_id'] = this._userId;
    data['status'] = this._code;
    data['user_id'] = this._message;
    return data;
  }
}
