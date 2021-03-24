import 'package:flutter/material.dart';

import 'components/Body.dart';

class SettingsPage extends StatelessWidget {
  static String routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => {},
            ),
            Expanded(
              child: Center(
                child: Text('Settings'),
              ),
            ),
            TextButton(
                onPressed: () => {},
                child: Text('Save')
            ),
          ],
        ),
        titleSpacing: 0.0,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 144, 114, 1),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.0, 0.15),
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromRGBO(255, 90, 90, 1),
                  Color.fromRGBO(255, 144, 114, 1),
                ])
          ),
        ),
      ),
      body: Body(),
    );
  }
}
