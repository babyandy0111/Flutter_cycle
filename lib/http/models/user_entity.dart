class UserEntity {
  final int id;
  final String email;
  final int is_email_valid;
  final String phone;
  final String device_uid;
  final String nickname;
  final String avatar_url;

  UserEntity(this.id, this.email, this.is_email_valid, this.phone,
      this.device_uid, this.nickname, this.avatar_url);

  UserEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        is_email_valid = json['is_email_valid'],
        phone = json['phone'],
        device_uid = json['device_uid'],
        nickname = json['nickname'],
        avatar_url = json['avatar_url'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'is_email_valid': is_email_valid,
        'phone': phone,
        'device_uid': device_uid,
        'nickname': nickname,
        'avatar_url': avatar_url,
      };
}

/*
{
"id": 501,
"email": "wen.chang+3@indochat.co.id",
"is_email_valid": 1,
"phone": "+886973701001",
"device_uid": "123456",
"nickname": "wenwen🙃",
"avatar_url": ""
}*/
