// To parse this JSON data, do
//
//     final channelsPostEntity = channelsPostEntityFromJson(jsonString);

import 'dart:convert';

ChannelsPostEntity channelsPostEntityFromJson(String str) => ChannelsPostEntity.fromJson(json.decode(str));

String channelsPostEntityToJson(ChannelsPostEntity data) => json.encode(data.toJson());

class ChannelsPostEntity {
  ChannelsPostEntity({
    this.avatarUrl,
    this.channelType,
    this.inviterId,
    this.name,
    this.topic,
    this.userIds,
  });

  String avatarUrl;
  String channelType;
  int inviterId;
  String name;
  String topic;
  List<int> userIds;

  factory ChannelsPostEntity.fromJson(Map<String, dynamic> json) => ChannelsPostEntity(
    avatarUrl: json["avatar_url"],
    channelType: json["channel_type"],
    inviterId: json["inviter_id"],
    name: json["name"],
    topic: json["topic"],
    userIds: List<int>.from(json["user_ids"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "avatar_url": avatarUrl,
    "channel_type": channelType,
    "inviter_id": inviterId,
    "name": name,
    "topic": topic,
    "user_ids": List<dynamic>.from(userIds.map((x) => x)),
  };
}
