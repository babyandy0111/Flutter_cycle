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
  bool isSwitched = true;
  bool _keyboardVisible = false;
  double safeH;

  @override
  Widget build(BuildContext context) {
    final double fullH = MediaQuery.of(context).size.height;
    final double keyboardH = WidgetsBinding.instance.window.viewInsets.bottom;

    _keyboardVisible = keyboardH != 0;

    SizeConfig().init(context);

    return LayoutBuilder(builder: (context, constraints) {
      if (!_keyboardVisible) {
        safeH = constraints.maxHeight;
      }

      final String title = 'History';
      final double paddingTop = fullH - safeH;

      return SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 242, 241, 1)),
          child: Column(
            children: [
              HeaderBar(
                title,
                paddingTop,
                radiusBarBgColor: Color.fromRGBO(255, 242, 241, 1),
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
