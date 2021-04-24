import 'package:flutter/material.dart';

import 'components/body.dart';


class MediaPicker extends StatelessWidget {
  static String routeName = "/media_picker";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("media_picker"),
      ),
      body: Body(),
    );
  }
}