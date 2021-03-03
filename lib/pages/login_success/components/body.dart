import 'package:flutter/material.dart';
import 'package:flutter_cycle/pages/default_demo/default_demo.dart';
import 'package:flutter_cycle/theme/size_config.dart';
import 'package:flutter_cycle/wideget/default_button.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              // Navigator.pushNamed(context, DefaultDemo.routeName);
              pushNewScreen(context, screen: DefaultDemo());
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
