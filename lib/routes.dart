import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pages/Home/index.dart';
import 'pages/Login/index.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
};

final Map<String, WidgetBuilder> internalRoutes = {
  LoginPage.routeName: (context) => LoginPage(),
};
