// To parse this JSON data, do
//
//     final groupChannelsEntity = groupChannelsEntityFromJson(jsonString);

import 'dart:convert';

GroupChannelsEntity groupChannelsEntityFromJson(String str) => GroupChannelsEntity.fromJson(json.decode(str));

String groupChannelsEntityToJson(GroupChannelsEntity data) => json.encode(data.toJson());

class GroupChannelsEntity {
  GroupChannelsEntity({
    this.channels,
  });

  List<Channel> channels;

  factory GroupChannelsEntity.fromJson(Map<String, dynamic> json) => GroupChannelsEntity(
    channels: List<Channel>.from(json["channels"].map((x) => Channel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "channels": List<dynamic>.from(channels.map((x) => x.toJson())),
  };
}

class Channel {
  Channel({
    this.avatarUrl,
    this.createdAt,
    this.id,
    this.name,
    this.topic,
    this.userIds,
  });

  String avatarUrl;
  String createdAt;
  int id;
  String name;
  String topic;
  List<int> userIds;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    avatarUrl: json["avatar_url"],
    createdAt: json["created_at"],
    id: json["id"],
    name: json["name"],
    topic: json["topic"],
    userIds: List<int>.from(json["user_ids"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "avatar_url": avatarUrl,
    "created_at": createdAt,
    "id": id,
    "name": name,
    "topic": topic,
    "user_ids": List<dynamic>.from(userIds.map((x) => x)),
  };
}
