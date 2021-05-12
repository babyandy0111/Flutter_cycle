// To parse this JSON data, do
//
//     final channelsEntity = channelsEntityFromJson(jsonString);

import 'dart:convert';

ChannelsEntity channelsEntityFromJson(String str) => ChannelsEntity.fromJson(json.decode(str));

String channelsEntityToJson(ChannelsEntity data) => json.encode(data.toJson());

class ChannelsEntity {
  ChannelsEntity({
    this.avatarUrl,
    this.channelType,
    this.createdAt,
    this.id,
    this.message,
    this.name,
    this.topic,
    this.updatedAt,
    this.userIds,
  });

  String avatarUrl;
  String channelType;
  String createdAt;
  int id;
  Message message;
  String name;
  String topic;
  String updatedAt;
  List<int> userIds;

  factory ChannelsEntity.fromJson(Map<String, dynamic> json) => ChannelsEntity(
    avatarUrl: json["avatar_url"],
    channelType: json["channel_type"],
    createdAt: json["created_at"],
    id: json["id"],
    message: Message.fromJson(json["message"]),
    name: json["name"],
    topic: json["topic"],
    updatedAt: json["updated_at"],
    userIds: List<int>.from(json["user_ids"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "avatar_url": avatarUrl,
    "channel_type": channelType,
    "created_at": createdAt,
    "id": id,
    "message": message.toJson(),
    "name": name,
    "topic": topic,
    "updated_at": updatedAt,
    "user_ids": List<dynamic>.from(userIds.map((x) => x)),
  };
}

class Message {
  Message({
    this.channelId,
    this.clientMessageId,
    this.createdAt,
    this.id,
    this.isRetract,
    this.message,
    this.metadata,
    this.msgType,
    this.replyMessageId,
    this.senderId,
    this.updatedAt,
  });

  int channelId;
  String clientMessageId;
  String createdAt;
  int id;
  int isRetract;
  String message;
  String metadata;
  String msgType;
  int replyMessageId;
  int senderId;
  String updatedAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    channelId: json["channel_id"],
    clientMessageId: json["client_message_id"],
    createdAt: json["created_at"],
    id: json["id"],
    isRetract: json["is_retract"],
    message: json["message"],
    metadata: json["metadata"],
    msgType: json["msg_type"],
    replyMessageId: json["reply_message_id"],
    senderId: json["sender_id"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "channel_id": channelId,
    "client_message_id": clientMessageId,
    "created_at": createdAt,
    "id": id,
    "is_retract": isRetract,
    "message": message,
    "metadata": metadata,
    "msg_type": msgType,
    "reply_message_id": replyMessageId,
    "sender_id": senderId,
    "updated_at": updatedAt,
  };
}
