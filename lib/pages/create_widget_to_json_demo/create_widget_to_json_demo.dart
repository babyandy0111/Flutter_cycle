import 'package:flutter/material.dart';
import 'package:flutter_cycle/pages/create_widget_to_json_demo/components/body.dart';

class CreateWtoJson extends StatelessWidget {
  static String routeName = "/create_widge_to_json_demo_demo";
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