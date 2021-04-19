import 'dart:convert';

ChannelSettingsEntity channelSettingsEntityFromJson(String str) => ChannelSettingsEntity.fromJson(json.decode(str));

String channelSettingsEntityToJson(ChannelSettingsEntity data) => json.encode(data.toJson());

class ChannelSettingsEntity {
  ChannelSettingsEntity({
    this.data,
  });

  List<Datum> data;

  factory ChannelSettingsEntity.fromJson(Map<String, dynamic> json) => ChannelSettingsEntity(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
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
