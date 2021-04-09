// To parse this JSON data, do
//
//     final channelListEntity = channelListEntityFromJson(jsonString);

import 'dart:convert';

ChannelListEntity channelListEntityFromJson(String str) => ChannelListEntity.fromJson(json.decode(str));

String channelListEntityToJson(ChannelListEntity data) => json.encode(data.toJson());

class ChannelListEntity {
  ChannelListEntity({
    this.data,
    this.count,
  });

  List<Datum> data;
  int count;

  factory ChannelListEntity.fromJson(Map<String, dynamic> json) => ChannelListEntity(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "count": count,
  };
}

class Datum {
  Datum({
    this.title,
    this.subtitle,
    this.imageUrl,
  });

  String title;
  String subtitle;
  String imageUrl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    subtitle: json["subtitle"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "image_url": imageUrl,
  };
}
