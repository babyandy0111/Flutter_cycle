// To parse this JSON data, do
//
//     final channelMembersEntity = channelMembersEntityFromJson(jsonString);

import 'dart:convert';

ChannelMembersEntity channelMembersEntityFromJson(String str) => ChannelMembersEntity.fromJson(json.decode(str));

String channelMembersEntityToJson(ChannelMembersEntity data) => json.encode(data.toJson());

class ChannelMembersEntity {
  ChannelMembersEntity({
    this.members,
  });

  List<Member> members;

  factory ChannelMembersEntity.fromJson(Map<String, dynamic> json) => ChannelMembersEntity(
    members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
  };
}

class Member {
  Member({
    this.avatarUrl,
    this.lastReadMessageId,
    this.nickname,
    this.phone,
    this.userId,
  });

  String avatarUrl;
  int lastReadMessageId;
  String nickname;
  String phone;
  int userId;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    avatarUrl: json["avatar_url"],
    lastReadMessageId: json["last_read_message_id"],
    nickname: json["nickname"],
    phone: json["phone"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "avatar_url": avatarUrl,
    "last_read_message_id": lastReadMessageId,
    "nickname": nickname,
    "phone": phone,
    "user_id": userId,
  };
}
