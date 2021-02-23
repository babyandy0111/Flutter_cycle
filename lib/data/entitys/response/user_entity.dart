class UserEntity {
  int _id;
  String _email;
  int _isEmailValid;
  String _phone;
  String _deviceUid;
  String _nickname;
  String _avatarUrl;

  UserEntity(
      {int id,
        String email,
        int isEmailValid,
        String phone,
        String deviceUid,
        String nickname,
        String avatarUrl}) {
    this._id = id;
    this._email = email;
    this._isEmailValid = isEmailValid;
    this._phone = phone;
    this._deviceUid = deviceUid;
    this._nickname = nickname;
    this._avatarUrl = avatarUrl;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get email => _email;
  set email(String email) => _email = email;
  int get isEmailValid => _isEmailValid;
  set isEmailValid(int isEmailValid) => _isEmailValid = isEmailValid;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get deviceUid => _deviceUid;
  set deviceUid(String deviceUid) => _deviceUid = deviceUid;
  String get nickname => _nickname;
  set nickname(String nickname) => _nickname = nickname;
  String get avatarUrl => _avatarUrl;
  set avatarUrl(String avatarUrl) => _avatarUrl = avatarUrl;

  UserEntity.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _email = json['email'];
    _isEmailValid = json['is_email_valid'];
    _phone = json['phone'];
    _deviceUid = json['device_uid'];
    _nickname = json['nickname'];
    _avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['email'] = this._email;
    data['is_email_valid'] = this._isEmailValid;
    data['phone'] = this._phone;
    data['device_uid'] = this._deviceUid;
    data['nickname'] = this._nickname;
    data['avatar_url'] = this._avatarUrl;
    return data;
  }
}