import 'package:flutter/material.dart';
import '../../pages/default_demo/components/body.dart';
import '../../theme/size_config.dart';

class DefaultDemo extends StatelessWidget {
  static String routeName = "/default_demo";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Andy Flutter 教室'),
      ),
      body: Body(),
    );
  }
}