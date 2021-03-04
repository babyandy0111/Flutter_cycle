import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cycle/pages/forgot_password/forgot_password.dart';
import 'package:flutter_cycle/pages/home_sticker_packs/home_sticker_packs.dart';
import 'package:flutter_cycle/pages/login_success/login_success.dart';
import 'package:flutter_cycle/pages/mqtt_demo/mqtt_demo.dart';
import 'package:flutter_cycle/pages/otp/otp.dart';
import 'package:flutter_cycle/pages/platform_channel_demo/platform_channel_demo.dart';
import 'package:flutter_cycle/pages/sign_in/sign_in.dart';
import 'package:flutter_cycle/pages/sign_up/sign_up.dart';
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

  SignUp.routeName: (context) => SignUp(),
  SignIn.routeName: (context) => SignIn(),
  LoginSuccess.routeName: (context) => LoginSuccess(),
  ForgotPassword.routeName: (context) => ForgotPassword(),

  HomeStickerPacks.routeName: (context) => HomeStickerPacks(),
  OtpDemo.routeName: (context) => OtpDemo(),
  MqttDemo.routeName: (context) => MqttDemo(),

  PlatformChannelDemo.routeName: (context) => PlatformChannelDemo(),
};
