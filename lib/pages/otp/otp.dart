import 'package:flutter/material.dart';
import '../../theme/size_config.dart';
import '../otp/components/body.dart';

class OtpDemo extends StatelessWidget {
  static String routeName = "/otp";
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
