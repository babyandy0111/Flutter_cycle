import 'package:flutter/material.dart';

Widget Post(BuildContext context, data) {
  return FadeInImage(
    image: data.length > 0 ? NetworkImage(data[0]) : AssetImage("assets/images/placeholder.png"),
    placeholder: AssetImage("assets/images/placeholder.png"),
    width: MediaQuery.of(context).size.width,
  );
}