import 'package:flutter/material.dart';
import 'PendingMessage.dart';
import 'SentMessage.dart';

class MessageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) => Column(
          children: [
            PendingMessage(),
            SentMessage(),
          ],
        ),
      ),
    );
  }
}
