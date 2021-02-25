import 'package:flutter/material.dart';

import 'components/body.dart';


class MqttDemo extends StatelessWidget {
  static String routeName = "/mqtt";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("mqtt"),
      ),
      body: Body(),
    );
  }
}