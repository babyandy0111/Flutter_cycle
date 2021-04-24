import 'package:flutter/material.dart';
import 'package:flutter_cycle/pages/backend_drive_ui_demo/backend_driven_ui.dart';
import 'package:flutter_cycle/pages/box_demo/box_demo.dart';
import 'package:flutter_cycle/pages/create_widget_to_json_demo/create_widget_to_json_demo.dart';
import 'package:flutter_cycle/pages/forgot_password/forgot_password.dart';
import 'package:flutter_cycle/pages/home_sticker_packs/home_sticker_packs.dart';
import 'package:flutter_cycle/pages/http_demo/http_demo.dart';
import 'package:flutter_cycle/pages/media_picker/media_picker.dart';
import 'package:flutter_cycle/pages/mqtt_demo/mqtt_demo.dart';
import 'package:flutter_cycle/pages/otp/otp.dart';
import 'package:flutter_cycle/pages/platform_channel_demo/platform_channel_demo.dart';
import 'package:flutter_cycle/pages/push_demo/push_demo.dart';
import 'package:flutter_cycle/pages/sign_in/sign_in.dart';
import 'package:flutter_cycle/pages/sign_up/sign_up.dart';
import 'package:flutter_cycle/pages/sql_demo/sql_demo.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Center(
        child: Column(
          children: [
            FlatButton(
                color: Colors.amber,
                onPressed: () async {
                  pushNewScreen(context, screen: BoxDemo());
                  // Navigator.pushNamed(context, BoxDemo.routeName);
                },
                child: Text("Box Demo")),
            FlatButton(
                color: Colors.amber,
                onPressed: () async {
                  pushNewScreen(context, screen: HttpDemo());
                  // Navigator.pushNamed(context, HttpDemo.routeName);
                },
                child: Text("Http DEMO")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  pushNewScreen(context, screen: PushDemo());
                  // Navigator.pushNamed(context, PushDemo.routeName);
                },
                child: Text("Push Demo")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  pushNewScreen(context, screen: BackendDriveUIDemo(),);
                  // Navigator.pushNamed(context, BackendDriveUIDemo.routeName);
                },
                child: Text("backend drive ui Demo")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  pushNewScreen(context, screen: CreateWtoJson());
                  // Navigator.pushNamed(context, CreateWtoJson.routeName);
                },
                child: Text("create widget demo")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  pushNewScreen(context, screen: SignIn());
                  // Navigator.pushNamed(context, SignIn.routeName);
                },
                child: Text("sign in")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  pushNewScreen(context, screen: SignUp());
                  // Navigator.pushNamed(context, SignUp.routeName);
                },
                child: Text("sign up")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  pushNewScreen(context, screen: ForgotPassword());
                  // Navigator.pushNamed(context, ForgotPassword.routeName);
                },
                child: Text("forget password")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  pushNewScreen(context, screen: HomeStickerPacks());
                  // Navigator.pushNamed(context, HomeStickerPacks.routeName);
                },
                child: Text("sticker home")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  pushNewScreen(context, screen: OtpDemo());
                  //Navigator.pushNamed(context, OtpDemo.routeName);
                },
                child: Text("otp verify")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  pushNewScreen(context, screen: MqttDemo());
                  // Navigator.pushNamed(context, MqttDemo.routeName);
                },
                child: Text("mqtt")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  pushNewScreen(context, screen: PlatformChannelDemo());
                  // Navigator.pushNamed(context, PlatformChannelDemo.routeName);
                },
                child: Text("native")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  pushNewScreen(context, screen: SqlDemo());
                  // Navigator.pushNamed(context, PlatformChannelDemo.routeName);
                },
                child: Text("sql")),
            FlatButton(
                color: Colors.amber,
                onPressed: () async {
                  pushNewScreen(context, screen: MediaPicker());
                },
                child: Text("picker")),
          ],
        ),
      ),
    );
  }
}
