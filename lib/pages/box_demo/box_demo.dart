import 'package:flutter/material.dart';
import '../../pages/box_demo/components/body.dart';

class BoxDemo extends StatelessWidget {
  static String routeName = "/box_demo";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Andy Flutter 教室'),
      ),
      body: Body(Colors.blue),
    );
  }
}