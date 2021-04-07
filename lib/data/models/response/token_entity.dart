class TokenEntity {
  final String expireAt;
  final String token;

  TokenEntity(this.expireAt, this.token);

  TokenEntity.fromJson(Map<String, dynamic> json)
      : expireAt = json['expire_at'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'expire_at': expireAt,
        'token': token,
      };
}
