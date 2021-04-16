import 'package:flutter/material.dart';

import 'widgets/Body.dart';

class SettingsPage extends StatelessWidget {
  static String routeName = "/settings";
  final int channelId;

  SettingsPage(this.channelId) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: 拿 ID call API
    return Body(this.channelId);
  }
}
