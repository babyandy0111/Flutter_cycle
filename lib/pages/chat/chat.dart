import 'package:flutter/material.dart';

import 'components/body.dart';

class Chat extends StatelessWidget {
  static String routeName = "/chat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Chat',
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
