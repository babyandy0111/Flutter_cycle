import 'package:flutter/material.dart';
import '../../../theme/size_config.dart';
import 'AppBar.dart';
import 'MessageBubble.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 242, 241, 1)),
        child: Column(
          children: [
            HeaderBar(),
            MessageBubble(),
          ],
        ),
      ),
    );
  }
}
