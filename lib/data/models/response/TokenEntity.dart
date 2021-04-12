class TokenEntity {
  final String expire_at;
  final String token;

  TokenEntity(this.expire_at, this.token);

  TokenEntity.fromJson(Map<String, dynamic> json)
      : expire_at = json['expire_at'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
    'expire_at': expire_at,
    'token': token,
  };
}