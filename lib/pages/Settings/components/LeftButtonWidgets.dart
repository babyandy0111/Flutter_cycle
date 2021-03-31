import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/pages/CreateChannel/CreateChannelPage.dart';

class LeftButtonWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      child: TextButton(
        child: Text('Cancel'),
        onPressed: () => Navigator.pop(context, true),
      ),
    );
  }
}
