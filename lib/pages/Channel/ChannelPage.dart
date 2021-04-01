import 'package:flutter/material.dart';

import 'components/Body.dart';

class ChannelPage extends StatelessWidget {
  static String routeName = "/channel";
  static double safeH;
  static bool keyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    final double fullH = MediaQuery.of(context).size.height;
    final double keyboardH =
        WidgetsBinding.instance.window.viewInsets.bottom ?? 0;

    keyboardVisible = keyboardH != 0;
    return LayoutBuilder(builder: (context, constraints) {
      if (!keyboardVisible) {
        safeH = constraints.maxHeight;
      }

      final String title = 'Channel';
      final double paddingTop = fullH - safeH;

      return Scaffold(
          body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Body(title, paddingTop)));
    });
  }
}
