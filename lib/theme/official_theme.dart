import 'package:flutter/material.dart';

final Color primaryColor = Color.fromRGBO(255, 90, 90, 1);
final Color primaryAccentColor = Color.fromRGBO(255, 144, 114, 1);

appBarTitle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 21.0,
    fontWeight: FontWeight.bold,
  );
}

final TextButtonThemeData customTextButtonThemeData = TextButtonThemeData(
  style: TextButton.styleFrom(
    primary: Colors.white,
    textStyle: TextStyle(fontSize: 16),
  ),
);
