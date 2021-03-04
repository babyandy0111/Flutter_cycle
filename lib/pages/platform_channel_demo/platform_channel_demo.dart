import 'package:flutter/material.dart';
import '../../pages/platform_channel_demo/components/body.dart';
import '../../theme/size_config.dart';

class PlatformChannelDemo extends StatelessWidget {
  static String routeName = "/platformchannel";
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