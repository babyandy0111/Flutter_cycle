import 'package:flutter/material.dart';
import 'package:flutter_cycle/pages/backend_drive_ui_demo/backend_driven_ui.dart';
import 'package:flutter_cycle/pages/box_demo/box_demo.dart';
import 'package:flutter_cycle/pages/create_widget_to_json_demo/create_widget_to_json_demo.dart';
import 'package:flutter_cycle/pages/http_demo/http_demo.dart';
import 'package:flutter_cycle/pages/push_demo/push_demo.dart';

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
        ],
      ),
    );
  }
}
