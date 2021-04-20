import 'package:flutter/material.dart';

import 'components/body.dart';

class SqlDemo extends StatelessWidget {
  static String routeName = "/sql_demo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'sql',
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
