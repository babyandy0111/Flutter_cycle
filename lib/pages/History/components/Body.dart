import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/theme/size_config.dart';
import 'package:indochat_officialaccount/widgets/AppBar.dart';

import 'LeftButtonWidgets.dart';
import 'MessageBubble.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(builder: (context, constraints) {
      final double paddingTop =
          MediaQuery.of(context).size.height - constraints.maxHeight;
      return SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 242, 241, 1)),
          child: Column(
            children: [
              HeaderBar(
                paddingTop,
                radiusBarBgColor: Color.fromRGBO(255, 242, 241, 1),
                showLeftButtonWidgets: true,
                leftButtonWidgets: LeftButtonWidgets(),
              ),
              MessageBubble(),
            ],
          ),
        ),
      );
    });
  }
}
