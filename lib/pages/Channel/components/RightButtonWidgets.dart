import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/pages/CreateChannel/CreateChannelPage.dart';

class RightButtonWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return CreateChannelPage();
                }))
              }),
    );
  }
}
