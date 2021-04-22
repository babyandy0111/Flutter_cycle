// class TokenEntity {
//   final String expire_at;
//   final String token;
//
//   TokenEntity(this.expire_at, this.token);
//
//   TokenEntity.fromJson(Map<String, dynamic> json)
//       : expire_at = json['expire_at'],
//         token = json['token'];
//
//   Map<String, dynamic> toJson() => {
//         'expire_at': expire_at,
//         'token': token,
//       };
// }


class chatEntity {
  final String expire_at;
  final String token;

  List _channels;
  String _avatarUrl;
  String _createdAt;
  int _id;
  String _name;
  String _topic;
  List _userIds;


  // chatEntity(
  //     {
  //       String avatarUrl,
  //       String createdAt,
  //       int id,
  //       String name,
  //       String topic,
  //       List userIds,
  //     }
  // ){
  //   this._avatarUrl = avatarUrl;
  //   this._createdAt = createdAt;
  //   this._id = id;
  //   this._name = name;
  //   this._topic = topic;
  //   this._userIds = userIds;
  //
  // }




  chatEntity.fromJson(Map<String, dynamic> json)
      : expire_at = json['expire_at'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'expire_at': expire_at,
        'token': token,
      };
}


// {
// "channels": [
// {
// "avatar_url": "string",
// "created_at": "string",
// "id": 0,
// "name": "string",
// "topic": "string",
// "user_ids": [
// 0
// ]
// }
// ]
// }