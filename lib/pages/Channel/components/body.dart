import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/pages/CreateChannel/CreateChannelPage.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlatButton(
      onPressed: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return CreateChannelPage();
        }))
      },
      child: Text('Create Channel'),
    ));
  }
}
