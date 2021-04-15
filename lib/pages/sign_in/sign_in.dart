import 'package:flutter/material.dart';
import 'package:flutter_cycle/pages/sign_in/components/body.dart';
import 'package:flutter_cycle/theme/size_config.dart';

class SignIn extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
