import 'package:flutter/material.dart';
import '../../pages/push_demo/components/body.dart';

class PushDemo extends StatelessWidget {
  static String routeName = "/push_demo";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Andy Flutter 教室'),
      ),
      body: Body(),
    );
  }
}