import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'layouts/MainLayout.dart';
import 'pages/Home/HomePage.dart';
import 'pages/Login/LoginPage.dart';
import 'pages/Settings/SettingsPage.dart';
import 'pages/CreateChannel/CreateChannelPage.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  MainLayout.routeName: (context) => MainLayout(),
  HomePage.routeName: (context) => HomePage(),
  LoginPage.routeName: (context) => LoginPage(),
  SettingsPage.routeName: (context) => SettingsPage(),
  CreateChannelPage.routeName: (context) => CreateChannelPage(),
};
