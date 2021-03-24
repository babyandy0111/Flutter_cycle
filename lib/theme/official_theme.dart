import 'dart:ui';

import 'package:flutter/material.dart';

final AppBarTheme customAppBarTheme = AppBarTheme(
  color: Colors.white,
  textTheme: TextTheme(
    headline6: TextStyle(color: Colors.white, fontSize: 21.0),
  ),
);

final TextButtonThemeData customTextButtonThemeData = TextButtonThemeData(
  style: TextButton.styleFrom(
    primary: Colors.white,
    textStyle: TextStyle(fontSize: 16),
  ),
);