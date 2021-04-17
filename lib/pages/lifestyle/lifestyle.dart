import 'package:flutter/material.dart';

import 'components/body.dart';

class LifeStyle extends StatelessWidget {
  static String routeName = "/chat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'LifeStyle',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Body(),
    );
  }
}
