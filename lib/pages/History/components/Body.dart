import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/layouts/BaseLayoyt.dart';
import 'package:indochat_officialaccount/theme/size_config.dart';
import 'MessageBubble.dart';


///繼承BaseWidget
class Body extends BaseLayoyt {
  @override
  BodyState getState() => BodyState();
}

class BodyState extends BaseLayoytState<Body> {

  @override
  void initState() {
    super.initState();
    super.appBarTitle = "History";
  }

  @override
  Widget CreatePageView() {
    SizeConfig().init(context);

    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 242, 241, 1)),
        child: Column(
          children: [
            MessageBubble(),
          ],
        ),
      ),
    );
  }
}
