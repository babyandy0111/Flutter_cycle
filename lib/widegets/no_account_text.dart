import 'package:flutter/material.dart';
import 'package:flutter_cycle/pages/sign_up/sign_up.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../theme/size_config.dart';
import '../theme/constants.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => pushNewScreen(context, screen: SignUp()),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
