import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pages/create_widget_to_json_demo/create_widget_to_json_demo.dart';
import 'pages/default_demo/default_demo.dart';
import 'pages/http_demo/http_demo.dart';
import 'pages/push_demo/push_demo.dart';
import 'pages/backend_drive_ui_demo/backend_driven_ui.dart';
import 'pages/box_demo/box_demo.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  BoxDemo.routeName: (context) => BoxDemo(),
  HttpDemo.routeName: (context) => HttpDemo(),
  PushDemo.routeName: (context) => PushDemo(),
  BackendDriveUIDemo.routeName:(context) => BackendDriveUIDemo(),
  CreateWtoJson.routeName:(context) => CreateWtoJson(),
  DefaultDemo.routeName:(context) => DefaultDemo(),
};
