
import 'package:flutter/material.dart';

import 'components/body.dart';

class BackendDriveUIDemo extends StatelessWidget {
  static String routeName = "/backend_drive_ui_demo";
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