import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/theme/size_config.dart';
import 'package:indochat_officialaccount/layouts/BodyLayout.dart';
import 'package:indochat_officialaccount/widgets/AppBar.dart';

import 'LeftButtonWidgets.dart';
import 'MessageBubble.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = 'Channel';
    return BodyLayout(BodyWidget(title, paddingTop));
  }
}

class BodyWidget extends StatefulWidget {
  final String title;
  final double paddingTop;
  static bool isSwitched = true;

  BodyWidget(this.title, this.paddingTop) : super();

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 242, 241, 1)),
        child: Column(
          children: [
            HeaderBar(
              widget.title,
              widget.paddingTop,
              radiusBarBgColor: Color.fromRGBO(255, 242, 241, 1),
              leftButtonWidgets: LeftButtonWidgets(),
            ),
            MessageBubble(),
          ],
        ),
      ),
    );
  }
}
