import 'package:flutter/material.dart';

import 'components/Body.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
