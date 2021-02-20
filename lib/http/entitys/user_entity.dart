class UserEntity {
  int id;
  String email;
  int isEmailValid;
  String phone;
  String deviceUid;
  String nickname;
  String avatarUrl;

  UserEntity(
      {this.id,
        this.email,
        this.isEmailValid,
        this.phone,
        this.deviceUid,
        this.nickname,
        this.avatarUrl});

  UserEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    isEmailValid = json['is_email_valid'];
    phone = json['phone'];
    deviceUid = json['device_uid'];
    nickname = json['nickname'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['is_email_valid'] = this.isEmailValid;
    data['phone'] = this.phone;
    data['device_uid'] = this.deviceUid;
    data['nickname'] = this.nickname;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}