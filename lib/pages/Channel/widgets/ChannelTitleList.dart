import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/data/models/response/ChannelListEntity.dart';

Widget getListTitle(index, ChannelListEntity data) {
  return ListTile(
    leading: Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                  "https://assets.indochat.net/" + data.data[index].imageUrl),
              fit: BoxFit.contain)),
    ),
    title: Text(
      data.data[index].title,
      style: TextStyle(
        color: Color.fromRGBO(29, 53, 87, 1),
        fontSize: 18.0,
      ),
    ),
    subtitle: Text(
      data.data[index].subtitle,
      style: TextStyle(
        color: Color.fromRGBO(255, 150, 156, 1),
        fontSize: 16.0,
      ),
    ),
  );
}
