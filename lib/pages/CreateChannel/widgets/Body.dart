import 'package:flutter/material.dart';

import 'package:indochat_officialaccount/layouts/BaseLayoyt.dart';
import 'package:indochat_officialaccount/pages/CreateChannel/widgets/CreateForm.dart';

class Body extends BaseLayoyt {
  Body() : super();

  @override
  BodyState getState() => BodyState();
}
class BodyState extends BaseLayoytState<Body> {

  @override
  initState() {
    super.initState();
    super.appBarTitle = 'Create Channel';
  }
  Widget CreatePageView() {
    return Container(
        child: CreateForm(),
    );
  }
}
