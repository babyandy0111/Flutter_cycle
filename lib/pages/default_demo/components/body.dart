import 'package:flutter/material.dart';
import 'package:flutter_cycle/pages/backend_drive_ui_demo/backend_driven_ui.dart';
import 'package:flutter_cycle/pages/box_demo/box_demo.dart';
import 'package:flutter_cycle/pages/create_widget_to_json_demo/create_widget_to_json_demo.dart';
import 'package:flutter_cycle/pages/forgot_password/forgot_password.dart';
import 'package:flutter_cycle/pages/home_sticker_packs/home_sticker_packs.dart';
import 'package:flutter_cycle/pages/http_demo/http_demo.dart';
import 'package:flutter_cycle/pages/mqtt_demo/mqtt_demo.dart';
import 'package:flutter_cycle/pages/otp/otp.dart';
import 'package:flutter_cycle/pages/push_demo/push_demo.dart';
import 'package:flutter_cycle/pages/sign_in/sign_in.dart';
import 'package:flutter_cycle/pages/sign_up/sign_up.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FlatButton(
              color: Colors.amber,
              onPressed: () async {
                Navigator.pushNamed(context, BoxDemo.routeName);
              },
              child: Text("Box Demo")),
          FlatButton(
              color: Colors.amber,
              onPressed: () async {
                Navigator.pushNamed(context, HttpDemo.routeName);
              },
              child: Text("Http DEMO")),
          FlatButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, PushDemo.routeName);
              },
              child: Text("Push Demo")),
          FlatButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, BackendDriveUIDemo.routeName);
              },
              child: Text("backend drive ui Demo")),
          FlatButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, CreateWtoJson.routeName);
              },
              child: Text("create widget demo")),
          FlatButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, SignIn.routeName);
              },
              child: Text("sign in")),
          FlatButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, SignUp.routeName);
              },
              child: Text("sign up")),
          FlatButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, ForgotPassword.routeName);
              },
              child: Text("forget password")),
          FlatButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, HomeStickerPacks.routeName);
              },
              child: Text("sticker home")),
          FlatButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, OtpDemo.routeName);
              },
              child: Text("otp verify")),
          FlatButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, MqttDemo.routeName);
              },
              child: Text("mqtt")),
        ],
      ),
    );
  }
}
