import 'package:flutter/material.dart';
import '../../theme/size_config.dart';
import '../http_demo/components/body.dart';

class HttpDemo extends StatelessWidget {
  static String routeName = "/http_demo";
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
