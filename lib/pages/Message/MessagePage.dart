import 'package:flutter/material.dart';

import 'components/Body.dart';

class MessagePage extends StatelessWidget {
  static String routeName = "/message";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
